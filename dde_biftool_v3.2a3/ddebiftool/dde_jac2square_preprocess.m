function data=dde_jac2square_preprocess(data)
%% assign reference point if necessary for Hopf bifurcation iteration
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if isempty(data.previous)
    data.previous=data.point;
end
J=p_correc_rhs(data.funcs,data.method,data.point,data.free_par,...
    'pref',data.previous,'output','J','step_cond',data.step_cnd);
v=dde_nullspace(J);
extra_cond=dde_point_from_x(v,data.point,data.free_par);
if ~isempty(data.step_cnd)
  data.step_cnd=[data.step_cnd(:);extra_cond(:)];
else
  data.step_cnd=extra_cond(:);
end
end
