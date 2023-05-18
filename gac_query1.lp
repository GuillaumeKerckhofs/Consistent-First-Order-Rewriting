
differentX(X,Y,Z,W):- p(X,Y2,Z2,W2), p(X,Y,Z,W),  W!=W2.
differentX(X,Y,Z,W):- p(X2,Y,Z2,W2), p(X,Y,Z,W), W!=W2.
differentX(X,Y,Z,W):- p(X2,Y2,Z,W2), p(X,Y,Z,W), W!=W2.

:- differentX(X,Y,Z,W).