inP(X,Y,Z,W):- p(X,Y,Z,W), not outP(X,Y,Z,W).
outP(X,Y,Z,W):- p(X,Y,Z,W), not inP(X,Y,Z,W).

cannotAddP(X,Y,Z,W):- outP(X,Y,Z,W), inP(X,S,T,U).
cannotAddP(X,Y,Z,W):- outP(X,Y,Z,W), inP(S,Y,T,U).
cannotAddP(X,Y,Z,W):- outP(X,Y,Z,W), inP(S,T,Z,U).

:- outP(X,Y,Z,W), not cannotAddP(X,Y,Z,W).

equal(X,Y,Z,W,X,Y,Z,W):- p(X,Y,Z,W).

:- inP(X,Y,Z,W), inP(X,S,T,U), not equal(X,Y,Z,W,X,S,T,U).
:- inP(X,Y,Z,W), inP(S,Y,T,U), not equal(X,Y,Z,W,S,Y,T,U).
:- inP(X,Y,Z,W), inP(S,T,Z,U), not equal(X,Y,Z,W,S,T,Z,U).

:- inP(X,Y,Z,c).