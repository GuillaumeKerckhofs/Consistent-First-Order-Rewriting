#show keyClosure/2.
#show keyAttack/2.

key(I,T):- kd(I,T,V).

intersection(R,K,L,V):- kd(K,R,V), kd(L,R,V).

out(I,V) :- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2,  not keyClosure(I,W).

keyClosure(I,V):- kd(I,T,V).
keyClosure(I,V):- kd(J,T), vrow(K,T,N,V), key(I,T2), T!=T2.
keyClosure(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2, not out(I,W).


outAttack(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2,  not keyAttack(I,W), not keyClosureWithI(I,W).
keyClosureWithI(I,V):- kd(I,T,V).
keyClosureWithI(I,V):- vrow(J,T,N,V), key(I,T).
keyClosureWithI(I,V):- kd(J,T), vrow(K,T,N,V), key(I,T2).
keyClosureWithI(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), not kd(I,T2,V), not outAttack(I,W).

keyAttack(I,V):- keyClosureWithI(I,V), not keyClosure(I,V).

keyCount(N) :- N = #count{I,V:keyClosure(I,V)}.

#minimize{N: keyCount(N)}.
