--[[
    Pigeon Enhanced Check: Finnish (Suomi).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fi'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.fi = {
    -- Levels, most serious first.
    level_blocker = 'Esteet',
    level_blocker_hint = 'eivät toimi Enhancedissa sellaisenaan',
    level_change = 'Muutettavat',
    level_change_hint = 'muuta nämä ennen siirtoa tai sen aikana',
    level_review = 'Tarkistettavat',
    level_review_hint = 'saattavat muuttua; katso ne läpi',
    level_note = 'Huomiot',
    level_note_hint = 'hyvä tietää; mitään ei tarvitse vielä muuttaa',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Escrow-resurssit',
    fix_escrow = 'Asset escrow ei ole vielä käytössä FiveMissä GTAV Enhancedille, joten nämä eivät voi toimia siellä sellaisenaan. Kysy jokaiselta tekijältä Enhanced-versiota ja pidä ne siihen asti Legacy-palvelimellasi. Escrow-tiedostot on salattu, joten muut tarkistukset eivät näe niiden sisään.',
    item_escrow = '{resource}',

    title_builder = 'Resurssien builderit',
    fix_builder = 'Resurssit eivät voi enää olla buildereita Enhancedissa. Tämä koskee myös cfx-server-datan yarn- ja webpack-buildereita: niihin nojaavien resurssien täytyy toimittaa node_modules tai build-tulos valmiina. Kysy tekijältä tai buildaa ne itse ennen lataamista.',
    item_builder = '{resource}: rekisteröi build-tehtävän ({count})',

    title_onesync_off = 'OneSync on pois päältä',
    fix_onesync_off = 'Enhancedissa ei ole P2P-tilaa: OneSync on aina päällä. Laita se tässä ensin päälle komennolla set onesync on ja testaa resurssisi sen kanssa, jotta ongelmat näkyvät palvelimella, jonka jo tunnet.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'OneSyncin legacy-tila',
    fix_onesync_legacy = 'OneSyncin legacy-tilaa (ei big) ei ole enää Enhancedissa; big-tila on ainoa, joten pelaajan liittyminen ja poistuminen välittyvät asiakkaille vain, kun pelaaja on lähellä. Vaihda tässä set onesync on -tilaan ja testaa resurssit, jotka olettavat jokaisen pelaajan olevan olemassa jokaisella asiakkaalla.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Muunnettavat mallit ja tekstuurit',
    fix_stream_convert = 'Nämä striimaavat Legacy-malleja tai -tekstuureja (YDR, YTD, YFT, YPT, YDD) kansiosta stream/, eikä niillä ole stream_enhanced/-kansiota. Muunna ne Cfx.re:n Alchemistilla ja laita tulokset kansioon stream_enhanced/, ja pidä stream/ Legacyä varten. Enhanced lataa stream_enhanced/-kansion stream/-kansion sijaan, joten kopioi myös resurssin muut striimattavat tiedostot. Alchemist ei voi muuntaa escrow-assetteja.',
    item_stream_convert = '{resource}: {count}/{total} tiedostoa kansiossa stream/',

    title_csharp = 'C#-resurssit',
    fix_csharp = 'Mono korvattiin Enhancedissa .NETillä, ja C#-resurssit buildataan .NET 10 SDK:lla. Pyydä tekijältä Enhanced-versio tai buildaa omasi uudelleen. Cfx.re on luvannut kertoa tästä lisää.',
    item_csharp = '{resource}: {count} .net.dll-tiedosto(a)',

    title_mumble = 'Mumble-ääni',
    fix_mumble = 'Mumble on vanhentunut Enhancedissa ja poistetaan. Sen natives toimivat siellä vain asetuksella setr sv_mumble true, joka päästää kenet tahansa mille tahansa äänikanavalle, ja voice targets toimivat kuin niitä olisi vain yksi. Suunnittele siirtyminen ääniresurssiin, joka käyttää uutta palvelimen voice-API:a.',
    item_mumble = '{resource}: {count} Mumble-kutsu(a)',

    title_voice_convars = 'Poistetut ääniasetukset',
    fix_voice_convars = 'Näitä Mumble-äänen convareita ei ole enää Enhancedissa (voice_inBitrate toimii yhä). Poista ne server.cfg:stä siirron yhteydessä ja tarkista, ettei ääniresurssisi tarvitse niitä.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'NUI-kutsut muihin resursseihin',
    fix_nui_cross = 'NUI-callbackien tiukka tila on Enhancedissa oletuksena päällä: resurssin NUI saa kutsua vain saman resurssin omia NUI-callbackeja, joten nämä kutsut estetään (HTTP 403). Turvallinen korjaus on export toisessa resurssissa ja oma callback tässä. Testataksesi Legacyssä jo nyt lisää manifestiin nui_callback_strict_mode \'true\'.',
    item_nui_cross = '{resource} kutsuu {targets}',

    title_server_kvp = 'Palvelimen avain-arvo-tallennus',
    fix_server_kvp = 'Palvelimen avain-arvo (KVP) -tietokanta täytyy siirtää siirron yhteydessä Cfx.re:n kvdb-migratorilla (https://github.com/citizenfx/kvdb-migrator). Nämä resurssit tallentavat siihen tietoja. Ota ensin varmuuskopio.',
    item_server_kvp = '{resource}: {count} KVP-kutsu(a)',

    title_moo = 'Kehittäjätila moo:n kautta',
    fix_moo = '+set moo 31337 ei enää laita kehittäjätilaa päälle. Käytä sen sijaan server.cfg:ssä set sv_devMode true, ja vain kehityspalvelimilla.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Pelaaja-ID:n mukaan tallennetut tiedot',
    fix_player_ids = 'Enhancedissa pelaajan palvelin-ID vapautuu, kun hän lähtee, ja voi siirtyä seuraavalle liittyvälle pelaajalle. Nämä resurssit tallentavat tietoja pelaaja-ID:n mukaan eivätkä koskaan käsittele playerDropped-tapahtumaa, joten uusi pelaaja voi saada edellisen tiedot. Tarkista, että jokainen tyhjentää tiedot pelaajan lähtiessä. Tämä on hahmohaku, joten osa voi olla kunnossa.',
    item_player_ids = '{resource}: {count} kohta(a)',

    title_game_build = 'Pakotettu pelin build',
    fix_game_build = 'Enhanced tukee vain uusinta pelin buildia, jonka se lataa, kun sv_enforceGameBuild ei ole asetettu (1 lataa peruspelin ilman DLC:itä). Poista se siirron yhteydessä ja tarkista kaikki, mikä tarvitsi tätä buildia.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Käyttää stream-kansiota',
    fix_stream_deprecated = 'stream/ toimii Enhancedissa yhä, kun stream_enhanced/ puuttuu, mutta se on vanhentunut. Mikään näistä tiedostoista ei ole tyyppiä, jota Alchemist muuntaa. Testaa ne Enhancedissa ja kysy tekijältä, jos jokin näyttää väärältä.',
    item_stream_deprecated = '{resource}: {total} tiedosto(a)',

    title_state_bags = 'State bag -käsittelijät',
    fix_state_bags = 'Enhancedissa state bag -muutosten käsittelijät laukeavat vain, jos entiteetti on olemassa, ja replikoidut arvot lähetetään vain, kun ne asetetaan erikseen. Tarkista, että nämä toimivat yhä odotetusti.',
    item_state_bags = '{resource}: {count} käsittelijä(ä)',

    title_no_effect_convars = 'Asetukset, joilla ei ole vaikutusta',
    fix_no_effect_convars = 'Nämä eivät tee mitään Enhancedissa tai ne on poistettu: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend ja sv_netHttp2 voi poistaa. sv_protectServerEntities ei koskaan toteutunut; käytä sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends on vanhentunut Enhancedissa. Aseta synkronoinnin tick rate sen sijaan asetuksella sv_syncTickRate (1-120, oletus 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Tarkista myös käsin',
    manual = {
        'Palvelintiedostot: ladattava on cfx-server_win_x64 tai cfx-server-linux_x64, ja FXServer.exe on nyt cfx-server.exe. Päivitä käynnistysskriptit ja pikakuvakkeet.',
        'Windows-palvelimet tarvitsevat Microsoft Visual C++ 2017 Redistributablen.',
        'endpoint_add_tcp ja endpoint_add_udp ottavat nyt kumpikin vain yhden endpointin.',
        'Grafiikkamodeja ei voi käyttää early accessin aikana: pure mode on aina päällä.',
        'Etäkomennot palauttavat tulosteen vain PrintRemoteCommandLog(message) -kutsulla.',
        'Remote Console (DevCon) on oletuksena pois päältä ja käyttää porttia 29200.',
        'Pelaajat tarvitsevat GTA V Enhancedin, ja palvelin käyttää vain uusinta pelin buildia.',
    },
    docs = 'Kaikki muutokset Cfx.re:ltä: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Tämä raportti on opas, ei takuu. Se löytää tunnetut ongelmat lukemalla tiedostoja ja asetuksia; se ei voi ajaa resurssejasi Enhancedissa. Testaa Enhanced-palvelimella ennen siirtoa.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Tehty {date} palvelimelle {server}.',
    summary = 'Tarkistettiin {resources} resurssia ja palvelimen asetukset {seconds} s:ssa.',
    summary_one = 'Tarkistettiin {resource} {seconds} s:ssa.',
    counts = '{blocker} estettä · {change} muutettavaa · {review} tarkistettavaa · {note} huomiota · {clean}/{resources} resurssista ei löytynyt mitään',
    all_clear = 'Mitään ei löytynyt. Käy silti läpi tarkistukset, joita se ei voi tehdä; ne ovat raporttitiedostossa.',
    more = '...ja {count} muuta',
    unreadable = 'Ei voitu lukea: {resources}',
    truncated = 'Vain ensimmäiset 20 000 tiedostoa tarkistettiin kohteissa: {resources}',
    saved = 'Koko raportti tiedostoineen ja rivinumeroineen on tiedostossa {file}.',
    not_saved = 'Raporttia ei voitu tallentaa tiedostoon {file}.',
    hint_command = 'Kirjoita {command} palvelimen konsoliin nähdäksesi koko raportin.',
    checking = 'Tarkistetaan resurssejasi FiveMin GTAV Enhancedia varten...',

    -- Command replies.
    reply_console = 'Valmis. Raportti on palvelimen konsolissa ja tiedostossa {file}.',
    reply_busy = 'Tarkistus on jo käynnissä. Yritä hetken päästä uudelleen.',
    reply_no_resource = 'Resurssia nimeltä {name} ei ole.',
    reply_no_permission = 'Sinulla ei ole oikeutta käyttää komentoa /{command}.',
}
