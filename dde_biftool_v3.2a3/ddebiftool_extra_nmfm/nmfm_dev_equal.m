function iseq=nmfm_dev_equal(f1,f2)
%% Check if two history functions are (exactly) equal
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
iseq=false;
[n1,nv1]=size(f1.v);
[n2,nv2]=size(f2.v);
if n2~=n1 || nv1~=nv2
    return
end
if any(f1.v(:)~=f2.v(:)) || any(f1.lambda~=f2.lambda) || any(f1.t~=f2.t)
    return
end
iseq=true;
end
