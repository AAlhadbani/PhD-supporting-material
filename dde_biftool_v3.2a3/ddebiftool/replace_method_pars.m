function method=replace_method_pars(inp,varargin)
%% overwrite method parameters with argument list (
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
method=inp;
if isempty(varargin)
    return
end
fnames=fieldnames(method);
if length(varargin)==1 
    arg=varargin{1};
    if isstruct(arg)
        argfields=fieldnames(arg);
        for i=1:length(fnames)
            [ism,ind]=ismember(fnames{i},argfields);
            if ism
                method.(fnames{i})=...
                    dde_set_options(method.(fnames{i}),{arg.(argfields{ind})},'pass_on');
            end
        end
    else
        error('replace_method_pars:args',...
            'replace_method_pars: single argument, not of class struct');
    end
else
    for i=1:length(fnames)
        method.(fnames{i})=...
            dde_set_options(method.(fnames{i}),varargin,'pass_on');
    end
end
if isfield(method,'stability')
    %% adjust method.stability if discretization changes for stst types
    options=dde_set_options(method.stability,varargin,'pass_on');
    if isfield(options,'discretization') && ...
            ~strcmp(options.discretization,inp.stability.discretization)
        tmp=df_mthod('stst',options.discretization);
        method.stability=dde_set_options(tmp.stability,varargin,'pass_on');
    end
end
end