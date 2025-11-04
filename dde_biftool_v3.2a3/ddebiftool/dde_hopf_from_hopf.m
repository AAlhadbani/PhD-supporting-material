function hopf=dde_hopf_from_hopf(hopf,varargin)
%% wrapper for dde_hopf_from_stst, switching to different frequency
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
hopf=dde_hopf_from_stst(hopf,varargin{:});
end
