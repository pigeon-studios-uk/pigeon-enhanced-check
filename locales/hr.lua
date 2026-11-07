--[[
    Pigeon Enhanced Check: Croatian (Hrvatski).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.hr = {
    -- Levels, most serious first.
    level_blocker = 'Blokade',
    level_blocker_hint = 'neće raditi na Enhancedu ovakvi kakvi jesu',
    level_change = 'Za promjenu',
    level_change_hint = 'promijeni ih prije ili tijekom prelaska',
    level_review = 'Za pregled',
    level_review_hint = 'mogu biti pogođeni; pogledaj ih',
    level_note = 'Napomene',
    level_note_hint = 'dobro je znati; još ništa ne treba mijenjati',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Resursi s escrowom',
    fix_escrow = 'Asset escrow još nije implementiran na FiveM-u za GTAV Enhanced, pa ovi resursi tamo ne mogu raditi ovakvi kakvi jesu. Pitaj svakog autora za Enhanced verziju i dotad ih drži na svom Legacy serveru. Escrow datoteke su šifrirane, pa ostale provjere ne mogu pogledati unutra.',
    item_escrow = '{resource}',

    title_builder = 'Builderi resursa',
    fix_builder = 'Resursi na Enhancedu više ne mogu biti builderi. To uključuje yarn i webpack buildere iz cfx-server-data: resursi koji o njima ovise moraju doći s gotovim node_modules ili rezultatom builda. Pitaj autora ili ih sam izgradi prije učitavanja.',
    item_builder = '{resource}: registrira build zadatak ({count})',

    title_onesync_off = 'OneSync je isključen',
    fix_onesync_off = 'Enhanced nema P2P način: OneSync je uvijek uključen. Prvo ga ovdje uključi sa set onesync on i testiraj svoje resurse s njim, da se problemi pokažu na serveru koji već poznaješ.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy način',
    fix_onesync_legacy = 'OneSync legacy (ne-big) način više ne postoji na Enhancedu; big način je jedini, pa spajanje i odspajanje igrača dolazi do klijenata samo kad je igrač u dometu. Ovdje prebaci na set onesync on i testiraj resurse koji očekuju da svaki igrač postoji na svakom klijentu.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modeli i teksture za pretvorbu',
    fix_stream_convert = 'Ovi streamaju Legacy modele ili teksture (YDR, YTD, YFT, YPT, YDD) iz stream/ i nemaju mapu stream_enhanced/. Pretvori ih Cfx.re-ovim Alchemistom i stavi rezultate u stream_enhanced/, a stream/ zadrži za Legacy. Enhanced učitava stream_enhanced/ umjesto stream/, pa kopiraj i ostale streamane datoteke resursa. Alchemist ne može pretvoriti escrow assete.',
    item_stream_convert = '{resource}: {count} od {total} datoteka u stream/',

    title_csharp = 'C# resursi',
    fix_csharp = 'Mono je na Enhancedu zamijenjen s .NET-om, a C# resursi se grade s .NET 10 SDK-om. Pitaj autora za Enhanced verziju ili ponovno izgradi svoje. Cfx.re je najavio da će podijeliti više o tome.',
    item_csharp = '{resource}: {count} .net.dll datoteka',

    title_mumble = 'Mumble glas',
    fix_mumble = 'Mumble je na Enhancedu zastario i bit će uklonjen. Njegovi natives tamo rade samo uz setr sv_mumble true, što svakom igraču dopušta ulazak u bilo koji glasovni kanal, a voice targets se ponašaju kao da postoji samo jedan. Planiraj prelazak na glasovni resurs koji koristi novi serverski voice API.',
    item_mumble = '{resource}: {count} Mumble poziva',

    title_voice_convars = 'Uklonjene postavke glasa',
    fix_voice_convars = 'Ovi Mumble glasovni convari više ne postoje na Enhancedu (voice_inBitrate i dalje radi). Ukloni ih iz server.cfg pri prelasku i provjeri da tvoj glasovni resurs ne ovisi o njima.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI pozivi drugim resursima',
    fix_nui_cross = 'Strogi način NUI callbackova na Enhancedu je zadano uključen: NUI resursa smije zvati samo vlastite NUI callbackove tog resursa, pa će ovi pozivi biti blokirani (HTTP 403). Sigurno rješenje je export u drugom resursu i vlastiti callback ovdje. Za test na Legacyju odmah, dodaj nui_callback_strict_mode \'true\' u manifest.',
    item_nui_cross = '{resource} poziva {targets}',

    title_server_kvp = 'Serverska pohrana ključ-vrijednost',
    fix_server_kvp = 'Serversku bazu ključ-vrijednost (KVP) treba pri prelasku migrirati Cfx.re-ovim kvdb-migratorom (https://github.com/citizenfx/kvdb-migrator). Ovi resursi u njoj čuvaju podatke. Prvo napravi sigurnosnu kopiju.',
    item_server_kvp = '{resource}: {count} KVP poziva',

    title_moo = 'Developerski način preko moo',
    fix_moo = '+set moo 31337 više ne uključuje developerski način. Umjesto toga koristi set sv_devMode true u server.cfg, i to samo na razvojnim serverima.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Podaci spremljeni po ID-ju igrača',
    fix_player_ids = 'Na Enhancedu se server ID igrača oslobađa kad ode i može pripasti sljedećem igraču koji se spoji. Ovi resursi spremaju podatke po ID-ju igrača i nikad ne obrađuju playerDropped, pa bi novi igrač mogao dobiti podatke prethodnog. Provjeri da svaki briše podatke kad igrač ode. Ovo je pretraga po uzorku, pa neki mogu biti u redu.',
    item_player_ids = '{resource}: {count} mjesta',

    title_game_build = 'Prisilni build igre',
    fix_game_build = 'Enhanced podržava samo najnoviji build igre, koji učitava kad sv_enforceGameBuild nije postavljen (1 učitava osnovnu igru bez DLC-ova). Ukloni ga pri prelasku i provjeri sve što je trebalo ovaj build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Koristi mapu stream',
    fix_stream_deprecated = 'stream/ i dalje radi na Enhancedu kad nema stream_enhanced/, ali je zastario. Nijedna od ovih datoteka nije vrsta koju Alchemist pretvara. Testiraj ih na Enhancedu i pitaj autora ako nešto izgleda krivo.',
    item_stream_deprecated = '{resource}: {total} datoteka',

    title_state_bags = 'Handleri state bagova',
    fix_state_bags = 'Na Enhancedu se handleri promjena state bagova pokreću samo ako entitet postoji, a replicirane vrijednosti šalju se samo kad su izričito postavljene. Provjeri da se ovi i dalje ponašaju kako očekuješ.',
    item_state_bags = '{resource}: {count} handlera',

    title_no_effect_convars = 'Postavke bez učinka',
    fix_no_effect_convars = 'Ove ne rade ništa na Enhancedu ili su uklonjene: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend i sv_netHttp2 mogu se maknuti. sv_protectServerEntities nikad nije implementiran; koristi sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends je na Enhancedu zastario. Umjesto toga postavi tick rate sinkronizacije sa sv_syncTickRate (1 do 120, zadano 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Provjeri i ručno',
    manual = {
        'Serverske datoteke: preuzima se cfx-server_win_x64 ili cfx-server-linux_x64, a FXServer.exe je sada cfx-server.exe. Ažuriraj skripte za pokretanje i prečace.',
        'Windows serveri trebaju Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp i endpoint_add_udp sada primaju samo po jedan endpoint.',
        'Grafički modovi ne mogu se koristiti tijekom early accessa: pure mode je uvijek uključen.',
        'Udaljene naredbe vraćaju izlaz samo uz PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) je zadano isključena i koristi port 29200.',
        'Igrači trebaju GTA V Enhanced, a server radi samo na najnovijem buildu igre.',
    },
    docs = 'Sve što se mijenja, od Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Ovaj izvještaj je vodič, a ne jamstvo. Poznate probleme pronalazi čitanjem datoteka i postavki; ne može pokrenuti tvoje resurse na Enhancedu. Testiraj na Enhanced serveru prije prelaska.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Izrađeno {date} za {server}.',
    summary = 'Provjereno {resources} resursa i postavke servera za {seconds} s.',
    summary_one = 'Provjeren {resource} za {seconds} s.',
    counts = '{blocker} blokada · {change} za promjenu · {review} za pregled · {note} napomena · ništa nije pronađeno u {clean} od {resources} resursa',
    all_clear = 'Ništa nije pronađeno. Ipak prođi provjere koje ne može napraviti; navedene su u datoteci izvještaja.',
    more = '...i još {count}',
    unreadable = 'Nije bilo moguće pročitati: {resources}',
    truncated = 'Provjereno je samo prvih 20.000 datoteka u: {resources}',
    saved = 'Cijeli izvještaj s datotekama i brojevima redaka nalazi se u {file}.',
    not_saved = 'Izvještaj nije bilo moguće spremiti u {file}.',
    hint_command = 'Upiši {command} u konzolu servera za cijeli izvještaj.',
    checking = 'Provjeravam tvoje resurse za FiveM za GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Gotovo. Izvještaj je u konzoli servera i u {file}.',
    reply_busy = 'Provjera je već u tijeku. Pokušaj ponovno za trenutak.',
    reply_no_resource = 'Ne postoji resurs naziva {name}.',
    reply_no_permission = 'Nemaš dopuštenje za /{command}.',
}
