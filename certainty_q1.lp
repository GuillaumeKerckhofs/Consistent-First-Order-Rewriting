#show satisfied/0.
#show unsatisfied/0.

satisfied:- p(X,Y,Z,c), not rightPart(X,Y,Z).
unsatisfied:- not satisfied.

rightPart(X,Y',Z'):- P(X,Y,Z,W), W!=c.
rightPart(X',Y,Z'):- P(X,Y,Z,W), W!=c.
rightPart(X',Y',Z):- P(X,Y,Z,W), W!=c.