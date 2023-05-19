#show satisfied/0.
#show unsatisfied/0.

satisfied:- not unsatisfied.
unsatisfied:- p(X,Y,Z,W), existDifferentX(X,Y,Z,W).
unsatisfied:- p(X,Y,Z,W), existDifferentY(X,Y,Z,W).
unsatisfied:- p(X,Y,Z,W), existDifferentZ(X,Y,Z,W).

existDifferentX(X,Y,Z,W):- p(X,Y,Z,W), p(X,Y2,Z2,W2), W!=W2.

existDifferentY(X,Y,Z,W):- p(X,Y,Z,W), p(X2,Y,Z2,W2), W!=W2.

existDifferentZ(X,Y,Z,W):- p(X,Y,Z,W), p(X2,Y2,Z,W2), W!=W2.