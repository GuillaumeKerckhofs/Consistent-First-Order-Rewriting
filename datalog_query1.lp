satisfied:- p(X,Y,Z,W), not existDifferentX(X,W), not existDifferentY(Y,W), not existDifferentZ(Z,W).

existDifferentX(X,W):- p(X,Y,Z,W2), W!=W2.

existDifferentY(Y,W):- p(X,Y,Z,W2), W!=W2.

existDifferentZ(Z,W):- p(X,Y,Z,W2), W!=W2.


notSatisfied:- not satisfied.