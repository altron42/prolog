%*************************************************************************************************************
%*************************************************************************************************************
%** Camila Paixão    35 %          									**
%** Felipe Cabral	 10 %										    ** 	
%** Manoel Mota		 55 %										    ** 	 	
%*************************************************************************************************************
%*************************************************************************************************************


% frase(A,[cargo,e,cargos],C,[]).
%false.


%comando para testar se uma frase pertence ao texto
% abrir pelo terminal o diretorio onde esta esse arquivo
% digitar prolog
% para a chamada do arquivo pode ser assim: ['gramatica.pl'].
% em seguida por exemplo: oracao(singular, femenino,[acabou,a,coletiva],[]).



sentenca(Numero,Genero) --> frase(Numero,Genero).
sentenca(Numero,Genero,Pessoa) --> periodoSimples(Numero,Genero,Pessoa).
sentenca(Numero,Genero,Pessoa) --> periodoComposto(Numero,Genero,Pessoa).

periodoSimples(Numero,Genero) --> predicado(Numero,Genero).
periodoSimples(Numero,Genero) --> sujeito(Numero,Genero), predicado(Numero,Genero).

periodoComposto(Numero,Genero) --> oracaoCoordenada(Numero,Genero).
periodoComposto(Numero,Genero) --> oracaoCoordenada(Numero,Genero), sentenca.
periodoComposto(Numero,Genero) --> oracaoCoordenada(Numero,Genero), conjuncao, sentenca.
periodoComposto(Numero,Genero) --> oracaoSubordinada(Numero,Genero).
periodoComposto(Numero,Genero) --> oracaoSubordinada(Numero,Genero), sentenca.
periodoComposto(Numero,Genero) --> oracaoSubordinada(Numero,Genero), preposicao(_),sentenca.
periodoComposto(Numero,Genero) --> oracaoCoordenada(Numero,Genero), conjuncao, oracaoSubordinada(Numero,Genero).
periodoComposto(Numero,Genero) --> oracaoSubordinada(Numero,Genero), conjuncao, oracaoCoordenada(Numero,Genero).

oracaoCoordenada(Numero,Genero) --> predicado(Numero,Genero).
oracaoCoordenada(Numero,Genero) --> sujeito(Numero,Genero), predicado(Numero,Genero).
oracaoSubordinada(Numero,Genero) --> predicado(Numero,Genero).
oracaoSubordinada(Numero,Genero) --> sujeito(Numero,Genero), predicado(Numero,Genero).

frase(Numero,Genero) -->  sujeito(Numero,Genero).
frase(Numero,Genero) -->  artigo(Numero,Genero) , sujeito(Numero,Genero).
frase(Numero,Genero) -->  artigo(Numero,Genero) , sujeito(Numero,Genero).

sujeito(Numero,Genero) --> pronome(Numero,Genero).
sujeito(Numero,Genero) --> substantivo(Numero,Genero).
sujeito(Numero,Genero) --> artigo(Numero,Genero) , substantivo(Numero,Genero), preposicao(_).
sujeito(Numero,Genero) --> adverbio(Numero), adjetivo(Numero,Genero).
sujeito(Numero,Genero) --> artigo(Numero,Genero) , substantivo(Numero,Genero).
sujeito(Numero,Genero) --> artigo(Numero,Genero) , substantivo(Numero,Genero), adjetivo(Numero,Genero).
sujeito(Numero,Genero) --> substantivo(Numero,Genero) , conjuncao, substantivo(Numero,Genero).

predicado(Numero,Genero) --> verbo(Numero).
predicado(Numero,Genero) --> verbo(Numero), substantivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), substantivo(Numero,Genero), adjetivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), artigo(Numero,Genero), adjetivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), artigo(Numero,Genero), substantivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), artigo(Numero,Genero), substantivo(Numero,Genero), adjetivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), artigo(Numero,Genero), pronome(Numero,_), substantivo(Numero,Genero), preposicao(_), verbo(Numero).
predicado(Numero,Genero) --> verbo(Numero), numeral(Numero,Genero), substantivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), numeral(Numero,Genero), substantivo(Numero,Genero), adjetivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), preposicao(_), substantivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), preposicao(_), substantivo(Numero,Genero), preposicao(_), adjetivo(Numero,Genero),substantivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), preposicao(_), verbo(Numero), adverbio(Numero), adjetivo(Numero,Genero). 
predicado(Numero,Genero) --> verbo(Numero), substantivo(Numero,Genero), artigo(Numero,Genero), substantivo(Numero,Genero).
predicado(Numero,Genero) --> verbo(Numero), substantivo(Numero,Genero), artigo(Numero,Genero), substantivo(Numero,Genero), adjetivo(Numero,Genero).

%Estou comprando um protetor solar.
%Irei à praia.

%objeto_direto(N) --> substantivo(N).
%objeto_direto(N) --> artigo(N), substantivo(N).
%objeto_indireto(N) --> preposicao(N), substantivo(N).


%ARTIGOS
artigo(singular, masculino) --> [o].
artigo(plural, masculino) --> [os].
artigo(plural, masculino) --> [uns].
artigo(singular, masculino) --> [um].
artigo(singular, feminino) --> [a].
artigo(plural, feminino) --> [as].
artigo(singular, feminino) --> [uma].
artigo(plural, feminino) --> [umas].
artigoCombinacao(singular, masculino) --> [ao].
artigoCombinacao(plural, masculino) --> [aos].

%PRONOMES
pronome(singular) --> [eu].
pronome(singular) --> [tu].
pronome(plural) --> ['nós'].
pronome(plural) --> ['vós'].
pronome(singular,masculino) --> [ele].
pronome(singular,femenino) --> [ela].
pronome(plural,masculino) --> [eles].
pronome(plural,femenino) --> [elas].
pronome(singular, masculino) --> [dr].
pronome(singular, femenino) --> [algo].
pronome(singular, masculino) --> [algo].
pronome(singular, femenino) --> ['alguém'].
pronome(singular, masculino) --> ['alguém'].
pronome(singular, masculino) --> [algum].
pronome(singular, femenino) --> [alguma].
pronome(plural, femenino) --> [algumas].
pronome(plural, masculino) --> [alguns].
pronome(singular, femenino) --> [aquela].
pronome(singular, masculino) --> [aquele].
pronome(singular, masculino) --> [aquilo].
pronome(singular, femenino) --> [cada].
pronome(plural, femenino) --> [certas].
pronome(singular, masculino) --> [certo].
pronome(singular, masculino) --> [disso].
pronome(singular, femenino) --> [dessa].
pronome(plural, femenino) --> [dessas].
pronome(singular, femenino) --> [desse].
pronome(plural, masculino) --> [desses].
pronome(singular, femenino) --> [dela].
pronome(plural, femenino) --> [delas].
pronome(singular, masculino) --> [dele].
pronome(plural, masculino) --> [deles].
pronome(singular, masculino) --> [deste].
pronome(singular, femenino) --> [daquela].
pronome(plural, femenino) --> [daquelas].
pronome(plural, masculino) --> [daqueles].
pronome(plural, femenino) --> [demais].
pronome(plural, masculino) --> [demais].
pronome(singular,masculino) --> [isso].
pronome(singular,feminino) --> [isso].
pronome(plural,masculino) --> [isso].
pronome(plural,feminino) --> [isso].
pronome(singular, masculino) --> [mais].
pronome(singular, feminino) --> [mais].
pronome(plural, masculino) --> [mais].
pronome(plural, feminino) --> [mais].
pronome(singular, masculino) --> [me].
pronome(singular, feminino) --> [me].
pronome(singular, masculino) --> [menos].
pronome(singular, feminino) --> [menos].
pronome(plural, masculino) --> [menos].
pronome(plural, feminino) --> [menos].
pronome(singular, feminino) --> [mesma].
pronome(plural, feminino) --> [mesmas].
pronome(singular, masculino) --> [mesmo].
pronome(plural, masculino) --> [mesmos].
pronome(plural, masculino) --> [meus].
pronome(singular, feminino) --> [minha].
pronome(plural, feminino) --> [minhas].
pronome(singular, feminino) --> [muita].
pronome(plural, feminino) --> [muitas].
pronome(singular, masculino) --> [muito].
pronome(singular, feminino) --> [naquela].
pronome(singular, feminino) --> [nela].
pronome(singular, masculino) --> [nele].
pronome(plural, masculino) --> [neles].
pronome(singular, masculino) --> [nenhum].
pronome(singular, feminino) --> [nessa].
pronome(singular, masculino) --> [nesse].
pronome(singular, masculino) --> [neste].
pronome(singular, masculino) --> [nisso].
pronome(singular, feminino) --> [nisso].
pronome(plural, masculino) --> [nisso].
pronome(plural, feminino) --> [nisso].
pronome(singular, feminino) --> [nossa].
pronome(singular, masculino) --> [nosso].
pronome(singular, feminino) --> [outra].
pronome(plural, feminino) --> [outras].
pronome(singular, masculino) --> [outro].
pronome(plural, masculino) --> [outros].
pronome(singular, feminino) --> [pouca].
pronome(plural, feminino) --> [poucas].
pronome(singular, masculino) --> [pouco].
pronome(plural, masculino) --> [quais].
pronome(plural, feminino) --> [quais].
pronome(singular, masculino) --> [qual].
pronome(singular, feminino) --> [qual].
pronome(singular, masculino) --> [qualquer].
pronome(singular, feminino) --> [qualquer].
pronome(plural, feminino) --> [quantas].
pronome(singular, masculino) --> [quanto].

