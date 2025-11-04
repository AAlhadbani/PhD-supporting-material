function data=dde_psol2PD(funcs,info,varargin)
%% constructor for period doubling bifurcation from psol
% wrapper for dde_psol2torus
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

data=dde_psol2torus(funcs,info,varargin{:},'biftype','PD','closest',-1);
end
