function gamma=time_nrd(epsi,r,s)

% function gamma=time_nrd(epsi,r,s)
% INPUT:
%	epsi in [0,1)
%	r number of points to the left (the past)
%	s number of points to the right (the present)
% OUTPUT:
%	gamma nordsieck interpolation vector (from past to present)

% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)


for j=-r:s
  g=1;
  for k=-r:s
    if k~=j,
      g=g*(epsi-k)/(j-k);
    end;
  end;
  gamma(j+r+1)=g;
end;

return;
