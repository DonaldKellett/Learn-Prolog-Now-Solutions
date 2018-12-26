% DCG example with parse tree given in 8.1 Extra Arguments of Learn Prolog Now!

s(s(NP,VP)) --> np(NP),vp(VP).

np(np(DET,N)) --> det(DET),n(N).

vp(vp(V,NP)) --> v(V),np(NP).
vp(vp(V))    --> v(V).

det(det(the)) --> [the].
det(det(a))   --> [a].

n(n(woman)) --> [woman].
n(n(man))   --> [man].

v(v(shoots)) --> [shoots].

% Main task - pretty printer for parse tree

% helper_list/2 - Pretty printer for lists with explicit argument for handling indentation
helper_list([H], N) :- helper(H, N).
helper_list([H | T], N) :- length(T, M), M =\= 0, helper(H, N), nl, tab(N), helper_list(T, N).

% helper/2 - Pretty printer for parse trees with explicit argument for handling indentation
helper(Term, _) :- var(Term), write(Term).
helper(Term, N) :- nonvar(Term), is_list(Term), helper_list(Term, N).
helper(Term, _) :- nonvar(Term), \+ is_list(Term), atomic(Term), write(Term).
helper(Term, N) :- nonvar(Term), \+ is_list(Term), \+ atomic(Term), Term =.. [FnName, ArgName], write(FnName), write('('), helper(ArgName, N), write(')').
helper(Term, N) :- nonvar(Term), \+ is_list(Term), \+ atomic(Term), Term =.. [H | T], length(T, L), L > 1, write(H), write('('), nl, M is N + 2, tab(M), helper_list(T, M), write(')').

% pptree/1 - Pretty printer hiding argument for indentation
pptree(Term) :- helper(Term, 0).
