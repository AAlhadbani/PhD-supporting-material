function coll=dde_coll_extendblanks(coll_user,coll_ext)
%
% (c) DDE-Biftool v3.2a3 2019-10-21 (471d1c3935e4c416fb14a2f4a12d2ece6b336363)

%
%% extend coll_user by zeros to make it fit to format of coll_ext
if isempty(coll_user)
    coll=repmat(coll_ext,0,1);
    return
end
nuserpar=length(coll_user(1).parameter);
dim=size(coll_user(1).profile,1);
coll=p_axpy(0,coll_ext,[]);
coll=repmat(coll,numel(coll_user),1);
for i=1:length(coll_user)
    coll(i).parameter(1:nuserpar)=coll_user(i).parameter;
    coll(i).profile(1:dim,:)=coll_user(i).profile;
    coll(i).period=coll_user(i).period;
end
end
