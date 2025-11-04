%% SetupRWHopf - Initialize continuation of Hopf bifurcations of relative equilibria
%%
function [hbranch,suc]=SetupRWHopf(funcs,branch,ind,varargin)
%% 
% simple wrapper to have a sensible name (see demo rotsym_demo how to use this function).
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
[hbranch,suc]=SetupHopf(funcs,branch,ind,varargin{:});
end