%SUBSTANTIVOS
substantivo(singular, masculino) --> [gato].
substantivo(plural, masculino) --> [gatos].
substantivo(singular, masculino) --> [rato]. 
substantivo(plural, masculino) --> [ratos].
substantivo(plural, feminino) --> [ferramentas].
substantivo(plural, masculino) --> [fertilizantes].
substantivo(singular, feminino) --> [festa].
substantivo(plural, feminino) --> [festas].
substantivo(singular, masculino) --> [fevereiro].
substantivo(singular, feminino) --> [ficha].
substantivo(singular, masculino) --> [filme].
substantivo(plural, masculino) --> [filmes].
substantivo(singular, masculino)--> [fim].
substantivo(singular, feminino) --> [florida].
substantivo(singular, feminino) --> [fome].
substantivo(singular, feminino) --> [fonte].
substantivo(singular, feminino) --> ['força'].
substantivo(singular, feminino) --> [forma].
substantivo(plural, feminino) --> [formas].
substantivo(singular, masculino) --> [formato].
substantivo(singular, masculino) --> [fortalecimento].
substantivo(plural, masculino) --> ['fósseis'].
substantivo(singular, feminino) --> [foto].
substantivo(plural, feminino) --> [fotos].
substantivo(singular, masculino) --> [freio].
substantivo(singular, feminino) --> [frente].
substantivo(singular, feminino) --> [fronteira].
substantivo(singular, masculino) --> [fundo].
substantivo(singular, masculino) --> ['furacão'].
substantivo(singular, masculino) --> [futebol].
substantivo(singular, masculino) --> [futuro].
substantivo(singular, masculino) --> [ganho].
substantivo(singular, feminino) --> [garagem].
substantivo(singular, masculino) --> [gas].
substantivo(plural, masculino) --> [gases].
substantivo(singular, feminino) --> [gasolina].
substantivo(singular, masculino) --> [gasto].
substantivo(plural, masculino) --> [gastos].
substantivo(singular, masculino) --> [gelo].
substantivo(plural, masculino) --> ['gêmeos'].
substantivo(singular, masculino) --> [gene].
substantivo(plural, masculino) --> [genes].
substantivo(singular, feminino) --> ['genética'].
substantivo(singular, feminino) --> [gengiva].
substantivo(plural, masculino) --> ['gênios'].
substantivo(singular, feminino) --> [gente].
substantivo(singular, masculino) --> [geral].
substantivo(singular, feminino) --> ['gerência'].
substantivo(singular, masculino) --> ['getúlio'].
substantivo(plural, masculino) --> [gigantes].
substantivo(singular, masculino) --> ['ginásio'].
substantivo(singular, masculino) --> [globo].
substantivo(singular, masculino) --> [golpe].
substantivo(singular, feminino) --> [gordura].
substantivo(plural, masculino) --> [governos].
substantivo(singular, feminino) --> ['graça'].
substantivo(plural, feminino) --> ['graças'].
substantivo(singular, feminino) --> [grana].
substantivo(plural, masculino) --> ['grãos'].
substantivo(singular, masculino) --> [grau].
substantivo(singular, feminino) --> [gravidade].
substantivo(singular, masculino) --> [grupo].
substantivo(plural, masculino) --> [grupos].
substantivo(singular, masculino) --> [guarda].
substantivo(singular, feminino) --> [guarda].
substantivo(plural, feminino) --> [guerras].
substantivo(singular, feminino) --> [habilidade].
substantivo(singular, feminino) --> [hipertransparência].
substantivo(singular, feminino) --> [história].
substantivo(singular, masculino) --> [hoje].
substantivo(singular, masculino) --> [homem].
substantivo(singular, feminino) --> [hora].
substantivo(plural, feminino) --> [horas].
substantivo(plural, feminino) --> [hordas].
substantivo(plural, masculino) --> ['hormônios'].
substantivo(plural, masculino) --> [hospitais].
substantivo(singular, masculino) --> [hospital].
substantivo(singular, feminino) --> [humanidade].
substantivo(singular, feminino) --> [idade].
substantivo(singular, masculino) --> [ideal].
substantivo(singular, feminino) --> [ideia].
substantivo(plural, feminino) --> [ideias].
substantivo(singular, feminino) --> [imagem].
substantivo(plural, feminino) --> [imagens].
substantivo(singular, feminino) --> ['imaginação'].
substantivo(singular, masculino) --> [impacto].
substantivo(singular, feminino) --> ['implantação'].
substantivo(singular, masculino) --> [importante].
substantivo(singular, feminino) --> [importante].
substantivo(plural, masculino) --> [impostos].
substantivo(singular, feminino) --> [imprensa].
substantivo(singular, masculino) --> [impulso].
substantivo(plural, feminino) --> ['incisões'].
substantivo(singular, masculino) --> [inconsciente].
substantivo(singular, masculino) --> [inconveniente].
substantivo(singular, feminino) --> ['índia'].
substantivo(singular, masculino) --> ['índice'].
substantivo(singular, feminino) --> ['indigestão'].
substantivo(singular, feminino) --> ['indignação'].
substantivo(plural, masculino) --> ['indivíduos'].
substantivo(singular, masculino) --> [indio].
substantivo(singular, feminino) --> [industria].
substantivo(singular, masculino) --> [inesperado].
substantivo(singular, feminino) --> ['inflação'].
substantivo(singular, feminino) --> ['inflamação'].
substantivo(singular, feminino) --> ['influência'].
substantivo(plural, feminino) --> ['informações'].
substantivo(singular, feminino) --> [inglaterra].
substantivo(singular, masculino) --> ['inglês'].
substantivo(plural, masculino) --> [ingressos].
substantivo(plural, feminino) --> [iniciais].
substantivo(singular, masculino) --> ['início'].
substantivo(singular, feminino) --> ['inovação'].
substantivo(singular, feminino) --> [inspirada].
substantivo(singular, feminino) --> ['instância'].
substantivo(singular, masculino) --> [instinto].
substantivo(singular, feminino) --> ['inteligência'].
substantivo(plural, masculino) --> [interesses].
substantivo(singular, masculino) --> [internacional].
substantivo(singular, feminino) --> [internacional].
substantivo(singular, feminino) --> ['interpretação'].
substantivo(plural, feminino) --> ['interpretações'].
substantivo(singular, masculino) --> [intervalo].
substantivo(singular, feminino) --> ['intervenção'].
substantivo(singular, masculino) --> [instestino].
substantivo(singular, feminino) --> ['invenção'].
substantivo(singular, masculino) --> [inverno].
substantivo(singular, masculino) --> [inverso].
substantivo(plural, masculino) --> [investigadores].
substantivo(singular, masculino) --> [iraque].
substantivo(singular, masculino) --> ['irmão'].
substantivo(singular, masculino) --> [j].
substantivo(singular, masculino) --> [janeiro].
substantivo(singular, masculino) --> ['jânio'].
substantivo(singular, masculino) --> [jeito].
substantivo(singular, masculino) --> ['joão'].
substantivo(plural, masculino) --> [jogadores].
substantivo(singular, masculino) --> [jogo].
substantivo(plural, masculino) --> [jogos].
substantivo(singular, masculino) --> [juscelino].
substantivo(singular, feminino) --> ['justiça'].
substantivo(singular, masculino) --> ['lá'].
substantivo(singular, masculino) --> [labirinto].
substantivo(singular, masculino) --> ['laboratório'].
substantivo(singular, masculino) --> [lado].
substantivo(singular, masculino) --> ['ladrão'].
substantivo(singular, masculino) --> ['lançamento'].
substantivo(plural, masculino) --> ['lançamentos'].
substantivo(singular, masculino) --> [lazer].
substantivo(singular, feminino) --> [lei].
substantivo(plural, feminino) --> [leis].
substantivo(singular, feminino) --> [levedura].
substantivo(singular, feminino) --> [liberdade].
substantivo(plural, masculino) --> ['líderes'].
substantivo(singular, masculino) --> ['líquido'].
substantivo(singular, feminino) --> [literatura].
substantivo(plural, masculino) --> [locais].
substantivo(singular, masculino) --> [logo].
substantivo(singular, feminino) --> [logo].
substantivo(plural, masculino) --> [lucros].
substantivo(singular, masculino) --> [lugar].
substantivo(singular, masculino) --> [lula].
substantivo(singular, feminino) --> [lula].
substantivo(singular, feminino) --> [luta].
substantivo(singular, feminino) --> [madrasta].
substantivo(singular, feminino) --> ['mãe'].
substantivo(singular, masculino) --> ['mágico'].
substantivo(singular, masculino) --> [maio].
substantivo(singular, feminino) --> [maioria].
substantivo(singular, masculino) --> [mais].
substantivo(singular, masculino) --> [mal].
substantivo(plural, feminino) --> [maneiras].
substantivo(plural, feminino) --> [mangas].
substantivo(singular, feminino) --> ['manhã'].
substantivo(plural, feminino) --> [manhas].
substantivo(singular, feminino) --> ['manifestação'].
substantivo(singular, feminino) --> ['manipulação'].
substantivo(singular, feminino) --> ['mão'].
substantivo(singular, masculino) --> [mapa].
substantivo(singular, masculino) --> [marcio].
substantivo(singular, masculino) --> [marmanjo].
substantivo(singular, feminino) --> [martelada].
substantivo(singular, feminino) --> [massa].
substantivo(singular, feminino) --> ['média'].
substantivo(singular, feminino) --> ['médica'].
substantivo(plural, masculino) --> [medicamentos].
substantivo(singular, feminino) --> [medicina].
substantivo(singular, masculino) --> ['médico'].
substantivo(plural, masculino) --> ['médicos'].
substantivo(singular, masculino) --> ['médio'].
substantivo(singular, masculino) --> [medo].
substantivo(singular, masculino) --> [meio].
substantivo(singular, masculino) --> [melhor].
substantivo(singular, feminino) --> [melhora].
substantivo(plural, masculino) --> [melhores].
substantivo(plural, feminino) --> [melhores].
substantivo(singular, feminino) --> [melhoria].
substantivo(singular, feminino) -->[melodia].
substantivo(singular, masculino) --> [membro].
substantivo(singular, feminino) --> ['memória'].
substantivo(plural, feminino) --> ['memórias'].
substantivo(singular, masculino) --> [menos].
substantivo(plural, feminino) --> [mensagens].
substantivo(singular, feminino) --> [mente].
substantivo(singular, masculino) --> [mercado].
substantivo(singular, masculino) --> ['mérito'].
substantivo(singular, masculino) --> ['mês'].
substantivo(singular, feminino) --> [mesa].
substantivo(singular, masculino) --> [mesmo].
substantivo(plural, masculino) --> [mestres].
substantivo(singular, masculino) --> [metabolismo].
substantivo(singular, feminino) --> [metade].
substantivo(singular, feminino) --> ['metáfora'].
substantivo(plural, feminino) --> ['metáforas'].
substantivo(singular, feminino) --> [metralhadora].
substantivo(plural, masculino) --> ['milhões'].
substantivo(singular, masculino) --> [militar].
substantivo(singular, feminino) --> [militar].
substantivo(singular, masculino) --> [ministro].
substantivo(singular, feminino) --> [minoria].
substantivo(singular, feminino) --> ['missão'].
substantivo(singular, feminino) -->  ['modificação'].
substantivo(singular, masculino) --> [modo].
substantivo(singular, masculino) --> [molho].
substantivo(singular, masculino) --> [momento].
substantivo(plural, masculino) --> ['monopólios'].
substantivo(singular, masculino) --> [moral].
substantivo(singular, feminino) --> [moral].
substantivo(singular, feminino) --> [morte].
substantivo(singular, masculino) --> [mosaico].
substantivo(singular, feminino) --> [mostra].
substantivo(singular, masculino) --> [motivo].
substantivo(singular, masculino) --> [motor].
substantivo(plural, masculino) --> [motores].
substantivo(plural, masculino) --> [motoristas].
substantivo(plural, feminino) --> [motoristas].
substantivo(singular, masculino) --> [movimento].
substantivo(singular, feminino) --> ['mudança'].
substantivo(plural, feminino) --> ['mudanças'].
substantivo(plural, feminino) --> [mulheres].
substantivo(plural, feminino) --> ['multidões'].
substantivo(singular, masculino) --> [mundo].
substantivo(singular, feminino) --> ['música'].
substantivo(singular, feminino) --> [musiquinha].
substantivo(singular, feminino) --> ['nação'].
substantivo(singular, masculino) --> [nada].
substantivo(plural, masculino) --> [namorados].
substantivo(singular, masculino) --> [nariz].
substantivo(plural, feminino) --> [negativas].
substantivo(singular, masculino) --> [negro].
substantivo(singular, masculino) --> [nervoso].
substantivo(singular, feminino) --> ['neurociência'].
substantivo(singular, masculino) --> [neurocientista].
substantivo(singular, feminino) --> [neurocientista].
substantivo(plural, masculino) --> [neurocientistas].
substantivo(plural, feminino) --> [neurocientistas].
substantivo(singular, masculino) --> [neurologista].
substantivo(singular, feminino) --> [neurologista].
substantivo(plural, masculino) --> ['neurônios'].
substantivo(singular, feminino) --> [neve].
substantivo(singular, masculino) --> ['nível'].
substantivo(singular, feminino) --> [noite].
substantivo(singular, masculino) --> [nome].
substantivo(singular, masculino) --> [normal].
substantivo(singular, feminino) --> [normal].
substantivo(singular, feminino) --> ['notícia'].
substantivo(plural, feminino) --> [novatas].
substantivo(singular, masculino) --> [novato].
substantivo(singular, feminino) --> [novidade].
substantivo(singular, masculino) --> ['número'].
substantivo(plural, masculino) --> ['números'].
substantivo(singular, feminino) --> [obesidade].
substantivo(singular, feminino) --> [obra].
substantivo(singular, masculino) --> ['obstáculo'].
substantivo(singular, masculino) --> [ocidental].
substantivo(singular, feminino) --> [ocidental].
substantivo(plural, masculino) --> [olhos].
substantivo(plural, masculino) --> [ombros].
substantivo(plural, feminino) --> [ondas].
substantivo(plural, feminino) --> ['opções'].
substantivo(singular, feminino) --> ['operação'].
substantivo(singular, masculino) --> [oposto].
substantivo(plural, feminino) --> [orelhas].
substantivo(singular, masculino) --> [organismo].
substantivo(singular, feminino) --> ['orientação'].
substantivo(plural, feminino) --> [origens].
substantivo(singular, masculino) --> [ouvido].
substantivo(singular, masculino) --> [paciente].
substantivo(singular, feminino) --> [paciente].
substantivo(plural, masculino) --> [pacientes].
substantivo(plural, feminino) --> [pacientes].
substantivo(singular, masculino) --> ['padrão'].
substantivo(singular, feminino) --> ['página'].
substantivo(singular, masculino) --> [pai].
substantivo(singular, masculino) --> [painel].
substantivo(plural, masculino) --> [pais].
substantivo(singular, masculino) --> ['país'].
substantivo(singular, feminino) --> [paisagem].
substantivo(plural, masculino) --> ['países'].
substantivo(singular, feminino) --> [palavra].
substantivo(singular, masculino) --> [par].
substantivo(plural, feminino) --> [paralelas].
substantivo(singular, feminino) --> [parte].
substantivo(plural, feminino) --> [partes].
substantivo(singular, feminino) --> ['participação'].
substantivo(singular, feminino) --> [partida].
substantivo(singular, masculino) --> [passado].
substantivo(plural, masculino) --> [passistas].
substantivo(plural, feminino) --> [passistas].
substantivo(singular, masculino) --> [passo].
substantivo(singular, feminino) --> [patente].
substantivo(plural, feminino) --> [patentes].
substantivo(singular, masculino) --> [paulo].
substantivo(singular, masculino) --> ['pé'].
substantivo(plural, feminino) --> ['peças'].
substantivo(singular, feminino) --> [peculiaridade].
substantivo(singular, feminino) --> [pegadinha].
substantivo(singular, feminino) --> [pele].
substantivo(singular, feminino) --> [pedenga].
substantivo(singular, masculino) --> [pensamento].
substantivo(singular, feminino) --> ['pensilvânia'].
substantivo(singular, feminino) --> ['percepção'].
substantivo(singular, masculino) --> [perfil].
substantivo(plural, feminino) --> [perguntas].
substantivo(plural, masculino) --> ['períodos'].
substantivo(singular, masculino) --> [perito].
substantivo(plural, masculino) --> [peritos].
substantivo(singular, feminino) --> [perna].
substantivo(plural, masculino) --> [pesadelos].
substantivo(singular, masculino) --> [peso].
substantivo(singular, feminino) --> [pesquisa].
substantivo(plural, masculino) --> [pesquisadores].
substantivo(plural, feminino) --> [pesquisas].
substantivo(singular, feminino) --> [pessoa].
substantivo(singular, masculino) --> [pessoal].
substantivo(plural, feminino) --> [pessoas].
substantivo(plural, feminino) --> [petroleiras].
substantivo(singular, masculino) --> ['petróleo'].
substantivo(singular, feminino) --> ['petrolífera'].
substantivo(singular, masculino) --> [piano].
substantivo(singular, feminino) --> ['pílula'].
substantivo(plural, feminino) --> ['pílulas'].
substantivo(singular, feminino) --> [pimenta].
substantivo(singular, masculino) --> [pioneiro].
substantivo(singular, feminino) --> [pipoca].
substantivo(singular, feminino) --> [pirataria].
substantivo(plural, masculino) --> [piratas].
substantivo(plural, feminino) --> [piratas].
substantivo(singular, masculino) --> [placebo].
substantivo(plural, masculino) --> [placebos].
substantivo(singular, masculino) --> [planeta].
substantivo(plural, feminino) --> [plantas].
substantivo(plural, masculino) --> [pobres].
substantivo(plural, feminino) --> [pobres].
substantivo(singular, masculino) --> [poder].
substantivo(singular, feminino) --> ['polícia'].
substantivo(singular, feminino) --> ['política'].
substantivo(plural, masculinoulino) --> ['políticos'].
substantivo(singular, masculino) --> [poluente].
substantivo(plural, masculino) --> [poluentes].
substantivo(singular, feminino) --> ['poluição'].
substantivo(plural, masculino) --> [poluidores].
substantivo(plural, masculino) --> [pontinhos].
substantivo(singular, masculino) --> [ponto].
substantivo(singular, feminino) --> ['população'].
substantivo(singular, feminino) --> ['posição'].
substantivo(plural, feminino) --> [possibilidades].
substantivo(singular, masculino) --> [posto].
substantivo(singular, feminino) --> [pouca].
substantivo(plural, feminino) --> [poucas].
substantivo(singular, masculino) --> [pouco].
substantivo(singular, feminino) --> ['prática'].
substantivo(singular, masculino) --> [prato].
substantivo(singular, masculino) --> [prazo].
substantivo(singular, masculino) --> ['preço'].
substantivo(singular, masculino) --> ['prédio'].
substantivo(singular, feminino) --> ['preocupação'].
substantivo(singular, masculino) --> [presente].
substantivo(singular, feminino) --> ['presidência'].
substantivo(singular, masculino) --> [presidente].
substantivo(singular, feminino) --> [presidemte].
substantivo(plural, masculino) --> [presidentes].
substantivo(plural, feminino) --> [presidentes].
substantivo(plural, masculino) --> [presos].
substantivo(singular, feminino) --> ['pressão'].
substantivo(singular, masculino) --> [previsto].
substantivo(singular, feminino) --> [primeira].
substantivo(plural, feminino) --> [primeiras].
substantivo(singular, masculino) --> [primeiro].
substantivo(plural, masculino) --> [primeiros].
substantivo(singular, masculino) --> [principal].
substantivo(singular, feminino) --> [principal].
substantivo(singular, feminino) --> [privacidade].
substantivo(singular, masculino) --> [problema].
substantivo(plural, masculino) --> [problemas].
substantivo(singular, masculino) --> [processo].
substantivo(plural, masculino) --> [processos].
substantivo(singular, feminino) --> ['produção'].
substantivo(plural, feminino) --> ['produções'].
substantivo(plural, masculino) --> [produtos].
substantivo(singular, masculino) --> [professor].
substantivo(singular, feminino) --> ['profissão'].
substantivo(singular, masculino) --> [profundo].
substantivo(singular, masculino) --> [programa].
substantivo(plural, masculino) --> [programas].
substantivo(singular, masculino) --> [projeto].
substantivo(plural, masculino) --> [promotores].
substantivo(singular, feminino) --> [propaganda].
substantivo(singular, masculino) --> ['propósito'].
substantivo(singular, feminino) --> [proposta].
substantivo(plural, feminino) --> [prospostas].
substantivo(singular, feminino) --> ['própria'].
substantivo(plural, masculino) --> ['próprios'].
substantivo(singular, feminino) --> ['proteína'].
substantivo(singular, masculino) --> [protocolo].
substantivo(singular, feminino) --> [prova].
substantivo(singular, feminino) --> ['próxima'].
substantivo(singular, masculino) --> ['próximo'].
substantivo(plural, masculinoulino) --> ['próximos'].
substantivo(singular, feminino) --> ['psicóloga'].
substantivo(singular, feminino) --> [psiquiatra].
substantivo(singular, masculino) --> [psiquiatra].
substantivo(singular,feminino) --> [publicidade].
substantivo(singular, masculino) --> ['público'].
substantivo(plural, masculino) --> ['públicos'].
substantivo(singular, masculino) --> [pulo].
substantivo(singular, masculino) --> [punhado].
substantivo(singular, masculino) --> [quadro].
substantivo(singular, feminino) --> [quantidade].
substantivo(plural, femenino) --> [alertas].
substantivo(plural, femenino) --> ['aberrações'].
substantivo(singular, femenino) -->['atenção'].
substantivo(singular, masculino) --> [acordo].
substantivo(singular, masculino) --> ['açúcar'].
substantivo(singular, femenino) --> [acupuntura].
substantivo(singular, masculino) --> [acerto].
substantivo(singular, femenino) --> ['ação'].
substantivo(singular, masculino) --> [adolescente].
substantivo(plural, masculino) --> [adultos].
substantivo(singular, masculino) --> ['adversário'].
substantivo(plural, masculino) --> [afogados].
substantivo(singular, masculino) --> [afogado].
substantivo(singular, femenino) --> ['áfrica'].
substantivo(singular, femenino) --> [adotada].
substantivo(singular, femenino) --> [ajuda].
substantivo(singular, femenino) --> [agricultura].
substantivo(singular, femenino) --> ['água'].
substantivo(singular, femenino) --> [agulha].
substantivo(singular, masculino) --> ['álcool'].
substantivo(singular, femenino) --> [autoestima].
substantivo(singular, femenino) --> [autoconfianca].
substantivo(singular, femenino) --> [ameaca].
substantivo(plural, femenino) --> [ameacas].
substantivo(singular, femenino) --> [ambiciosa].
substantivo(singular, femenino) --> [americana].
substantivo(singular, masculino) --> [americano].
substantivo(singular, masculino) --> [amor].
substantivo(plural, masculino) --> [amores].
substantivo(singular, femenino) --> [analise].
substantivo(singular, femenino) --> [analogia].
substantivo(plural, femenino) --> [analogias].
substantivo(singular, femenino) --> [anarquia].
substantivo(singular, femenino) --> [anatomia].
substantivo(singular, femenino) --> [alice].
substantivo(singular, masculino) --> [allan].
substantivo(singular, masculino) --> [allen].
substantivo(plural, femenino) --> ['aplicações'].
substantivo(singular, femenino) --> [antropologia].
substantivo(singular, masculino) --> [aquecimento].
substantivo(singular, masculino) --> [apresentador].
substantivo(singular, femenino) --> ['área'].
substantivo(plural, femenino) --> ['áreas'].
substantivo(plural, femenino) --> ['árenas'].
substantivo(plural, masculino) --> [animadores].
substantivo(singular, femenino) --> ['anfitriã'].
substantivo(singular, femenino) --> [anomalia].
substantivo(plural, masculino) --> [burros].
substantivo(singular, masculino) --> [argumento].
substantivo(singular, masculino) --> [arquivo].
substantivo(singular, femenino) --> [arte].
substantivo(plural, masculino) --> [artistas].
substantivo(plural, femenino) --> [artistas].
substantivo(singular, masculino) --> [aumento].
substantivo(plural, femenino) --> ['árvores'].
substantivo(singular, masculino) --> [assedio].
substantivo(singular, femenino) --> ['associação'].
substantivo(singular, femenino) --> [associada].
substantivo(singular, masculino) --> [assunto].
substantivo(singular, femenino) --> [amyris].
substantivo(singular, femenino) --> [atividade].
substantivo(plural, masculino) --> ['aviões'].
substantivo(singular, masculino) --> ['avô'].
substantivo(singular, femenino) --> ['avô'].
substantivo(singular, masculino) --> ['avião'].
substantivo(singular, femenino) --> [avenida].
substantivo(singular, masculino) --> [avatar].
substantivo(singular, masculino) --> [abril].
substantivo(singular, femenino) --> [ala].
substantivo(plural, femenino) --> [alas].
substantivo(singular, masculino) --> [ano].
substantivo(plural, masculino) --> [anos].
substantivo(singular, femenino) --> [batalha].
substantivo(singular, femenino)--> [criatividade].
substantivo(singular, masculino)--> [criatividade].
substantivo(singular, femenino) --> [agredida].
substantivo(singular, femenino) --> [atmosfera].
substantivo(plural, femenino) --> [quotas].
substantivo(singular, masculino) --> [ego].
substantivo(singular, femenino) --> [ann].
substantivo(singular, femenino) --> [artrose].
substantivo(singular, femenino) --> [biotechnology].
substantivo(singular, femenino) --> [biotecnologia].
substantivo(singular, femenino) --> [biologia].
substantivo(plural, masculino) --> [biocombustíveis].
substantivo(singular, femenino) --> [bicicleta].
substantivo(singular, femenino) --> [boca].
substantivo(singular, femenino) --> [bola].
substantivo(singular, masculino) --> [bolo].
substantivo(singular, masculino) --> [boneco].
substantivo(singular, masculino) --> [braco].
substantivo(singular, masculino) --> [brasil].
substantivo(singular, masculino) --> [braun].
substantivo(singular, masculino) --> [brigadeiro].
substantivo(singular, masculino) --> [britanico].
substantivo(singular, masculino) --> [buraco].
substantivo(singular, femenino) --> [burra].
substantivo(plural, femenino) --> [bacterias].
substantivo(singular, femenino) --> [california].
substantivo(singular, masculino) --> [campeao].
substantivo(singular, masculino) --> [cancer].
substantivo(singular, masculino) --> [barco].
substantivo(singular, femenino) --> [barreira].
substantivo(plural, femenino) --> [barreiras].
substantivo(singular, femenino) --> [base].
substantivo(singular, masculino) --> [carvao].
substantivo(singular, femenino) --> [casa].
substantivo(plural, femenino) --> [casas].
substantivo(singular, femenino) --> ['balança'].
substantivo(singular, masculino) --> [cargo].
substantivo(plural, masculino) --> [cargos].
substantivo(singular, femenino) --> [carreira].
substantivo(singular, masculino) --> [carro].
substantivo(plural, masculino) --> ['carrões'].
substantivo(plural, masculino) --> [carros].
substantivo(plural, femenino) --> [cartas].
substantivo(singular, masculino) --> [carbono].
substantivo(plural, masculino) --> [caracteres].
substantivo(plural, femenino) --> ['características'].
substantivo(singular, masculino) --> [chato].
substantivo(singular, masculino) --> [chefe].
substantivo(singular, femenino) --> [chance].
substantivo(singular, femenino) --> [chamada].
substantivo(singular, femenino) --> [caverna].
substantivo(singular, masculino) --> ['cenário'].
substantivo(singular, masculino) --> [centro].
substantivo(singular, masculino) --> ['cérebro'].
substantivo(plural, femenino) --> [ceroulas].
substantivo(singular, masculino) --> [cego].
substantivo(singular, femenino) --> [cena].
substantivo(singular, masculino) --> [cinema].
substantivo(singular, femenino) --> [cirurgia].
substantivo(singular, masculino) --> ['clássico'].
substantivo(singular, masculino) --> [clima].
substantivo(plural, masculino) --> [clubes].
substantivo(singular, masculino) --> [cochilo].
substantivo(singular, masculino) --> ['código'].
substantivo(plural, masculino) --> ['códigos'].
substantivo(singular, femenino) --> ['cognição'].
substantivo(singular, masculino) --> ['coincidência'].
substantivo(singular, masculino) --> [colega].
substantivo(singular, femenino) --> [colega].
substantivo(singular, masculino) --> [colegas].
substantivo(singular, femenino) --> [colegas].
substantivo(singular, femenino) --> [coletiva].
substantivo(singular, masculino) --> [comando].
substantivo(singular, masculino) --> [combate].
substantivo(plural, masculino) --> ['combustíveis'].
substantivo(singular, masculino) --> ['combustível'].
substantivo(singular, masculino) --> [bairro].
substantivo(singular, femenino) --> [conta].
substantivo(plural, femenino) --> [contas].
substantivo(singular, masculino) --> [consumo].
substantivo(plural, masculino) --> [consumidores].
substantivo(singular, masculino) --> [conhecido].
substantivo(singular, masculino) --> [conhecimento].
substantivo(singular, masculino) --> [consenso].
substantivo(singular, femenino) --> ['consideração'].
substantivo(singular, femenino) --> ['construção'].
substantivo(plural, femenino) --> ['construções'].
substantivo(singular, masculino) --> [contato].
substantivo(singular, masculino) --> [contribuinte].
substantivo(singular, masculino) --> [controle].
substantivo(singular, femenino) --> [coordenadora].
substantivo(singular, femenino) --> [copa].
substantivo(singular, masculino) --> [corpo].
substantivo(singular, femenino) --> [cria].
substantivo(singular, masculino) --> [criado].
substantivo(singular, masculino) --> [crack].
substantivo(singular, femenino) --> [crack].
substantivo(singular, masculino) --> ['crânio'].
substantivo(singular, femenino) --> [cor].
substantivo(singular, femenino) --> [corda].
substantivo(singular, femenino) --> ['criança'].
substantivo(plural, femenino) --> ['crianças'].
substantivo(singular, masculino) --> [crime].
substantivo(singular, masculino) --> [criminoso].
substantivo(singular, femenino) --> [crise].
substantivo(singular, masculino) --> [culpado].
substantivo(singular, masculino) --> [debate].
substantivo(singular, masculino) --> [desenho].
substantivo(plural, masculino) --> [desenhos].
substantivo(plural, masculino) --> [ayrtons].
substantivo(singular, masculino) --> [dedo].
substantivo(singular, femenino) --> [defesa].
substantivo(plural, femenino) --> [defesas].
substantivo(singular, femenino) --> ['definição'].
substantivo(singular, masculino) --> [desaparecido].
substantivo(singular, femenino) --> [disputa].
substantivo(singular, masculino) --> [efeito].
substantivo(plural, masculino) --> [efeitos].
substantivo(plural, femenino) --> ['eleições'].
substantivo(plural, masculino) --> [elementos].
substantivo(singular, femenino) --> [eletricidade].
substantivo(singular, femenino) --> ['emoção'].
substantivo(plural, femenino) --> ['emoções'].
substantivo(singular, masculino) --> [emprego].
substantivo(singular, femenino) --> [empresa].
substantivo(plural, masculino) --> [desejos].
substantivo(singular, masculino) --> [desempenho].
substantivo(singular, masculino) --> [desenvolvimento].
substantivo(singular, masculino) --> [desejo].
substantivo(plural, femenino) --> [desculpas].
substantivo(singular, masculino) --> [diabo].
substantivo(plural, masculino) --> ['dicionários'].
substantivo(singular, femenino) --> ['diferença'].
substantivo(plural, femenino) --> [diferencas].
substantivo(singular, femenino) --> [dificuldade].
substantivo(plural, femenino) --> [dificuldades].
substantivo(plural, masculino) --> [empreendedores].
substantivo(plural, femenino) --> [empresas].
substantivo(singular, femenino) --> [droga].
substantivo(plural, femenino) --> [drogas].
substantivo(plural, masculino) --> [downloads].
substantivo(singular, femenino) --> [banda].
substantivo(singular, masculino) --> [baque].
substantivo(plural, femenino) --> [baratas].
substantivo(singular, masculino) --> [bullying].
substantivo(singular, masculino) --> [burton].
substantivo(singular, masculino) --> [bush].
substantivo(singular, femenino) --> ['cabeça'].
substantivo(singular, femenino) --> [caixa].
substantivo(singular, masculino) --> [dinheiro].
substantivo(singular, femenino) --> [dinheirama].
substantivo(singular, femenino) --> [diplomacia].
substantivo(plural, masculino) --> ['diplomáticos'].
substantivo(singular, masculino) --> [barbosa].
substantivo(singular, masculino) --> ['documentário'].
substantivo(singular, femenino) --> [doida].
substantivo(singular, femenino) --> ['doença'].
substantivo(plural, femenino) --> ['doenças'].
substantivo(singular, masculino) --> [drama].
substantivo(plural, femenino) --> [disputas].
substantivo(singular, femenino) --> ['eficiência'].
substantivo(plural, masculino) --> [dvds].
substantivo(plural, masculino) --> ['avanços'].
substantivo(singular, masculino) --> ['emissão'].
substantivo(singular, femenino) --> [china].
substantivo(plural, femenino) --> [chines].
substantivo(singular, femenino) --> [chicken].
substantivo(singular, femenino) --> [brasileira].
substantivo(singular, masculino) --> [brasileiro].
substantivo(plural, masculino) --> [brasileiros].
substantivo(plural, femenino) --> [beneficios].
substantivo(singular, masculino) --> [dna].
substantivo(singular, masculino) --> [bioterrorismo].
substantivo(singular, masculino) --> [blockbuster].
substantivo(singular, masculino) --> [choque].
substantivo(plural, femenino) --> [cidades].
substantivo(singular, femenino) --> [sede].
substantivo(plural, masculino) --> [economistas].
substantivo(plural, femenino) --> [economistas].
substantivo(plural, masculino) --> [fantoches].
substantivo(singular, femenino) --> [beira].
substantivo(singular, femenino) --> [beleza].
substantivo(singular, masculino) --> [calor].
substantivo(plural, femenino) --> [calorias].
substantivo(singular, masculino) --> [caminho].
substantivo(singular, femenino) --> [capacidade].
substantivo(singular, femenino) --> ['ciência'].
substantivo(singular, masculino) --> [cientista].
substantivo(singular, femenino) --> [cientista].
substantivo(plural, masculino) --> [cientistas].
substantivo(plural, femenino) --> [cientistas].
substantivo(singular, femenino) --> [classe].
substantivo(plural, masculino) --> [computadores].
substantivo(singular, femenino) --> ['conclusão'].
substantivo(singular, femenino) --> ['concorrência'].
substantivo(singular, masculino) --> [co2].
substantivo(singular, masculino) --> [cliente].
substantivo(singular, femenino) --> [cliente].
substantivo(singular, femenino) --> [comida].
substantivo(singular, femenino) --> ['competição'].
substantivo(singular, femenino) --> [compra].
substantivo(plural, masculino) --> [corpos].
substantivo(singular, femenino) --> [dor].
substantivo(plural, femenino) --> [dores].
substantivo(singular, femenino) --> ['dimensão'].
substantivo(plural, femenino) --> ['dimensões'].
substantivo(plural, masculino) --> [diretores].
substantivo(singular, femenino) --> ['discussão'].
substantivo(singular, femenino) --> [cara].
substantivo(singular, masculino) --> [cara].
substantivo(singular, masculino) --> [conflito].
substantivo(plural, masculino) --> [conflitos].
substantivo(plural, femenino) --> [conhecidas].
substantivo(singular, masculino) --> [dado].
substantivo(singular, femenino) --> ['distância'].
substantivo(singular, femenino) --> [economia].
substantivo(singular, femenino) --> ['classificação'].
substantivo(plural, femenino) --> ['dúvidas'].
substantivo(singular, femenino) --> [balburdia].
substantivo(singular, femenino) --> [bamba].
substantivo(singular, masculino) --> [bamba].
substantivo(plural, femenino) --> [cores].
substantivo(singular, masculino) --> [criador].
substantivo(singular, femenino) --> [decada].
substantivo(singular, femenino) --> [data].
substantivo(singular, masculino) --> [apelo].
substantivo(singular, femenino) --> [cartwright].
substantivo(singular, masculino) --> [bem].
substantivo(singular, femenino) --> [bisbilhotice].
substantivo(singular, masculino) --> [caso].
substantivo(plural, masculino) --> [casos].
substantivo(singular, femenino) --> [certeza].
substantivo(plural, femenino) --> [cilindradas].
substantivo(singular, masculino) --> [comercial].
substantivo(plural, femenino) --> [empresariais].
substantivo(plural, femenino) --> [emissoes].
substantivo(plural, femenino) --> [economistas].
substantivo(plural, masculino) --> [economistas].
substantivo(singular, masculino) --> [economista].
substantivo(singular, femenino) --> [economista].
substantivo(singular, masculino) --> [dislexico].
substantivo(singular, masculino) --> [direito].
substantivo(plural, masculino) --> [direitos].
substantivo(singular, femenino) --> [direta].
substantivo(singular, femenino) --> ['divulgação'].
substantivo(singular, femenino) --> [coisa].
substantivo(plural, femenino) --> [coisas].
substantivo(plural, femenino) --> [companhias].
substantivo(singular, femenino) --> ['comprovação'].
substantivo(singular, masculino) --> [dia].
substantivo(singular, masculino) --> [cuidado].
substantivo(singular, masculino) --> [conceito].
substantivo(singular, femenino) --> ['configuração'].
substantivo(plural, femenino) --> ['configurações'].
substantivo(singular, masculino) --> [counter].
substantivo(singular, femenino) --> ['determinação'].
substantivo(singular, masculino) --> [cortex].
substantivo(plural, masculino) --> [dados].
substantivo(singular, masculino) --> ['contrário'].
substantivo(singular, masculino) --> [curso].
substantivo(singular, masculino) --> [custo].
substantivo(singular, femenino) --> ['descrição'].
substantivo(singular, masculino) --> [davos].


