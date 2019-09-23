% Explicação para letra A
%
% (1) podePegar(state(naPorta,noChao,naJanela,semBanana))
%	É aplicada a segunda claúsula "podePegar", gerando a sequencia a seguir
%
% (2) move(state(naPorta,noChao,naJanela,semBanana),M1,S2),podePegar(S2)
%	O único movimento possível neste estado é "anda" onde temos
%	M1=anda(naPorta,P2)
%	S2=state(P2,noChao,naJanela,semBanana)
%
% (3) podePegar(S2)
%	A segunda claúsula é aplicada novamente. 
%
% (4) move(state(P2,noChao,naJanela,semBanana),M2,S3),podePegar(S3)
%	É possível aplicar o movimento "sobe" dado que
%	P2=naJanela
%	M2=sobe
%	S3=state(naJanela,sobreCaixa,naJanela,semBanana)
%
% (5) podePegar(S3)
%	A segunda claúsula é aplicada novamente.
%
% (6) move(state(naJanela,sobreCaixa,naJanela,semBanana),M3,S4),podePegar(S4)
%	Não é possível satisfazer nenhuma regra para o próximo movimento.
%	Vai ter que voltar para o estado anterior, em (4), e tentar o movimento possível seguinte na variável M2
%
% (7) move(state(P2,noChao,naJanela,semBanana),M2,S3),podePegar(S3)
%	É possível aplicar o movimento "arrasta", dado que
%	P2=naJanela
%	M2=arrasta(naJanela,P3)
%	S3=state(P3,noChao,P3,semBanana)
%
% (8) podePegar(S3)
%	Segunda claúsula "podePegar" é aplicada
%
% (9) move(state(P3,noChao,P3,semBanana),M3,S4),podePegar(S4)
%	Movimento possível é "sobe" dado que
%	M3=sobe
%	S4=state(P3,sobreCaixa,P3,semBanana)
%
% (10) podePegar(S4)
%	Segunda claúsula aplicada
%
% (11) move(state(P3,sobreCaixa,P3,semBanana),M4,S5),podePegar(S5)
%	É possível aplicar o movimento "pega" dado que
%	P3=noMeio
%	M4=pega
%	S5=state(noMeio,sobreCaixa,noMeio,comBanana)
%
% (12) podePegar(S5)
%	É aplicada a primeira claúsula pois o macaco já está com a banana visto que "S5" atende a regra state(_,_,_,comBanana).
%	Nenhuma ação é necessária.



% Explicação letra B
%
% Ao executar o código com a claúsula do movimento "anda" declarada antes das outras o programa parece entrar em um loop infinito.
% De acordo com a semantica procedural do Prolog a ordem das claúsulas importa muito. No problema do macaco e das bananas, de certa
% maneira, a ordem auxilia na resolução do problema. Ao colocar a claúsula de andar em primeiro o Prolog passa a tentar a resolver
% o problema de um jeito que a solução jamais é alcançada, mesmo que exista uma solução. Por mais que a declaração das claúsulas
% no código estejam semanticamente corretas, as declarações de caracteristica procedural estão incorretas de maneira que o programa
% não é capaz de produzir uma resposta para o problema. É como se o macaco ficasse andando o tempo todo pela sala sem nem mesmo
% tentar interagir com a caixa. Como não é feito nenhum progresso, já que a claúsula de andar é utilizada repetidamente, o programa
% teoricamente continuará rodando para sempre.
