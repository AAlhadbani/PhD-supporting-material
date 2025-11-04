function [ind,len]=dde_ind_from_point(point,free_par_ind,base)
%% Determine indices for entries in vector from structure
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
if nargin<3
    base=0;
end
[~,fields]=feval(['dde_',point.kind,'_create'],point);
if isstruct(fields)
    ind=fields;
else
    [ind,len]=fields{2}(point,free_par_ind,base);
    return
end
point.parameter=1:length(free_par_ind);
prev=base;
fnames=fieldnames(fields);
for i=1:length(fnames)
    fd=fnames{i};
    iar=reshape(1:numel(point.(fd)),size(point.(fd)));
    ind.(fd)=prev(end)+iar;
    if ~isempty(iar)
        prev=ind.(fd);
    end
    if fields.(fd)==2
        prev=prev(end)+iar;
        ind.(fd)=struct('re',ind.(fd),'im',prev);
    end
end
len=prev(end)-base;
end