%VERBO
verbo(singular) --> [persegue].
verbo(plural) --> [perseguem].
verbo(singular) --> [odeia].
verbo(plural) --> [odeiam].
verbo(singular) --> [fez].
verbo(singular) --> [fez].
verbo(singular) --> [fica].
verbo(singular) --> [fica].
verbo(singular) --> [ficado].
verbo(singular) --> [ficado].
verbo(plural) --> [ficado].
verbo(plural) --> [ficado].
verbo(plural) --> [ficam].
verbo(plural) --> [ficam].
verbo(singular) --> [ficando].
verbo(singular) --> [ficando].
verbo(plural) --> [ficando].
verbo(plural) --> [ficando].
verbo(singular) --> [ficar].
verbo(singular) --> [ficar].
verbo(plural) --> [ficar].
verbo(plural) --> [ficar].
verbo(singular) --> [ficará].
verbo(singular) --> [ficará].
verbo(plural) --> [ficaram].
verbo(plural) --> [ficaram].
verbo(plural) --> [ficarem].
verbo(plural) --> [ficarem].
verbo(singular) --> [ficava].
verbo(singular) --> [ficava].
verbo(singular) --> [ficou].
verbo(singular) --> [ficou].
verbo(singular) --> [fique].
verbo(singular) --> [fique].
verbo(plural) --> [fizemos].
verbo(plural) --> [fizemos].
verbo(plural) --> [fizeram].
verbo(plural) --> [fizeram].
verbo(singular) --> [foi].
verbo(singular) --> [foi].
verbo(singular) --> ['for'].
verbo(singular) --> ['for'].
verbo(singular) --> [fora].
verbo(singular) --> [fora].
verbo(plural) --> [foram].
verbo(plural) --> [foram].
verbo(singular) --> ['forçasse'].
verbo(singular) --> ['forçasse'].
verbo(plural) --> [forem].
verbo(plural) --> [forem].
verbo(singular) --> [forma].
verbo(singular) --> [forma].
verbo(singular) --> [formando].
verbo(singular) --> [formando].
verbo(plural) --> [formando].
verbo(plural) --> [formando].
verbo(singular) --> [formar].
verbo(singular) --> [formar].
verbo(plural) --> [formar].
verbo(plural) --> [formar].
verbo(singular) --> [formas].
verbo(singular) --> [formas].
verbo(plural) --> [fossem].
verbo(plural) --> [fossem].
verbo(singular) --> [franze].
verbo(singular) --> [franze].
verbo(singular) --> [freio].
verbo(singular) --> [freio].
verbo(singular) --> [fugiu].
verbo(singular) --> [fugiu].
verbo(singular) --> [funciona].
verbo(singular) --> [funciona].
verbo(singular) --> [funcionando].
verbo(singular) --> [funcionando].
verbo(plural) --> [funcionando].
verbo(plural) --> [funcionando].
verbo(plural) --> [funcionou].
verbo(plural) --> [funcionou].
verbo(singular) --> [fundei].
verbo(singular) --> [fundei].
verbo(singular) --> [fundia].
verbo(singular) --> [fundia].
verbo(singular) --> [ganha].
verbo(singular) --> [ganha].
verbo(plural) --> [ganham].
verbo(plural) --> [ganham].
verbo(singular) --> [ganhando].
verbo(singular) --> [ganhando].
verbo(plural) --> [ganhando].
verbo(plural) --> [ganhando].
verbo(singular) --> [ganhar].
verbo(singular) --> [ganhar].
verbo(plural) --> [ganhar].
verbo(plural) --> [ganhar].
verbo(plural) --> [ganhariam].
verbo(plural) --> [ganhariam].
verbo(singular) --> [ganhou].
verbo(singular) --> [ganhou].
verbo(singular) --> [garantir].
verbo(singular) --> [garantir].
verbo(plural) --> [garantir].
verbo(plural) --> [garantir].
verbo(singular) --> [gastar].
verbo(singular) --> [gastar].
verbo(plural) --> [gastar].
verbo(plural) --> [gastar].
verbo(singular) --> [gasto].
verbo(singular) --> [gasto].
verbo(singular) --> [gelo].
verbo(singular) --> [gelo].
verbo(singular) --> [gera].
verbo(singular) --> [gera].
verbo(singular) --> [gerar].
verbo(singular) --> [gerar].
verbo(plural) --> [gerar].
verbo(plural) --> [gerar].
verbo(singular) --> [gosta].
verbo(singular) --> [gosta].
verbo(plural) --> [gostam].
verbo(plural) --> [gostam].
verbo(singular) --> [gritou].
verbo(singular) --> [gritou].
verbo(singular) --> [guarda].
verbo(singular) --> [guarda].
verbo(plural) --> [guiam].
verbo(plural) --> [guiam].
verbo(singular) --> ['há'].
verbo(singular) --> ['há'].
verbo(plural) --> ['há'].
verbo(plural) --> ['há'].
verbo(singular) --> [havia].
verbo(singular) --> [havia].
verbo(plural) --> [iam].
verbo(plural) --> [iam].
verbo(singular) --> [identificar].
verbo(singular) --> [identificar].
verbo(plural) --> [identificar].
verbo(plural) --> [identificar].
verbo(singular) --> [ilustra].
verbo(singular) --> [ilustra].
verbo(singular) --> [imagina].
verbo(singular) --> [imagina].
verbo(singular) --> [imaginar].
verbo(singular) --> [imaginar].
verbo(plural) --> [imaginar].
verbo(plural) --> [imaginar].
verbo(singular) --> [imagine].
verbo(singular) --> [imagine].
verbo(singular) --> [impacto].
verbo(singular) --> [impacto].
verbo(singular) --> [impede].
verbo(singular) --> [impede].
verbo(singular) --> [impedir].
verbo(singular) --> [impedir].
verbo(plural) --> [impedir].
verbo(plural) --> [impedir].
verbo(plural) --> ['impõem'].
verbo(plural) --> ['impõem'].
verbo(singular) --> [imprensa].
verbo(singular) --> [imprensa].
verbo(plural) --> [impulsionam].
verbo(plural) --> [impulsionam].
verbo(singular) --> [impulsionar].
verbo(singular) --> [impulsionar].
verbo(plural) --> [impulsionar].
verbo(plural) --> [impulsionar].
verbo(singular) --> [impulsionou].
verbo(singular) --> [impulsionou].
verbo(plural) --> [incitam].
verbo(plural) --> [incitam].
verbo(plural) --> [indicam].
verbo(plural) --> [indicam].
verbo(singular) --> [influenciar].
verbo(singular) --> [influenciar].
verbo(plural) --> [influenciar].
verbo(plural) --> [influenciar].
verbo(singular) --> [insistir].
verbo(singular) --> [insistir].
verbo(plural) --> [insistir].
verbo(plural) --> [insistir].
verbo(plural) --> [interagem].
verbo(plural) --> [interagem].
verbo(singular) --> [interessa].
verbo(singular) --> [interessa].
verbo(singular) --> [invadir].
verbo(singular) --> [invadir].
verbo(plural) --> [invadir].
verbo(plural) --> [invadir].
verbo(singular) --> [ir].
verbo(singular) --> [ir].
verbo(plural) --> [ir].
verbo(plural) --> [ir].
verbo(singular) --> ['irá'].
verbo(singular) --> ['irá'].
verbo(plural) --> [iriam].
verbo(plural) --> [iriam].
verbo(singular) --> [jogar].
verbo(singular) --> [jogar].
verbo(plural) --> [jogar].
verbo(plural) --> [jogar].
verbo(singular) --> [jogo].
verbo(singular) --> [jogo].
verbo(plural) --> [juntam].
verbo(plural) --> [juntam].
verbo(plural) --> ['lançam'].
verbo(plural) --> ['lançam'].
verbo(plural) --> ['lançarão'].
verbo(plural) --> ['lançarão'].
verbo(singular) --> [lembrar].
verbo(singular) --> [lembrar].
verbo(plural) --> [lembrar].
verbo(plural) --> [lembrar].
verbo(singular) --> [ler].
verbo(singular) --> [ler].
verbo(plural) --> [ler].
verbo(plural) --> [ler].
verbo(singular) --> [leva].
verbo(singular) --> [leva].
verbo(singular) --> [levando].
verbo(singular) --> [levando].
verbo(plural) --> [levando].
verbo(plural) --> [levando].
verbo(singular) --> [levar].
verbo(singular) --> [levar].
verbo(plural) --> [levar].
verbo(plural) --> [levar].
verbo(singular) --> [levou].
verbo(singular) --> [levou].
verbo(singular) --> [lidando].
verbo(singular) --> [lidando].
verbo(plural) --> [lidando].
verbo(plural) --> [lidando].
verbo(singular) --> [lidar].
verbo(singular) --> [lidar].
verbo(plural) --> [lidar].
verbo(plural) --> [lidar].
verbo(singular) --> [limitar].
verbo(singular) --> [limitar].
verbo(plural) --> [limitar].
verbo(plural) --> [limitar].
verbo(plural) --> [lucram].
verbo(plural) --> [lucram].
verbo(singular) --> [lucrar].
verbo(singular) --> [lucrar].
verbo(plural) --> [lucrar].
verbo(plural) --> [lucrar].
verbo(singular) --> [lucrou].
verbo(singular) --> [lucrou].
verbo(singular) --> [malhar].
verbo(singular) --> [malhar].
verbo(plural) --> [malhar].
verbo(plural) --> [malhar].
verbo(singular) --> [mandando].
verbo(singular) --> [mandando].
verbo(plural) --> [mandando].
verbo(plural) --> [mandando].
verbo(singular) --> [mandar].
verbo(singular) --> [mandar].
verbo(plural) --> [mandar].
verbo(plural) --> [mandar].
verbo(singular) --> [mandou].
verbo(singular) --> [mandou].
verbo(singular) --> [manter].
verbo(singular) --> [manter].
verbo(plural) --> [manter].
verbo(plural) --> [manter].
verbo(singular) --> [maquinando].
verbo(singular) --> [maquinando].
verbo(plural) --> [maquinando].
verbo(plural) --> [maquinando].
verbo(singular) --> [melhora].
verbo(singular) --> [melhora].
verbo(singular) --> [melhorar].
verbo(singular) --> [melhorar].
verbo(plural) --> [melhorar].
verbo(plural) --> [melhorar].
verbo(plural) --> [melhoraram].
verbo(plural) --> [melhoraram].
verbo(singular) --> [melhorou].
verbo(singular) --> [melhorou].
verbo(singular) --> [menosprezando].
verbo(singular) --> [menosprezando].
verbo(plural) --> [menosprezando].
verbo(plural) --> [menosprezando].
verbo(singular) --> [mente].
verbo(singular) --> [mente].
verbo(singular) --> [merece].
verbo(singular) --> [merece].
verbo(singular) --> [militar].
verbo(singular) --> [militar].
verbo(plural) --> [militar].
verbo(plural) --> [militar].
verbo(plural) --> [misturamos].
verbo(plural) --> [misturamos].
verbo(singular) --> [misturar].
verbo(singular) --> [misturar].
verbo(plural) --> [misturar].
verbo(plural) --> [misturar].
verbo(singular) --> [morrer].
verbo(singular) --> [morrer].
verbo(plural) --> [morrer].
verbo(plural) --> [morrer].
verbo(singular) --> [mostra].
verbo(singular) --> [mostra].
verbo(plural) --> [mostram].
verbo(plural) --> [mostram].
verbo(singular) --> [mostrar].
verbo(singular) --> [mostrar].
verbo(plural) --> [mostrar].
verbo(plural) --> [mostrar].
verbo(plural) --> [mostraram].
verbo(plural) --> [mostraram].
verbo(singular) --> [mostrou].
verbo(singular) --> [mostrou].
verbo(plural) --> [mudam].
verbo(plural) --> [mudam].
verbo(singular) --> [mudar].
verbo(singular) --> [mudar].
verbo(plural) --> [mudar].
verbo(plural) --> [mudar].
verbo(singular) --> [mude].
verbo(singular) --> [mude].
verbo(singular) --> [mudou].
verbo(singular) --> [mudou].
verbo(singular) --> [nada].
verbo(singular) --> [nada].
verbo(singular) --> [nadar].
verbo(singular) --> [nadar].
verbo(plural) --> [nadar].
verbo(plural) --> [nadar].
verbo(singular) --> ['nasça'].
verbo(singular) --> ['nasça'].
verbo(singular) --> [nasce].
verbo(singular) --> [nasce].
verbo(singular) --> [navega].
verbo(singular) --> [navega].
verbo(singular) --> [navegar].
verbo(singular) --> [navegar].
verbo(plural) --> [navegar].
verbo(plural) --> [navegar].
verbo(singular) --> [note].
verbo(singular) --> [note].
verbo(singular) --> [obrigar].
verbo(singular) --> [obrigar].
verbo(plural) --> [obrigar].
verbo(plural) --> [obrigar].
verbo(singular) --> [ocupar].
verbo(singular) --> [ocupar].
verbo(plural) --> [ocupar].
verbo(plural) --> [ocupar].
verbo(singular) --> [olha].
verbo(singular) --> [olha].
verbo(singular) --> [olhando].
verbo(singular) --> [olhando].
verbo(plural) --> [olhando].
verbo(plural) --> [olhando].
verbo(singular) --> [olhar].
verbo(singular) --> [olhar].
verbo(plural) --> [olhar].
verbo(plural) --> [olhar].
verbo(singular) --> [olhe].
verbo(singular) --> [olhe].
verbo(singular) --> [organiza].
verbo(singular) --> [organiza].
verbo(singular) --> [organizar].
verbo(singular) --> [organizar].
verbo(plural) --> [organizar].
verbo(plural) --> [organizar].
verbo(singular) --> [ouvi].
verbo(singular) --> [ouvi].
verbo(singular) --> [paga].
verbo(singular) --> [paga].
verbo(singular) --> [pagou].
verbo(singular) --> [pagou].
verbo(singular) --> [parar].
verbo(singular) --> [parar].
verbo(plural) --> [parar].
verbo(plural) --> [parar].
verbo(singular) --> [pare].
verbo(singular) --> [pare].
verbo(singular) --> [parece].
verbo(singular) --> [parece].
verbo(plural) --> [parecem].
verbo(plural) --> [parecem].
verbo(singular) --> [partes].
verbo(singular) --> [partes].
verbo(singular) --> [participar].
verbo(singular) --> [participar].
verbo(plural) --> [participar].
verbo(plural) --> [participar].
verbo(singular) --> [partir].
verbo(singular) --> [partir].
verbo(plural) --> [partir].
verbo(plural) --> [partir].
verbo(plural) --> [passam].
verbo(plural) --> [passam].
verbo(singular) --> [passar].
verbo(singular) --> [passar].
verbo(plural) --> [passar].
verbo(plural) --> [passar].
verbo(plural) --> [passaram].
verbo(plural) --> [passaram].
verbo(singular) --> [passei].
verbo(singular) --> [passei].
verbo(singular) --> [passo].
verbo(singular) --> [passo].
verbo(singular) --> [passou].
verbo(singular) --> [passou].
verbo(plural) --> [pedimos].
verbo(plural) --> [pedimos].
verbo(singular) --> [pedir].
verbo(singular) --> [pedir].
verbo(plural) --> [pedir].
verbo(plural) --> [pedir].
verbo(singular) --> [pega].
verbo(singular) --> [pega].
verbo(plural) --> [pegarem].
verbo(plural) --> [pegarem].
verbo(singular) --> [pegou].
verbo(singular) --> [pegou].
verbo(singular) --> [pensa].
verbo(singular) --> [pensa].
verbo(singular) --> [pensando].
verbo(singular) --> [pensando].
verbo(plural) --> [pensando].
verbo(plural) --> [pensando].
verbo(singular) --> [pensar].
verbo(singular) --> [pensar].
verbo(plural) --> [pensar].
verbo(plural) --> [pensar].
verbo(singular) --> [pensava].
verbo(singular) --> [pensava].
verbo(singular) --> [pense].
verbo(singular) --> [pense].
verbo(singular) --> [perder].
verbo(singular) --> [perder].
verbo(plural) --> [perder].
verbo(plural) --> [perder].
verbo(plural) --> [perfuram].
verbo(plural) --> [perfuram].
verbo(singular) --> [perguntar].
verbo(singular) --> [perguntar].
verbo(plural) --> [perguntar].
verbo(plural) --> [perguntar].
verbo(plural) --> [perguntavam].
verbo(plural) --> [perguntavam].
verbo(singular) --> [persiste].
verbo(singular) --> [persiste].
verbo(plural) --> [pesquisaram].
verbo(plural) --> [pesquisaram].
verbo(singular) --> [pesquiso].
verbo(singular) --> [pesquiso].
verbo(singular) --> [piorar].
verbo(singular) --> [piorar].
verbo(plural) --> [piorar].
verbo(plural) --> [piorar].
verbo(plural) --> [pisam].
verbo(plural) --> [pisam].
verbo(singular) --> [plantar].
verbo(singular) --> [plantar].
verbo(plural) --> [plantar].
verbo(plural) --> [plantar].
verbo(singular) --> [pode].
verbo(singular) --> [pode].
verbo(singular) --> ['pôde'].
verbo(singular) --> ['pôde'].
verbo(plural) --> [podem].
verbo(plural) --> [podem].
verbo(singular) --> [poder].
verbo(singular) --> [poder].
verbo(plural) --> [poder].
verbo(plural) --> [poder].
verbo(plural) --> ['poderão'].
verbo(plural) --> ['poderão'].
verbo(plural) --> [poderemos].
verbo(plural) --> [poderemos].
verbo(singular) --> [poderia].
verbo(singular) --> [poderia].
verbo(plural) --> ['poderíamos'].
verbo(plural) --> ['poderíamos'].
verbo(singular) --> [poluir].
verbo(singular) --> [poluir].
verbo(plural) --> [poluir].
verbo(plural) --> [poluir].
verbo(singular) --> [por].
verbo(singular) --> [por].
verbo(plural) --> [por].
verbo(plural) --> [por].
verbo(singular) --> [possa].
verbo(singular) --> [possa].
verbo(plural) --> [possam].
verbo(plural) --> [possam].
verbo(plural) --> [postam].
verbo(plural) --> [postam].
verbo(singular) --> [postas].
verbo(singular) --> [postas].
verbo(plural) --> [postas].
verbo(singular) --> [posto].
verbo(singular) --> [posto].
verbo(singular) --> [precisa].
verbo(singular) --> [precisa].
verbo(plural) --> [precisam].
verbo(plural) --> [precisam].
verbo(plural) --> [precisamos].
verbo(plural) --> [precisamos].
verbo(plural) --> [precisaremos].
verbo(plural) --> [precisaremos].
verbo(singular) --> [precisaria].
verbo(singular) --> [precisaria].
verbo(singular) --> [preciso].
verbo(singular) --> [preciso].
verbo(singular) --> [prefere].
verbo(singular) --> [prefere].
verbo(singular) --> [preocupar].
verbo(singular) --> [preocupar].
verbo(plural) --> [preocupar].
verbo(plural) --> [preocupar].
verbo(singular) --> [prescrever].
verbo(singular) --> [prescrever].
verbo(plural) --> [prescrever].
verbo(plural) --> [prescrever].
verbo(plural) --> [prestarmos].
verbo(plural) --> [prestarmos].
verbo(singular) --> [pretendo].
verbo(singular) --> [pretendo].
verbo(singular) --> [processa].
verbo(singular) --> [processa].
verbo(singular) --> [processar].
verbo(singular) --> [processar].
verbo(plural) --> [processar].
verbo(plural) --> [processar].
verbo(singular) --> [processo].
verbo(singular) --> [processo].
verbo(plural) --> [procuramos].
verbo(plural) --> [procuramos].
verbo(plural) --> [produzem].
verbo(plural) --> [produzem].
verbo(singular) --> [programa].
verbo(singular) --> [programa].
verbo(singular) --> [programas].
verbo(singular) --> [programas].
verbo(singular) --> [projetar].
verbo(singular) --> [projetar].
verbo(plural) --> [projetar].
verbo(plural) --> [projetar].
verbo(singular) --> [prometendo].
verbo(singular) --> [prometendo].
verbo(plural) --> [prometendo].
verbo(plural) --> [prometendo].
verbo(plural) --> [prometeram].
verbo(plural) --> [prometeram].
verbo(singular) --> [protestar].
verbo(singular) --> [protestar].
verbo(plural) --> [protestar].
verbo(plural) --> [protestar].
verbo(singular) --> [protocolo].
verbo(singular) --> [protocolo].
verbo(singular) --> [prova].
verbo(singular) --> [prova].
verbo(singular) --> [provar].
verbo(singular) --> [provar].
verbo(plural) --> [provar].
verbo(plural) --> [provar].
verbo(singular) --> [provou].
verbo(singular) --> [provou].
verbo(singular) --> [publica].
verbo(singular) --> [publica].
verbo(plural) --> [publiquem].
verbo(plural) --> [publiquem].
verbo(singular) --> [pudesse].
verbo(singular) --> [pudesse].
verbo(singular) --> [pulo].
verbo(singular) --> [pulo].
verbo(plural) --> [abastecemos].
verbo(plural) --> [abastecemos].
verbo(singular) -->[duvidas].
verbo(singular) -->[duvidas].
verbo(singular) -->[caso].
verbo(singular) -->[caso].
verbo(singular) --> [caminho].
verbo(singular) --> [caminho].
verbo(singular) --> [desempenho].
verbo(singular) --> [desempenho].
verbo(singular) --> [emprego].
verbo(singular) --> [emprego].
verbo(singular) --> [consumo].
verbo(singular) --> [consumo].
verbo(singular) --> [cochilo].
verbo(singular) --> [cochilo].
verbo(singular) --> [abastecido].
verbo(singular) --> [abastecido].
verbo(singular) --> [aumento].
verbo(singular) --> [aumento].
verbo(singular) --> [assusta].
verbo(singular) --> [assusta].
verbo(singular) --> [acaba].
verbo(singular) --> [acaba].
verbo(singular) --> [acabou].
verbo(singular) --> [arquivo].
verbo(singular) --> [arquivo].
verbo(singular) --> [acabou].
verbo(singular) --> [acabar].
verbo(singular) --> [argumento].
verbo(singular) --> [argumento].
verbo(singular) --> [acabar].
verbo(plural) --> [acertaram].
verbo(plural) --> [acertaram].
verbo(singular) --> [acha].
verbo(singular) --> [acha].
verbo(singular) --> [achar].
verbo(singular) --> [achar].
verbo(plural) --> [achar].
verbo(plural) --> [achar].
verbo(singular) --> [acontece].
verbo(singular) --> [acontece].
verbo(singular) --> [acontecendo].
verbo(singular) --> [acontecendo].
verbo(plural) --> [aconteceram].
verbo(plural) --> [aconteceram].
verbo(singular) --> [aconteceria].
verbo(singular) --> [aconteceria].
verbo(singular) --> [acontecendo].
verbo(singular) --> [acontecendo].
verbo(singular) --> [aconteceu].
verbo(singular) --> [aconteceu].
verbo(singular) --> [acordada].
verbo(singular) --> [acordada].
verbo(singular) --> [acordado].
verbo(singular) --> [acordado].
verbo(singular) --> [acordar].
verbo(singular) --> [acordar].
verbo(plural) --> [acordar].
verbo(plural) --> [acordar].
verbo(singular) --> [acordo].
verbo(singular) --> [acordo].
verbo(singular) --> [acordou].
verbo(singular) --> [acordou].
verbo(plural) --> [acreditam].
verbo(plural) --> [acreditam].
verbo(singular) --> [acreditando].
verbo(singular) --> [acreditando].
verbo(singular) --> [acreditava].
verbo(singular) --> [acreditava].
verbo(plural) --> [acostumados].
verbo(plural) --> [acostumados].
verbo(plural) --> [acreditavam].
verbo(plural) --> [acreditavam].
verbo(singular) --> [acredite].
verbo(singular) --> [acredite].
verbo(singular) --> [acerto].
verbo(singular) --> [acerto].
verbo(singular) --> [acumulado].
verbo(singular) --> [afetaria].
verbo(singular) --> [afetaria].
verbo(singular) --> [afogado].
verbo(singular) --> [afirmando].
verbo(singular) --> [afirmando].
verbo(singular) --> [agir].
verbo(singular) --> [agir].
verbo(singular) --> [ajuda].
verbo(singular) --> [ajuda].
verbo(singular) --> [ajudar].
verbo(singular) --> [ajudar].
verbo(plural) --> [ajudar].
verbo(plural) --> [ajudar].
verbo(singular) --> [alcancado].
verbo(singular) --> [alcancado].
verbo(singular) --> [alimentar].
verbo(singular) --> [alimentar].
verbo(singular) --> [alimente].
verbo(singular) --> [alimente].
verbo(singular) --> [aliviar].
verbo(singular) --> [aliviar].
verbo(plural) --> [aliviar].
verbo(plural) --> [aliviar].
verbo(singular) --> [alternar].
verbo(singular) --> [alternar].
verbo(plural) --> [alternar].
verbo(plural) --> [alternar].
verbo(singular) --> ['ameaça'].
verbo(singular) --> ['ameaça'].
verbo(singular) --> ['ameaças'].
verbo(singular) --> ['ameaças'].
verbo(singular) --> [ameacava].
verbo(singular) --> [ameacava].
verbo(singular) --> [amputei].
verbo(singular) --> [amputei].
verbo(singular) --> [analisar].
verbo(singular) --> [analisar].
verbo(plural) --> [analisar].
verbo(plural) --> [analisar].
verbo(singular) --> [andando].
verbo(singular) --> [andando].
verbo(singular) --> [andar].
verbo(singular) --> [andar].
verbo(plural) --> [andar].
verbo(plural) --> [andar].
verbo(singular) --> [aproveitar].
verbo(singular) --> [aproveitar].
verbo(singular) --> [aproveitara].
verbo(singular) --> [aproveitara].
verbo(singular) --> [apagar].
verbo(singular) --> [apagar].
verbo(plural) --> [apagar].
verbo(plural) --> [apagar].
verbo(singular) --> [aparece].
verbo(singular) --> [aparece].
verbo(singular) --> [aparecer].
verbo(singular) --> [aparecer].
verbo(plural) --> [aparecer].
verbo(plural) --> [aparecer].
verbo(singular) --> [apareceu].
verbo(singular) --> [apareceu].
verbo(plural) --> [apareciam].
verbo(plural) --> [apareciam].
verbo(singular) --> [aprender].
verbo(singular) --> [aprender].
verbo(plural) --> [aprender].
verbo(plural) --> [aprender].
verbo(singular) --> [aprendera].
verbo(singular) --> [aprendera].
verbo(singular) --> [aprende].
verbo(singular) --> [aprende].
verbo(plural) --> [aprendemos].
verbo(plural) --> [aprendemos].
verbo(singular) --> [aprendendo].
verbo(singular) --> [aprendendo].
verbo(singular) --> [apaga].
verbo(singular) --> [apaga].
verbo(singular) --> [anunciar].
verbo(singular) --> [anunciar].
verbo(singular) --> [aperfeicoado].
verbo(singular) --> [aperfeicoado].
verbo(plural) --> [aproveitam].
verbo(plural) --> [aproveitam].
verbo(singular) --> [argumentar].
verbo(singular) --> [argumentar].
verbo(singular) --> ['arregaçar'].
verbo(singular) --> ['arregaçar'].
verbo(singular) --> [provar].
verbo(singular) --> [provar].
verbo(plural) --> [provar].
verbo(plural) --> [provar].
verbo(plural) --> [temos].
verbo(plural) --> [temos].
verbo(plural) --> [armazenamos].
verbo(plural) --> [armazenamos].
verbo(singular) --> [arranjou].
verbo(singular) --> [arranjou].
verbo(singular) --> [assistir].
verbo(singular) --> [assistir].
verbo(plural) --> [assistir].
verbo(plural) --> [assistir].
verbo(singular) --> [assumir].
verbo(singular) --> [assumir].
verbo(plural) --> [assumir].
verbo(plural) --> [assumir].
verbo(singular) --> [atrapalhar].
verbo(singular) --> [atrapalhar].
verbo(plural) --> [atrapalhar].
verbo(plural) --> [atrapalhar].
verbo(singular) --> [atrapalhava].
verbo(singular) --> [atrapalhava].
verbo(singular) --> [aumentou].
verbo(singular) --> [aumentou].
verbo(singular) --> [admiti_lo].
verbo(singular) --> [batendo].
verbo(singular) --> [batendo].
verbo(singular) --> [afirma].
verbo(singular) --> [afirma].
verbo(singular) --> [agredida].
verbo(singular) --> [agredida].
verbo(singular) --> [alcance].
verbo(singular) --> [alcance].
verbo(singular) --> [baixado].
verbo(singular) --> [baixado].
verbo(singular) --> ['balança'].
verbo(singular) --> ['balança'].
verbo(plural) --> [careciam].
verbo(plural) --> [careciam].
verbo(plural) --> [careciam].
verbo(singular) --> [chega].
verbo(singular) --> [chega].
verbo(singular) --> [chegada].
verbo(singular) --> [chegada].
verbo(plural) --> [chegam].
verbo(plural) --> [chegam].
verbo(singular) --> [chegou].
verbo(singular) --> [chegou].
verbo(singular) --> ['começa'].
verbo(singular) --> ['começa'].
verbo(plural) --> ['começam'].
verbo(plural) --> ['comecam'].
verbo(singular) --> ['começar'].
verbo(singular) --> ['começar'].
verbo(plural) --> ['começarem'].
verbo(plural) --> ['começarem'].
verbo(singular) --> [comece].
verbo(singular) --> [comece].
verbo(singular) --> ['começo'].
verbo(singular) --> ['começo'].
verbo(singular) --> ['começou'].
verbo(singular) --> ['começou'].
verbo(singular) --> [comer].
verbo(singular) --> [comer].
verbo(singular) --> [coloca].
verbo(singular) --> [coloca].
verbo(plural) --> [colocam].
verbo(plural) --> [colocam].
verbo(singular) --> [colocar].
verbo(singular) --> [colocar].
verbo(plural) --> [colocar].
verbo(plural) --> [colocar].
verbo(plural) --> [colocaram].
verbo(plural) --> [colocaram].
verbo(singular) --> [colocou].
verbo(singular) --> [colocou].
verbo(singular) --> [causa].
verbo(singular) --> [causa].
verbo(singular) --> [causado].
verbo(singular) --> [causado].
verbo(plural) --> [causam].
verbo(plural) --> [causam].
verbo(singular) --> [causar].
verbo(singular) --> [causar].
verbo(singular) --> [cavucar].
verbo(singular) --> [cavucar].
verbo(plural) --> [chamaram].
verbo(plural) --> [chamaram].
verbo(singular) --> [causando].
verbo(singular) --> [causando].
verbo(plural) --> [buscam].
verbo(plural) --> [buscam].
verbo(singular) --> [bancar].
verbo(singular) --> [bancar].
verbo(singular) --> ['aumentá_lo'].
verbo(singular) --> [batia].
verbo(singular) --> [batia].
verbo(singular) --> [cobrar].
verbo(singular) --> [cobrar].
verbo(plural) --> [cancelaram].
verbo(plural) --> [cancelaram].
verbo(singular) --> ['caído'].
verbo(singular) --> ['caído'].
verbo(singular) --> [cair].
verbo(singular) --> [cair].
verbo(plural) --> [cair].
verbo(plural) --> [cair].
verbo(singular) --> [cairia].
verbo(singular) --> [cairia].
verbo(singular) --> [concentrar].
verbo(singular) --> [concentrar].
verbo(plural) --> [concentrar].
verbo(plural) --> [concentrar].
verbo(singular) --> [concluir].
verbo(singular) --> [concluir].
verbo(plural) --> [concluir].
verbo(plural) --> [concluir].
verbo(singular) --> [concluiu].
verbo(singular) --> [concluiu].
verbo(singular) --> [concordar].
verbo(singular) --> [concordar].
verbo(plural) --> [concordar].
verbo(plural) --> [concordar].
verbo(singular) --> [concordou].
verbo(singular) --> [concordou].
verbo(singular) --> [confiar].
verbo(singular) --> [confiar].
verbo(plural) --> [confiar].
verbo(plural) --> [confiar].
verbo(plural) --> [confiavam].
verbo(plural) --> [confiavam].
verbo(singular) --> [confirmaram].
verbo(plural) --> [confirmaram].
verbo(singular) --> [consegue].
verbo(singular) --> [consegue].
verbo(plural) --> [conseguem].
verbo(plural) --> [conseguem].
verbo(singular) --> [conseguia].
verbo(singular) --> [conseguia].
verbo(plural) --> [conseguiam].
verbo(plural) --> [conseguiam].
verbo(singular) --> [conseguir].
verbo(singular) --> [conseguir].
verbo(plural) --> [conseguir].
verbo(plural) --> [conseguir].
verbo(plural) --> [conseguiram].
verbo(plural) --> [conseguiram].
verbo(plural) --> ['conseguirão'].
verbo(plural) --> ['conseguirão'].
verbo(singular) --> [comportar].
verbo(singular) --> [comportar].
verbo(singular) --> [comprometeu].
verbo(singular) --> [comprometeu].
verbo(singular) --> [construindo].
verbo(singular) --> [construindo].
verbo(singular) --> [construir].
verbo(singular) --> [construir].
verbo(plural) --> [construir].
verbo(plural) --> [construir].
verbo(singular) --> [concentra].
verbo(singular) --> [concentra].
verbo(singular) --> [constatar].
verbo(singular) --> [constatar].
verbo(plural) --> [constatar].
verbo(plural) --> [constatar].
verbo(plural) --> [compramos].
verbo(plural) --> [compramos].
verbo(singular) --> [complicar].
verbo(singular) --> [complicar].
verbo(plural) --> [complicar].
verbo(plural) --> [complicar].
verbo(plural) --> [comportamos].
verbo(plural) --> [comportamos].
verbo(plural) --> [constroem].
verbo(plural) --> [constroem].
verbo(singular) --> [conta].
verbo(singular) --> [conta].
verbo(singular) --> [contas].
verbo(singular) --> [contas].
verbo(plural) --> [continuam].
verbo(plural) --> [continuam].
verbo(singular) --> [contou].
verbo(singular) --> [contou].
verbo(singular) --> [contar].
verbo(singular) --> [contar].
verbo(plural) --> [contar].
verbo(singular) --> [contar].
verbo(singular) --> [contrariar].
verbo(singular) --> [contrariar].
verbo(plural) --> [contrariar].
verbo(plural) --> [contrariar].
verbo(singular) --> [contribui].
verbo(singular) --> [contribui].
verbo(singular) --> [controlar].
verbo(singular) --> [controlar].
verbo(plural) --> [controlar].
verbo(plural) --> [controlar].
verbo(singular) --> [construidos].
verbo(singular) --> [construidos].
verbo(singular) --> [controle].
verbo(singular) --> [controle].
verbo(singular) --> [copie].
verbo(singular) --> [copie].
verbo(singular) --> [corre].
verbo(singular) --> [corre].
verbo(singular) --> [correr].
verbo(singular) --> [correr].
verbo(plural) --> [costumam].
verbo(plural) --> [costumam].
verbo(singular) --> [crescendo].
verbo(singular) --> [crescendo].
verbo(singular) --> [crescer].
verbo(singular) --> [crescer].
verbo(plural) --> [crescer].
verbo(plural) --> [crescer].
verbo(singular) --> [cria].
verbo(singular) --> [cria].
verbo(singular) --> [criado].
verbo(singular) --> [criado].
verbo(singular) --> [criar].
verbo(singular) --> [criar].
verbo(plural) --> [criar].
verbo(plural) --> [criar].
verbo(plural) --> [criam].
verbo(plural) --> [criam].
verbo(singular) --> [decidi].
verbo(singular) --> [decidi].
verbo(singular) --> [decidiu].
verbo(singular) --> [decidiu].
verbo(singular) --> [decifrar].
verbo(singular) --> [decifrar].
verbo(plural) --> [decifrar].
verbo(plural) --> [decifrar].
verbo(plural) --> [declaram].
verbo(plural) --> [declaram].
verbo(singular) --> [decretou].
verbo(singular) --> [decretou].
verbo(plural) --> [defendem].
verbo(plural) --> [defendem].
verbo(singular) --> [deixa].
verbo(singular) --> [deixa].
verbo(plural) --> [deixam].
verbo(plural) --> [deixam].
verbo(singular) --> [deixar].
verbo(singular) --> [deixar].
verbo(plural) --> [deixaram].
verbo(plural) --> [deixaram].
verbo(singular) --> [deixe].
verbo(singular) --> [deixe].
verbo(singular) --> [deixou].
verbo(singular) --> [deixou].
verbo(plural) --> [demoravam].
verbo(plural) --> [demoravam].
verbo(singular) --> [depende].
verbo(singular) --> [depende].
verbo(plural) --> [dependem].
verbo(plural) --> [dependem].
verbo(plural) --> [depositem].
verbo(plural) --> [depositem].
verbo(plural) --> [deram].
verbo(plural) --> [deram].
verbo(singular) --> [desaparece].
verbo(singular) --> [desaparece].
verbo(singular) --> [desapareceu].
verbo(singular) --> [desapareceu].
verbo(singular) --> [descobrir].
verbo(singular) --> [descobrir].
verbo(plural) --> [descobrir].
verbo(plural) --> [descobrir].
verbo(plural) --> [descobriram].
verbo(plural) --> [descobriram].
verbo(plural) --> [descobrirem].
verbo(plural) --> [descobrirem].
verbo(plural) --> [descobriremos].
verbo(plural) --> [descobriremos].
verbo(singular) --> [descrever].
verbo(singular) --> [descrever].
verbo(plural) --> [descrever].
verbo(plural) --> [descrever].
verbo(plural) --> [descubram].
verbo(plural) --> [descubram].
verbo(singular) --> [desenhar].
verbo(singular) --> [desenhar].
verbo(plural) --> [desenhar].
verbo(plural) --> [desenhar].
verbo(singular) --> ['desenvolvê_las'].
verbo(singular) --> [desenvolver].
verbo(singular) --> [desenvolver].
verbo(plural) --> [desenvolver].
verbo(plural) --> [desenvolver].
verbo(plural) --> [enchem].
verbo(plural) --> [enchem].
verbo(singular) --> [encher].
verbo(singular) --> [encher].
verbo(plural) --> [encher].
verbo(plural) --> [encher].
verbo(singular) --> [encomendar].
verbo(singular) --> [encomendar].
verbo(plural) --> [encomendar].
verbo(plural) --> [encomendar].
verbo(plural) --> [encaixam].
verbo(plural) --> [encaixam].
verbo(singular) --> [emite].
verbo(singular) --> [emite].
verbo(plural) --> [emitem].
verbo(plural) --> [emitem].
verbo(plural) --> [embrenham].
verbo(plural) --> [embrenham].
verbo(singular) --> [e].
verbo(singular) --> [e].
verbo(singular) --> [desaparecido].
verbo(singular) --> [desaparecido].
verbo(singular) --> [descobrindo].
verbo(singular) --> [descobrindo].
verbo(singular) --> [citar].
verbo(singular) --> [citar].
verbo(plural) --> [citar].
verbo(plural) --> [citar].
verbo(singular) --> [colaborou].
verbo(singular) --> [colaborou].
verbo(singular) --> [desviaria].
verbo(singular) --> [desviaria].
verbo(singular) --> [detalhe].
verbo(singular) --> [detalhe].
verbo(singular) --> [detalhes].
verbo(singular) --> [detalhes].
verbo(plural) --> [detem].
verbo(plural) --> [detem].
verbo(singular) --> [deu].
verbo(singular) --> [deu].
verbo(singular) --> [devastar].
verbo(singular) --> [devastar].
verbo(plural) --> [devastar].
verbo(plural) --> [devastar].
verbo(singular) --> [deve].
verbo(singular) --> [deve].
verbo(plural) --> [devem].
verbo(plural) --> [devem].
verbo(singular) --> [deveria].
verbo(singular) --> [deveria].
verbo(singular) --> [digere].
verbo(singular) --> [digere].
verbo(singular) --> [digo].
verbo(singular) --> [digo].
verbo(singular) --> [diminuir].
verbo(singular) --> [diminuir].
verbo(plural) --> [diminuir].
verbo(plural) --> [diminuir].
verbo(singular) --> [dirigir].
verbo(singular) --> [dirigir].
verbo(plural) --> [dirigir].
verbo(plural) --> [dirigir].
verbo(singular) --> [discutir].
verbo(singular) --> [discutir].
verbo(plural) --> [discutir].
verbo(plural) --> [discutir].
verbo(singular) --> [disputa].
verbo(singular) --> [disputa].
verbo(singular) --> [deseja].
verbo(singular) --> [deseja].
verbo(singular) --> [desejo].
verbo(singular) --> [desejo].
verbo(singular) --> [dominar].
verbo(singular) --> [dominar].
verbo(plural) --> [dominar].
verbo(plural) --> [dominar].
verbo(singular) --> [disse].
verbo(singular) --> [disse].
verbo(singular) --> [disser].
verbo(singular) --> [disser].
verbo(plural) --> [disser].
verbo(plural) --> [disser].
verbo(plural) --> [disseram].
verbo(plural) --> [disseram].
verbo(singular) --> [bebendo].
verbo(singular) --> [bebendo].
verbo(singular) --> [dobrou].
verbo(singular) --> [dobrou].
verbo(singular) --> [dizer].
verbo(singular) --> [dizer].
verbo(plural) --> [dizer].
verbo(plural) --> [dizer].
verbo(singular) --> [dizia].
verbo(singular) --> [dizia].
verbo(singular) --> [diz].
verbo(singular) --> [diz].
verbo(singular) --> [dizendo].
verbo(singular) --> [dizendo].
verbo(singular) --> [divulgue].
verbo(singular) --> [divulgue].
verbo(singular) --> [dormir].
verbo(singular) --> [dormir].
verbo(plural) --> [dormir].
verbo(plural) --> [dormir].
verbo(singular) --> [encarecendo].
verbo(singular) --> [encarecendo].
verbo(singular) --> [bloqueada].
verbo(singular) --> [bloqueada].
verbo(singular) --> [dilacerado].
verbo(singular) --> [dilacerado].
verbo(singular) --> [bisbilhotando].
verbo(singular) --> [bisbilhotando].
verbo(singular) --> [estar].
verbo(singular) --> [estar].
verbo(plural) --> [estar].
verbo(plural) --> [estar].
verbo(singular) --> [candidate].
verbo(singular) --> [candidate].
verbo(singular) --> [desligada].
verbo(singular) --> [desligada].
verbo(singular) --> [completa].
verbo(singular) --> [completa].
verbo(plural) --> [completam].
verbo(singular) --> [compare].
verbo(singular) --> [compra].
verbo(singular) --> [compara].
verbo(singular) --> [cara].
verbo(singular) --> [capta].
verbo(singular) --> [criou].
verbo(singular) --> [da].
verbo(singular) --> [dao].
verbo(singular) --> [dar].
verbo(singular) --> [dava].
verbo(singular) --> ['dê'].
verbo(singular) --> [dormidos].
verbo(singular) --> [depos].
verbo(singular) --> [apelo].
verbo(singular) --> [cuidado].
verbo(singular) --> [cuidar].
verbo(singular) --> [cuidar].
verbo(plural) --> [cunham].
verbo(singular) --> [conturbado].
verbo(singular) --> [dando].

