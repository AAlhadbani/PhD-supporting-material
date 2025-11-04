function [E0,n0,par]=LK_init(par,ip)
%% obtain initial value for rotating wave for given alpha, pump, eta and tau
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
n0=par(ip.eta)/2;
omega0=n0*par(ip.alpha)-sqrt(par(ip.eta)^2-n0^2);
phi0=angle(n0*(1+1i*par(ip.alpha))-1i*omega0)+pi+omega0*par(ip.tau);
phi0=mod(phi0,2*pi);
E0=sqrt((par(ip.pump)-n0)/(2*n0+1));
E0=[E0;0];
par(ip.phi)=phi0;
par(ip.omega)=omega0;
end
