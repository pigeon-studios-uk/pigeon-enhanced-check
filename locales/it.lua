--[[
    Pigeon Enhanced Check: Italian (Italiano).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'it'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.it = {
    -- Levels, most serious first.
    level_blocker = 'Bloccanti',
    level_blocker_hint = 'non funzioneranno su Enhanced così come sono',
    level_change = 'Da modificare',
    level_change_hint = 'modificali prima o durante il passaggio',
    level_review = 'Da controllare',
    level_review_hint = 'potrebbero essere coinvolti; dai un\'occhiata',
    level_note = 'Note',
    level_note_hint = 'utile saperlo; per ora non serve cambiare nulla',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Risorse con escrow',
    fix_escrow = 'L\'asset escrow non è ancora disponibile su FiveM per GTAV Enhanced, quindi queste non possono funzionare lì così come sono. Chiedi a ogni creatore una versione per Enhanced e tienile sul tuo server Legacy fino ad allora. I file con escrow sono cifrati, quindi gli altri controlli non possono guardarci dentro.',
    item_escrow = '{resource}',

    title_builder = 'Builder di risorse',
    fix_builder = 'Su Enhanced le risorse non possono più essere builder. Questo vale anche per i builder yarn e webpack di cfx-server-data: le risorse che ne dipendono devono includere i loro node_modules o il risultato della build già pronti. Chiedi al creatore, o fai tu la build prima di caricarle.',
    item_builder = '{resource}: registra un\'attività di build ({count})',

    title_onesync_off = 'OneSync è disattivato',
    fix_onesync_off = 'Enhanced non ha la modalità P2P: OneSync è sempre attivo. Attivalo prima qui con set onesync on e prova le tue risorse con esso, così i problemi emergono sul server che già conosci.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Modalità legacy di OneSync',
    fix_onesync_legacy = 'La modalità legacy di OneSync (non big) non esiste più su Enhanced; la modalità big è l\'unica, quindi la connessione e disconnessione di un giocatore arrivano ai client solo quando quel giocatore è nel raggio. Passa qui a set onesync on e prova le risorse che si aspettano che ogni giocatore esista su ogni client.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modelli e texture da convertire',
    fix_stream_convert = 'Queste fanno stream di modelli o texture Legacy (YDR, YTD, YFT, YPT, YDD) da stream/ e non hanno la cartella stream_enhanced/. Convertili con Alchemist di Cfx.re e metti i risultati in stream_enhanced/, tenendo stream/ per Legacy. Enhanced carica stream_enhanced/ invece di stream/, quindi copia anche gli altri file in stream della risorsa. Alchemist non può convertire asset con escrow.',
    item_stream_convert = '{resource}: {count} dei {total} file in stream/',

    title_csharp = 'Risorse C#',
    fix_csharp = 'Su Enhanced Mono è stato sostituito da .NET, e le risorse C# si compilano con l\'SDK .NET 10. Chiedi al creatore una versione per Enhanced, o ricompila le tue. Cfx.re ha detto che condividerà altri dettagli.',
    item_csharp = '{resource}: {count} file .net.dll',

    title_mumble = 'Voce Mumble',
    fix_mumble = 'Mumble è deprecato su Enhanced e verrà rimosso. Le sue native lì funzionano solo con setr sv_mumble true, che permette a qualsiasi giocatore di entrare in qualsiasi canale vocale, e i voice target si comportano come se ce ne fosse solo uno. Pianifica il passaggio a una risorsa vocale che usa la nuova API vocale del server.',
    item_mumble = '{resource}: {count} chiamate Mumble',

    title_voice_convars = 'Impostazioni vocali rimosse',
    fix_voice_convars = 'Questi convar vocali di Mumble non esistono più su Enhanced (voice_inBitrate funziona ancora). Toglili da server.cfg al passaggio e controlla che la tua risorsa vocale non dipenda da loro.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Chiamate NUI ad altre risorse',
    fix_nui_cross = 'Su Enhanced la modalità rigorosa dei callback NUI è attiva di default: la NUI di una risorsa può chiamare solo i callback NUI della risorsa stessa, quindi queste chiamate saranno bloccate (HTTP 403). La soluzione sicura è un export nell\'altra risorsa e un callback proprio qui. Per provarlo subito su Legacy, aggiungi nui_callback_strict_mode \'true\' al manifest.',
    item_nui_cross = '{resource} chiama {targets}',

    title_server_kvp = 'Archivio chiave-valore del server',
    fix_server_kvp = 'Il database chiave-valore (KVP) del server va migrato al passaggio, con kvdb-migrator di Cfx.re (https://github.com/citizenfx/kvdb-migrator). Queste risorse ci salvano dei dati. Fai prima un backup.',
    item_server_kvp = '{resource}: {count} chiamate KVP',

    title_moo = 'Modalità sviluppatore tramite moo',
    fix_moo = '+set moo 31337 non attiva più la modalità sviluppatore. Usa invece set sv_devMode true in server.cfg, e solo sui server di sviluppo.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Dati salvati per ID giocatore',
    fix_player_ids = 'Su Enhanced l\'ID server di un giocatore viene liberato quando esce e può andare al prossimo giocatore che entra. Queste risorse salvano dati per ID giocatore e non gestiscono mai playerDropped, quindi un nuovo giocatore potrebbe ricevere i dati del precedente. Controlla che ognuna li cancelli quando un giocatore esce. È una ricerca per schemi, quindi alcune potrebbero andare bene.',
    item_player_ids = '{resource}: {count} punti',

    title_game_build = 'Build del gioco forzata',
    fix_game_build = 'Enhanced supporta solo la build più recente del gioco, che carica quando sv_enforceGameBuild non è impostato (1 carica il gioco base senza DLC). Rimuovilo al passaggio e controlla tutto ciò che richiedeva questa build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Usa la cartella stream',
    fix_stream_deprecated = 'stream/ funziona ancora su Enhanced quando non c\'è stream_enhanced/, ma è deprecata. Nessuno di questi file è di un tipo che Alchemist converte. Provali su Enhanced e chiedi al creatore se qualcosa non va.',
    item_stream_deprecated = '{resource}: {total} file',

    title_state_bags = 'Handler delle state bag',
    fix_state_bags = 'Su Enhanced gli handler di modifica delle state bag scattano solo se l\'entità esiste, e i valori replicati vengono inviati solo quando sono impostati esplicitamente. Controlla che questi si comportino ancora come previsto.',
    item_state_bags = '{resource}: {count} handler',

    title_no_effect_convars = 'Impostazioni che non fanno nulla',
    fix_no_effect_convars = 'Queste non fanno nulla su Enhanced o sono state rimosse: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend e sv_netHttp2 possono essere tolte. sv_protectServerEntities non è mai stato implementato; usa sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends è deprecato su Enhanced. Imposta invece il tick rate di sincronizzazione con sv_syncTickRate (da 1 a 120, predefinito 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Controlla anche a mano',
    manual = {
        'File del server: il download è cfx-server_win_x64 o cfx-server-linux_x64, e FXServer.exe ora si chiama cfx-server.exe. Aggiorna gli script di avvio e i collegamenti.',
        'I server Windows richiedono Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp e endpoint_add_udp ora accettano un solo endpoint ciascuno.',
        'Le mod grafiche non si possono usare durante l\'accesso anticipato: la pure mode è sempre attiva.',
        'I comandi remoti restituiscono l\'output solo con PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) è disattivata di default e usa la porta 29200.',
        'I giocatori hanno bisogno di GTA V Enhanced, e il server usa solo la build più recente del gioco.',
    },
    docs = 'Tutto ciò che cambia, da Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Questo report è una guida, non una garanzia. Trova i problemi noti leggendo file e impostazioni; non può eseguire le tue risorse su Enhanced. Prova su un server Enhanced prima di passare.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Creato il {date} per {server}.',
    summary = 'Controllate {resources} risorse e le impostazioni del server in {seconds} s.',
    summary_one = 'Controllata {resource} in {seconds} s.',
    counts = '{blocker} bloccanti · {change} da modificare · {review} da controllare · {note} note · niente trovato in {clean} di {resources} risorse',
    all_clear = 'Niente trovato. Fai comunque i controlli che non può fare, elencati nel file del report.',
    more = '...e altri {count}',
    unreadable = 'Non è stato possibile leggere: {resources}',
    truncated = 'Sono stati controllati solo i primi 20.000 file in: {resources}',
    saved = 'Il report completo, con file e numeri di riga, è in {file}.',
    not_saved = 'Non è stato possibile salvare il report in {file}.',
    hint_command = 'Scrivi {command} nella console del server per il report completo.',
    checking = 'Controllo delle tue risorse per FiveM per GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Fatto. Il report è nella console del server e in {file}.',
    reply_busy = 'C\'è già un controllo in corso. Riprova tra un momento.',
    reply_no_resource = 'Non c\'è nessuna risorsa chiamata {name}.',
    reply_no_permission = 'Non hai il permesso di usare /{command}.',
}
