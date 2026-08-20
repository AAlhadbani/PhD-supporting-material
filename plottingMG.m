clear
load('MGresults.mat')
get_par=@(br,i)arrayfun(@(x)x.parameter(i),br.point)
get_x=@(br)arrayfun(@(p)p.x(1),br.point)
get_xmax=@(br)arrayfun(@(p)max(p.profile(1,:)),br.point)
tau_eq=get_par(nontriv_eqs,ind.tau)
x_eq=get_x(nontriv_eqs)
tau_po=get_par(per_orb,ind.tau)
xmax_po=get_xmax(per_orb)
get_xmax=@(br)arrayfun(@(p)max(p.profile(1,:)),br.point)
GetStability(nontriv_eqs)
figure(1)
clf
plot(tau_eq(1:ind_hopf),x_eq(1:ind_hopf),'-o','DisplayName','stable equilibrium','Linewidth',1)
hold on 
plot(tau_eq(ind_hopf:end),x_eq(ind_hopf:end),'--','DisplayName','unstable equilibrium','Linewidth',2)
plot(tau_po,xmax_po,'-o','DisplayName','stable peridic orbit','Linewidth',1)
xlim([0,1])
legend('Stable equilibrium', ...
       'Unstable equilibrium', ...
       'Stable periodic orbit (\tau \leq 1)','Location','northwest')
 ylabel('max x');
    xlabel('\tau')
    set(gcf, 'Position', [50, 50, 100, 70])  % [left, bottom, width, height]

    exportgraphics(figure(1),'MGbif1d.pdf')
