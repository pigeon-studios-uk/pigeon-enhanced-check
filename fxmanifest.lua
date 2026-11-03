fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-enhanced-check'
author 'Pigeon Studios'
description 'Scans your server\'s resources and settings and lists what to change before moving to FiveM for GTAV Enhanced.'
version '1.0.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-enhanced-check'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-enhanced-check'

-- Server only: it reads other resources' folders and the server's settings. Nothing is sent to players.

server_scripts {
    'configuration/config.lua',
    'locales/*.lua',
    'server/files.lua',
    'server/rules.lua',
    'server/scan.lua',
    'server/report.lua',
    'server/main.lua',
    'server/version_check.lua',
}