%ADJETIVO
adjetivo(singular, masculino) --> [fiel].
adjetivo(singular, feminino) --> [fiel].
adjetivo(singular, masculino) --> [forense].
adjetivo(singular, feminino) --> [forense].
adjetivo(singular, masculino) --> [formando].
adjetivo(singular, masculino) --> [fundamental].
adjetivo(singular, feminino) --> [fundamental].
adjetivo(singular, masculino) --> [fundo].
adjetivo(singular, masculino) --> [futuro].
adjetivo(singular, masculino) --> [ganho].
adjetivo(singular, masculino) --> [gasto].
adjetivo(plural, masculino) --> [gastos].
adjetivo(plural, masculino) --> ['gêmeos'].
adjetivo(singular, feminino) --> [generalizada].
adjetivo(plural, feminino) --> ['genéricas'].
adjetivo(singular, feminino) --> [gerada].
adjetivo(singular, masculino) --> [geral].
adjetivo(singular, feminino) --> [geral].
adjetivo(singular, masculino) --> ['gerentão'].
adjetivo(plural, masculino) --> [gigantes].
adjetivo(plural, feminino) --> [gigantes].
adjetivo(singular, masculino) --> [global].
adjetivo(singular, feminino) --> [global].
adjetivo(singular, masculino) --> [globalizado].
adjetivo(singular, feminino) --> [goiana].
adjetivo(singular, masculino) --> [grande].
adjetivo(singular, feminino) --> [grande].
adjetivo(plural, masculino) --> [grandes].
adjetivo(plural, feminino) --> [grandes].
adjetivo(singular, feminino) --> [gratuita].
adjetivo(singular, feminino) --> [gravada].
adjetivo(plural, masculino) --> [habitantes].
adjetivo(plural, feminino) --> [habitantes].
adjetivo(plural, feminino) --> ['hipotéticas'].
adjetivo(singular, feminino) --> ['histórica'].
adjetivo(plural, masculino) --> ['históricos'].
adjetivo(singular, feminino) --> [humana].
adjetivo(singular, masculino) --> [ideal].
adjetivo(singular, feminino) --> [ideal].
adjetivo(plural, masculino) --> [identificados].
adjetivo(singular, masculino) --> [igual].
adjetivo(singular, feminino) --> [igual].
adjetivo(singular, masculino) --> [impichado].
adjetivo(singular, masculino) --> ['impirateável'].
adjetivo(singular, feminino) --> ['impirateável'].
adjetivo(singular, masculino) --> [importante].
adjetivo(singular, feminino) --> [importante].
adjetivo(plural, masculino) --> [impostos].
adjetivo(singular, masculino) --> [imprevisto].
adjetivo(plural, masculino) --> [imprevistos].
adjetivo(singular, masculino) --> ['imunológico'].
adjetivo(singular, masculino) --> [inconsciente].
adjetivo(singular, feminino) --> [inconsciente].
adjetivo(singular, masculino) --> [inconveniente].
adjetivo(singular, feminino) --> [inconveniente].
adjetivo(plural, masculino) --> ['indivíduos'].
adjetivo(singular, masculino) --> [inesperado].
adjetivo(plural, masculino) --> [infantis].
adjetivo(plural, feminino) --> [infantis].
adjetivo(singular, masculino) --> [infeliz].
adjetivo(singular, feminino) --> [infeliz].
adjetivo(singular, masculino) --> ['inglês'].
adjetivo(plural, masculino) --> [iniciais].
adjetivo(plural, feminino) --> [iniciais].
adjetivo(plural, masculino) --> [iniciantes].
adjetivo(plural, feminino) --> [iniciantes].
adjetivo(singular, masculino) --> [insano].
adjetivo(singular, feminino) --> [inspirada].
adjetivo(plural, masculino) --> [instigantes].
adjetivo(plural, feminino) --> [instigantes].
adjetivo(singular, masculino) --> [inteligente].
adjetivo(singular, feminino) --> [inteligente].
adjetivo(singular, feminino) --> [intensa].
adjetivo(plural, masculino) --> [interessantes].
adjetivo(plural, feminino) --> [interessantes].
adjetivo(plural, masculino) --> [internacionais].
adjetivo(plural, feminino) --> [internacionais].
adjetivo(singular, masculino) --> [internacional].
adjetivo(singular, feminino) --> [internacional].
adjetivo(plural, feminino) --> ['íntimas'].
adjetivo(singular, masculino) --> [introduzido].
adjetivo(singular, masculino) --> [inverso].
adjetivo(plural, masculino) --> [investigadores].
adjetivo(singular, masculino) --> ['inviável'].
adjetivo(singular, feminino) --> ['inviável'].
adjetivo(singular, masculino) --> ['irmão'].
adjetivo(plural, masculino) --> ['irreversíveis'].
adjetivo(plural, feminino) --> ['irreversíveis'].
adjetivo(singular, masculino) --> ['irritável'].
adjetivo(singular, feminino) --> ['irritável'].
adjetivo(plural, masculino) --> [jogadores].
adjetivo(plural, masculino) --> [jovens].
adjetivo(plural, feminino) --> [jovens].
adjetivo(singular, masculino) --> ['ladrão'].
adjetivo(singular, masculino) --> [legal].
adjetivo(singular, feminino) --> [legal].
adjetivo(singular, masculino) --> ['límbico'].
adjetivo(plural, masculino) --> [limpos].
adjetivo(singular, masculino) --> [lindo].
adjetivo(singular, masculino) --> ['líquido'].
adjetivo(singular, masculino) --> [livre].
adjetivo(singular, feminino) --> [livre].
adjetivo(plural, masculino) --> [livres].
adjetivo(plural, feminino) --> [livres].
adjetivo(plural, masculino) --> [locais].
adjetivo(plural, feminino) --> [locais].
adjetivo(singular, masculino) --> [longo].
adjetivo(plural, feminino) --> [loucas].
adjetivo(singular, masculino) --> [louco].
adjetivo(singular, masculino) --> ['mágico'].
adjetivo(singular, masculino) --> [magrinho].
adjetivo(plural, masculino) --> [magros].
adjetivo(singular, masculino) --> [maior].
adjetivo(singular, feminino) --> [maior].
adjetivo(plural, masculino) --> [maiores].
adjetivo(plural, feminino) --> [maiores].
adjetivo(plural, masculino) --> ['maníacos'].
adjetivo(singular, masculino) --> [marmanjo].
adjetivo(singular, feminino) --> ['médica'].
adjetivo(singular, masculino) --> ['médico'].
adjetivo(plural, masculino) --> ['médicos'].
adjetivo(singular, masculino) --> [meio].
adjetivo(singular, masculino) --> [melhor].
adjetivo(singular, feminino) --> [melhor].
adjetivo(plural, masculino) --> [melhores].
adjetivo(plural, feminino) --> [melhores].
adjetivo(singular, masculino) --> [menor].
adjetivo(singular, feminino) --> [menor].
adjetivo(plural, masculino) --> [mentais].
adjetivo(plural, feminino) --> [mentais].
adjetivo(singular, masculino) --> [mental].
adjetivo(singular, feminino) --> [mental].
adjetivo(singular, feminino) --> [mesma].
adjetivo(plural, feminino) --> [mesmas].
adjetivo(singular, masculino) --> [mesmo].
adjetivo(plural, masculino) --> [mesmos].
adjetivo(plural, masculino) --> [mestres].
adjetivo(plural, masculino) --> [meteorologistas].
adjetivo(plural, feminino) --> [meteorologistas].
adjetivo(singular, masculino) --> [militar].
adjetivo(singular, feminino) --> [militar].
adjetivo(singular, masculino) --> [misturado].
adjetivo(singular, feminino) --> [moderna].
adjetivo(plural, feminino) --> [modernas].
adjetivo(singular, masculino) --> [moderno].
adjetivo(singular, masculino) --> [momento].
adjetivo(singular, feminino) --> [momento].
adjetivo(singular, masculino) --> [moral].
adjetivo(singular, feminino) --> [moral].
adjetivo(singular, masculino) --> [mostrado].
adjetivo(singular, masculino) --> [motivo].
adjetivo(singular, feminino) --> [motivo].
adjetivo(singular, masculino) --> [motorista].
adjetivo(singular, feminino) --> [motorista].
adjetivo(plural, masculino) --> [multifuncionais].
adjetivo(plural, feminino) --> [multifuncionais].
adjetivo(singular, masculino) --> [mundial].
adjetivo(singular, feminino) --> [mundial].
adjetivo(plural, masculino) --> [nacionais].
adjetivo(plural, feminino) --> [nacionais].
adjetivo(plural, masculino) --> [namorados].
adjetivo(singular, masculino) --> [natural].
adjetivo(singular, feminino) --> [natural].
adjetivo(plural, feminino) --> [negativas].
adjetivo(singular, masculino) --> [negro].
adjetivo(singular, masculino) --> [nervoso].
adjetivo(singular, masculino) --> [neurocientista].
adjetivo(singular, feminino) --> [neurocientista].
adjetivo(plural, masculino) --> [neurocientistas].
adjetivo(plural, feminino) --> [neurocientistas].
adjetivo(singular, masculino) --> [neurologista].
adjetivo(singular, feminino) --> [neurologista].
adjetivo(singular, masculino) --> [normal].
adjetivo(singular, feminino) --> [normal].
adjetivo(singular, feminino) --> [nova].
adjetivo(plural, feminino) --> [novas].
adjetivo(plural, feminino) --> [novatas].
adjetivo(singular, masculino) --> [novato].
adjetivo(singular, masculino) --> [novo].
adjetivo(plural, masculino) --> [novos].
adjetivo(singular, masculino) --> ['óbvio'].
adjetivo(singular, masculino) --> [ocidental].
adjetivo(singular, feminino) --> [ocidental].
adjetivo(singular, masculino) --> [ocupado].
adjetivo(singular, masculino) --> [oficializado].
adjetivo(singular, feminino) --> ['onírica'].
adjetivo(singular, masculino) --> ['onírico'].
adjetivo(singular, masculino) --> [oposto].
adjetivo(singular, masculino) --> [organizado].
adjetivo(singular, feminino) --> ['ótima'].
adjetivo(singular, masculino) --> ['ótimo'].
adjetivo(plural, feminino) --> [ousadas].
adjetivo(singular, masculino) --> [ouvido].
adjetivo(singular, masculino) --> [paciente].
adjetivo(singular, feminino) --> [paciente].
adjetivo(plural, masculino) --> [pacientes].
adjetivo(plural, feminino) --> [pacientes].
adjetivo(singular, masculino) --> ['padrão'].
adjetivo(singular, feminino) --> ['padrão'].
adjetivo(plural, masculino) --> [pagos].
adjetivo(singular, masculino) --> [pai].
adjetivo(plural, masculino) --> [pais].
adjetivo(singular, masculino) --> [par].
adjetivo(singular, feminino) --> [par].
adjetivo(singular, masculino) --> [paradoxal].
adjetivo(singular, feminino) --> [paradoxal].
adjetivo(plural, feminino) --> [paralelas].
adjetivo(singular, masculino) --> [paralisado].
adjetivo(singular, masculino) --> [parecido].
adjetivo(singular, feminino) --> [partida].
adjetivo(singular, masculino) --> [passado].
adjetivo(plural, masculino) --> [passistas].
adjetivo(plural, feminino) --> [passistas].
adjetivo(singular, masculino) --> [pensado].
adjetivo(plural, feminino) --> [pequenas].
adjetivo(plural, masculino) --> [pequenos].
adjetivo(singular, masculino) --> ['periférico'].
adjetivo(singular, masculino) --> [perito].
adjetivo(plural, masculino) --> [peritos].
adjetivo(singular, feminino) --> [pesquisada].
adjetivo(plural, masculino) --> [pesquisadores].
adjetivo(plural, masculino) --> [pesquisados].
adjetivo(plural, masculino) --> [pessoais].
adjetivo(plural, feminino) --> [pessoais].
adjetivo(singular, masculino) --> [pessoal].
adjetivo(singular, feminino) --> [pessoal].
adjetivo(plural, feminino) --> [petroleiras].
adjetivo(singular, feminino) --> ['petrolífera'].
adjetivo(singular, masculino) --> [pioneiro].
adjetivo(singular, masculino) --> [pior].
adjetivo(singular, feminino) --> [pior].
adjetivo(plural, masculino) --> [pobres].
adjetivo(plural, feminino) --> [pobres].
adjetivo(singular, feminino) --> [poderosa].
adjetivo(plural, masculino) --> [poderosos].
adjetivo(singular, feminino) --> ['poética'].
adjetivo(plural, masculino) --> ['políticos'].
adjetivo(singular, masculino) --> [poluente].
adjetivo(singular, feminino) --> [poluente].
adjetivo(plural, masculino) --> [poluentes].
adjetivo(plural, feminino) --> [poluentes].
adjetivo(plural, masculino) --> [poluidores].
adjetivo(plural, masculino) --> [potentes].
adjetivo(plural, feminino) --> [potentes].
adjetivo(plural, feminino) --> [poupadoras].
adjetivo(singular, feminino) --> [precisa].
adjetivo(singular, masculino) --> [preciso].
adjetivo(singular, masculino) --> [presente].
adjetivo(singular, feminino) --> [presente].
adjetivo(singular, masculino) --> [presidente].
adjetivo(singular, feminino) --> [presidente].
adjetivo(plural, masculino) --> [presidentes].
adjetivo(plural, feminino) --> [presidentes].
adjetivo(plural, masculino) --> [presos].
adjetivo(singular, masculino) --> [previsto].
adjetivo(singular, masculino) --> [primeiro].
adjetivo(singular, masculino) --> [principal].
adjetivo(singular, feminino) --> [principal].
adjetivo(singular, masculino) --> ['problemático'].
adjetivo(singular, feminino) --> [procurada].
adjetivo(singular, feminino) --> [profunda].
adjetivo(plural, feminino) --> [profundas].
adjetivo(singular, masculino) --> [profundo].
adjetivo(singular, masculino) --> [programado].
adjetivo(plural, masculino) --> [programados].
adjetivo(singular, feminino) --> [prometida].
adjetivo(plural, masculino) --> [prometidos].
adjetivo(singular, feminino) --> [promissora].
adjetivo(singular, masculino) --> [promotor].
adjetivo(singular, feminino) --> [prontinha].
adjetivo(plural, masculino) --> [prontos].
adjetivo(singular, feminino) --> [proposta].
adjetivo(plural, feminino) --> [propostas].
adjetivo(singular, feminino) --> ['própria'].
adjetivo(plural, masculino) --> ['próprios'].
adjetivo(singular, feminino) --> [protegida].
adjetivo(singular, masculino) --> [protestado].
adjetivo(singular, masculino) --> ['provável'].
adjetivo(singular, feminino) --> ['provável'].
adjetivo(singular, feminino) --> ['próxima'].
adjetivo(singular, masculino) --> ['próximo'].
adjetivo(plural, masculino) --> ['próximos'].
adjetivo(singular, feminino) --> ['psicóloga'].
adjetivo(singular, masculino) --> [psiquiatra].
adjetivo(singular, feminino) --> [psiquiatra].
adjetivo(singular, feminino) --> ['pública'].
adjetivo(singular, masculino) --> ['público'].
adjetivo(plural, masculino) --> ['públicos'].
adjetivo(singular, feminino) --> [pura].
adjetivo(singular, masculino) --> [certo].
adjetivo(plural, masculino) --> [direitos].
adjetivo(singular, femenino) --> [direta].
adjetivo(singular, masculino) --> [direto].
adjetivo(plural, femenino) --> [alertas].
adjetivo(plural, masculino) --> [abrangentes].
adjetivo(plural, femenino) --> [abrangentes].
adjetivo(singular, femenino)--> [aberta].
adjetivo(singular, masculino) --> [criado].
adjetivo(singular, masculino)--> [aberto].
adjetivo(plural, femenino)--> [aceleradas].
adjetivo(singular, masculino) --> [direito].
adjetivo(singular, masculino)--> [artistico].
adjetivo(plural, masculino)--> [magros].
adjetivo(plural, masculino)--> ['acessíveis'].
adjetivo(singular, masculino)--> [adiposo].
adjetivo(singular, femenino)--> [alta].
adjetivo(singular, masculino)--> [alto].
adjetivo(plural, masculino)--> [altos].
adjetivo(singular, femenino)--> ['atômica'].
adjetivo(singular, femenino)--> [ambiental].
adjetivo(singular, femenino)--> [assustadora].
adjetivo(plural, masculino)--> ['astronômicos'].
adjetivo(singular, femenino)--> [baixa].
adjetivo(singular, femenino)--> [bacana].
adjetivo(plural, masculino)--> [autorais].
adjetivo(singular, femenino)--> [autoconfianca].
adjetivo(singular, femenino)--> [autoestima].
adjetivo(singular, masculino)--> [automatico].
adjetivo(singular, femenino) --> [baseadas].
adjetivo(singular, masculino)--> [bonitinho].
adjetivo(singular, masculino)--> [bonito].
adjetivo(plural, masculino)--> [bonitos].
adjetivo(plural, femenino)--> [borradas].
adjetivo(singular, femenino) --> [certas].
adjetivo(singular, femenino)--> [branca].
adjetivo(singular, femenino)--> ['eficiência'].
adjetivo(singular, femenino)--> [bloqueada].
adjetivo(singular, femenino)--> ['difícil'].
adjetivo(singular, masculino)--> ['difícil'].
adjetivo(singular, masculino)--> [dilacerado].
adjetivo(singular, masculino) --> [direto].
adjetivo(singular, femenino)--> [antiga].
adjetivo(plural, femenino)--> [antigas].
adjetivo(singular, masculino)--> [antigo].
adjetivo(singular, masculino)--> [belo].
adjetivo(singular, femenino)--> [cinzenta].
adjetivo(plural, femenino) --> [coletadas].
adjetivo(singular, femenino)--> [desligada].
adjetivo(singular, femenino)--> [desgovernada].
adjetivo(plural, masculino)--> [dilapidados].
adjetivo(plural, femenino)--> [disingular, femeninoarcadas].
adjetivo(plural, masculino)--> [disingular, femeninoarcados].
adjetivo(singular, femenino)--> [boa].
adjetivo(singular, masculino)--> [bom].
adjetivo(singular, femenino)--> [cara].
adjetivo(singular, femenino)--> ['cinematográfica'].
adjetivo(singular, masculino)--> [claro].
adjetivo(singular, femenino)--> [complexa].
adjetivo(plural, femenino)--> [coloridas].
adjetivo(plural, femenino)--> [coloridos].
adjetivo(singular, femenino)--> [concentrada].
adjetivo(singular, femenino)--> [codificada].
adjetivo(singular, femenino)--> [diesel].
adjetivo(singular, masculino)--> [diesel].
adjetivo(singular, femenino)--> [alheia].
adjetivo(singular, masculino)--> [anterior].
adjetivo(plural, femenino)--> ['ávidas'].
adjetivo(plural, femenino)--> [banais].
adjetivo(plural, masculino)--> [banais].
adjetivo(plural, femenino)--> [baseadas].
adjetivo(plural, femenino)--> ['básicas'].
adjetivo(singular, masculino)--> ['básico'].
adjetivo(singular, masculino)--> [capaz].
adjetivo(singular, masculino)--> ['célebre'].
adjetivo(plural, femenino)--> ['célebres'].
adjetivo(singular, masculino)--> [certo].
adjetivo(plural, femenino)--> [cheios].
adjetivo(singular, femenino)--> [civil].
adjetivo(singular, masculino)--> [civil].
adjetivo(singular, femenino)--> ['climática'].
adjetivo(singular, femenino)--> [comercial].
adjetivo(singular, masculino)--> [comercial].
adjetivo(singular, femenino)--> [emocional].
adjetivo(singular, masculino)--> [emocional].
adjetivo(singular, femenino)--> ['econômica'].
adjetivo(singular, masculino)--> ['econômico'].
adjetivo(plural, masculino)--> ['econômicos'].
adjetivo(singular, masculino)--> [direito].
adjetivo(plural, masculino)--> [direitos].
adjetivo(singular, femenino)--> [direta].
adjetivo(singular, masculino)--> [direto].
adjetivo(singular, femenino)--> [diferente].
adjetivo(singular, masculino)--> [diferente].
adjetivo(plural, femenino)--> [diferentes].
adjetivo(plural, masculino)--> [diferentes].
adjetivo(singular, femenino)--> ['compreensível'].
adjetivo(singular, masculino)--> ['compreensível'].
adjetivo(singular, femenino)--> ['comparável'].
adjetivo(singular, masculino)--> ['comparável'].
adjetivo(singular, masculino)--> [cuidado].
adjetivo(singular, femenino)--> [comum].
adjetivo(singular, masculino)--> [comum].
adjetivo(singular, femenino)--> [corporal].
adjetivo(singular, masculino)--> [corporal].
adjetivo(plural, femenino)--> [concretas].
adjetivo(plural, masculino)--> [conectados].
adjetivo(singular, masculino)--> [ecochato].
adjetivo(plural, masculino)--> [determinados].
adjetivo(singular, masculino)--> [defasado].
adjetivo(singular, femenino)--> [defasada].
adjetivo(singular, masculino)--> [conturbado].
adjetivo(singular, femenino)--> ['ável'].
adjetivo(singular, masculino)--> ['ável'].
adjetivo(singular, femenino)--> [descrita].
adjetivo(plural, femenino)--> [definidas].
adjetivo(singular, masculino)--> [definido].
adjetivo(singular, femenino)--> [definitiva].
adjetivo(singular, masculino)--> [definitiva].
adjetivo(singular, masculino)--> ['contrário'].
adjetivo(plural, femenino)--> [corretas].
adjetivo(singular, masculino)--> [curto].
adjetivo(plural, masculino)--> [despertos].
%NUMERAL

