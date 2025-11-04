% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function [lam,trivlam,nontriv]=dde_separate_complex(lambda,triv)
nl=length(lambda);
ntriv=length(triv);
dist=abs(repmat(lambda(:).',ntriv,1)-repmat(triv(:),1,nl));
sel=munkres(dist);
sel=sel(sel>0);
nontriv=1:nl;
nontriv(sel)=[];
trivlam=lambda(sel);
lam=lambda;
lam(sel)=[];
end
