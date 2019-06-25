
/***********************************************************************

                              TALK Program

              Fernando C. N. Pereira and Stuart M. Shieber

***********************************************************************/



/*======================================================================
                               Operators
======================================================================*/

:- op(500,xfy,&). 
:- op(510,xfy,=>). 
:- op(100,fx,~).


/*======================================================================
                            Dialogue Manager
======================================================================*/

%%% main_loop
%%% =========

main_loop :-
    % prompt the user
    write('>>'),
    % read a sentence
    read_sent(Words),
    % process it with TALK
    talk(Words, Reply),
    % generate a printed reply
    print_reply(Reply),
    % pocess more sentences
    main_loop.


%%% talk(Sentence, Reply)
%%% =====================
%%%
%%%     Sentence ==> sentence to form a reply to
%%%     Reply    <== appropriate reply to the sentence

talk(Sentence, Reply) :-
   % parse the sentence
   parse(Sentence, LF, Type),
   % convert the FOL logical form into a Horn clause, if possible
   clausify(LF, Clause, FreeVars), !,
   % concoct a reply, based on the clause and whether sentence was 
   % a query or assertion
   reply(Type, FreeVars, Clause, Reply).

% no parse was found, sentence is too difficult
talk(_Sentence, error('too difficult')).


%%% reply(Type, FreeVars, Clause, Reply)
%%% ====================================
%%%
%%%     Type     ==> the constant "query" or "assertion" depending on whether
%%%                  clause should be interpreted as a query or assertion
%%%     FreeVars ==> the free variables (to be interpreted existentially) in 
%%%                  the clause
%%%     Clause   ==> the clause being replied to
%%%     Reply    <== the reply
%%%
%%%     If the clause is interpreted as an assertion, the predicate has a side
%%%     effect of asserting the clause to the database

% replying to a query
reply(query, FreeVars, (answer(Answer):-Condition), Reply) :-
   % find all the answers that satisfy the query, replying with that set
   % if it exists, or "no" if it doesnt
   (setof(Answer, FreeVars^Condition, Answers)
      -> Reply = answer(Answers);
         (Answer = yes 
            -> Reply = answer([no]);
               Reply = answer([none]))), !.

% replying to an assertion
reply(assertion, _FreeVars, Assertion, asserted(Assertion)) :-
   % assert the assertion and tell user what we asserted
   assert(Assertion), !.

% replying to some other type of sentence
reply(_Type, _FreeVars, _Clause, error('unknown type')).


%%% print_reply(Reply)
%%% ==================
%%%
%%%     Reply ==> reply generated by reply predicate that is to be
%%%               printed to the standard output.

print_reply(error(ErrorType)) :-
   write('Error: "'),
   write(ErrorType),
   write('."'), nl.

print_reply(asserted(Assertion)) :-
   write('Asserted "'),
   write(Assertion),
   write('."'), nl.

print_reply(answer([Answer])) :- !,
   write(Answer),
   write('.'), nl.
print_reply(answer([Answer|Rest])) :-
   write(Answer), write(', '),
   print_reply(answer(Rest)).


%%% parse(Sentence, LF, Type)
%%% =========================
%%%
%%%     Sentence ==> sentence to parse
%%%     LF       <== logical form (in FOL) of sentence
%%%     Type     <== type of sentence (query or assertion)

% parsing an assertion: a finite sentence without gaps
parse(Sentence, LF, assertion) :- s(LF, nogap, Sentence, []).

% parsing a query: a question
parse(Sentence, LF, query) :-     q(LF, Sentence, []).

/*======================================================================
                               Clausifier
======================================================================*/

%%% clausify(FOL, Clause, FreeVars)
%%% ===============================
%%%
%%%     FOL      ==> FOL expression to be converted to clause form
%%%     Clause   <== clause form of FOL expression
%%%     FreeVars <== free variables in clause

% universals: variable is left implicitly scoped
clausify(all(X,F0),F,[X|V]) :- clausify(F0,F,V).

