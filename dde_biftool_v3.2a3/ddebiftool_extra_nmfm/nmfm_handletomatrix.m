function PHI = nmfm_handletomatrix(fn, arg)
%% Call single-argument function with array of arguments
% INPUT:
%   fn: function handle
%   arg: argument vector for function
% OUTPUT:
%   PHI: n by r matrix
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
for k = length(arg):-1:1
    phivec = fn(arg(k));
    PHI(:,k) = phivec(:);
end
end