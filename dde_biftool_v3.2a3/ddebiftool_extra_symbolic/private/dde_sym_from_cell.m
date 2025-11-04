%% Convert possibly cells to sym arrays safely
% This wrapper converts if necessary, but does nothing otherwise.
%
% (c) DDE-Biftool v3.2a3 2023-04-09 (0a63fee7adb9753a3d5a2dfbf671d682652fb642)

%%
function xa=dde_sym_from_cell(xc)
if iscell(xc)
    xa=cell2sym(xc);
elseif isa(xc,'sym')
    xa=xc;
else
    error('dde_sym_from_cell:input',[...
        'dde_sym_from_cell: input is neither cell (of strings) nor sym array',...
        'but of type %s'],class(xc));
end
