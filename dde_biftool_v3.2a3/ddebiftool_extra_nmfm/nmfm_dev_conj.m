function fout=nmfm_dev_conj(fin)
%% create complex conjugate of history function
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%% 
fout=nmfm_dev_fun(conj(fin.v),'lambda',conj(fin.lambda),'t',fin.t);
end
