function point=dde_hopf_postprocess(point,data)
%% change complex phase of Hopf eigenvector after newton iteration
% making it as close to the reference as possible
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
vref=data.previous.v;
v=point.v;
phi=angle(v'*vref);
point.v=v*exp(1i*phi);
end
