--[[
    Pigeon Enhanced Check: French (Français).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.fr = {
    -- Levels, most serious first.
    level_blocker = 'Bloquants',
    level_blocker_hint = 'ne fonctionneront pas sur Enhanced en l\'état',
    level_change = 'À modifier',
    level_change_hint = 'modifiez-les avant ou pendant le passage',
    level_review = 'À vérifier',
    level_review_hint = 'peuvent être concernés ; jetez-y un œil',
    level_note = 'Remarques',
    level_note_hint = 'bon à savoir ; rien à changer pour l\'instant',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Ressources sous escrow',
    fix_escrow = 'L\'asset escrow n\'est pas encore disponible sur FiveM pour GTAV Enhanced, donc ces ressources ne peuvent pas y tourner en l\'état. Demandez à chaque créateur une version Enhanced et gardez-les sur votre serveur Legacy en attendant. Les fichiers sous escrow sont chiffrés, donc les autres vérifications ne peuvent pas regarder à l\'intérieur.',
    item_escrow = '{resource}',

    title_builder = 'Builders de ressources',
    fix_builder = 'Les ressources ne peuvent plus être des builders sur Enhanced. Cela inclut les builders yarn et webpack de cfx-server-data : les ressources qui en dépendent doivent fournir leurs node_modules ou leur build déjà prêts. Demandez au créateur, ou faites le build vous-même avant de les envoyer.',
    item_builder = '{resource} : enregistre une tâche de build ({count})',

    title_onesync_off = 'OneSync est désactivé',
    fix_onesync_off = 'Enhanced n\'a pas de mode P2P : OneSync est toujours activé. Activez-le d\'abord ici avec set onesync on et testez vos ressources avec, pour que les problèmes apparaissent sur le serveur que vous connaissez déjà.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Mode legacy de OneSync',
    fix_onesync_legacy = 'Le mode legacy de OneSync (non big) n\'existe plus sur Enhanced ; le mode big est le seul, donc la connexion et la déconnexion d\'un joueur n\'atteignent les clients que si ce joueur est à portée. Passez ici à set onesync on et testez les ressources qui s\'attendent à ce que chaque joueur existe sur chaque client.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modèles et textures à convertir',
    fix_stream_convert = 'Ces ressources streament des modèles ou textures Legacy (YDR, YTD, YFT, YPT, YDD) depuis stream/ et n\'ont pas de dossier stream_enhanced/. Convertissez-les avec Alchemist de Cfx.re et placez le résultat dans stream_enhanced/, en gardant stream/ pour Legacy. Enhanced charge stream_enhanced/ au lieu de stream/, donc copiez aussi les autres fichiers streamés de la ressource. Alchemist ne peut pas convertir les assets sous escrow.',
    item_stream_convert = '{resource} : {count} des {total} fichiers de stream/',

    title_csharp = 'Ressources C#',
    fix_csharp = 'Mono a été remplacé par .NET sur Enhanced, et les ressources C# se compilent avec le SDK .NET 10. Demandez au créateur une version Enhanced, ou recompilez les vôtres. Cfx.re a indiqué qu\'il en dirait plus.',
    item_csharp = '{resource} : {count} fichier(s) .net.dll',

    title_mumble = 'Voix Mumble',
    fix_mumble = 'Mumble est obsolète sur Enhanced et sera supprimé. Ses natives n\'y fonctionnent qu\'avec setr sv_mumble true, qui permet à n\'importe quel joueur de rejoindre n\'importe quel canal vocal, et les voice targets se comportent comme s\'il n\'y en avait qu\'un. Prévoyez de passer à une ressource vocale qui utilise la nouvelle API vocale du serveur.',
    item_mumble = '{resource} : {count} appel(s) Mumble',

    title_voice_convars = 'Paramètres vocaux supprimés',
    fix_voice_convars = 'Ces convars vocaux Mumble n\'existent plus sur Enhanced (voice_inBitrate fonctionne toujours). Retirez-les de server.cfg lors du passage et vérifiez que votre ressource vocale n\'en dépend pas.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Appels NUI vers d\'autres ressources',
    fix_nui_cross = 'Le mode strict des callbacks NUI est activé par défaut sur Enhanced : la NUI d\'une ressource ne peut appeler que ses propres callbacks NUI, donc ces appels seront bloqués (HTTP 403). La solution sûre est un export dans l\'autre ressource et un callback propre ici. Pour tester dès maintenant sur Legacy, ajoutez nui_callback_strict_mode \'true\' au manifest.',
    item_nui_cross = '{resource} appelle {targets}',

    title_server_kvp = 'Stockage clé-valeur du serveur',
    fix_server_kvp = 'La base clé-valeur (KVP) du serveur doit être migrée lors du passage, avec kvdb-migrator de Cfx.re (https://github.com/citizenfx/kvdb-migrator). Ces ressources y stockent des données. Faites d\'abord une sauvegarde.',
    item_server_kvp = '{resource} : {count} appel(s) KVP',

    title_moo = 'Mode développeur via moo',
    fix_moo = '+set moo 31337 n\'active plus le mode développeur. Utilisez plutôt set sv_devMode true dans server.cfg, et seulement sur des serveurs de développement.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Données stockées par ID de joueur',
    fix_player_ids = 'Sur Enhanced, l\'ID serveur d\'un joueur est libéré quand il part et peut être attribué au prochain joueur qui se connecte. Ces ressources stockent des données par ID de joueur et ne gèrent jamais playerDropped, donc un nouveau joueur pourrait récupérer les données du précédent. Vérifiez que chacune les efface quand un joueur part. C\'est une recherche par motif, certaines peuvent donc être correctes.',
    item_player_ids = '{resource} : {count} endroit(s)',

    title_game_build = 'Build du jeu imposé',
    fix_game_build = 'Enhanced ne prend en charge que le build le plus récent du jeu, qu\'il charge quand sv_enforceGameBuild n\'est pas défini (1 charge le jeu de base sans DLC). Retirez-le lors du passage et vérifiez tout ce qui avait besoin de ce build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Utilise le dossier stream',
    fix_stream_deprecated = 'stream/ fonctionne toujours sur Enhanced en l\'absence de stream_enhanced/, mais il est obsolète. Aucun de ces fichiers n\'est d\'un type converti par Alchemist. Testez-les sur Enhanced et demandez au créateur si quelque chose semble anormal.',
    item_stream_deprecated = '{resource} : {total} fichier(s)',

    title_state_bags = 'Handlers de state bags',
    fix_state_bags = 'Sur Enhanced, les handlers de changement de state bags ne se déclenchent que si l\'entité existe, et les valeurs répliquées ne sont envoyées que si elles sont définies explicitement. Vérifiez que ceux-ci se comportent toujours comme prévu.',
    item_state_bags = '{resource} : {count} handler(s)',

    title_no_effect_convars = 'Paramètres sans effet',
    fix_no_effect_convars = 'Ceux-ci ne font rien sur Enhanced ou ont été supprimés : onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend et sv_netHttp2 peuvent être retirés. sv_protectServerEntities n\'a jamais été implémenté ; utilisez sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends est obsolète sur Enhanced. Réglez plutôt le tick rate de synchronisation avec sv_syncTickRate (1 à 120, 60 par défaut).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'À vérifier aussi à la main',
    manual = {
        'Fichiers serveur : le téléchargement est cfx-server_win_x64 ou cfx-server-linux_x64, et FXServer.exe s\'appelle désormais cfx-server.exe. Mettez à jour les scripts de démarrage et les raccourcis.',
        'Les serveurs Windows ont besoin de Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp et endpoint_add_udp n\'acceptent désormais qu\'un seul endpoint chacun.',
        'Les mods graphiques ne peuvent pas être utilisés pendant l\'accès anticipé : le pure mode est toujours activé.',
        'Les commandes à distance ne renvoient de sortie qu\'avec PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) est désactivée par défaut et utilise le port 29200.',
        'Les joueurs ont besoin de GTA V Enhanced, et le serveur ne tourne que sur le build le plus récent du jeu.',
    },
    docs = 'Tout ce qui change, par Cfx.re : https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Ce rapport est un guide, pas une garantie. Il trouve les problèmes connus en lisant les fichiers et les paramètres ; il ne peut pas lancer vos ressources sur Enhanced. Testez sur un serveur Enhanced avant de passer.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Fait le {date} pour {server}.',
    summary = '{resources} ressources et les paramètres du serveur vérifiés en {seconds} s.',
    summary_one = '{resource} vérifiée en {seconds} s.',
    counts = '{blocker} bloquants · {change} à modifier · {review} à vérifier · {note} remarques · rien trouvé dans {clean} des {resources} ressources',
    all_clear = 'Rien trouvé. Passez quand même en revue les vérifications qu\'il ne peut pas faire, listées dans le fichier du rapport.',
    more = '...et {count} de plus',
    unreadable = 'Illisibles : {resources}',
    truncated = 'Seuls les 20 000 premiers fichiers ont été vérifiés dans : {resources}',
    saved = 'Le rapport complet, avec fichiers et numéros de ligne, se trouve dans {file}.',
    not_saved = 'Le rapport n\'a pas pu être enregistré dans {file}.',
    hint_command = 'Tapez {command} dans la console du serveur pour le rapport complet.',
    checking = 'Vérification de vos ressources pour FiveM pour GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Terminé. Le rapport est dans la console du serveur et dans {file}.',
    reply_busy = 'Une vérification est déjà en cours. Réessayez dans un instant.',
    reply_no_resource = 'Il n\'y a aucune ressource nommée {name}.',
    reply_no_permission = 'Vous n\'avez pas la permission d\'utiliser /{command}.',
}
