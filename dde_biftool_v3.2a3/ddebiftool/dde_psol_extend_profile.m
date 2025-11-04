function [dtext,err_ext]=dde_psol_extend_profile(dt,err_est)
%% function extending highest derivative periodically
% (used in auto_eqd)
%
% Input: dt: time increments, hd: error estimate
% Outputs: dtext,err_ext: extended time increments and error estimates
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
dtext=[dt(end),dt,dt(1)];
err_ext=[err_est(:,end),err_est,err_est(:,1)];
end
