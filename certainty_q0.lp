#show satisfied/0.
#show unsatisfied/0.

unsatisfied:- not satisfied.
satisfied:- p(X,Y,Z), not rightPart(X).

existS(Y):- s(Y,U).
existR(Z):- r(Z,W,C).
differentC(Z):- r(Z,W,C), C!=c.

rightPart(X):- p(X,Y,Z), not existS(Y).
rightPart(X):- p(X,Y,Z), not existR(Z).
rightPart(X):- p(X,Y,Z), differentC(Z).

