function dy=app_dir_deriv(f,x0,deviation,ind,h)
%% 2nd order approx directional derivative in ith column of x0
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
xd=x0;
xd(:,ind,:)=x0(:,ind,:)+h*deviation;
dy1=f(xd);
xd(:,ind,:)=x0(:,ind,:)-h*deviation;
dy2=f(xd);
dy=(dy1-dy2)/(2*h);
end