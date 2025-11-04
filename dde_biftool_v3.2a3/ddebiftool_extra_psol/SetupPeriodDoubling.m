%% SetupPeriodDoubling - Initialize continuation of period doubling bifurcation
%%
function [pdfuncs,pdbranch,suc]=SetupPeriodDoubling(funcs,branch,ind,varargin)
%% 
% Simple wrapper around SetupTorusBifurcation to have a sensible name and
% pass on bifurcation type to pdfuncs.
% See <SetupTorusBifurcation.html> for description of input and output.
%
% <html>
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

% </html>
[pdfuncs,pdbranch,suc]=SetupTorusBifurcation(funcs,branch,ind,'biftype','PD','closest',-1,varargin{:});
end
