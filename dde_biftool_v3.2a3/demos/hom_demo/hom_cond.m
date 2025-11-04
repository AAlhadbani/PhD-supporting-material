% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function [resi,condi]=hom_cond(point)

resi=point.parameter(7)-point.period;

condi=p_axpy(0,point,[]);
condi.period=-1;
condi.parameter(7)=1;
return;
