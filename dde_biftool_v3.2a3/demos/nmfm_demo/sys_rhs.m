% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function f = sys_rhs(xx,par)

f(1,1) = -xx(1,1)-par(1)*(tanh(par(2)*xx(1,2)-1)+tanh(1))*cosh(1)^2+par(3)*(tanh(par(4)*xx(2,3)-1)+tanh(1))*cosh(1)^2;
f(2,1) = -xx(2,1)-par(1)*(tanh(par(2)*xx(2,2)-1)+tanh(1))*cosh(1)^2+par(3)*(tanh(par(4)*xx(1,3)-1)+tanh(1))*cosh(1)^2;
end
