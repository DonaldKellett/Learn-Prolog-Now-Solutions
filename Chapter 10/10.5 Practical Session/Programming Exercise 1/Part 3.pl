nu(X, _) :- var(X), !, fail.
nu(_, Y) :- var(Y), !, fail.
nu(X, Y) :- is_list(X), is_list(Y), !, list_nu(X, Y, []).
nu(X, Y) :- atomic(X), atomic(Y), !, X \== Y.
nu(X, Y) :- functor(X, F0, _), functor(Y, F1, _), F0 \== F1, !.
nu(X, Y) :- functor(X, _, N0), functor(Y, _, N1), N0 =\= N1, !.
nu(X, Y) :- X =.. [_ | T0], Y =.. [_ | T1], list_nu(T0, T1, []).

list_nu([], [], _) :- !, fail.
list_nu([], _, _) :- !.
list_nu(_, [], _) :- !.
list_nu([H0 | _], [H1 | _], _) :- nu(H0, H1), !.
list_nu([H0 | _], [H1 | _], Pairs) :- conflict(pair(H0, H1), Pairs), !.
list_nu([H0 | T0], [H1 | T1], Pairs) :- list_nu(T0, T1, [pair(H0, H1) | Pairs]).

conflict(_, []) :- !, fail.
conflict(pair(X0, Y0), [pair(X1, Y1) | _]) :- var(X0), var(X1), X0 == X1, nu(Y0, Y1), !.
conflict(pair(X0, Y0), [pair(X1, Y1) | _]) :- var(X0), var(Y1), X0 == Y1, nu(Y0, X1), !.
conflict(pair(X0, Y0), [pair(X1, Y1) | _]) :- var(Y0), var(X1), Y0 == X1, nu(X0, Y1), !.
conflict(pair(X0, Y0), [pair(X1, Y1) | _]) :- var(Y0), var(Y1), Y0 == Y1, nu(X0, X1), !.
conflict(Pair, [_ | T]) :- conflict(Pair, T).
