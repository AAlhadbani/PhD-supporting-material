%% SetupMWPeriodDoubling - Initialize continuation of period doubling bifurcations of relative periodic orbits
%%
function [pdfuncs,pdbranch,suc]=SetupMWPeriodDoubling(funcs,branch,ind,varargin)
%%
% simple wrapper to have a sensible name and set number of trivial Floquet
% multipliers to two (see demo rotsym_demo how to do this).
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
[pdfuncs,pdbranch,suc]=SetupMWTorusBifurcation(funcs,branch,ind,'biftype','PD',varargin{:});
end