numeral(singular) --> [0].
numeral(singular) --> [1].
numeral(singular) --> [1,7].
numeral(singular) --> [1,13].
numeral(singular) --> [1,8].
numeral(singular) --> [2].
numeral(singular) --> [3].
numeral(singular) --> [4].
numeral(singular) --> [5].
numeral(singular) --> [6].
numeral(singular) --> [8].
numeral(singular) --> [10].
numeral(singular) --> [14].
numeral(singular) --> [15].
numeral(singular) --> [18].
numeral(singular) --> [20].
numeral(singular) --> [24].
numeral(singular) --> [25].
numeral(singular) --> [30].
numeral(singular) --> [31].
numeral(singular) --> [34].
numeral(singular) --> [35].
numeral(singular) --> [38].
numeral(singular) --> [39,5].
numeral(singular) --> [40].
numeral(singular) --> [70].
numeral(singular) --> [90].
numeral(singular) --> [100].
numeral(singular) --> [310].
numeral(singular) --> [517].
numeral(singular) --> [1899].
numeral(singular) --> [1939].
numeral(singular) --> [1964].
numeral(singular) --> [1965].
numeral(singular) --> [1974].
numeral(singular) --> [2004].
numeral(singular) --> [2005].
numeral(singular) --> [2006].
numeral(singular) --> [2007].
numeral(singular) --> [2008].
numeral(singular) --> [2009].
numeral(singular) --> [2010].
numeral(singular) --> [2011].
numeral(singular) --> [2014].
numeral(singular) --> ['12%'].
numeral(singular) --> ['20%'].
numeral(singular) --> ['29%'].
numeral(singular) --> ['2º'].
numeral(singular) --> ['3%'].
numeral(singular) --> ['36%'].
numeral(singular) --> ['3ª'].
numeral(singular) --> ['3d'].
numeral(singular) --> ['4x4'].
numeral(singular) --> ['5%'].
numeral(singular) --> ['70%'].
numeral(singular) --> ['88%'].
numeral(singular) --> ['bilhão'].
numeral(singular) --> ['mil'].
numeral(singular) --> ['meio'].
numeral(plural,femenino) --> ['duas'].
numeral(plural,masculino) --> ['dois'].
numeral(plural,masculino) --> ['milhões'].

