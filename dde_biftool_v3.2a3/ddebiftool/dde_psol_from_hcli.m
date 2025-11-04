function [psol,tangent]=dde_psol_from_hcli(point,varargin)
%% convert connecting orbit to psol, assuming long period
% tangent assumes change only in period
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
psol=dde_psol_create('point',point,varargin{:});
tangent=dde_psol_create('point',psol,'profile',0*psol.profile,'period',1);
end
