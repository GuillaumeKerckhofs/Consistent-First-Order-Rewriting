#show satisfied/0.
#show unsatisfied/0.


key(I,T):- kd(I,T,V).
value(V):- vrow(R,T,N,V).
value(qed).

jointKey(I,J,V):- kd(J,T,V), kd(I,T,V), J!=I.
jointKey(I,J,L,V):- kd(J,T,V), kd(I,T,V), kd(L,T,V), L!=I, J!=I, J!=L.
jointTable(I,J,T):- kd(J,T,V), kd(I,T,W), J!=I.
jointTable(I,J,L,T):- kd(J,T,V), kd(I,T,W), kd(L,T,Z), L!=I, J!=I, J!=L.

out(I,J,V) :- not jointClosure(I,J,V), kd(I2,T2,V), jointTable(I,J,T), T!=T2.
jointClosure(I,J,V) :- jointKey(I,J,V).
jointClosure(I,J,V) :- not out(I,J,K), vrow(R,T2,N,V), kd(I2,T2,K), jointTable(I,J,T), K!=V, T!=T2.

existClosure(I,J):- jointClosure(I,J,V), V!=qed.
jointClosure(I,J,V) :- not existClosure(I,J), jointTable(I,J,T), value(V), V=qed.

keyCount(N) :- N = #count{I,J,V: jointClosure(I,J,V)}.
#minimize{N: keyCount(N)}.

out(I,J,L,V) :- vrow(I,T2,N,V), kd(J,T2,K), T!=T2, not jointClosure(I,J,L,K), jointTable(I,J,L,T).
jointClosure(I,J,L,V) :- jointKey(I,J,L,V).
jointClosure(I,J,L,V) :- not out(I,J,L,V), vrow(R,T2,N,V), kd(I2,T2,K),  jointTable(I,J,L,T), K!=V, T!=T2.

existClosure(I,J,L):- jointClosure(I,J,L,V), V!=qed.
jointClosure(I,J,L,V) :- not existClosure(I,J,L), jointTable(I,J,L,T), value(V), V=qed.

joitClosureCount(N) :- N = #count{I,J,L,V: jointClosure(I,J,L,V)}.
#minimize{N: joitClosureCount(N)}.


outJointClosure(I,J,V):- key(I,T), key(J,T), value(V), not jointClosure(I,J,V), V!=qed, I!=J.
keyInJointClosure(I,J):- I!=J, key(J,T), kd(I,T,V), not outJointClosure(I,J,V). 

outJointClosure(I,J,L,V):- key(I,T), key(J,T), key(L,T), value(V), not jointClosure(I,J,L,V), L!=I, J!=I, J!=L.
subsetInJointClosure(J,K,L):- jointKey(J,K,V), outJointClosure(J,K,L,V), V!=qed.
subsetInJointClosure(J,K,L):- jointKey(J,K,V), outJointClosure(J,K,L,V), V!=qed.
subsetInJointClosure(J,K,L):- jointKey(J,K,V), outJointClosure(J,K,L,V), V!=qed.

unsatisfied:- kd(I,T,V), keyInJointClosure(J,I), keyInJointClosure(K,I), kd(L,T,W), not subsetInJointClosure(J,K,L), J!=K, K!=L, J!=L.

satisfied:- not unsatisfied.