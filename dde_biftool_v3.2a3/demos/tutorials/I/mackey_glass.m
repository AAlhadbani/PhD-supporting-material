function sol = mackey_glass(n,tspan,t)
%%
% @author Maikel Bosschaert, maikel.bosschaert -at- uhasselt.be
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%

% close all;
% tspan=[0;150];

% set parameters
tau=2;
beta=2;
gamma=1;
% n=7;
par=[beta gamma n];

% options = ddeset('MaxStep',0.01);
options = ddeset('RelTol',1e-4);
sol = dde23(@(t,y,Z)ddefun_ex2([y,Z],par),tau,@(t,beta,gamma,n) 0.5,tspan,options);

figure;
y=deval(sol,t);
ylag=deval(sol,t-2);
plot(y,ylag);
xlabel('$x(t)$','Interpreter','LaTex');
ylabel('$x(t-\tau)$','Interpreter','LaTex');

end
