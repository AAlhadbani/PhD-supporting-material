function stability=p_stabil(funcs,p,method,varargin)
%% compute stability information for point
% function stability=p_stabil(funcs,point,method)
% INPUT:
%   funcs problem functions
%	point solution point
%	method method parameters 
% OUTPUT:
%	stability stability information

% Update on 05/03/2007 ("flag_newhheur"  <=> (imag(method.lms_parameter_rho)~=0) )   
%
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
stability=dde_apply({'dde_',p.kind,'_eig'},funcs,p,method,varargin{:});
end