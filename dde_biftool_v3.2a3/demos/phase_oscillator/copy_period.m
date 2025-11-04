%% Use period as parameter (which can be fixed or released)
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
function [res,J]=copy_period(pt,indpar)
res=pt.period-pt.parameter(indpar);
J=p_axpy(0,pt,[]);
J.period=1;
J.parameter(indpar)=-1;
end