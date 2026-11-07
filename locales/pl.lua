--[[
    Pigeon Enhanced Check: Polish (Polski).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pl'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.pl = {
    -- Levels, most serious first.
    level_blocker = 'Blokery',
    level_blocker_hint = 'nie zadziałają na Enhanced w obecnej postaci',
    level_change = 'Do zmiany',
    level_change_hint = 'zmień je przed przejściem lub w jego trakcie',
    level_review = 'Do sprawdzenia',
    level_review_hint = 'mogą być dotknięte; rzuć okiem',
    level_note = 'Uwagi',
    level_note_hint = 'warto wiedzieć; na razie nic nie trzeba zmieniać',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Zasoby z escrow',
    fix_escrow = 'Asset escrow nie jest jeszcze dostępny w FiveM dla GTAV Enhanced, więc te zasoby nie mogą tam działać w obecnej postaci. Poproś każdego twórcę o wersję na Enhanced i do tego czasu trzymaj je na serwerze Legacy. Pliki z escrow są zaszyfrowane, więc pozostałe sprawdzenia nie mogą zajrzeć do środka.',
    item_escrow = '{resource}',

    title_builder = 'Buildery zasobów',
    fix_builder = 'Na Enhanced zasoby nie mogą już być builderami. Dotyczy to też builderów yarn i webpack z cfx-server-data: zasoby, które na nich polegają, muszą być dostarczane z gotowymi node_modules lub wynikiem builda. Zapytaj twórcę albo zbuduj je sam przed wgraniem.',
    item_builder = '{resource}: rejestruje zadanie builda ({count})',

    title_onesync_off = 'OneSync jest wyłączony',
    fix_onesync_off = 'Enhanced nie ma trybu P2P: OneSync jest zawsze włączony. Najpierw włącz go tutaj poleceniem set onesync on i przetestuj z nim swoje zasoby, żeby problemy wyszły na serwerze, który już znasz.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Tryb legacy OneSync',
    fix_onesync_legacy = 'Tryb legacy OneSync (nie big) nie istnieje już na Enhanced; tryb big jest jedyny, więc dołączenie i wyjście gracza dociera do klientów tylko wtedy, gdy gracz jest w zasięgu. Przełącz tutaj na set onesync on i przetestuj zasoby, które zakładają, że każdy gracz istnieje na każdym kliencie.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modele i tekstury do konwersji',
    fix_stream_convert = 'Te zasoby streamują modele lub tekstury z Legacy (YDR, YTD, YFT, YPT, YDD) ze stream/ i nie mają folderu stream_enhanced/. Przekonwertuj je narzędziem Alchemist od Cfx.re i umieść wyniki w stream_enhanced/, zostawiając stream/ dla Legacy. Enhanced wczytuje stream_enhanced/ zamiast stream/, więc skopiuj też pozostałe streamowane pliki zasobu. Alchemist nie przekonwertuje assetów z escrow.',
    item_stream_convert = '{resource}: {count} z {total} plików w stream/',

    title_csharp = 'Zasoby C#',
    fix_csharp = 'Na Enhanced Mono zastąpiono .NET, a zasoby C# buduje się za pomocą .NET 10 SDK. Poproś twórcę o wersję na Enhanced albo przebuduj własne. Cfx.re zapowiedziało, że poda więcej informacji.',
    item_csharp = '{resource}: {count} plik(ów) .net.dll',

    title_mumble = 'Głos Mumble',
    fix_mumble = 'Mumble jest przestarzały na Enhanced i zostanie usunięty. Jego natives działają tam tylko z setr sv_mumble true, co pozwala każdemu graczowi dołączyć do dowolnego kanału głosowego, a voice targets działają tak, jakby był tylko jeden. Zaplanuj przejście na zasób głosowy, który używa nowego serwerowego voice API.',
    item_mumble = '{resource}: {count} wywołań Mumble',

    title_voice_convars = 'Usunięte ustawienia głosu',
    fix_voice_convars = 'Te convary głosu Mumble nie istnieją już na Enhanced (voice_inBitrate nadal działa). Usuń je z server.cfg przy przejściu i sprawdź, czy twój zasób głosowy od nich nie zależy.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Wywołania NUI do innych zasobów',
    fix_nui_cross = 'Na Enhanced ścisły tryb callbacków NUI jest domyślnie włączony: NUI zasobu może wywoływać tylko własne callbacki NUI tego zasobu, więc te wywołania zostaną zablokowane (HTTP 403). Bezpieczne rozwiązanie to export w drugim zasobie i własny callback tutaj. Aby przetestować to teraz na Legacy, dodaj do manifestu nui_callback_strict_mode \'true\'.',
    item_nui_cross = '{resource} wywołuje {targets}',

    title_server_kvp = 'Magazyn klucz-wartość serwera',
    fix_server_kvp = 'Bazę klucz-wartość (KVP) serwera trzeba przy przejściu zmigrować narzędziem kvdb-migrator od Cfx.re (https://github.com/citizenfx/kvdb-migrator). Te zasoby przechowują w niej dane. Najpierw zrób kopię zapasową.',
    item_server_kvp = '{resource}: {count} wywołań KVP',

    title_moo = 'Tryb deweloperski przez moo',
    fix_moo = '+set moo 31337 nie włącza już trybu deweloperskiego. Zamiast tego użyj set sv_devMode true w server.cfg, i tylko na serwerach deweloperskich.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Dane przechowywane według ID gracza',
    fix_player_ids = 'Na Enhanced server ID gracza zwalnia się, gdy wychodzi, i może trafić do następnego gracza, który dołączy. Te zasoby przechowują dane według ID gracza i nigdy nie obsługują playerDropped, więc nowy gracz mógłby dostać dane poprzedniego. Sprawdź, czy każdy z nich czyści dane, gdy gracz wychodzi. To wyszukiwanie wzorców, więc część może być w porządku.',
    item_player_ids = '{resource}: {count} miejsc(e)',

    title_game_build = 'Wymuszony build gry',
    fix_game_build = 'Enhanced obsługuje tylko najnowszy build gry, który wczytuje, gdy sv_enforceGameBuild nie jest ustawiony (1 wczytuje podstawową grę bez DLC). Usuń go przy przejściu i sprawdź wszystko, co potrzebowało tego builda.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Używa folderu stream',
    fix_stream_deprecated = 'stream/ nadal działa na Enhanced, gdy nie ma stream_enhanced/, ale jest przestarzały. Żaden z tych plików nie jest typem, który Alchemist konwertuje. Przetestuj je na Enhanced i zapytaj twórcę, jeśli coś wygląda źle.',
    item_stream_deprecated = '{resource}: {total} plik(ów)',

    title_state_bags = 'Handlery state bagów',
    fix_state_bags = 'Na Enhanced handlery zmian state bagów uruchamiają się tylko wtedy, gdy encja istnieje, a replikowane wartości są wysyłane tylko wtedy, gdy zostaną jawnie ustawione. Sprawdź, czy te nadal działają zgodnie z oczekiwaniami.',
    item_state_bags = '{resource}: {count} handler(ów)',

    title_no_effect_convars = 'Ustawienia bez efektu',
    fix_no_effect_convars = 'Te ustawienia nic nie robią na Enhanced lub zostały usunięte: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend i sv_netHttp2 można usunąć. sv_protectServerEntities nigdy nie zostało zaimplementowane; użyj sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends jest przestarzałe na Enhanced. Zamiast tego ustaw tick rate synchronizacji przez sv_syncTickRate (od 1 do 120, domyślnie 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Sprawdź też ręcznie',
    manual = {
        'Pliki serwera: do pobrania jest cfx-server_win_x64 lub cfx-server-linux_x64, a FXServer.exe to teraz cfx-server.exe. Zaktualizuj skrypty startowe i skróty.',
        'Serwery Windows potrzebują Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp i endpoint_add_udp przyjmują teraz tylko po jednym endpoincie.',
        'Modów graficznych nie można używać we wczesnym dostępie: pure mode jest zawsze włączony.',
        'Zdalne polecenia zwracają wynik tylko przez PrintRemoteCommandLog(message).',
        'Remote Console (DevCon) jest domyślnie wyłączona i używa portu 29200.',
        'Gracze potrzebują GTA V Enhanced, a serwer działa tylko na najnowszym buildzie gry.',
    },
    docs = 'Wszystkie zmiany od Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Ten raport to wskazówka, nie gwarancja. Znajduje znane problemy, czytając pliki i ustawienia; nie może uruchomić twoich zasobów na Enhanced. Przetestuj na serwerze Enhanced przed przejściem.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Utworzono {date} dla {server}.',
    summary = 'Sprawdzono {resources} zasobów i ustawienia serwera w {seconds} s.',
    summary_one = 'Sprawdzono {resource} w {seconds} s.',
    counts = '{blocker} blokerów · {change} do zmiany · {review} do sprawdzenia · {note} uwag · nic nie znaleziono w {clean} z {resources} zasobów',
    all_clear = 'Nic nie znaleziono. Mimo to przejdź przez sprawdzenia, których nie może wykonać; są w pliku raportu.',
    more = '...i jeszcze {count}',
    unreadable = 'Nie udało się odczytać: {resources}',
    truncated = 'Sprawdzono tylko pierwsze 20 000 plików w: {resources}',
    saved = 'Pełny raport z plikami i numerami linii jest w {file}.',
    not_saved = 'Nie udało się zapisać raportu w {file}.',
    hint_command = 'Wpisz {command} w konsoli serwera, aby zobaczyć pełny raport.',
    checking = 'Sprawdzam twoje zasoby pod FiveM dla GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Gotowe. Raport jest w konsoli serwera i w {file}.',
    reply_busy = 'Sprawdzanie już trwa. Spróbuj ponownie za chwilę.',
    reply_no_resource = 'Nie ma zasobu o nazwie {name}.',
    reply_no_permission = 'Nie masz uprawnień do /{command}.',
}
