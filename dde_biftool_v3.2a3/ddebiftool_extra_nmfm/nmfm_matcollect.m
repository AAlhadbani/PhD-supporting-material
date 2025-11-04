function [mats,factors]=nmfm_matcollect(mats,factors)
%% collect equal polarization combinations
%
% [mats,factors]=nmfm_matcollect(mats,factors)
%
% to reduce computational effort if polarization identity creates many
% (equal) terms. For example, if mats is 
% [ 1,1,1;
%   0,0,1] and factors is 
% [ 2,3,4] then the two [1;0] columns of mats can be combined such that 
% output will be mats=
% [ 1,1;
%   0,1] and factors [5,4].
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%% 
[mats,dum,ind]=unique(mats.','rows'); %#ok<ASGLU>
mats=mats';
factors=accumarray(ind,factors).';
end