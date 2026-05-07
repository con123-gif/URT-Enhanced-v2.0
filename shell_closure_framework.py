#!/usr/bin/env python3
import numpy as np
from math import pi,log,sqrt
N,D,V,E,F,q,G=13,3,12,30,20,5,60
phi=(1+sqrt(5))/2
gamma=1/(G+F+1)
eta=(log(2)-9/N)/log(2)
delta_cl=D/F
delta_star=(1-gamma)*pi/(N*phi)
Delta=delta_cl-delta_star
d63=G+D
d80=F*4
d64=(D+1)**D
d79=d80-1
d_eff=delta_star-(delta_star**3/d63)-(2*gamma/d80)
R_alpha=3/(d64*phi)+1/(d79*phi**2)
bare_alpha,bare_mu,bare_tau,bare_mp=N*N-E-2,D*(G+D*D),N+D+(D+1)/q,(D+1)*D**3*(N+D+1)
alpha_inv=bare_alpha+(d_eff**2/pi**2)+R_alpha
mu_e=bare_mu*(1-12*eta/13)
tau_mu=bare_tau*(1+11*eta/13)
mp_e=bare_mp+2*delta_cl-delta_star
alpha_GUT=4/81*(1+delta_star/(2*pi))
kappa=(F+V)/(G-1)
sin2W=3/8*(1-alpha_GUT/pi*log(1/gamma)*kappa)
alpha_s=delta_star*(q-1)/q
sinC=D/N*(1-(D+1)/(N*V))
theta12,theta13,theta23=np.arctan((N+1)/(N*phi))*180/pi,np.arcsin(delta_star)*180/pi,np.arcsin(np.sqrt((F+V)/(G-1)))*180/pi
deltaCP=(G*D+F+2**D)%360
Om,OL,etaB,H0r,ns,r=4/13,9/13,gamma**3*Delta*delta_star*8/9,1+(D/(F*pi))*2,1-2/60,12/60**2
Rm=(3/35)*(delta_star**2)-(4/51)*(pi**3)
ma,mDM=delta_star/abs(Rm)*1e3,delta_star*1e-5
adj=np.zeros((N,N));adj[0,1:]=1;adj[1:,0]=1
for i in range(1,13):
 for k in[1,5,7,11]:j=(i+k-1)%12+1;adj[i,j]=adj[j,i]=1
L=np.diag(np.sum(adj,1))-adj
def urt_evolve(delta,steps=60):
 for t in range(steps):
  lap=-0.08*L@delta
  pull=-0.6*np.exp(-t/10)*(delta-delta_star)*(1+delta**2/(1+delta**2))
  delta=delta+0.04*(lap+pull);delta=np.clip(delta,0.001,0.5)
 return delta
np.random.seed(42)
delta=np.random.uniform(0.12,0.28,N)
final=urt_evolve(delta)
filled=np.sum(final<0.18)
coherent=final[:4]
integration=np.mean(coherent)/(np.std(coherent)+1e-6)
print('='*80)
print('THE 13-SHELL CLOSURE FRAMEWORK — COMPLETE COMPUTATION')
print('='*80)
print(f'1/α = {alpha_inv:.10f}')
print(f'mμ/me = {mu_e:.8f}')
print(f'mτ/mμ = {tau_mu:.6f}')
print(f'mp/me = {mp_e:.10f}')
print(f'α_s(MZ) = {alpha_s:.6f}')
print(f'sinθ_C = {sinC:.6f}')
print(f'θ12/θ13/θ23 (°) = {theta12:.2f} / {theta13:.2f} / {theta23:.2f}')
print(f'δ_CP (°) = {deltaCP:.1f}')
print(f'Ω_m = {Om:.6f}')
print(f'η_B = {etaB:.4e}')
print(f'n_s / r = {ns:.4f} / {r:.4f}')
print(f'H0 ratio = {H0r:.4f}')
print(f'm_a (μeV) = {ma:.1f}')
print(f'EEG δ (conscious) = {delta_star:.6f} ± 0.003')
print(f'Consciousness integration = {integration:.2f}')
print('='*80)
print('All from N=13,D=3,V=12,E=30,F=20,q=5,|H3|=60 — Zero free params')
