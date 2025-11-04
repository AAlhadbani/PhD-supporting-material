function fold = nmfm_fold(funcs, fold, varargin)
%% Fold normal form coefficients
%
% This function assumes that the input is of kind fold.
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%% eigenvectors
default={'nullpoint',[]};
[options,pass_on]=dde_set_options(default,varargin,'pass_on');
[p,q,sg]=nmfm_nullvector(funcs,fold,0,'nullpoint',options.nullpoint,pass_on{:});
if sg
    fold.nmfm.b=NaN;
    fold.nvec.q = NaN(size(q));
    fold.nvec.p = NaN(size(p));
    return
else
    fold.nvec.q = q;
    fold.nvec.p = p ;
end
%% abbreviate derivative
F=nmfm_deriv_define(funcs,fold,'free_pars',[],varargin{:});
%% eigenfunctions
par0=fold.parameter(:)*0;
phi = nmfm_dev_fun([q;par0]);
%% critical normal forms coefficients
b=1/2*p*F.B(phi,phi);
fold.nmfm.b=b;
end