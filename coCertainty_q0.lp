inP(X,Y,Z):- p(X,Y,Z), not outP(X,Y,Z).
outP(X,Y,Z):-p(X,Y,Z), not inP(X,Y,Z).

inS(Y,U):- s(Y,U), not outS(Y,U).
outS(Y,U):-s(Y,U), not inS(Y,U).

inR(Z,W,V):- r(Z,W,V), not outR(Z,W,V).
outR(Z,W,V):- r(Z,W,V), not inR(Z,W,V).

cannotAddP(X,Y,Z):- outP(X,Y,Z), inP(X,S,T).
cannotAddS(Y,U):- outS(Y,U), inS(Y,S).
cannotAddR(Z,W,V):- outR(Z,W,V), inR(Z,S,T).

:- outP(X,Y,Z), not cannotAddP(X,Y,Z).
:- outS(Y,U), not cannotAddS(Y,U).
:- outR(Z,W,V), not cannotAddR(Z,W,V).

:- inP(X,Y,Z), inR(Y,Y), inR(Z,W,c).
