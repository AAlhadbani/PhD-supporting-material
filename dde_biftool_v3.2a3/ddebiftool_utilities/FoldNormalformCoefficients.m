%% Normal form coefficient a in fold point along fold branch 
% (wrapper for NormalformCoefficients)
%% Input
%
% * funcs: problem functions
% * branch: fold branch or array of points of kind 'fold'
% * optional name-value pair: 
% * 'sys_mfderi': update sys_mfderi field of funcs (useful for
% finite-difference approximation only)
%
%% Output
%
% * a: array of normal form coefficients along branch
% * a_low: equals b if funcs.sys_mfderi is provided, otherwise (for
% finite-difference approximation) a low-er-order estimate of b
% coefficients. Use L1-L1low to estimate the accuracy of b. If this is
% large, finite-differences are problematic. If this is small it may(!) be
% ok.
%%
function [a,a_low,branch]=FoldNormalformCoefficients(funcs,branch,varargin)
%%
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
[a,a_low,branch]=NormalformCoefficients(funcs,branch,varargin{:});
end
