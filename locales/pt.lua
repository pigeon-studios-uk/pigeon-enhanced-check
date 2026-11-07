--[[
    Pigeon Enhanced Check: Portuguese (Português).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pt'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales.pt = {
    -- Levels, most serious first.
    level_blocker = 'Bloqueadores',
    level_blocker_hint = 'não vão funcionar no Enhanced tal como estão',
    level_change = 'A alterar',
    level_change_hint = 'altera-os antes ou durante a mudança',
    level_review = 'A rever',
    level_review_hint = 'podem ser afetados; dá uma vista de olhos',
    level_note = 'Notas',
    level_note_hint = 'vale a pena saber; ainda não é preciso mudar nada',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Recursos com escrow',
    fix_escrow = 'O asset escrow ainda não está implementado no FiveM para GTAV Enhanced, por isso estes recursos não correm lá tal como estão. Pede a cada criador uma versão para Enhanced e mantém-nos no teu servidor Legacy até lá. Os ficheiros com escrow estão encriptados, por isso as outras verificações não conseguem ver o que têm dentro.',
    item_escrow = '{resource}',

    title_builder = 'Builders de recursos',
    fix_builder = 'No Enhanced, os recursos já não podem ser builders. Isto inclui os builders yarn e webpack do cfx-server-data: os recursos que dependem deles têm de vir com os node_modules ou o resultado do build já prontos. Pergunta ao criador, ou faz tu o build antes de os enviares.',
    item_builder = '{resource}: regista uma tarefa de build ({count})',

    title_onesync_off = 'O OneSync está desligado',
    fix_onesync_off = 'O Enhanced não tem modo P2P: o OneSync está sempre ligado. Liga-o aqui primeiro com set onesync on e testa os teus recursos com ele, para que os problemas apareçam no servidor que já conheces.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Modo legacy do OneSync',
    fix_onesync_legacy = 'O modo legacy do OneSync (não big) já não existe no Enhanced; o modo big é o único, por isso a entrada e saída de um jogador só chega aos clientes quando esse jogador está perto. Muda aqui para set onesync on e testa os recursos que esperam que cada jogador exista em cada cliente.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modelos e texturas a converter',
    fix_stream_convert = 'Estes fazem stream de modelos ou texturas do Legacy (YDR, YTD, YFT, YPT, YDD) a partir de stream/ e não têm pasta stream_enhanced/. Converte-os com o Alchemist da Cfx.re e põe o resultado em stream_enhanced/, mantendo stream/ para o Legacy. O Enhanced carrega stream_enhanced/ em vez de stream/, por isso copia também os outros ficheiros em stream do recurso. O Alchemist não converte assets com escrow.',
    item_stream_convert = '{resource}: {count} dos {total} ficheiros em stream/',

    title_csharp = 'Recursos em C#',
    fix_csharp = 'No Enhanced, o Mono foi substituído pelo .NET, e os recursos em C# são compilados com o SDK do .NET 10. Pede ao criador uma versão para Enhanced, ou recompila os teus. A Cfx.re disse que vai partilhar mais sobre isto.',
    item_csharp = '{resource}: {count} ficheiro(s) .net.dll',

    title_mumble = 'Voz do Mumble',
    fix_mumble = 'O Mumble está obsoleto no Enhanced e vai ser removido. As suas natives só funcionam lá com setr sv_mumble true, que deixa qualquer jogador entrar em qualquer canal de voz, e os voice targets comportam-se como se só houvesse um. Planeia a mudança para um recurso de voz que use a nova API de voz do servidor.',
    item_mumble = '{resource}: {count} chamada(s) ao Mumble',

    title_voice_convars = 'Definições de voz removidas',
    fix_voice_convars = 'Estes convars de voz do Mumble já não existem no Enhanced (voice_inBitrate continua a funcionar). Tira-os do server.cfg na mudança e confirma que o teu recurso de voz não depende deles.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Chamadas NUI a outros recursos',
    fix_nui_cross = 'No Enhanced, o modo estrito dos callbacks NUI está ligado por predefinição: a NUI de um recurso só pode chamar os callbacks NUI do próprio recurso, por isso estas chamadas vão ser bloqueadas (HTTP 403). A correção segura é um export no outro recurso e um callback próprio aqui. Para testar já no Legacy, adiciona nui_callback_strict_mode \'true\' ao manifest.',
    item_nui_cross = '{resource} chama {targets}',

    title_server_kvp = 'Armazenamento chave-valor do servidor',
    fix_server_kvp = 'A base de dados chave-valor (KVP) do servidor tem de ser migrada na mudança, com o kvdb-migrator da Cfx.re (https://github.com/citizenfx/kvdb-migrator). Estes recursos guardam dados nela. Faz primeiro uma cópia de segurança.',
    item_server_kvp = '{resource}: {count} chamada(s) KVP',

    title_moo = 'Modo de programador através do moo',
    fix_moo = '+set moo 31337 já não liga o modo de programador. Usa antes set sv_devMode true no server.cfg, e só em servidores de desenvolvimento.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Dados guardados por ID de jogador',
    fix_player_ids = 'No Enhanced, o ID de servidor de um jogador fica livre quando ele sai e pode ir para o próximo jogador que entrar. Estes recursos guardam dados por ID de jogador e nunca tratam o playerDropped, por isso um novo jogador pode ficar com os dados do anterior. Confirma que cada um os apaga quando um jogador sai. É uma pesquisa por padrões, por isso alguns podem estar bem.',
    item_player_ids = '{resource}: {count} sítio(s)',

    title_game_build = 'Build do jogo forçada',
    fix_game_build = 'O Enhanced só suporta a build mais recente do jogo, que carrega quando sv_enforceGameBuild não está definido (1 carrega o jogo base sem DLC). Remove-o na mudança e verifica tudo o que precisava desta build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Usa a pasta stream',
    fix_stream_deprecated = 'stream/ ainda funciona no Enhanced quando não há stream_enhanced/, mas está obsoleta. Nenhum destes ficheiros é de um tipo que o Alchemist converta. Testa-os no Enhanced e pergunta ao criador se alguma coisa parecer errada.',
    item_stream_deprecated = '{resource}: {total} ficheiro(s)',

    title_state_bags = 'Handlers de state bags',
    fix_state_bags = 'No Enhanced, os handlers de alteração de state bags só disparam se a entidade existir, e os valores replicados só são enviados quando são definidos explicitamente. Confirma que estes continuam a comportar-se como esperado.',
    item_state_bags = '{resource}: {count} handler(s)',

    title_no_effect_convars = 'Definições sem efeito',
    fix_no_effect_convars = 'Estas não fazem nada no Enhanced, ou foram removidas: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend e sv_netHttp2 podem sair. sv_protectServerEntities nunca foi implementado; usa sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends está obsoleto no Enhanced. Define antes o tick rate de sincronização com sv_syncTickRate (1 a 120, predefinição 60).',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Verifica também à mão',
    manual = {
        'Ficheiros do servidor: a transferência é cfx-server_win_x64 ou cfx-server-linux_x64, e o FXServer.exe passou a ser cfx-server.exe. Atualiza os scripts de arranque e os atalhos.',
        'Os servidores Windows precisam do Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp e endpoint_add_udp aceitam agora só um endpoint cada.',
        'Não é possível usar mods gráficos durante o acesso antecipado: o pure mode está sempre ligado.',
        'Os comandos remotos só devolvem resultados com PrintRemoteCommandLog(message).',
        'A Remote Console (DevCon) está desligada por predefinição e usa a porta 29200.',
        'Os jogadores precisam do GTA V Enhanced, e o servidor só corre a build mais recente do jogo.',
    },
    docs = 'Tudo o que muda, pela Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Este relatório é um guia, não uma garantia. Encontra problemas conhecidos ao ler ficheiros e definições; não consegue correr os teus recursos no Enhanced. Testa num servidor Enhanced antes de mudar.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Feito a {date} para {server}.',
    summary = 'Verificados {resources} recursos e as definições do servidor em {seconds} s.',
    summary_one = '{resource} verificado em {seconds} s.',
    counts = '{blocker} bloqueadores · {change} a alterar · {review} a rever · {note} notas · nada encontrado em {clean} de {resources} recursos',
    all_clear = 'Nada encontrado. Mesmo assim, passa pelas verificações que ele não consegue fazer; estão no ficheiro do relatório.',
    more = '...e mais {count}',
    unreadable = 'Não foi possível ler: {resources}',
    truncated = 'Só foram verificados os primeiros 20 000 ficheiros em: {resources}',
    saved = 'O relatório completo, com ficheiros e números de linha, está em {file}.',
    not_saved = 'Não foi possível guardar o relatório em {file}.',
    hint_command = 'Escreve {command} na consola do servidor para veres o relatório completo.',
    checking = 'A verificar os teus recursos para o FiveM para GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Feito. O relatório está na consola do servidor e em {file}.',
    reply_busy = 'Já está a decorrer uma verificação. Tenta outra vez daqui a pouco.',
    reply_no_resource = 'Não existe nenhum recurso chamado {name}.',
    reply_no_permission = 'Não tens permissão para usar /{command}.',
}
