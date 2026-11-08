#!/usr/bin/env python3
"""Original Cathedral H190 x H64 x Z24 perturbation theorem regression.

Independent application of standard self-adjoint spectral stability, inspired by
James Montgomery Lockwood's supplied forest-gauge block inequality (not copied).
Recomputes the full nonlocal history Wick correction under a -0.01 rank-one
geometric perturbation using the original Cathedral model and source matrices.
"""
from pathlib import Path
from math import pi, sqrt
import hashlib, runpy
import numpy as np
from scipy.linalg import eigh

ROOT=Path(__file__).resolve().parent
orig=ROOT/'cathedral_constructed_joint_dynamics_2026_11_07.py'
assert orig.is_file(), 'original 7 November Cathedral source required beside script'
z=runpy.run_path(str(orig))
D=z['D']; Cb=z['Cbridge']; E=z['Eglobal']; Qmap=z['Plinear']; C=z['C'];
P3=z['P3']; P5=z['P5']; N=z['N']; r=z['r']; eta=z['eta']; theta=z['theta']; Delta=z['Delta']
H=D@D+Cb; H=(H+H.T)/2; assert H.shape==(190,190)
U=np.zeros((190,50))
for name in z['names']:
    g=z['geom'][name];o=g['offset']; v=g['v_offset']; nv=g['V']
    U[o:o+nv,v:v+nv]=np.eye(nv)
Vsource=U@E
assert np.linalg.norm(Vsource.T@Vsource-np.eye(8))<1e-10
w,V=eigh(H)
mu=float(w[w>1e-8].min()); P0=V[:,w<1e-8]@V[:,w<1e-8].T
assert abs(mu-(3-sqrt(5)))<1e-8
assert np.linalg.norm(P0@Vsource)<1e-10
ell=2-2*np.cos(theta-2*pi*np.arange(N)/N)
clockgap=float(r*r*min(ell)); assert abs(clockgap-0.00255840637528)<1e-9
ell2=2-2*np.cos(2*theta-2*pi*np.arange(N)/N)
w3=.25-.5/(18+r*r*ell2)
w5=Delta**2*(.25-.5/(16+r*r*ell2))
w3d=np.fft.ifft(w3);w5d=np.fft.ifft(w5)
F=C@Qmap@U.T # 20 x 190, original full 50->8->12 map


def full_wick(Hnew):
    """Exact original free Gibbs covariance and 64-history Schur Wick map."""
    eig,V=eigh((Hnew+Hnew.T)/2)
    FV=F@V
    Rm=np.array([(2/eta)*(FV/(eig+r*r*l))@FV.T for l in ell])
    gamma=np.fft.ifft(Rm,axis=0)
    Wd=[]
    for k in range(N):
        Kface = w3d[k]*(P3*np.conj(gamma[k])) +w5d[k]*(P5*np.conj(gamma[k]))
        Wd.append(Qmap.T@C.T@Kface@C@Qmap)
    Mmode=np.fft.fft(np.asarray(Wd),axis=0)
    maxmass=0.; minfull=float('inf'); minq=float('inf')
    for m in range(N):
        T=Mmode[m];T=(T+T.conj().T)/2
        assert np.linalg.eigvalsh(T).min()>-1e-9
        maxmass=max(maxmass, 8*float(np.linalg.eigvalsh(T).max()))
        full=(Hnew +r*r*ell[m]*np.eye(190)-8*U@T@U.T)
        em=float(eigh((full+full.conj().T)/2,eigvals_only=True,subset_by_index=(0,0))[0])
        minfull=min(minfull, em)
    # Full Schur-product upper bound =1/4 Q*C^T [(P3+Delta² P5) o S] C Q
    Sf=gamma[0].real
    Upper=.25*Qmap.T@C.T@((P3+Delta**2*P5)*Sf)@C@Qmap
    beta=8*float(np.linalg.eigvalsh((Upper+Upper.T)/2).max())
    assert maxmass<=beta+1e-8
    return minfull,maxmass,beta,Sf

baseline=full_wick(H)
print('original source SHA256',hashlib.sha256(orig.read_bytes()).hexdigest())
print('H positive-sector gap',mu,'golden holonomy gap',clockgap)
print('baseline full min / actual 8M / ordered 8M upper',baseline[:3])
assert abs(baseline[2]-0.4606159590788976)<1e-8
EPS=.01; alpha=EPS/mu; bound=mu-EPS-baseline[2]/(1-alpha)
assert bound>0
print('epsilon',EPS,'relative covariance inflation',1/(1-alpha))
print('PROVED positive-sector perturbed gap >=',bound,'response per unit source <=',1/bound)
print('PROVED complete 190x24 system gap >=',min(clockgap,clockgap+bound))

rng=np.random.default_rng(20261108)
for name,x in [('original triplet',np.array([1.,0,0,0,0,0,0,0])),
                ('all-eight mixing',rng.normal(size=8))]:
    x=x/np.linalg.norm(x); v=Vsource@x
    Epert=-EPS*np.outer(v,v)
    assert abs(np.linalg.norm(Epert,ord=2)-EPS)<1e-12
    assert np.linalg.norm(Epert@P0)<1e-10
    trial=full_wick(H+Epert)
    assert trial[0]>=clockgap-1e-7,(name,trial[0])
    assert trial[2]<=baseline[2]/(1-alpha)+1e-8
    assert trial[0]>0 and trial[1]<mu-EPS
    print(name,'recomputed full min / actual 8M / ordered 8M upper',trial[:3])
    print('PASS: original 190+64+24 positive source response re-evaluated under norm 0.01 E')

# Fully unconstrained perturbations cannot use the norm-0.01 claim on the
# entire Hilbert space. The exact neutral eigenvalue is below 0.01.
assert clockgap-EPS<0
print('COUNTEREXAMPLE: unrestricted -0.01 projection onto clock/geometry null-mode gives',clockgap-EPS)
print('LOCKWOOD supplied block number (if hypotheses hold)',537/5000-1/100)
print('PURE CATHEDRAL 45 co-closed curvature gap',mu-EPS)
print('ALL TESTS PASSED')