domains
	list = integer*.

predicates
	odd(list, list).

clauses
	odd([_, H|T], [H|Res]) :- odd(T, Res).
	odd([_], []) :- !.
	odd([],[]) :- !.

goal
	odd([0, 1, 2, 3, 4, 5, 7], Result).
