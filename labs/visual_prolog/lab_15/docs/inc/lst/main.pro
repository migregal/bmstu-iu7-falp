domains
	number = integer

predicates
	maxTwo(number, number, number).
	maxTwoCut(number, number, number).

	maxThree(number, number, number, number).
	maxThreeCut(number, number, number, number).

clauses
	maxTwo(A, B, A) :- A >= B.
	maxTwo(A, B, B) :- A < B.

	maxTwoCut(A, B, A) :- A >= B, !.
	maxTwoCut(_, B, B).

	maxThree(A, B, C, A) :- A >= B, A >= C.
	maxThree(_, B, C, Res) :- maxTwo(B, C, Res).

	maxThreeCut(A, B, C, A) :- A >= B, A >= C, !.
	maxThreeCut(_, B, C, Res) :- maxTwo(B, C, Res).

goal
	%maxThree(3, 1, 2, R). %(1)
	maxThreeCut(3, 1, 2, R). %(2)
