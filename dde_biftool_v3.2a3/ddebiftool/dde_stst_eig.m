function stability=dde_stst_eig(funcs,p,method,varargin)
%% compute stability information for stst 
% INPUT:
%   funcs problem functions
%	point solution point
%	method method parameters 
% OUTPUT:
%	stability stability information
% Update on 05/03/2007 ("flag_newhheur"  <=> (imag(method.lms_parameter_rho)~=0) )   
%
% (c) DDE-Biftool v3.2a3 2019-10-03 (1657ab14881343c9dbb650a24c1ddd2ea8c15011)

%
%%
default={'fill',[]};
[options,pass_on]=dde_set_options(default,varargin,'pass_on');
if ~isfield(method,'discretization')
    method.discretization='cheb';
end
[A,tau]=dde_stst_linearize_rhs(funcs,p);
%% confirm if left-hand side is not Id x'=...
dim=size(A,1);
lhs_num=funcs.lhs_matrix(dim);
id=eye(dim);
if ~all(lhs_num(:)==id(:))
    rklhs=rank(lhs_num);
    if rklhs<dim && ~strcmp(method.discretization,'cheb')
        error('dde_stst_eig:method',['dde_stst_eig: method %s ',...
            'not implemented for neutral equations'],method.discretization);
    elseif rklhs==dim && ~strcmp(method.discretization,'cheb')
        for i=1:size(A,3)
            A(:,:,i)=lhs_num\A(:,:,i);
        end
        lhs_num=id;
    end
end
stability=feval(['dde_stst_eig_',method.discretization],A,tau,'method',method,...
    'lhs_matrix',lhs_num,pass_on{:});
if ~isempty(options.fill)
    ext=@(s)cat(1,s(:),repmat(options.fill,method.max_number_of_eigenvalues-length(s),1));
    stability.l0=ext(stability.l0).';
    stability.l1=ext(stability.l1);
end
end
