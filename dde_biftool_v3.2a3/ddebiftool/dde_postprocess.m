function out=dde_postprocess(point,data)
%% postprocess a point after conversion from vector (if reqeuested by method)
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if isfield(data.method,'postprocess') && ~isempty(data.method.postprocess)
    for i=numel(point):-1:1
        out(i)=feval(data.method.postprocess,point(i),data);
    end
    if numel(point)>0
        out=reshape(out,size(point));
    else
        out=point;
    end
else
    out=point;
end
end
