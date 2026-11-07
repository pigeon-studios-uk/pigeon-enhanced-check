--[[
    Pigeon Enhanced Check: Estonian (Eesti).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'et'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.et = {
    -- Levels, most serious first.
    level_blocker = 'Takistused',
    level_blocker_hint = 'ei tööta Enhancedis praegusel kujul',
    level_change = 'Muuta',
    level_change_hint = 'muuda neid enne üleminekut või selle ajal',
    level_review = 'Üle vaadata',
    level_review_hint = 'võivad olla mõjutatud; vaata üle',
    level_note = 'Märkused',
    level_note_hint = 'hea teada; praegu ei pea midagi muutma',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Escrow ressursid',
    fix_escrow = 'Asset escrow pole FiveM-is GTAV Enhanced jaoks veel tehtud, seega need ei saa seal praegusel kujul töötada. Küsi igalt loojalt Enhanced versiooni ja hoia neid seni oma Legacy serveris. Escrow failid on krüpteeritud, nii et teised kontrollid ei saa nende sisse vaadata.',
    item_escrow = '{resource}',

    title_builder = 'Ressursside builderid',
    fix_builder = 'Ressursid ei saa Enhancedis enam builderid olla. See kehtib ka cfx-server-data yarn ja webpack builderite kohta: neist sõltuvad ressursid peavad tulema valmis node_modules või build-väljundiga. Küsi loojalt või ehita need enne üleslaadimist ise.',
    item_builder = '{resource}: registreerib build-ülesande ({count})',

    title_onesync_off = 'OneSync on välja lülitatud',
    fix_onesync_off = 'Enhancedil pole P2P režiimi: OneSync on alati sees. Lülita see siin esmalt sisse käsuga set onesync on ja testi oma ressursse sellega, et probleemid ilmneksid serveris, mida sa juba tunned.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy režiim',
    fix_onesync_legacy = 'OneSync legacy (mitte-big) režiimi Enhancedis enam pole; big režiim on ainus, seega jõuab mängija ühendumine ja lahkumine klientideni ainult siis, kui mängija on lähedal. Vaheta siin set onesync on peale ja testi ressursse, mis eeldavad, et iga mängija on olemas igal kliendil.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Teisendatavad mudelid ja tekstuurid',
    fix_stream_convert = 'Need striimivad Legacy mudeleid või tekstuure (YDR, YTD, YFT, YPT, YDD) kaustast stream/ ja neil pole kausta stream_enhanced/. Teisenda need Cfx.re Alchemistiga ja pane tulemused kausta stream_enhanced/, jättes stream/ Legacy jaoks alles. Enhanced laadib stream/ asemel stream_enhanced/, seega kopeeri sinna ka ressursi teised striimitavad failid. Alchemist ei saa escrow asset\'e teisendada.',
    item_stream_convert = '{resource}: {count} faili {total}-st kaustas stream/',

    title_csharp = 'C# ressursid',
    fix_csharp = 'Enhancedis asendati Mono .NET-iga ja C# ressursid ehitatakse .NET 10 SDK-ga. Küsi loojalt Enhanced versiooni või ehita enda omad uuesti. Cfx.re on öelnud, et jagab selle kohta rohkem.',
    item_csharp = '{resource}: {count} .net.dll faili',

    title_mumble = 'Mumble hääl',
    fix_mumble = 'Mumble on Enhancedis aegunud ja eemaldatakse. Selle natives töötavad seal ainult setr sv_mumble true korral, mis lubab igal mängijal liituda iga häälekanaliga, ja voice targets käituvad nii, nagu oleks neid ainult üks. Planeeri üleminek häälressursile, mis kasutab uut serveri voice API-t.',
    item_mumble = '{resource}: {count} Mumble kutset',

    title_voice_convars = 'Eemaldatud hääleseaded',
    fix_voice_convars = 'Neid Mumble hääle convare Enhancedis enam pole (voice_inBitrate töötab endiselt). Eemalda need üleminekul failist server.cfg ja kontrolli, et sinu häälressurss neist ei sõltu.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI kutsed teistele ressurssidele',
    fix_nui_cross = 'Enhancedis on NUI callbackide range režiim vaikimisi sees: ressursi NUI tohib kutsuda ainult sama ressursi enda NUI callbacke, seega need kutsed blokeeritakse (HTTP 403). Turvaline lahendus on export teises ressursis ja oma callback siin. Et seda kohe Legacys testida, lisa manifesti nui_callback_strict_mode \'true\'.',
    item_nui_cross = '{resource} kutsub {targets}',

    title_server_kvp = 'Serveri võti-väärtus salvestus',
    fix_server_kvp = 'Serveri võti-väärtus (KVP) andmebaas tuleb üleminekul migreerida Cfx.re kvdb-migratoriga (https://github.com/citizenfx/kvdb-migrator). Need ressursid hoiavad seal andmeid. Tee enne varukoopia.',
    item_server_kvp = '{resource}: {count} KVP kutset',

    title_moo = 'Arendajarežiim moo kaudu',
    fix_moo = '+set moo 31337 ei lülita enam arendajarežiimi sisse. Kasuta selle asemel failis server.cfg set sv_devMode true, ja ainult arendusserverites.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Mängija ID järgi hoitud andmed',
    fix_player_ids = 'Enhancedis vabaneb mängija server ID tema lahkumisel ja võib minna järgmisele liitujale. Need ressursid hoiavad andmeid mängija ID järgi ega käsitle kunagi playerDropped sündmust, nii et uus mängija võib saada eelmise andmed. Kontrolli, et iga ressurss kustutab andmed mängija lahkumisel. See on mustriotsing, nii et mõned võivad olla korras.',
    item_player_ids = '{resource}: {count} kohta',

    title_game_build = 'Sunnitud mängu build',
    fix_game_build = 'Enhanced toetab ainult uusimat mängu buildi, mille ta laadib, kui sv_enforceGameBuild pole määratud (1 laadib põhimängu ilma DLC-deta). Eemalda see üleminekul ja kontrolli kõike, mis seda buildi vajas.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Kasutab stream kausta',
    fix_stream_deprecated = 'stream/ töötab Enhancedis endiselt, kui stream_enhanced/ puudub, kuid see on aegunud. Ükski neist failidest pole tüüp, mida Alchemist teisendab. Testi neid Enhancedis ja küsi loojalt, kui miski tundub vale.',
    item_stream_deprecated = '{resource}: {total} faili',

    title_state_bags = 'State bag handlerid',
    fix_state_bags = 'Enhancedis käivituvad state bag muutuste handlerid ainult siis, kui olem on olemas, ja replikeeritud väärtused saadetakse ainult siis, kui need on selgelt määratud. Kontrolli, et need käituvad endiselt ootuspäraselt.',
    item_state_bags = '{resource}: {count} handlerit',

    title_no_effect_convars = 'Mõjuta seaded',
    fix_no_effect_convars = 'Need ei tee Enhancedis midagi või on eemaldatud: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend ja sv_netHttp2 võib eemaldada. sv_protectServerEntities pole kunagi tehtud; kasuta sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends on Enhancedis aegunud. Määra sünkroonimise tick rate selle asemel sv_syncTickRate abil (1 kuni 120, vaikimisi 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Kontrolli ka käsitsi',
    manual = {
        'Serveri failid: allalaaditav on cfx-server_win_x64 või cfx-server-linux_x64 ja FXServer.exe on nüüd cfx-server.exe. Uuenda käivitusskripte ja otseteid.',
        'Windowsi serverid vajavad Microsoft Visual C++ 2017 Redistributable\'it.',
        'endpoint_add_tcp ja endpoint_add_udp võtavad nüüd kumbki ainult ühe endpointi.',
        'Graafikamodsid ei ole early access ajal kasutatavad: pure mode on alati sees.',
        'Kaugkäsud saadavad väljundi tagasi ainult PrintRemoteCommandLog(message) abil.',
        'Remote Console (DevCon) on vaikimisi väljas ja kasutab porti 29200.',
        'Mängijad vajavad GTA V Enhancedit ja server töötab ainult uusima mängu buildiga.',
    },
    docs = 'Kõik muudatused Cfx.re-lt: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'See raport on juhend, mitte garantii. See leiab teadaolevad probleemid faile ja seadeid lugedes; see ei saa sinu ressursse Enhancedis käivitada. Testi enne üleminekut Enhanced serveris.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Koostatud {date} serverile {server}.',
    summary = 'Kontrolliti {resources} ressurssi ja serveri seadeid {seconds} s jooksul.',
    summary_one = 'Kontrolliti {resource} {seconds} s jooksul.',
    counts = '{blocker} takistust · {change} muuta · {review} üle vaadata · {note} märkust · {clean} ressursis {resources}-st ei leitud midagi',
    all_clear = 'Midagi ei leitud. Käi siiski läbi kontrollid, mida see teha ei saa; need on raporti failis.',
    more = '...ja veel {count}',
    unreadable = 'Ei saanud lugeda: {resources}',
    truncated = 'Kontrolliti ainult esimesed 20 000 faili: {resources}',
    saved = 'Täielik raport koos failide ja reanumbritega on failis {file}.',
    not_saved = 'Raportit ei saanud faili {file} salvestada.',
    hint_command = 'Täieliku raporti jaoks sisesta serveri konsooli {command}.',
    checking = 'Kontrollin sinu ressursse FiveM GTAV Enhanced jaoks...',

    -- Command replies.
    reply_console = 'Valmis. Raport on serveri konsoolis ja failis {file}.',
    reply_busy = 'Kontroll juba käib. Proovi hetke pärast uuesti.',
    reply_no_resource = 'Ressurssi nimega {name} pole.',
    reply_no_permission = 'Sul pole õigust kasutada /{command}.',
}
