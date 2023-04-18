#show keyClosure/2.
#show keyAttack/2.
#show keyAttackKey/2.

key(I,T):- kd(I,T,V).

inKeyForT(T,V):- kd(I,T,V).

otherKey(I,T):- kd(J,T,V), kd(I,T,V), I!=J.
onlyKeyForT(T,V):- kd(I,T,V), not otherKey(I,T) .

out(I,V) :- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2,  not keyClosure(I,W).

keyClosure(I,V):- kd(I,T,V).
keyClosure(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2, not out(I,W), not inKeyForT(T,V).


outWithI(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2,  not keyClosureWithI(I,W).

keyClosureWithI(I,V):- kd(I,T,V).
keyClosureWithI(I,V):- vrow(J,T,N,V), key(I,T).
keyClosureWithI(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2, not outWithI(I,W), not onlyKeyForT(T,V).

outAttack(I,V):- keyClosure(I,V).
keyAttack(I,V):- keyClosureWithI(I,V), not outAttack(I,V).


keyAttackKey(I,J):- keyAttack(I,V), kd(J,T,V), I!=J.

keyCount(N) :- N = #count{I,V:keyClosure(I,V)}.

#minimize{N: keyCount(N)}.


keyWithICount(N) :- N = #count{I,V:keyClosureWithI(I,V)}.

#minimize{N: keyClosureWithI(N)}.

path(I,J):- keyAttackKey(I,J), keyAttackKey(J,I).
path(I,J):- keyAttackKey(I,J), keyAttackKey(J,K), path(K,I).

unsatisfied:- keyAttackKey(I,J), keyAttackKey(J,K), path(K,I).

satisfied: not unsatisfied.