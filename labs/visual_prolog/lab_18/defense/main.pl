:- [triangles].
:- [perm].

sss([A, B, C], [A1, B1, C1]) :-
    X is A / A1,
    Y is B / B1,
    Z is C / C1,
    X =:= Y, X =:= Z.

findSimilar([A1, B1, C1], [Tr | Triangles], [Tr | R]) :-
    sidesLen(Tr, Ai, Bi, Ci),
    perm([A1, B1, C1], Sides),
    sss(Sides, [Ai, Bi, Ci]), !,
    findSimilar([A1, B1, C1], Triangles, R).

findSimilar(T, [_ | Triangles], R) :-
    findSimilar(T, Triangles, R).

findSimilar(_, [], []) :- !.

findSimilar(T, R) :-
    triangles(Triangles),
    sidesLen(T, A, B, C),
    findSimilar([A, B, C], Triangles, R).

sideLen(point(A1, A2, A3), point(B1, B2, B3), Len) :-
    Len is sqrt((A1-B1)*(A1-B1) + (A2-B2)*(A2-B2) + (A3-B3)*(A3-B3)).

sidesLen(triangle(_, A, B, C), La, Lb, Lc) :-
    sideLen(B, C, La),
    sideLen(A, C, Lb),
    sideLen(A, B, Lc).

triangles(T) :- findall(triangle(N, P1, P2, P3), triangle(N, P1, P2, P3), T).