% implications: consequent must be a literal, antecedent is 
%               clausified specially
clausify(A0=>C0,(C:-A),V) :-
   clausify_literal(C0,C),
   clausify_antecedent(A0,A,V).

% literals: left unchanged (except literal marker is removed)
clausify(C0,C,[]) :- clausify_literal(C0,C).

% Note that conjunctions and existentials are disallowed, since they cant
% form Horn clauses



%%% clausify_antecedent(FOL, Clause, FreeVars)
%%% ==========================================
%%%
%%%     FOL      ==> FOL expression to be converted to clause form
%%%     Clause   <== clause form of FOL expression
%%%     FreeVars ==> list of free variables in clause

% literals: left unchanged (except literal marker is removed)
clausify_antecedent(L0,L,[]) :- clausify_literal(L0,L).

% conjunctions: each conjunct is clausified separately
clausify_antecedent(E0&F0,(E,F),V) :-
   clausify_antecedent(E0,E,V0),
   clausify_antecedent(F0,F,V1),
   conc(V0,V1,V).

% existentials: variable is left implicitly scoped
clausify_antecedent(exists(X,F0),F,[X|V]) :-
   clausify_antecedent(F0,F,V).


%%% clausify_literal(Literal, Clause)
%%% =================================
%%%
%%%     Literal  ==> FOL literal to be converted to clause form
%%%     Clause   <== clause form of FOL expression

% clausifying literals: literal is left unchanged
%                       (except literal marker is removed)
clausify_literal(~L,L).

/*======================================================================
                                Grammar

Nonterminal names:

        q        Question
        sinv        INVerted Sentence
        s        noninverted Sentence
        np        Noun Phrase
        vp        Verb Phrase
        iv        Intransitive Verb
        tv        Transitive Verb
        aux        AUXiliary verb
        rov        subject-Object Raising Verb
        optrel        OPTional RELative clause
        relpron        RELative PRONoun
        whpron        WH PRONoun
        det        DETerminer
        n        Noun
        pn        Proper Noun

Typical order of arguments:

        verb form:                finite, nonfinite, etc.
                                (for auxiliaries and raising verbs:
                                  Form1-Form2 
                                   where Form1 is form of embedded VP
                                               Form2 is form of verb itself)
        FOL logical form
        gap information:        nogap or gap(Nonterm, Var)
                                where Nonterm is nonterminal for gap
                                      Var is the LF variable that
                                          the filler will bind
======================================================================*/


q(S => ~answer(X)) --> 
   whpron, vp(finite, X^S, nogap).
q(S => ~answer(X)) --> 
   whpron, sinv(S, gap(np, X)).
q(S => ~answer(sim)) --> 
   sinv(S, nogap).

q(S => ~answer(X)) -->
    whpron,
    ['é'],
    np((X^S0)^S, nogap),
    interrogacao.

q(S => ~answer(X)) -->
    whpron,
    np((X^S0)^S, nogap),
    ['é'],
    interrogacao.

q(S => ~answer(sim)) -->
   ['é'], 
   np((X^S0)^S, nogap), 
   np((X^true)^exists(X,S0&true), nogap),
   interrogacao.
   
q(S => ~answer('sim, meu consagrado')) -->
   np((X^S0)^S, nogap),
   ['é'], 
   np((X^true)^exists(X,S0&true), nogap),
   interrogacao.


s(S, GapInfo) --> 
   np(VP^S, nogap), 
   vp(finite, VP, GapInfo).

sinv(S, GapInfo) --> 
   aux(finite/Form, VP1^VP2), 
   np(VP2^S, nogap), 
   vp(Form, VP1, GapInfo).

np(NP, nogap) --> 
   det(N2^NP), n(N1), optrel(N1^N2).
np(NP, nogap) --> pn(NP).
np((X^S)^S, gap(np, X)) --> [].

vp(Form, X^S, GapInfo) -->
   tv(Form, X^VP), 
   np(VP^S, GapInfo).
vp(Form, VP, nogap) --> 
   iv(Form, VP).
