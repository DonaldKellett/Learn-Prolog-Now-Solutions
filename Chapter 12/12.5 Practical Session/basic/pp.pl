:- module(pp, [pptree/2]).

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

% helper_list/3 - Pretty printer for lists with explicit argument for handling indentation
helper_list(OutStream, [H], N) :- helper(OutStream, H, N).
helper_list(OutStream, [H | T], N) :- length(T, M), M =\= 0, helper(OutStream, H, N), nl(OutStream), tab(OutStream, N), helper_list(OutStream, T, N).

% helper/3 - Pretty printer for parse trees with explicit argument for handling indentation
helper(OutStream, Term, _) :- var(Term), write(OutStream, Term).
helper(OutStream, Term, N) :- nonvar(Term), is_list(Term), helper_list(OutStream, Term, N).
helper(OutStream, Term, _) :- nonvar(Term), \+ is_list(Term), atomic(Term), write(OutStream, Term).
helper(OutStream, Term, N) :- nonvar(Term), \+ is_list(Term), \+ atomic(Term), Term =.. [FnName, ArgName], write(OutStream, FnName), write(OutStream, '('), helper(OutStream, ArgName, N), write(OutStream, ')').
helper(OutStream, Term, N) :- nonvar(Term), \+ is_list(Term), \+ atomic(Term), Term =.. [H | T], length(T, L), L > 1, write(OutStream, H), write(OutStream, '('), nl(OutStream), M is N + 2, tab(OutStream, M), helper_list(OutStream, T, M), write(OutStream, ')').

% pptree/2 - Pretty printer hiding argument for indentation
pptree(OutStream, Term) :- helper(OutStream, Term, 0), nl(OutStream), !.
