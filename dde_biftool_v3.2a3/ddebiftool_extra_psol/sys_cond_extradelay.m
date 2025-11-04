function [r,J]=sys_cond_extradelay(p,active,itau,iextra)
%% fix extra delays to be equal to original delays if active
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%% 
[dum,isel]=ismember(active,itau); %#ok<ASGLU>
isel=isel>0;
itau=itau(isel);
iextra=iextra(isel);
ntau=length(itau);
J=repmat(p_axpy(0,p,[]),ntau,1);
if length(p)>1
    J=repmat(J,length(p),1);
end
r=p(1).parameter(itau)-p(1).parameter(iextra);
r=r(:);
for i=1:ntau
    J(i).parameter(itau(i))=1;
    J(i).parameter(iextra(i))=-1;
end
end
  
