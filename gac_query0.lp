{p_repair(X,Y,Z): p(X,Y,Z)}==1:- p(X,Y,Z).
{s_repair(Y,U): s(Y,U)}==1:- s(Y,U).
{r_repair(Z,W,C): r(Z,W,C)}==1:- r(Z,W,C).

sInRepair(Y):- s(Y,U).
rInRepair(Z):- r(Z,W,C).


:- p_repair(X,Y,Z), not sInRepair(Y).
:- p_repair(X,Y,Z), not rInRepair(Z).
:- r(Z,W,C), C!=c.