function data = dde_point_update(~, data, cseg, varargin)
%% dde_point_update: set reference point
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
% update information about current solution 
u             = cseg.src_chart.x; % Current chart
data.info.point= dde_point_from_x(u,data.info.point,data.ipar);
end
