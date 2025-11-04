function [stst2,stpcond]=dde_stst_from_stst(stst,varargin)
%% branch off at stst which is approximate branch point (not corrected)
%
% optional arguments: 
%
% * 'funcs': r.h.s. functions structure to compute char. matrix if needed
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
default={'radius',1e-3};
[options,pass_on]=dde_set_options(default,varargin,'pass_on');
stst_ext=dde_fold_from_stst(stst,pass_on{:});
stst2=stst;
stst2.x=stst2.x+options.radius*stst_ext.v;
stpcond=dde_stst_create('x',stst_ext.v,'parameter',stst.parameter*0);
end
