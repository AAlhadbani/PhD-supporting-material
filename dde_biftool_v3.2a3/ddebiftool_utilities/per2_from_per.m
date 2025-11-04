function [per2,suc]=per2_from_per(funcs,psolbranch,ind,varargin)
%% branch off at period doubling (branch psolbranch, point number ind)
%
% Wrapper for newer function DoublePsol
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
[per2,suc]=DoublePsol(funcs,psolbranch,ind,varargin);
end