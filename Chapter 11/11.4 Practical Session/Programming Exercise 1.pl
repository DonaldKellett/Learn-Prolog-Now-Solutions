% Caveat: although this predicate can accurately verify whether T is a subset of S in subset(T, S) and memoizes its results for efficient computation, it fails to generate all possible subsets T of S when posed with the query subset(T, S) where T is an uninstantiated variable.

:- dynamic subsetres/2.

subset(T, S) :- subsetres(T, S), !.
subset([], S) :- assert(subsetres([], S)).
subset([_ | T], S) :- subset(T, S), length(T, M), length(S, N), M >= N, !, fail.
subset([H | T], S) :- subset(T, S), member(H, S), \+ member(H, T), assert(subsetres([H | T], S)).
