--[[
    Pigeon Enhanced Check: the report.

    Turns a result from Scan.run into lines of text: a short summary, the console report (one heading
    per check with its resources and what to do), and the fuller report file, which also lists the files
    and line numbers each finding came from.
]]

EnhancedCheck = EnhancedCheck or {}

local Rules = EnhancedCheck.Rules

local Report = {}
EnhancedCheck.Report = Report

-- FiveM console colours: ^1 red, ^3 yellow, ^5 cyan, ^6 purple, ^7 default, ^9 grey.
local COLOUR = { blocker = '^1', change = '^3', review = '^5', note = '^9' }
local MAX_LISTED = 25   -- resources named under one check in the console

Report.strings = Locales.en

function Report.t(key, values)
    local text = Report.strings[key] or Locales.en[key] or key
    if type(text) ~= 'string' then return text end
    return (text:gsub('{(%w+)}', function(name)
        local value = values and values[name]
        return value ~= nil and tostring(value) or '{' .. name .. '}'
    end))
end
local t = Report.t

--- Wraps text to a width, indenting every line.
local function wrap(text, width, indent)
    local lines, line = {}, ''
    for word in text:gmatch('%S+') do
        if line ~= '' and #line + 1 + #word > width then
            lines[#lines + 1] = indent .. line
            line = word
        else
            line = line == '' and word or (line .. ' ' .. word)
        end
    end
    if line ~= '' then lines[#lines + 1] = indent .. line end
    return lines
end

--- The findings grouped by level, then by rule, keeping their sorted order.
local function group(findings)
    local levels = {}
    for _, level in ipairs(Rules.levels) do levels[level] = { rules = {}, order = {}, count = 0 } end
    for _, finding in ipairs(findings) do
        local level = levels[Rules.level[finding.rule]]
        local items = level.rules[finding.rule]
        if not items then
            items = {}
            level.rules[finding.rule] = items
            level.order[#level.order + 1] = finding.rule
        end
        items[#items + 1] = finding
        level.count = level.count + 1
    end
    return levels
end

local function item(finding)
    local values = { resource = finding.resource }
    for key, value in pairs(finding.values) do values[key] = value end
    return t('item_' .. finding.rule, values)
end

--- The two summary lines, shown at the top of every report and on their own after a start-up check.
function Report.summary(result, version)
    local levels = group(result.findings)
    local lines = {}
    if result.only then
        lines[#lines + 1] = t('summary_one', { resource = result.only, seconds = ('%.1f'):format(result.seconds) })
    else
        lines[#lines + 1] = t('summary', { resources = result.checked, seconds = ('%.1f'):format(result.seconds) })
    end
    if #result.findings == 0 then
        lines[#lines + 1] = t('all_clear')
    else
        lines[#lines + 1] = t('counts', {
            blocker = levels.blocker.count, change = levels.change.count, review = levels.review.count,
            note = levels.note.count, clean = result.clean, resources = result.checked,
        })
    end
    return lines, levels
end

--[[
    The console report, as an array of { colour, text } lines. With `full`, every check is listed with
    what to do; without, just the summary.
]]
function Report.console(result, version, full)
    local summary, levels = Report.summary(result, version)
    local out = {}
    for _, line in ipairs(summary) do out[#out + 1] = { nil, line } end
    if not full then return out end

    for _, level in ipairs(Rules.levels) do
        local entry = levels[level]
        if entry.count > 0 then
            out[#out + 1] = { nil, '' }
            out[#out + 1] = { COLOUR[level], ('%s: %s'):format(t('level_' .. level):upper(), t('level_' .. level .. '_hint')) }
            for _, rule in ipairs(entry.order) do
                local items = entry.rules[rule]
                local names = {}
                for i, finding in ipairs(items) do
                    if i > MAX_LISTED then
                        names[#names + 1] = t('more', { count = #items - MAX_LISTED })
                        break
                    end
                    names[#names + 1] = item(finding)
                end
                out[#out + 1] = { COLOUR[level], ('  %s (%d)'):format(t('title_' .. rule), #items) }
                for _, name in ipairs(names) do out[#out + 1] = { nil, '    - ' .. name } end
                for _, line in ipairs(wrap(t('fix_' .. rule), 96, '    ')) do out[#out + 1] = { '^9', line } end
            end
        end
    end

    out[#out + 1] = { nil, '' }
    if #result.unreadable > 0 then out[#out + 1] = { '^3', t('unreadable', { resources = table.concat(result.unreadable, ', ') }) } end
    if #result.truncated > 0 then out[#out + 1] = { '^3', t('truncated', { resources = table.concat(result.truncated, ', ') }) } end
    out[#out + 1] = { nil, t('docs') }
    return out
end

--- The report file, as plain text.
function Report.file(result, version, date, server)
    local summary, levels = Report.summary(result, version)
    local out = {}
    local function add(line) out[#out + 1] = line or '' end

    add(t('header', { version = version }))
    add(t('generated', { date = date, server = server }))
    add()
    for _, line in ipairs(summary) do add(line) end

    for _, level in ipairs(Rules.levels) do
        local entry = levels[level]
        if entry.count > 0 then
            add()
            add(('%s: %s'):format(t('level_' .. level):upper(), t('level_' .. level .. '_hint')))
            add(('='):rep(72))
            for _, rule in ipairs(entry.order) do
                local items = entry.rules[rule]
                add()
                add(('%s (%d)'):format(t('title_' .. rule), #items))
                for _, line in ipairs(wrap(t('fix_' .. rule), 100, '  ')) do add(line) end
                add()
                for _, finding in ipairs(items) do
                    add('  - ' .. item(finding))
                    for _, where in ipairs(finding.where) do add('      ' .. where) end
                end
            end
        end
    end

    add()
    if #result.unreadable > 0 then add(t('unreadable', { resources = table.concat(result.unreadable, ', ') })) end
    if #result.truncated > 0 then add(t('truncated', { resources = table.concat(result.truncated, ', ') })) end

    add()
    add(t('manual_title'))
    add(('='):rep(72))
    for _, line in ipairs(t('manual')) do
        local wrapped = wrap(line, 100, '    ')
        wrapped[1] = '  - ' .. wrapped[1]:sub(5)
        for _, part in ipairs(wrapped) do add(part) end
    end
    add()
    for _, line in ipairs(wrap(t('disclaimer'), 100, '')) do add(line) end
    add(t('docs'))
    return table.concat(out, '\n') .. '\n'
end
