%
% (c) DDE-Biftool v3.2a3 2023-04-09 (0a63fee7adb9753a3d5a2dfbf671d682652fb642)

%
%% extract cell array of names from sym array
function xn=dde_names_from_sym(xs)
xn=cell(size(xs));
for i=1:numel(xs)
    xn{i}=char(xs(i));
end
end
