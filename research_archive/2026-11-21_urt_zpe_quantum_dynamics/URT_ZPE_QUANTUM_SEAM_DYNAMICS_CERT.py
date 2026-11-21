#!/usr/bin/env python3
"""Real-time Gaussian dynamics of an ACTUAL native URT golden-flux magnetic seam.

Works with the unchanged 3D oriented flux links and Hamiltonian of the
2026-11-21 3D ZPE construction. The controller is external, not derived URT.
All dimensionless energies are in units of hbar*c/ell, times in ell/c.
"""
from __future__ import annotations
import math
import numpy as np
from scipy.linalg import expm, eigh

PHI=(1+math.sqrt(5))/2
THETA=2*math.pi/PHI**2

def phase(eps):
    return float(np.angle(eps*np.exp(-1j*THETA)))

def graph(dims, eps):
    nx,ny,nz=dims
    assert min(dims)>=2
    f=phase(eps)
    L=np.zeros((nx*ny*nz,nx*ny*nz),complex)
    idx=lambda x,y,z:x+nx*(y+ny*z)
    for z in range(nz):
        for y in range(ny):
            for x in range(nx):
                i=idx(x,y,z)
                for xx,yy,zz,power in ((x+1,y,z,z),(x,y+1,z,x),(x,y,z+1,y)):
                    if xx>=nx or yy>=ny or zz>=nz:continue
                    j=idx(xx,yy,zz)
                    w=np.exp(1j*f*power)
                    L[i,i]+=1;L[j,j]+=1;L[i,j]-=w;L[j,i]-=w.conjugate()
    return L

def native_seam(eps):
    # Attach a real 2x2 magnetic sheet to a 2x2x2 magnetic box.
    dims=(2,2,3)
    L1=graph(dims,eps)
    B=np.zeros_like(L1)
    f=phase(eps)
    nx,ny,nz=dims
    idx=lambda x,y,z:x+nx*(y+ny*z)
    for x in range(nx):
        for y in range(ny):
            i,j=idx(x,y,1),idx(x,y,2)
            w=np.exp(1j*f*y)
            B[i,i]+=1;B[j,j]+=1;B[i,j]-=w;B[j,i]-=w.conjugate()
    L0=L1-B
    assert np.linalg.norm(B@B-2*B)<1e-12
    assert abs(np.trace(B).real-8)<1e-12
    assert np.linalg.norm(L0[:8,8:])<1e-12
    assert np.linalg.norm(L0[:8,:8]-graph((2,2,2),eps))<1e-12
    gap=1-math.cos(abs(f)/4)
    assert eigh(L0,eigvals_only=True)[0]>=gap-1e-10
    assert eigh(L1,eigvals_only=True)[0]>=gap-1e-10
    return L0,B,L1,gap

def sqrt_invsqrt(L):
    ev,U=eigh(L)
    assert ev[0]>0
    W=(U*np.sqrt(ev))@U.conj().T
    Winv=(U/np.sqrt(ev))@U.conj().T
    return W,Winv,ev,U

def metric(L,B,gap):
    W,Winv,ev,U=sqrt_invsqrt(L)
    b=U.conj().T@B@U
    w=np.sqrt(ev)
    dW=U@(b/(w[:,None]+w[None,:]))@U.conj().T
    g=float(np.trace(Winv@dW@Winv@dW).real)/4
    A=int(round(np.trace(B).real/2))
    assert g>=-1e-12
    assert g<=A/(4*gap**2)+1e-10
    return g

def finite_ramp(L0,B,T,steps=60):
    """Midpoint-exact quantum Gaussian propagator with explicit quench work ledger.

    Complex coordinates represent the two real canonical coordinates at each
    complex site; the ground energy is Tr(sqrt(K)).
    """
    n=L0.shape[0]
    W,Winv,_,_=sqrt_invsqrt(L0)
    C=np.zeros((2*n,2*n),complex)
    C[:n,:n]=0.5*Winv
    C[n:,n:]=0.5*W
    E0=float(np.trace(W).real)
    identity=np.eye(n)
    dt=T/steps
    work=0.
    for k in range(steps):
        l0=k/steps; lm=(k+.5)/steps; l1=(k+1)/steps
        Kmid=L0+lm*B
        Cqq0=C[:n,:n]
        w1=float(np.trace((lm-l0)*B@Cqq0).real)
        F=np.zeros((2*n,2*n),complex)
        F[:n,n:]=identity; F[n:,:n]=-Kmid
        S=expm(F*dt)
        C=S@C@S.conj().T
        C=(C+C.conj().T)/2
        Cqq1=C[:n,:n]
        w2=float(np.trace((l1-lm)*B@Cqq1).real)
        assert w1>=-1e-11 and w2>=-1e-11
        work+=w1+w2
    L1=L0+B
    Ef=float(np.trace(C[n:,n:]+L1@C[:n,:n]).real)
    E1=float(np.sqrt(eigh(L1,eigvals_only=True)).sum())
    assert Ef>=E1-1e-8
    assert abs((Ef-E0)-work)<1e-8,(Ef-E0,work)
    return work,Ef-E1,E1-E0

def main():
    for eps in (+1,-1):
        L0,B,L1,gap=native_seam(eps)
        gvalues=[]
        for t in (0,.25,.5,.75,1):
            gvalues.append(metric(L0+t*B,B,gap))
        E0=float(np.sqrt(eigh(L0,eigvals_only=True)).sum())
        E1=float(np.sqrt(eigh(L1,eigvals_only=True)).sum())
        ideal=E1-E0
        A=4
        assert A/math.sqrt(12)<=ideal<=A/math.sqrt(gap)
        print(f'eps={eps:+d}, seam_area={A}, gap2={gap:.12f}, ground_work={ideal:.12f}, '
              f'FS_metric_max_sample={max(gvalues):.12f}, FS_metric_bound={A/(4*gap**2):.8f}')
        for T in (1.,3.,10.):
            supplied,heating,ad=finite_ramp(L0,B,T,steps=60)
            assert abs(ad-ideal)<1e-10
            assert supplied>=ideal-1e-8
            print(f'  ramp T={T:4.1f}: work={supplied:.12f}, quantum_excess={heating:.12f}')
    print('PASS: native magnetic seam B>=0 B^2=2B, FS metric bound, finite-time Gaussian Hamiltonian evolution')
    print('PASS: work=delta total quantum energy >= static joining work; source energy explicitly required')
    print('OPEN: autonomous URT controller, preparation of the new sheet, and primitive frequency threshold')

if __name__=='__main__':main()
