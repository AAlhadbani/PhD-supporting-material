%% compute singularity for branching lemma
% NDDE example, already linearized in assumed zero equilibrium
% 
% d/dt[y1(t) + c y1(t-tau-b-x(t))]=-y1(t-tau-x(t)), [d/dt]y2(t) = - y2(t) - y1(t-tau)
%
% bifurcation parameter a=tau, Hopf bifurcation at a0=tau0=sqrt(3)*pi/6, omega0=2/sqrt(3),
% c0=1/2,b0=pi*sqrt(3)/2
%
% the equation for y2 does not do anything.; it is just present to make
% sure that the code handles multi-dimensional problems correctly.
%
% linearized
%
% d/dt[y1(t) + c y1(t-tau-b)]=-y1(t-tau), [d/dt]y2(t) = - y2(t) - y1(t-tau)
%%
clear
syms s t om a lam b c d tau
assume([s,t,om,a,b,c,d,tau],'real');
assume(om>0)
% useful functions to simplify notation
ipr=@(u,v)sum(u.*v,'all');       % inner product <u,w>_R
vec=@(x)reshape(x,size(x,1)*size(x,2),[]); % reshape n_x x (2m+1) x N into (n_x*(2m+1) x N
ind=@(v,i)v(i,:);
%%
Delta=lam+c*lam*exp(-lam*(tau+b))+exp(-lam*tau);
Dom=subs(Delta,lam,1i*om);
[red,imd]=deal(real(Dom),imag(Dom));
polyeq=simplify(rhs(isolate(red==0,sin(om*(tau+b))))^2+rhs(isolate(imd==0,cos(om*(tau+b))))^2-1);
sinomtau=sqrt(sym(3))/2;
omtau=asin(sinomtau);
csol=solve(rhs(isolate(polyeq==0,sin(om*tau)))==sinomtau,c);
csol=csol(isAlways(csol>0));
om0=2/sqrt(sym(3));
tau0=omtau/om0;
a0=tau0;
c0=simplify(subs(csol,om,om0));
bsol=solve(simplify(subs(red,[om,tau,c],[om0,tau0,c0])),b);
b0=simplify(bsol(isAlways(bsol>0)));
assert(isAlways(0==simplify(subs(Delta,[lam,b,c,tau],[1i*om0,b0,c0,tau0]))))
assert(isAlways(c0>0&c0<1))
assert(isAlways(tau0>0&tau0+b0>0))
%% d/dt[y1(t) + c y1(t-tau-b)]=-y1(t-tau), [d/dt]y2(t) = - y2(t) - y1(t-tau)
n_x=2;
dfx=@(a,y)[-ind(y(-tau),1);-ind(y(0),2)-ind(y(-tau),1)];   % functional f_x(a)
dgx=@(a,y)[c*ind(y(-tau-b),1);0*ind(y(0),1)];  % functional g_x(a)
a=tau; % bifurcation parameter
% fixed parameters
%[     a0,       om0,   tau0,       c0,            b0]=deal(...
%  sym(pi)/12, sym(2),sym(pi)/12,2/sqrt(sym(3)),8/sqrt(sym(3)));
sub0=@(ex)subs(ex,[om,a,c,b],[om0,a0,c0,b0]); % substitute bifurcation parameter values
% characteristic matrix
Id=num2cell(sym(eye(n_x)),1);
Hv=@(v)lam*v+lam*dgx(a,@(t)exp(lam*t)*v)-dfx(a,@(t)exp(lam*t)*v);
Hc=arrayfun(@(v){Hv(v)},Id);
H_expr=cat(2,Hc{:});
H=@(lam_i,a_i)subs(H_expr,[lam,a],[lam_i,a_i]);
% right nullspace
q=null(sub0(H(1i*om0,a0)));
% unscaled left nullspace
p0=null(sub0(H(1i*om0,a0)).');
% partial_lam H in -1i*om0
dHdlam=sub0(subs(diff(H(lam,a),lam),[lam,a],[1i*om0,a0]));
p=p0/(p0.'*dHdlam*q); % properly scaled left nullvector
JCR=@(u)u(:,1)+1i*u(:,2); % convert R^{n_x x 2} to C^{n_x}
JRC=@(u)[real(u),imag(u)]; % convert C^{n_x} to R^{n_x x 2}
% compare to manual formula from text
Dpl=sym([0,-1;1,0]); % D_pl=R_pl'(0)
Rpl=@(s)expm(Dpl*s); % R_pl(s)
% real version of H(-1i*om,a)
Hr=@(u,om,a)om*u*Dpl+om*dgx(a,@(s)u*Dpl*Rpl(om*s))-dfx(a,@(s)u*Rpl(om*s));
% compare to JRC(H)
[zr,zi]=deal(sym('zr',[n_x,1]),sym('zi',[n_x,1]));
assume([zr,zi],'real')
def=simplify(H(-1i*om,a)*JCR([zr,zi])-JCR(Hr([zr,zi],om,a)));
assert(isAlways(all(0==simplify(rewrite(def,'exp')),'All')));
% convert nullspaces to real versions
q1=JRC(conj(q));
q2=q1*Dpl;
p1=JRC(p);
p2=p1*Dpl;
% check right nullspace
assert(isAlways(all(0==simplify(sub0(Hr(q1,om,a))),'all')));
assert(isAlways(all(0==simplify(sub0(Hr(q2,om,a))),'all')));
% check left nullspace
assert(isAlways(0==simplify(ipr(p1,JRC(sub0(H(-1i*om,a)*(zr+1i*zi)))))));
assert(isAlways(0==simplify(ipr(p2,JRC(sub0(H(-1i*om,a)*(zr+1i*zi)))))));
assert(isAlways(0==simplify(ipr(p1,sub0(Hr([zr,zi],om,a))))));
assert(isAlways(0==simplify(ipr(p2,sub0(Hr([zr,zi],om,a))))));
% derivatives of H wrt to om and a
Hr_om=(diff(Hr([zr,zi],om,a),om));
assert(isAlways(all(0==simplify(JRC(subs(diff(H(lam,a),lam),lam,-1i*om)*(zr+1i*zi))*Dpl-Hr_om),'all')));
Hr_om0=simplify(sub0(diff(Hr(q1,om,a),om)));
Hr_a0=simplify(sub0(diff(Hr(q1,om,a),a)));
% branching matrix
assert(isAlways( 0==ipr(p1,Hr_om0)))
assert(isAlways(1==ipr(p2,Hr_om0)))
Mbr=simplify(...
    [ipr(p1,Hr_om0),ipr(p1,Hr_a0);...
     ipr(p2,Hr_om0),ipr(p2,Hr_a0)]) %#ok<*NOPTS>
%% reduced nonlinearity and its derivative at zero
m=2; %number of Fourier modes
R2=@(x)reshape(x,n_x,2*m+1,[]); % convert vector to n_x x (2m+1) matrix
Bm=[1;sqrt(sym(2))*reshape([cos((1:m)*t);sin((1:m)*t)],[],1)]; % basis
Bm_p=@(ex)simplify(int(ex*Bm.',t,[0,2*pi])/(2*pi)); % projection Bm^+
Dm=Bm_p(diff(Bm,t)); % differentiation matrix
Rm=@(s)expm(Dm*s);   % rotation of Fourier modes
ut=sym('u',[n_x,2*m+1]); % dummy arguments
Ftilde_dx=@(ut,om,a)ut*Dm+dgx(a,@(s)ut*Dm*Rm(om*s))-dfx(a,@(s)ut*Rm(om*s))/om;
Fvec=jacobian(vec(Ftilde_dx(ut,om,a)),vec(ut)); % dFtilde/dx as nx*2m+1) x n_x*(2m+1) matrix
q0F=R2(null(sub0(Fvec))); % right nullspace (no scaling needed), only orthogonality
p0F=R2(null(sub0(Fvec.'))); % provisional left nullspace
% check if really nullspace
assert(isAlways(all(sub0(Ftilde_dx(q0F(:,:,1),om0,a0))==0,'all'))); % check if qF1
assert(isAlways(all(sub0(Ftilde_dx(q0F(:,:,2),om0,a0))==0,'all'))); % and qF2 are nullvectors of Ftilde_dx
assert(isAlways(ipr(p0F(:,:,1),sub0(Ftilde_dx(ut,om0,a0)))==0)); % check if qF1
assert(isAlways(ipr(p0F(:,:,2),sub0(Ftilde_dx(ut,om0,a0)))==0)); % check if qF1
% compare to nullspace of Hr(om0,a0)
qF=sym(zeros(n_x,2*m+1,2));
qF(:,2:3,1)=q1;
qF(:,2:3,2)=q2;
assert(isAlways(all(sub0(Ftilde_dx(qF(:,:,1),om0,a0))==0,'all'))); % check if qF1
assert(isAlways(all(sub0(Ftilde_dx(qF(:,:,2),om0,a0))==0,'all'))); % and qF2 are nullvectors of Ftilde_dx
dFom0=sub0(diff(Fvec,om)); % \partial^2_{x,om} Ftilde(0,om0,a0)
Gam=vec(p0F).'*dFom0*vec(qF); % 2x2 scaling matrix left nullspace
DGam=-Gam*Dpl*om0;
pF=R2(vec(p0F)/DGam.');            % rescaled left nullvectors
% check if equal to left nullvector of Hr
assert(isAlways(all(simplify(pF(:,2:3,1)==p1),'all')));
assert(isAlways(all(simplify(pF(:,2:3,2)==p2),'all')));
dFvec_da=sub0(diff(Fvec,a));      % d^2Ftilde_dxda
dFvec_dom=sub0(diff(Fvec,om));    % d^2Ftilde_dxdom
qF1=vec(qF(:,:,1));               % q1 in vector form
Mtr=simplify(vec(pF).'*[dFvec_dom*qF1,dFvec_da*qF1]) % branching matrix for Ftilde
assert(isAlways(all(simplify(Mtr*om0==Mbr),'all')));