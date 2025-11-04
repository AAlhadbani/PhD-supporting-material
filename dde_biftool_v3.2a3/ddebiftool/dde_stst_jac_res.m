function [J,res]=dde_stst_jac_res(funcs,pt,free_par,varargin)
%% residual and jacobian for equilibrium problem
% function [J,res]=dde_stst_jac_res(funcs,pt,free_par,varargin)
% INPUT:
%   funcs problem functions
%	pt current fold solution guess
%	free_par free parameter numbers
% OUTPUT: 
%	J jacobian in R^(n+s x n+p)
%	res residual in R^(n+s x 1)

%
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
dfx=dde_stst_linearize_rhs(funcs,pt);
dfp=dde_stst_linearize_rhs(funcs,pt,'free_par',free_par);
ind=dde_ind_from_point(pt,free_par);
m=size(dfx,3);
xx=pt.x(:,ones(m,1));
res=funcs.sys_rhs(xx,pt.parameter);
J(:,ind.parameter)=dfp;
J(:,ind.x)=sum(dfx,3);
end
