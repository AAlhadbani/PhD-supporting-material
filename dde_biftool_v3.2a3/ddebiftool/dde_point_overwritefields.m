function pt=dde_point_overwritefields(pt,userdefined,varargin)
%% for dde_kind_create functions, overwrite selected fields if not explicitly set
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
assert(mod(length(varargin),2)==0);
for i=1:2:length(varargin)
    name=varargin{i};
    value=varargin{i+1};
    if ~userdefined.(name)
        pt.(name)=value;
    end
end
end