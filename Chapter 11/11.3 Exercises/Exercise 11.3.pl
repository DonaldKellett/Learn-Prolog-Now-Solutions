:- dynamic sigmares/2.

sigma(N, _) :- N =< 0, !, fail.
sigma(N, S) :- sigmares(N, S), !.
sigma(N, S) :- S is div(N * (N + 1), 2), assert(sigmares(N, S)).
