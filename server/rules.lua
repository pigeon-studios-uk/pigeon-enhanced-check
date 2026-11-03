--[[
    Pigeon Enhanced Check: the checks.

    Every check comes from Cfx.re's own documentation of what changes in FiveM for GTAV Enhanced:
        https://docs.fivem.net/docs/developers/legacy-vs-enhanced/
        https://docs.fivem.net/docs/alchemist/
        https://docs.fivem.net/docs/scripting-manual/voice/#fivem-for-gtav-enhanced
        https://docs.fivem.net/docs/scripting-manual/nui-development/nui-callbacks/#nui-callback-strict-mode

    Nothing in this file calls a FiveM native, so the checks can be tested outside the game. They take
    what server/scan.lua found and return findings:
        { rule = 'escrow', resource = 'some-resource', values = { ... }, where = { 'client/main.lua:12' } }
    The text for each rule is in locales/, under rule_<rule> (what was found) and fix_<rule> (what to do).
]]

EnhancedCheck = EnhancedCheck or {}

local Rules = {}
EnhancedCheck.Rules = Rules

-- How serious each rule is, most serious first.
--   blocker: won't work on Enhanced as it is
--   change:  needs changing before, or as, the server moves
--   review:  may be affected; needs a person to look
--   note:    worth knowing, nothing has to change yet
Rules.levels = { 'blocker', 'change', 'review', 'note' }

Rules.level = {
    escrow = 'blocker',
    builder = 'blocker',

    onesync_off = 'change',
    onesync_legacy = 'change',
    stream_convert = 'change',
    csharp = 'change',
    mumble = 'change',
    voice_convars = 'change',
    nui_cross = 'change',
    server_kvp = 'change',
    moo = 'change',

    player_ids = 'review',
    game_build = 'review',

    stream_deprecated = 'note',
    state_bags = 'note',
    no_effect_convars = 'note',
    accurate_sends = 'note',
}

-- The order rules are listed in within a level.
Rules.order = {
    'escrow', 'builder',
    'onesync_off', 'onesync_legacy', 'stream_convert', 'csharp', 'mumble', 'voice_convars', 'nui_cross', 'server_kvp', 'moo',
    'player_ids', 'game_build',
    'stream_deprecated', 'state_bags', 'no_effect_convars', 'accurate_sends',
}

-- Model and texture files Alchemist converts from Legacy (Gen8) to Enhanced (Gen9).
Rules.convertible = { ydr = true, ytd = true, yft = true, ypt = true, ydd = true }

-- How many matching lines are listed for one rule in one resource.
local MAX_WHERE = 5

local SERVER = { server = true, shared = true }
local CLIENT = { client = true, shared = true }
local ANY = { server = true, client = true, shared = true }

