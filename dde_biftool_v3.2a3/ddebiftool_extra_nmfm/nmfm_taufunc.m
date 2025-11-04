function tau=nmfm_taufunc(order,it,xx,p,dp,itau) %#ok<INUSL>
%% when converting DDE with parameter delays to sd-DDE, 
% this is the sys_tau and sys_dirdtau
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if order==0
    tau=p(1,itau(it),:);
elseif order==1
    tau=dp(1,itau(it),:);
else
    tau=0*dp(1,1,:);
end
end
