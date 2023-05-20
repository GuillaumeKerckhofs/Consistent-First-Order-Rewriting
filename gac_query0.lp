sInRepair(Y):- s(Y,U).
rInRepair(Z):- r(Z,W,C).

:- p(X,Y,Z), not sInRepair(Y).
:- p(X,Y,Z), not rInRepair(Z).
:- p(X,Y,Z), r(Z,W,C), C!=c.
