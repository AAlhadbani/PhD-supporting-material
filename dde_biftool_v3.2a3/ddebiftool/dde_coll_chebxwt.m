%% Nodes & weights for Chebyshev interpolation, scaled to [0,1] by default
%%
function [x,w]=dde_coll_chebxwt(n,sel,interval)
%
% inputs: n=degree, sel=which of the nodes and weights should be output
% (default: all of them), interval=what base interval should be used
% (default [0,1] 
% output: x=node positions, w=barycentric weights
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if nargin<2
    sel=1:n+1;
end
if nargin<3
    interval=[0,1];
end
len=interval(2)-interval(1);
j=0:n;
x=cos(j*pi/n);
w=ones(1,n+1);
jodd=mod(j,2)==1;
w(jodd)=-w(jodd);
w([1,end])=0.5*w([1,end]);
x=(x+1)/2*len+interval(1);
w=w*(2/len)^n;
x=x(end:-1:1);
w=w(end:-1:1);
x=x(sel);
w=w(sel);
end
