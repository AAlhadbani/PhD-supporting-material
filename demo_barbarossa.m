%% Periodic orbits near Hopf bifurcation in neutral DDE
% with state-dependent delays
% This demo shows that DDE-Biftool can treat DDEs with nested
% state-dependent delays. The DDE is
% 
% $$\dot [x(t)+c x(t-\tau-b-x(t))=-x(t-\tau-x(t))$$
%%
clear
format compact
ddebiftool_path(fullfile('ddebiftool_snapshot/'));
%% Set number of delays and parameter names
parnames={'a1','a2','kappa1','kappa2','gam','delta','tau1','tau2','T','mu0'};
cind=[parnames;num2cell(1:length(parnames))];
ip=struct(cind{:});
format compact
par0([ip.a1,ip.a2,ip.kappa1,ip.kappa2,ip.gam,ip.delta,ip.tau1,ip.tau2,ip.T,ip.mu0])=...
     [    1, 33.5,    0.6,       0.5,   0.001,  0.005,    2,      20,    5, 0.005];
M=[1,0;0,0];
u0=10;
[par0(ip.a1),z0]=stst_barbarossa(u0,par0.');
x0=[u0;z0];
funcs=set_symfuncs(@sym_barbarossa,'lhs_matrix',M);
disp('initial residual');
disp(funcs.wrap_rhs([x0,x0],par0));
txt={'FontSize',16};
ltx=[txt(:)',{'Interpreter'},{'latex'}];
lw={'LineWidth',2};
%%
bd={'max_bound',[ip.a1,50;ip.mu0,0.015],'min_bound',[ip.a1,5;ip.mu0,0.0005],...
    'max_step',[ip.a1,0.5;ip.mu0,5e-4]};
[eqbr,suc]=SetupStst(funcs,'x',x0,'parameter',par0,'contpar',ip.a1,bd{:})
figure(1);clf;ax1=gca;
xlabel(ax1,'$a_1$',ltx{:});
ylabel(ax1,'$U$',ltx{:});
eqbr=br_contn(funcs,eqbr,100,'ax',ax1);
eqbr=br_rvers(eqbr);
eqbr=br_contn(funcs,eqbr,100,'ax',ax1);
[eqbr,nunst]=br_stabl(funcs,eqbr);
%% Find Hopf points and L1 coefficient
[eqbr_wbifs,eqtests,bifind,biftype]=LocateSpecialPoints(funcs,eqbr);
%% Check dominant eigenvalue and spectral radius
getpar=@(pname,br)arrayfun(@(p)p.parameter(ip.(pname)),br.point);
getend=@(y)y(end);
specradius=arrayfun(@(p)getend(funcs.drhs_mf([p.x,p.x],p.parameter,{1,'I'},0)),eqbr_wbifs.point);
[nu,dom]=GetStability(eqbr_wbifs);
a1eq=getpar('a1',eqbr_wbifs);
figure(2);tl1=tiledlayout(1,2,'TileSpacing','tight');
ax2=nexttile(tl1,1);hold(ax2,'on');
yyaxis(ax2,'left');
plot(ax2,a1eq,real(dom),'-',lw{:});grid(ax2,'on');
pH=plot(ax2,a1eq(bifind),real(dom(bifind)),'ko',lw{:},'DisplayName','Hopf bifurcation');
xlabel(ax2,'$a_1$',ltx{:});
ylabel(ax2,'$\mathrm{Re}\lambda_\mathrm{dom}$',ltx{:});
yyaxis(ax2,'right');
plot(ax2,a1eq,abs(specradius),'-',lw{:});
ylabel(ax2,['$|\partial_xg|$'],ltx{:});
set(ax2,txt{:},lw{:},'box','on');
legend(ax2,pH,'Location','best',ltx{:})
%% Track periodic orbits from 1st Hopf
[psol1br,suc]=SetupPsol(funcs,eqbr_wbifs,bifind(1),'print_residual_info',1,'intervals',50,'degree',4);
figure(1);
xlabel(ax1,'$a_1$',ltx{:});
ylabel(ax1,'$\max(U)-\min(U)$',ltx{:});
psol1br=br_contn(funcs,psol1br,100,'ax',ax1);
[psol1br,pnunst,pdom,triv]=br_stabl(funcs,psol1br);
title(ax1,'Bifurcation diagram for equilibria and periodic orbits')

%% Track periodic orbits from 2nd Hopf
[psol2br,suc]=SetupPsol(funcs,eqbr_wbifs,bifind(2),'print_residual_info',1,'intervals',50,'degree',4);
figure(1);
psol2br=br_contn(funcs,psol2br,50,'ax',ax1);
[psol2br,p2nunst,p2dom,triv2]=br_stabl(funcs,psol2br);
%% Plot profiles x(t) for different parameters
ax3=nexttile(tl1,2);hold(ax3,'on');axis(ax3,'equal')
for i=1:length(psol1br.point)
    pt=psol1br.point(i);
    plot(ax3,pt.mesh*pt.period,pt.profile(1,:),'-');
end
grid(ax3,'on')
xlabel(ax3,'time $t$',ltx{:});
ylabel(ax3,'$U(t)$',ltx{:});
set(ax3,txt{:},lw{:},'box','on');
fig2=figure(2);
fig2.Position(3:4)=[1080,310];
%% Plot 1d bifurcation diagram
figure(3);clf;tl=tiledlayout(1,2,'TileSpacing','tight');
ax4=nexttile(tl,1);
Plot2dBranch(eqbr_wbifs,'ax',ax4);
hold(ax4,'on');
Plot2dBranch({psol1br,psol2br},'ax',ax4);
xlabel(ax4,'$a_1$',ltx{:});
ylabel(ax4,'$\max U$',ltx{:});
set(ax4,txt{:},lw{:},'box','on');
lg4=legend(ax4,'Location','best');
%% Continue Hopf bifurcation in a1,mu0 plane
[hopfbr,suc]=SetupHopf(funcs,eqbr_wbifs,bifind(1),'contpar',[ip.a1,ip.mu0],...
    'step',0.1,'dir',ip.a1,bd{:});
figure(5);clf;ax5=gca;
xlabel(ax5,'$a_1$',ltx{:});
ylabel(ax5,'$\mu_0$',ltx{:});
hopfbr=br_contn(funcs,hopfbr,100,'ax',ax5);
hopfbr=br_rvers(hopfbr);
hopfbr=br_contn(funcs,hopfbr,100,'ax',ax5);
[hopfbr,hnunst,hdom,htriv]=br_stabl(funcs,hopfbr);
title(ax5,'Bifurcation diagram in 2 parameters, a1 and mu0')
[hopfbr_wbifs,htests,hbifind,hbiftype]=LocateSpecialPoints(funcs,hopfbr);
%% Continue fold of periodic orbits
indfold=find(p2nunst==1,1,'first');
[pfuncs,pfoldbr,suc]=SetupPOEV1(funcs,psol2br,indfold,'contpar',[ip.a1,ip.mu0],...
    'step',0.1,'dir',ip.a1,bd{:},'print_residual_info',1);
figure(5);
pfoldbr=br_contn(pfuncs,pfoldbr,30,'ax',ax5);
pfoldbr=br_rvers(pfoldbr);
pfoldbr=br_contn(pfuncs,pfoldbr,30,'ax',ax5);
[pfoldbr,pfnunst,pfdom,pftriv]=br_stabl(pfuncs,pfoldbr);
%% plot results
ax6=nexttile(tl,2);
Plot2dBranch(pfoldbr,'ax',ax6,'funcs',pfuncs);
hold(ax6,'on');
Plot2dBranch(hopfbr_wbifs,'ax',ax6);
xlabel(ax6,'$a_1$',ltx{:});
ylabel(ax6,'$\mu_0$',ltx{:});
set(ax6,txt{:},lw{:});
lg=legend(ax6,'Location','best');
%lg.Layout.Tile=4;
fig3=figure(3);
fig3.Position(3:4)=[1030,560];