s --> np(X, _), vp(X).

np(X, Y) --> det(X, Y), n(X, Y).

vp(X) --> v(X), np(_, _).
vp(X) --> v(X).

det(_, _) --> [the].
det(singular, consonant) --> [a].
det(singular, vowel) --> [an].

n(singular, consonant) --> [woman].
n(plural, _) --> [women].
n(singular, consonant) --> [man].
n(plural, _) --> [men].
n(singular, vowel) --> [apple].
n(plural, _) --> [apples].
n(singular, consonant) --> [pear].
n(plural, _) --> [pears].
n(_, consonant) --> [sheep].
n(_, consonant) --> [fish].

v(singular) --> [eats].
v(plural) --> [eat].
v(singular) --> [knows].
v(plural) --> [know].
