% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function data=dde_psol2mwPD(funcs,info,varargin)
data=dde_psol2PD(funcs,info,'nremove',[1,1],varargin{:});
end