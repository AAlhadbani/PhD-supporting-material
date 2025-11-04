%% generalized Hopf normal form for generalized Hopf point encountered along Hopf branch
%% Wrapper around nmfm_codimension2_nf
%% Input
%
% * funcs: problem functions
% * branch: Hopf branch along which generalized Hopf point was encountered
% * inds: array of two successive point indices bracing generalized Hopf point
%
%% Output
%
% * nf: point with normal form
% * nflow: if numerical finite differences are used then computation is
% done twice, once with higher order, once with lower order, this output is
% the result with lower order. Use the difference between nf and nflow to
% estimate the error
% * br_ref: bisection refinements are performed along the branch before
% normal form calculation, br_ref is branch with additional points between
% indices inds
% * indbif: is the index in br_ref which is closest to generalized Hopf point
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
%%
function [nf,nflow,br_ref,indbif]=GeneralizedHopfNormalform(funcs,branch,inds,varargin)
default={'L1_threshold',1e3};
[options,pass_on]=dde_set_options(default,varargin,'pass_on');
if ~strcmp(branch.point(inds(1)).kind,'hopf')
    error('GeneralizedHopfNormalform:type',...
            'GeneralizedHopfNormalform: cannot detect generalized Hopf along branch of type %s.',...
            type);
end
detect=@(p)genhdetect(funcs,p);
nmfm_compute=@(f,pt,varargin)nmfm_genh(f,p_togenh(pt),pass_on{:});
[nf,nflow,br_ref,indbif]=...
    nmfm_codimension2_nf(funcs,branch,inds,detect,nmfm_compute,pass_on{:});
%% check if coefficient l1 is unreasonable
if isempty(nf) || abs(nf.nmfm.L1)>options.L1_threshold
    nf=branch.point([]);
    nflow=nf;
    br_ref=branch;
    indbif=NaN;
end
end
function L1=genhdetect(funcs,p)
newpoint=nmfm_hopf(funcs,p);
L1=newpoint.nmfm.L1;
end