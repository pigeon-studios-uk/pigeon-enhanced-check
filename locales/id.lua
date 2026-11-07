--[[
    Pigeon Enhanced Check: Indonesian (Bahasa Indonesia).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'id'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.id = {
    -- Levels, most serious first.
    level_blocker = 'Penghalang',
    level_blocker_hint = 'tidak akan berjalan di Enhanced seperti sekarang',
    level_change = 'Perlu diubah',
    level_change_hint = 'ubah sebelum atau saat pindah',
    level_review = 'Perlu ditinjau',
    level_review_hint = 'mungkin terdampak; coba periksa',
    level_note = 'Catatan',
    level_note_hint = 'baik diketahui; belum ada yang perlu diubah',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Resource dengan escrow',
    fix_escrow = 'Asset escrow belum tersedia di FiveM untuk GTAV Enhanced, jadi resource ini tidak bisa berjalan di sana seperti sekarang. Tanyakan versi Enhanced ke setiap pembuat, dan biarkan di server Legacy kamu sampai saat itu. File escrow terenkripsi, jadi pemeriksaan lain tidak bisa melihat isinya.',
    item_escrow = '{resource}',

    title_builder = 'Builder resource',
    fix_builder = 'Resource tidak bisa lagi menjadi builder di Enhanced. Ini termasuk builder yarn dan webpack dari cfx-server-data: resource yang bergantung padanya harus menyertakan node_modules atau hasil build yang sudah jadi. Tanyakan ke pembuat, atau build sendiri sebelum diunggah.',
    item_builder = '{resource}: mendaftarkan tugas build ({count})',

    title_onesync_off = 'OneSync mati',
    fix_onesync_off = 'Enhanced tidak punya mode P2P: OneSync selalu menyala. Nyalakan dulu di sini dengan set onesync on dan uji resource kamu dengannya, supaya masalah muncul di server yang sudah kamu kenal.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Mode legacy OneSync',
    fix_onesync_legacy = 'Mode legacy OneSync (bukan big) tidak ada lagi di Enhanced; mode big satu-satunya, jadi saat pemain masuk dan keluar, info itu hanya sampai ke klien jika pemain berada dalam jangkauan. Ganti ke set onesync on di sini dan uji resource yang menganggap setiap pemain ada di setiap klien.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Model dan tekstur yang perlu dikonversi',
    fix_stream_convert = 'Resource ini men-stream model atau tekstur Legacy (YDR, YTD, YFT, YPT, YDD) dari stream/ dan tidak punya folder stream_enhanced/. Konversikan dengan Alchemist dari Cfx.re dan taruh hasilnya di stream_enhanced/, simpan stream/ untuk Legacy. Enhanced memuat stream_enhanced/ alih-alih stream/, jadi salin juga file stream lain milik resource itu. Alchemist tidak bisa mengonversi asset escrow.',
    item_stream_convert = '{resource}: {count} dari {total} file di stream/',

    title_csharp = 'Resource C#',
    fix_csharp = 'Mono diganti .NET di Enhanced, dan resource C# dibuild dengan .NET 10 SDK. Minta versi Enhanced ke pembuatnya, atau build ulang milikmu sendiri. Cfx.re menyatakan akan membagikan info lebih lanjut.',
    item_csharp = '{resource}: {count} file .net.dll',

    title_mumble = 'Suara Mumble',
    fix_mumble = 'Mumble sudah usang di Enhanced dan akan dihapus. Native-nya hanya berfungsi di sana dengan setr sv_mumble true, yang membuat pemain mana pun bisa masuk ke saluran suara mana pun, dan voice target bertingkah seolah hanya ada satu. Rencanakan pindah ke resource suara yang memakai API suara server yang baru.',
    item_mumble = '{resource}: {count} panggilan Mumble',

    title_voice_convars = 'Pengaturan suara yang dihapus',
    fix_voice_convars = 'Convar suara Mumble ini tidak ada lagi di Enhanced (voice_inBitrate masih berfungsi). Hapus dari server.cfg saat pindah, dan pastikan resource suaramu tidak bergantung padanya.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Panggilan NUI ke resource lain',
    fix_nui_cross = 'Mode ketat callback NUI menyala secara bawaan di Enhanced: NUI sebuah resource hanya boleh memanggil callback NUI milik resource itu sendiri, jadi panggilan ini akan diblokir (HTTP 403). Perbaikan yang aman adalah export di resource lain dan callback sendiri di sini. Untuk menguji di Legacy sekarang, tambahkan nui_callback_strict_mode \'true\' ke manifest.',
    item_nui_cross = '{resource} memanggil {targets}',

    title_server_kvp = 'Penyimpanan key-value server',
    fix_server_kvp = 'Database key-value (KVP) server harus dimigrasi saat pindah, dengan kvdb-migrator dari Cfx.re (https://github.com/citizenfx/kvdb-migrator). Resource ini menyimpan data di dalamnya. Buat cadangan dulu.',
    item_server_kvp = '{resource}: {count} panggilan KVP',

    title_moo = 'Mode developer lewat moo',
    fix_moo = '+set moo 31337 tidak lagi menyalakan mode developer. Pakai set sv_devMode true di server.cfg sebagai gantinya, dan hanya di server pengembangan.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Data yang disimpan per ID pemain',
    fix_player_ids = 'Di Enhanced, server ID pemain dilepas saat mereka keluar dan bisa diberikan ke pemain berikutnya yang masuk. Resource ini menyimpan data berdasarkan ID pemain dan tidak pernah menangani playerDropped, jadi pemain baru bisa mendapat data pemain sebelumnya. Pastikan masing-masing menghapusnya saat pemain keluar. Ini pencarian pola, jadi sebagian mungkin baik-baik saja.',
    item_player_ids = '{resource}: {count} tempat',

    title_game_build = 'Build game yang dipaksa',
    fix_game_build = 'Enhanced hanya mendukung build game terbaru, yang dimuat saat sv_enforceGameBuild tidak diatur (1 memuat game dasar tanpa DLC). Hapus saat pindah, dan periksa apa pun yang membutuhkan build ini.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Memakai folder stream',
    fix_stream_deprecated = 'stream/ masih berfungsi di Enhanced jika tidak ada stream_enhanced/, tapi sudah usang. Tidak ada file ini yang termasuk jenis yang dikonversi Alchemist. Uji di Enhanced, dan tanyakan ke pembuatnya jika ada yang terlihat salah.',
    item_stream_deprecated = '{resource}: {total} file',

    title_state_bags = 'Handler state bag',
    fix_state_bags = 'Di Enhanced, handler perubahan state bag hanya berjalan jika entitasnya ada, dan nilai yang direplikasi hanya dikirim saat diatur secara eksplisit. Pastikan semuanya masih berperilaku seperti yang diharapkan.',
    item_state_bags = '{resource}: {count} handler',

    title_no_effect_convars = 'Pengaturan yang tidak berpengaruh',
    fix_no_effect_convars = 'Pengaturan ini tidak melakukan apa pun di Enhanced, atau sudah dihapus: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend, dan sv_netHttp2 bisa dibuang. sv_protectServerEntities tidak pernah diimplementasikan; gunakan sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends sudah usang di Enhanced. Atur tick rate sinkronisasi dengan sv_syncTickRate (1 sampai 120, bawaan 60) sebagai gantinya.',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Periksa juga secara manual',
    manual = {
        'File server: unduhannya cfx-server_win_x64 atau cfx-server-linux_x64, dan FXServer.exe sekarang cfx-server.exe. Perbarui skrip start dan shortcut.',
        'Server Windows memerlukan Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp dan endpoint_add_udp sekarang masing-masing hanya menerima satu endpoint.',
        'Mod grafis tidak bisa dipakai selama early access: pure mode selalu menyala.',
        'Perintah jarak jauh hanya mengirim output kembali lewat PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) mati secara bawaan, dan memakai port 29200.',
        'Pemain memerlukan GTA V Enhanced, dan server hanya menjalankan build game terbaru.',
    },
    docs = 'Semua yang berubah, dari Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Laporan ini panduan, bukan jaminan. Laporan ini menemukan masalah yang diketahui dengan membaca file dan pengaturan; ia tidak bisa menjalankan resource kamu di Enhanced. Uji di server Enhanced sebelum pindah.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Dibuat {date} untuk {server}.',
    summary = 'Memeriksa {resources} resource dan pengaturan server dalam {seconds} dtk.',
    summary_one = 'Memeriksa {resource} dalam {seconds} dtk.',
    counts = '{blocker} penghalang · {change} perlu diubah · {review} perlu ditinjau · {note} catatan · tidak ada temuan di {clean} dari {resources} resource',
    all_clear = 'Tidak ada temuan. Tetap periksa hal-hal yang tidak bisa ia periksa, yang tercantum di file laporan.',
    more = '...dan {count} lainnya',
    unreadable = 'Tidak bisa dibaca: {resources}',
    truncated = 'Hanya 20.000 file pertama yang diperiksa di: {resources}',
    saved = 'Laporan lengkap, dengan file dan nomor baris, ada di {file}.',
    not_saved = 'Laporan tidak bisa disimpan ke {file}.',
    hint_command = 'Ketik {command} di konsol server untuk laporan lengkap.',
    checking = 'Memeriksa resource kamu untuk FiveM untuk GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Selesai. Laporan ada di konsol server dan di {file}.',
    reply_busy = 'Pemeriksaan sedang berjalan. Coba lagi sebentar lagi.',
    reply_no_resource = 'Tidak ada resource bernama {name}.',
    reply_no_permission = 'Kamu tidak punya izin untuk memakai /{command}.',
}
