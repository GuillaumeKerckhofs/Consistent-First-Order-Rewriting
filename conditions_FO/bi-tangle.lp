#show satisfied/0.
#show unsatisfied/0.

table(T):- vrow(I,T,N,V).

jointVariable(J,V):-  vrow(I,T,N,V), vrow(I2,T2,N2,V), T!=T2, kd(J,T,K), not kd(J,T,V).
jointKey(I,J,V):- kd(J,T,V), kd(I,T,V), J!=I, jointVariable(I,W).
jointTable(I,J,T):- kd(J,T,V), kd(I,T,V), J!=I.

out(I,J,M) :- kd(M,T2,V), T!=T2, not jointClosure(I,J,V), jointTable(I,J,T).
jointClosure(I,J,V) :- jointKey(I,J,V), jointVariable(I,W).
jointClosure(I,J,V) :- not out(I,J,I2), vrow(R,T2,N,V), kd(I2,T2,K), jointTable(I,J,T),  T!=T2.

keyCount(N) :- N = #count{I,J,V: jointClosure(I,J,V)}.
#minimize{N: keyCount(N)}.




unsatisfied:- jointVariable(J,V), jointKey(J,I,W), kd(J,T,Z), not jointClosure(I,J,Z).
satisfied:- not unsatisfied.