%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%% set event for dde23
% generates event whenever y crosses |pi|
function [value,isterm,dir]=cross_pi_dde23(y)
value=sin(y);
isterm=false;
dir=1;
end
