del(X,[X|Rest],Rest).
del(X,[Y|Rest0],[Y|Rest]):-
	del(X,Rest0,Rest).
