--[[
    Pigeon Enhanced Check: Spanish (Español).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'es'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.es = {
    -- Levels, most serious first.
    level_blocker = 'Bloqueantes',
    level_blocker_hint = 'no funcionarán en Enhanced tal como están',
    level_change = 'A cambiar',
    level_change_hint = 'cámbialos antes o durante el cambio',
    level_review = 'A revisar',
    level_review_hint = 'podrían verse afectados; échales un vistazo',
    level_note = 'Notas',
    level_note_hint = 'conviene saberlo; todavía no hay que cambiar nada',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Recursos con escrow',
    fix_escrow = 'El asset escrow aún no está implementado en FiveM para GTAV Enhanced, así que estos no pueden funcionar ahí tal como están. Pregunta a cada creador por una versión para Enhanced y mantenlos en tu servidor Legacy hasta entonces. Los archivos con escrow están cifrados, así que las demás comprobaciones no pueden mirar dentro.',
    item_escrow = '{resource}',

    title_builder = 'Builders de recursos',
    fix_builder = 'En Enhanced los recursos ya no pueden ser builders. Esto incluye los builders de yarn y webpack de cfx-server-data: los recursos que dependen de ellos tienen que incluir sus node_modules o el resultado del build ya preparados. Pregunta al creador o constrúyelos tú antes de subirlos.',
    item_builder = '{resource}: registra una tarea de build ({count})',

    title_onesync_off = 'OneSync está desactivado',
    fix_onesync_off = 'Enhanced no tiene modo P2P: OneSync siempre está activado. Actívalo aquí primero con set onesync on y prueba tus recursos con él, para que los problemas aparezcan en el servidor que ya conoces.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Modo legacy de OneSync',
    fix_onesync_legacy = 'El modo legacy de OneSync (no big) ya no existe en Enhanced; el modo big es el único, así que la conexión y desconexión de un jugador solo llega a los clientes cuando ese jugador está cerca. Cambia aquí a set onesync on y prueba los recursos que esperan que cada jugador exista en cada cliente.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modelos y texturas a convertir',
    fix_stream_convert = 'Estos hacen stream de modelos o texturas de Legacy (YDR, YTD, YFT, YPT, YDD) desde stream/ y no tienen carpeta stream_enhanced/. Conviértelos con Alchemist de Cfx.re y pon el resultado en stream_enhanced/, manteniendo stream/ para Legacy. Enhanced carga stream_enhanced/ en lugar de stream/, así que copia también los demás archivos en stream del recurso. Alchemist no puede convertir assets con escrow.',
    item_stream_convert = '{resource}: {count} de los {total} archivos de stream/',

    title_csharp = 'Recursos en C#',
    fix_csharp = 'En Enhanced, Mono se ha sustituido por .NET y los recursos en C# se compilan con el SDK de .NET 10. Pide al creador una versión para Enhanced o vuelve a compilar los tuyos. Cfx.re ha dicho que compartirá más sobre esto.',
    item_csharp = '{resource}: {count} archivo(s) .net.dll',

    title_mumble = 'Voz de Mumble',
    fix_mumble = 'Mumble está obsoleto en Enhanced y se eliminará. Sus natives solo funcionan ahí con setr sv_mumble true, que deja a cualquier jugador entrar en cualquier canal de voz, y los voice targets se comportan como si solo hubiera uno. Planea pasar a un recurso de voz que use la nueva API de voz del servidor.',
    item_mumble = '{resource}: {count} llamada(s) a Mumble',

    title_voice_convars = 'Ajustes de voz eliminados',
    fix_voice_convars = 'Estos convars de voz de Mumble ya no existen en Enhanced (voice_inBitrate sigue funcionando). Quítalos de server.cfg al cambiar y comprueba que tu recurso de voz no depende de ellos.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Llamadas NUI a otros recursos',
    fix_nui_cross = 'En Enhanced el modo estricto de callbacks NUI está activado por defecto: la NUI de un recurso solo puede llamar a los callbacks NUI de ese mismo recurso, así que estas llamadas se bloquearán (HTTP 403). La solución segura es un export en el otro recurso y un callback propio aquí. Para probarlo ya en Legacy, añade nui_callback_strict_mode \'true\' al manifest.',
    item_nui_cross = '{resource} llama a {targets}',

    title_server_kvp = 'Almacenamiento clave-valor del servidor',
    fix_server_kvp = 'La base de datos clave-valor (KVP) del servidor debe migrarse al cambiar, con kvdb-migrator de Cfx.re (https://github.com/citizenfx/kvdb-migrator). Estos recursos guardan datos en ella. Haz una copia de seguridad primero.',
    item_server_kvp = '{resource}: {count} llamada(s) KVP',

    title_moo = 'Modo desarrollador con moo',
    fix_moo = '+set moo 31337 ya no activa el modo desarrollador. Usa set sv_devMode true en server.cfg en su lugar, y solo en servidores de desarrollo.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Datos guardados por ID de jugador',
    fix_player_ids = 'En Enhanced, el ID de servidor de un jugador se libera cuando se va y puede pasar al siguiente jugador que entre. Estos recursos guardan datos por ID de jugador y nunca gestionan playerDropped, así que un jugador nuevo podría recibir los datos del anterior. Comprueba que cada uno los borra cuando un jugador se va. Es una búsqueda por patrones, así que algunos pueden estar bien.',
    item_player_ids = '{resource}: {count} sitio(s)',

    title_game_build = 'Build del juego forzada',
    fix_game_build = 'Enhanced solo admite la build más reciente del juego, que carga cuando sv_enforceGameBuild no está puesto (1 carga el juego base sin DLC). Quítalo al cambiar y revisa todo lo que necesitaba esta build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Usa la carpeta stream',
    fix_stream_deprecated = 'stream/ sigue funcionando en Enhanced cuando no hay stream_enhanced/, pero está obsoleta. Ninguno de estos archivos es de un tipo que Alchemist convierta. Pruébalos en Enhanced y pregunta al creador si algo se ve mal.',
    item_stream_deprecated = '{resource}: {total} archivo(s)',

    title_state_bags = 'Handlers de state bags',
    fix_state_bags = 'En Enhanced, los handlers de cambios de state bags solo se disparan si la entidad existe, y los valores replicados solo se envían cuando se ponen explícitamente. Comprueba que estos siguen comportándose como esperas.',
    item_state_bags = '{resource}: {count} handler(s)',

    title_no_effect_convars = 'Ajustes que no hacen nada',
    fix_no_effect_convars = 'Estos no hacen nada en Enhanced o se han eliminado: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend y sv_netHttp2 pueden quitarse. sv_protectServerEntities nunca se implementó; usa sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends está obsoleto en Enhanced. Ajusta el tick rate de sincronización con sv_syncTickRate (1 a 120, por defecto 60) en su lugar.',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Revisa también a mano',
    manual = {
        'Archivos del servidor: la descarga es cfx-server_win_x64 o cfx-server-linux_x64, y FXServer.exe ahora es cfx-server.exe. Actualiza los scripts de inicio y los accesos directos.',
        'Los servidores Windows necesitan Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp y endpoint_add_udp ahora aceptan un solo endpoint cada uno.',
        'No se pueden usar mods gráficos durante el acceso anticipado: el pure mode siempre está activado.',
        'Los comandos remotos solo devuelven salida con PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) está desactivada por defecto y usa el puerto 29200.',
        'Los jugadores necesitan GTA V Enhanced, y el servidor solo ejecuta la build más reciente del juego.',
    },
    docs = 'Todo lo que cambia, de Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Este informe es una guía, no una garantía. Encuentra problemas conocidos leyendo archivos y ajustes; no puede ejecutar tus recursos en Enhanced. Prueba en un servidor Enhanced antes de cambiar.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Hecho el {date} para {server}.',
    summary = 'Se revisaron {resources} recursos y los ajustes del servidor en {seconds} s.',
    summary_one = 'Se revisó {resource} en {seconds} s.',
    counts = '{blocker} bloqueantes · {change} a cambiar · {review} a revisar · {note} notas · nada encontrado en {clean} de {resources} recursos',
    all_clear = 'No se encontró nada. Aun así, repasa las comprobaciones que no puede hacer, que están en el archivo del informe.',
    more = '...y {count} más',
    unreadable = 'No se pudieron leer: {resources}',
    truncated = 'Solo se revisaron los primeros 20.000 archivos en: {resources}',
    saved = 'El informe completo, con archivos y números de línea, está en {file}.',
    not_saved = 'No se pudo guardar el informe en {file}.',
    hint_command = 'Escribe {command} en la consola del servidor para ver el informe completo.',
    checking = 'Revisando tus recursos para FiveM para GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Listo. El informe está en la consola del servidor y en {file}.',
    reply_busy = 'Ya hay una revisión en marcha. Inténtalo de nuevo en un momento.',
    reply_no_resource = 'No hay ningún recurso llamado {name}.',
    reply_no_permission = 'No tienes permiso para usar /{command}.',
}
