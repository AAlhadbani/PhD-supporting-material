function [y,J]=dde_stst_dot(point1,point2,varargin)
%% scalar product for stst points and its bifurcations
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
default={'free_par_ind',1:length(point1.parameter)};
options=dde_set_options(default,varargin);
x1=dde_x_from_point(point1,options.free_par_ind);
x2=dde_x_from_point(point2,options.free_par_ind);
y=x1'*x2;
template=p_axpy(0,point2);
J=dde_point_from_x(x2,template,options.free_par_ind);
end

