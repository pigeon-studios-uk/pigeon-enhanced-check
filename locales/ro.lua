--[[
    Pigeon Enhanced Check: Romanian (Română).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'ro'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.ro = {
    -- Levels, most serious first.
    level_blocker = 'Blocaje',
    level_blocker_hint = 'nu vor funcționa pe Enhanced așa cum sunt',
    level_change = 'De schimbat',
    level_change_hint = 'schimbă-le înainte de mutare sau în timpul ei',
    level_review = 'De verificat',
    level_review_hint = 'pot fi afectate; aruncă o privire',
    level_note = 'Note',
    level_note_hint = 'bine de știut; încă nu trebuie schimbat nimic',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Resurse cu escrow',
    fix_escrow = 'Asset escrow nu este încă implementat în FiveM pentru GTAV Enhanced, așa că acestea nu pot rula acolo așa cum sunt. Cere fiecărui creator o versiune pentru Enhanced și ține-le până atunci pe serverul Legacy. Fișierele cu escrow sunt criptate, așa că celelalte verificări nu se pot uita în ele.',
    item_escrow = '{resource}',

    title_builder = 'Builderi de resurse',
    fix_builder = 'Pe Enhanced, resursele nu mai pot fi builderi. Asta include builderii yarn și webpack din cfx-server-data: resursele care depind de ei trebuie livrate cu node_modules sau rezultatul build-ului gata făcute. Întreabă creatorul sau fă tu build-ul înainte să le încarci.',
    item_builder = '{resource}: înregistrează o sarcină de build ({count})',

    title_onesync_off = 'OneSync este oprit',
    fix_onesync_off = 'Enhanced nu are mod P2P: OneSync este mereu pornit. Pornește-l mai întâi aici cu set onesync on și testează-ți resursele cu el, ca problemele să apară pe serverul pe care îl cunoști deja.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Modul legacy OneSync',
    fix_onesync_legacy = 'Modul legacy OneSync (non-big) nu mai există pe Enhanced; modul big este singurul, așa că intrarea și ieșirea unui jucător ajung la clienți doar când acel jucător este în raza lor. Treci aici pe set onesync on și testează resursele care se așteaptă ca fiecare jucător să existe pe fiecare client.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modele și texturi de convertit',
    fix_stream_convert = 'Acestea fac stream de modele sau texturi Legacy (YDR, YTD, YFT, YPT, YDD) din stream/ și nu au folderul stream_enhanced/. Convertește-le cu Alchemist de la Cfx.re și pune rezultatele în stream_enhanced/, păstrând stream/ pentru Legacy. Enhanced încarcă stream_enhanced/ în loc de stream/, așa că copiază și celelalte fișiere din stream ale resursei. Alchemist nu poate converti asset-uri cu escrow.',
    item_stream_convert = '{resource}: {count} din cele {total} fișiere din stream/',

    title_csharp = 'Resurse C#',
    fix_csharp = 'Pe Enhanced, Mono a fost înlocuit cu .NET, iar resursele C# se compilează cu SDK-ul .NET 10. Cere creatorului o versiune pentru Enhanced sau recompilează-le pe ale tale. Cfx.re a spus că va oferi mai multe detalii.',
    item_csharp = '{resource}: {count} fișier(e) .net.dll',

    title_mumble = 'Voce Mumble',
    fix_mumble = 'Mumble este învechit pe Enhanced și va fi eliminat. Natives-urile lui funcționează acolo doar cu setr sv_mumble true, care permite oricărui jucător să intre în orice canal de voce, iar voice targets se comportă ca și cum ar exista doar unul. Plănuiește trecerea la o resursă de voce care folosește noul API de voce al serverului.',
    item_mumble = '{resource}: {count} apel(uri) Mumble',

    title_voice_convars = 'Setări de voce eliminate',
    fix_voice_convars = 'Aceste convar-uri de voce Mumble nu mai există pe Enhanced (voice_inBitrate încă funcționează). Scoate-le din server.cfg la mutare și verifică dacă resursa ta de voce nu depinde de ele.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Apeluri NUI către alte resurse',
    fix_nui_cross = 'Pe Enhanced, modul strict pentru callback-urile NUI este pornit implicit: NUI-ul unei resurse poate apela doar propriile callback-uri NUI ale acelei resurse, așa că aceste apeluri vor fi blocate (HTTP 403). Soluția sigură este un export în cealaltă resursă și un callback propriu aici. Ca să testezi acum pe Legacy, adaugă nui_callback_strict_mode \'true\' în manifest.',
    item_nui_cross = '{resource} apelează {targets}',

    title_server_kvp = 'Stocarea cheie-valoare a serverului',
    fix_server_kvp = 'Baza de date cheie-valoare (KVP) a serverului trebuie migrată la mutare, cu kvdb-migrator de la Cfx.re (https://github.com/citizenfx/kvdb-migrator). Aceste resurse țin date în ea. Fă mai întâi o copie de rezervă.',
    item_server_kvp = '{resource}: {count} apel(uri) KVP',

    title_moo = 'Mod developer prin moo',
    fix_moo = '+set moo 31337 nu mai pornește modul developer. Folosește în schimb set sv_devMode true în server.cfg, și doar pe serverele de dezvoltare.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Date păstrate după ID-ul jucătorului',
    fix_player_ids = 'Pe Enhanced, server ID-ul unui jucător se eliberează când pleacă și poate ajunge la următorul jucător care intră. Aceste resurse păstrează date după ID-ul jucătorului și nu tratează niciodată playerDropped, așa că un jucător nou ar putea primi datele celui de dinainte. Verifică dacă fiecare le șterge când pleacă un jucător. Este o căutare după tipare, așa că unele pot fi în regulă.',
    item_player_ids = '{resource}: {count} loc(uri)',

    title_game_build = 'Build de joc forțat',
    fix_game_build = 'Enhanced suportă doar cel mai nou build al jocului, pe care îl încarcă atunci când sv_enforceGameBuild nu este setat (1 încarcă jocul de bază fără DLC-uri). Scoate-l la mutare și verifică tot ce avea nevoie de acest build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Folosește folderul stream',
    fix_stream_deprecated = 'stream/ încă funcționează pe Enhanced când nu există stream_enhanced/, dar este învechit. Niciunul dintre aceste fișiere nu este de un tip pe care Alchemist îl convertește. Testează-le pe Enhanced și întreabă creatorul dacă ceva pare greșit.',
    item_stream_deprecated = '{resource}: {total} fișier(e)',

    title_state_bags = 'Handlere de state bag',
    fix_state_bags = 'Pe Enhanced, handlerele de schimbare a state bag-urilor pornesc doar dacă entitatea există, iar valorile replicate sunt trimise doar când sunt setate explicit. Verifică dacă acestea se comportă în continuare cum te aștepți.',
    item_state_bags = '{resource}: {count} handler(e)',

    title_no_effect_convars = 'Setări fără efect',
    fix_no_effect_convars = 'Acestea nu fac nimic pe Enhanced sau au fost eliminate: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend și sv_netHttp2 pot fi scoase. sv_protectServerEntities nu a fost niciodată implementat; folosește sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends este învechit pe Enhanced. Setează în schimb tick rate-ul de sincronizare cu sv_syncTickRate (1 până la 120, implicit 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Verifică și de mână',
    manual = {
        'Fișierele serverului: descărcarea este cfx-server_win_x64 sau cfx-server-linux_x64, iar FXServer.exe se numește acum cfx-server.exe. Actualizează scripturile de pornire și scurtăturile.',
        'Serverele Windows au nevoie de Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp și endpoint_add_udp acceptă acum câte un singur endpoint fiecare.',
        'Modurile grafice nu pot fi folosite în early access: pure mode este mereu pornit.',
        'Comenzile la distanță trimit rezultatul înapoi doar cu PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) este oprită implicit și folosește portul 29200.',
        'Jucătorii au nevoie de GTA V Enhanced, iar serverul rulează doar cel mai nou build al jocului.',
    },
    docs = 'Tot ce se schimbă, de la Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Acest raport este un ghid, nu o garanție. Găsește problemele cunoscute citind fișiere și setări; nu îți poate rula resursele pe Enhanced. Testează pe un server Enhanced înainte de mutare.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Creat pe {date} pentru {server}.',
    summary = 'Au fost verificate {resources} resurse și setările serverului în {seconds} s.',
    summary_one = '{resource} verificată în {seconds} s.',
    counts = '{blocker} blocaje · {change} de schimbat · {review} de verificat · {note} note · nimic găsit în {clean} din {resources} resurse',
    all_clear = 'Nu s-a găsit nimic. Totuși, parcurge verificările pe care nu le poate face; sunt în fișierul raportului.',
    more = '...și încă {count}',
    unreadable = 'Nu s-au putut citi: {resources}',
    truncated = 'Au fost verificate doar primele 20.000 de fișiere din: {resources}',
    saved = 'Raportul complet, cu fișiere și numere de linie, este în {file}.',
    not_saved = 'Raportul nu a putut fi salvat în {file}.',
    hint_command = 'Scrie {command} în consola serverului pentru raportul complet.',
    checking = 'Se verifică resursele tale pentru FiveM pentru GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Gata. Raportul este în consola serverului și în {file}.',
    reply_busy = 'O verificare rulează deja. Încearcă din nou peste puțin timp.',
    reply_no_resource = 'Nu există nicio resursă numită {name}.',
    reply_no_permission = 'Nu ai permisiunea să folosești /{command}.',
}
