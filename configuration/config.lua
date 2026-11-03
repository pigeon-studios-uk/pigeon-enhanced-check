Config = {}

-- Language file from locales/ to use, such as 'en'.
Config.Locale = 'en'

---------------------------------------------------------------------------
-- When it checks

-- Check the server once when it starts, and print a two-line summary in the console. The full report
-- is saved to the report file, and printed by the command below.
Config.CheckOnStart = true

-- How long, in seconds, to wait after the server starts before checking, so every resource has started.
Config.StartDelaySeconds = 20

---------------------------------------------------------------------------
-- What it checks

-- Also check resources that are in your resources folder but aren't started. Off, only what the server
-- actually runs is checked.
Config.IncludeStopped = false

-- Resources never to check, by folder name. Use {} for none.
Config.Ignore = {
    -- 'my-test-resource',
}

---------------------------------------------------------------------------
-- The report

-- Save the full report, with the files and line numbers each finding came from, to this file in this
-- resource's folder. '' doesn't save it. The sandbox only lets a resource write inside its own folder.
Config.ReportFile = 'enhanced-report.txt'

---------------------------------------------------------------------------
-- Command

-- enhancedcheck              check every resource and the server's settings, and print the full report
-- enhancedcheck <resource>   check one resource, with files and line numbers
-- The server console can always use it. Staff in game need this ACE permission, granted in server.cfg:
--     add_ace group.admin pigeon-enhanced-check.use allow
-- In game, the report still goes to the server console and the report file, not to chat.
Config.Command = 'enhancedcheck'
Config.Permission = 'pigeon-enhanced-check.use'

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
