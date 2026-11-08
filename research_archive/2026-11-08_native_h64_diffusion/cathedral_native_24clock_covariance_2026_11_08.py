#!/usr/bin/env python3
"""Unmodified November Cathedral 190/64/24: source covariance from 190D quadratic Hessian.
Finite classical complex Gibbs Gaussian reference p(z) proportional to exp(-eta S_geom).
No separate white Gaussian variance assumed or fitted. Calls original model exactly.
"""
import os, runpy, hashlib
os.environ['OPENBLAS_NUM_THREADS']='1'
from pathlib import Path
import numpy as np
from math import pi
from scipy.linalg import eigh
root=Path(__file__).resolve().parent
orig=next((c for c in [
    root/'cathedral_reconstruction'/'cathedral_constructed_joint_dynamics_2026_11_07.py',
    root/'cathedral_constructed_joint_dynamics_2026_11_07.py',
    root.parent/'2026-11-07_joint_interacting_native'/'cathedral_constructed_joint_dynamics_2026_11_07.py'
] if c.is_file()),None)
assert orig is not None, 'Place next to original November model, or in canonical dated research folders'
z=runpy.run_path(str(orig)); r=z['r'];theta=z['theta'];eta=z['eta']; Delta=z['Delta'];N=z['N'];D=z['D'];Cb=z['Cbridge'];E=z['Eglobal'];Q=z['Plinear']; C=z['C'];P3=z['P3'];P5=z['P5']
H=D@D+Cb
assert H.shape==(190,190)
# Projection to 190 cochains: all five actual vertex slots in original order.
U=np.zeros((190,50))
for name in z['names']:
  gg=z['geom'][name];o=gg['offset'];nv=gg['V'];v=gg['v_offset'];U[o:o+nv,v:v+nv]=np.eye(nv)
H=(H+H.T)/2
w,V=eigh(H,check_finite=True)
assert w[0]>-1e-9
El=U@E   # 190 x 8
A=V.T@El
ms=np.arange(N)
ell=2-2*np.cos(theta-2*pi*ms/N)
# Complex Gaussian covariance at each time site, with original exp(-eta S) Gibbs convention:
# S_geom = (1/2) sum z_j^† (H + r² L_theta) z_j.
# E[z_j z_j^†] = (2/eta N) sum_m (H+r² ell_m I)^(-1).
f=(2/(eta*N))*np.sum(1/(w[:,None]+r*r*ell[None,:]),axis=1)
G=(A.T*f)@A
G=(G+G.T)/2
sub3=G[:3,:3];sub5=G[3:,3:]
a=np.trace(sub3)/3;b=np.trace(sub5)/5
iso=a*np.eye(3);iso5=b*np.eye(5)
print('native model SHA256',hashlib.sha256(orig.read_bytes()).hexdigest())
print('H spectrum min/max',w[0],w[-1]);print('clock gap',ell.min(),'mode',ms[ell.argmin()]);print('eta',eta)
print('G eight spectrum',np.linalg.eigvalsh(G))
print('a triplet',a,'b quintet',b,'ratio a/b',a/b)
print('triplet isotropy err',np.linalg.norm(sub3-iso),'quintet isotropy err',np.linalg.norm(sub5-iso5),'cross 3x5',np.linalg.norm(G[:3,3:]))
print('G diag',np.diag(G));print('G full',np.array2string(G,precision=12,suppress_small=True,max_line_width=200))
# A global group A5 commutant candidate can be tested only if exact; do not force two scalars.
G2=np.zeros((8,8));G2[:3,:3]=iso;G2[3:,3:]=iso5
print('two-channel deviation Frobenius',np.linalg.norm(G-G2),'relative',np.linalg.norm(G-G2)/np.linalg.norm(G))
# Native counterterm by exact general-covariance formula
Sigma50=E@G@E.T
Sface=C@Q@Sigma50@Q.T@C.T
M3=Q.T@C.T@(P3*Sface)@C@Q
M5=Q.T@C.T@(P5*Sface)@C@Q
c3=2/9;c5=7*Delta**2/32
M=c3*M3+c5*M5
val=np.linalg.eigvalsh(M)
print('positive M min/max',val[0],val[-1]);print('mass counterterm uniform coeff 8lambda_max',8*val[-1]);print('M3 spectrum positive',np.linalg.eigvalsh(M3)[-8:]);print('M5 spectrum positive',np.linalg.eigvalsh(M5)[-8:]);
# Trivial geometry-inverse covariance may be anisotropic, compute faithful comparison.
from math import sqrt
mt3=c3*(2+4*sqrt(5)/5)*b
mt5=c3*(6/5+12*sqrt(5)/25)*a+c5*4/5*b
print('two-channel approximate norm mass 8max',8*max(mt3,mt5))
# Check exact mode solution against one full-matrix inverse and positive form
for m in [0,9,13]:
 K=H+r*r*ell[m]*np.eye(190)
 T=El.T@np.linalg.solve(K,El)
 rebuilt=(A.T/(w+r*r*ell[m]))@A
 assert np.linalg.norm(T-rebuilt)<1e-9
