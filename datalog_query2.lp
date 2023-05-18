satsified:- p(X,Y,Z), not unsatisfied(X).

existS(Y):- s(Y,U).
existR(Z):- r(Y,W,C), C=c.

unsatisfied(X):- p(X,Y,Z), not existS(Y).
unsatisfied(X):- p(X,Y,Z), not existR(Z).
