domains
	list = integer*.

predicates
	len(list, integer).
	len(list, integer, integer).
	sum(list, integer).
	sum(list, integer, integer).
	sumOddPos(list, integer).
	sumOddPos(list, integer, integer).

clauses
	len(List, Len) :- len(List, 0, Len).
	len([], Len, Len) :- !.
	len([_|T], CurLen, Len) :-
		NewLen = CurLen + 1,
		len(T, NewLen, Len).

	sum(List, Sum) :- sum(List, 0, Sum).
	sum([], Sum, Sum) :- !.
	sum([H|T], CurSum, Sum) :-
		NewSum = CurSum + H,
		sum(T, NewSum, Sum).

	sumOddPos(List, Sum) :- sumOddPos(List, 0, Sum).
	sumOddPos([], Sum, Sum) :- !.
	sumOddPos([_], Sum, Sum) :- !.
	sumOddPos([_|[H|T]], CurSum, Sum) :-
		NewSum = CurSum + H,
		sumOddPos(T, NewSum, Sum).

goal
	%len([0, 1, -2, 10], Len).
	%sum([0, -2, 10], Sum).
	%sumOddPos([1, 2, 1, 2, 1], Sum).
	%sumOddPos([1, 2, 1, 2], Sum).
