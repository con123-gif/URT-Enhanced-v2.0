#!/usr/bin/env python3
"""Independent tests for conditional portal selection and golden-holonomy refinement.

Uses ORIGINAL 7 Nov 2026 all-five/64-history/24-clock construction in this
folder, without replacing its incidence, source, Hbits or D6/Golay checks.
Requires numpy scipy mpmath. No experimental inputs, no third-party code.
"""
import runpy
from pathlib import Path
from math import pi, sqrt
import numpy as np

path=Path(__file__).with_name('cathedral_constructed_joint_dynamics_2026_11_07.py')
z=runpy.run_path(str(path))
E=z['Eglobal']; I=z['Iico']; Q=z['Plinear']; C=z['C']
P3=z['P3']; P5=z['P5']; P=P3+P5
Delta=float(z['Delta']); r=float(z['r']); theta=float(z['theta']);Uh=z['Uh']
H=z['Hbits'];
assert E.shape==(50,8) and I.shape==(12,8) and Q.shape==(12,50)
assert z['D'].shape==(190,190) and H.shape==(64,64) and Uh.shape==(64,20)
assert np.linalg.norm(E.T@E-np.eye(8))<1e-11
assert np.linalg.norm(I.T@I-np.eye(8))<1e-11
assert np.linalg.norm(Q-I@E.T)<1e-11
assert np.linalg.norm(Q@E-I)<1e-11
assert abs(np.linalg.norm(Q,'fro')**2-8)<1e-11

# Eight lowest nonconstant spherical harmonics are forced by Ky Fan's
# variational principle for the round S^2 Dirichlet form (not by q alone).
# The unique low-eigenspace is ell=1 (3 modes, eigenvalue 2) plus ell=2
# (5 modes, eigenvalue 6), with 9th eigenvalue 12, gap 6.
lmax=9
multiplicities=[2*ell+1 for ell in range(1,lmax+1)]
energies=[ell*(ell+1) for ell in range(1,lmax+1)]
spectral=np.concatenate([np.full(d,v) for d,v in zip(multiplicities,energies)])
assert np.all(spectral[:3]==2) and np.all(spectral[3:8]==6)
assert spectral[8]==12 and spectral[:8].sum()==36
# If heat-selected 8D initial span has full-rank low projection, it is
# a graph B over W8; graph transform bound ||B_t||<=exp(-6 t)||B||.
rng=np.random.default_rng(20261108)
Bgraph=rng.normal(size=(len(spectral)-8,8))
for t in [0.05,.1,.3,.5,1.0]:
    Bt=(np.exp(-spectral[8:]*t)[:,None]*Bgraph)*np.exp(spectral[:8]*t)[None,:]
    assert np.linalg.norm(Bt,2)<=np.exp(-6*t)*np.linalg.norm(Bgraph,2)*(1+1e-11)
# Important counterexample: the actual fixed golden-angle, all-axis
# rotation average is NOT ordered by spherical Dirichlet eigenvalues.
# Hence it does not by itself supply the Ky-Fan/heat-selection premise.
from math import sin
averaging=lambda ell:sin((ell+.5)*theta)/((2*ell+1)*sin(theta/2))
assert abs(averaging(3))>abs(averaging(2))
assert abs(averaging(4))>abs(averaging(2))
print('PASS: 8-lowest nonconstant spherical Dirichlet modes are ell=1(3)+ell=2(5), trace 36, gap 6')
print('PASS: isotropic heat selection contracts generic 8-plane deviation at rate >=6')
print('LIMIT: fixed URT golden-angle axis averaging does NOT by itself select ell=1+2')

# Min-norm proof certificate: every QE=I has Q=IE*+R(I-EE*);
# the two terms are Frobenius orthogonal.
rng=np.random.default_rng(20261108)
F=np.eye(50)-E@E.T
R=rng.normal(size=(12,50))
alt=Q+R@F
assert np.linalg.norm(alt@E-I)<2e-10
assert abs(np.linalg.norm(alt,'fro')**2-(8+np.linalg.norm(R@F,'fro')**2))<2e-10
assert np.linalg.norm(alt,'fro')>np.linalg.norm(Q,'fro')+0.01

# Locally facewise, bilinear b(z,w)_f=a_f z_f*w_f; A5 face transitivity
# implies all a_f equal. Unitality fixes a_f=1. This identifies the
# *restricted* pointwise product; the non-locality restriction is assumed.
V=rng.normal(size=50)
zface=C@(Q@V)
pair_hidden=P@(zface*zface)
h3,h5=z['hidden_source'](V)
assert np.linalg.norm(pair_hidden-(h3+h5))<1e-11
assert np.linalg.norm((P3+Delta*P5)@(h3+h5)-(h3+Delta*h5))<1e-11
assert np.linalg.norm(H@Uh@P3-18*Uh@P3)<1e-10
assert np.linalg.norm(H@Uh@P5-16*Uh@P5)<1e-10

# Independent original source check: 3/5 modes and all-five vertices.
for name in z['names']:
    g=z['geom'][name]
    idx=np.arange(g['v_offset'],g['v_offset']+g['V'])
    derivative=2*P@np.diag(zface)@C@Q[:,idx]
    assert np.linalg.norm(derivative)>1e-9

# Clock circle of circumference 24; a=1/k, n=24k.
# Link at resolution k: exp(i charge*theta/k), so the full holonomy
# is always exp(i charge * 24*theta). k=1 = ORIGINAL 24-track clock.
# Spatial theory is not included in this clock refinement.
def laplacian(n,k,charge):
    a=1.0/k
    L=np.zeros((n,n),complex)
    for j in range(n):
        nxt=(j+1)%n
        u=np.exp(1j*charge*theta*a)
        L[j,j]+=1
        L[nxt,nxt]+=1
        L[nxt,j]-=u
        L[j,nxt]-=np.conj(u)
    return L/a**2

