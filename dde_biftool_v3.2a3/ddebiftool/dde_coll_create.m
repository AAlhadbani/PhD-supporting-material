function [pt,varfields,kind]=dde_coll_create(varargin)
%% create psol point with empty stability information
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
default={'kind','coll','parameter',[],'mesh',[],'degree',[],'profile',[],...
    'period',[],'stability',[]};
pt=dde_set_options(default,varargin,'pass_on','point');
pt.kind='coll';
if ~isempty(pt.profile)
    pt=dde_coll_check(pt);
end
varfields=struct('profile',1,'period',1,'parameter',1);
kind='';
end