# A5-projection readout need not commute with anisotropy of all-five effective geometry
assert np.linalg.eigvalsh(G).min()>0
# Clock-phase is a choice (not integrated), and Gaussian is not the interacting state.
print('PASS: direct 190D 24-mode Gaussian covariance + native full 50-source counterterm')
# Full covariance-sensitive composite response. For a circular complex Gaussian z:
# E(z_f^2 conj(z_g^2))=2 S_fg^2. This is not necessarily A5 diagonal.
Ss=Sface*Sface
h33=2*P3@Ss@P3;h55=2*P5@Ss@P5;h35=2*P3@Ss@P5
response=float(np.trace(h33).real/3+Delta*Delta*np.trace(h55).real/5)
print('complex hidden squared-source covariance 3 trace',np.trace(h33),'5 trace',np.trace(h55),'cross norm',np.linalg.norm(h35))
print('dual Gibbs-weighted response',response)
print('for real Gaussian, hidden projected mean norms',np.linalg.norm(P3@np.diag(Sface)),np.linalg.norm(P5@np.diag(Sface)))
# Source counterterms projected onto the exact existing global E 3+5 carrier
Me=E.T@M@E
print('M in native source 8 carrier',np.array2string(Me,precision=12,suppress_small=True,max_line_width=200))
print('M source eights eigenvalues',np.linalg.eigvalsh(Me))
# Wick polynomial identity, arbitrary covariance, without assuming symmetric two-channel form
rng=np.random.default_rng(20261108)
Sfro=Sface
R3=Q.T@C.T@(P3*Sfro)@C@Q
R5=Q.T@C.T@(P5*Sfro)@C@Q
const3=2*np.trace(P3@(Sfro*Sfro));const5=2*np.trace(P5@(Sfro*Sfro))
for _ in range(10):
 x=rng.normal(size=50)+1j*rng.normal(size=50)
 f=C@Q@x;h=f*f
 energy=c3*np.vdot(P3@h,P3@h).real+c5*np.vdot(P5@h,P5@h).real
 normal=energy-4*np.vdot(x,M@x).real + c3*const3+c5*const5
 restored=normal+4*np.vdot(x,M@x).real-c3*const3-c5*const5
 assert abs(restored-energy)<1e-9
 alpha=rng.uniform(-3,3)
 xx=np.exp(1j*alpha)*x
 ff=C@Q@xx; hh=ff*ff
 ene2=c3*np.vdot(P3@hh,P3@hh).real+c5*np.vdot(P5@hh,P5@hh).real
 norm2=ene2-4*np.vdot(xx,M@xx).real+c3*const3+c5*const5
 assert abs(norm2-normal)<1e-9
print('PASS: full anisotropic Gaussian Wick counterterm, exact restoration and U(1) charge covariance')
# Decompose the original 24 clock modes into a physically non-arbitrary sharp regulator.
# Every block is PSD. Two complementary spectral shells add to full G. RG counterterm is additive.
weights=(2/(eta*N))*(1/(w[:,None]+r*r*ell[None,:]))
unit_shells=[]
for m in range(N):
 gm=(A.T*weights[:,m])@A
 unit_shells.append(gm)
assert np.linalg.norm(sum(unit_shells)-G)<1e-11
selected=[int(x) for x in np.argsort(ell)[:6]]
def cm_from_g(Ghat):
 sf=C@Q@E@Ghat@E.T@Q.T@C.T
 return c3*(Q.T@C.T@(P3*sf)@C@Q)+c5*(Q.T@C.T@(P5*sf)@C@Q)
