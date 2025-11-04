function taus=dde_coll_delays(funcs,pt,varargin)
%% compute all or requested delays in stst, including first delay=0
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
default={'d_nr',[],'t',pt.mesh};
options=dde_set_options(default,varargin,'pass_on');
coll=dde_coll_map(funcs,pt,'c_is_tvals',true,'c',options.t,'nderivs',0);
taus=coll.tau';
if ~isempty(options.d_nr)
    taus=taus(options.d_nr+1,:);
end
end
