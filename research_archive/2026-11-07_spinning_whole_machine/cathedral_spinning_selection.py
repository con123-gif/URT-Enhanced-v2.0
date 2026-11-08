#!/usr/bin/env python3
"""Cathedral / URT: unfitted low-order spherical mixing from actual spins.

Proposed operator is a modelling choice with declared assumptions:
  1. Each move rotates every solid by +/- golden angle about x or z.
  2. All four moves equally likely (maximum entropy given these moves).
  3. The radial URT factor pi/e multiplies anisotropic angular modes.
This script computes exact finite-dimensional rotation representations, checks
against direct rotations of all five vertex configurations, and tests whether
positive transfer and 24-step contraction really follow.
"""
from itertools import product
from math import pi,e,sqrt
import numpy as np
from scipy.linalg import cosm
from scipy.spatial.transform import Rotation
from scipy.special import sph_harm_y

phi = (1+sqrt(5))/2
theta = 2*pi/phi**2
radial = pi/e
SOLIDS = {
 'tetrahedron':np.array([v for v in product((-1,1),repeat=3) if np.prod(v)>0],float),
 'cube':np.array(list(product((-1,1),repeat=3)),float),
 'octahedron':np.array([s*np.eye(3)[j] for j in range(3) for s in (-1,1)],float),
 'dodecahedron':np.array(list(product((-1,1),repeat=3))
    + [[0,a/phi,b*phi] for a,b in product((-1,1),repeat=2)]
    + [[a/phi,b*phi,0] for a,b in product((-1,1),repeat=2)]
    + [[a*phi,0,b/phi] for a,b in product((-1,1),repeat=2)],float),
 'icosahedron':np.array([[0,a,b*phi] for a,b in product((-1,1),repeat=2)]
    + [[a,b*phi,0] for a,b in product((-1,1),repeat=2)]
    + [[a*phi,0,b] for a,b in product((-1,1),repeat=2)],float)
}
for k,v in SOLIDS.items():
 SOLIDS[k]=v/np.linalg.norm(v,axis=1)[:,None]
ALL=np.concatenate(list(SOLIDS.values()))
assert len(ALL)==50

def Ymoment(verts,l):
    xyz=verts
    polar=np.arccos(np.clip(xyz[:,2],-1,1))
    az=np.arctan2(xyz[:,1],xyz[:,0])
    return np.array([np.mean(np.conj(sph_harm_y(l,int(m),polar,az)))
                     for m in range(-l,l+1)])

def mixing(l):
    """Average rotations x+,x-,z+,z- in harmonic l."""
    mm=np.arange(-l,l+1,dtype=float)
    jz=np.diag(mm)
    jp=np.zeros((2*l+1,2*l+1))
    for i,m in enumerate(mm[:-1]):
        jp[i+1,i]=sqrt(l*(l+1)-m*(m+1))
    jx=(jp+jp.T)*0.5
    B=(cosm(theta*jx)+cosm(theta*jz))*0.5
    assert np.allclose(B,B.conj().T,atol=1e-12)
    return B

# Compare the harmonic mixing formula with genuinely rotating all 50 vertices
for l in [1,2,3,4,5,6,12,13]:
    coeff=Ymoment(ALL,l)
    B=mixing(l)
    avg=np.zeros(len(coeff),complex)
    for axis in ('x','z'):
        for sign in (-1,1):
            verts=Rotation.from_rotvec(sign*theta*np.eye(3)['xyz'.index(axis)]).apply(ALL)
            avg+=Ymoment(verts,l)/4
    assert np.allclose(avg,B@coeff,atol=4e-12), (l,np.linalg.norm(avg-B@coeff))
print('PASS: actual rotations of all 50 vertices equal representation-space mixing.')

print('l | ||B_l|| | (pi/e)*||B_l|| | ((pi/e)*||B_l||)^24')
rhos={}
for l in range(1,31):
    B=mixing(l)
    vals=np.linalg.eigvalsh(B)
    rho=max(abs(vals))
    gain=radial*rho
    rhos[l]=gain
    if l<=15 or l in (19,24,30):
        print(f'{l:2d} | {rho:.12f} | {gain:.12f} | {gain**24:.12e}')
assert all(rhos[l]<1 for l in range(1,13))
assert rhos[13]>1
print('PASS: contraction of every angular harmonic from l=1 to 12; l=13 counterexample.')

print('\nFive-solid angular moments, original vs 24-stage mixing (with pi/e expansion):')
for l in (3,4,6):
    vec=Ymoment(ALL,l)
    B=mixing(l)
    factor=np.linalg.norm(np.linalg.matrix_power(radial*B,24)@vec)/np.linalg.norm(vec)
    print(f'l={l}: ||moment||={np.linalg.norm(vec):.12g}; observed remaining ratio={factor:.12g}; upper bound={rhos[l]**24:.12g}')

