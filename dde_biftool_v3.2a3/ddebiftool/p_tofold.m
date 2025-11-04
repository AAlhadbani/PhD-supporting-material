function fold=p_tofold(point,varargin)
%% convert stst point to fold point
% function fold_point=p_tofold(point,...)
% INPUT:
%	point point near fold point
%   optional 'funcs': problem functions
% OUTPUT:
%	fold_point starting guess for fold point derived from point

%
%
% (c) DDE-Biftool v3.2a3 2019-10-21 (471d1c3935e4c416fb14a2f4a12d2ece6b336363)

%%
%% for backward compatibility re-organize arguments
args=varargin;
if ~isfield(point,'x')
    funcs=point;
    point=args{1};
    args=[args(2:end),{'funcs',funcs}];
end
fold=dde_fold_from_stst(point,args{:});
end
