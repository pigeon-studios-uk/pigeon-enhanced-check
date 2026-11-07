--[[
    Pigeon Enhanced Check: German (Deutsch).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'de'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.de = {
    -- Levels, most serious first.
    level_blocker = 'Blocker',
    level_blocker_hint = 'laufen so nicht auf Enhanced',
    level_change = 'Zu ändern',
    level_change_hint = 'vor oder beim Umzug ändern',
    level_review = 'Zu prüfen',
    level_review_hint = 'könnten betroffen sein; schau sie dir an',
    level_note = 'Hinweise',
    level_note_hint = 'gut zu wissen; noch muss nichts geändert werden',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Ressourcen mit Escrow',
    fix_escrow = 'Asset Escrow ist auf FiveM für GTAV Enhanced noch nicht umgesetzt, daher laufen diese Ressourcen dort so nicht. Frag jeden Ersteller nach einer Enhanced-Version und lass sie bis dahin auf deinem Legacy-Server. Escrow-Dateien sind verschlüsselt, daher können die anderen Prüfungen nicht hineinschauen.',
    item_escrow = '{resource}',

    title_builder = 'Ressourcen-Builder',
    fix_builder = 'Ressourcen können auf Enhanced keine Builder mehr sein. Das gilt auch für die yarn- und webpack-Builder aus cfx-server-data: Ressourcen, die darauf angewiesen sind, müssen ihre node_modules oder ihr Build-Ergebnis fertig mitliefern. Frag den Ersteller oder baue sie selbst, bevor du sie hochlädst.',
    item_builder = '{resource}: registriert eine Build-Aufgabe ({count})',

    title_onesync_off = 'OneSync ist aus',
    fix_onesync_off = 'Enhanced hat keinen P2P-Modus: OneSync ist immer an. Schalte es hier zuerst mit set onesync on ein und teste deine Ressourcen damit, damit Probleme auf dem Server auftauchen, den du schon kennst.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync-Legacy-Modus',
    fix_onesync_legacy = 'Der OneSync-Legacy-Modus (nicht big) existiert auf Enhanced nicht mehr; der Big-Modus ist der einzige, daher erreichen Verbinden und Trennen eines Spielers die Clients nur, wenn der Spieler in Reichweite ist. Stell hier auf set onesync on um und teste Ressourcen, die erwarten, dass jeder Spieler auf jedem Client existiert.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Zu konvertierende Modelle und Texturen',
    fix_stream_convert = 'Diese streamen Legacy-Modelle oder -Texturen (YDR, YTD, YFT, YPT, YDD) aus stream/ und haben keinen stream_enhanced/-Ordner. Konvertiere sie mit Alchemist von Cfx.re und lege die Ergebnisse in stream_enhanced/ ab; stream/ bleibt für Legacy. Enhanced lädt stream_enhanced/ statt stream/, also kopiere auch die anderen gestreamten Dateien der Ressource hinüber. Alchemist kann keine Escrow-Assets konvertieren.',
    item_stream_convert = '{resource}: {count} der {total} Dateien in stream/',

    title_csharp = 'C#-Ressourcen',
    fix_csharp = 'Mono wurde auf Enhanced durch .NET ersetzt, und C#-Ressourcen werden mit dem .NET 10 SDK gebaut. Frag den Ersteller nach einer Enhanced-Version oder baue deine eigenen neu. Cfx.re hat angekündigt, dazu mehr zu teilen.',
    item_csharp = '{resource}: {count} .net.dll-Datei(en)',

    title_mumble = 'Mumble-Voice',
    fix_mumble = 'Mumble ist auf Enhanced veraltet und wird entfernt. Seine Natives funktionieren dort nur mit setr sv_mumble true, womit jeder Spieler jedem Sprachkanal beitreten kann, und Voice Targets verhalten sich, als gäbe es nur eines. Plane den Umstieg auf eine Voice-Ressource, die die neue Server-Voice-API nutzt.',
    item_mumble = '{resource}: {count} Mumble-Aufruf(e)',

    title_voice_convars = 'Entfernte Voice-Einstellungen',
    fix_voice_convars = 'Diese Mumble-Voice-Convars gibt es auf Enhanced nicht mehr (voice_inBitrate funktioniert weiterhin). Nimm sie beim Umzug aus der server.cfg und prüfe, dass deine Voice-Ressource nicht davon abhängt.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI-Aufrufe an andere Ressourcen',
    fix_nui_cross = 'Der strikte Modus für NUI-Callbacks ist auf Enhanced standardmäßig an: Die NUI einer Ressource darf nur die eigenen NUI-Callbacks dieser Ressource aufrufen, daher werden diese Aufrufe blockiert (HTTP 403). Die sichere Lösung ist ein Export in der anderen Ressource und ein eigener Callback hier. Um es jetzt auf Legacy zu testen, füge nui_callback_strict_mode \'true\' zum Manifest hinzu.',
    item_nui_cross = '{resource} ruft {targets} auf',

    title_server_kvp = 'Key-Value-Speicher des Servers',
    fix_server_kvp = 'Die Key-Value-Datenbank (KVP) des Servers muss beim Umzug mit dem kvdb-migrator von Cfx.re migriert werden (https://github.com/citizenfx/kvdb-migrator). Diese Ressourcen speichern Daten darin. Mach zuerst ein Backup.',
    item_server_kvp = '{resource}: {count} KVP-Aufruf(e)',

    title_moo = 'Entwicklermodus über moo',
    fix_moo = '+set moo 31337 schaltet den Entwicklermodus nicht mehr ein. Nutze stattdessen set sv_devMode true in der server.cfg, und nur auf Entwicklungsservern.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Daten pro Spieler-ID',
    fix_player_ids = 'Auf Enhanced wird die Server-ID eines Spielers frei, wenn er geht, und kann an den nächsten Spieler gehen, der beitritt. Diese Ressourcen speichern Daten nach Spieler-ID und behandeln playerDropped nie, sodass ein neuer Spieler die Daten des vorherigen bekommen könnte. Prüfe bei jeder, ob sie die Daten löscht, wenn ein Spieler geht. Das ist eine Mustersuche, manche sind also vielleicht in Ordnung.',
    item_player_ids = '{resource}: {count} Stelle(n)',

    title_game_build = 'Erzwungener Spiel-Build',
    fix_game_build = 'Enhanced unterstützt nur den neuesten Spiel-Build, den es lädt, wenn sv_enforceGameBuild nicht gesetzt ist (1 lädt das Grundspiel ohne DLCs). Entferne es beim Umzug und prüfe alles, was diesen Build brauchte.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Nutzt den stream-Ordner',
    fix_stream_deprecated = 'stream/ funktioniert auf Enhanced weiterhin, wenn es kein stream_enhanced/ gibt, ist aber veraltet. Keine dieser Dateien ist ein Typ, den Alchemist konvertiert. Teste sie auf Enhanced und frag den Ersteller, wenn etwas falsch aussieht.',
    item_stream_deprecated = '{resource}: {total} Datei(en)',

    title_state_bags = 'State-Bag-Handler',
    fix_state_bags = 'Auf Enhanced werden State-Bag-Change-Handler nur ausgelöst, wenn die Entity existiert, und replizierte Werte werden nur gesendet, wenn sie ausdrücklich gesetzt werden. Prüfe, ob sich diese noch wie erwartet verhalten.',
    item_state_bags = '{resource}: {count} Handler',

    title_no_effect_convars = 'Einstellungen ohne Wirkung',
    fix_no_effect_convars = 'Diese bewirken auf Enhanced nichts oder wurden entfernt: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend und sv_netHttp2 können weg. sv_protectServerEntities wurde nie umgesetzt; nutze sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends ist auf Enhanced veraltet. Setze die Sync-Tickrate stattdessen mit sv_syncTickRate (1 bis 120, Standard 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Auch von Hand prüfen',
    manual = {
        'Serverdateien: Der Download ist cfx-server_win_x64 oder cfx-server-linux_x64, und FXServer.exe heißt jetzt cfx-server.exe. Passe Startskripte und Verknüpfungen an.',
        'Windows-Server brauchen das Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp und endpoint_add_udp nehmen jetzt jeweils nur einen Endpunkt.',
        'Grafik-Mods können im Early Access nicht genutzt werden: Pure Mode ist immer an.',
        'Remote-Befehle senden Ausgaben nur mit PrintRemoteCommandLog(message) zurück.',
        'Remote Console (DevCon) ist standardmäßig aus und nutzt Port 29200.',
        'Spieler brauchen GTA V Enhanced, und der Server läuft nur mit dem neuesten Spiel-Build.',
    },
    docs = 'Alles, was sich ändert, von Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Dieser Bericht ist eine Hilfe, keine Garantie. Er findet bekannte Probleme, indem er Dateien und Einstellungen liest; er kann deine Ressourcen nicht auf Enhanced ausführen. Teste auf einem Enhanced-Server, bevor du umziehst.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Erstellt am {date} für {server}.',
    summary = '{resources} Ressourcen und die Servereinstellungen in {seconds} s geprüft.',
    summary_one = '{resource} in {seconds} s geprüft.',
    counts = '{blocker} Blocker · {change} zu ändern · {review} zu prüfen · {note} Hinweise · nichts gefunden in {clean} von {resources} Ressourcen',
    all_clear = 'Nichts gefunden. Geh trotzdem die Prüfungen durch, die es nicht selbst machen kann; sie stehen in der Berichtsdatei.',
    more = '...und {count} weitere',
    unreadable = 'Konnte nicht gelesen werden: {resources}',
    truncated = 'Nur die ersten 20.000 Dateien wurden geprüft in: {resources}',
    saved = 'Der vollständige Bericht mit Dateien und Zeilennummern liegt in {file}.',
    not_saved = 'Der Bericht konnte nicht in {file} gespeichert werden.',
    hint_command = 'Gib {command} in der Serverkonsole ein, um den vollständigen Bericht zu sehen.',
    checking = 'Prüfe deine Ressourcen für FiveM für GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Fertig. Der Bericht steht in der Serverkonsole und in {file}.',
    reply_busy = 'Es läuft bereits eine Prüfung. Versuch es gleich noch einmal.',
    reply_no_resource = 'Es gibt keine Ressource namens {name}.',
    reply_no_permission = 'Du hast keine Berechtigung für /{command}.',
}
