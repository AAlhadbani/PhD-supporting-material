function fold=dde_fold_from_zeho(zeho,varargin)
%% wrapper to extract fold point from zeho
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if isempty(zeho.nvec)
    fold=dde_fold_from_stst(zeho,varargin{:});
else
    fold=dde_fold_create('point',zeho,'v',zeho.nvec.q0,varargin{:});
end
end