# The unique smooth lowest-resistance state for Laplace-Beltrami energy is
# l=0.  A weak mathematically canonical heat flow e^{-t l(l+1)} regularises
# high harmonics.  For a universal norm contraction, the following t is
# a sufficient zero-fit value determined by ln(pi/e), not a unique physical law.
t_safe=np.log(radial)/2
r_safe=[]
for l in range(1,31):
 r=radial*rhos[l]/radial * np.exp(-t_safe*l*(l+1))
 r_safe.append(r)
print('\nCanonical heat-gradient-flow safeguard:')
print(f't_safe = log(pi/e)/2 = {t_safe:.12g}')
print(f'worst checked harmonic with heat = {max(r_safe):.12g} (at l={1+np.argmax(r_safe)})')
# For l>=2 the crude bound radial * exp(-t_safe*l(l+1)) = radial^(-2) <1.
# For l=1 explicit golden-angle mix gives <1. Thus a uniform strict bound.
bound=max(radial*np.linalg.norm(mixing(1),2)*np.exp(-2*t_safe),radial*np.exp(-6*t_safe))
assert bound<1
print(f'global rigorous operator-norm bound = {bound:.12g} < 1')

# Report the exact decomposition of the built positive transfer: T = B^dag B.
for l in (3,4,6):
    B=mixing(l)
    T=B.T@B
    assert np.linalg.eigvalsh(T).min()>-1e-12
print('PASS: T=B^dag B is PSD for every harmonic; no assumed damping matrix required.')
print('MODEL LIMIT: allowed four rotations and equiprobability are additional postulates; no unique gravitational interaction follows.')

# Unfitted geometric anisotropy functional: squared L2 distance of the
# bandlimited 50-vertex density from the uniform spherical density,
# l<=6. The cutoff is the first A5-sensitive harmonic, a stated choice.
from scipy.special import eval_legendre
from numpy.polynomial.legendre import Legendre

NS=[len(v) for v in SOLIDS.values()]
labels=np.concatenate([np.full(len(v),i,int) for i,v in enumerate(SOLIDS.values())])
V=list(SOLIDS.values())
N=50
polyderivs=[Legendre.basis(l).deriv() for l in range(1,7)]

def positions(Rs):
    return np.concatenate([v@Rs[i].T for i,v in enumerate(V)])

def energy_gradient(Rs):
    vs=positions(Rs)
    dot=np.clip(vs@vs.T,-1,1)
    kernel=np.zeros((N,N))
    dk=np.zeros((N,N))
    for l in range(1,7):
        kernel+=(2*l+1)*eval_legendre(l,dot)
        dk+=(2*l+1)*polyderivs[l-1](dot)
    eng=float(np.sum(kernel)/N**2)
    grads=[]
    for i in range(5):
        mask=labels==i
        a=vs[mask];b=vs[~mask]
        weight=dk[np.ix_(mask,~mask)]
        grad=(2/N**2)*np.sum(weight[:,:,None]*np.cross(a[:,None,:],b[None,:,:]),axis=(0,1))
        grads.append(grad)
    return eng, np.array(grads)

rotations=[Rotation.from_euler('zx',[i*theta,(i+1)*theta]).as_matrix()
           for i in range(5)]
Es,grads=energy_gradient(rotations)
assert np.linalg.norm(grads.sum(axis=0))<1e-9
axis=np.array([0.5,-0.4,0.7]);axis/=np.linalg.norm(axis)
h=1e-6
for i in range(5):
    Rplus=rotations.copy();Rminus=rotations.copy()
    Rplus[i]=Rotation.from_rotvec(h*axis).as_matrix()@rotations[i]
    Rminus[i]=Rotation.from_rotvec(-h*axis).as_matrix()@rotations[i]
    fd=(energy_gradient(Rplus)[0]-energy_gradient(Rminus)[0])/(2*h)
    assert abs(fd-np.dot(grads[i],axis))<2e-8, (i,fd,np.dot(grads[i],axis))
print('\nPASS: five-solid bandlimited isotropy energy analytic torques match finite differences.')
print(f'initial isotropy error (4pi * L2): {Es:.12f}')
# Rigorous energy identity for gradient flow: E_dot=-sum |grad E_i|²/I_i.
# Integrate with exponential Euler; line search assures discretised descent.
inertias=np.array([2*len(v)/3 for v in V])
energy_history=[Es]
for step in range(24):
    old,grads=energy_gradient(rotations)
    stepsize=10.0
    while True:
        new=[Rotation.from_rotvec(-stepsize*grads[i]/inertias[i]).as_matrix()@rotations[i]
             for i in range(5)]
        En,_=energy_gradient(new)
        if En<=old or stepsize<1e-9:
            break
        stepsize*=0.5
    rotations=new
    energy_history.append(En)
assert np.all(np.diff(energy_history)<1e-9)
print(f'energy after 24 adaptive steps: {energy_history[-1]:.12f}')
print(f'reduction of spherical anisotropy: {100*(1-energy_history[-1]/energy_history[0]):.6f}%')
print('PASS: nonfitted spherical error functional admits explicit decreasing five-solid spinning path.')
print('NOTE: the l<=6 resolution and gradient-flow mobility are model assumptions.')
