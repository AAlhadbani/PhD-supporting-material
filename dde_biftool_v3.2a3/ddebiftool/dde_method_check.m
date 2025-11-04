function out=dde_method_check(method,fieldname,mval)
%% check if method has field mfield and if yes compare with mval (if present)
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
out=isfield(method,fieldname);
if ~out
    return
end
mf=method.(fieldname);
if nargin==2
    out=mf;
    return
end
if ischar(mval)
    out=strcmp(mval,mf);
elseif isnumeric(mval)
    out=numel(mf)==numel(mval) && all(mf(:)==mval(:));
end
end
    