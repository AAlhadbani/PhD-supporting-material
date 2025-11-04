function hopf=dde_hopf_from_BT(point,varargin)
%% convert Bogdanov-Takens point to (singular!) Hopf
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
hopf=dde_hopf_create('point',point,'omega',0,'v',point.nvec.q0);
if isfield(point,'stability')
    hopf.stability=point.stability;
end
end