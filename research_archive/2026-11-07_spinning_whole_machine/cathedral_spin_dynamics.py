#!/usr/bin/env python3
"""Newton's Cathedral: five spinning Platonic rotors, first-principles checks.

Tests rigid-body inertia, minimal allowed pair harmonics, exact analytical
relative-orientation torques against finite differences, and Lyapunov energy
loss for a fully specified *candidate* coupled-rotor model.  Its interaction
energy and dissipation law are declared assumptions, not consequences of the
URT spiral alone.  Requires numpy and scipy.
"""
from itertools import product, combinations
import math
import numpy as np
from scipy.spatial import ConvexHull
from scipy.spatial.transform import Rotation
from scipy.special import eval_legendre
from numpy.polynomial.legendre import Legendre

phi = (1 + math.sqrt(5)) / 2
delta = 3/20 - 80*math.pi/(1053*phi)
eta = -math.log(delta)
theta = 2*math.pi/(phi*phi)

SOLIDS = {
    'tetrahedron': np.array([v for v in product((-1,1),repeat=3)
                             if np.prod(v)>0],float),
    'cube': np.array(list(product((-1,1),repeat=3)),float),
    'octahedron': np.array([s*np.eye(3)[j] for j in range(3)
                            for s in (-1,1)],float),
    'dodecahedron': np.array(
        list(product((-1,1),repeat=3))
        + [[0,a/phi,b*phi] for a,b in product((-1,1),repeat=2)]
        + [[a/phi,b*phi,0] for a,b in product((-1,1),repeat=2)]
        + [[a*phi,0,b/phi] for a,b in product((-1,1),repeat=2)],float),
    'icosahedron': np.array(
        [[0,a,b*phi] for a,b in product((-1,1),repeat=2)]
        + [[a,b*phi,0] for a,b in product((-1,1),repeat=2)]
        + [[a*phi,0,b] for a,b in product((-1,1),repeat=2)],float),
}

def face_normals(vertices):
    """Merge coplanar ConvexHull triangles into actual Platonic polygon faces."""
    hull = ConvexHull(vertices)
    groups = {}
    for s, plane in zip(hull.simplices, hull.equations):
        groups.setdefault(tuple(np.round(plane,8)),set()).update(s.tolist())
    normals=[]
    for corners in groups.values():
        n=vertices[list(corners)].mean(axis=0)
        normals.append(n/np.linalg.norm(n))
    return np.array(normals)

names=list(SOLIDS)
normals={k:face_normals(v) for k,v in SOLIDS.items()}
Runit={k:v / np.linalg.norm(v,axis=1)[:,None] for k,v in SOLIDS.items()}
Irot={}
for k,v in Runit.items():
    N=len(v)
    assert np.allclose(v.T@v, (N/3)*np.eye(3),atol=1e-12)
    J=np.sum(np.eye(3)[None,:,:]-v[:,:,None]*v[:,None,:],axis=0)
    assert np.allclose(J,(2*N/3)*np.eye(3),atol=1e-12)
    Irot[k]=2*N/3
    f=normals[k]
    assert np.allclose(f.T@f/len(f),np.eye(3)/3,atol=1e-12)
print('EXACT-STRUCTURE CHECK: all five isotropic inertia tensors (unit mass/vertex, radius 1):')
print({k:float(v) for k,v in Irot.items()})

# For each pair, find the first harmonic that can couple them.  Using a generic
# rotation avoids accidental zero coefficients at a specially aligned pose.
Rtest=Rotation.from_rotvec([.49,-.34,.71]).as_matrix()
leading={}
print('\nFirst nonzero pair angular harmonic:')
for a,b in combinations(names,2):
    d=normals[a]@(normals[b]@Rtest.T).T
    checks=[float(np.mean(eval_legendre(l,d))) for l in range(1,9)]
    ell=next(l for l,x in enumerate(checks,1) if abs(x)>1e-10)
    assert all(abs(v)<1e-11 for v in checks[:ell-1])
    assert ell in (4,6), (a,b,ell)
    leading[a,b]=ell
    print(f'  {a:12s} × {b:12s}: l={ell}')

