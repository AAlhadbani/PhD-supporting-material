%% Right-hand side of Holling=Tanner model with delay
function f = HollingTanner_rhs(xx,par)
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
f(1,:) = (xx(1,1,:)+par(4)).*(1-xx(1,1,:)-par(4))-...
    xx(1,1,:).*xx(2,1,:)./(par(3)*xx(2,1,:)+xx(1,1,:))-par(5);
f(2,:) = par(6)*xx(2,1,:).*(par(1)-xx(2,2,:)./xx(1,2,:));
end
