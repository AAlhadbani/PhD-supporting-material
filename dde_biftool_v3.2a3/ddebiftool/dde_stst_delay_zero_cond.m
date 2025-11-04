function [r,Jp]=dde_stst_delay_zero_cond(funcs,point,free_par_ind,d_nr,varargin)
%% residual & derivative wrt x, T and parameter for tau_d_nr=0 for equilibria
% formulated in sys_cond format
%
% inputs
% funcs: system functions
% point: point (type psol,stst,hopf,fold) for which delay=0 is to be
% determined
% tz: 
% d_nr: delay number
% free_par_ind: indices of free parameters
%
% outputs
% r residual: tau for stst,hopf,fold (1d), tau(tz) and tau'(tz) for psol
% J Jacobian (struct of type point): single row for stst,hopf,fold, two
% rows for psol
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
ntau=funcs.sys_ntau();
xx=point.x(:,ones(ntau+1,1));
r=funcs.sys_tau(d_nr,xx,point.parameter);
Jp=p_axpy(0,point,[]);
for j=0:ntau
    Jp.x=Jp.x+funcs.sys_dtau(d_nr,xx,point.parameter,j,[])';
end
for k=1:length(free_par_ind)
    Jp.parameter(free_par_ind(k))=funcs.sys_dtau(d_nr,xx,point.parameter,[],free_par_ind(k));
end
end
