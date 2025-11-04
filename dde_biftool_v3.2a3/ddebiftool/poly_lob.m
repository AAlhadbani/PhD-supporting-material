function c=poly_lob(m)

% function c=poly_lob(m)
% INPUT:
% 	m degree polynomial
% OUTPUT:
%	c roots of m-degree gauss-lobatto polynomial in [0,1]^m

% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)


% gauss-lobatto polynomials:

if m<=1,
  err=m
  error('POLY_LOB: degree too low!');
end;

if m==2,
  p=[1];
elseif m==3
  p=[1 -0.5];
elseif m==4,
  p=[1 -1 0.2];
elseif m==5,
  p=[7 -10.5 4.5 -0.5]/7;
end;

if m>5,
  err=m
  error('POLY_LOB: degree too high!');
end;

c=[0 sort(roots(p))' 1];

return;
