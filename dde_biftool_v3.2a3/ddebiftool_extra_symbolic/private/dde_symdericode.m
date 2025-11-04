function [funcstr,df,v,q]=dde_symdericode(fs,xxs,ps,funcname,varargin)
%% create partial derivatives from symbolic expression and matlabcode
%
% code is returned as string containing function
%
% (c) DDE-Biftool v3.2a3 2023-04-09 (0a63fee7adb9753a3d5a2dfbf671d682652fb642)

%%
%% differentiate expression fs wrt xxs and ps and prepend function itself
fs=fs(:);
[df,v,q]=dde_symdiff(fs,xxs,ps,varargin{:});
df=[{fs},df];
%% code generation
funcstr=dde_symcode(df,xxs,ps,v,q,'funcname',funcname,varargin{:});
end