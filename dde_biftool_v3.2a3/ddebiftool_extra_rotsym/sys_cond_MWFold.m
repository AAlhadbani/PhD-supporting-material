function [r,J]=sys_cond_MWFold(point,pref,funcs)
%% constraints used for extended DDE in fold continuation for relative periodic orbits
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%% duplicate rotational phase condition (last user condition)
dim=size(point.profile,1)/2;
irgx=1:dim;
irgv=dim+(1:dim);
A=funcs.rotation;
Apref=pref;
Apref.profile(irgx,:)=0;
Apref.profile(irgv,:)=A*pref.profile(irgx,:);
[r,J]=p_dot(point,Apref,'free_par_ind',[],'period',false);
end
