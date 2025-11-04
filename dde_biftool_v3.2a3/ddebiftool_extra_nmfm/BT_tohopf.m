function hopf=BT_tohopf(funcs,btpoint,freqs) %#ok<INUSD,INUSL>
%% convert Bogdanov-takens point into a Hopf point (wrapper)
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
hopf=dde_hopf_from_BT(btpoint);
end 
  