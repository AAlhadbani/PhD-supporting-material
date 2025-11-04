function stst=dde_stst_extendblanks(stst_user,stst_ext)
%
% (c) DDE-Biftool v3.2a3 2019-10-21 (471d1c3935e4c416fb14a2f4a12d2ece6b336363)

%
%% extend stst_user by zeros to make it fit to format of stst_ext
if isempty(stst_user)
    stst=repmat(stst_ext,0,1);
    return
end
nuserpar=length(stst_user(1).parameter);
dim=size(stst_user(1).x,1);
stst=p_axpy(0,stst_ext,[]);
stst=repmat(stst,numel(stst_user),1);
for i=1:length(stst_user)
    stst(i).parameter(1:nuserpar)=stst_user(i).parameter;
    stst(i).x(1:dim,:)=stst_user(i).x;
    if isfield(stst_ext,'v') && isfield(stst_user(i),'v')
        stst(i).v(1:dim)=stst_user(i).dim;
    end
end
end
