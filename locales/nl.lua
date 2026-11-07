--[[
    Pigeon Enhanced Check: Dutch (Nederlands).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'nl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.nl = {
    -- Levels, most serious first.
    level_blocker = 'Blokkades',
    level_blocker_hint = 'werken zo niet op Enhanced',
    level_change = 'Aanpassen',
    level_change_hint = 'pas deze aan voor of tijdens de overstap',
    level_review = 'Nakijken',
    level_review_hint = 'kunnen geraakt worden; kijk ze na',
    level_note = 'Opmerkingen',
    level_note_hint = 'goed om te weten; er hoeft nog niets te veranderen',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Resources met escrow',
    fix_escrow = 'Asset escrow is op FiveM voor GTAV Enhanced nog niet beschikbaar, dus deze kunnen daar zo niet draaien. Vraag elke maker om een Enhanced-versie en houd ze tot die tijd op je Legacy-server. Escrow-bestanden zijn versleuteld, dus de andere controles kunnen er niet in kijken.',
    item_escrow = '{resource}',

    title_builder = 'Resource-builders',
    fix_builder = 'Resources kunnen op Enhanced geen builders meer zijn. Dat geldt ook voor de yarn- en webpack-builders uit cfx-server-data: resources die daarop leunen, moeten hun node_modules of build-uitvoer kant-en-klaar meeleveren. Vraag het de maker, of bouw ze zelf voordat je ze uploadt.',
    item_builder = '{resource}: registreert een buildtaak ({count})',

    title_onesync_off = 'OneSync staat uit',
    fix_onesync_off = 'Enhanced heeft geen P2P-modus: OneSync staat altijd aan. Zet het hier eerst aan met set onesync on en test je resources ermee, zodat problemen opduiken op de server die je al kent.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync-legacymodus',
    fix_onesync_legacy = 'De OneSync-legacymodus (niet big) bestaat niet meer op Enhanced; big is de enige modus, dus het verbinden en vertrekken van een speler bereikt clients alleen als die speler binnen bereik is. Schakel hier over op set onesync on en test resources die verwachten dat elke speler op elke client bestaat.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modellen en textures om te zetten',
    fix_stream_convert = 'Deze streamen Legacy-modellen of -textures (YDR, YTD, YFT, YPT, YDD) uit stream/ en hebben geen map stream_enhanced/. Zet ze om met Alchemist van Cfx.re en zet het resultaat in stream_enhanced/; houd stream/ voor Legacy. Enhanced laadt stream_enhanced/ in plaats van stream/, dus kopieer ook de andere gestreamde bestanden van de resource. Alchemist kan geen escrow-assets omzetten.',
    item_stream_convert = '{resource}: {count} van de {total} bestanden in stream/',

    title_csharp = 'C#-resources',
    fix_csharp = 'Mono is op Enhanced vervangen door .NET, en C#-resources worden gebouwd met de .NET 10 SDK. Vraag de maker om een Enhanced-versie, of bouw je eigen resources opnieuw. Cfx.re heeft gezegd hier meer over te delen.',
    item_csharp = '{resource}: {count} .net.dll-bestand(en)',

    title_mumble = 'Mumble-voice',
    fix_mumble = 'Mumble is verouderd op Enhanced en wordt verwijderd. De natives werken daar alleen met setr sv_mumble true, waarmee elke speler elk spraakkanaal kan betreden, en voice targets doen alsof er maar één is. Plan een overstap naar een voice-resource die de nieuwe server-voice-API gebruikt.',
    item_mumble = '{resource}: {count} Mumble-aanroep(en)',

    title_voice_convars = 'Verwijderde voice-instellingen',
    fix_voice_convars = 'Deze Mumble-voice-convars bestaan niet meer op Enhanced (voice_inBitrate werkt nog). Haal ze bij de overstap uit server.cfg en controleer dat je voice-resource er niet van afhangt.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI-aanroepen naar andere resources',
    fix_nui_cross = 'De strikte modus voor NUI-callbacks staat op Enhanced standaard aan: de NUI van een resource mag alleen de eigen NUI-callbacks van die resource aanroepen, dus deze aanroepen worden geblokkeerd (HTTP 403). De veilige oplossing is een export in de andere resource en een eigen callback hier. Om het nu al op Legacy te testen, voeg je nui_callback_strict_mode \'true\' toe aan het manifest.',
    item_nui_cross = '{resource} roept {targets} aan',

    title_server_kvp = 'Key-valueopslag van de server',
    fix_server_kvp = 'De key-valuedatabase (KVP) van de server moet bij de overstap worden gemigreerd met kvdb-migrator van Cfx.re (https://github.com/citizenfx/kvdb-migrator). Deze resources bewaren er gegevens in. Maak eerst een back-up.',
    item_server_kvp = '{resource}: {count} KVP-aanroep(en)',

    title_moo = 'Ontwikkelaarsmodus via moo',
    fix_moo = '+set moo 31337 zet de ontwikkelaarsmodus niet meer aan. Gebruik in plaats daarvan set sv_devMode true in server.cfg, en alleen op ontwikkelservers.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Gegevens per speler-ID',
    fix_player_ids = 'Op Enhanced komt de server-ID van een speler vrij als die vertrekt, en kan die naar de volgende speler gaan die joint. Deze resources bewaren gegevens per speler-ID en handelen playerDropped nooit af, dus een nieuwe speler kan de gegevens van de vorige krijgen. Controleer dat elke resource ze wist als een speler vertrekt. Dit is een zoektocht op patronen, dus sommige zijn misschien in orde.',
    item_player_ids = '{resource}: {count} plek(ken)',

    title_game_build = 'Afgedwongen gamebuild',
    fix_game_build = 'Enhanced ondersteunt alleen de nieuwste gamebuild, die het laadt als sv_enforceGameBuild niet is ingesteld (1 laadt het basisspel zonder DLC\'s). Verwijder het bij de overstap en controleer alles wat deze build nodig had.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Gebruikt de stream-map',
    fix_stream_deprecated = 'stream/ werkt op Enhanced nog als er geen stream_enhanced/ is, maar is verouderd. Geen van deze bestanden is een type dat Alchemist omzet. Test ze op Enhanced en vraag het de maker als iets er verkeerd uitziet.',
    item_stream_deprecated = '{resource}: {total} bestand(en)',

    title_state_bags = 'State bag-handlers',
    fix_state_bags = 'Op Enhanced worden handlers voor state bag-wijzigingen alleen uitgevoerd als de entity bestaat, en gerepliceerde waarden worden alleen verstuurd als ze expliciet worden ingesteld. Controleer of deze zich nog gedragen zoals verwacht.',
    item_state_bags = '{resource}: {count} handler(s)',

    title_no_effect_convars = 'Instellingen zonder effect',
    fix_no_effect_convars = 'Deze doen niets op Enhanced of zijn verwijderd: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend en sv_netHttp2 kunnen weg. sv_protectServerEntities is nooit gebouwd; gebruik sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends is verouderd op Enhanced. Stel de sync-tickrate in plaats daarvan in met sv_syncTickRate (1 tot 120, standaard 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Controleer ook met de hand',
    manual = {
        'Serverbestanden: de download is cfx-server_win_x64 of cfx-server-linux_x64, en FXServer.exe heet nu cfx-server.exe. Werk startscripts en snelkoppelingen bij.',
        'Windows-servers hebben Microsoft Visual C++ 2017 Redistributable nodig.',
        'endpoint_add_tcp en endpoint_add_udp nemen nu elk maar één endpoint.',
        'Grafische mods kunnen tijdens early access niet worden gebruikt: pure mode staat altijd aan.',
        'Externe commando\'s sturen alleen uitvoer terug met PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) staat standaard uit en gebruikt poort 29200.',
        'Spelers hebben GTA V Enhanced nodig, en de server draait alleen de nieuwste gamebuild.',
    },
    docs = 'Alles wat verandert, van Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Dit rapport is een leidraad, geen garantie. Het vindt bekende problemen door bestanden en instellingen te lezen; het kan je resources niet op Enhanced draaien. Test op een Enhanced-server voordat je overstapt.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Gemaakt op {date} voor {server}.',
    summary = '{resources} resources en de serverinstellingen gecontroleerd in {seconds} s.',
    summary_one = '{resource} gecontroleerd in {seconds} s.',
    counts = '{blocker} blokkades · {change} aanpassen · {review} nakijken · {note} opmerkingen · niets gevonden in {clean} van {resources} resources',
    all_clear = 'Niets gevonden. Loop toch de controles door die het niet zelf kan doen; die staan in het rapportbestand.',
    more = '...en nog {count}',
    unreadable = 'Kon niet worden gelezen: {resources}',
    truncated = 'Alleen de eerste 20.000 bestanden zijn gecontroleerd in: {resources}',
    saved = 'Het volledige rapport, met bestanden en regelnummers, staat in {file}.',
    not_saved = 'Het rapport kon niet worden opgeslagen in {file}.',
    hint_command = 'Typ {command} in de serverconsole voor het volledige rapport.',
    checking = 'Je resources worden gecontroleerd voor FiveM voor GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Klaar. Het rapport staat in de serverconsole en in {file}.',
    reply_busy = 'Er loopt al een controle. Probeer het zo opnieuw.',
    reply_no_resource = 'Er is geen resource met de naam {name}.',
    reply_no_permission = 'Je hebt geen toestemming om /{command} te gebruiken.',
}
