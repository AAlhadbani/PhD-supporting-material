function [genh, success] = p_togenh(point)
%% Convert to uncorrected gneeralized Hopf point
% function genh = p_togenh(point)
% INPUT:
%	point: hopf point
% OUTPUT:
%	genh: uncorrected starting guess for generalized hopf point
%   success: whether conversion was successful
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%% 

% Set success
success = 1;

genh = point;

if strcmp(point.kind, 'hopf')
   genh.kind = 'genh';
   genh.flag = '';
   if ~isfield(genh,'nmfm')
      genh.nmfm = struct();
   end
   if ~isfield(genh.nmfm,'L2')
      genh.nmfm.L2 = NaN;
   end
else
   fprintf('P_TOGENH: only hopf points can be converted into generalized hopf.\n');
   success = 0;
end
end
