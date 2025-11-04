% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function [success,y]=nmfm_try_mfderi(funcs,point,devs)

ind_tau=funcs.sys_tau();

xx=point.x;
xx=xx(:,ones(1,length(ind_tau)+1));
tau0=[0,point.parameter(ind_tau)];
success=true;
devvals={};
for i=length(devs):-1:1
    devvals{i}=nmfm_dev_call(devs(i),-tau0);
    devvals{i}=devvals{i}(:);
end
    y=funcs.sys_mfderi(xx,point.parameter,devvals{:});
end