function secant=p_secant(secant,norm_point)
%% compute normalized secant
% function n_secant=p_secant(secant,norm_point)
% INPUT: 
%	secant unnormalized secant
%	norm_point norm of a computed reference point
% OUTPUT:
%	n_secant normalized secant

%
%
% (c) DDE-Biftool v3.2a3 2019-11-07 (6c01976909a0797dc51692b8065c4fcb163632e2)

%%
secant=p_axpy(norm_point/p_norm(secant),secant,[]);
end