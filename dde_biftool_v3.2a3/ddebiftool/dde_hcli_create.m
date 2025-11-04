function [pt,varfields,kind]=dde_hcli_create(varargin)
%% create hcli point
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
default={'kind','hcli','parameter',[],'mesh',[],'degree',[],'profile',[],'period',[],...
    'x1',[],'x2',[],'lambda_v',[],'lambda_w',[],'v',[],'w',[],'alpha',[],'epsilon',[]};
pt=dde_set_options(default,varargin,'pass_on','point');
pt.kind='hcli';
if ~isempty(pt.profile)
    pt=dde_coll_check(pt);
end
% extra line to normalize alpha's
if norm(pt.alpha)~=0
    pt.alpha=pt.alpha/norm(pt.alpha);
end
varfields=struct('profile',1,'period',1,'parameter',1,...
    'x1',1,'x2',1,'v',1,'lambda_v',1,'w',1,'lambda_w',1,'alpha',1);
kind='coll';
end