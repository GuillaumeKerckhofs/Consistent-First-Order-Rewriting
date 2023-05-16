#show satisfied/0.
#show unsatisfied/0.


key(I,T):- kd(I,T,V).
value(V):- vrow(R,T,N,V).
value(qed).

jointKey(I,J,V):- kd(J,T,V), kd(I,T,V), J!=I.
jointKey(I,J,L,V):- kd(J,T,V), kd(I,T,V), kd(L,T,V), L!=I, J!=I, J!=L.

jointTable(I,J,T):- kd(J,T,V), kd(I,T,W), J!=I.
jointTable(I,J,L,T):- kd(J,T,V), kd(I,T,W), kd(L,T,Z), L!=I, J!=I, J!=L.



out(I,J,M) :- not jointClosure(I,J,V), kd(M,T2,V), jointTable(I,J,T), T!=T2.
jointClosure(I,J,V) :- jointKey(I,J,V).
jointClosure(I,J,V) :- not out(I,J,M), vrow(R,T2,N,V), kd(M,T2,K), jointTable(I,J,T), T!=T2.

existClosure(I,J):- jointKey(I,J,V).
jointClosure(I,J,V) :- not existClosure(I,J), jointTable(I,J,T), value(V), V=qed.


keyCount(N) :- N = #count{I,J,V: jointClosure(I,J,V)}.
#minimize{N: keyCount(N)}.

:- jointClosure(I,J,qed), jointClosure(I,J,V), V!=qed.



out(I,J,L,M) :- kd(M,T2,V), T!=T2, not jointClosure(I,J,L,V), jointTable(I,J,L,T).
jointClosure(I,J,L,V) :- jointKey(I,J,L,V).
jointClosure(I,J,L,V) :- not out(I,J,L,M), vrow(R,T2,N,V), kd(M,T2,K), jointTable(I,J,L,T), T!=T2.

existClosure(I,J,L):- jointKey(I,J,L,V).
jointClosure(I,J,L,V) :- not existClosure(I,J,L), jointTable(I,J,L,T), value(V), V=qed.


joitClosureCount(N) :- N = #count{I,J,L,V: jointClosure(I,J,L,V)}.
#minimize{N: joitClosureCount(N)}.

:- jointClosure(I,J,L,qed), jointClosure(I,J,L,V), V!=qed.


outJointClosure(I,J):- key(J,T), kd(I,T,V), not jointClosure(I,J,V), V!=qed, I!=J.
keyInJointClosure(I,J):- I!=J, key(J,T), kd(I,T,V), not outJointClosure(I,J).


outJointClosure(I,J,L,V):- key(I,T), key(J,T), key(L,T), value(V), not jointClosure(I,J,L,V), L!=I, J!=I, J!=L.
subsetInJointClosure(J,K,L):- jointClosure(J,K,V), kd(L,T,W), not outJointClosure(J,K,L,V).
subsetInJointClosure(J,K,L):- jointClosure(J,L,V), kd(K,T,W),not outJointClosure(J,K,L,V).
subsetInJointClosure(J,K,L):- jointClosure(K,L,V), kd(J,T,W),not outJointClosure(J,K,L,V).


unsatisfied:- kd(I,T,V), keyInJointClosure(J,I), keyInJointClosure(K,I), kd(L,T,W), not subsetInJointClosure(J,K,L), J!=K, K!=L, J!=L.

satisfied:- not unsatisfied.