# Rotationally invariant *chosen* interaction: take the leading allowed pair
# harmonic at coefficient +1, independent of scale.  Other choices also obey
# the same geometry, so this is a reproducible model, not a unique URT law.
def energy_torque(Rs):
    E=0.0
    tau={k:np.zeros(3) for k in names}
    for (a,b),ell in leading.items():
        n=normals[a]@Rs[a].T
        m=normals[b]@Rs[b].T
        dots=n@m.T
        E += float(np.mean(eval_legendre(ell,dots)))
        derivative=Legendre.basis(ell).deriv()(dots)
        # dE/d(rotation on b) = <P'_l(n.m) * (m cross n)>.
        grad=np.mean(derivative[:,:,None] * np.cross(m[None,:,:],n[:,None,:]),axis=(0,1))
        tau[b]-=grad
        tau[a]+=grad
    return E,tau

# Torque check against central finite differences for every one of 5 rotors.
Rs={k:Rotation.from_rotvec(np.array([.15+.13*i,-.1+.09*i,.2+.07*i])).as_matrix()
    for i,k in enumerate(names)}
E,tau=energy_torque(Rs)
axis=np.array([.7,-.4,.3]);axis/=np.linalg.norm(axis)
h=1e-6
for k in names:
    RRplus=dict(Rs); RRminus=dict(Rs)
    RRplus[k]=Rotation.from_rotvec(h*axis).as_matrix()@Rs[k]
    RRminus[k]=Rotation.from_rotvec(-h*axis).as_matrix()@Rs[k]
    fd=(energy_torque(RRplus)[0]-energy_torque(RRminus)[0])/(2*h)
    assert abs(fd + float(tau[k]@axis))<1e-8,(k,fd,tau[k]@axis)
print('\nPASS: analytical torques agree with finite differences for all five rotors.')

# Full coupled spinning experiment.  Rayleigh friction kappa=eta/24 is
# a particular model choice, using the frozen URT scale in dimensionless time.
# Exact continuous identity: d/dt[T + V] = -kappa sum |omega_P|².
kappa=eta/24
omega={k: .55*np.array([math.sin(i+1),math.cos(i+1),.4*(-1)**i])
       for i,k in enumerate(names)}
def total_energy(Rs,omega):
    V,_=energy_torque(Rs)
    T=sum(.5*Irot[k]*np.dot(omega[k],omega[k]) for k in names)
    return T+V, T, V
E_start=total_energy(Rs,omega)
dt=0.002
steps=1000
max_energy_rise=0.0
last_E=E_start[0]
for step in range(steps):
    V,tau=energy_torque(Rs)
    # Midpoint velocity update and Lie-group orientation update.
    omega_half={k: omega[k]+.5*dt*(tau[k]-kappa*omega[k])/Irot[k] for k in names}
    RR={k:Rotation.from_rotvec(dt*omega_half[k]).as_matrix()@Rs[k] for k in names}
    _,tau2=energy_torque(RR)
    new_omega={k: omega_half[k]+.5*dt*(tau2[k]-kappa*omega_half[k])/Irot[k] for k in names}
    newE=total_energy(RR,new_omega)[0]
    max_energy_rise=max(max_energy_rise,newE-last_E)
    Rs,omega=RR,new_omega
    last_E=newE
E_end=total_energy(Rs,omega)
print('Damped five-rotor example (chosen potential + Rayleigh drag):')
print('   kappa=eta/24 = %.12f'%kappa)
print('   energy start = %.12f, energy end = %.12f'% (E_start[0],E_end[0]))
print('   worst numerical energy increase per step = %.3e'%max_energy_rise)
assert E_end[0]<E_start[0]
assert max_energy_rise < 1e-8
print('PASS: actual coupled orientations evolved and energy decreased.')
print('IMPORTANT: symmetry permits both coupling=0 and coupling!=0. The original URT constants alone do not specify a unique torque or damping law.')
