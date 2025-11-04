function f = cusp_rhs(xx,par)
%% right-hand side of cusp demo (see cusp_demo.m for equations)
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%par = [q11,q12,q21,e1,e2]

alpha = 1./(1+exp(-4*xx(1,2,:)))-1/2;

f(1,:) = -xx(1,1,:)+par(1)*alpha-par(2)*xx(2,2,:)+par(4);
f(2,:) = -xx(2,1,:)+par(3)*alpha+par(5);
end
