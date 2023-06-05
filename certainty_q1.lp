#show satisfied/0.
#show unsatisfied/0.

satisfied:- p(X,Y,Z,c), not rightPart(X,Y,Z).
unsatisfied:- not satisfied.

rightPart(X,Y,Z):- p(X,Y,Z,c), p(X,S,T,W), W!=c.
rightPart(X,Y,Z):- p(X,Y,Z,c), p(S,Y,T,W), W!=c.
rightPart(X,Y,Z):- p(X,Y,Z,c), p(S,T,Z,W), W!=c.