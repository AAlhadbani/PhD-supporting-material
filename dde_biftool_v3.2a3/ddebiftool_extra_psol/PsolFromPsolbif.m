function [funcs,branch,nremove]=PsolFromPsolbif(funcs,branch)
%% reduce branch of Torusbifurcations (period doublings) or POfolds to Psol
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
nremove=[];
if isfield(funcs,'kind')
    switch funcs.kind
        case 'POfold'
            nremove=1;
        case 'PD'
            nremove=-1;
        case 'torus'
            omega=funcs.get_comp(branch,'omega');
            nremove=exp(pi*omega)*[1,-1];
    end
    branch.point=funcs.get_comp(branch.point,'solution');
    branch.parameter.free=intersect(branch.parameter.free,1:funcs.ip.nuserpar);
    branch.method.point.postprocess='';
    branch.method.point.preprocess='';
    funcs=funcs.userfuncs;
end
end