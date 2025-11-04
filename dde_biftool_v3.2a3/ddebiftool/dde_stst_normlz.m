function stst=dde_stst_normlz(stst)
%% normalize steady-state bifurcation points
% (descended from |'stst'| kind)
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if isfield(stst,'v')
    stst.v=stst.v/norm(stst.v);
end
end
