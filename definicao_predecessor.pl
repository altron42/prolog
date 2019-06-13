% Figure 19.1  A definition of the problem of learning predicate has_daughter.


% Learning from family relations

% Background knowledge

backliteral([atom(X), parent(X,Y)],[X,Y]).
backliteral([atom(X), predecessor(X,Y)],[X,Y]).
prolog_predicate(parent(X,Y)).
prolog_predicate(atom(X)).

parent( pam, bob).
parent( tom, bob).
parent( tom, liz).
parent( bob, ann).
parent( bob, pat).
parent( pat, jim).
parent( pat, eve).

female( pam).
male( tom).
male( bob).
female( liz).
female( ann).
female( pat).
male( jim).
female( eve).

% Positive examples

ex(predecessor(pam,bob)).
ex(predecessor(pam,jim)).
ex(predecessor(tom,ann)).
ex(predecessor(tom,jim)).
ex(predecessor(tom,liz)).

% Negative examples

nex(predecessor(liz,bob)).
nex(predecessor(pat,bob)).
nex(predecessor(pam,liz)).
nex(predecessor(liz,jim)).
nex(predecessor(liz,liz)).

start_hyp( [[predecessor(X1,Y1)]/[X1,Y1],
            [predecessor(X2,Y2)]/[X2,Y2]] ). % Starting hypothesis
