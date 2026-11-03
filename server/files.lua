--[[
    Pigeon Enhanced Check: reading other resources' folders.

    FXServer's sandbox lets a resource read (but never write) other resources' folders. Newer artifacts
    list folders with io.readdir; older ones don't have it, so folders are listed with `dir` or `ls`
    instead, the only commands the sandbox allows. Nothing here ever writes outside this resource.
]]

EnhancedCheck = EnhancedCheck or {}

local Files = {}
EnhancedCheck.Files = Files

-- Folders that never hold anything FiveM loads, and can be huge.
local SKIP_FOLDERS = { ['.git'] = true, ['node_modules'] = true, ['.svn'] = true, ['.idea'] = true, ['.vscode'] = true }
local MAX_DEPTH = 16

-- Called every few hundred entries so a big server doesn't stall the server thread. Wait(0) in FiveM;
-- the tests leave it empty.
Files.yield = function() end

local windows
local function isWindows()
    if windows == nil then
        local os_name = (os.getenv('OS') or ''):lower()
        windows = os_name:find('windows', 1, true) ~= nil or package.config:sub(1, 1) == '\\'
    end
    return windows
end

--- Joins path parts with forward slashes, which both Windows and Linux accept.
function Files.join(a, b)
    if a == '' then return b end
    if a:sub(-1) == '/' then return a .. b end
    return a .. '/' .. b
end

--- Tidies a path from GetResourcePath: forward slashes, no doubled or trailing slash.
function Files.normalise(path)
    path = path:gsub('\\', '/'):gsub('//+', '/')
    if #path > 1 and path:sub(-1) == '/' then path = path:sub(1, -2) end
    return path
end

local function quote(path)
    if isWindows() then
        return '"' .. path:gsub('/', '\\') .. '"'
    end
    return "'" .. path:gsub("'", "'\\''") .. "'"
end

