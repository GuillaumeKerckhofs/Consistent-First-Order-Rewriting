#show keyClosure/2.

key(I,T):- kd(I,T,V).

intersection(R,K,L,V):- kd(K,R,V), kd(L,R,V).

out(I,V) :- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2,  not keyClosure(I,W).

keyClosure(I,V):- kd(I,T,V).
keyClosure(I,V):- kd(J,T), vrow(K,T,N,V), key(I,T2), T!=T2.
keyClosure(I,V):- kd(J,T,W), vrow(K,T,N,V), key(I,T2), T!=T2, not out(I,W).

#minimize{1, I, V : keyClosure(I,V)}.