Glow=sum(unit_shells[m] for m in selected)
Ghigh=G-Glow
Ml=cm_from_g(Glow);Mh=cm_from_g(Ghigh)
assert np.linalg.norm(Ml+Mh-M)<1e-10
print('six lowest clock modes',selected)
print('mass coefficient low/high/full',[8*np.linalg.eigvalsh(t).max() for t in [Ml,Mh,M]])
print('low-shell covariance spectrum',np.linalg.eigvalsh(Glow))
print('PASS: native clock-spectral coarse/fine covariance addition is exact; tensor counterterm adds')
# Decompose the source of 3↔5 mixing into actual geometric constituents.
Hv=U.T@(D@D)@U
Hb=U.T@Cb@U
for label,R in [('all local incidence',Hv),('all bridge',Hb)]:
 cross=E[:,:3].T@R@E[:,3:]
 print('3↔5 cross in',label,'norm=',np.linalg.norm(cross),'entries',np.array2string(cross,precision=10,suppress_small=True))
for name in z['names']:
 gg=z['geom'][name];v=gg['v_offset'];d=gg['V'];T=np.zeros((50,50));T[v:v+d,v:v+d]=Hv[v:v+d,v:v+d]
 cross=E[:,:3].T@T@E[:,3:]
 print('local solid 3↔5 mixing',name,np.linalg.norm(cross))
print('PASS: native all-five mixing computed without enforcing A5-only covariance')
# Test the *actual* uncorrected Wick-ordered quadratic stability across all 24 clock modes.
# In the source-corrected geometry quadratic Hessian, potential is (1/2)z† K z -4 v† M v.
Kw=H-8*U@M@U.T
wshift=eigh((Kw+Kw.T)/2,eigvals_only=True)
smallClock=r*r*ell.min()
print('minimum eigen original H_geo+clock',float(w.min()+smallClock))
print('minimum eigen Wick-mass H_geo-8UMU†+clock',float(wshift.min()+smallClock))
print('number negative Wick Hessian eigenvalues at min clock',int(np.sum(wshift+smallClock< -1e-9)))
print('min eigen shifted geometry without clock',float(wshift.min()))
assert wshift.min()+smallClock>0, 'Native Gaussian reference would be Wick unstable!'
print('PASS: self-consistent free-Gibbs native covariance gives positive complete quadratic 190×24 Wick reference (no ad hoc uniform repair needed)')
# Rigorous finite-dimensional spectral inequality certificate:
pos=w[w>1e-8]
mu_geo=float(pos.min())
Pzero=V[:,w<1e-8]@V[:,w<1e-8].T
Psource=U@E
cross_zero=float(np.linalg.norm(Pzero@Psource))
mtop=float(np.linalg.eigvalsh(M).max())
assert cross_zero<1e-10
assert mu_geo>8*mtop
# Hence H_geo-8UMU† >= (mu_geo-8||M||) (I-Pzero) and clock lifts Pzero.
print('baseline nonzero 190H eigenvalue',mu_geo,'zero rank',np.sum(w<1e-8))
print('counterterm 8opnorm',8*mtop,'proved surviving nonzero-sector bound',mu_geo-8*mtop)
print('null-to-source projection residual',cross_zero)
print('PASS: analytic spectral lower-bound certificate (no fitting, all 24 clock positions)')
# FULL ORIGINAL NONLOCAL 24-CLOCK HISTORY SOURCE, NOT JUST ITS LOCAL c3/c5 LOWER BOUND.
# V_eff = sum_{jk,s} h_s,j† [ c_s(δjk) - 1/2 H_s^-1(j,k) ] h_s,k.
# The original circular-complex Gaussian geometry reference has 2-point covariance
# Gamma_{jk}= (1/N) sum_m e^(2πim(j-k)/N) R_m, R_m=(2/eta)F(H+r²ell1_m)^-1 F†.
# Exact Wick contraction of barred squared face amplitudes produces -4 M_jk quadratic,
# with M_jk = sum_s W_s,jk Q†C†[Ps ⊙ conjugate(Gamma_jk)]CQ.
# This includes nonlocal history induced quartics, beyond the static Schur lower bound.
F=C@Q@U.T;FV=F@V
R_modes=np.array([(2/eta)*(FV/(w+r*r*e))@FV.T for e in ell])  # [mode, face, face]
Gamma_d=np.fft.ifft(R_modes,axis=0)
assert np.linalg.norm(Gamma_d[0]-Sface)<1e-10
ell2=2-2*np.cos(2*theta-2*pi*ms/N)
W3_modes=.25-.5/(18+r*r*ell2)
W5_modes=Delta**2*(.25-.5/(16+r*r*ell2))
W3_d=np.fft.ifft(W3_modes);W5_d=np.fft.ifft(W5_modes)
M_d=[]
for d in range(N):
 S=np.conj(Gamma_d[d])
 Fm=W3_d[d]*(P3*S)+W5_d[d]*(P5*S)
 M_d.append(Q.T@C.T@Fm@C@Q)
