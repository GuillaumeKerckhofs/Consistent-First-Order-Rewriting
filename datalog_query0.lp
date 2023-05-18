#show satisfied/0.
#show notSatisfied/0.

notSatisfied:- not satisfied.

satisfied:- p(X,Y,Z), not unsatisfied(X).

existS(Y):- s(Y,U).
existR(Z):- r(Z,W,C).
differentC(Z):- r(Z,W,C), C!=c.

unsatisfied(X):- p(X,Y,Z), not existS(Y).
unsatisfied(X):- p(X,Y,Z), not existR(Z).
unsatisfied(X):- p(X,Y,Z), differentC(Z).

