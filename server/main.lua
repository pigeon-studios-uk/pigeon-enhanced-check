--[[
    Pigeon Enhanced Check: server.

    Checks the server once when it starts (Config.CheckOnStart) and whenever staff use the command,
    prints the report in the console and saves the full one to Config.ReportFile. Everything happens on
    the server, once; nothing runs while players play.
]]

local RESOURCE = GetCurrentResourceName()
local VERSION = GetResourceMetadata(RESOURCE, 'version', 0) or '?'
local PREFIX = '^6[Pigeon Enhanced Check]^7 '

local Files, Scan, Report = EnhancedCheck.Files, EnhancedCheck.Scan, EnhancedCheck.Report
-- 'auto' follows ox_lib's language (the ox:locale convar), and English when that isn't set.
local locale = Config.Locale == 'auto' and GetConvar('ox:locale', 'en') or Config.Locale
Report.strings = Locales[locale] or Locales.en
local t = Report.t

-- Let the server breathe between resources while a big server is checked.
Files.yield = function() Wait(0) end

local running = false

local function say(colour, text)
    print(PREFIX .. (colour or '') .. text .. '^7')
end

local function serverName()
    local name = GetConvar('sv_projectName', '')
    if name == '' then name = GetConvar('sv_hostname', 'FiveM server') end
    return (name:gsub('%^%d', ''))
end

local function today()
    local ok, date = pcall(os.date, '%Y-%m-%d %H:%M')
    return ok and date or '?'
end

local function ignored()
    local set = {}
    for _, name in ipairs(Config.Ignore or {}) do set[name] = true end
    return set
end

--- Saves the report file. Returns the path shown to people, or nil and that path if it failed.
local function save(result)
    if not Config.ReportFile or Config.ReportFile == '' then return nil end
    local shown = ('%s/%s'):format(RESOURCE, Config.ReportFile)
    local text = Report.file(result, VERSION, today(), serverName())
    if SaveResourceFile(RESOURCE, Config.ReportFile, text, -1) then return shown end
    return nil, shown
end

--- Checks the server (or one resource), prints the report and saves it. Runs in a thread.
local function check(options, full, replyTo)
    if running then return false end
    running = true

    local ok, err = pcall(function()
        if full then say(nil, t('checking')) end
        local result = Scan.run({ only = options.only, includeStopped = Config.IncludeStopped, ignore = ignored() })

        for _, line in ipairs(Report.console(result, VERSION, full)) do
            say(line[1], line[2])
        end

        local saved, failed = save(result)
        if saved then
            say(nil, t('saved', { file = saved }))
        elseif failed then
            say('^3', t('not_saved', { file = failed }))
        end
        if not full and #result.findings > 0 then say(nil, t('hint_command', { command = Config.Command })) end

        if replyTo and replyTo > 0 then
            TriggerClientEvent('chat:addMessage', replyTo, {
                args = { 'Enhanced Check', t('reply_console', { file = saved or 'the console' }) },
            })
        end
    end)

    running = false
    if not ok then say('^1', tostring(err)) end
    return true
end

---------------------------------------------------------------------------
-- Command

local function reply(source, text)
    if source == 0 then
        say(nil, text)
    else
        TriggerClientEvent('chat:addMessage', source, { args = { 'Enhanced Check', text } })
    end
end

RegisterCommand(Config.Command, function(source, args)
    if source ~= 0 and not IsPlayerAceAllowed(source, Config.Permission) then
        reply(source, t('reply_no_permission', { command = Config.Command }))
        return
    end
    if running then
        reply(source, t('reply_busy'))
        return
    end

    local only = args[1]
    if only and GetResourceState(only) == 'missing' then
        reply(source, t('reply_no_resource', { name = only }))
        return
    end

    CreateThread(function()
        check({ only = only }, true, source)
    end)
end, false)

---------------------------------------------------------------------------
-- Start

if Config.CheckOnStart then
    CreateThread(function()
        Wait(math.max(0, tonumber(Config.StartDelaySeconds) or 20) * 1000)
        check({}, false)
    end)
end
