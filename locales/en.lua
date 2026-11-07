--[[
    Pigeon Enhanced Check: English.

    To translate, copy this file to a new one named with the language's code (such as de.lua or pt-br.lua),
    change `Locales.en` to match (Locales.de), translate the text in quotes, and set Config.Locale.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.en = {
    -- Levels, most serious first.
    level_blocker = 'Blockers',
    level_blocker_hint = 'won\'t work on Enhanced as they are',
    level_change = 'To change',
    level_change_hint = 'change these before, or as, you move',
    level_review = 'To review',
    level_review_hint = 'may be affected; have a look',
    level_note = 'Notes',
    level_note_hint = 'worth knowing; nothing has to change yet',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Escrowed resources',
    fix_escrow = 'Asset escrow isn\'t implemented on FiveM for GTAV Enhanced yet, so these can\'t run there as they are. Ask each creator about an Enhanced build, and keep them on your Legacy server until then. Escrowed files are encrypted, so the other checks can\'t look inside them.',
    item_escrow = '{resource}',

    title_builder = 'Resource builders',
    fix_builder = 'Resources can no longer be builders on Enhanced. This includes the yarn and webpack builders from cfx-server-data: resources that rely on them need their node_modules or build output shipped ready-made. Ask the creator, or build them yourself before uploading.',
    item_builder = '{resource}: registers a build task ({count})',

    title_onesync_off = 'OneSync is off',
    fix_onesync_off = 'Enhanced has no P2P mode: OneSync is always on. Turn it on here first with set onesync on, and test your resources with it, so problems show up on the server you already know.',
    item_onesync_off = 'onesync is off',

    title_onesync_legacy = 'OneSync legacy mode',
    fix_onesync_legacy = 'OneSync legacy (non-big) mode no longer exists on Enhanced; big mode is the only one, so a player\'s connect and disconnect only reach clients when that player is in range. Switch to set onesync on here and test resources that expect every player to exist on every client.',
    item_onesync_legacy = 'onesync is legacy',

    title_stream_convert = 'Models and textures to convert',
    fix_stream_convert = 'These stream Legacy models or textures (YDR, YTD, YFT, YPT, YDD) from stream/ and have no stream_enhanced/ folder. Convert them with Cfx.re\'s Alchemist and put the results in stream_enhanced/, keeping stream/ for Legacy. Enhanced loads stream_enhanced/ instead of stream/, so copy the resource\'s other streamed files across too. Alchemist can\'t convert escrowed assets.',
    item_stream_convert = '{resource}: {count} of the {total} files in stream/',

    title_csharp = 'C# resources',
    fix_csharp = 'Mono was replaced by .NET on Enhanced, and C# resources are built with the .NET 10 SDK. Ask the creator for an Enhanced build, or rebuild your own. Cfx.re has said it will share more about this.',
    item_csharp = '{resource}: {count} .net.dll file(s)',

    title_mumble = 'Mumble voice',
    fix_mumble = 'Mumble is deprecated on Enhanced and will be removed. Its natives only work there with setr sv_mumble true, which lets any player join any voice channel, and voice targets act as if there\'s only one. Plan a move to a voice resource that uses the new server voice API.',
    item_mumble = '{resource}: {count} Mumble call(s)',

    title_voice_convars = 'Removed voice settings',
    fix_voice_convars = 'These Mumble voice convars no longer exist on Enhanced (voice_inBitrate still works). Take them out of server.cfg when you move, and check your voice resource doesn\'t depend on them.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI calls to other resources',
    fix_nui_cross = 'NUI callback strict mode is on by default on Enhanced: a resource\'s NUI may only call that resource\'s own NUI callbacks, so these calls will be blocked (HTTP 403). The safe fix is an export in the other resource and a callback of its own here. To test on Legacy now, add nui_callback_strict_mode \'true\' to the manifest.',
    item_nui_cross = '{resource} calls {targets}',

    title_server_kvp = 'Server key-value storage',
    fix_server_kvp = 'The server\'s key-value (KVP) database must be migrated when you move, with Cfx.re\'s kvdb-migrator (https://github.com/citizenfx/kvdb-migrator). These resources keep data in it. Back it up first.',
    item_server_kvp = '{resource}: {count} KVP call(s)',

    title_moo = 'Developer mode through moo',
    fix_moo = '+set moo 31337 no longer turns on developer mode. Use set sv_devMode true in server.cfg instead, and only on development servers.',
    item_moo = 'moo is 31337',

    title_player_ids = 'Data kept per player ID',
    fix_player_ids = 'On Enhanced, a player\'s server ID is freed when they leave and can go to the next player who joins. These resources store data by player ID and never handle playerDropped, so a new player could get the last one\'s data. Check each one clears it when a player leaves. This is a pattern search, so some may be fine.',
    item_player_ids = '{resource}: {count} place(s)',

    title_game_build = 'Enforced game build',
    fix_game_build = 'Enhanced only supports the latest game build, which it loads when sv_enforceGameBuild isn\'t set (1 loads the base game without DLCs). Remove it when you move, and check anything that needed this build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Uses the stream folder',
    fix_stream_deprecated = 'stream/ still works on Enhanced when there\'s no stream_enhanced/, but it\'s deprecated. None of these files are types Alchemist converts. Test them on Enhanced, and ask the creator if anything looks wrong.',
    item_stream_deprecated = '{resource}: {total} file(s)',

    title_state_bags = 'State bag handlers',
    fix_state_bags = 'On Enhanced, state bag change handlers only fire if the entity exists, and replicated values are only sent when they\'re set explicitly. Check these still behave as expected.',
    item_state_bags = '{resource}: {count} handler(s)',

    title_no_effect_convars = 'Settings that do nothing',
    fix_no_effect_convars = 'These do nothing on Enhanced, or were removed: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend and sv_netHttp2 can go. sv_protectServerEntities was never implemented; use sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends is deprecated on Enhanced. Set the sync tick rate with sv_syncTickRate (1 to 120, default 60) instead.',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Also check by hand',
    manual = {
        'Server files: the download is cfx-server_win_x64 or cfx-server-linux_x64, and FXServer.exe is now cfx-server.exe. Update start scripts and shortcuts.',
        'Windows servers need the Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp and endpoint_add_udp each take a single endpoint now.',
        'Graphic mods can\'t be used during early access: pure mode is always on.',
        'Remote commands only send output back with PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) is off by default, and uses port 29200.',
        'Players need GTA V Enhanced, and the server runs only the latest game build.',
    },
    docs = 'Everything that changes, from Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'This report is a guide, not a guarantee. It finds known problems by reading files and settings; it can\'t run your resources on Enhanced. Test on an Enhanced server before you move.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Made {date} for {server}.',
    summary = 'Checked {resources} resources and the server\'s settings in {seconds}s.',
    summary_one = 'Checked {resource} in {seconds}s.',
    counts = '{blocker} blockers · {change} to change · {review} to review · {note} notes · nothing found in {clean} of {resources} resources',
    all_clear = 'Nothing found. Still go through the checks it can\'t do, listed in the report file.',
    more = '...and {count} more',
    unreadable = 'Couldn\'t be read: {resources}',
    truncated = 'Only the first 20,000 files were checked in: {resources}',
    saved = 'The full report, with files and line numbers, is in {file}.',
    not_saved = 'The report couldn\'t be saved to {file}.',
    hint_command = 'Type {command} in the server console for the full report.',
    checking = 'Checking your resources for FiveM for GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Done. The report is in the server console and in {file}.',
    reply_busy = 'A check is already running. Try again in a moment.',
    reply_no_resource = 'There\'s no resource called {name}.',
    reply_no_permission = 'You don\'t have permission to use /{command}.',
}