vp(Form1, VP2, GapInfo) -->
   aux(Form1/Form2, VP1^VP2), 
   vp(Form2, VP1, GapInfo).
vp(Form1, VP2, GapInfo) -->
   rov(Form1/Form2, NP^VP1^VP2), 
   np(NP, GapInfo), 
   vp(Form2, VP1, nogap).
vp(Form2, VP2, GapInfo) -->
   rov(Form1/Form2, NP^VP1^VP2), 
   np(NP, nogap), 
   vp(Form1, VP1, GapInfo).
vp(finite, X^S, GapInfo) -->
   ['é'],
   np((X^P)^exists(X,S&P), GapInfo).

optrel((X^S1)^(X^(S1&S2))) -->
   relpron, vp(finite,X^S2, nogap).
optrel((X^S1)^(X^(S1&S2))) -->
   relpron, s(S2, gap(np, X)).
optrel(N^N) --> [].

/*======================================================================
                               Dictionary
======================================================================*/

/*----------------------------------------------------------------------
                              Preterminals
----------------------------------------------------------------------*/

det(LF) --> [D], {det(D, LF)}.
n(LF)   --> [N], {n(N, LF)}.
pn((E^S)^S) --> [PN], {pn(PN, E)}.

iv(nonfinite,        LF) --> [IV],  {iv(IV, _, _, _, _, LF)}.
iv(finite,           LF) --> [IV],  {iv(_, IV, _, _, _, LF)}.
iv(finite,           LF) --> [IV],  {iv(_, _, IV, _, _, LF)}.
iv(past_participle,  LF) --> [IV],  {iv(_, _, _, IV, _, LF)}.
iv(pres_participle,  LF) --> [IV],  {iv(_, _, _, _, IV, LF)}.

tv(nonfinite,        LF) --> [TV],  {tv(TV, _, _, _, _, LF)}.
tv(finite,           LF) --> [TV],  {tv(_, TV, _, _, _, LF)}.
tv(finite,           LF) --> [TV],  {tv(_, _, TV, _, _, LF)}.
tv(past_participle,  LF) --> [TV],  {tv(_, _, _, TV, _, LF)}.
tv(pres_participle,  LF) --> [TV],  {tv(_, _, _, _, TV, LF)}.

rov(nonfinite      /Requires, LF) --> [ROV], {rov(ROV, _, _, _, _, LF, Requires)}.
rov(finite         /Requires, LF) --> [ROV], {rov(_, ROV, _, _, _, LF, Requires)}.
rov(finite         /Requires, LF) --> [ROV], {rov(_, _, ROV, _, _, LF, Requires)}.
rov(past_participle/Requires, LF) --> [ROV], {rov(_, _, _, ROV, _, LF, Requires)}.
rov(pres_participle/Requires, LF) --> [ROV], {rov(_, _, _, _, ROV, LF, Requires)}.

aux(Form, LF) --> [Aux], {aux(Aux, Form, LF)}.
relpron --> [RP], {relpron(RP)}.
whpron --> [WH], {whpron(WH)}.
interrogacao --> [IN], {interrogacao(IN)}.

/*----------------------------------------------------------------------
                             Lexical Items
----------------------------------------------------------------------*/

interrogacao( '?' ).

relpron( that ).
relpron( who  ).
relpron( whom ).

whpron( who  ).
whpron( whom ).
whpron( what ).

whpron( por ).
whpron( que ).
whpron( quais ).
whpron( qual ).
whpron( quantos ).
whpron( quanto ).
whpron( quantas ).
whpron( quanta ).
whpron( quem ).
whpron( quando ).
whpron( para ).
whpron( como ).

det( todos, (X^S1)^(X^S2)^   all(X,S1=>S2) ).
det( um,     (X^S1)^(X^S2)^exists(X,S1&S2)  ).
det( uma,     (X^S1)^(X^S2)^exists(X,S1&S2)  ).
det( algum,  (X^S1)^(X^S2)^exists(X,S1&S2)  ).
det( alguma,  (X^S1)^(X^S2)^exists(X,S1&S2)  ).

