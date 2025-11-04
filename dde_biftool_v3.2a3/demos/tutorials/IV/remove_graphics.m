% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

function remove_graphics()
s=evalin('base','whos');
sc={s.class};
id='matlab.graphics';
for i=1:length(sc)
    if strncmp(sc{i},id,length(id))
        evalin('base',['clear ',s(i).name]);
    end
end
end
