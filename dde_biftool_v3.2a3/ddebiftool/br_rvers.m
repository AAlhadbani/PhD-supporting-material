function branch=br_rvers(branch)

% function t_branch=br_rvers(branch)
% INPUT:
%       branch 
% OUTPUT:
%       t_branch branch with points in reversed order

% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)


branch.point=branch.point(length(branch.point):-1:1);

return;

