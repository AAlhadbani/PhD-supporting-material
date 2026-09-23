%% Periodic orbits near Hopf bifurcation in neutral DDE
% with state-dependent delays
% This demo shows that DDE-Biftool can treat DDEs with nested
% state-dependent delays. The DDE is
% 
% $$\dot [x(t)+c x(t-\tau-b-x(t))=-x(t-\tau-x(t))$$
%%
clear
ddebiftool_path(fullfile('ddebiftool_snapshot/'));
parnames={'tau','b','c'};
cind=[parnames;num2cell(1:length(parnames))];
ip=struct(cind{:});
format compact
c=0.8;
d=acos(1-c^2/2);
b=acos(sin(d)/c)-d;
par0([ip.c,ip.b, ip.tau])=...
        [c,   b, pi/2+d-0.001];
M=[0,1;0,0];
funcs=set_symfuncs(@sym_ndde_hopf,'lhs_matrix',M);
eqbr=SetupStst(funcs,'x',[0;0],'parameter',par0,'contpar',ip.tau);
[eqbr,eqtests,bifind,biftype]=LocateSpecialPoints(funcs,eqbr)
%% Track periodic orbits
[psolbr,suc]=SetupPsol(funcs,eqbr,bifind,'print_residual_info',1,'intervals',50,'degree',12);
figure(2);clf;ax=gca;
xlabel(ax,'$\tau$','Interpreter','latex');
ylabel(ax,'$\max(x)-`min(x)$','Interpreter','latex');
psolbr=br_contn(funcs,psolbr,50,'ax',ax);
title(ax,'Bifurcation diagram for periodic orbits')
%% Plot profiles x(t) for different parameters
figure(3);clf;ax2=gca;hold(ax2,'on');axis(ax2,'equal')
for i=1:length(psolbr.point)
    pt=psolbr.point(i);
    plot(ax2,pt.mesh*pt.period,pt.profile(1,:),'.-');
end
grid(ax2,'on')
xlabel(ax2,'time $t$','Interpreter','latex');
ylabel(ax2,'$x(t)$','Interpreter','latex');
%% Stability of equilibrium at Hopf bifurcation
A=cat(3,[0,0;1,-1],[-1,0;0,0],[0,0;c,0]);
eqdelays=[0,pi/2+d,pi/2+d+b];
% check that these are equal to values in eqbr.point(bifind), the Hopf
% bifurcation point
pthopf=getfield(SetupHopf(funcs,eqbr,bifind),'point');
pthopf.stability=p_stabil(funcs,pthopf,eqbr.method.stability,...
    'min_number_of_eigenvalues',50,'maxsize',1000);
[xxh,parh]=deal(repmat(pthopf.x,1,1+dde_num_delays(funcs)),pthopf.parameter);
Ahopf=funcs.drhs_mf(xxh,parh,{1,'I'},0);
hopfdelays=dde_taufunvec(funcs,xxh,parh).';
assert(norm(A-Ahopf,'fro')<1e-12)
assert(norm(eqdelays-hopfdelays)<1e-12)
%% %% numerically calculate all eigenvalues
stab=dde_stst_eig_cheb(A,eqdelays,'lhs_matrix',M,...
    'min_number_of_eigenvalues',100,'max_number_of_eigenvalues',200)
ev=stab.l0;
asy=log(c)/(eqdelays(3));
[~,idx] = sort(real(ev),'descend');
dom = idx(1:2);                      %the two dominant roots
rest = setdiff(1:numel(ev),dom);
figure(1);
clf; 
hold on
plot(real(ev(rest)),imag(ev(rest)),'bo');
plot(real(ev(dom)), imag(ev(dom)), 'ro','MarkerFaceColor','r');
xline(asy)
xline(asy)
xlim([-0.2,0.1])
ylim([-50,50])
grid on
box on
xlabel('Re(\lambda)')
ylabel('Im(\lambda)')
