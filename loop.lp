#show satisfied/0.
#show unsatisfied/0.
#show keyClosure/2.

key(I,T):- kd(I,T,V).

out(I,J) :- kd(J,T,V), key(I,T2), T!=T2,  not keyClosure(I,V).

keyClosure(I,V):- kd(I,T,V).
keyClosure(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2, not out(I,J).

keyCount(N) :- N = #count{I,J:out(I,J)}.
#maximize{N: keyCount(N)}.



outWithI(I,J):- kd(J,T,V), key(I,T2), T!=T2,  not keyClosureWithI(I,V).

keyClosureWithI(I,V):- kd(I,T,V).
keyClosureWithI(I,V):- vrow(J,T,N,V), key(I,T).
keyClosureWithI(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2, not outWithI(I,J).

keyWithICount(M) :- M = #count{I,V:keyClosureWithI(I,V)}.
#minimize{M: keyWithICount(M)}.


outAttack(I,V):- keyClosure(I,V).
keyAttack(I,V):- keyClosureWithI(I,V), not outAttack(I,V).

keyAttackKey(I,J):- keyAttack(I,V), kd(J,T,V), I!=J.



path(I,J):- keyAttackKey(I,K), keyAttackKey(K,J).
path(I,J):- keyAttackKey(I,K), path(K,J).

unsatisfied:- keyAttackKey(I,J), keyAttackKey(K,I), path(I,I).

satisfied:- not unsatisfied.