local function popenLines(command)
    local ok, handle = pcall(io.popen, command)
    if not ok or not handle then return nil end
    local lines = {}
    for line in handle:lines() do
        line = line:gsub('\r$', '')
        if line ~= '' then lines[#lines + 1] = line end
    end
    handle:close()
    return lines
end

--- Lists a folder. Returns two arrays, (folders, files), or nil if it can't be read.
function Files.list(path)
    if io.readdir then
        local ok, handle = pcall(io.readdir, path)
        if not ok or not handle then return nil end
        local names = {}
        for name in handle:lines() do
            if name ~= '.' and name ~= '..' and name ~= '' then names[#names + 1] = name end
        end
        pcall(handle.close, handle)

        -- io.readdir gives names only. A name that can be listed itself is a folder.
        local folders, files = {}, {}
        for _, name in ipairs(names) do
            local child = Files.join(path, name)
            local isFolder = false
            local okChild, childHandle = pcall(io.readdir, child)
            if okChild and childHandle then
                isFolder = true
                pcall(childHandle.close, childHandle)
            end
            if isFolder then folders[#folders + 1] = name else files[#files + 1] = name end
        end
        return folders, files
    end

    if not io.popen then return nil end
    -- A missing folder would otherwise look empty, so the command says so. Colons can't be in a
    -- Windows file name, and nobody names a file this on Linux.
    local MISSING = '::missing::'
    local folders, files
    if isWindows() then
        local windowsPath = path:gsub('/', '\\')
        local exists = ('if exist "%s\\*" '):format(windowsPath)
        folders = popenLines(exists .. ('(dir /b /a:d %s 2>nul) else echo %s'):format(quote(path), MISSING))
        files = popenLines(exists .. ('(dir /b /a:-d %s 2>nul) else echo %s'):format(quote(path), MISSING))
        if (folders and folders[1] == MISSING) or (files and files[1] == MISSING) then return nil end
    else
        folders = popenLines(('ls -1Ap %s 2>/dev/null || echo %s'):format(quote(path), MISSING))
        if folders and folders[1] == MISSING then return nil end
        if folders then
            files = {}
            local onlyFolders = {}
            for _, name in ipairs(folders) do
                if name:sub(-1) == '/' then onlyFolders[#onlyFolders + 1] = name:sub(1, -2) else files[#files + 1] = name end
            end
            folders = onlyFolders
        end
    end
    if not folders or not files then return nil end
    return folders, files
end

--- Walks a folder and returns every file's path relative to it, with forward slashes.
--- Skips .git, node_modules and similar folders. `limit` caps how many files are returned.
function Files.walk(root, limit)
    local found, truncated = {}, false
    local seen = 0

    local function visit(path, relative, depth)
        if depth > MAX_DEPTH or truncated then return end
        local folders, files = Files.list(path)
        if not folders then return end

        for _, name in ipairs(files) do
            found[#found + 1] = relative == '' and name or (relative .. '/' .. name)
            if limit and #found >= limit then truncated = true return end
        end

        seen = seen + #files + #folders
        if seen >= 250 then seen = 0 Files.yield() end

        for _, name in ipairs(folders) do
            if not SKIP_FOLDERS[name:lower()] then
                visit(Files.join(path, name), relative == '' and name or (relative .. '/' .. name), depth + 1)
            end
        end
    end

    visit(root, '', 0)
    return found, truncated
end

--- Reads a whole file, or returns nil. Files over `maxBytes` aren't read.
function Files.read(path, maxBytes)
    local handle = io.open(path, 'rb')
    if not handle then return nil end
    local size = handle:seek('end')
    if not size or (maxBytes and size > maxBytes) then handle:close() return nil, size end
    handle:seek('set', 0)
    local text = handle:read('a')
    handle:close()
    return text
end

---------------------------------------------------------------------------
-- Manifest globs: `*` matches within a folder, `**` across folders, `?` one character.
-- https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/#globbing

local globCache = {}
local DIRS = '\1'   -- stands in for "**/" until the pattern is used

local function globToPattern(glob)
    local cached = globCache[glob]
    if cached then return cached end

    local out, i = { '^' }, 1
    while i <= #glob do
        local c = glob:sub(i, i)
        if c == '*' and glob:sub(i + 1, i + 1) == '*' then
            if glob:sub(i + 2, i + 2) == '/' then
                out[#out + 1] = DIRS   -- "**/": no folders, or any number of them
                i = i + 3
            else
                out[#out + 1] = '.*'
                i = i + 2
            end
        elseif c == '*' then
            out[#out + 1] = '[^/]*'
            i = i + 1
        elseif c == '?' then
            out[#out + 1] = '[^/]'
            i = i + 1
        else
            out[#out + 1] = (c:gsub('[%^%$%(%)%%%.%[%]%+%-]', '%%%0'))
            i = i + 1
        end
    end
    out[#out + 1] = '$'
    cached = table.concat(out)
    globCache[glob] = cached
    return cached
end

--- True if a manifest entry such as 'client/*.lua' or 'html/**' matches a relative path.
function Files.matches(glob, path)
    glob = glob:gsub('\\', '/'):gsub('^%./', '')
    path = path:lower()
    glob = glob:lower()
    if not glob:find('[%*%?]') then return glob == path end

    local pattern = globToPattern(glob)
    if not pattern:find(DIRS, 1, true) then
        return path:match(pattern) ~= nil
    end
    -- Lua patterns have no optional groups, so try "**/" as nothing first, then as "<folders>/".
    if path:match((pattern:gsub(DIRS, ''))) then return true end
    return path:match((pattern:gsub(DIRS, '.*/'))) ~= nil
end

---------------------------------------------------------------------------
-- Comments are blanked before scripts are searched, so commented-out code isn't reported.
-- Line breaks are kept, so line numbers still match the file.

local function blank(text)
    return (text:gsub('[^\n]', ''))
end

function Files.stripLua(text)
    -- The whole match is captured so blank() gets the comment, not just its '=' signs.
    text = text:gsub('(%-%-%[(=*)%[.-%]%2%])', blank)
    text = text:gsub('%-%-[^\n]*', '')
    return text
end

function Files.stripJs(text)
    text = text:gsub('/%*.-%*/', blank)
    -- Only `//` at the start of a line or after a space, so "https://" in strings is kept.
    text = text:gsub('\n([ \t]*)//[^\n]*', '\n%1')
    text = text:gsub('^([ \t]*)//[^\n]*', '%1')
    text = text:gsub('([ \t;{}%)])//[^\n]*', '%1')
    return text
end

--- Returns the line number of every line in `text` matching `pattern` (a Lua pattern).
function Files.findLines(text, pattern)
    local lines, number = {}, 0
    for line in (text .. '\n'):gmatch('([^\n]*)\n') do
        number = number + 1
        if line:find(pattern) then lines[#lines + 1] = number end
    end
    return lines
end
