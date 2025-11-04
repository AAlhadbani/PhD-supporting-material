function hopf=dde_hopf_from_psol(psol,varargin)
%% convert periodic orbit psol into approximate hopf point (not corrected)
%
% optional arguments not needed
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
xmean=mean(psol.profile,2);
hopf=dde_hopf_create('parameter',psol.parameter,'x',xmean,...
    'omega',2*pi/abs(psol.period));
x_harmonic=psol.profile-xmean(:,ones(1,size(psol.profile,2)));
coeffs=[sin(2*pi*psol.mesh);cos(2*pi*psol.mesh)];
vxy=x_harmonic/coeffs;
hopf.v=vxy(:,1)+1i*vxy(:,2);
hopf.v=hopf.v/norm(hopf.v);
end