function pt=dde_stabilitykind(pt,data,args)
%% determine and reduce point type, determine stability
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if ~isstruct(pt)
    pt=dde_point_from_x(pt,data.info.point,data.ipar);
end
kind=pt.kind;
funcs=data.funcs;
if isfield(funcs,'kind')
    kind=funcs.kind;
    pt=funcs.get_comp(pt,'solution_for_stability');
    funcs=funcs.userfuncs;
end
if iscell(args)
    pt.stability=p_stabil(funcs,pt,data.info.method.stability,args{:});
end
pt.kind=kind;
end
