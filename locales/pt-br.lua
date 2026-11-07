--[[
    Pigeon Enhanced Check: Brazilian Portuguese (Português do Brasil).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pt-br'
    to use it, or leave it on 'auto' and set ox_lib's language.
    Keep words in {curly brackets} exactly as they are; they're filled in automatically. Keep convar
    names, file names and commands (sv_mumble, stream_enhanced/, and so on) in English too.
]]

Locales = Locales or {}

Locales['pt-br'] = {
    -- Levels, most serious first.
    level_blocker = 'Bloqueadores',
    level_blocker_hint = 'não vão funcionar no Enhanced como estão',
    level_change = 'Para mudar',
    level_change_hint = 'mude antes ou durante a migração',
    level_review = 'Para revisar',
    level_review_hint = 'podem ser afetados; dê uma olhada',
    level_note = 'Observações',
    level_note_hint = 'bom saber; nada precisa mudar ainda',

    ---------------------------------------------------------------------------
    -- Each check: title_ is its heading, fix_ says what to do, and item_ is one line per resource
    -- (or per setting).

    title_escrow = 'Recursos com escrow',
    fix_escrow = 'O asset escrow ainda não foi implementado no FiveM para GTAV Enhanced, então esses recursos não rodam lá como estão. Peça a cada criador uma versão para Enhanced e mantenha-os no seu servidor Legacy até lá. Arquivos com escrow são criptografados, então as outras verificações não conseguem olhar dentro deles.',
    item_escrow = '{resource}',

    title_builder = 'Builders de recursos',
    fix_builder = 'No Enhanced, recursos não podem mais ser builders. Isso inclui os builders yarn e webpack do cfx-server-data: recursos que dependem deles precisam vir com node_modules ou o resultado do build já prontos. Pergunte ao criador, ou faça o build você mesmo antes de enviar.',
    item_builder = '{resource}: registra uma tarefa de build ({count})',

    title_onesync_off = 'OneSync está desligado',
    fix_onesync_off = 'O Enhanced não tem modo P2P: o OneSync está sempre ligado. Ligue-o aqui primeiro com set onesync on e teste seus recursos com ele, para que os problemas apareçam no servidor que você já conhece.',
    item_onesync_off = 'onesync: off',

    title_onesync_legacy = 'Modo legacy do OneSync',
    fix_onesync_legacy = 'O modo legacy do OneSync (não big) não existe mais no Enhanced; o modo big é o único, então a entrada e saída de um jogador só chega aos clientes quando esse jogador está por perto. Mude aqui para set onesync on e teste os recursos que esperam que todo jogador exista em todo cliente.',
    item_onesync_legacy = 'onesync: legacy',

    title_stream_convert = 'Modelos e texturas para converter',
    fix_stream_convert = 'Esses fazem stream de modelos ou texturas do Legacy (YDR, YTD, YFT, YPT, YDD) a partir de stream/ e não têm a pasta stream_enhanced/. Converta-os com o Alchemist da Cfx.re e coloque o resultado em stream_enhanced/, mantendo stream/ para o Legacy. O Enhanced carrega stream_enhanced/ no lugar de stream/, então copie também os outros arquivos em stream do recurso. O Alchemist não converte assets com escrow.',
    item_stream_convert = '{resource}: {count} dos {total} arquivos em stream/',

    title_csharp = 'Recursos em C#',
    fix_csharp = 'No Enhanced, o Mono foi substituído pelo .NET, e recursos em C# são compilados com o SDK do .NET 10. Peça ao criador uma versão para Enhanced, ou recompile os seus. A Cfx.re disse que vai compartilhar mais sobre isso.',
    item_csharp = '{resource}: {count} arquivo(s) .net.dll',

    title_mumble = 'Voz do Mumble',
    fix_mumble = 'O Mumble está obsoleto no Enhanced e será removido. As natives dele só funcionam lá com setr sv_mumble true, que deixa qualquer jogador entrar em qualquer canal de voz, e os voice targets agem como se houvesse só um. Planeje a troca para um recurso de voz que use a nova API de voz do servidor.',
    item_mumble = '{resource}: {count} chamada(s) ao Mumble',

    title_voice_convars = 'Configurações de voz removidas',
    fix_voice_convars = 'Esses convars de voz do Mumble não existem mais no Enhanced (voice_inBitrate continua funcionando). Tire-os do server.cfg na migração e confira se o seu recurso de voz não depende deles.',
    item_voice_convars = '{convars}',

    title_nui_cross = 'Chamadas NUI para outros recursos',
    fix_nui_cross = 'No Enhanced, o modo estrito de callbacks NUI vem ligado por padrão: a NUI de um recurso só pode chamar os callbacks NUI do próprio recurso, então essas chamadas serão bloqueadas (HTTP 403). A correção segura é um export no outro recurso e um callback próprio aqui. Para testar já no Legacy, adicione nui_callback_strict_mode \'true\' ao manifest.',
    item_nui_cross = '{resource} chama {targets}',

    title_server_kvp = 'Armazenamento chave-valor do servidor',
    fix_server_kvp = 'O banco chave-valor (KVP) do servidor precisa ser migrado na mudança, com o kvdb-migrator da Cfx.re (https://github.com/citizenfx/kvdb-migrator). Esses recursos guardam dados nele. Faça um backup antes.',
    item_server_kvp = '{resource}: {count} chamada(s) KVP',

    title_moo = 'Modo desenvolvedor via moo',
    fix_moo = '+set moo 31337 não liga mais o modo desenvolvedor. Use set sv_devMode true no server.cfg em vez disso, e só em servidores de desenvolvimento.',
    item_moo = 'moo: 31337',

    title_player_ids = 'Dados guardados por ID de jogador',
    fix_player_ids = 'No Enhanced, o ID de servidor de um jogador é liberado quando ele sai e pode ir para o próximo jogador que entrar. Esses recursos guardam dados por ID de jogador e nunca tratam o playerDropped, então um jogador novo poderia receber os dados do anterior. Confira se cada um apaga os dados quando um jogador sai. É uma busca por padrões, então alguns podem estar certos.',
    item_player_ids = '{resource}: {count} lugar(es)',

    title_game_build = 'Build do jogo forçada',
    fix_game_build = 'O Enhanced só suporta a build mais recente do jogo, que ele carrega quando sv_enforceGameBuild não está definido (1 carrega o jogo base sem DLCs). Remova-o na migração e confira tudo o que precisava dessa build.',
    item_game_build = 'sv_enforceGameBuild {value}',

    title_stream_deprecated = 'Usa a pasta stream',
    fix_stream_deprecated = 'stream/ ainda funciona no Enhanced quando não existe stream_enhanced/, mas está obsoleta. Nenhum desses arquivos é de um tipo que o Alchemist converte. Teste-os no Enhanced e pergunte ao criador se algo parecer errado.',
    item_stream_deprecated = '{resource}: {total} arquivo(s)',

    title_state_bags = 'Handlers de state bags',
    fix_state_bags = 'No Enhanced, os handlers de mudança de state bags só disparam se a entidade existir, e valores replicados só são enviados quando definidos explicitamente. Confira se esses continuam funcionando como esperado.',
    item_state_bags = '{resource}: {count} handler(s)',

    title_no_effect_convars = 'Configurações que não fazem nada',
    fix_no_effect_convars = 'Essas não fazem nada no Enhanced, ou foram removidas: onesync_enableBeyond, sv_enhancedHostSupport, onesync_automaticResend e sv_netHttp2 podem sair. sv_protectServerEntities nunca foi implementado; use sv_entityLockdown.',
    item_no_effect_convars = '{convars}',

    title_accurate_sends = 'sv_useAccurateSends',
    fix_accurate_sends = 'sv_useAccurateSends está obsoleto no Enhanced. Defina o tick rate de sincronização com sv_syncTickRate (1 a 120, padrão 60) em vez disso.',
    item_accurate_sends = 'sv_useAccurateSends {value}',

    ---------------------------------------------------------------------------
    -- Things it can't check, listed at the end of the report file.

    manual_title = 'Confira também à mão',
    manual = {
        'Arquivos do servidor: o download é cfx-server_win_x64 ou cfx-server-linux_x64, e o FXServer.exe agora é cfx-server.exe. Atualize scripts de inicialização e atalhos.',
        'Servidores Windows precisam do Microsoft Visual C++ 2017 Redistributable.',
        'endpoint_add_tcp e endpoint_add_udp agora aceitam só um endpoint cada.',
        'Mods gráficos não podem ser usados durante o acesso antecipado: o pure mode está sempre ligado.',
        'Comandos remotos só devolvem saída com PrintRemoteCommandLog(message).',
        'O Remote Console (DevCon) vem desligado por padrão e usa a porta 29200.',
        'Os jogadores precisam do GTA V Enhanced, e o servidor só roda a build mais recente do jogo.',
    },
    docs = 'Tudo o que muda, pela Cfx.re: https://docs.fivem.net/docs/developers/legacy-vs-enhanced/',
    disclaimer = 'Este relatório é um guia, não uma garantia. Ele encontra problemas conhecidos lendo arquivos e configurações; não consegue rodar seus recursos no Enhanced. Teste em um servidor Enhanced antes de migrar.',

    ---------------------------------------------------------------------------
    -- Report text.

    header = 'Pigeon Enhanced Check v{version}',
    generated = 'Feito em {date} para {server}.',
    summary = 'Foram verificados {resources} recursos e as configurações do servidor em {seconds} s.',
    summary_one = '{resource} verificado em {seconds} s.',
    counts = '{blocker} bloqueadores · {change} para mudar · {review} para revisar · {note} observações · nada encontrado em {clean} de {resources} recursos',
    all_clear = 'Nada encontrado. Mesmo assim, passe pelas verificações que ele não consegue fazer, listadas no arquivo do relatório.',
    more = '...e mais {count}',
    unreadable = 'Não foi possível ler: {resources}',
    truncated = 'Só os primeiros 20.000 arquivos foram verificados em: {resources}',
    saved = 'O relatório completo, com arquivos e números de linha, está em {file}.',
    not_saved = 'Não foi possível salvar o relatório em {file}.',
    hint_command = 'Digite {command} no console do servidor para ver o relatório completo.',
    checking = 'Verificando seus recursos para o FiveM para GTAV Enhanced...',

    -- Command replies.
    reply_console = 'Pronto. O relatório está no console do servidor e em {file}.',
    reply_busy = 'Já há uma verificação em andamento. Tente de novo em instantes.',
    reply_no_resource = 'Não existe nenhum recurso chamado {name}.',
    reply_no_permission = 'Você não tem permissão para usar /{command}.',
}
