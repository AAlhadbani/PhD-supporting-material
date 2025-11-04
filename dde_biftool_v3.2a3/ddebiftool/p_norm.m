function n=p_norm(point,varargin)
%% norm of point for distance measuring
% function n=p_norm(point,...)
% INPUT:
%	point 
% OUTPUT:
%	n norm of point (equals sqrt(p_dot(point,point,...)))

%
% 
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
n=sqrt(p_dot(point,point,varargin{:}));
end
