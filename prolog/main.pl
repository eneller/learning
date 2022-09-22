% 4 positions allowed
% Alice, Bob, Charlie und Eve besuchen gemeinsam ein Tutorium. Alice
% und Bob sitzen direkt neben Eve, Bob sitzt rechts von Alice, aber links von Charlie.
% In welcher Reihenfolge sitzen die vier?
pos(0).
pos(1).
pos(2).
pos(3).
nextto(X,Y) :- X-1 =:= Y; X+1 =:= Y .
left(X,Y) :- X < Y .
different(A,B,C,D) :- A =\= B , A =\= C, A =\= D, B =\=C, B =\= D, C =\= D .
solvea(A, B, C, D) :- pos(A), pos(B), pos(C), pos(D), 
different(A,B,C,D), nextto(A,D), nextto(B,D), left(A,B), left(B,C) .
% call solve1(A,B,C,E). to solve


dice(X) :- member(X, [1,2,3,4,5,6]).
% Bob, Kevin und Carla würfeln,
%• Bob hat mehr Punkte als Kevin,
%• Carla hat weniger Punkte als Kevin und Bob zusammen,
%• die Augensumme der drei ist 4.
solveb(B,K,C) :- dice(B), dice(K), dice(C),
    B > K, C < K+B, B+K+C=:=4 .

% Arnold und Reinhold würfeln mit je 2 Würfeln.
%• Arnold oder Reinhold hat einen Pasch gewürfelt (beide Würfel haben die gleiche Zahl).
%• Die Summe der Augenzahlen von Arnold ist 8.
%• Die Summe der Augenzahlen beider Spieler ist 18.
%• Ein Würfel von Reinhold hat eine höhere Augenzahl als ein Würfel von Arnold.
%• Ein Würfel von Arnold hat eine höhere Augenzahl als ein Würfel von Reinhold
solvec(A1, A2, R1, R2) :- dice(A1), dice(A2), dice(R1), dice(R2), 
    (A1 =:= A2 ; R1 =:= R2),
    A1+A2 =:= 8,
    R1+R2 =:= 10,
    A1 > R1, A2 < R2. % this is ok because we dont really care about first and second dice

east, west <=> true.
north, south <=> true.