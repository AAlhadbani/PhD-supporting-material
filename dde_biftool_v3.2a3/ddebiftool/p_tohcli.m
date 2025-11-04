function [hcli,stst]=p_tohcli(point,varargin)
%% convert point to connecting orbit
% INPUT:
%     point a periodic solution near a homoclinic solution
%           alternatively an initial point in a hcli structure,
%           where a good starting guess for the profile and steady
%           states are available
%     named (but mandatory) 'funcs': problem functions
% OUTPUT:
%     hcli a starting value to compute the exact homoclinic or
%     heteroclinic solution  
%
%
%
% (c) DDE-Biftool v3.2a3 2019-10-13 (3f7ff513e332315a00d5c90cf4e36a699d61239b)

%%
%% for backward compatibility re-organize arguments
args=varargin;
if ~isfield(point,'kind')
    funcs=point;
    point=args{1};
    args=[args(2:end),{'funcs',funcs}];
end
[hcli,stst]=dde_apply({'dde_hcli_from_',point.kind,''},point,args{:});
end
