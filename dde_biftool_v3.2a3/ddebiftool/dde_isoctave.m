function isoct=dde_isoctave()
%% check if octave is running instead of Matlab
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
if exist('OCTAVE_VERSION','builtin')
    isoct=true;
else
    isoct=false;
end
end
