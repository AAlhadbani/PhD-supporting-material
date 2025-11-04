function fold=dde_fold_from_BT(point,varargin)
%% convert Bogdanov-Takens point to fold
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
fold=dde_fold_create('point',point,'v',point.nvec.q0);
if isfield(point,'stability')
    fold.stability=point.stability;
end
end