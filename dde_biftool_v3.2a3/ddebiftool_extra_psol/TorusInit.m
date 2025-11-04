function trini=TorusInit(funcs,point,method,nremove,closest)
%% crude initial guess for start of torus bifurcation from Floquet mode
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
[eigval,eigprofile]=mult_crit(funcs,point,method.stability,nremove,closest);
t=repmat(point.mesh,size(point.profile,1),1);
% convert Floquet multiplier mode to Floquet exponent mode (periodic
% function)
eigprofile=eigprofile.*exp(-log(eigval).*t);
omega=atan2(imag(eigval),real(eigval));
upoint=p_axpy(0,point,[]);
upoint.profile=reshape(real(eigprofile),size(point.profile));
vpoint=upoint;
vpoint.profile=reshape(imag(eigprofile),size(point.profile));
utu=dde_coll_profile_dot(upoint,upoint);
vtv=dde_coll_profile_dot(vpoint,vpoint);
utv=dde_coll_profile_dot(upoint,vpoint);
r=1/sqrt(utu+vtv);
gamma=atan2(2*utv,vtv-utu)/2;
qr=r*(upoint.profile*cos(gamma)-vpoint.profile*sin(gamma));
qi=r*(upoint.profile*sin(gamma)+vpoint.profile*cos(gamma));
trini=point;
trini.profile=[trini.profile;qr;qi];
trini.parameter=[trini.parameter,omega/pi,trini.period];
end
