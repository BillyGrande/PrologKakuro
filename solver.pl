
accepted_number(1).
accepted_number(2).
accepted_number(3).
accepted_number(4).
accepted_number(5).
accepted_number(6).
accepted_number(7).
accepted_number(8).
accepted_number(9).

accepted_numbers([]).
accepted_numbers([H|Rs]) :-
    accepted_number(H),
    accepted_numbers(Rs).

unique_list([]).
unique_list([H|Ls]) :-
    \+ index_of(H,Ls,_),
    unique_list(Ls).

sum([],0).
sum([H|Ls],Sum) :-
    sum(Ls,Sum2),
    Sum #= Sum2 + H.

line(Ls,Sum) :-
    accepted_numbers(Ls),
    unique_list(Ls),
    sum(Ls,Sum).

solve([A,B,C,E,F,G,J,K,L,N,O,P]) :-
    line([A,B,C],24),
    line([E,F,G],11),
    line([J,K,L],22),
    line([N,O,P],14),
    line([A,E],17),
    line([B,F,J,N],26),
    line([C,G,K,O],15),
    line([L,P],13).

solution() :-
    solve([A,B,C,E,F,G,J,K,L,N,O,P]),
    write('A='),write(A),nl,
    write('B='),write(B),nl,
    write('C='),write(C),nl,
    write('E='),write(E),nl,
    write('F='),write(F),nl,
    write('G='),write(G),nl,
    write('J='),write(J),nl,
    write('K='),write(K),nl,
    write('L='),write(L),nl,
    write('N='),write(N),nl,
    write('O='),write(O),nl,
    write('P='),write(P),nl.

/*
solve([X1,X2,X3,X4,X5,X6,X7]) :-
    line([X1,X2],10),
    line([X3,X6],16),
    line([X2,X5],16),
    line([X6,X7],17),
    line([X1,X4,X7],13),
    line([X3,X4,X5],18).
*/

/*
   X1,X2 = 10
   X2,X5 = 16
   X7,X4 = 17
   X1,X3,X4 = 13
   X6,X3,X5 = 18
*/


index_of(H,[H|_],0).

index_of(H,[_|Ls],I) :-
    index_of(H,Ls,I2),
    I #= I2 + 1.

index_of_failsafe(H,Ls,I) :-
    index_of(H,Ls,I);
    I #= -1.
