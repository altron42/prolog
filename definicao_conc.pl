% Figure 19.5  Problem definition for learning list membership.


% Problem definition for learning about conc(L1,L2,L3)

backliteral( conc(L1,L2,L3), [L1:list,L2:list], [L3:list] ).  % Background literal

% Refinement of terms

term( list, [X|R], [ X:item, R:list]).
term( list, [], []).

prolog_predicate( fail).          % No background predicate in Prolog

start_clause( [ conc(L1,L2,L3) ] / [ L1:list, L2:list, L3:list ] ).

% Positive and negative examples


ex( conc( [], [a], [a])).
ex( conc( [], [b,d], [b,d])).
ex( conc( [a], [b], [a,b])).
ex( conc( [a,b], [c,d], [a,b,c,d])).
ex( conc( [d,g,h], [a], [d,g,h,a])).
ex( conc( [e], [a,b,c,f,e], [e,a,b,c,f,e])).

nex( conc( [c,d], [g,h], [g,c,d])).
nex( conc( [f], [a,b,c,d,f], [f,a,b,c,d])).
nex( conc( [a], [d,f], [d,f])).
