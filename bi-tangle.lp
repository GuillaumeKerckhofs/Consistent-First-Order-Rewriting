#show jointClosure/4.
#show jointKey/4.

table(T):- vrow(I,T,N,V).

jointVariable(T,J,V):- vrow(I,T,N,V), kd(J,T,K), not kd(J,T,V), vrow(I2,T2,N2,V), T!=T2.

jointKey(I,J,T,V):- kd(J,T,V), kd(I,T,V), J!=I.

out(I,J,T,V) :- vrow(I,T2,N,V), kd(J,T2,K), T!=T2, not jointClosure(I,J,T,K), table(T).
jointClosure(I,J,T,V) :- jointKey(I,J,T,V), jointVariable(I,J,W).
jointClosure(I,J,T,V) :- not out(I,J,T,K), vrow(I,T2,N,V), kd(J,T2,K), T!=T2, table(T).


keyCount(N) :- N = #count{I,J,T,V: jointClosure(I,J,T,V)}.

#minimize{N: keyCount(N)}.

jointKeyCount(N) :- N = #count{I,J,T,V: jointKey(I,J,T,V)}.

#minimize{N: jointKeyCount(N)}.


unsatisfied:- not satisfied.

satisfied:- not unsatisfied.