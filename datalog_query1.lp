satisfied:- p(X,Y,Z,W), not existDifferentX(X,Y,Z,W), not existDifferentY(X,Y,Z,W), not existDifferentZ(X,Y,Z,W).

existDifferentX(X,Y,Z,W):- p(X,Y,Z,W), p(X,Y2,Z2,W2), W!=W2.

existDifferentY(X,Y,Z,W):- p(X,Y,Z,W), p(X2,Y,Z2,W2), W!=W2.

existDifferentZ(X,Y,Z,W):- p(X,Y,Z,W), p(X2,Y2,Z,W2), W!=W2.


notSatisfied:- not satisfied.