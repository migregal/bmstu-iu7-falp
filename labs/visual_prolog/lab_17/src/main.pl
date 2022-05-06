len(List, Len) :- len(List, 0, Len).
len([], Len, Len).
len([_|T], CurLen, Len) :-
	NewLen is CurLen + 1,
	len(T, NewLen, Len).

sum(List, Sum) :- sum(List, 0, Sum).
sum([], Sum, Sum).
sum([H|T], CurSum, Sum) :-
	NewSum is CurSum + H,
	sum(T, NewSum, Sum).

sumOddPos(List, Sum) :- sumOddPos(List, 0, Sum).
sumOddPos([], Sum, Sum).
sumOddPos([_], Sum, Sum) :- !.
sumOddPos([_|[H|T]], CurSum, Sum) :-
	NewSum is CurSum + H,
	sumOddPos(T, NewSum, Sum).
