fact(0, R, R) :- !.
fact(N, Acc, R) :-
    NewN is N - 1,
    NewAcc is Acc * N,
    fact(NewN, NewAcc, R).

fact(N, R) :- fact(N, 1, R).

fact(N) :- fact(N, X), write(X).
