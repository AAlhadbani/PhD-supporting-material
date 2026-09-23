function out=dde_sym_wrap(x,test)
if nargin<2
    out=x;
    return
end
if issym(test)
    out=sym(x);
else
    out=x;
end
end