#!/usr/bin/env python3
"""Exact-identity and independent spectral tests of metric response of the
same standalone URT golden-flux Gaussian vacuum. No dark-energy fitting.
SciPy/NumPy local certificate; nonzero exit means a test failed.
"""
import math
import numpy as np
from scipy.linalg import eigh

PHI = (1 + math.sqrt(5)) / 2
THETA = 2 * math.pi / PHI**2


def components(N, eps):
    assert N >= 2 and eps in (-1, 1)
    f = float(np.angle(eps * np.exp(-1j * THETA)))
    X = np.zeros((N*N, N*N), dtype=complex)
    Y = np.zeros_like(X)
    for y in range(N):
        for x in range(N):
            i = x + N*y
            if x+1 < N:
                j = i+1
                X[i,i] += 1; X[j,j] += 1
                X[i,j] -= 1; X[j,i] -= 1
            if y+1 < N:
                j = i+N
                z = np.exp(1j*x*f)
                Y[i,i] += 1; Y[j,j] += 1
                Y[i,j] -= z; Y[j,i] -= np.conj(z)
    assert np.linalg.norm(X-X.conj().T) < 1e-12
    assert np.linalg.norm(Y-Y.conj().T) < 1e-12
    return X, Y, f


def entropy_site_cut(eigen, unitary, N):
    # Same pure complex Gaussian vacuum: one canonical complex oscillator per site.
    w = (unitary * np.sqrt(eigen)) @ unitary.conj().T
    v = (unitary / np.sqrt(eigen)) @ unitary.conj().T
    inds = [x+N*y for y in range(N) for x in range(N//2)]
    wa,va = w[np.ix_(inds,inds)],v[np.ix_(inds,inds)]
    val, vec=eigh(va)
    assert np.min(val)>0
    sq=(vec*np.sqrt(val))@vec.conj().T
    eig=eigh(sq@wa@sq,eigvals_only=True)
    assert min(eig)>=1-1e-9
    occupation=(np.sqrt(np.maximum(eig,1.))-1.)/2
    h=lambda n: (n+1)*math.log1p(n)-n*math.log(n) if n>1e-12 else 0.
    return 2*sum(h(float(n)) for n in occupation)


def data(X,Y,ax,ay,N,entropy=False):
    Kx=X/ax**2; Ky=Y/ay**2
    K=Kx+Ky
    eig,U=eigh(K)
    assert np.min(eig)>0
    e=float(np.sqrt(eig).sum())
    # Hellmann-Feynman: -(∂E/∂ln ai) = Tr K^-1/2 K_i
    xx=np.real(np.diag(U.conj().T@Kx@U))
    yy=np.real(np.diag(U.conj().T@Ky@U))
    tx=float((xx/np.sqrt(eig)).sum())
    ty=float((yy/np.sqrt(eig)).sum())
    volume=(N**2)*ax*ay
    out={'E':e,'S':entropy_site_cut(eig,U,N) if entropy else None,
         'rho':e/volume,'px':tx/volume,'py':ty/volume,
         'v':volume, 'spec_min':float(eig[0])}
    assert abs(out['px']+out['py']-out['rho'])<=1e-10*out['rho']
    assert out['px']>0 and out['py']>0
    return out


def check(N,eps):
    X,Y,f=components(N,eps)
    L=X+Y
    # Preserve exact ORIGINAL N=2 graph and golden flux sector spectrum.
    if N==2:
        spec=eigh(L,eigvals_only=True)
        expected=sorted([2-2*math.cos(abs(f)/4),2+2*math.cos(abs(f)/4),
                         2-2*math.sin(abs(f)/4),2+2*math.sin(abs(f)/4)])
        assert np.max(np.abs(spec-expected))<1e-12

    d=data(X,Y,1.,1.,N,True)
    # Isotropic 90-degree rotation => x and y stresses coincide (even in magnetic field).
    assert abs(d['px']-d['py'])<=1e-10*d['rho']
    assert abs(d['px']/d['rho']-.5)<1e-10

    a=math.pi/math.e  # exact URT radial step, used only as physical-scale hypothesis
    scaled=data(X,Y,a,a,N,True)
    assert abs(scaled['E']/d['E'] -1/a)<1e-12
    assert abs(scaled['rho']/d['rho'] -1/a**3)<1e-12
    assert abs(scaled['S']-d['S'])<1e-9
    assert abs(scaled['px']/scaled['rho']-.5)<1e-10

    # Anisotropic metric: no new coupling; check two independent lattice lengths.
    ax=1.17;ay=.83
    anis=data(X,Y,ax,ay,N,True)
    h=1e-5
    for name,ii in [('px',0),('py',1)]:
        args=[ax,ay]
        args[ii]*=math.exp(h)
        p=data(X,Y,*args,N)['E']
        args=[ax,ay]
        args[ii]*=math.exp(-h)
        m=data(X,Y,*args,N)['E']
        deriv=(p-m)/(2*h)
        predicted=-anis[name]*anis['v']
        assert abs(deriv-predicted)<4e-7+abs(predicted)*1e-8,(N,eps,name,deriv,predicted)

    # Ward/Euler identity under any simultaneous physical length rescaling.
    for t in (.91,1.22):
        scaled_anis=data(X,Y,t*ax,t*ay,N)
        assert abs(scaled_anis['E']/anis['E']-1/t)<1e-12
        assert abs(scaled_anis['rho']/anis['rho']-1/t**3)<1e-12

    # Site-local U(1) conjugation preserves E, S and both mechanical pressures.
    phases=np.exp(1j*THETA*np.arange(N*N)/(N*N+3))
    Gx=phases[:,None]*X*np.conj(phases)[None,:]
    Gy=phases[:,None]*Y*np.conj(phases)[None,:]
    gauge=data(Gx,Gy,ax,ay,N,True)
    for key in ('E','rho','px','py','S'):
        assert abs(gauge[key]-anis[key])<1e-9,key
    return d,anis


def main():
    for N in (2,4,6,8,10):
        for eps in (-1,1):
            d,anis=check(N,eps)
            print('N=%d eps=%+d E0=%.11f S/kB=%.11f rho2D=%.11f px/rho=%.12f py/rho=%.12f anis_px/rho=%.9f'%
                  (N,eps,d['E'],d['S'],d['rho'],d['px']/d['rho'],d['py']/d['rho'],anis['px']/anis['rho']))
    print('PASS: same golden-flux Hamiltonian, static homogeneous metric stresses, exact p_x+p_y=rho, w_2D=1/2')
    print('PASS: URT shell length scaling E~a^-1, rho~a^-3, entanglement entropy invariant at fixed N')
    print('PASS: anisotropic Feynman-Hellmann stresses, local gauge invariance, original N=2 spectrum')
    print('LIMIT: quantization and metric interpretation are extra hypotheses; no derived 3+1D GR or dark energy.')

if __name__=='__main__':main()
