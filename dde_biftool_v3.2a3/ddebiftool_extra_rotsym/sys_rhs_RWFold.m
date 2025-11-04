function y=sys_rhs_RWFold(x,p,ind_omega,ind_rho,orig_rhs,dim,orig_dirderi)
%% rhs of extended DDE for fold of relative equilibria
%
% x extended state (orig state and null vector)
% p user parameters
% rho rotation frequency
% orig_rhs user r.h.s
% dim original system dimension
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
x0=x(1:dim,:,:);
v=x(dim+1:end,:,:);
y0=orig_rhs(x0,p(1:ind_omega));
dp=0*p(1:ind_omega);
dp(ind_omega)=p(ind_rho);
%% add partial derivatives of all terms
y1=orig_dirderi(x0,p(1:ind_omega),v,dp);
y=[y0;y1];
end