%%
%
%numeral(singular) --> [primeiro].

%ADVERBIO

adverbio(singular) --> [frequentemente].
adverbio(singular) --> [inclusive].
adverbio(singular) --> [independentemente].
adverbio(singular) --> ['já'].
adverbio(singular) --> [justamente].
adverbio(singular) --> ['lá'].
adverbio(singular) --> [legal].
adverbio(singular) --> [ligeiramente].
adverbio(singular) --> [logo].
adverbio(singular) --> [mais].
adverbio(singular) --> [mal].
adverbio(singular) --> [mas].
adverbio(singular) --> [melhor].
adverbio(singular) --> [menos].
adverbio(singular) --> [mesmo].
adverbio(singular) --> [muita].
adverbio(plural) --> [muitas].
adverbio(singular) --> [muito].
adverbio(singular) --> [nada].
adverbio(singular) --> ['não'].
adverbio(singular) --> [nem].
adverbio(singular) --> [nunca].
adverbio(singular) --> [obviamente].
adverbio(singular) --> [onde].
adverbio(singular) --> [particularmente].
adverbio(singular) --> [perigosamente].
adverbio(singular) --> [pouca].
adverbio(plural) --> [poucas].
adverbio(singular) --> [pouco].
adverbio(singular) --> [praticamente].
adverbio(plural) --> [prestes].
adverbio(singular) --> [primeiro].
adverbio(singular) --> [principalmente].
adverbio(singular) --> [provavelmente].
adverbio(singular) --> [quando].
adverbio(plural) --> [quantas].
adverbio(singular) --> [quanto].
adverbio(singular) --> ['quão'].
adverbio(singular) --> [apesar].
adverbio(singular) --> [acima].
adverbio(singular) --> [automaticamente].
adverbio(singular) --> ['aí'].
adverbio(singular) --> [aleatoriamente].
adverbio(singular) --> ['alí'].
adverbio(singular) --> [anatomicamente].
adverbio(singular) --> [bastante].
adverbio(singular) --> [agora].
adverbio(singular) --> [ainda].
adverbio(singular) --> ['aquí'].
adverbio(singular) --> [apenas].
adverbio(singular) --> ['atrás'].
adverbio(singular) --> [ecologicamente].
adverbio(plural) --> [ecologicamente].
adverbio(singular) --> [cima].
adverbio(singular) --> [diariamente].
adverbio(singular) --> [embaixo].
adverbio(singular) --> [cedo].
adverbio(singular) --> ['cá'].
adverbio(singular) --> ['além'].
adverbio(singular) --> [antes].
adverbio(singular) --> [bem].
adverbio(singular) --> [depois].
adverbio(singular) --> [demais].

