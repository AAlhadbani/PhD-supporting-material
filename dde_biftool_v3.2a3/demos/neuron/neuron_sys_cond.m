% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function [res,p]=neuron_sys_cond(point)
res(1)=point.x(1);
p=p_axpy(0,point,[]);
p.x(1)=1;

return;
