#!/usr/bin/env python3
"""Exact gauge-invariant ON-SITE squeezing of native URT magnetic vacuum and conjugate idler.

The signal Hamiltonian is the unchanged complex 3D golden-flux Laplacian; the
idler is its complex-conjugate (opposite-flux) copy. Canonical complex sites
have two real oscillator polarizations. The local squeeze is a physical
POSTULATE; it preserves CCR and local gauge symmetry and needs pump work.
"""
import math
import numpy as np
from scipy.linalg import eigh

phi=(1+math.sqrt(5))/2
theta=2*math.pi/phi**2
alpha=math.pi/math.e
r=math.acosh(alpha)
s=math.sinh(r)
nbar=s*s
assert abs(alpha*alpha-s*s-1)<1e-14

def graph(dims,eps):
    nx,ny,nz=dims
    f=float(np.angle(eps*np.exp(-1j*theta)))
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
                    L[i,i]+=1;L[j,j]+=1
                    L[i,j]-=w;L[j,i]-=w.conjugate()
    return L

def realify(M):
    return np.block([[M.real,-M.imag],[M.imag,M.real]])

def posroot(K):
    lam,U=eigh(K)
    assert min(lam)>0
    W=(U*np.sqrt(lam))@U.T
    Winv=(U/np.sqrt(lam))@U.T
    return W,Winv

def block2(A,B):
    z=np.zeros_like(A)
    return np.block([[A,z],[z,B]])

def test(eps):
    # Native new 2x2 magnetic sheet from physically present 3D z-layer.
    full=graph((2,2,3),eps)
    B=np.zeros_like(full)
    f=float(np.angle(eps*np.exp(-1j*theta)))
    idx=lambda x,y,z:x+2*(y+2*z)
    for x in range(2):
        for y in range(2):
            i,j=idx(x,y,1),idx(x,y,2)
            w=np.exp(1j*f*y)
            B[i,i]+=1;B[j,j]+=1
            B[i,j]-=w;B[j,i]-=w.conjugate()
    split=full-B
    L=split[8:,8:]
    assert np.max(abs(split[:8,8:]))<1e-13
    m=L.shape[0]
    # Idler is opposite flux: Li=L* (time reverse), not an invented spectrum.
    Ks=realify(L)
    Ki=realify(L.conj())
    C=np.diag(np.r_[np.ones(m),-np.ones(m)])
    d=2*m
    assert np.linalg.norm(Ki-C@Ks@C)<1e-12
    Ws,Winvs=posroot(Ks)
    Wi,Winvi=posroot(Ki)
    assert np.linalg.norm(Wi-C@Ws@C)<1e-10
    I=np.eye(d)
    # Site-local gauge-invariant generator Qs^T C Pi + Ps^T C Qi:
    # Q_s' = alpha Q_s+s C Q_i; P_s' = alpha P_s-s C P_i.
    SQ=np.block([[alpha*I,s*C],[s*C,alpha*I]])
    SP=np.block([[alpha*I,-s*C],[-s*C,alpha*I]])
    z=np.zeros_like(SQ)
    S=np.block([[SQ,z],[z,SP]])
    J=np.block([[z,np.eye(2*d)],[-np.eye(2*d),z]])
    assert np.linalg.norm(S.T@J@S-J)<1e-11
    assert np.linalg.norm(SQ@SP.T-np.eye(2*d))<1e-11
    # Gauge G_s=e^(i chi_x) on signal and G_i=complex conjugate on idler.
    chis=theta*(np.arange(m)+1)/17
    D=np.diag(np.exp(1j*chis))
    Gs=realify(D)
    Gi=realify(D.conj())
    G=block2(Gs,Gi)
    Gfull=block2(G,G)
    assert np.linalg.norm(G@SQ-SQ@G)<1e-11
    assert np.linalg.norm(G@SP-SP@G)<1e-11
    assert np.linalg.norm(Gfull@S-S@Gfull)<1e-11
    # Exact Gaussian ground state covariances and local pulse energy ledger.
    CQ=block2(.5*Winvs,.5*Winvi)
    CP=block2(.5*Ws,.5*Wi)
    Sigma=block2(CQ,CP)
    Sigmad=S@Sigma@S.T
    q=Sigmad[:2*d,:2*d]
    p=Sigmad[2*d:,2*d:]
    def energy(k,q0,p0):return .5*float(np.trace(p0+k@q0).real)
    Es0=energy(Ks,CQ[:d,:d],CP[:d,:d])
    Ei0=energy(Ki,CQ[d:,d:],CP[d:,d:])
    Es1=energy(Ks,q[:d,:d],p[:d,:d])
    Ei1=energy(Ki,q[d:,d:],p[d:,d:])
    assert abs(Es0-Ei0)<1e-10
    assert abs(Es0-float(np.sqrt(eigh(L,eigvals_only=True)).sum()))<1e-10
    gain=math.cosh(2*r)
    assert abs(Es1-gain*Es0)<1e-10
    assert abs(Ei1-gain*Ei0)<1e-10
    Wpump=(Es1+Ei1)-(Es0+Ei0)
    expected=4*nbar*Es0
    assert abs(Wpump-expected)<1e-10
    assert abs(Wpump/Es0-4*((math.pi/math.e)**2-1))<1e-12
    # Entanglement: reduced signal covariance multiplied by cosh(2r).
    assert np.linalg.norm(q[:d,:d]-gain*CQ[:d,:d])<1e-10
    assert np.linalg.norm(p[:d,:d]-gain*CP[:d,:d])<1e-10
    print(f'eps={eps:+d}: E_native_sheet={Es0:.12f}, local_pump_cost={Wpump:.12f}, '
          f'ratio={Wpump/Es0:.12f}, canon_s={s:.12f}, F={abs(f):.12f}')

for e in (+1,-1):test(e)
print('PASS: unchanged native golden-flux sheet, conjugate-flux idler, exact onsite local gauge covariance,')
print('      real symplectic CCR, two-polarization Gaussian work, no fitted coefficients')
print('CONDITIONAL: externally controlled squeeze r=acosh(pi/e); no derived pump oscillator, rate or transfer to new sheet ground')