n( autor,     X^ ~autor(X)     ).
n( livros,       X^ ~livro(X)       ).
n( livro,       X^ ~livro(X)       ).
n( professor,  X^ ~professor(X)  ).
n( programa,    X^ ~programa(X)    ).
n( programador, X^ ~programador(X) ).
n( estudante,    X^ ~estudante(X)    ).

pn( begriffsschrift, begriffsschrift ).
pn( bertrand,        bertrand        ).
pn( bill,            bill            ).
pn( gottlob,         gottlob         ).
pn( lunar,           lunar           ).
pn( principia,       principia       ).
pn( shrdlu,          shrdlu          ).
pn( terry,           terry           ).
pn( micael,          micael          ).

iv( halt,    halts,    halted,    halted,    halting,      X^ ~halt(X)       ).

tv( write,   writes,   wrote,     written,   writing,    X^Y^ ~writes(X,Y)   ).
tv( escrever,   escreve,  escreveu,   escrito,  escrevendo,    X^Y^ ~escrever(X,Y)   ).
tv( meet,    meets,    met,       met,       meeting,    X^Y^ ~meets(X,Y)    ).
tv( concern, concerns, concerned, concerned, concerning, X^Y^ ~concerns(X,Y) ).
tv( run,     runs,     ran,       run,       running,    X^Y^ ~runs(X,Y)     ).

rov( want,   wants,    wanted,    wanted,    wanting,
     % semantics is NP ^ VP ^ Y ^ NP( X^want(Y,X,VP(X)) ):
     ((X^ ~want(Y,X,Comp))^S) ^ (X^Comp) ^ Y ^ S,
     % form of VP required:
     infinitival).

aux( to,     infinitival/nonfinite,      VP^ VP          ).
aux( does,   finite/nonfinite,           VP^ VP          ).
aux( did,    finite/nonfinite,           VP^ VP          ).

/*======================================================================
                          Auxiliary Predicates
======================================================================*/


%%% conc(List1, List2, List)
%%% ========================
%%%
%%%     List1 ==> a list
%%%     List2 ==> a list
%%%     List  <== the concatenation of the two lists

conc([], List, List).

conc([Element|Rest], List, [Element|LongRest]) :-
    conc(Rest, List, LongRest).


%%% read_sent(Words)
%%% ================
%%%
%%%      Words ==> set of words read from the standard input
%%%
%%%     Words are delimited by spaces and the line is ended by 
%%%     a newline.  Case is not folded; punctuation is not stripped.

read_sent(Words) :-
    % prime the lookahead
    get0(Char),
    % get the words
    read_sent(Char, Words).

% Newlines end the input.
read_sent(10, []) :- !.

% Spaces are ignored.
read_sent(32, Words) :- !,
    get0(Char),
    read_sent(Char, Words).

% Question mark is added as new word.
read_sent(63, [Word|Words]) :- !,
    name(Word,[63]),
    get0(Char),
    read_sent(Char, Words).

% Everything else starts a word.
read_sent(Char, [Word|Words]) :-
    % get the word
    read_word(Char, Chars, Next),
    % pack the characters into an atom
    name(Word, Chars),
    % get some more words
    read_sent(Next, Words).


%%% read_word(Chars)
%%% ================
%%%
%%%     Chars ==> list of characters read from standard input and 
%%%               delimited by spaces or newlines

% Space, newline and question mark end a word.
read_word(32, [], 32) :- !.
read_word(63, [], 63) :- !.
read_word(10, [], 10) :- !.

% All other chars are added to the list.
read_word(Char, [Char|Chars], Last) :-
   get0(Next),
   read_word(Next, Chars, Last).

%%% question(Char)
%%% ===========
%%%
%%%     Char ==> the ASCII code for the question
%%%              character

question(63).

%%% space(Char)
%%% ===========
%%%
%%%     Char ==> the ASCII code for the space
%%%              character

space(32).


%%% newline(Char)
%%% =============
%%%
%%%     Char ==> the ASCII code for the newline
%%%              character

newline(10).
