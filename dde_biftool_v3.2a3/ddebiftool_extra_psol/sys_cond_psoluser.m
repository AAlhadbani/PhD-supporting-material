function [r,J]=sys_cond_psoluser(point,ind,get_comp,userfuncs,pref)
%% call user defined extra conditions and embed derivative into extended point
% for psol extensions only at the moment
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
userpoint=get_comp(point,'solution');
if isfield(userfuncs,'sys_cond_reference') && userfuncs.sys_cond_reference
    userref=get_comp(pref,'solution');
    [r,userJ]=userfuncs.sys_cond(userpoint,userref);
else
    [r,userJ]=userfuncs.sys_cond(userpoint);
end
nuserpar=length(userpoint.parameter);
Jtemplate=p_axpy(0,point,[]);
J=repmat(Jtemplate,length(userJ),1);
%% append artificial parameters and components as zero in derivative
for i=1:length(userJ)
    J(i).parameter(1:nuserpar)=userJ(i).parameter;
    J(i).profile(1:ind.dim,:)=userJ(i).profile;
    J(i).period=userJ(i).period;
end
end