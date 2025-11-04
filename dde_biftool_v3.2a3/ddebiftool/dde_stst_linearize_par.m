function b=dde_stst_linearize_par(funcs,point,free_par,varargin)
%% linearize r.h.s. in stst (possibly 2nd-order) derivatives wrt parameter free_par
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
default={'idx',[],'dev',[]};
[options,pass_on]=dde_set_options(default,varargin,'pass_on');
if isempty(options.idx)
    options.dev=1;
end
taus=dde_stst_delays(funcs,point,pass_on{:});
xx=point.x(:,ones(length(taus),1));
b=[];
%% First order or single second order derivative
if isempty(options.dev)|| ~isempty(options.idx)
for k = length(free_par):-1:1 % For every parameter
    b(:,k) = reshape(funcs.sys_deri(xx,point.parameter,options.idx,free_par(k),[]),[],1);
end
%% Linear combination of second order derivatives
% d/dp[ sum(df_j(x,...,x,p)v_j,j=1..m)
df=@(j,k,dev)funcs.sys_deri(xx,point.parameter,j-1,free_par(k),dev(:,j));
for k =  length(free_par):-1:1 % For every parameter
    for j=m:-1:1
        b(:,k,j) = df(j,k,options.dev);
    end
end
b=sum(b,3);
end
