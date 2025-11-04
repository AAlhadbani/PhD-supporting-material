function Delta=dde_stst_ch_matrix(A,tau,lambda,varargin)
%% combine matrices Aj to characteristic matrix Delta(lambda)
% and  its derivatives
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%
default={'deri',0,'dxp',false,'lhs_matrix',eye(size(A,1))};
options=dde_set_options(default,varargin,'pass_on');
lfac=[lambda,1,zeros(1,options.deri-1)];
[n,dum,r]=size(A); %#ok<ASGLU>
if length(tau)<r
    taus=[0,tau(:)'];
else
    taus=tau;
end    
if ~options.dxp
    Delta_ini=options.lhs_matrix;
else
    Delta_ini=zeros(n);
end
tpow=options.deri;
tfac=(-1)^options.deri;
Delta = lfac(options.deri+1)*Delta_ini;
for k = 1:r % For every delay
    Delta = Delta -tfac*taus(k)^tpow*A(:,:,k)*exp(-lambda*taus(k));
end
