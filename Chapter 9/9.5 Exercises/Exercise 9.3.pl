termtype(Term, variable) :- var(Term).
termtype(Term, atom) :- atom(Term).
termtype(Term, integer) :- integer(Term).
termtype(Term, float) :- float(Term).
termtype(Term, number) :- number(Term).
termtype(Term, constant) :- atomic(Term).
termtype(Term, simple_term) :- nonvar(Term), functor(Term, _, A), A =:= 0.
termtype(Term, complex_term) :- nonvar(Term), functor(Term, _, A), A > 0.
termtype(Term, term) :- nonvar(Term).
