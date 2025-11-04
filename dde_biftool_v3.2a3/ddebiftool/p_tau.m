function tau_eva=p_tau(funcs,point,d_nr,t)
%% evaluate (state-dependent) delays along orbit
% function [tau_eva]=p_tau(point,d_nr,t)
% INPUT:
%       point a point
%       d_nr number(s) of delay(s) to evaluate
%       t (optional) point(s) where to evaluate
% OUTPUT:
%       tau_eva value(s) of evaluated delay(s)
%
%
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

if nargin<4
    t_args={};
else
    t_args={'t',t};
end
tau_eva=dde_apply({'dde_',point.kind,'_delays'},funcs,point,'d_nr',d_nr,t_args{:});
end
