%
% (c) DDE-Biftool v3.2a3 2023-04-09 (0a63fee7adb9753a3d5a2dfbf671d682652fb642)

%
%% newline depending on platform
function nl=dde_newline()
if dde_isoctave()
    nl=sprintf('\n'); %#ok<SPRINTFN>
else
    nlfun=builtin('newline');
    nl=nlfun();
end
end