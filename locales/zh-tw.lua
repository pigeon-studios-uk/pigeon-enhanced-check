--[[
    Pigeon Enhanced Check: Traditional Chinese (繁體中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-tw'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales['zh-tw'] = {
    -- Levels, most serious first.
    level_blocker = '阻礙項目',
    level_blocker_hint = '依現狀無法在 Enhanced 上執行',
    level_change = '需要變更',
    level_change_hint = '在遷移前或遷移時變更',
    level_review = '需要檢查',
    level_review_hint = '可能受影響；請看一看',
    level_note = '備註',
    level_note_hint = '值得了解；目前無需變更',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = '加密（escrow）資源',
    fix_escrow = 'GTAV Enhanced 版 FiveM 尚未實作 asset escrow，所以這些資源依現狀無法在上面執行。請向每位作者詢問 Enhanced 版本，在那之前先留在你的 Legacy 伺服器上。escrow 檔案是加密的，其他檢查無法查看其中內容。',
    item_escrow = '{resource}',

    title_builder = '資源建置器',
    fix_builder = '在 Enhanced 上，資源不能再作為建置器。這也包括 cfx-server-data 裡的 yarn 和 webpack 建置器：依賴它們的資源必須附帶現成的 node_modules 或建置結果。請詢問作者，或在上傳前自行建置。',
    item_builder = '{resource}：註冊了建置工作（{count}）',

    title_onesync_off = 'OneSync 已關閉',
    fix_onesync_off = 'Enhanced 沒有 P2P 模式：OneSync 一律開啟。請先在這裡用 set onesync on 開啟它，並用它測試你的資源，讓問題在你熟悉的伺服器上浮現。',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy 模式',
    fix_onesync_legacy = 'Enhanced 上已不再有 OneSync legacy（非 big）模式；big 模式是唯一模式，所以玩家的連線和離線只有在該玩家位於範圍內時才會通知到用戶端。請在這裡改用 set onesync on，並測試那些假定每個玩家都存在於每個用戶端上的資源。',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = '需要轉換的模型和貼圖',
    fix_stream_convert = '這些資源從 stream/ 串流 Legacy 模型或貼圖（YDR、YTD、YFT、YPT、YDD），而且沒有 stream_enhanced/ 資料夾。請用 Cfx.re 的 Alchemist 轉換它們，把結果放進 stream_enhanced/，保留 stream/ 給 Legacy 使用。Enhanced 會載入 stream_enhanced/ 而不是 stream/，所以也要把資源的其他串流檔案複製過去。Alchemist 無法轉換 escrow 資產。',
    item_stream_convert = '{resource}：stream/ 中 {total} 個檔案裡的 {count} 個',

    title_csharp = 'C# 資源',
    fix_csharp = 'Enhanced 上 Mono 已被 .NET 取代，C# 資源需要用 .NET 10 SDK 建置。請向作者索取 Enhanced 版本，或重新建置你自己的資源。Cfx.re 表示會分享更多相關資訊。',
    item_csharp = '{resource}：{count} 個 .net.dll 檔案',

    title_mumble = 'Mumble 語音',
    fix_mumble = 'Mumble 在 Enhanced 上已棄用，並將被移除。它的 natives 在那裡只有在 setr sv_mumble true 時才能用，而這會讓任何玩家加入任何語音頻道，voice targets 也會表現得好像只有一個。請規劃遷移到使用新伺服器語音 API 的語音資源。',
    item_mumble = '{resource}：{count} 次 Mumble 呼叫',

    title_voice_convars = '已移除的語音設定',
    fix_voice_convars = '這些 Mumble 語音 convar 在 Enhanced 上已不存在（voice_inBitrate 仍然可用）。遷移時把它們從 server.cfg 中刪除，並檢查你的語音資源不依賴它們。',
    item_voice_convars = '{convars}',

    title_nui_cross = '呼叫其他資源的 NUI',
    fix_nui_cross = 'Enhanced 預設開啟 NUI 回呼嚴格模式：資源的 NUI 只能呼叫該資源自己的 NUI 回呼，所以這些呼叫會被封鎖（HTTP 403）。穩妥的修正方式是在另一個資源中提供 export，並在這裡使用自己的回呼。如果想現在就在 Legacy 上測試，請在 manifest 中加入 nui_callback_strict_mode \'true\'。',
    item_nui_cross = '{resource} 呼叫了 {targets}',

    title_server_kvp = '伺服器鍵值儲存',
    fix_server_kvp = '遷移時需要用 Cfx.re 的 kvdb-migrator（https://github.com/citizenfx/kvdb-migrator）遷移伺服器的鍵值（KVP）資料庫。這些資源在其中儲存資料。請先備份。',
    item_server_kvp = '{resource}：{count} 次 KVP 呼叫',

    title_moo = '透過 moo 開啟開發者模式',
    fix_moo = '+set moo 31337 不再開啟開發者模式。請改為在 server.cfg 中使用 set sv_devMode true，而且只在開發伺服器上使用。',
    item_moo = 'moo: 31337',

    title_player_ids = '依玩家 ID 儲存的資料',
    fix_player_ids = '在 Enhanced 上，玩家離開後其 server ID 會被釋放，並可能分配給下一個加入的玩家。這些資源依玩家 ID 儲存資料，卻從不處理 playerDropped，所以新玩家可能會拿到上一個玩家的資料。請檢查每個資源在玩家離開時都會清除資料。這是依模式搜尋，所以有些可能沒有問題。',
    item_player_ids = '{resource}：{count} 處',

    title_game_build = '強制遊戲版本',
    fix_game_build = 'Enhanced 只支援最新的遊戲版本，在未設定 sv_enforceGameBuild 時會載入它（1 會載入不含 DLC 的基礎遊戲）。遷移時請刪除該設定，並檢查所有需要這個版本的內容。',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = '使用 stream 資料夾',
    fix_stream_deprecated = '沒有 stream_enhanced/ 時，stream/ 在 Enhanced 上仍可使用，但已棄用。這些檔案都不是 Alchemist 會轉換的類型。請在 Enhanced 上測試它們，如有異常請詢問作者。',
    item_stream_deprecated = '{resource}：{total} 個檔案',

    title_state_bags = 'State bag 處理器',
    fix_state_bags = '在 Enhanced 上，state bag 變更處理器只有在實體存在時才會觸發，複寫的值也只有在明確設定時才會傳送。請檢查這些是否仍依預期運作。',
    item_state_bags = '{resource}：{count} 個處理器',

    title_no_effect_convars = '無效的設定',
    fix_no_effect_convars = '這些設定在 Enhanced 上沒有作用或已被移除：onesync_enableBeyond、sv_enhancedHostSupport、onesync_automaticResend 和 sv_netHttp2 可以刪除。sv_protectServerEntities 從未實作；請使用 sv_entityLockdown。',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends 在 Enhanced 上已棄用。請改用 sv_syncTickRate 設定同步 tick rate（1 到 120，預設 60）。',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = '還需手動檢查',
    manual = {
        '伺服器檔案：下載的是 cfx-server_win_x64 或 cfx-server-linux_x64，FXServer.exe 現在叫 cfx-server.exe。請更新啟動指令碼和捷徑。',
        'Windows 伺服器需要 Microsoft Visual C++ 2017 Redistributable。',
        'endpoint_add_tcp 和 endpoint_add_udp 現在每個只接受一個 endpoint。',
        '搶先體驗期間無法使用畫面 mod：pure mode 一律開啟。',
        '遠端指令只能透過 PrintRemoteCommandLog(message) 傳回輸出。',
        'Remote Console（DevCon）預設關閉，使用連接埠 29200。',
        '玩家需要 GTA V Enhanced，伺服器只執行最新的遊戲版本。',
    },
    docs = 'Cfx.re 列出的所有變更：https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = '本報告只是指南，不是保證。它透過讀取檔案和設定來找出已知問題；無法在 Enhanced 上執行你的資源。遷移前請在 Enhanced 伺服器上測試。',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = '{date} 為 {server} 產生。',
    summary = '在 {seconds} 秒內檢查了 {resources} 個資源和伺服器設定。',
    summary_one = '在 {seconds} 秒內檢查了 {resource}。',
    counts = '{blocker} 個阻礙項目 · {change} 個需要變更 · {review} 個需要檢查 · {note} 則備註 · {resources} 個資源中有 {clean} 個未發現問題',
    all_clear = '未發現問題。仍請完成它無法自動進行的檢查，這些都列在報告檔案中。',
    more = '...還有 {count} 個',
    unreadable = '無法讀取：{resources}',
    truncated = '只檢查了以下資源的前 20,000 個檔案：{resources}',
    saved = '包含檔案和行號的完整報告在 {file}。',
    not_saved = '無法把報告儲存到 {file}。',
    hint_command = '在伺服器主控台輸入 {command} 查看完整報告。',
    checking = '正在檢查你的資源是否適用於 GTAV Enhanced 版 FiveM...',

    -- Command replies.
    reply_console = '完成。報告在伺服器主控台和 {file} 中。',
    reply_busy = '已有一項檢查正在執行。請稍後再試。',
    reply_no_resource = '沒有名為 {name} 的資源。',
    reply_no_permission = '你沒有使用 /{command} 的權限。',
}
