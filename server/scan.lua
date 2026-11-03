--[[
    Pigeon Enhanced Check: looking through the server.

    For each resource it reads the manifest (through GetResourceMetadata, so it sees exactly what
    FXServer loaded), lists the resource's folder, and reads its scripts and NUI files. It never runs,
    changes or writes to another resource. The checks themselves are in server/rules.lua.
]]

EnhancedCheck = EnhancedCheck or {}

local Files = EnhancedCheck.Files
local Rules = EnhancedCheck.Rules

local Scan = {}
EnhancedCheck.Scan = Scan

local RESOURCE = GetCurrentResourceName()
local UNSET = 'pigeon-enhanced-check:unset'   -- natives cut strings at a NUL, so no '\0' here

local SCRIPT_KEYS = { client_script = 'client', server_script = 'server', shared_script = 'shared' }
local CODE = { lua = 'lua', js = 'js' }
local NUI = { html = true, htm = true, js = true, mjs = true }

local MAX_FILES = 20000                    -- files listed in one resource
local MAX_SCRIPT_BYTES = 2 * 1024 * 1024   -- a bigger script is a bundle, and isn't searched
local MAX_NUI_BYTES = 4 * 1024 * 1024      -- per NUI file
local MAX_NUI_TOTAL = 16 * 1024 * 1024     -- NUI read per resource

local function metadata(resource, key)
    local values = {}
    local count = GetNumResourceMetadata(resource, key) or 0
    for i = 0, count - 1 do
        local value = GetResourceMetadata(resource, key, i)
        if type(value) == 'string' and value ~= '' then values[#values + 1] = value end
    end
    return values
end

local function extension(path)
    return (path:match('%.([%w]+)$') or ''):lower()
end

--- Everything Rules.resource needs to know about one resource, or nil if its folder can't be read.
function Scan.resource(name)
    local path = GetResourcePath(name)
    if type(path) ~= 'string' or path == '' then return nil end
    path = Files.normalise(path)

    local files, truncated = Files.walk(path, MAX_FILES)
    if #files == 0 then return nil end

    local info = {
        name = name, path = path, truncated = truncated,
        escrowed = false, csharp = {}, scripts = {}, nui = {}, unread = 0,
    }

    for _, relative in ipairs(files) do
        local lower = relative:lower()
        local top = lower:match('^([^/]+)/')
        if lower == '.fxap' then
            info.escrowed = true
        elseif top == 'stream' then
            info.stream = info.stream or { files = 0, convertible = 0 }
            info.stream.files = info.stream.files + 1
            if Rules.convertible[extension(lower)] then info.stream.convertible = info.stream.convertible + 1 end
        elseif top == 'stream_enhanced' then
            info.streamEnhanced = info.streamEnhanced or { files = 0 }
            info.streamEnhanced.files = info.streamEnhanced.files + 1
        end
        if lower:match('%.net%.dll$') then info.csharp[#info.csharp + 1] = relative end
    end

    -- Which side each script runs on, from the manifest's client, server and shared scripts.
    -- '@other/file.lua' entries belong to another resource, which is checked on its own.
    local sides = {}
    for key, side in pairs(SCRIPT_KEYS) do
        for _, entry in ipairs(metadata(name, key)) do
            if entry:sub(1, 1) ~= '@' then
                for _, relative in ipairs(files) do
                    if Files.matches(entry, relative) then
                        local current = sides[relative]
                        if current == nil then sides[relative] = side
                        elseif current ~= side then sides[relative] = 'shared' end
                    end
                end
            end
        end
    end

    for _, relative in ipairs(files) do
        local side = sides[relative]
        local language = side and CODE[extension(relative)]
        if language then
            local code = Files.read(Files.join(path, relative), MAX_SCRIPT_BYTES)
            if code then
                code = language == 'lua' and Files.stripLua(code) or Files.stripJs(code)
                info.scripts[#info.scripts + 1] = { path = relative, side = side, code = code }
            else
                info.unread = info.unread + 1
            end
        end
    end
    Files.yield()

    -- NUI: the ui_page and any HTML or JavaScript in files{}, searched for calls to other resources.
    local nuiEntries = metadata(name, 'ui_page')
    for _, entry in ipairs(metadata(name, 'file')) do nuiEntries[#nuiEntries + 1] = entry end
    local read = 0
    if #nuiEntries > 0 then
        for _, relative in ipairs(files) do
            if NUI[extension(relative)] and not sides[relative] then
                for _, entry in ipairs(nuiEntries) do
                    if entry:sub(1, 1) ~= '@' and Files.matches(entry, relative) then
                        if read < MAX_NUI_TOTAL then
                            local code = Files.read(Files.join(path, relative), MAX_NUI_BYTES)
                            if code then
                                read = read + #code
                                info.nui[#info.nui + 1] = { path = relative, code = code }
                            end
                        end
                        break
                    end
                end
            end
        end
    end
    info.strictMode = metadata(name, 'nui_callback_strict_mode')[1]

    return info
end

--- The server settings Rules.server checks. A convar that isn't set is left out.
function Scan.convars()
    local convars = {}
    for _, convar in ipairs(Rules.convars) do
        local value = GetConvar(convar, UNSET)
        if value ~= UNSET then convars[convar] = value end
    end
    return convars
end

--[[
    Checks the server and its resources. Must be called from a thread (it yields between resources).
    options:
        only = 'resource-name'   check just this resource, and not the server's settings
        includeStopped = bool    also check resources that aren't started
        ignore = { [name] = true }
    Returns a result table for server/report.lua.
]]
function Scan.run(options)
    options = options or {}
    local started = GetGameTimer()
    local known, names = {}, {}

    for i = 0, GetNumResources() - 1 do
        local name = GetResourceByFindIndex(i)
        if name then
            known[name] = true
            local state = GetResourceState(name)
            local wanted
            if options.only then
                wanted = name == options.only
            else
                wanted = name ~= RESOURCE and not (options.ignore or {})[name]
                    and (options.includeStopped or state == 'started' or state == 'starting')
            end
            if wanted then names[#names + 1] = name end
        end
    end
    table.sort(names)

    local result = { findings = {}, checked = 0, clean = 0, unreadable = {}, truncated = {}, only = options.only }

    if not options.only then
        for _, finding in ipairs(Rules.server(Scan.convars())) do result.findings[#result.findings + 1] = finding end
    end

    for _, name in ipairs(names) do
        local ok, info = pcall(Scan.resource, name)
        if ok and info then
            result.checked = result.checked + 1
            if info.truncated then result.truncated[#result.truncated + 1] = name end
            local findings = Rules.resource(info, known)
            if #findings == 0 then result.clean = result.clean + 1 end
            for _, finding in ipairs(findings) do result.findings[#result.findings + 1] = finding end
        else
            result.unreadable[#result.unreadable + 1] = name
            if not ok then print(('^3[Pigeon Enhanced Check]^7 %s couldn\'t be checked: %s'):format(name, tostring(info))) end
        end
        Files.yield()
    end

    Rules.sort(result.findings)
    result.seconds = (GetGameTimer() - started) / 1000
    return result
end
