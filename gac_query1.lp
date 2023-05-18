{p_repair(X,Y,Z,W): p(X,Y,Z,W)}==1:- p(X,Y,Z,W).


differentX(X,,Y,Z,W):- p(X,Y2,Z2,W2), W!=W2.
differentX(X,,Y,Z,W):- p(X2,Y,Z2,W2), W!=W2.
differentX(X,,Y,Z,W):- p(X2,Y2,Z,W2), W!=W2.

:- p_repair(X,Y,Z), differentX(X,Y,Z,W).