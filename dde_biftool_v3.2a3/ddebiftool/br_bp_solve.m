function [bp,suc,blin]=br_bp_solve(funcs,branch,ind,varargin)
%% determine branch point using extended system accurately using Newton iteration
%
% Input
%
% * funcs: r.h.s. functions
% * branch: branch along which BP is to be found
% * ind: index of point near suspected branch point (initial guess)
% * free_par: indices of free parameters
% * optional: 'hdev' (1e-4) deviation for finite  differencing of second
% derivatives
%
% Output
%
% * bp: approximate branch point
% * suc: success flag
%
% (c) DDE-Biftool v3.2a3 2022-04-03 (96b8a79b8ac991158aa53377fe9ad6715b710f59)

%%
default={'hdev',1e-4,'free_par',branch.parameter.free};
[options,pass_on]=dde_set_options(default,varargin,'pass_on','method');
branch=replace_branch_pars(branch,options.free_par,varargin);
free_par=options.free_par;
mth=branch.method.point;
p0=branch.point(ind);
f=@(x)p_correc_rhs(funcs,mth,p0,free_par,'x',x,'pref',p0,pass_on{:});
u0=dde_x_from_point(p0,free_par);
[ubp,suc,v0,w0,ulin]=dde_bp_solve(f,u0,@(F,X)dde_nsolve(F,X,mth),options.hdev,pass_on{:});
bp=dde_point_from_x(ubp,p0,free_par);
p_ulin=dde_point_from_x(ulin,p0,free_par);
p_v0=dde_point_from_x(v0,p0,free_par);
blin=struct('v0',p_v0,'ulin',p_ulin,'w0',w0);
end
