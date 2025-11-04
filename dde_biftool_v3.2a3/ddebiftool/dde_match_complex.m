% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function ind=dde_match_complex(z1,z2)
cost=abs(z1(:,ones(length(z2),1))-z2(:,ones(length(z1),1)).');
ind=munkres(cost);
end
