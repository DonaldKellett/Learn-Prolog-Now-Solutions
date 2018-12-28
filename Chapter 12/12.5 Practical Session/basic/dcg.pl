:- module(dcg, [s/3]).

s(s(NP, VP)) --> np(NP, subject, X, _), vp(VP, X, X, _).
s(s(NP, VP)) --> np(NP, subject, X, _), vp(VP, X).
s(s(NP, VP)) --> np(NP, X, _), vp(VP, X, third, _).
s(s(NP, VP)) --> np(NP, X, _), vp(VP, X).

vp(vp(V, NP), X, Y, Z) --> v(V, X), np(NP, object, Y, Z).
vp(vp(V, NP), X) --> v(V, X), np(NP, _, _).
vp(vp(V), X) --> v(V, X).

np(np(DET1, ADJ1, N1, PREP, DET2, ADJ2, N2), X, Y) --> det(DET1, X, Y), adj(ADJ1, Y), n(N1, X, _), prep(PREP), det(DET2, Z, W), adj(ADJ2, W), n(N2, Z, _).
np(np(DET1, N1, PREP, DET2, ADJ, N2), X, Y) --> det(DET1, X, Y), n(N1, X, Y), prep(PREP), det(DET2, Z, W), adj(ADJ, W), n(N2, Z, _).
np(np(DET1, ADJ, N1, PREP, DET2, N2), X, Y) --> det(DET1, X, Y), adj(ADJ, Y), n(N1, X, _), prep(PREP), det(DET2, Z, W), n(N2, Z, W).
np(np(DET1, N1, PREP, DET2, N2), X, Y) --> det(DET1, X, Y), n(N1, X, Y), prep(PREP), det(DET2, Z, W), n(N2, Z, W).
np(np(DET, ADJ, N), X, Y) --> det(DET, X, Y), adj(ADJ, Y), n(N, X, _).
np(np(DET, N), X, Y) --> det(DET, X, Y), n(N, X, Y).
np(np(PRO), X, Y, Z) --> pro(PRO, X, Y, Z).

adj(adj(Word, X), X) --> [Word], {lex(Word, adj(X))}.
prep(prep(Word)) --> [Word], {lex(Word, prep)}.
pro(pro(Word, X), subject, X, Y) --> [Word], {lex(Word, pro(subject, X, Y))}.
pro(pro(Word, Y), object, X, Y) --> [Word], {lex(Word, pro(object, X, Y))}.
det(det(Word, X, Y), X, Y) --> [Word], {lex(Word, det(X, Y))}.
n(n(Word, X, Y), X, Y) --> [Word], {lex(Word, n(X, Y))}.
v(v(Word, X), X) --> [Word], {lex(Word, v(X))}.

lex(big, adj(consonant)).
lex(small, adj(consonant)).
lex(tall, adj(consonant)).
lex(short, adj(consonant)).
lex(frightened, adj(consonant)).
lex(calm, adj(consonant)).
lex(beautiful, adj(consonant)).
lex(handsome, adj(consonant)).
lex(fresh, adj(consonant)).
lex(cute, adj(consonant)).
lex(ugly, adj(vowel)).
lex(famous, adj(consonant)).
lex(notorious, adj(consonant)).
lex(obnoxious, adj(vowel)).
lex(healthy, adj(consonant)).
lex(unhealthy, adj(vowel)).
lex(easy, adj(vowel)).
lex(difficult, adj(consonant)).
lex(clean, adj(consonant)).
lex(dirty, adj(consonant)).

lex(in, prep).
lex(on, prep).
lex(at, prep).
lex(by, prep).
lex(under, prep).
lex(over, prep).
lex(inside, prep).
lex(outside, prep).

lex(i, pro(subject, first, _)).
lex(you, pro(subject, second, _)).
lex(he, pro(subject, third, _)).
lex(she, pro(subject, third, _)).
lex(it, pro(subject, third, _)).
lex(myself, pro(object, first, first)).
lex(me, pro(object, second, first)).
lex(me, pro(object, third, first)).
lex(you, pro(object, first, second)).
lex(yourself, pro(object, second, second)).
lex(you, pro(object, third, second)).
lex(him, pro(object, _, third)).
lex(her, pro(object, _, third)).
lex(it, pro(object, _, third)).

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
lex(elk, n(_, vowel)).
lex(fish, n(_, consonant)).
lex(ox, n(singular, vowel)).
lex(oxen, n(plural, _)).
lex(teacher, n(singular, consonant)).
lex(teachers, n(plural, _)).
lex(professor, n(singular, consonant)).
lex(professors, n(plural, _)).
lex(student, n(singular, consonant)).
lex(students, n(plural, _)).
lex(person, n(singular, consonant)).
lex(people, n(plural, _)).
lex(compiler, n(singular, consonant)).
lex(compilers, n(plural, _)).
lex(interpreter, n(singular, vowel)).
lex(interpreters, n(plural, _)).
lex(exam, n(singular, vowel)).
lex(exams, n(plural, _)).
lex(test, n(singular, consonant)).
lex(tests, n(plural, _)).
lex(drink, n(singular, consonant)).
lex(drinks, n(plural, _)).
lex(table, n(singular, consonant)).
lex(tables, n(plural, _)).
lex(tree, n(singular, consonant)).
lex(trees, n(plural, _)).
lex(cow, n(singular, consonant)).
lex(cows, n(plural, _)).

lex(shoots, v(singular)).
lex(shoots, v(third)).
lex(shoot, v(plural)).
lex(shoot, v(first)).
lex(shoot, v(second)).
lex(eats, v(singular)).
lex(eats, v(third)).
lex(eat, v(plural)).
lex(eat, v(first)).
lex(eat, v(second)).
lex(drinks, v(singular)).
lex(drinks, v(third)).
lex(drink, v(plural)).
lex(drink, v(first)).
lex(drink, v(second)).
lex(cleans, v(singular)).
lex(cleans, v(third)).
lex(clean, v(plural)).
lex(clean, v(first)).
lex(clean, v(second)).