def eigen_exact(k,charge,m):
    return 4*k*k*np.sin((2*pi*m/24-charge*theta)/(2*k))**2

# Build a *single* original 50-vertex field value from all five solids.
base=V.astype(complex)
h3_0,h5_0=z['hidden_source'](base)
assert np.linalg.norm(h3_0)>1e-8 and np.linalg.norm(h5_0)>1e-8
# Use a charge-1 harmonic m=9, whose pointwise square excites m=18.
m=18
length=24.0
results=[]
refdelta=2*theta-2*pi*m/24
lim2=refdelta**2
lim_c3=.25-.5/(18+r*r*lim2)
lim_c5=.25-.5/(16+r*r*lim2)
for k in [1,2,4,8,16]:
    n=24*k;a=1.0/k
    j=np.arange(n)
    phase=np.exp(1j*(2*pi*m/n)*j)[:,None]
    h3=phase*h3_0[None,:];h5=phase*h5_0[None,:]
    L2=laplacian(n,k,2)
    if k==1:
        assert np.linalg.norm(L2-z['clock_laplacian'](np.full(24,theta),2))<1e-12
    ell=eigen_exact(k,2,m)
    assert abs(np.linalg.norm(L2@phase-ell*phase)/np.linalg.norm(phase))<5e-11
    assert abs(np.min(np.linalg.eigvalsh(L2))-ell)<1e-9
    A18=18*np.eye(n)+r*r*L2
    A16=16*np.eye(n)+r*r*L2
    # Fourier inversion is an independent check of the n x n inverse on
    # the charge-2 mode, equivalent to the full original source via U_h.
    response3=h3/(18+r*r*ell)
    response5=h5/(16+r*r*ell)
    assert np.linalg.norm(A18@response3-h3)/np.linalg.norm(h3)<5e-10
    assert np.linalg.norm(A16@response5-h5)/np.linalg.norm(h5)<5e-10
    # Full history source y is 64-dimensional per clock site, unchanged.
    y=(response3+Delta*response5)@Uh.T
    assert y.shape==(n,64)
    # Exact original Schur complement, now with quadrature weight a.
    reduced=a*(.25*(np.linalg.norm(h3)**2+Delta**2*np.linalg.norm(h5)**2)
         -.5*np.vdot(h3,response3).real-.5*Delta**2*np.vdot(h5,response5).real)
    coeff3=.25-.5/(18+r*r*ell)
    coeff5=.25-.5/(16+r*r*ell)
    expected=length*(coeff3*np.linalg.norm(h3_0)**2+Delta**2*coeff5*np.linalg.norm(h5_0)**2)
    assert abs(reduced-expected)<1e-9
    assert reduced>=length*((2/9)*np.linalg.norm(h3_0)**2+(7/32)*Delta**2*np.linalg.norm(h5_0)**2)-1e-10
    # Gauge-covariant source transport under local random group elements.
    if k<=4:
        alpha=rng.uniform(-0.7,0.7,n)
        link_phase=theta*a+np.roll(alpha,-1)-alpha
        ypr=y*np.exp(2j*alpha)[:,None]
        h3pr=h3*np.exp(2j*alpha)[:,None]
        h5pr=h5*np.exp(2j*alpha)[:,None]
        # For corrected operator, D(y)_j=y_(j+1)-exp(2i*theta_j)y_j
        def cov_norm(yy,links):
            return a*sum(np.linalg.norm((np.roll(yy,-1,axis=0)-np.exp(2j*links)[:,None]*yy)/a,axis=1)**2)
        assert abs(cov_norm(ypr,link_phase)-cov_norm(y,np.full(n,theta*a)))<1e-8
        assert abs(np.vdot(ypr,(h3pr+Delta*h5pr)@Uh.T)-np.vdot(y,(h3+Delta*h5)@Uh.T))<1e-8
    results.append(dict(k=k,n=n,ell2=ell,energy=reduced,c3=coeff3,c5=coeff5,error_eigen=abs(ell-lim2)))

assert all(results[i]['error_eigen']>results[i+1]['error_eigen'] for i in range(len(results)-1))
# Uniform k>=1 bound: k sin(x/k) monotone increasing for |x|<pi.
min1=eigen_exact(1,1,9)
min2=eigen_exact(1,2,18)
assert min1>0 and min2>0
for k in [2,4,8,16,100,1000]:
    assert eigen_exact(k,1,9)>=min1-1e-13
    assert eigen_exact(k,2,18)>=min2-1e-13
print('PASS: original 190-cochain, 64-history, 50-vertex, 24-clock model')
print('PASS: unique minimum-Frobenius-norm portal Q=I E^T: ||Q||_F^2=8')
print('PASS: face-local unital projected quadratic source and modular Delta ratio')
print('PASS: all five solids contribute to original hidden source')
print('PASS: exact 24-clock k=1 recovered; charge doubling 9->18 preserved for k>=1')
print('PASS: all tested nonzero-k refinements preserve golden full holonomy and gauge covariance')
print('PASS: original full H64 history source Schur inverse agrees with Fourier analytic value')
for x in results:
    print('refine n=%-4d k=%-2d ell2=%.12f energy=%.12f error=%.5e'% (x['n'],x['k'],x['ell2'],x['energy'],x['error_eigen']))
print('continuum ell2=',format(lim2,'.15g'),'c3=',format(lim_c3,'.15g'),'c5=',format(lim_c5,'.15g'))
print('uniform clock gap lower: q=1',format(min1,'.15g'),'q=2',format(min2,'.15g'))
print('IMPORTANT: the minimum-norm/locality axioms and spatial continuum are not derived from primitive URT.')
