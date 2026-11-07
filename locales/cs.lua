--[[
    Pigeon Enhanced Check: Czech (Čeština).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'cs'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.cs = {
    -- Levels, most serious first.
    level_blocker = 'Blokující',
    level_blocker_hint = 'na Enhanced v tomto stavu fungovat nebudou',
    level_change = 'Ke změně',
    level_change_hint = 'změň je před přechodem nebo během něj',
    level_review = 'Ke kontrole',
    level_review_hint = 'mohou být ovlivněny; podívej se na ně',
    level_note = 'Poznámky',
    level_note_hint = 'dobré vědět; zatím není nutné nic měnit',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Resources v escrow',
    fix_escrow = 'Asset escrow zatím na FiveM pro GTAV Enhanced není implementovaný, takže tyto resources tam v tomto stavu nepoběží. Zeptej se každého autora na verzi pro Enhanced a do té doby je nech na Legacy serveru. Soubory v escrow jsou šifrované, takže ostatní kontroly se do nich nepodívají.',
    item_escrow = '{resource}',

    title_builder = 'Buildery resources',
    fix_builder = 'Resources už na Enhanced nemůžou být buildery. To platí i pro buildery yarn a webpack z cfx-server-data: resources, které na nich závisí, musí mít node_modules nebo výstup buildu přiložený hotový. Zeptej se autora, nebo je před nahráním sestav sám.',
    item_builder = '{resource}: registruje build úlohu ({count})',

    title_onesync_off = 'OneSync je vypnutý',
    fix_onesync_off = 'Enhanced nemá režim P2P: OneSync je vždy zapnutý. Nejdřív ho zapni tady pomocí set onesync on a otestuj s ním své resources, aby se problémy ukázaly na serveru, který už znáš.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync v režimu legacy',
    fix_onesync_legacy = 'Režim OneSync legacy (ne big) na Enhanced už neexistuje; jediný je big režim, takže připojení a odpojení hráče se ke klientům dostane, jen když je hráč v dosahu. Přepni tady na set onesync on a otestuj resources, které počítají s tím, že každý hráč existuje na každém klientovi.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modely a textury ke konverzi',
    fix_stream_convert = 'Tyto resources streamují Legacy modely nebo textury (YDR, YTD, YFT, YPT, YDD) ze stream/ a nemají složku stream_enhanced/. Převeď je nástrojem Alchemist od Cfx.re a výsledky dej do stream_enhanced/, stream/ si nech pro Legacy. Enhanced načítá stream_enhanced/ místo stream/, takže tam zkopíruj i ostatní streamované soubory resourcu. Alchemist nedokáže převést assety v escrow.',
    item_stream_convert = '{resource}: {count} z {total} souborů ve stream/',

    title_csharp = 'C# resources',
    fix_csharp = 'Mono bylo na Enhanced nahrazeno .NET a C# resources se sestavují pomocí .NET 10 SDK. Požádej autora o verzi pro Enhanced, nebo si své vlastní znovu sestav. Cfx.re slíbilo k tomu sdílet víc.',
    item_csharp = '{resource}: {count} soubor(ů) .net.dll',

    title_mumble = 'Hlas přes Mumble',
    fix_mumble = 'Mumble je na Enhanced zastaralý a bude odstraněn. Jeho natives tam fungují jen se setr sv_mumble true, což každému hráči dovolí připojit se do jakéhokoli hlasového kanálu, a voice targets se chovají, jako by existoval jen jeden. Naplánuj přechod na hlasový resource, který používá nové serverové voice API.',
    item_mumble = '{resource}: {count} volání Mumble',

    title_voice_convars = 'Odstraněná nastavení hlasu',
    fix_voice_convars = 'Tyto convary hlasu Mumble na Enhanced už neexistují (voice_inBitrate stále funguje). Při přechodu je odstraň ze server.cfg a zkontroluj, že na nich tvůj hlasový resource nezávisí.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI volání do jiných resources',
    fix_nui_cross = 'Na Enhanced je striktní režim NUI callbacků ve výchozím stavu zapnutý: NUI resourcu smí volat jen vlastní NUI callbacky téhož resourcu, takže tato volání budou zablokována (HTTP 403). Bezpečná oprava je export v druhém resourcu a vlastní callback tady. Pro test na Legacy už teď přidej do manifestu nui_callback_strict_mode \'true\'.',
    item_nui_cross = '{resource} volá {targets}',

    title_server_kvp = 'Serverové úložiště klíč-hodnota',
    fix_server_kvp = 'Serverovou databázi klíč-hodnota (KVP) je při přechodu potřeba převést nástrojem kvdb-migrator od Cfx.re (https://github.com/citizenfx/kvdb-migrator). Tyto resources v ní ukládají data. Nejdřív ji zálohuj.',
    item_server_kvp = '{resource}: {count} volání KVP',

    title_moo = 'Vývojářský režim přes moo',
    fix_moo = '+set moo 31337 už vývojářský režim nezapíná. Místo toho použij v server.cfg set sv_devMode true, a jen na vývojových serverech.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Data uložená podle ID hráče',
    fix_player_ids = 'Na Enhanced se serverové ID hráče po odchodu uvolní a může ho dostat další hráč, který se připojí. Tyto resources ukládají data podle ID hráče a nikdy nezpracují playerDropped, takže nový hráč by mohl dostat data předchozího. U každého ověř, že data při odchodu hráče maže. Je to hledání podle vzoru, takže některé můžou být v pořádku.',
    item_player_ids = '{resource}: {count} míst(o)',

    title_game_build = 'Vynucený build hry',
    fix_game_build = 'Enhanced podporuje jen nejnovější build hry, který načte, když sv_enforceGameBuild není nastavený (1 načte základní hru bez DLC). Při přechodu ho odstraň a zkontroluj vše, co tento build potřebovalo.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Používá složku stream',
    fix_stream_deprecated = 'stream/ na Enhanced stále funguje, když chybí stream_enhanced/, ale je zastaralá. Žádný z těchto souborů není typ, který Alchemist převádí. Otestuj je na Enhanced a když něco nebude vypadat dobře, zeptej se autora.',
    item_stream_deprecated = '{resource}: {total} soubor(ů)',

    title_state_bags = 'Handlery state bagů',
    fix_state_bags = 'Na Enhanced se handlery změn state bagů spustí jen tehdy, když entita existuje, a replikované hodnoty se posílají jen tehdy, když jsou výslovně nastavené. Zkontroluj, že se tyto pořád chovají podle očekávání.',
    item_state_bags = '{resource}: {count} handler(ů)',

    title_no_effect_convars = 'Nastavení bez účinku',
    fix_no_effect_convars = 'Tato nastavení na Enhanced nic nedělají nebo byla odstraněna: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend a sv_netHttp2 můžou pryč. sv_protectServerEntities nebylo nikdy implementováno; použij sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends je na Enhanced zastaralé. Tick rate synchronizace místo toho nastav pomocí sv_syncTickRate (1 až 120, výchozí 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Zkontroluj také ručně',
    manual = {
        'Serverové soubory: ke stažení je cfx-server_win_x64 nebo cfx-server-linux_x64 a z FXServer.exe je teď cfx-server.exe. Uprav spouštěcí skripty a zástupce.',
        'Windows servery potřebují Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp a endpoint_add_udp teď berou každý jen jeden endpoint.',
        'Grafické mody nejdou během early access používat: pure mode je vždy zapnutý.',
        'Vzdálené příkazy vrací výstup jen přes PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) je ve výchozím stavu vypnutá a používá port 29200.',
        'Hráči potřebují GTA V Enhanced a server běží jen na nejnovějším buildu hry.',
    },
    docs = 'Všechny změny od Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Tento report je vodítko, ne záruka. Známé problémy hledá čtením souborů a nastavení; tvoje resources na Enhanced spustit nedokáže. Před přechodem testuj na Enhanced serveru.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Vytvořeno {date} pro {server}.',
    summary = 'Zkontrolováno {resources} resources a nastavení serveru za {seconds} s.',
    summary_one = 'Zkontrolováno {resource} za {seconds} s.',
    counts = '{blocker} blokujících · {change} ke změně · {review} ke kontrole · {note} poznámek · nic nenalezeno v {clean} z {resources} resources',
    all_clear = 'Nic nenalezeno. Stejně projdi kontroly, které udělat nedokáže; jsou v souboru s reportem.',
    more = '...a dalších {count}',
    unreadable = 'Nešlo přečíst: {resources}',
    truncated = 'Zkontrolováno jen prvních 20 000 souborů v: {resources}',
    saved = 'Celý report se soubory a čísly řádků je v {file}.',
    not_saved = 'Report se nepodařilo uložit do {file}.',
    hint_command = 'Pro celý report napiš do konzole serveru {command}.',
    checking = 'Kontroluji tvoje resources pro FiveM pro GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Hotovo. Report je v konzoli serveru a v {file}.',
    reply_busy = 'Kontrola už běží. Zkus to za chvíli znovu.',
    reply_no_resource = 'Resource s názvem {name} neexistuje.',
    reply_no_permission = 'Nemáš oprávnění používat /{command}.',
}
