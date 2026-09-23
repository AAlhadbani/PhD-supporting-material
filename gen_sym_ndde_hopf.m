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
ntau=2; % plays the role of k
parnames={'tau','b','c'};
cind=[parnames;num2cell(1:length(parnames))];
ind=struct(cind{:});
%% Define system using symbolic algebra
% using arbitrary variable names
x=sym('x',[2,ntau+1]);
syms(parnames{:});
par=sym(parnames);
f=[-x(1,2);...
    x(1,1)+c*x(1,3)-x(2,1)];
delays=[tau+x(1);tau+b+x(1)];
%% Differentiate and generate code, exporting it to sym_nested
[fstr,derivs]=dde_sym2funcs(f,x,par,'sd_delay',delays,...
    'directional_derivative',true,'filename','sym_ndde_hopf');

