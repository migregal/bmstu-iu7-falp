parent("Andrey", "Boris", "m").
parent("Andrey", "Daria", "w").
parent("Boris", "Denis", "m").
parent("Boris", "Eugenia", "w").
parent("Daria", "Fedor", "m").
parent("Daria", "Julia", "w").

grand(Child, NameGrand, Line, Sex) :-
    parent(Child, NameParent, Line),
    parent(NameParent, NameGrand, Sex).

nthMom(0, Child, R) :- R = Child, !.
nthMom(N, Child, R) :-
    parent(Child, Parent, "w"),
    N1 is N - 1,
    nthMom(N1, Parent, R).
