bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).

is_bigger(X,Y):-bigger(X,Y).
is_bigger(X,Y):-bigger(X,Z),is_bigger(Z,Y).

fat(0,1).
fat(N,R):-
   N > 0,
   M is N-1,
   fat(M, S),
   R is N*S.
