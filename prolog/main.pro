different(A,B,C,D) :- A =\= B , A =/= C, A =/= D, B =/=C, B =/= D, C =/= D .
nextto(X,Y) :- X-1 =:= Y; X+1 =:= Y .
left(X,Y) :- X < Y .
solve(A, B, C, D) :- pos(A), pos(B), pos(C), pos(D), different(A,B,C,D), nextto(A,E), nextto(B,E), left (A,B), left(B,C) .