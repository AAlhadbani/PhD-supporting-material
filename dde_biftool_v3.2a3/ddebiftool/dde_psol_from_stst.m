function [psol,tangent]=dde_psol_from_stst(point,varargin)
%% Create small amplitude harmonic oscillation around stst point after conversion to Hopf
%
% Output is initial periodic orbit and approximate tangent
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
hopf=dde_hopf_from_stst(point,varargin{:});
[psol,tangent]=dde_psol_from_hopf(hopf,varargin{:});
end
