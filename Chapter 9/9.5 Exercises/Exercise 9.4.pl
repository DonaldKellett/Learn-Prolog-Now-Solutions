groundterm(Term) :- nonvar(Term), atomic(Term).
groundterm(Term) :- nonvar(Term), Term =.. [_ | ArgLst], allground(ArgLst).
allground([]).
allground([H | T]) :- groundterm(H), allground(T).
