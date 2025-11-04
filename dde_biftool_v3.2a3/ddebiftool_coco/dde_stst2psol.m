function data=dde_stst2psol(funcs,info,varargin)
%% constructor of periodic orbit from Hopf bifurcation
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
hopf=info.point(1);
if ~strcmp(hopf.kind,'hopf')
    if ~isfield(hopf,'stability') || isempty(hopf.stability)
        hopf.stability=p_stabil(funcs,hopf,info.method.stability);
    end
    hopf=p_tohopf(funcs,hopf);
end
[deg_psol,step_cond]=p_topsol(funcs,hopf,varargin{:});
info.method=df_mthod('psol');
info.method=replace_method_pars(info.method,varargin{:});
data.info=info;
data.info.point=deg_psol;
data.info.tangent=p_axpy(-1,step_cond,[]);
data.funcs=funcs;
end