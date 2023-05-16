#show satisfied/0.
#show unsatisfied/0.

key(I,T):- kd(I,T,V).

out(I,J):- kd(J,T2,V), key(I,T), T!=T2, not keyClosure(I,V).

keyClosure(I,V):- kd(I,T,V).
keyClosure(I,V):- vrow(K,T2,N,V), key(I,T), T!=T2, kd(J,T2,W), not out(I,J).

keyCount(N) :- N = #count{I,V:keyClosure(I,V)}.

#minimize{N: keyCount(N)}.



outWithI(I,J):- kd(J,T2,V), key(I,T), T!=T2, not keyClosureWithI(I,V).

keyClosureWithI(I,V):- kd(I,T,W), vrow(J,T,N,V).
keyClosureWithI(I,V):- vrow(K,T2,N,V), key(I,T), kd(J,T,W), not out(I,J).

keyWithICount(N) :- N = #count{I,V:keyClosureWithI(I,V)}.

#minimize{N: keyWithICount(N)}.



outAttack(I,V):- keyClosure(I,V).
keyAttack(I,V):- keyClosureWithI(I,V), not outAttack(I,V).


keyAttackKey(I,J):- keyAttack(I,V), kd(J,T,V), kd(I,T2,W), T!=T2, I!=J.


path(I,J):- keyAttackKey(I,K), keyAttackKey(K,J).
path(I,J):- keyAttackKey(I,K), path(K,J).

unsatisfied:- keyAttackKey(I,J), keyAttackKey(K,I), path(I,I).

satisfied:- not unsatisfied.