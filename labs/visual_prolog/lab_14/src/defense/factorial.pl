fact(0, X) :- X is 1.
fact(N, X):-
    NN is N - 1,
    fact(NN, X1),
    X is X1 * N.

fact(N) :- fact(N, X), write(X).
