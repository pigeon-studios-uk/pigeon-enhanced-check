--[[
    Pigeon Enhanced Check: Simplified Chinese (简体中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-cn'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales['zh-cn'] = {
    -- Levels, most serious first.
    level_blocker = '阻碍项',
    level_blocker_hint = '按现状无法在 Enhanced 上运行',
    level_change = '需要更改',
    level_change_hint = '在迁移前或迁移时更改',
    level_review = '需要检查',
    level_review_hint = '可能受影响；请看一看',
    level_note = '备注',
    level_note_hint = '值得了解；目前无需更改',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = '加密（escrow）资源',
    fix_escrow = 'GTAV Enhanced 版 FiveM 尚未实现 asset escrow，所以这些资源按现状无法在上面运行。请向每位作者询问 Enhanced 版本，在那之前先留在你的 Legacy 服务器上。escrow 文件是加密的，其他检查无法查看其中内容。',
    item_escrow = '{resource}',

    title_builder = '资源构建器',
    fix_builder = '在 Enhanced 上，资源不能再作为构建器。这也包括 cfx-server-data 里的 yarn 和 webpack 构建器：依赖它们的资源必须附带现成的 node_modules 或构建结果。请询问作者，或在上传前自行构建。',
    item_builder = '{resource}：注册了构建任务（{count}）',

    title_onesync_off = 'OneSync 已关闭',
    fix_onesync_off = 'Enhanced 没有 P2P 模式：OneSync 始终开启。请先在这里用 set onesync on 开启它，并用它测试你的资源，让问题在你熟悉的服务器上暴露出来。',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy 模式',
    fix_onesync_legacy = 'Enhanced 上已不再有 OneSync legacy（非 big）模式；big 模式是唯一模式，所以玩家的连接和断开只有在该玩家处于范围内时才会通知到客户端。请在这里改用 set onesync on，并测试那些假定每个玩家都存在于每个客户端上的资源。',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = '需要转换的模型和贴图',
    fix_stream_convert = '这些资源从 stream/ 流式加载 Legacy 模型或贴图（YDR、YTD、YFT、YPT、YDD），并且没有 stream_enhanced/ 文件夹。请用 Cfx.re 的 Alchemist 转换它们，把结果放进 stream_enhanced/，保留 stream/ 给 Legacy 使用。Enhanced 会加载 stream_enhanced/ 而不是 stream/，所以也要把资源的其他流式文件复制过去。Alchemist 无法转换 escrow 资产。',
    item_stream_convert = '{resource}：stream/ 中 {total} 个文件里的 {count} 个',

    title_csharp = 'C# 资源',
    fix_csharp = 'Enhanced 上 Mono 已被 .NET 取代，C# 资源需要用 .NET 10 SDK 构建。请向作者索要 Enhanced 版本，或重新构建你自己的资源。Cfx.re 表示会分享更多相关信息。',
    item_csharp = '{resource}：{count} 个 .net.dll 文件',

    title_mumble = 'Mumble 语音',
    fix_mumble = 'Mumble 在 Enhanced 上已弃用，并将被移除。它的 natives 在那里只有在 setr sv_mumble true 时才能用，而这会让任何玩家加入任何语音频道，voice targets 也会表现得好像只有一个。请计划迁移到使用新服务器语音 API 的语音资源。',
    item_mumble = '{resource}：{count} 次 Mumble 调用',

    title_voice_convars = '已移除的语音设置',
    fix_voice_convars = '这些 Mumble 语音 convar 在 Enhanced 上已不存在（voice_inBitrate 仍然可用）。迁移时把它们从 server.cfg 中删除，并检查你的语音资源不依赖它们。',
    item_voice_convars = '{convars}',

    title_nui_cross = '调用其他资源的 NUI',
    fix_nui_cross = 'Enhanced 默认开启 NUI 回调严格模式：资源的 NUI 只能调用该资源自己的 NUI 回调，所以这些调用会被阻止（HTTP 403）。稳妥的修复方法是在另一个资源中提供 export，并在这里使用自己的回调。如果想现在就在 Legacy 上测试，请在 manifest 中加入 nui_callback_strict_mode \'true\'。',
    item_nui_cross = '{resource} 调用了 {targets}',

    title_server_kvp = '服务器键值存储',
    fix_server_kvp = '迁移时需要用 Cfx.re 的 kvdb-migrator（https://github.com/citizenfx/kvdb-migrator）迁移服务器的键值（KVP）数据库。这些资源在其中保存数据。请先备份。',
    item_server_kvp = '{resource}：{count} 次 KVP 调用',

    title_moo = '通过 moo 开启开发者模式',
    fix_moo = '+set moo 31337 不再开启开发者模式。请改为在 server.cfg 中使用 set sv_devMode true，并且只在开发服务器上使用。',
    item_moo = 'moo: 31337',

    title_player_ids = '按玩家 ID 保存的数据',
    fix_player_ids = '在 Enhanced 上，玩家离开后其 server ID 会被释放，并可能分配给下一个加入的玩家。这些资源按玩家 ID 保存数据，却从不处理 playerDropped，所以新玩家可能会拿到上一个玩家的数据。请检查每个资源在玩家离开时都会清除数据。这是基于模式的搜索，所以有些可能没有问题。',
    item_player_ids = '{resource}：{count} 处',

    title_game_build = '强制游戏版本',
    fix_game_build = 'Enhanced 只支持最新的游戏版本，在未设置 sv_enforceGameBuild 时会加载它（1 会加载不含 DLC 的基础游戏）。迁移时请删除该设置，并检查所有需要这个版本的内容。',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = '使用 stream 文件夹',
    fix_stream_deprecated = '没有 stream_enhanced/ 时，stream/ 在 Enhanced 上仍可使用，但已弃用。这些文件都不是 Alchemist 会转换的类型。请在 Enhanced 上测试它们，如有异常请询问作者。',
    item_stream_deprecated = '{resource}：{total} 个文件',

    title_state_bags = 'State bag 处理器',
    fix_state_bags = '在 Enhanced 上，state bag 变更处理器只有在实体存在时才会触发，复制的值也只有在明确设置时才会发送。请检查这些是否仍按预期工作。',
    item_state_bags = '{resource}：{count} 个处理器',

    title_no_effect_convars = '无效的设置',
    fix_no_effect_convars = '这些设置在 Enhanced 上没有作用或已被移除：onesync_enableBeyond、sv_enhancedHostSupport、onesync_automaticResend 和 sv_netHttp2 可以删除。sv_protectServerEntities 从未实现；请使用 sv_entityLockdown。',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends 在 Enhanced 上已弃用。请改用 sv_syncTickRate 设置同步 tick rate（1 到 120，默认 60）。',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = '还需手动检查',
    manual = {
        '服务器文件：下载的是 cfx-server_win_x64 或 cfx-server-linux_x64，FXServer.exe 现在叫 cfx-server.exe。请更新启动脚本和快捷方式。',
        'Windows 服务器需要 Microsoft Visual C++ 2017 Redistributable。',
        'endpoint_add_tcp 和 endpoint_add_udp 现在每个只接受一个 endpoint。',
        '抢先体验期间无法使用画面 mod：pure mode 始终开启。',
        '远程命令只能通过 PrintRemoteCommandLog(message) 返回输出。',
        'Remote Console（DevCon）默认关闭，使用端口 29200。',
        '玩家需要 GTA V Enhanced，服务器只运行最新的游戏版本。',
    },
    docs = 'Cfx.re 列出的所有变更：https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = '本报告只是指南，不是保证。它通过读取文件和设置来发现已知问题；无法在 Enhanced 上运行你的资源。迁移前请在 Enhanced 服务器上测试。',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = '{date} 为 {server} 生成。',
    summary = '在 {seconds} 秒内检查了 {resources} 个资源和服务器设置。',
    summary_one = '在 {seconds} 秒内检查了 {resource}。',
    counts = '{blocker} 个阻碍项 · {change} 个需要更改 · {review} 个需要检查 · {note} 条备注 · {resources} 个资源中有 {clean} 个未发现问题',
    all_clear = '未发现问题。仍请完成它无法自动进行的检查，这些都列在报告文件中。',
    more = '...还有 {count} 个',
    unreadable = '无法读取：{resources}',
    truncated = '只检查了以下资源的前 20,000 个文件：{resources}',
    saved = '包含文件和行号的完整报告在 {file}。',
    not_saved = '无法把报告保存到 {file}。',
    hint_command = '在服务器控制台输入 {command} 查看完整报告。',
    checking = '正在检查你的资源是否适用于 GTAV Enhanced 版 FiveM...',

    -- Command replies.
    reply_console = '完成。报告在服务器控制台和 {file} 中。',
    reply_busy = '已有一项检查正在运行。请稍后再试。',
    reply_no_resource = '没有名为 {name} 的资源。',
    reply_no_permission = '你没有使用 /{command} 的权限。',
}
