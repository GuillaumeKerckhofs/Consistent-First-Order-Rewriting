
differentW(X,Y,Z,W):- p(X,Y,Z,W), p(X,Y2,Z2,W2), W!=W2, p(X2,Y,Z2,W3), W!=W3,  p(X2,Y2,Z,W4), W!=W4.

:- differentW(X,Y,Z,W).