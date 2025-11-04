% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function data=dde_stst2rwfold(funcs,info,varargin)
[pffuncs,info]=SetupRWFold(funcs,info,1,'correc',false,'dir',[],varargin{:});
data.info=info;
data.funcs=pffuncs;
end