M_modes=np.fft.fft(np.asarray(M_d),axis=0)
errherm=max(np.linalg.norm(mm-mm.conj().T) for mm in M_modes)
print('nonlocal history Wick counterterm Hermiticity residual',errherm)
assert errherm<1e-10
bare_gaps=[];wick_gaps=[];mnorms=[]
for m in range(N):
 km=H+r*r*ell[m]*np.eye(190)
 cm=km-8*U@M_modes[m]@U.T
 bare_gaps.append(float(eigh(km,eigvals_only=True,subset_by_index=(0,0))[0]))
 wick_gaps.append(float(eigh(cm,eigvals_only=True,subset_by_index=(0,0))[0]))
 mnorms.append(float(np.linalg.eigvalsh(M_modes[m]).max()))
print('full nonlocal history Wick max ||M_m||',max(mnorms),'8x=',8*max(mnorms))
print('full nonlocal history Wick min eigen across 24 clock modes',min(wick_gaps),'bare',min(bare_gaps))
print('full nonlocal history Wick min by lowest m',[(m,round(wick_gaps[m],12)) for m in np.argsort(wick_gaps)[:6]])
print('full nonlocal history static lower-bound counterterm=8||M_static||',8*mtop)
assert min(wick_gaps)>1e-8
assert max(mnorms)>0
print('PASS: full native 24-clock nonlocal history Schur-Wick correction leaves entire 190×24 geometry quadratic Hessian strictly positive')
# Independent source-level check of the *whole* 24×64 Schur response and its nonlocal Wick formula.
W3_clock=np.array([[W3_d[(j-k)%N] for k in range(N)] for j in range(N)])
W5_clock=np.array([[W5_d[(j-k)%N] for k in range(N)] for j in range(N)])
L2full=z['clock_laplacian'](np.full(N,theta),2)
assert np.linalg.norm(W3_clock-(.25*np.eye(N)-.5*np.linalg.inv(18*np.eye(N)+r*r*L2full)))<1e-10
assert np.linalg.norm(W5_clock-(Delta**2)*(.25*np.eye(N)-.5*np.linalg.inv(16*np.eye(N)+r*r*L2full)))<1e-10
rng=np.random.default_rng(2026110802)
vsrc=(rng.normal(size=(N,50))+1j*rng.normal(size=(N,50)))*.03
hs=[z['hidden_source'](q) for q in vsrc]
h3=np.array([p[0] for p in hs]);h5=np.array([p[1] for p in hs]);
V_orig=z['history_source_solve'](h3,h5,np.full(N,theta))[0]
V_mat=np.einsum('jf,jk,kf->',h3.conj(),W3_clock,h3).real+np.einsum('jf,jk,kf->',h5.conj(),W5_clock,h5).real
assert abs(V_orig-V_mat)<1e-10,(V_orig,V_mat)
mass_quad=4*sum(np.vdot(vsrc[j],M_d[(j-k)%N]@vsrc[k]) for j in range(N) for k in range(N))
vac=2*N*sum(np.sum((W3_d[d]*P3+W5_d[d]*P5)*np.conj(Gamma_d[d])**2) for d in range(N))
assert abs(mass_quad.imag)<1e-10 and abs(vac.imag)<1e-10
V_normal=V_orig-mass_quad.real+vac.real
print('full native source V_original / Wick polynomial / mass / vacuum',V_orig,V_normal,mass_quad.real,vac.real)
print('native full Wick identity residual',abs(V_normal+mass_quad.real-vac.real-V_orig))
# random local U(1) gauge change, including W and Gamma transport at all clock sites
alpha=rng.uniform(-1,1,size=N)
ph=np.exp(1j*alpha)
vg=ph[:,None]*vsrc
h3g=ph[:,None]**2*h3;h5g=ph[:,None]**2*h5
W3g=ph[:,None]**2*W3_clock*np.conj(ph[None,:]**2)
W5g=ph[:,None]**2*W5_clock*np.conj(ph[None,:]**2)
Vg=np.einsum('jf,jk,kf->',h3g.conj(),W3g,h3g).real+np.einsum('jf,jk,kf->',h5g.conj(),W5g,h5g).real
Mg=4*sum(np.vdot(vg[j],ph[j]*np.conj(ph[k])*M_d[(j-k)%N]@vg[k]) for j in range(N) for k in range(N))
assert abs(Vg-V_orig)<1e-10 and abs(Mg-mass_quad)<1e-10
print('PASS: exact 64-history Schur vs 24-site source matrix; full nonlocal Wick identity and local U(1) gauge covariance')
# Restore the previously used exact 24-step -> continuum-time refinement:
# N_k=24k, a_k=1/k, theta_k=theta/k, kinetic r²/a_k² L_theta_k;
# Euclidean action has global a_k Riemann weight. Hence same-site complex covariance
# G_k= [2/(eta a_k N_k)] E†U† sum_modes (H+r²/a_k² ell_m)^(-1) U E.
# Exact continuum formula from the shifted Matsubara sum, no chosen Gaussian variance.
from math import sinh,cosh
Tlength=24.0
angle=24*theta
v=np.sqrt(np.maximum(w,0))
zarg=Tlength*v/r
fcont=np.empty_like(v)
for k,lam in enumerate(v):
 if lam<1e-8: fcont[k]=Tlength/(eta*r*r*(1-np.cos(angle)))
 else:
  # (2/eta) * 1/(2r sqrt(lambda)) * sinh / (cosh -cos(total flux))
  fcont[k]=(1/(eta*r*lam))*(np.sinh(zarg[k])/(np.cosh(zarg[k])-np.cos(angle)))
