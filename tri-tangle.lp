#show jointClosure/4.



jointKey(I,J,V):- kd(J,T,V), kd(I,T,V), J!=I.
jointKey(I,J,L,V):- kd(J,T,V), kd(I,T,V), kd(L,T,V), L!=I, J!=I, J!=L.
jointTable(I,J,T):- kd(J,T,V), kd(I,T,V), J!=I.
jointTable(I,J,L,T):- kd(J,T,V), kd(I,T,V), kd(L,T,V), L!=I, J!=I, J!=L.

out(I,J,V) :- not jointClosure(I,J,K), vrow(R,T2,N,V), kd(I2,T2,K), jointTable(I,J,T), T!=T2.
jointClosure(I,J,V) :- jointKey(I,J,V).
jointClosure(I,J,V) :- not out(I,J,K), vrow(R,T2,N,V), kd(I2,T2,K), jointTable(I,J,T), K!=V, T!=T2.

keyCount(N) :- N = #count{I,J,V: jointClosure(I,J,V)}.
#minimize{N: keyCount(N)}.

out(I,J,L,V) :- vrow(I,T2,N,V), kd(J,T2,K), T!=T2, not jointClosure(I,J,L,K), jointTable(I,J,L,T).
jointClosure(I,J,L,V) :- jointKey(I,J,L,V).
jointClosure(I,J,L,V) :- not out(I,J,L,V), vrow(R,T2,N,V), kd(I2,T2,K),  jointTable(I,J,L,T), K!=V, T!=T2.

joitClosureCount(N) :- N = #count{I,J,L,V: jointClosure(I,J,L,V)}.
#minimize{N: joitClosureCount(N)}.