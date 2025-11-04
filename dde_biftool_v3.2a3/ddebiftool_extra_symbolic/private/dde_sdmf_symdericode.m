function [funcstr,df,v]=dde_sdmf_symdericode(fs,tau,xxs,ps,funcname,varargin)
%% combined functional in equilibrium: derivatives from symbolic expression and matlabcode
%
% code is returned as string containing function
%
% (c) DDE-Biftool v3.2a3 2023-04-09 (0a63fee7adb9753a3d5a2dfbf671d682652fb642)

%%
%% differentiate expression fs wrt xxs and ps and prepend function itself
fs=fs(:);
tau=tau(:);
[df,v]=dde_sdmf_symdiff(fs,tau,xxs,varargin{:});
df=df([1,1:end]);
%% code generation
funcstr=dde_symcode(df,xxs(:,1),ps,v,sym([]),'funcname',funcname,varargin{:});
end

