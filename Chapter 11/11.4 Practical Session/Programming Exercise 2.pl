% Assumption: lists:subset/2 as defined in SWI-Prolog correctly lists all subsets T of S upon posing the query subset(T, S) with T an uninstantiated variable (which it actually doesn't)

powerset(S, P) :- findall(T, subset(T, S), P).
