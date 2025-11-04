function [newbranch,suc]=ChangeBranchParameters(funcs,branch,ind,varargin)
%% Change parameters for continuation along branch and create first two points
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
default={'contpar',[],'dir',[],'step',0.01,'correc',true};
[options,pass_on]=dde_set_options(default,varargin,'pass_on');
newbranch=replace_branch_pars(branch,options.contpar,pass_on);
pini=branch.point(ind);
suc=true;
if isempty(options.dir) && ~isempty(newbranch.parameter.free)
    options.dir=newbranch.parameter.free(1);
end
if options.correc
    [newbranch,suc]=correct_ini(funcs,newbranch,pini,...
        options.dir,options.step,options.correc);
end
end
