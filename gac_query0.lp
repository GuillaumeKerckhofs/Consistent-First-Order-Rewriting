{p_repair(X,Y,Z): p(X,Y,Z)}==1:- p(X,Y,Z).
{s_repair(Y,U): s(Y,U)}==1:- s(Y,U).
{r_repair(Z,W,C): r(Z,W,C)}==1:- r(Z,W,C).

:- r_repair(Z,W,C),p_repair(X,Y,Z), s_repair(Y,U).