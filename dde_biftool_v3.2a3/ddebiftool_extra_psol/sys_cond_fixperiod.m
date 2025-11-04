function [r,J]=sys_cond_fixperiod(point,ind_period)
%% fix period to given parameter (visible to user fcns)
% implemented as user condition
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%% 
r=point.parameter(ind_period)-point.period;
J=p_axpy(0,point,[]);
J.parameter(ind_period)=1;
J.period=-1;
end
