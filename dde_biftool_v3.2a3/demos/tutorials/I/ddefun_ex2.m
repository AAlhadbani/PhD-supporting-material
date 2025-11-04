function  f = ddefun_ex2(xx,par)
%%
% @author Maikel Bosschaert, maikel.bosschaert -at- uhasselt.be
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
    f = par(1)*xx(1,2)/(1+xx(1,2)^par(3))-par(2)*xx(1,1);
    % par = [beta, gamma, n];
end
