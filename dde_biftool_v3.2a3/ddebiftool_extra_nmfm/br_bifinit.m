function initbranch = br_bifinit(branch)
%% Add flag, nmfm and nvec on all points of Hopf branch.
% function initbranch = br_bifinit(branch)
% Purpose:
%   Adds flag, nmfm and nvec (hopf only) on all points of the branch.
% INPUT:
%	branch 
% OUTPUT:
%	initbranch
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
initbranch = branch;
ll=length(branch.point);
kind = branch.point(1).kind;

if ll<1
   error('BR_FLAG: branch is empty!');
end

for i=1:ll
   if ~isfield(initbranch.point(i),'flag') || isempty(initbranch.point(i).flag)
      initbranch.point(i).flag = '';
   end
   if ~isfield(initbranch.point(i),'nmfm')
      initbranch.point(i).nmfm = struct();
   end
   if strcmp(kind,'hopf') && ~isfield(initbranch.point(i),'nvec')
      initbranch.point(i).nvec = struct();
   end
end
end
