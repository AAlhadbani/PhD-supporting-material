function [pt,varfields,kind]=dde_psol_create(varargin)
%% create psol point with empty stability information
%
% (c) DDE-Biftool v3.2a3 2019-11-07 (6c01976909a0797dc51692b8065c4fcb163632e2)

%%
default={'kind','psol','parameter',[],'mesh',[],'degree',[],'profile',[],...
    'period',[],'stability',[],'nmfm',[],'nvec',[],'flag',''};
[pt,dum,userdefined]=dde_set_options(default,varargin,'pass_on','point'); %#ok<ASGLU>
pt.kind='psol';
if ~isempty(pt.profile)
    pt=dde_coll_check(pt);
end
pt=dde_point_overwritefields(pt,userdefined,...
    'stability',[],'nmfm',[],'nvec',[],'flag','');
varfields=struct('profile',1,'period',1,'parameter',1);
kind='coll';
end