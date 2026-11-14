#!/usr/bin/env python3
"""Q109 optional full nonlinear gradient and 2D physical gauge descent.
Reexecutes Q109 original-source full-kernel certificate first; this is
a bounded exploratory calculation, NOT a stable 481D vacuum proof.
"""
from pathlib import Path
import runpy,math
import numpy as np
from scipy.optimize import minimize
r=runpy.run_path(str(Path(__file__).with_name('Q109_NATIVE_FULL_HESSIAN.py')))
v=r['v'];H0=r['H0'];hw=r['hw'];shift=r['shift'];qvals=r['qs']
v61=r['v61'];gamma=r['gamma'];gamma0=r['g0'];inc=r['inc']
g,g5=v61.gamma_matrices()
G5=np.kron(np.eye(48),g5);I192=np.eye(192)
rW=float(v61.R_EXACT)
xsites=[];ysites=[];hops=[]
for l in range(528):
 a,k=divmod(l,11);site=v61.SITES[a]
 b=v61.SITE_INDEX[v61.periodic_shift(site,v61.DIRECTIONS[k])]
 fwd=.5*(g[k+1]-rW*np.eye(4)) if k<3 else (g[0]-np.eye(4))/16
 hops.append(g5@fwd*v61.antiperiodic_sign(site,v61.DIRECTIONS[k]))
 xsites.append(a);ysites.append(b)
hops=np.array(hops)
def action_grad(theta):
 out=0.;grad=np.zeros(528)
 for q,m in qvals:
    h=hw(q*theta)
    e,V=np.linalg.eigh(h)
    den=e[:,None]+shift[None,:]
    assert np.min(abs(den))>1e-6
    out-=m*np.log(abs(den)).sum()
    G=(V*(1/den).sum(axis=1)[None,:])@V.conj().T
    for l in range(528):
        a=xsites[l];b=ysites[l]
        t=hops[l]*np.exp(1j*q*theta[l])
        grad[l]-=2*m*q*np.real(np.trace(G[4*b:4*b+4,4*a:4*a+4]@(1j*t)))
 return float(out),grad
t=float(r['fit'].x)
f0,grad=action_grad(t*v)
assert abs(f0-gamma(t*v))<1e-6
assert np.linalg.norm(inc.T@grad)<1e-7
w=-grad/np.linalg.norm(grad)
assert abs(v@w)<1e-4 and np.linalg.norm(inc.T@w)<1e-8
print('One-line extremum still has full physical gradient norm',np.linalg.norm(grad),flush=True)
def objective(a):
    val,grad=action_grad(a[0]*v+a[1]*w)
    return val-gamma0,np.array([v@grad,w@grad])
fit=minimize(objective,[t,0.],jac=True,method='BFGS',
             options={'maxiter':18,'gtol':1e-5})
val,gg=objective(fit.x)
assert val<r['fit'].fun-1
print('Two-dimensional physical descent',fit.x,'DeltaGamma',val,
      'projected-gradient',np.linalg.norm(gg),'optimizer-success',fit.success,flush=True)
print('Q109 2D DESCENT: PASS; no 481D stationary-vacuum claim')
