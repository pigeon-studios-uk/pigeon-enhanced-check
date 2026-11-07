--[[
    Pigeon Enhanced Check: Hungarian (Magyar).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hu'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.hu = {
    -- Levels, most serious first.
    level_blocker = 'Akadályok',
    level_blocker_hint = 'így nem fognak működni Enhanceden',
    level_change = 'Módosítandó',
    level_change_hint = 'módosítsd őket az átállás előtt vagy közben',
    level_review = 'Átnézendő',
    level_review_hint = 'érintettek lehetnek; nézd át őket',
    level_note = 'Megjegyzések',
    level_note_hint = 'jó tudni; egyelőre semmit sem kell módosítani',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Escrow-os resource-ok',
    fix_escrow = 'Az asset escrow még nincs megvalósítva a FiveM GTAV Enhanced verziójában, így ezek ott jelenlegi formájukban nem futnak. Kérj minden készítőtől Enhanced verziót, és addig tartsd őket a Legacy szervereden. Az escrow-os fájlok titkosítottak, így a többi ellenőrzés nem lát beléjük.',
    item_escrow = '{resource}',

    title_builder = 'Resource builderek',
    fix_builder = 'Enhanceden a resource-ok már nem lehetnek builderek. Ez a cfx-server-data yarn és webpack buildereire is vonatkozik: az ezekre támaszkodó resource-oknak késznek kell lennie a node_modules mappával vagy a build kimenettel. Kérdezd meg a készítőt, vagy buildeld le magad feltöltés előtt.',
    item_builder = '{resource}: build feladatot regisztrál ({count})',

    title_onesync_off = 'A OneSync ki van kapcsolva',
    fix_onesync_off = 'Az Enhancednek nincs P2P módja: a OneSync mindig be van kapcsolva. Előbb itt kapcsold be a set onesync on paranccsal, és teszteld vele a resource-aidat, hogy a hibák a már ismert szervereden jöjjenek elő.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy mód',
    fix_onesync_legacy = 'A OneSync legacy (nem big) mód már nem létezik Enhanceden; a big mód az egyetlen, így egy játékos csatlakozása és kilépése csak akkor jut el a kliensekhez, ha a játékos hatótávon belül van. Válts itt set onesync on módra, és teszteld azokat a resource-okat, amelyek azt várják, hogy minden játékos minden kliensen létezzen.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Átalakítandó modellek és textúrák',
    fix_stream_convert = 'Ezek Legacy modelleket vagy textúrákat (YDR, YTD, YFT, YPT, YDD) streamelnek a stream/ mappából, és nincs stream_enhanced/ mappájuk. Alakítsd át őket a Cfx.re Alchemist eszközével, az eredményt tedd a stream_enhanced/ mappába, a stream/ maradjon a Legacynek. Az Enhanced a stream/ helyett a stream_enhanced/ mappát tölti be, ezért a resource többi streamelt fájlját is másold át. Az Alchemist nem tud escrow-os asseteket átalakítani.',
    item_stream_convert = '{resource}: {count} / {total} fájl a stream/ mappában',

    title_csharp = 'C# resource-ok',
    fix_csharp = 'Enhanceden a Monót a .NET váltotta, és a C# resource-okat a .NET 10 SDK-val kell buildelni. Kérj a készítőtől Enhanced verziót, vagy buildeld újra a sajátjaidat. A Cfx.re jelezte, hogy erről még többet oszt meg.',
    item_csharp = '{resource}: {count} .net.dll fájl',

    title_mumble = 'Mumble hang',
    fix_mumble = 'A Mumble elavult Enhanceden, és el fogják távolítani. A nativejai ott csak setr sv_mumble true mellett működnek, ami bármelyik játékost bármelyik hangcsatornába beengedi, és a voice targetek úgy viselkednek, mintha csak egy lenne. Tervezd meg az átállást egy olyan hang resource-ra, amely az új szerveroldali voice API-t használja.',
    item_mumble = '{resource}: {count} Mumble hívás',

    title_voice_convars = 'Eltávolított hangbeállítások',
    fix_voice_convars = 'Ezek a Mumble hang convarok már nem léteznek Enhanceden (a voice_inBitrate továbbra is működik). Átálláskor vedd ki őket a server.cfg-ből, és ellenőrizd, hogy a hang resource-od nem függ tőlük.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI hívások más resource-okba',
    fix_nui_cross = 'Enhanceden az NUI callbackek szigorú módja alapból be van kapcsolva: egy resource NUI-ja csak a saját NUI callbackjeit hívhatja, így ezeket a hívásokat blokkolni fogja (HTTP 403). A biztos megoldás egy export a másik resource-ban és egy saját callback itt. Ha most Legacyn tesztelnéd, add hozzá a manifesthez: nui_callback_strict_mode \'true\'.',
    item_nui_cross = '{resource} hívja: {targets}',

    title_server_kvp = 'Szerver kulcs-érték tároló',
    fix_server_kvp = 'A szerver kulcs-érték (KVP) adatbázisát átálláskor migrálni kell a Cfx.re kvdb-migrator eszközével (https://github.com/citizenfx/kvdb-migrator). Ezek a resource-ok adatokat tárolnak benne. Előbb készíts mentést.',
    item_server_kvp = '{resource}: {count} KVP hívás',

    title_moo = 'Fejlesztői mód moo-val',
    fix_moo = 'A +set moo 31337 már nem kapcsolja be a fejlesztői módot. Helyette használd a set sv_devMode true sort a server.cfg-ben, és csak fejlesztői szervereken.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Játékos ID szerint tárolt adatok',
    fix_player_ids = 'Enhanceden a játékos szerver ID-ja kilépéskor felszabadul, és megkaphatja a következő csatlakozó. Ezek a resource-ok játékos ID szerint tárolnak adatot, és sosem kezelik a playerDropped eseményt, így egy új játékos megkaphatja az előző adatait. Ellenőrizd, hogy mindegyik törli az adatot, amikor egy játékos kilép. Ez mintakeresés, így némelyik lehet rendben.',
    item_player_ids = '{resource}: {count} hely',

    title_game_build = 'Kényszerített játék build',
    fix_game_build = 'Az Enhanced csak a legújabb játék buildet támogatja, amit akkor tölt be, ha a sv_enforceGameBuild nincs beállítva (az 1 a DLC-k nélküli alapjátékot tölti be). Átálláskor töröld, és ellenőrizz mindent, aminek erre a buildre volt szüksége.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'A stream mappát használja',
    fix_stream_deprecated = 'A stream/ Enhanceden is működik, ha nincs stream_enhanced/, de elavult. Egyik fájl sem olyan típus, amit az Alchemist átalakít. Teszteld őket Enhanceden, és kérdezd meg a készítőt, ha valami rossznak tűnik.',
    item_stream_deprecated = '{resource}: {total} fájl',

    title_state_bags = 'State bag handlerek',
    fix_state_bags = 'Enhanceden a state bag változás handlerek csak akkor futnak le, ha az entitás létezik, és a replikált értékek csak akkor mennek ki, ha kifejezetten be vannak állítva. Ellenőrizd, hogy ezek továbbra is a várt módon működnek.',
    item_state_bags = '{resource}: {count} handler',

    title_no_effect_convars = 'Hatástalan beállítások',
    fix_no_effect_convars = 'Ezek Enhanceden semmit sem csinálnak, vagy eltávolították őket: az onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend és sv_netHttp2 törölhető. A sv_protectServerEntities sosem lett megvalósítva; használd a sv_entityLockdown beállítást.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'A sv_useAccurateSends elavult Enhanceden. A szinkronizációs tick rate-et inkább a sv_syncTickRate beállítással add meg (1-120, alapból 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Kézzel is ellenőrizd',
    manual = {
        'Szerverfájlok: a letöltés cfx-server_win_x64 vagy cfx-server-linux_x64, és a FXServer.exe neve mostantól cfx-server.exe. Frissítsd az indítószkripteket és a parancsikonokat.',
        'A Windows szerverekhez Microsoft Visual C++ 2017 Redistributable kell.',
        'Az endpoint_add_tcp és endpoint_add_udp mostantól egyenként csak egy endpointot fogad.',
        'Az early access alatt grafikai modok nem használhatók: a pure mode mindig be van kapcsolva.',
        'A távoli parancsok csak a PrintRemoteCommandLog(message) hívással küldenek vissza kimenetet.',
        'A Remote Console (DevCon) alapból ki van kapcsolva, és a 29200-as portot használja.',
        'A játékosoknak GTA V Enhanced kell, és a szerver csak a legújabb játék builddel fut.',
    },
    docs = 'Minden változás a Cfx.re-től: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Ez a jelentés útmutató, nem garancia. Az ismert hibákat fájlok és beállítások olvasásával találja meg; a resource-aidat nem tudja Enhanceden futtatni. Átállás előtt tesztelj egy Enhanced szerveren.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Készült {date} ehhez: {server}.',
    summary = '{resources} resource és a szerver beállításai ellenőrizve {seconds} mp alatt.',
    summary_one = '{resource} ellenőrizve {seconds} mp alatt.',
    counts = '{blocker} akadály · {change} módosítandó · {review} átnézendő · {note} megjegyzés · {clean} / {resources} resource-ban nem talált semmit',
    all_clear = 'Nem talált semmit. Azért nézd át azokat az ellenőrzéseket is, amelyeket nem tud elvégezni; a jelentésfájlban vannak.',
    more = '...és még {count}',
    unreadable = 'Nem olvasható: {resources}',
    truncated = 'Csak az első 20 000 fájl lett ellenőrizve itt: {resources}',
    saved = 'A teljes jelentés fájlokkal és sorszámokkal itt van: {file}.',
    not_saved = 'A jelentést nem sikerült ide menteni: {file}.',
    hint_command = 'A teljes jelentéshez írd be a szerverkonzolba: {command}.',
    checking = 'A resource-aid ellenőrzése a FiveM GTAV Enhanced verziójához...',

    -- Command replies.
    reply_console = 'Kész. A jelentés a szerverkonzolban és itt van: {file}.',
    reply_busy = 'Már fut egy ellenőrzés. Próbáld újra egy kicsit később.',
    reply_no_resource = 'Nincs {name} nevű resource.',
    reply_no_permission = 'Nincs jogosultságod a /{command} használatához.',
}
