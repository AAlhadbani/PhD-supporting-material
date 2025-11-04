% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function [res,p]=homoclinic_sys_cond(point,period)
res(1)=point.period-period;
p=p_axpy(0,point,[]);
p.period=1;
end
