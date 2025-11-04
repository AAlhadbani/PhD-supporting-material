%% Evaluate (derivative of) piecewise collocation polynomial
% assuming all requested points are inside the collocation interval
% mesh([1,end]) (assertion is placed)
%
% (c) DDE-Biftool v3.2a3 2023-04-10 (e116e751f60ec5656f66f60a6b2e0e781d7dcb8b)

%%
function [y,J]=dde_coll_eva(varargin)
%% INPUT:
%
% * profile: profile on mesh t
% * mesh: representation points in [t1,t2] size(m*l+1)
% * x: time points point(s) where to evaluate
% * degree: order polynomials
%
% or
%
% * point: coll or psol structure
% * x: time point(s) where to evaluate
%
%% OUTPUT: 
%	y value of profile at x
%   J: sparse Jacobian:  y(:)=J*profile(:)
%
%% distinguish between two calling modes numerical arguments
if isnumeric(varargin{1})
    assert(length(varargin)>=4);
    [profile,mesh,x,degree]=deal(varargin{1:4});
    optind=5;
elseif isstruct(varargin{1})
    assert(length(varargin)>=2);
    [pt,x]=deal(varargin{[1,2]});
    assert(isfield(pt,'profile'));
    [profile,mesh,degree]=deal(pt.profile,pt.mesh,pt.degree);
    optind=3;
else
    error('COLL:ARGS','dde_coll_eva: argument sequence not recognized');
end
%% options
default={'kron',false,'diff',0,'sparse',true,'submesh_limit',0,...
    'in_interval',zeros(1,0),'output','profile','assert_boundaries',true};
options=dde_set_options(default,varargin(optind:end),'pass_on');
%% rescale mesh
tbd=mesh([1,end]);
tlen=tbd(2)-tbd(1);
mesh=(mesh-tbd(1))/tlen;
x=(x-tbd(1))/tlen;
mesh([1,end])=[0,1];
if options.assert_boundaries
    assert(all(x>=0&x<=1));
end
%% coarse mesh
tcoarse=mesh(1:degree:end);
nt=length(mesh);
nx=length(x);
%% find for each x the corresponding interpolation interval
% for x(i) the interval number is it(i) where it(i) points into mesh
itcoarse=options.in_interval;
if isempty(itcoarse) && ~isempty(x)
    itcoarse=find_subintervals(tcoarse,x,options.submesh_limit);
else
    assert(length(x)==length(itcoarse));
end
if ~options.assert_boundaries
    itcoarse=max(min(itcoarse,length(tcoarse)-1),1);
end
%% evaluate Lagrange polynomials on all interpolation times
intlen=tcoarse(itcoarse+1)-tcoarse(itcoarse);
cscal=2*(x-tcoarse(itcoarse))./intlen-1;
%% evaluate barycentric weights
% for flexibility, (not assuming any particular interpolation grid)
[w,base_v,Dmat]=dde_coll_barywt(mesh,degree,options.diff);
%% calculate profiles
d1=degree+1;
ti_m=(itcoarse-1)*degree+1;
od=ones(d1,1);
ox=ones(nx,1);
ix=ti_m(od,:)+repmat((0:degree)',1,nx);
denom=cscal(od,:)-base_v(:,ox);
jac_ind(:,:,2)=ix;
jac_ind(:,:,1)=repmat(1:nx,d1,1);
fac=w(:,ox)./denom;
jac_vals=zeros(d1,nx);
jac_vals(~denom(:))=1;
denomfin=all(denom~=0,1);
jac_vals(:,denomfin)=fac(:,denomfin)./repmat(sum(fac(:,denomfin),1),d1,1);
div=(intlen*tlen).^options.diff;
jac_vals=(Dmat'*jac_vals)./repmat(div,d1,1);
outmatrix=strcmp(options.output,'matrix');
if ~outmatrix || nargout>1
    y=profile(:,ix)*sparse_blkdiag(reshape(jac_vals,d1,1,nx));
else
    y=[];
end
%% return Jacobian if requested
if outmatrix || nargout>1
    jac_ind=reshape(jac_ind,[],2);
    jac_vals=jac_vals(:);
    iremove=jac_vals==0;
    jac_vals=jac_vals(~iremove);
    jac_ind=jac_ind(~iremove,:);
    J=sparse(jac_ind(:,1),jac_ind(:,2),jac_vals,nx,nt);
    if islogical(options.kron) && options.kron
       J=kron(J,speye(size(profile,1)));
    elseif isnumeric(options.kron) && numel(options.kron)>1
       J=kron(J,options.kron);
    end        
    if ~options.sparse
        J=full(J);
    end
else
    J=[];
end
if outmatrix
    [J,y]=deal(y,J);
end
end
%%
function itcoarse=find_subintervals(tcoarse,x,submesh_limit)
itcoarse=NaN(size(x));
nt=length(tcoarse);
itcoarse(x<tcoarse(1))=0;
itcoarse(x>tcoarse(end))=nt+1;
itcoarse(x==tcoarse(end))=nt;
sel=x>=tcoarse(1)&x<tcoarse(end);
itcoarse(sel)=floor(interp1(tcoarse,1:nt,x(sel),'linear'));
itcoarse(itcoarse==length(tcoarse))=length(tcoarse)-1;
if submesh_limit==1
    ixch= x-tcoarse(itcoarse)==0 & x>0;
    itcoarse(ixch)=itcoarse(ixch)-1;
end
end
