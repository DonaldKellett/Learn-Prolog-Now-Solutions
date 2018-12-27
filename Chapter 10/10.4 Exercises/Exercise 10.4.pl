% Knowledge base as provided in Ex 3.3 of Learn Prolog Now!

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

% Main Task

% Symmetric predicate
% Credit: https://stackoverflow.com/questions/791822/prolog-symetrical-predicates (second top answer at time of writing)
% Probably not the solution the exercise intended but whatever :p
hasDirectTrain(A, B) :- directTrain(A, B).
hasDirectTrain(A, B) :- directTrain(B, A).

% Finding a path between two vertices in an undirected graph
% Credit: https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_15.html

route(A, B, Route) :- helper(A, B, [A], RevRoute), reverse(RevRoute, Route).
helper(A, B, P, [B | P]) :- hasDirectTrain(A, B).
helper(A, B, VisitedCities, RevRoute) :- hasDirectTrain(A, C), C \== B, \+ member(C, VisitedCities), helper(C, B, [C | VisitedCities], RevRoute).
