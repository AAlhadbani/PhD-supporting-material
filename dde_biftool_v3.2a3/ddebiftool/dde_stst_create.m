function [pt,varfields,kind]=dde_stst_create(varargin)
%% create stst point with empty stability and normal form information
%
% (c) DDE-Biftool v3.2a3 2019-11-07 (6c01976909a0797dc51692b8065c4fcb163632e2)

%%
default={'kind','stst','parameter',[],'x',[],...
    'stability',[],'nmfm',[],'nvec',[],'flag',''};
[pt,dum,userdefined]=dde_set_options(default,varargin,'pass_on','point'); %#ok<ASGLU>
pt.kind='stst';
pt=dde_point_overwritefields(pt,userdefined,...
    'stability',[],'nmfm',[],'nvec',[],'flag','');
varfields=struct('x',1,'parameter',1);
kind='';
end