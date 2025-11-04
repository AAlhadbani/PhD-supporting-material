function [data, y,J] = dde_rhs(~, data, u)
%% main r.h.s. for dde-biftool points
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
f=p_correc_setup(data.funcs,data.info.point,data.ipar,data.info.method.point,...
    'remesh_flag',false,'previous',data.info.point);
[y,J]=f(u);
end