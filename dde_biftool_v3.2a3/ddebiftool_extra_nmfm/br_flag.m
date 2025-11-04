function flaggedbranch = br_flag(branch)
%% set empty flag on all points of branch
% function flaggedbranch = br_flag(branch)
% Purpose:
%   Sets flag = '' on all points of the branch.
% INPUT:
%	branch 
% OUTPUT:
%	flaggedbranch
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%

flaggedbranch = branch;
ll=length(branch.point);

if ll<1
   error('BR_FLAG: branch is empty!');
end

for i=1:ll
   if ~isfield(flaggedbranch.point(i),'flag') || isempty(flaggedbranch.point(i).flag)
      flaggedbranch.point(i).flag = '';
   end
   if ~isfield(flaggedbranch.point(i),'nmfm')
      flaggedbranch.point(i).nmfm = struct();
   end
   if ~isfield(flaggedbranch.point(i),'nvec')
      flaggedbranch.point(i).nvec = struct();
   end
end
end