local function add(findings, rule, resource, values, where)
    findings[#findings + 1] = { rule = rule, resource = resource, values = values or {}, where = where or {} }
end

--- Finds one or more Lua patterns in the scripts that run on `sides`. Returns "file:line" strings
--- (at most MAX_WHERE) and the total number of matching lines.
local function search(scripts, patterns, sides)
    if type(patterns) == 'string' then patterns = { patterns } end
    local where, total = {}, 0
    for _, script in ipairs(scripts) do
        if sides[script.side] and script.code then
            local hit = {}
            for _, pattern in ipairs(patterns) do
                for _, line in ipairs(EnhancedCheck.Files.findLines(script.code, pattern)) do hit[line] = true end
            end
            local lines = {}
            for line in pairs(hit) do lines[#lines + 1] = line end
            table.sort(lines)
            for _, line in ipairs(lines) do
                total = total + 1
                if #where < MAX_WHERE then where[#where + 1] = ('%s:%d'):format(script.path, line) end
            end
        end
    end
    return where, total
end

-- A native called by name: the name on its own, then an opening bracket.
local function call(native)
    return '%f[%w_]' .. native .. '%s*%('
end

-- Server key-value storage: SetResourceKvp, GetResourceKvpString, DeleteResourceKvp, StartFindKvp and the rest.
local KVP = {
    call('SetResourceKvp%w*'), call('GetResourceKvp%w*'), call('DeleteResourceKvp%w*'), call('StartFindKvp'),
}

-- Tables kept per player ID: data[source] = ..., players[src] = ..., and so on.
local PER_PLAYER = {}
for _, key in ipairs({ 'source', '_source', 'src', 'playerId', 'playerID', 'player' }) do
    PER_PLAYER[#PER_PLAYER + 1] = '%[%s*' .. key .. '%s*%]%s*=[^=]'
end

---------------------------------------------------------------------------
-- One resource

--[[
    `resource` is what server/scan.lua found:
        name, escrowed (bool), csharp (array of .net.dll paths),
        stream = { files = n, convertible = n } or nil, streamEnhanced = { files = n } or nil,
        scripts = { { path, side = 'client'|'server'|'shared', code } },
        nui = { { path, code } }, strictMode = the manifest's nui_callback_strict_mode, or nil
    `known` is a set of every resource name on the server, for NUI calls into other resources.
]]
function Rules.resource(resource, known)
    local findings = {}
    local name = resource.name
    local scripts = resource.scripts or {}
    local where, total

    -- Asset escrow isn't implemented on Enhanced yet. Escrowed code can't be read, so it isn't searched.
    if resource.escrowed then
        add(findings, 'escrow', name)
    end

    -- Resources can no longer be builders.
    where, total = search(scripts, call('RegisterResourceBuildTaskFactory'), SERVER)
    if total > 0 then add(findings, 'builder', name, { count = total }, where) end

    -- Mono was replaced by .NET.
    local csharp = resource.csharp or {}
    if #csharp > 0 then
        local listed = {}
        for i = 1, math.min(#csharp, MAX_WHERE) do listed[i] = csharp[i] end
        add(findings, 'csharp', name, { count = #csharp }, listed)
    end

    -- Assets in stream/ load on Enhanced only while there's no stream_enhanced/, and models and
    -- textures made for Legacy need converting with Alchemist.
    if resource.stream and resource.stream.files > 0 and not resource.streamEnhanced then
        if resource.stream.convertible > 0 then
            add(findings, 'stream_convert', name, { count = resource.stream.convertible, total = resource.stream.files })
        else
            add(findings, 'stream_deprecated', name, { total = resource.stream.files })
        end
    end

    -- Mumble natives are deprecated, and only work with sv_mumble on.
    where, total = search(scripts, call('Mumble%u%w*'), CLIENT)
    if total > 0 then add(findings, 'mumble', name, { count = total }, where) end

    -- Server key-value storage must be migrated with kvdb-migrator.
    where, total = search(scripts, KVP, SERVER)
    if total > 0 then add(findings, 'server_kvp', name, { count = total }, where) end

    -- NUI callback strict mode is on by default, so one resource's NUI can't call another's callbacks.
    local strict = resource.strictMode == nil or tostring(resource.strictMode):lower() ~= 'false'
    if strict then
        local targets, targetList, nuiWhere = {}, {}, {}
        for _, file in ipairs(resource.nui or {}) do
            local number = 0
            for line in (file.code .. '\n'):gmatch('([^\n]*)\n') do
                number = number + 1
                local counted = false
                for host in line:gmatch('https?://([%w_%-]+)/') do
                    if host ~= name and known[host] then
                        if not targets[host] then
                            targets[host] = true
                            targetList[#targetList + 1] = host
                        end
                        if not counted and #nuiWhere < MAX_WHERE then
                            nuiWhere[#nuiWhere + 1] = ('%s:%d'):format(file.path, number)
                            counted = true
                        end
                    end
                end
            end
        end
        if #targetList > 0 then
            table.sort(targetList)
            add(findings, 'nui_cross', name, { targets = table.concat(targetList, ', ') }, nuiWhere)
        end
    end

    -- Player IDs are reused on Enhanced. Data kept per player ID and never cleared on playerDropped
    -- would be handed to the next player who gets that ID.
    where, total = search(scripts, PER_PLAYER, SERVER)
    if total > 0 then
        local _, dropped = search(scripts, 'playerDropped', ANY)
        if dropped == 0 then add(findings, 'player_ids', name, { count = total }, where) end
    end

    -- State bag callbacks only fire if the entity exists.
    where, total = search(scripts, call('AddStateBagChangeHandler'), ANY)
    if total > 0 then add(findings, 'state_bags', name, { count = total }, where) end

    return findings
end

---------------------------------------------------------------------------
-- Server settings

-- The convars server/scan.lua reads for Rules.server. A convar that isn't set is left out (nil).
Rules.convars = {
    'onesync', 'moo', 'sv_enforceGameBuild', 'sv_useAccurateSends',
    'onesync_enableBeyond', 'sv_enhancedHostSupport', 'sv_protectServerEntities', 'onesync_automaticResend', 'sv_netHttp2',
    'voice_use2dAudio', 'voice_use3dAudio', 'voice_useSendingRangeOnly', 'voice_useNativeAudio',
}

local function on(value)
    if value == nil then return false end
    value = tostring(value):lower()
    return value == 'true' or value == '1' or value == 'on' or value == 'yes'
end

function Rules.server(convars)
    local findings = {}

    -- OneSync big mode is the only mode on Enhanced: no P2P (off), no non-big mode (legacy).
    local onesync = tostring(convars.onesync or 'off'):lower()
    if onesync == 'off' or onesync == 'false' or onesync == '0' then
        add(findings, 'onesync_off', nil)
    elseif onesync == 'legacy' then
        add(findings, 'onesync_legacy', nil)
    end

    -- `+set moo 31337` no longer turns on developer mode.
    if convars.moo == '31337' then add(findings, 'moo', nil) end

    -- Only the latest game build (or 1, the base game) is supported.
    local build = convars.sv_enforceGameBuild
    if build and build ~= '' and build ~= '1' then add(findings, 'game_build', nil, { value = build }) end

    -- Settings that do nothing on Enhanced, or were removed.
    local noEffect = {}
    for _, convar in ipairs({ 'onesync_enableBeyond', 'sv_enhancedHostSupport', 'sv_protectServerEntities', 'onesync_automaticResend', 'sv_netHttp2' }) do
        if on(convars[convar]) then noEffect[#noEffect + 1] = convar end
    end
    if #noEffect > 0 then add(findings, 'no_effect_convars', nil, { convars = table.concat(noEffect, ', ') }) end

    -- sv_useAccurateSends is deprecated in favour of sv_syncTickRate. It's on by default, so it's only
    -- reported when someone has turned it off.
    if convars.sv_useAccurateSends ~= nil and not on(convars.sv_useAccurateSends) then
        add(findings, 'accurate_sends', nil, { value = convars.sv_useAccurateSends })
    end

    -- Mumble's client voice settings were removed (voice_inBitrate still works).
    local voice = {}
    for _, convar in ipairs({ 'voice_use2dAudio', 'voice_use3dAudio', 'voice_useSendingRangeOnly', 'voice_useNativeAudio' }) do
        if on(convars[convar]) then voice[#voice + 1] = convar end
    end
    if #voice > 0 then add(findings, 'voice_convars', nil, { convars = table.concat(voice, ', ') }) end

    return findings
end

--- Sorts findings by level, then rule, then resource name.
function Rules.sort(findings)
    local levelRank, ruleRank = {}, {}
    for i, level in ipairs(Rules.levels) do levelRank[level] = i end
    for i, rule in ipairs(Rules.order) do ruleRank[rule] = i end
    table.sort(findings, function(a, b)
        local la, lb = levelRank[Rules.level[a.rule]], levelRank[Rules.level[b.rule]]
        if la ~= lb then return la < lb end
        local ra, rb = ruleRank[a.rule], ruleRank[b.rule]
        if ra ~= rb then return ra < rb end
        return (a.resource or '') < (b.resource or '')
    end)
    return findings
end
