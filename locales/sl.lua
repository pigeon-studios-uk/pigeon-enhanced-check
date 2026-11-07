--[[
    Pigeon Enhanced Check: Slovenian (Slovenščina).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'sl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.sl = {
    -- Levels, most serious first.
    level_blocker = 'Ovire',
    level_blocker_hint = 'na Enhancedu v tej obliki ne bodo delovali',
    level_change = 'Za spremembo',
    level_change_hint = 'spremeni jih pred selitvijo ali med njo',
    level_review = 'Za pregled',
    level_review_hint = 'lahko so prizadeti; poglej jih',
    level_note = 'Opombe',
    level_note_hint = 'dobro je vedeti; zaenkrat ni treba nič spreminjati',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Viri z escrowom',
    fix_escrow = 'Asset escrow na FiveM za GTAV Enhanced še ni implementiran, zato ti viri tam v tej obliki ne morejo delovati. Vsakega avtorja vprašaj za različico za Enhanced in jih do takrat obdrži na svojem Legacy strežniku. Datoteke z escrowom so šifrirane, zato ostala preverjanja ne morejo pogledati vanje.',
    item_escrow = '{resource}',

    title_builder = 'Builderji virov',
    fix_builder = 'Viri na Enhancedu ne morejo več biti builderji. To velja tudi za builderja yarn in webpack iz cfx-server-data: viri, ki so odvisni od njiju, morajo priti s pripravljenimi node_modules ali rezultatom builda. Vprašaj avtorja ali jih zgradi sam, preden jih naložiš.',
    item_builder = '{resource}: registrira build opravilo ({count})',

    title_onesync_off = 'OneSync je izklopljen',
    fix_onesync_off = 'Enhanced nima načina P2P: OneSync je vedno vklopljen. Najprej ga tukaj vklopi s set onesync on in z njim preizkusi svoje vire, da se težave pokažejo na strežniku, ki ga že poznaš.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Način OneSync legacy',
    fix_onesync_legacy = 'Način OneSync legacy (ne big) na Enhancedu ne obstaja več; način big je edini, zato prijava in odjava igralca prideta do odjemalcev samo, ko je igralec v dosegu. Tukaj preklopi na set onesync on in preizkusi vire, ki pričakujejo, da vsak igralec obstaja na vsakem odjemalcu.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modeli in teksture za pretvorbo',
    fix_stream_convert = 'Ti streamajo Legacy modele ali teksture (YDR, YTD, YFT, YPT, YDD) iz stream/ in nimajo mape stream_enhanced/. Pretvori jih z orodjem Alchemist od Cfx.re in rezultate daj v stream_enhanced/, stream/ pa obdrži za Legacy. Enhanced namesto stream/ naloži stream_enhanced/, zato tja kopiraj tudi ostale streamane datoteke vira. Alchemist ne more pretvoriti assetov z escrowom.',
    item_stream_convert = '{resource}: {count} od {total} datotek v stream/',

    title_csharp = 'C# viri',
    fix_csharp = 'Mono je na Enhancedu zamenjal .NET, C# viri pa se gradijo z .NET 10 SDK. Avtorja prosi za različico za Enhanced ali na novo zgradi svoje. Cfx.re je povedal, da bo o tem delil več.',
    item_csharp = '{resource}: {count} datotek .net.dll',

    title_mumble = 'Glas prek Mumble',
    fix_mumble = 'Mumble je na Enhancedu zastarel in bo odstranjen. Njegovi natives tam delujejo samo s setr sv_mumble true, kar vsakemu igralcu dovoli vstop v kateri koli glasovni kanal, voice targets pa se obnašajo, kot da obstaja samo eden. Načrtuj prehod na glasovni vir, ki uporablja nov strežniški voice API.',
    item_mumble = '{resource}: {count} klicev Mumble',

    title_voice_convars = 'Odstranjene glasovne nastavitve',
    fix_voice_convars = 'Ti glasovni convari Mumble na Enhancedu ne obstajajo več (voice_inBitrate še vedno deluje). Ob selitvi jih odstrani iz server.cfg in preveri, da tvoj glasovni vir ni odvisen od njih.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Klici NUI v druge vire',
    fix_nui_cross = 'Strogi način NUI callbackov je na Enhancedu privzeto vklopljen: NUI vira sme klicati samo lastne NUI callbacke tega vira, zato bodo ti klici blokirani (HTTP 403). Varna rešitev je export v drugem viru in lasten callback tukaj. Za preizkus na Legacyju že zdaj dodaj v manifest nui_callback_strict_mode \'true\'.',
    item_nui_cross = '{resource} kliče {targets}',

    title_server_kvp = 'Strežniška shramba ključ-vrednost',
    fix_server_kvp = 'Strežniško bazo ključ-vrednost (KVP) je treba ob selitvi migrirati z orodjem kvdb-migrator od Cfx.re (https://github.com/citizenfx/kvdb-migrator). Ti viri hranijo podatke v njej. Najprej naredi varnostno kopijo.',
    item_server_kvp = '{resource}: {count} klicev KVP',

    title_moo = 'Razvijalski način prek moo',
    fix_moo = '+set moo 31337 ne vklopi več razvijalskega načina. Namesto tega uporabi set sv_devMode true v server.cfg, in to samo na razvojnih strežnikih.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Podatki, shranjeni po ID igralca',
    fix_player_ids = 'Na Enhancedu se server ID igralca sprosti, ko ta odide, in ga lahko dobi naslednji igralec, ki se prijavi. Ti viri shranjujejo podatke po ID igralca in nikoli ne obravnavajo playerDropped, zato bi lahko nov igralec dobil podatke prejšnjega. Preveri, da vsak podatke počisti, ko igralec odide. To je iskanje po vzorcih, zato so nekateri morda v redu.',
    item_player_ids = '{resource}: {count} mest',

    title_game_build = 'Vsiljen build igre',
    fix_game_build = 'Enhanced podpira samo najnovejši build igre, ki ga naloži, ko sv_enforceGameBuild ni nastavljen (1 naloži osnovno igro brez DLC-jev). Ob selitvi ga odstrani in preveri vse, kar je potrebovalo ta build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Uporablja mapo stream',
    fix_stream_deprecated = 'stream/ na Enhancedu še vedno deluje, ko ni stream_enhanced/, vendar je zastarela. Nobena od teh datotek ni vrste, ki jo Alchemist pretvori. Preizkusi jih na Enhancedu in vprašaj avtorja, če kaj ni videti prav.',
    item_stream_deprecated = '{resource}: {total} datotek',

    title_state_bags = 'Handlerji state bagov',
    fix_state_bags = 'Na Enhancedu se handlerji sprememb state bagov sprožijo samo, če entiteta obstaja, replicirane vrednosti pa se pošljejo samo, ko so izrecno nastavljene. Preveri, da se ti še vedno obnašajo po pričakovanjih.',
    item_state_bags = '{resource}: {count} handlerjev',

    title_no_effect_convars = 'Nastavitve brez učinka',
    fix_no_effect_convars = 'Te na Enhancedu ne naredijo ničesar ali pa so bile odstranjene: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend in sv_netHttp2 lahko odstraniš. sv_protectServerEntities ni bil nikoli implementiran; uporabi sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends je na Enhancedu zastarel. Tick rate sinhronizacije namesto tega nastavi s sv_syncTickRate (1 do 120, privzeto 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Preveri tudi ročno',
    manual = {
        'Strežniške datoteke: prenos je cfx-server_win_x64 ali cfx-server-linux_x64, FXServer.exe pa je zdaj cfx-server.exe. Posodobi zagonske skripte in bližnjice.',
        'Strežniki Windows potrebujejo Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp in endpoint_add_udp zdaj sprejmeta vsak samo en endpoint.',
        'Grafičnih modov med early accessom ni mogoče uporabljati: pure mode je vedno vklopljen.',
        'Oddaljeni ukazi vrnejo izpis samo s PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) je privzeto izklopljena in uporablja vrata 29200.',
        'Igralci potrebujejo GTA V Enhanced, strežnik pa teče samo na najnovejšem buildu igre.',
    },
    docs = 'Vse spremembe od Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'To poročilo je vodilo, ne jamstvo. Znane težave najde z branjem datotek in nastavitev; tvojih virov na Enhancedu ne more zagnati. Pred selitvijo preizkusi na strežniku Enhanced.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Ustvarjeno {date} za {server}.',
    summary = 'Preverjenih {resources} virov in nastavitve strežnika v {seconds} s.',
    summary_one = '{resource} preverjen v {seconds} s.',
    counts = '{blocker} ovir · {change} za spremembo · {review} za pregled · {note} opomb · nič najdenega v {clean} od {resources} virov',
    all_clear = 'Nič ni bilo najdeno. Vseeno preglej preverjanja, ki jih ne more opraviti; navedena so v datoteki poročila.',
    more = '...in še {count}',
    unreadable = 'Ni bilo mogoče prebrati: {resources}',
    truncated = 'Preverjenih je bilo samo prvih 20.000 datotek v: {resources}',
    saved = 'Celotno poročilo z datotekami in številkami vrstic je v {file}.',
    not_saved = 'Poročila ni bilo mogoče shraniti v {file}.',
    hint_command = 'Za celotno poročilo vpiši {command} v konzolo strežnika.',
    checking = 'Preverjam tvoje vire za FiveM za GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Končano. Poročilo je v konzoli strežnika in v {file}.',
    reply_busy = 'Preverjanje že poteka. Poskusi znova čez trenutek.',
    reply_no_resource = 'Vir z imenom {name} ne obstaja.',
    reply_no_permission = 'Nimaš dovoljenja za /{command}.',
}
