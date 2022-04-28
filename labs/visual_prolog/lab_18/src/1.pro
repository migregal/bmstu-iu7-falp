domains
	list = integer*.

predicates
	f(list, integer, list).

clauses
	f([H|T], El, [H|Res]) :-
		H > El, !,
		f(T, El, Res).

	f([_|T], El, Res) :-
		f(T, El, Res).
	f([], _, []) :- !.

goal
	f([3, 6, 0, -1, 4], 3, R).
