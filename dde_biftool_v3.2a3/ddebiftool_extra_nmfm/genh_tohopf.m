function hopf=genh_tohopf(funcs,point,freqs) %#ok<INUSL,INUSD>
%% convert generalized Hopf point to Hopf bifurcation point
% function hopf_point=genh_tohopf(funcs,point {,freqs})
% INPUT:
%   funcs problem functions
%	point with stability information 
%   optional freqs: frequency to be excluded from consideration (ignored
%   here)
% OUTPUT:
%	hopf_point: hopf point
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
hopf = point;
hopf.kind='hopf';
if isfield(point,'stability');
    hopf.stability=point.stability;
end
end
