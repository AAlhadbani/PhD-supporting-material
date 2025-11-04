function tau=sys_tau_SD_PObif(itau,x,p,ip,funcs)
%% delays of extended systems for fold, torus & period doubling
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
itau=mod(itau-1,ip.orig_ntau)+1;
tau=funcs.sys_tau(itau,x(1:ip.dim,1:itau,:),p(1,1:ip.nuserpar));
end
