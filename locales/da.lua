--[[
    Pigeon Enhanced Check: Danish (Dansk).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'da'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.da = {
    -- Levels, most serious first.
    level_blocker = 'Blokerende',
    level_blocker_hint = 'virker ikke på Enhanced, som de er',
    level_change = 'Skal ændres',
    level_change_hint = 'ændr dem før eller under skiftet',
    level_review = 'Skal gennemgås',
    level_review_hint = 'kan være påvirket; kig på dem',
    level_note = 'Noter',
    level_note_hint = 'godt at vide; intet skal ændres endnu',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Ressourcer i escrow',
    fix_escrow = 'Asset escrow er endnu ikke implementeret på FiveM til GTAV Enhanced, så disse kan ikke køre der, som de er. Spørg hver skaber om en Enhanced-version, og behold dem på din Legacy-server indtil da. Escrow-filer er krypterede, så de andre tjek kan ikke kigge i dem.',
    item_escrow = '{resource}',

    title_builder = 'Ressource-buildere',
    fix_builder = 'Ressourcer kan ikke længere være buildere på Enhanced. Det gælder også yarn- og webpack-builderne fra cfx-server-data: ressourcer, der afhænger af dem, skal leveres med færdige node_modules eller build-output. Spørg skaberen, eller byg dem selv, før du uploader.',
    item_builder = '{resource}: registrerer en build-opgave ({count})',

    title_onesync_off = 'OneSync er slået fra',
    fix_onesync_off = 'Enhanced har ingen P2P-tilstand: OneSync er altid slået til. Slå det til her først med set onesync on, og test dine ressourcer med det, så problemer viser sig på den server, du allerede kender.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy-tilstand',
    fix_onesync_legacy = 'OneSync legacy-tilstand (ikke big) findes ikke længere på Enhanced; big-tilstand er den eneste, så en spillers tilslutning og frakobling når kun klienter, når spilleren er inden for rækkevidde. Skift til set onesync on her, og test ressourcer, der forventer, at alle spillere findes på alle klienter.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modeller og teksturer, der skal konverteres',
    fix_stream_convert = 'Disse streamer Legacy-modeller eller -teksturer (YDR, YTD, YFT, YPT, YDD) fra stream/ og har ingen stream_enhanced/-mappe. Konvertér dem med Cfx.re\'s Alchemist, og læg resultaterne i stream_enhanced/, mens du beholder stream/ til Legacy. Enhanced indlæser stream_enhanced/ i stedet for stream/, så kopiér også ressourcens andre streamede filer over. Alchemist kan ikke konvertere assets i escrow.',
    item_stream_convert = '{resource}: {count} af de {total} filer i stream/',

    title_csharp = 'C#-ressourcer',
    fix_csharp = 'Mono er erstattet af .NET på Enhanced, og C#-ressourcer bygges med .NET 10 SDK. Bed skaberen om en Enhanced-version, eller genbyg dine egne. Cfx.re har sagt, at de vil fortælle mere om dette.',
    item_csharp = '{resource}: {count} .net.dll-fil(er)',

    title_mumble = 'Mumble-stemme',
    fix_mumble = 'Mumble er forældet på Enhanced og bliver fjernet. Dets natives virker kun der med setr sv_mumble true, som lader enhver spiller deltage i enhver stemmekanal, og voice targets opfører sig, som om der kun er ét. Planlæg et skift til en stemmeressource, der bruger den nye server-voice-API.',
    item_mumble = '{resource}: {count} Mumble-kald',

    title_voice_convars = 'Fjernede stemmeindstillinger',
    fix_voice_convars = 'Disse Mumble-stemme-convars findes ikke længere på Enhanced (voice_inBitrate virker stadig). Fjern dem fra server.cfg, når du skifter, og tjek, at din stemmeressource ikke afhænger af dem.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI-kald til andre ressourcer',
    fix_nui_cross = 'Streng tilstand for NUI-callbacks er slået til som standard på Enhanced: en ressources NUI må kun kalde ressourcens egne NUI-callbacks, så disse kald bliver blokeret (HTTP 403). Den sikre løsning er en export i den anden ressource og et eget callback her. For at teste på Legacy nu skal du tilføje nui_callback_strict_mode \'true\' til manifestet.',
    item_nui_cross = '{resource} kalder {targets}',

    title_server_kvp = 'Serverens nøgle-værdi-lager',
    fix_server_kvp = 'Serverens nøgle-værdi-database (KVP) skal migreres, når du skifter, med Cfx.re\'s kvdb-migrator (https://github.com/citizenfx/kvdb-migrator). Disse ressourcer gemmer data i den. Tag en backup først.',
    item_server_kvp = '{resource}: {count} KVP-kald',

    title_moo = 'Udviklertilstand via moo',
    fix_moo = '+set moo 31337 slår ikke længere udviklertilstand til. Brug set sv_devMode true i server.cfg i stedet, og kun på udviklingsservere.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Data gemt pr. spiller-ID',
    fix_player_ids = 'På Enhanced bliver en spillers server-ID frigivet, når de går, og kan gå til den næste spiller, der tilslutter sig. Disse ressourcer gemmer data efter spiller-ID og håndterer aldrig playerDropped, så en ny spiller kan få den forriges data. Tjek, at hver af dem rydder op, når en spiller går. Det er en mønstersøgning, så nogle kan være i orden.',
    item_player_ids = '{resource}: {count} sted(er)',

    title_game_build = 'Tvunget spil-build',
    fix_game_build = 'Enhanced understøtter kun det nyeste spil-build, som den indlæser, når sv_enforceGameBuild ikke er sat (1 indlæser grundspillet uden DLC\'er). Fjern det, når du skifter, og tjek alt, der havde brug for dette build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Bruger stream-mappen',
    fix_stream_deprecated = 'stream/ virker stadig på Enhanced, når der ikke er nogen stream_enhanced/, men den er forældet. Ingen af disse filer er typer, Alchemist konverterer. Test dem på Enhanced, og spørg skaberen, hvis noget ser forkert ud.',
    item_stream_deprecated = '{resource}: {total} fil(er)',

    title_state_bags = 'State bag-handlers',
    fix_state_bags = 'På Enhanced kører state bag-ændringshandlers kun, hvis entiteten findes, og replikerede værdier sendes kun, når de sættes eksplicit. Tjek, at disse stadig opfører sig som forventet.',
    item_state_bags = '{resource}: {count} handler(e)',

    title_no_effect_convars = 'Indstillinger uden effekt',
    fix_no_effect_convars = 'Disse gør intet på Enhanced eller er fjernet: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend og sv_netHttp2 kan fjernes. sv_protectServerEntities blev aldrig implementeret; brug sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends er forældet på Enhanced. Sæt sync-tickraten med sv_syncTickRate (1 til 120, standard 60) i stedet.',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Tjek også i hånden',
    manual = {
        'Serverfiler: downloadet er cfx-server_win_x64 eller cfx-server-linux_x64, og FXServer.exe hedder nu cfx-server.exe. Opdater startscripts og genveje.',
        'Windows-servere skal have Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp og endpoint_add_udp tager nu hver kun ét endpoint.',
        'Grafikmods kan ikke bruges under early access: pure mode er altid slået til.',
        'Fjernkommandoer sender kun output tilbage med PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) er slået fra som standard og bruger port 29200.',
        'Spillere skal have GTA V Enhanced, og serveren kører kun det nyeste spil-build.',
    },
    docs = 'Alt, hvad der ændrer sig, fra Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Denne rapport er en vejledning, ikke en garanti. Den finder kendte problemer ved at læse filer og indstillinger; den kan ikke køre dine ressourcer på Enhanced. Test på en Enhanced-server, før du skifter.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Lavet {date} til {server}.',
    summary = 'Tjekkede {resources} ressourcer og serverens indstillinger på {seconds} s.',
    summary_one = 'Tjekkede {resource} på {seconds} s.',
    counts = '{blocker} blokerende · {change} skal ændres · {review} skal gennemgås · {note} noter · intet fundet i {clean} af {resources} ressourcer',
    all_clear = 'Intet fundet. Gå stadig de tjek igennem, den ikke kan lave; de står i rapportfilen.',
    more = '...og {count} mere',
    unreadable = 'Kunne ikke læses: {resources}',
    truncated = 'Kun de første 20.000 filer blev tjekket i: {resources}',
    saved = 'Den fulde rapport med filer og linjenumre ligger i {file}.',
    not_saved = 'Rapporten kunne ikke gemmes i {file}.',
    hint_command = 'Skriv {command} i serverkonsollen for den fulde rapport.',
    checking = 'Tjekker dine ressourcer til FiveM til GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Færdig. Rapporten står i serverkonsollen og i {file}.',
    reply_busy = 'Et tjek kører allerede. Prøv igen om lidt.',
    reply_no_resource = 'Der er ingen ressource ved navn {name}.',
    reply_no_permission = 'Du har ikke tilladelse til at bruge /{command}.',
}
