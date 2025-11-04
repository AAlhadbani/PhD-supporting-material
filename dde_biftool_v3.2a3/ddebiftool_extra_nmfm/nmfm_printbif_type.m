function nmfm_printbif_type(str,occurence)
%% shortcut printing out number of occurences of type str
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
if sum(occurence)>0
    fprintf('%d %s ',sum(occurence),str);
end
end
