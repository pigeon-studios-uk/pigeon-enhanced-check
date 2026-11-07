--[[
    Pigeon Enhanced Check: Norwegian (Norsk).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'no'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.no = {
    -- Levels, most serious first.
    level_blocker = 'Blokkerende',
    level_blocker_hint = 'virker ikke på Enhanced slik de er',
    level_change = 'Må endres',
    level_change_hint = 'endre dem før eller under flyttingen',
    level_review = 'Må sjekkes',
    level_review_hint = 'kan bli påvirket; ta en titt',
    level_note = 'Merknader',
    level_note_hint = 'greit å vite; ingenting må endres ennå',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Ressurser med escrow',
    fix_escrow = 'Asset escrow er ennå ikke implementert på FiveM for GTAV Enhanced, så disse kan ikke kjøre der slik de er. Spør hver skaper om en Enhanced-versjon, og behold dem på Legacy-serveren din til da. Escrow-filer er kryptert, så de andre sjekkene kan ikke se inn i dem.',
    item_escrow = '{resource}',

    title_builder = 'Ressursbyggere',
    fix_builder = 'Ressurser kan ikke lenger være byggere på Enhanced. Dette gjelder også yarn- og webpack-byggerne fra cfx-server-data: ressurser som er avhengige av dem, må leveres med ferdige node_modules eller byggeresultat. Spør skaperen, eller bygg dem selv før du laster dem opp.',
    item_builder = '{resource}: registrerer en byggeoppgave ({count})',

    title_onesync_off = 'OneSync er av',
    fix_onesync_off = 'Enhanced har ingen P2P-modus: OneSync er alltid på. Slå det på her først med set onesync on, og test ressursene dine med det, så problemer dukker opp på serveren du allerede kjenner.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy-modus',
    fix_onesync_legacy = 'OneSync legacy-modus (ikke big) finnes ikke lenger på Enhanced; big-modus er den eneste, så en spillers tilkobling og frakobling når bare klienter når spilleren er innen rekkevidde. Bytt til set onesync on her, og test ressurser som forventer at alle spillere finnes på alle klienter.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modeller og teksturer som må konverteres',
    fix_stream_convert = 'Disse strømmer Legacy-modeller eller -teksturer (YDR, YTD, YFT, YPT, YDD) fra stream/ og har ingen stream_enhanced/-mappe. Konverter dem med Alchemist fra Cfx.re og legg resultatene i stream_enhanced/, mens stream/ beholdes for Legacy. Enhanced laster stream_enhanced/ i stedet for stream/, så kopier også ressursens andre strømmede filer over. Alchemist kan ikke konvertere escrow-assets.',
    item_stream_convert = '{resource}: {count} av de {total} filene i stream/',

    title_csharp = 'C#-ressurser',
    fix_csharp = 'Mono er erstattet av .NET på Enhanced, og C#-ressurser bygges med .NET 10 SDK. Be skaperen om en Enhanced-versjon, eller bygg dine egne på nytt. Cfx.re har sagt at de vil dele mer om dette.',
    item_csharp = '{resource}: {count} .net.dll-fil(er)',

    title_mumble = 'Mumble-stemme',
    fix_mumble = 'Mumble er foreldet på Enhanced og vil bli fjernet. Nativene virker bare der med setr sv_mumble true, som lar enhver spiller bli med i enhver talekanal, og voice targets oppfører seg som om det bare finnes ett. Planlegg en overgang til en stemmeressurs som bruker det nye server-voice-API-et.',
    item_mumble = '{resource}: {count} Mumble-kall',

    title_voice_convars = 'Fjernede stemmeinnstillinger',
    fix_voice_convars = 'Disse Mumble-stemme-convarene finnes ikke lenger på Enhanced (voice_inBitrate virker fortsatt). Ta dem ut av server.cfg når du flytter, og sjekk at stemmeressursen din ikke er avhengig av dem.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI-kall til andre ressurser',
    fix_nui_cross = 'Streng modus for NUI-callbacks er på som standard på Enhanced: en ressurs sin NUI kan bare kalle ressursens egne NUI-callbacks, så disse kallene blir blokkert (HTTP 403). Den trygge løsningen er en export i den andre ressursen og en egen callback her. For å teste på Legacy nå, legg til nui_callback_strict_mode \'true\' i manifestet.',
    item_nui_cross = '{resource} kaller {targets}',

    title_server_kvp = 'Serverens nøkkel-verdi-lagring',
    fix_server_kvp = 'Serverens nøkkel-verdi-database (KVP) må migreres når du flytter, med kvdb-migrator fra Cfx.re (https://github.com/citizenfx/kvdb-migrator). Disse ressursene lagrer data i den. Ta en sikkerhetskopi først.',
    item_server_kvp = '{resource}: {count} KVP-kall',

    title_moo = 'Utviklermodus via moo',
    fix_moo = '+set moo 31337 slår ikke lenger på utviklermodus. Bruk set sv_devMode true i server.cfg i stedet, og bare på utviklingsservere.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Data lagret per spiller-ID',
    fix_player_ids = 'På Enhanced blir en spillers server-ID frigjort når de går, og kan gå til neste spiller som kobler til. Disse ressursene lagrer data etter spiller-ID og håndterer aldri playerDropped, så en ny spiller kan få den forrige sine data. Sjekk at hver av dem rydder opp når en spiller går. Dette er et mønstersøk, så noen kan være i orden.',
    item_player_ids = '{resource}: {count} sted(er)',

    title_game_build = 'Tvunget spillbuild',
    fix_game_build = 'Enhanced støtter bare den nyeste spillbuilden, som den laster når sv_enforceGameBuild ikke er satt (1 laster grunnspillet uten DLC-er). Fjern den når du flytter, og sjekk alt som trengte denne builden.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Bruker stream-mappen',
    fix_stream_deprecated = 'stream/ virker fortsatt på Enhanced når det ikke finnes stream_enhanced/, men den er foreldet. Ingen av disse filene er typer Alchemist konverterer. Test dem på Enhanced, og spør skaperen hvis noe ser feil ut.',
    item_stream_deprecated = '{resource}: {total} fil(er)',

    title_state_bags = 'State bag-handlere',
    fix_state_bags = 'På Enhanced kjører handlere for endringer i state bags bare hvis entiteten finnes, og replikerte verdier sendes bare når de settes eksplisitt. Sjekk at disse fortsatt oppfører seg som forventet.',
    item_state_bags = '{resource}: {count} handler(e)',

    title_no_effect_convars = 'Innstillinger uten virkning',
    fix_no_effect_convars = 'Disse gjør ingenting på Enhanced, eller er fjernet: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend og sv_netHttp2 kan fjernes. sv_protectServerEntities ble aldri implementert; bruk sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends er foreldet på Enhanced. Sett sync-tickraten med sv_syncTickRate (1 til 120, standard 60) i stedet.',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Sjekk også for hånd',
    manual = {
        'Serverfiler: nedlastingen er cfx-server_win_x64 eller cfx-server-linux_x64, og FXServer.exe heter nå cfx-server.exe. Oppdater oppstartsskript og snarveier.',
        'Windows-servere trenger Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp og endpoint_add_udp tar nå bare ett endpoint hver.',
        'Grafikkmods kan ikke brukes under early access: pure mode er alltid på.',
        'Fjernkommandoer sender bare utdata tilbake med PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) er av som standard, og bruker port 29200.',
        'Spillere trenger GTA V Enhanced, og serveren kjører bare den nyeste spillbuilden.',
    },
    docs = 'Alt som endres, fra Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Denne rapporten er en veiledning, ikke en garanti. Den finner kjente problemer ved å lese filer og innstillinger; den kan ikke kjøre ressursene dine på Enhanced. Test på en Enhanced-server før du flytter.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Laget {date} for {server}.',
    summary = 'Sjekket {resources} ressurser og serverens innstillinger på {seconds} s.',
    summary_one = 'Sjekket {resource} på {seconds} s.',
    counts = '{blocker} blokkerende · {change} må endres · {review} må sjekkes · {note} merknader · ingenting funnet i {clean} av {resources} ressurser',
    all_clear = 'Ingenting funnet. Gå likevel gjennom sjekkene den ikke kan gjøre; de står i rapportfilen.',
    more = '...og {count} til',
    unreadable = 'Kunne ikke leses: {resources}',
    truncated = 'Bare de første 20 000 filene ble sjekket i: {resources}',
    saved = 'Den fullstendige rapporten, med filer og linjenumre, ligger i {file}.',
    not_saved = 'Rapporten kunne ikke lagres i {file}.',
    hint_command = 'Skriv {command} i serverkonsollen for hele rapporten.',
    checking = 'Sjekker ressursene dine for FiveM for GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Ferdig. Rapporten står i serverkonsollen og i {file}.',
    reply_busy = 'En sjekk kjører allerede. Prøv igjen om litt.',
    reply_no_resource = 'Det finnes ingen ressurs som heter {name}.',
    reply_no_permission = 'Du har ikke tillatelse til å bruke /{command}.',
}
