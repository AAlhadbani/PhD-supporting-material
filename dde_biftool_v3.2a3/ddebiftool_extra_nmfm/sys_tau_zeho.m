function tau=sys_tau_zeho(itau,xx,par,funcs)
%% delay. for Zero-Hopf bifurcation
%
% (c) DDE-Biftool v3.2a3 2019-10-21 (471d1c3935e4c416fb14a2f4a12d2ece6b336363)

%%
if ~funcs.tp_del
    tau=funcs.sys_tau();
else
n=size(xx,1)/4;
tau=funcs.sys_tau(itau,xx(1:n,:),par(1,1:end-1,:));
end