%PREPOSICAO
preposicao(singular) --> [pela].
preposicao(singular) --> [pelo].
preposicao(plural) --> [pelos].
preposicao(singular) --> [para].
preposicao(singular) --> [pra].
preposicao(singular) --> [num].
preposicao(singular) --> [numa].
preposicao(plural) --> [nos].
preposicao(singular) --> [no].
preposicao(plural) --> [nas].
preposicao(singular) --> [a].
preposicao(singular) --> [assim].
preposicao(singular) --> ['após'].
preposicao(singular) --> [ao].
preposicao(plural) --> [aos].
preposicao(singular) --> [em].
preposicao(singular) --> ['até'].
preposicao(singular) --> [do].
preposicao(plural) --> [dos].
preposicao(singular) --> [com].
preposicao(singular) --> [contra].
preposicao(singular) --> [da].
preposicao(singular) --> [de].
preposicao(plural) --> [das].
preposicao(singular) --> [disso].
preposicao(singular) --> [diante].
preposicao(singular) --> [dessa].
preposicao(plural) --> [dessas].
preposicao(singular) --> [desse].
preposicao(plural) --> [desses].
preposicao(singular) --> [esse].
preposicao(singular) --> [deste].
preposicao(singular) --> [desde].
preposicao(singular) --> [desde].
preposicao(singular) --> [daquela].
preposicao(plural) --> [daquelas].
preposicao(plural) --> [daqueles].
preposicao(singular) --> [daqui].
preposicao(singular) --> [daqui].

