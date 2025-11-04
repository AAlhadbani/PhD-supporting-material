function groups=nmfm_dev_group(funs)
%% Group history functions into groups of equals
% output cell array of index sets where each cell contains indices with
% equal funs.
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
nf=length(funs);
remaining=1:nf;
groups=cell(1,nf);
count=0;
%% for test purposes (such that funs can be complex numbers or dev functions)
if isnumeric(funs)
    iseq=@(x,y)all(x(:)==y(:));
else
    iseq=@nmfm_dev_equal;
end
%% collect into groups
while ~isempty(remaining)
    count=count+1;
    groups{count}=remaining(1);
    remaining(1)=[];
    for i=length(remaining):-1:1
        if iseq(funs(groups{count}(1)),funs(remaining(i)))
            groups{count}(end+1)=remaining(i);
            remaining(i)=[];
        end
    end
end
groups=groups(1:count);
end
 