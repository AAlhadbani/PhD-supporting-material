function branch=df_brnch(funcs,free_par,kind,varargin)
%% set up empty branch with default values
% function branch=df_brnch(funcs,free_par,kind,flag_newhheur)
% INPUT:
%       funcs problem functions
%       free_par free parameter list
%       kind type of solution point
%       flag_newhheur (optional, default: 2) use new Chebyshev approximation
%                     Only used if kind==stst, cf. df_mthod
% OUTPUT:
%	branch empty branch with default values

% Update on 05/03/2007 ("flag_newhheur" <=> (imag(method.stability.lms_parameter_rho)~=0) )
%
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
sys_tau=funcs.sys_tau;


branch.method=df_mthod(kind,varargin{:});

branch.parameter.free=free_par;
branch.parameter.min_bound=[];
branch.parameter.max_bound=[];
branch.parameter.max_step=[];

tp_del=funcs.tp_del;
if tp_del==0
  tau=sys_tau();
  for j=1:length(tau)
    branch.parameter.min_bound(j,:)=[tau(j) 0];
  end;
end;

branch.point=[];
end