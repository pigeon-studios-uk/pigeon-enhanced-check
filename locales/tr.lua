--[[
    Pigeon Enhanced Check: Turkish (Türkçe).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'tr'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.tr = {
    -- Levels, most serious first.
    level_blocker = 'Engeller',
    level_blocker_hint = 'şu hâlleriyle Enhanced üzerinde çalışmaz',
    level_change = 'Değiştirilecekler',
    level_change_hint = 'geçişten önce veya geçiş sırasında değiştir',
    level_review = 'Gözden geçirilecekler',
    level_review_hint = 'etkilenebilir; bir göz at',
    level_note = 'Notlar',
    level_note_hint = 'bilmekte fayda var; henüz bir şey değişmesi gerekmiyor',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Escrow\'lu kaynaklar',
    fix_escrow = 'Asset escrow, GTAV Enhanced için FiveM\'de henüz uygulanmadı, bu yüzden bunlar orada şu hâlleriyle çalışamaz. Her yapımcıdan bir Enhanced sürümü iste ve o zamana kadar Legacy sunucunda tut. Escrow\'lu dosyalar şifreli olduğundan diğer kontroller içlerine bakamaz.',
    item_escrow = '{resource}',

    title_builder = 'Kaynak builder\'ları',
    fix_builder = 'Enhanced\'da kaynaklar artık builder olamaz. Buna cfx-server-data\'daki yarn ve webpack builder\'ları da dahil: bunlara dayanan kaynakların node_modules klasörünü veya build çıktısını hazır olarak getirmesi gerekir. Yapımcıya sor ya da yüklemeden önce kendin build et.',
    item_builder = '{resource}: bir build görevi kaydediyor ({count})',

    title_onesync_off = 'OneSync kapalı',
    fix_onesync_off = 'Enhanced\'da P2P modu yok: OneSync her zaman açık. Önce burada set onesync on ile aç ve kaynaklarını onunla test et, böylece sorunlar zaten tanıdığın sunucuda ortaya çıksın.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSync legacy modu',
    fix_onesync_legacy = 'OneSync legacy (big olmayan) modu artık Enhanced\'da yok; tek mod big, bu yüzden bir oyuncunun bağlanması ve ayrılması istemcilere yalnızca oyuncu menzildeyken ulaşır. Burada set onesync on moduna geç ve her oyuncunun her istemcide var olmasını bekleyen kaynakları test et.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Dönüştürülecek modeller ve dokular',
    fix_stream_convert = 'Bunlar stream/ klasöründen Legacy modelleri veya dokuları (YDR, YTD, YFT, YPT, YDD) stream ediyor ve stream_enhanced/ klasörleri yok. Bunları Cfx.re\'nin Alchemist aracıyla dönüştür ve sonuçları stream_enhanced/ içine koy, stream/ klasörünü Legacy için tut. Enhanced, stream/ yerine stream_enhanced/ yükler, bu yüzden kaynağın diğer stream dosyalarını da kopyala. Alchemist escrow\'lu asset\'leri dönüştüremez.',
    item_stream_convert = '{resource}: stream/ içindeki {total} dosyadan {count} tanesi',

    title_csharp = 'C# kaynakları',
    fix_csharp = 'Enhanced\'da Mono\'nun yerini .NET aldı ve C# kaynakları .NET 10 SDK ile build ediliyor. Yapımcıdan bir Enhanced sürümü iste ya da kendi kaynaklarını yeniden build et. Cfx.re bu konuda daha fazla bilgi paylaşacağını söyledi.',
    item_csharp = '{resource}: {count} .net.dll dosyası',

    title_mumble = 'Mumble sesi',
    fix_mumble = 'Mumble, Enhanced\'da kullanımdan kalktı ve kaldırılacak. Native\'leri orada yalnızca setr sv_mumble true ile çalışır; bu da her oyuncunun her ses kanalına girmesine izin verir ve voice target\'lar yalnızca bir tane varmış gibi davranır. Yeni sunucu ses API\'sini kullanan bir ses kaynağına geçişi planla.',
    item_mumble = '{resource}: {count} Mumble çağrısı',

    title_voice_convars = 'Kaldırılan ses ayarları',
    fix_voice_convars = 'Bu Mumble ses convar\'ları artık Enhanced\'da yok (voice_inBitrate hâlâ çalışıyor). Geçişte bunları server.cfg\'den çıkar ve ses kaynağının bunlara bağlı olmadığını kontrol et.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Diğer kaynaklara NUI çağrıları',
    fix_nui_cross = 'Enhanced\'da NUI callback katı modu varsayılan olarak açık: bir kaynağın NUI\'si yalnızca o kaynağın kendi NUI callback\'lerini çağırabilir, bu yüzden bu çağrılar engellenecek (HTTP 403). Güvenli çözüm, diğer kaynakta bir export ve burada kendi callback\'idir. Şimdi Legacy\'de test etmek için manifest\'e nui_callback_strict_mode \'true\' ekle.',
    item_nui_cross = '{resource}, {targets} çağırıyor',

    title_server_kvp = 'Sunucu anahtar-değer depolaması',
    fix_server_kvp = 'Sunucunun anahtar-değer (KVP) veritabanı geçişte Cfx.re\'nin kvdb-migrator aracıyla taşınmalı (https://github.com/citizenfx/kvdb-migrator). Bu kaynaklar veriyi orada tutuyor. Önce yedek al.',
    item_server_kvp = '{resource}: {count} KVP çağrısı',

    title_moo = 'moo ile geliştirici modu',
    fix_moo = '+set moo 31337 artık geliştirici modunu açmıyor. Bunun yerine server.cfg\'de set sv_devMode true kullan, ve yalnızca geliştirme sunucularında.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Oyuncu ID\'sine göre tutulan veri',
    fix_player_ids = 'Enhanced\'da bir oyuncunun server ID\'si ayrıldığında serbest kalır ve sonra katılan oyuncuya verilebilir. Bu kaynaklar veriyi oyuncu ID\'sine göre tutuyor ve playerDropped olayını hiç işlemiyor, bu yüzden yeni bir oyuncu öncekinin verisini alabilir. Her birinin oyuncu ayrıldığında veriyi temizlediğini kontrol et. Bu bir kalıp araması, bu yüzden bazıları sorunsuz olabilir.',
    item_player_ids = '{resource}: {count} yer',

    title_game_build = 'Zorlanan oyun build\'i',
    fix_game_build = 'Enhanced yalnızca en yeni oyun build\'ini destekler ve sv_enforceGameBuild ayarlı değilken onu yükler (1, DLC\'siz temel oyunu yükler). Geçişte bunu kaldır ve bu build\'e ihtiyaç duyan her şeyi kontrol et.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'stream klasörünü kullanıyor',
    fix_stream_deprecated = 'stream_enhanced/ yoksa stream/ Enhanced\'da hâlâ çalışır, ama kullanımdan kalktı. Bu dosyaların hiçbiri Alchemist\'in dönüştürdüğü türden değil. Bunları Enhanced\'da test et ve bir şey yanlış görünürse yapımcıya sor.',
    item_stream_deprecated = '{resource}: {total} dosya',

    title_state_bags = 'State bag handler\'ları',
    fix_state_bags = 'Enhanced\'da state bag değişiklik handler\'ları yalnızca entity varsa tetiklenir ve çoğaltılan değerler yalnızca açıkça ayarlandığında gönderilir. Bunların hâlâ beklendiği gibi davrandığını kontrol et.',
    item_state_bags = '{resource}: {count} handler',

    title_no_effect_convars = 'Etkisi olmayan ayarlar',
    fix_no_effect_convars = 'Bunlar Enhanced\'da hiçbir şey yapmıyor ya da kaldırıldı: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend ve sv_netHttp2 çıkarılabilir. sv_protectServerEntities hiç uygulanmadı; sv_entityLockdown kullan.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends, Enhanced\'da kullanımdan kalktı. Bunun yerine senkronizasyon tick rate\'ini sv_syncTickRate ile ayarla (1 ile 120 arası, varsayılan 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Elle de kontrol et',
    manual = {
        'Sunucu dosyaları: indirilecek dosya cfx-server_win_x64 veya cfx-server-linux_x64, ve FXServer.exe artık cfx-server.exe. Başlatma betiklerini ve kısayolları güncelle.',
        'Windows sunucularının Microsoft Visual C++ 2017 Redistributable\'a ihtiyacı var.',
        'endpoint_add_tcp ve endpoint_add_udp artık her biri tek bir endpoint alıyor.',
        'Erken erişim süresince grafik modları kullanılamaz: pure mode her zaman açık.',
        'Uzak komutlar çıktıyı yalnızca PrintRemoteCommandLog(message) ile geri gönderir.',
        'Remote Console (DevCon) varsayılan olarak kapalı ve 29200 portunu kullanıyor.',
        'Oyuncuların GTA V Enhanced\'a ihtiyacı var ve sunucu yalnızca en yeni oyun build\'ini çalıştırıyor.',
    },
    docs = 'Değişen her şey, Cfx.re\'den: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Bu rapor bir rehberdir, garanti değildir. Bilinen sorunları dosyaları ve ayarları okuyarak bulur; kaynaklarını Enhanced\'da çalıştıramaz. Geçmeden önce bir Enhanced sunucusunda test et.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = '{date} tarihinde {server} için hazırlandı.',
    summary = '{resources} kaynak ve sunucunun ayarları {seconds} sn\'de kontrol edildi.',
    summary_one = '{resource} {seconds} sn\'de kontrol edildi.',
    counts = '{blocker} engel · {change} değiştirilecek · {review} gözden geçirilecek · {note} not · {resources} kaynağın {clean} tanesinde bir şey bulunmadı',
    all_clear = 'Hiçbir şey bulunmadı. Yine de yapamadığı kontrolleri gözden geçir; rapor dosyasında listeleniyor.',
    more = '...ve {count} tane daha',
    unreadable = 'Okunamadı: {resources}',
    truncated = 'Yalnızca ilk 20.000 dosya kontrol edildi: {resources}',
    saved = 'Dosyalar ve satır numaralarıyla tam rapor {file} içinde.',
    not_saved = 'Rapor {file} konumuna kaydedilemedi.',
    hint_command = 'Tam rapor için sunucu konsoluna {command} yaz.',
    checking = 'Kaynakların GTAV Enhanced için FiveM\'e göre kontrol ediliyor...',

    -- Command replies.
    reply_console = 'Tamam. Rapor sunucu konsolunda ve {file} içinde.',
    reply_busy = 'Zaten bir kontrol çalışıyor. Birazdan tekrar dene.',
    reply_no_resource = '{name} adında bir kaynak yok.',
    reply_no_permission = '/{command} kullanma iznin yok.',
}
