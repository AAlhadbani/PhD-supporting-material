function f = sys_rhs(xx,par)
%%
% @author Maikel Bosschaert, maikel.bosschaert -at- uhasselt.be
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
f = -par(4).*xx(1,1,:)-par(1).*xx(1,2,:)-par(2).*xx(1,3,:)-par(1).*par(3).*xx(1,1,:).*(par(1).*xx(1,4,:)+par(2).*xx(1,5,:)+par(4).*xx(1,2,:))-par(2).*par(3).*xx(1,1,:).*(par(1).*xx(1,5,:)+par(2).*xx(1,6,:)+par(4).*xx(1,3,:))-par(1).^2.*par(3).^2.*xx(1,1,:).*xx(1,2,:).*(par(1).*xx(1,7,:)+par(2).*xx(1,8,:)+par(4).*xx(1,4,:))-par(1).*par(2).*par(3).^2.*xx(1,1,:).*xx(1,2,:).*(par(1).*xx(1,8,:)+par(2).*xx(1,9,:)+par(4).*xx(1,5,:))-par(2).*par(1).*par(3).^2.*xx(1,1,:).*xx(1,3,:).*(par(1).*xx(1,8,:)+par(2).*xx(1,9,:)+par(4).*xx(1,5,:))-par(2).^2.*par(3).^2.*xx(1,1,:).*xx(1,3,:).*(par(1).*xx(1,9,:)+par(2).*xx(1,10,:)+par(4).*xx(1,6,:))-1/2.*par(3).^2.*xx(1,1,:).^2.*par(1).*(par(4).^2.*xx(1,2,:)+2.*par(4).*(par(1).*xx(1,4,:)+par(2).*xx(1,5,:))+par(1).^2.*xx(1,7,:)+2.*par(1).*par(2).*xx(1,8,:)+par(2).^2.*xx(1,9,:))-1/2.*par(3).^2.*xx(1,1,:).^2.*par(2).*(par(4).^2.*xx(1,3,:)+2.*par(4).*(par(1).*xx(1,5,:)+par(2).*xx(1,6,:))+par(1).^2.*xx(1,8,:)+2.*par(1).*par(2).*xx(1,9,:)+par(2).^2.*xx(1,10,:));

end
