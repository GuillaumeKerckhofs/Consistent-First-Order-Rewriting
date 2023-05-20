
differentW(X,Y,Z,W):- p(X,Y,Z,W), p(X,Y2,Z2,W2), W!=W2, p(X3,Y,Z3,W3), W!=W3,  p(X4,Y4,Z,W4), W!=W4.

:- differentW(X,Y,Z,W).