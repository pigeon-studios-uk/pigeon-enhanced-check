--[[
    Pigeon Enhanced Check: Swedish (Svenska).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'sv'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.sv = {
    -- Levels, most serious first.
    level_blocker = 'Blockerande',
    level_blocker_hint = 'fungerar inte på Enhanced som de är',
    level_change = 'Att ändra',
    level_change_hint = 'ändra dem före eller under flytten',
    level_review = 'Att granska',
    level_review_hint = 'kan påverkas; ta en titt',
    level_note = 'Noteringar',
    level_note_hint = 'bra att veta; inget behöver ändras ännu',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Resurser med escrow',
    fix_escrow = 'Asset escrow finns ännu inte i FiveM för GTAV Enhanced, så de här kan inte köras där som de är. Fråga varje skapare om en Enhanced-version och behåll dem på din Legacy-server tills dess. Escrow-filer är krypterade, så de andra kontrollerna kan inte titta i dem.',
    item_escrow = '{resource}',

    title_builder = 'Resursbyggare',
    fix_builder = 'Resurser kan inte längre vara byggare på Enhanced. Det gäller även yarn- och webpack-byggarna från cfx-server-data: resurser som är beroende av dem måste levereras med färdiga node_modules eller byggresultat. Fråga skaparen, eller bygg dem själv innan du laddar upp.',
    item_builder = '{resource}: registrerar en byggaruppgift ({count})',

    title_onesync_off = 'OneSync är avstängt',
    fix_onesync_off = 'Enhanced har inget P2P-läge: OneSync är alltid på. Slå på det här först med set onesync on och testa dina resurser med det, så att problem dyker upp på servern du redan känner.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy-läge',
    fix_onesync_legacy = 'OneSync legacy-läge (inte big) finns inte längre på Enhanced; big-läget är det enda, så en spelares anslutning och frånkoppling når bara klienter när spelaren är inom räckhåll. Byt till set onesync on här och testa resurser som förväntar sig att varje spelare finns på varje klient.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modeller och texturer att konvertera',
    fix_stream_convert = 'De här streamar Legacy-modeller eller -texturer (YDR, YTD, YFT, YPT, YDD) från stream/ och har ingen stream_enhanced/-mapp. Konvertera dem med Alchemist från Cfx.re och lägg resultatet i stream_enhanced/, och behåll stream/ för Legacy. Enhanced laddar stream_enhanced/ i stället för stream/, så kopiera även resursens andra streamade filer. Alchemist kan inte konvertera assets med escrow.',
    item_stream_convert = '{resource}: {count} av de {total} filerna i stream/',

    title_csharp = 'C#-resurser',
    fix_csharp = 'Mono har ersatts av .NET på Enhanced, och C#-resurser byggs med .NET 10 SDK. Be skaparen om en Enhanced-version, eller bygg om dina egna. Cfx.re har sagt att de kommer att berätta mer om detta.',
    item_csharp = '{resource}: {count} .net.dll-fil(er)',

    title_mumble = 'Mumble-röst',
    fix_mumble = 'Mumble är föråldrat på Enhanced och kommer att tas bort. Dess natives fungerar bara där med setr sv_mumble true, vilket låter vilken spelare som helst gå med i vilken röstkanal som helst, och voice targets beter sig som om det bara finns ett. Planera en övergång till en röstresurs som använder det nya röst-API:et på servern.',
    item_mumble = '{resource}: {count} Mumble-anrop',

    title_voice_convars = 'Borttagna röstinställningar',
    fix_voice_convars = 'De här Mumble-röst-convarsen finns inte längre på Enhanced (voice_inBitrate fungerar fortfarande). Ta bort dem från server.cfg när du flyttar och kontrollera att din röstresurs inte är beroende av dem.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI-anrop till andra resurser',
    fix_nui_cross = 'Strikt läge för NUI-callbacks är på som standard på Enhanced: en resurs NUI får bara anropa resursens egna NUI-callbacks, så de här anropen blockeras (HTTP 403). Den säkra lösningen är en export i den andra resursen och en egen callback här. För att testa på Legacy redan nu, lägg till nui_callback_strict_mode \'true\' i manifestet.',
    item_nui_cross = '{resource} anropar {targets}',

    title_server_kvp = 'Serverns nyckel-värde-lagring',
    fix_server_kvp = 'Serverns nyckel-värde-databas (KVP) måste migreras när du flyttar, med kvdb-migrator från Cfx.re (https://github.com/citizenfx/kvdb-migrator). De här resurserna sparar data i den. Gör en säkerhetskopia först.',
    item_server_kvp = '{resource}: {count} KVP-anrop',

    title_moo = 'Utvecklarläge via moo',
    fix_moo = '+set moo 31337 slår inte längre på utvecklarläget. Använd set sv_devMode true i server.cfg i stället, och bara på utvecklingsservrar.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Data sparad per spelar-ID',
    fix_player_ids = 'På Enhanced frigörs en spelares server-ID när hen lämnar och kan gå till nästa spelare som ansluter. De här resurserna sparar data per spelar-ID och hanterar aldrig playerDropped, så en ny spelare kan få den förras data. Kontrollera att var och en rensar den när en spelare lämnar. Det här är en mönstersökning, så en del kan vara i ordning.',
    item_player_ids = '{resource}: {count} ställe/n',

    title_game_build = 'Tvingat spelbygge',
    fix_game_build = 'Enhanced stöder bara det senaste spelbygget, som det laddar när sv_enforceGameBuild inte är satt (1 laddar grundspelet utan DLC:er). Ta bort det när du flyttar och kontrollera allt som behövde det här bygget.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Använder stream-mappen',
    fix_stream_deprecated = 'stream/ fungerar fortfarande på Enhanced när det inte finns någon stream_enhanced/, men den är föråldrad. Ingen av de här filerna är av en typ som Alchemist konverterar. Testa dem på Enhanced och fråga skaparen om något ser fel ut.',
    item_stream_deprecated = '{resource}: {total} fil(er)',

    title_state_bags = 'State bag-hanterare',
    fix_state_bags = 'På Enhanced körs hanterare för ändringar i state bags bara om entiteten finns, och replikerade värden skickas bara när de sätts uttryckligen. Kontrollera att de här fortfarande beter sig som väntat.',
    item_state_bags = '{resource}: {count} hanterare',

    title_no_effect_convars = 'Inställningar utan effekt',
    fix_no_effect_convars = 'De här gör ingenting på Enhanced, eller har tagits bort: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend och sv_netHttp2 kan tas bort. sv_protectServerEntities implementerades aldrig; använd sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends är föråldrat på Enhanced. Ställ in synkens tick rate med sv_syncTickRate (1 till 120, standard 60) i stället.',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Kontrollera också för hand',
    manual = {
        'Serverfiler: nedladdningen är cfx-server_win_x64 eller cfx-server-linux_x64, och FXServer.exe heter nu cfx-server.exe. Uppdatera startskript och genvägar.',
        'Windows-servrar behöver Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp och endpoint_add_udp tar nu bara en endpoint var.',
        'Grafikmoddar kan inte användas under early access: pure mode är alltid på.',
        'Fjärrkommandon skickar bara tillbaka utdata med PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) är avstängd som standard och använder port 29200.',
        'Spelare behöver GTA V Enhanced, och servern kör bara det senaste spelbygget.',
    },
    docs = 'Allt som ändras, från Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Den här rapporten är en vägledning, inte en garanti. Den hittar kända problem genom att läsa filer och inställningar; den kan inte köra dina resurser på Enhanced. Testa på en Enhanced-server innan du flyttar.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Skapad {date} för {server}.',
    summary = 'Kontrollerade {resources} resurser och serverns inställningar på {seconds} s.',
    summary_one = 'Kontrollerade {resource} på {seconds} s.',
    counts = '{blocker} blockerande · {change} att ändra · {review} att granska · {note} noteringar · inget hittat i {clean} av {resources} resurser',
    all_clear = 'Inget hittades. Gå ändå igenom kontrollerna som den inte kan göra; de står i rapportfilen.',
    more = '...och {count} till',
    unreadable = 'Kunde inte läsas: {resources}',
    truncated = 'Bara de första 20 000 filerna kontrollerades i: {resources}',
    saved = 'Hela rapporten, med filer och radnummer, finns i {file}.',
    not_saved = 'Rapporten kunde inte sparas i {file}.',
    hint_command = 'Skriv {command} i serverkonsolen för hela rapporten.',
    checking = 'Kontrollerar dina resurser för FiveM för GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Klart. Rapporten finns i serverkonsolen och i {file}.',
    reply_busy = 'En kontroll körs redan. Försök igen om en stund.',
    reply_no_resource = 'Det finns ingen resurs som heter {name}.',
    reply_no_permission = 'Du har inte behörighet att använda /{command}.',
}
