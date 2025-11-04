function y=LangKobayashi(E,Etau,n,p,ip)
%% r.h.s of Lang-Kobayashi equation
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
Edot=(1+1i*p(ip.alpha))*n.*E+p(ip.eta)*exp(1i*p(ip.phi))*Etau;
ndot=p(ip.epsilon)*(p(ip.pump)-n-conj(E).*E.*(2*n+1));
y=cat(1,real(Edot),imag(Edot),real(ndot));
end
