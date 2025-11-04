function p=poly_lgr(t,c)
%% values of lagrange polynomials through t at c
% function p=poly_lgr(t,c);
% INPUT:
%	t lagrange points in R^m+1
% 	c evaluation point(s) in R 
% OUTPUT:
%	p values of lagrange polynomials through t at c
%

%
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
m=length(t)-1;
nc=length(c);

% compute p:
p=ones(m+1,nc);
for j=1:m+1
    for k=1:m+1
        if k~=j
            p(j,:)=p(j,:).*(c-t(k))/(t(j)-t(k));
        end
    end
end
% reshape to keep compatibility with original version
if nc==1
    p=p';
end
end
