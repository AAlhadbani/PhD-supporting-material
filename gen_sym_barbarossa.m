%% DDE-BIFTOOL demo for nested state-dependent delays
%% Creation of right-hand side and derivatives using symbolic toolbox
%
% This demo shows that DDE-Biftool can treat DDEs with nested
% state-dependent delays. The DDE is
% 
% $$\dot [x(t)+c x(t-\tau-b-x(t))=-x(t-\tau-x(t))$$
%
% where $\tau,b,c$ are parameter.
%%
clear
ddebiftool_path(fullfile('ddebiftool_snapshot/'),'symbolic');
%% Set number of delays and parameter names
parnames={'a1','a2','kappa1','kappa2','gam','delta','tau1','tau2','T','mu0'};
cind=[parnames;num2cell(1:length(parnames))];
ind=struct(cind{:});
%% Define system using symbolic algebra
% using arbitrary variable names
syms u ut z zt
syms(parnames{:});
par=sym(parnames);
tau=tau1+(tau2-tau1)*u/(u+T);
tauprime=diff(tau,u);
b1=a1*exp(-kappa1*u);
b2=a2*exp(-kappa2*u);
mu1=gam+delta*u;
zprev=zt*exp(-mu0*tau);
dudt=(zprev-mu1*u)/(1+tauprime*zprev);
zres=b1*u-b2*zprev-z;
f=[dudt;zres];
delay=tau;
x=[u,ut;...
   z,zt];
%% Differentiate and generate code, exporting it to sym_nested
[fstr,derivs]=dde_sym2funcs(f,x,par,'sd_delay',delay,...
    'directional_derivative',true,'filename','sym_barbarossa');
%% equilibrium formula
feq=simplify(subs(f,zt,z));
zeq=simplify(solve(feq(2),z));
eqres=simplify(subs(feq(1),z,zeq));
a1sol=solve(simplify(subs(feq(1),z,zeq)),a1);
zsol=simplify(subs(zeq,a1,a1sol));
%%
matlabFunction(a1sol,zsol,'File','stst_barbarossa','Vars',{u,par.'});