clear
ddebiftool_path(['C:\Users\aa1366\OneDrive - University of Exeter\Desktop\year4\matlab\dde_biftool_v3.2a3']);
format compact
c=0.9;
d=acos(1-c^2/2);
b=acos(sin(d)/c)-d;
tau=[0,pi/2+d,pi/2+d+b];
A=cat(3,[0,0;1,-1],[-1,0;0,0],[0,0;c,0]);
M=[0,1;0,0];
stab=dde_stst_eig_cheb(A,tau,'lhs_matrix',M,...
    'min_number_of_eigenvalues',100,'max_number_of_eigenvalues',200)
ev=stab.l0;
asy=log(c)/(tau(3));
figure(1);clf;
plot(real(ev),imag(ev),'bo');
grid on
xline(asy)
xlim([-0.1,0.1])
ylim([-50,50])
grid on
xlabel('Re (\lambda)')
ylabel('Im (\lambda)')
