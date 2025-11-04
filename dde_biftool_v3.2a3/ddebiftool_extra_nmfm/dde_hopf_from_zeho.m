function hopf=dde_hopf_from_zeho(zeho,varargin)
%% extract hopf point from zeho
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if isempty(zeho.nvec)
    hopf=dde_hopf_from_stst(zeho,varargin{:});
else
    hopf=dde_hopf_create('point',zeho,'v',zeho.nvec.q1,'omega',zeho.nvec.omega,varargin{:});
end
end

