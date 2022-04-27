domains
  name = symbol.
  sex = symbol.

predicates
  parent(name, name, sex).
  grand(name, name, sex, sex).

clauses
  parent("Andrey", "Boris", "m").
  parent("Andrey", "Daria", "w").
  parent("Boris", "Denis", "m").
  parent("Boris", "Eugenia", "w").
  parent("Daria", "Fedor", "m").
  parent("Daria", "Julia", "w").

  grand(Child, NameGrand, Line, Sex) :-
    parent(Child, NameParent, Line),
    parent(NameParent, NameGrand, Sex).

goal
  % grand("Andrey", NameGrandma, _, "w").
  % grand("Andrey", NameGrandpa, _, "m").
  % grand("Andrey", NameGrands, _, _).
  % grand("Andrey", NameGrandma, "w", "w").
  grand("Andrey", NameMaGrands, "w", _).
