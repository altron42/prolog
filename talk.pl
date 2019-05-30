/******************************************************
							TALK Program
******************************************************/

/*=====================================================
							Operators
=====================================================*/

:- op(500,xfy,&).
:- op(510,xfy,=>).
:- op(100,fx,‘).

/*=====================================================

						Dialogue Manager

=====================================================*/

%%% main_loop
%%% =========

main_loop :-
	write(’>> ’),				% prompt the user
	read_sent(Words),			% read a sentence
	talk(Words, Reply), 		% process it with TALK
	print_reply(Reply), 		% generate a printed reply
	main_loop.					% pocess more sentences
