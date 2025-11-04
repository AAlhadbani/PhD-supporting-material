%% plot 2d bifurcation diagram
%
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%
clear
load('LKbifs');
figure(4);clf
ppd=getpar(ip.phi,pdbr);
epd=getpar(ip.eta,pdbr);
ppf=getpar(ip.phi,mwfoldbr);
epf=getpar(ip.eta,mwfoldbr);
plot([-4,8],par(ip.eta)*[1,1],'k-','linewidth',2);
hold on
plot(ph,eh,'ro-',...
    ppd,epd,'ks-','linewidth',2);
plot(ppf,epf,'d-','color',[0,0.5,0],'linewidth',2);
plot( pf,ef,'b.-', pf2,ef2,'b.-', pf2+2*pi,ef2,'b.-','linewidth',2);
axis([-4,8,0,0.01]);
grid on
set(gca,tdeco{:});
legend({'1d bif','RWHopf','MW PD','MW,fold','RWfold'},'location','eastoutside');
xlabel('$\phi$',ldeco{:});
ylabel('$\eta$',ldeco{:});
title('bifs of rotating and modulated waves in Lang-Kobayashi system',tdeco{:});