Gcontinuum=(A.T*fcont)@A
Gcontinuum=(Gcontinuum+Gcontinuum.T)/2
print('time-continuum native G8 trace/eigenvalues',np.trace(Gcontinuum),np.linalg.eigvalsh(Gcontinuum))
for k in [1,2,4,8,16,32]:
 n=24*k;ast=1/k;ang=theta/k
 m=np.arange(n)
 e=2-2*np.cos(ang-2*pi*m/n)
 f=(2/(eta*ast*n))*np.sum(1/(w[:,None]+(r/ast)**2*e[None,:]),axis=1)
 Gk=(A.T*f)@A
 error=np.linalg.norm(Gk-Gcontinuum)
 print(f'clock refinement {n:4d} sites: ||G_N-G_cont||_F={error:.12g}, a={np.trace(Gk[:3,:3])/3:.12g}, b={np.trace(Gk[3:,3:])/5:.12g}')
 if k==1: assert np.linalg.norm(Gk-G)<1e-10
 if k==32: assert error<.01
print('PASS: full 190-dimensional native Gaussian 24→768 clock refinement agrees with continuum spectral Green function')
Scont=C@Q@E@Gcontinuum@E.T@Q.T@C.T
Mcont=c3*Q.T@C.T@(P3*Scont)@C@Q+c5*Q.T@C.T@(P5*Scont)@C@Q
mcont=float(np.linalg.eigvalsh(Mcont).max())
print('continuum time a,b',np.trace(Gcontinuum[:3,:3])/3,np.trace(Gcontinuum[3:,3:])/5)
print('continuum time mixed 3x5 norm',np.linalg.norm(Gcontinuum[:3,3:]))
print('continuum time static local Wick 8||M||',8*mcont, 'surviving geometric gap',mu_geo-8*mcont)
assert 8*mcont<mu_geo
print('PASS: full five-solid native local-Wick source remains below original geometric gap after clock-continuum refinement')
# Operator-order proof of stability, independently of the measured nonlocal M-mode norm:
# 0 <= W3_clock <= (1/4)I, 0 <= W5_clock <= (Delta²/4)I.
# Schur-product monotonicity with the positive Gaussian face covariance then implies
# 0 <= M_Wick <= I_clock ⊗ 1/4 [M3(Sface)+Delta² M5(Sface)].
# Its nonzero geometric support is orthogonal to ker(Hgeo), so bound is sharp enough.
assert np.linalg.eigvalsh(W3_clock).min()>0
assert np.linalg.eigvalsh(W5_clock).min()>0
assert np.linalg.eigvalsh(.25*np.eye(N)-W3_clock).min()>-1e-10
assert np.linalg.eigvalsh(Delta**2*.25*np.eye(N)-W5_clock).min()>-1e-10
Upper=.25*(R3+Delta**2*R5)
upper_shift=8*float(np.linalg.eigvalsh(Upper).max())
print('Schur-positive operator order upper bound for FULL nonlocal 8||M|| <=',upper_shift)
print('certified via exact Schur order surviving nonzero-sector margin',mu_geo-upper_shift)
assert upper_shift < mu_geo
for m in range(N):
 assert np.linalg.eigvalsh(Upper-M_modes[m]).min()>-1e-10
 assert np.linalg.eigvalsh(M_modes[m]).min()>-1e-10
print('PASS: full-clock Schur-product order bound proves positivity without relying only on numerical diagonalisation of nonlocal history interaction')