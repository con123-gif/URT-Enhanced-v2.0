#!/usr/bin/env python3
"""Verify native H64 eliminated-history memory kernel and rigorous bounds."""
import itertools,math
import numpy as np
from scipy.linalg import expm,null_space
from scipy.integrate import quad_vec
phi=(1+math.sqrt(5))/2
u=np.array([(0,1,phi),(0,-1,phi),(1,phi,0),(-1,phi,0),
            (phi,0,1),(phi,0,-1)],float)/math.sqrt(1+phi**2)
s=np.array(list(itertools.product((-1.,1.),repeat=6)))
lookup={tuple(map(int,z)):i for i,z in enumerate(s)}
H=15*np.eye(64)
for i,z in enumerate(s):
    for j in range(6):
        for k in range(j+1,6):
            w=z.copy();w[j]*=-1;w[k]*=-1
            H[i,lookup[tuple(map(int,w))]]-=1
x=s@u;Q=np.sum(x*x,axis=1)
quad=np.column_stack([x[:,0]**2-x[:,1]**2,
    x[:,0]**2+x[:,1]**2-2*x[:,2]**2,
    x[:,0]*x[:,1],x[:,0]*x[:,2],x[:,1]*x[:,2]])
source=np.column_stack([np.ones(64),np.prod(s,axis=1),s,quad])
V,_=np.linalg.qr(source)
R=null_space(V.T)
assert R.shape==(64,51) and np.linalg.norm(V.T@R)<1e-12
for lam in [.002489189840420,1.]:
    HH=H+lam*np.diag(Q)
    A=V.T@HH@V;C=V.T@HH@R;D=R.T@HH@R
    dmin=10+lam*(6-2*math.sqrt(5))
    dmax=18+lam*(6+2*math.sqrt(5))
    assert np.linalg.eigvalsh(D)[0]>dmin-1e-10
    assert np.linalg.eigvalsh(D)[-1]<dmax+1e-10
    assert np.allclose(np.sort(np.linalg.eigvalsh(C@C.T))/lam**2,
       [19/5]*5+[8]*6+[12]*2,atol=1e-8)
    for t in [0,.05,.5,2]:
        mem=C@expm(-t*D)@C.T
        emin,emax=np.linalg.eigvalsh((mem+mem.T)/2)[[0,-1]]
        assert emin > (19/5)*lam**2*math.exp(-t*dmax)-1e-10
        assert emax < 12*lam**2*math.exp(-t*dmin)+1e-10
    integrated=C@np.linalg.solve(D,C.T)
    emin,emax=np.linalg.eigvalsh((integrated+integrated.T)/2)[[0,-1]]
    assert emin>(19/5)*lam**2/dmax-1e-10
    assert emax<12*lam**2/dmin+1e-10
    t=.12
    psi0=V[:,0]
    up=V.T@expm(-t*HH)@psi0
    deriv=-V.T@HH@expm(-t*HH)@psi0
    mem,_=quad_vec(lambda tau:C@expm(-(t-tau)*D)@C.T@
        (V.T@expm(-tau*HH)@psi0),0,t,epsabs=1e-11)
    residual=np.linalg.norm(deriv-(-A@up+mem))
    assert residual<1e-10,residual
    print(f"PASS lambda={lam}: all-time memory bounds and exact evolution residual={residual:.3e}")