%CONJUNCAO

conjuncao --> ['já'].
conjuncao --> [logo].
conjuncao --> [mais].
conjuncao --> [mal].
conjuncao --> [mas].
conjuncao --> [nem].
conjuncao --> [ou].
conjuncao --> ['porém'].
conjuncao --> [porque].
conjuncao --> [quais].
conjuncao --> [qual].
conjuncao --> [quando].
conjuncao --> [apesar].
conjuncao --> [como].
conjuncao -->[caso].
conjuncao --> [e].
%INTERJEICAO

interjeicao(singular) --> [ok].
interjeicao(singular, femenino) --> ['ótima'].
interjeicao(singular, masculino) --> ['ótimo'].
interjeicao(singular, masculino) -->[afinal].
interjeicao(singular, femenino) -->[afinal].
interjeicao(plural, masculino) -->[afinal].
interjeicao(plural, femenino) -->[afinal].
interjeicao(singular, masculino) -->['alelúia'].
interjeicao(singular, femenino) -->['alelúia'].
interjeicao(plural, masculino) -->['alelúia'].
interjeicao(plural, femenino) -->['alelúia'].
interjeicao(singular, masculino) -->['atenção'].
interjeicao(singular, femenino) -->['atenção'].
interjeicao(plural, masculino) -->['atenção'].
interjeicao(plural, femenino) -->['atenção'].
interjeicao(singular, masculino) -->['blablablá'].
interjeicao(singular, femenino) -->['blablablá'].
interjeicao(plural, masculino) -->['blablablá'].
interjeicao(plural, femenino) -->['blablablá'].
interjeicao(singular, masculino) -->['dúvidas'].
interjeicao(singular, femenino) -->['dúvidas'].
interjeicao(plural, masculino) -->['dúvidas'].
interjeicao(plural, femenino) -->['dúvidas'].
interjeicao(singular, masculino) -->[cuidado].
interjeicao(singular, femenino) -->[cuidado].
interjeicao(plural, masculino) -->[cuidado].
interjeicao(plural, femenino) -->[cuidado].
interjeicao(singular, femenino) -->['blablablá'].
interjeicao(plural, masculino) -->['blablablá'].
interjeicao(plural, femenino) -->['blablablá'].
interjeicao(singular, masculino) -->['dúvidas'].
interjeicao(singular, femenino) -->['dúvidas'].
interjeicao(plural, masculino) -->['dúvidas'].
