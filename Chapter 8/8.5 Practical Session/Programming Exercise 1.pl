s(s(NP, VP)) --> np(NP, X, _), vp(VP, X).
s(s(NP, VP)) --> np(NP, subject), vp(VP, singular).

np(np(DET, N), X, Y) --> det(DET, X, Y), n(N, X, Y).
np(np(PRO), X) --> pro(PRO, X).

vp(vp(V, NP), X) --> v(V, X), np(NP, _, _).
vp(vp(V, NP), X) --> v(V, X), np(NP, object).
vp(vp(V), X) --> v(V, X).

v(v(Word, X), X) --> [Word], {lex(Word, v(X))}.
n(n(Word, X, Y), X, Y) --> [Word], {lex(Word, n(X, Y))}.
det(det(Word, X, Y), X, Y) --> [Word], {lex(Word, det(X, Y))}.
pro(pro(Word, X), X) --> [Word], {lex(Word, pro(X))}.

lex(he, pro(subject)).
lex(him, pro(object)).
lex(she, pro(subject)).
lex(her, pro(object)).

lex(the, det(_, _)).
lex(a, det(singular, consonant)).
lex(an, det(singular, vowel)).

lex(woman, n(singular, consonant)).
lex(women, n(plural, _)).
lex(man, n(singular, consonant)).
lex(men, n(plural, _)).
lex(apple, n(singular, vowel)).
lex(apples, n(plural, _)).
lex(pear, n(singular, consonant)).
lex(pears, n(plural, _)).
lex(sheep, n(_, consonant)).
lex(fish, n(_, consonant)).
lex(elk, n(_, vowel)).

lex(eats, v(singular)).
lex(eat, v(plural)).
lex(shoots, v(singular)).
lex(shoot, v(plural)).
lex(drinks, v(singular)).
lex(drink, v(plural)).
