function [imatscal,gc]=nmfm_matscale(imat)
%% scale each column of imat by its gcd
% used to reduce computational effort when computing higher-order
% derivatives via polarization identity
%
% for example
% >> imat=[2,3,4;1,3,2]
% imat =
%      2     3     4
%      1     3     2
% >> [imatscal,gc]=nmfm_matscale(imat)
% imatscal =
%      2     1     2
%      1     1     1
% gc =
%      1     3     2
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
for i=size(imat,2):-1:1
    [imatscal(:,i),gc(i)]=nmfm_gcd_loc(imat(:,i));
end
end
function [ivscal,gc]=nmfm_gcd_loc(ivec)
gc=ivec(1);
for i=2:length(ivec)
    gc=gcd(gc,ivec(i));
end
ivscal=ivec/gc;
end
