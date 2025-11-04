%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%% append letter to cell array of names
function xnap=dde_name_append(xn,app)
xnap=cell(size(xn));
for i=1:numel(xn)
    xnap{i}=[xn{i},app];
end
end
