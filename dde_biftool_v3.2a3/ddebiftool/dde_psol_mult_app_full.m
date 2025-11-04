%% construct eigenvalue problem for Floquet multipliers using full matrices
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
function [s,ef]=dde_psol_mult_app_full(Marg,varargin)
default={'geteigenfuncs',false,'method',[]};
options=dde_set_options(default,varargin,'pass_on','method');
ef=[];
if ~options.geteigenfuncs
    s=eig(Marg{:});
else
    [ef,s]=eig(Marg{:});
    s=diag(s);
end
end
