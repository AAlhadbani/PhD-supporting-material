function stab=dde_stst_stability(varargin)
%% create stst stability field
%
% (c) DDE-Biftool v3.2a3 2019-10-17 (72eb1244551bc4dead169e97fec6dc0b17c76e64)

%%
default={'h',[],'l0',NaN(1,0),'l1',NaN(0,1),'err',NaN(1,0),...
    'v',NaN(1,0),'w',NaN(1,0),'discarded',[]};
stab=dde_set_options(default,varargin,'pass_on','stability');
end
