function p=p_normlz(p)
%% Normalize selected fields of point (during |br_contn|)
% function normalized_p=p_normlz(p)
% INPUT:
%	p point to be normalized
% OUTPUT:
%	normalized_p normalized point
%
%
%%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

p=dde_apply({'dde_',p.kind,'_normlz'},p);
end
