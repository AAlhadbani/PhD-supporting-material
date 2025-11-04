function [zeho, success] = p_tozeho(point)
%%  Convert to zero-Hopf point
% function zeho = p_tozeho(point)
% INPUT:
%	point: hopf point
% OUTPUT:
%	zeho: uncorrected starting guess for zero hopf point
%   success: whether conversion was successful
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
% Set success
success = 1;

zeho = point;
switch point.kind
    case'hopf'
        zeho.kind = 'zeho';
        zeho.flag = '';
        if ~isfield(zeho,'nmfm')
            zeho.nmfm = struct();
        end
        if ~isfield(zeho,'nvec')
            zeho.nvec = struct();
            zeho.nvec.omega=point.omega;
        end
        if ~isfield(zeho.nvec,'omega')
            zeho.nvec.omega=zeho.omega;
        end
    case 'fold'
        zeho.kind = 'zeho';
        zeho.flag = '';
        if ~isfield(zeho,'nmfm')
            zeho.nmfm = struct();
        end
        if ~isfield(zeho,'nvec')
            zeho.nvec = struct();
        end
        [dum,dum,selroot]=nmfm_smrp([],zeho,[],...
            'remove_omega',false,'threshold',@(imx)imx>1e-8); %#ok<ASGLU>
        if isempty(selroot)
            fprintf('P_TOZEOHO: no critical imaginary pair!');
            success = 0;
        end
        zeho.nvec.omega = abs(imag(selroot));
    otherwise
        fprintf('P_TOZEHO: only hopf or fold points can be converted into zero hopf.\n');
        success = 0;
end
end
