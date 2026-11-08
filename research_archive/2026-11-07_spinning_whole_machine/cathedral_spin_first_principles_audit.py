#!/usr/bin/env python3
"""Newton's Cathedral: rigorous spherical-spin result and coupling-law audit.

Reproducible computational checks of a theorem whose proof is in comments:

(i) With axis uniformly distributed on S2 and fixed angle theta=2*pi/phi**2,
    K f(x) = E_axis f(R_axis(theta) x) acts on spherical harmonics as
    k_l = sin((l+1/2)*theta)/((2*l+1)*sin(theta/2)).
    This follows from SO(3) conjugation-invariance, Schur's lemma, and
    the angular-momentum-l character.  The constant l=0 mode has k_0=1.

(ii) For this theta, max_{l>=1} |k_l| = |k_1|.  Check l=2,3 directly;
    for every l>=4, |k_l| <= 1/(9*sin(theta/2)) < |k_1|.
    Thus on the mean-zero angular subspace:
      || (pi/e K)^n || = ((pi/e) |k_1|)^n.
    This is an exact mathematical contraction conditional on uniform-axis
    *averaging*. Single rigid rotations are unitary, not dissipative.

(iii) The same operator acts on the angular moment of every vertex in
    all five solids; full rotation leaves incidence / Laplacian invariant.

(iv) Global rotational symmetry plus least-resistance descent does not
    uniquely determine a physical interaction: the cube-octahedron
    quartic pair coupling is rotationally invariant and nonconstant, and
    can have any coefficient alpha. Alpha=0 is equally symmetric.

Requires numpy, scipy; sympy only for the exact rational coupling check.
"""
from itertools import product
from math import pi, e, sqrt, sin, cos
import numpy as np
from scipy.spatial.transform import Rotation
from scipy.special import sph_harm_y
from numpy.polynomial.legendre import leggauss
import sympy as sp

phi=(1+sqrt(5))/2
theta=2*pi/phi**2
g=pi/e
s=sin(theta/2)

def kl(l):
    return sin((l+.5)*theta)/((2*l+1)*s)

k1=abs(kl(1))
for l in (2,3):
    assert abs(kl(l))<k1
high_bound=1/(9*s)
assert high_bound<k1
c=g*k1
assert c<1
print('THEOREM: uniform-axis spin contraction across all angular orders')
print('theta_deg=',theta*180/pi)
print('k0=',kl(0),' |k1|=',k1,' upper bound l>=4=',high_bound)
print('pi/e=',g,' worst nonconstant one-step factor=',c)
print('24-stage factor=',c**24)
print('4-Lipschitz, mean-zero-composed bound=',4*c)
assert 4*c<1

solids={
 'tetrahedron':np.array([v for v in product((-1,1),repeat=3) if np.prod(v)>0],float),
 'cube':np.array(list(product((-1,1),repeat=3)),float),
 'octahedron':np.concatenate([np.eye(3),-np.eye(3)]),
 'dodecahedron':np.array(list(product((-1,1),repeat=3))
   + [[0,a/phi,b*phi] for a,b in product((-1,1),repeat=2)]
   + [[a/phi,b*phi,0] for a,b in product((-1,1),repeat=2)]
   + [[a*phi,0,b/phi] for a,b in product((-1,1),repeat=2)],float),
 'icosahedron':np.array([[0,a,b*phi] for a,b in product((-1,1),repeat=2)]
   + [[a,b*phi,0] for a,b in product((-1,1),repeat=2)]
   + [[a*phi,0,b] for a,b in product((-1,1),repeat=2)],float)
}
for name in solids:
 v=solids[name]
 solids[name]=v/np.linalg.norm(v,axis=1)[:,None]
 assert np.allclose(solids[name].T@solids[name]/len(v),np.eye(3)/3,atol=3e-15)
verts=np.concatenate(list(solids.values()))
assert len(verts)==50

# Independent verification, using genuine spin of all 50 vertices over a
# tensor-product angular quadrature, not the representation matrix formula.
# For harmonics l <= 6, n_t=20, n_az=48 integrate polynomial data exactly
# (up to floating-point rounding).
t_nodes,t_weights=leggauss(20)
az=np.arange(48)*2*pi/48
axis=np.array([[sqrt(1-t*t)*cos(a),sqrt(1-t*t)*sin(a),t]
               for t in t_nodes for a in az])
weights=np.repeat(t_weights,48)/(2*48)
assert abs(weights.sum()-1)<1e-14

def moments(points,l):
    z=np.clip(points[:,2],-1,1)
    polar=np.arccos(z)
    longitude=np.arctan2(points[:,1],points[:,0])
    return np.array([np.mean(sph_harm_y(l,m,polar,longitude))
                     for m in range(-l,l+1)])

for l in (1,2,3,4,5,6):
    before=moments(verts,l)
    after=np.zeros(2*l+1,complex)
    for a,w in zip(axis,weights):
        rotated=verts*cos(theta)+np.cross(a,verts)*sin(theta) \
                +np.outer(verts@a,a)*(1-cos(theta))
        after+=w*moments(rotated,l)
    error=np.linalg.norm(after-kl(l)*before)
    print(f'ALL 50 vertices: l={l} eigencoefficient={kl(l):+.9f}, residual={error:.3e}')
    assert error<2e-12

# Exact algebraic non-uniqueness witness: pairwise quartic alignment of
# cube and octahedron, normalized vertices.  The energies below are rational.
cube=sp.Matrix([[a,b,c] for a,b,c in product((-1,1),repeat=3)])/sp.sqrt(3)
octa=sp.Matrix([[1,0,0],[-1,0,0],[0,1,0],[0,-1,0],[0,0,1],[0,0,-1]])
R0=sp.eye(3)
h=sp.sqrt(2)/2
R45=sp.Matrix([[h,-h,0],[h,h,0],[0,0,1]])

def quartic(R):
    total=sp.S.Zero
    for i in range(cube.rows):
        for j in range(octa.rows):
            total += (cube.row(i)*(R*octa.row(j).T))[0]**4
    return sp.simplify(total/(cube.rows*octa.rows))

a,b=quartic(R0),quartic(R45)
print('Symmetric cube-octahedron interaction: aligned=',a,' rotated45=',b,
      ' difference=',sp.simplify(b-a))
assert a==sp.Rational(1,9)
assert b==sp.Rational(5,27)
assert b-a==sp.Rational(2,27)
print('NON-UNIQUENESS: alpha*quartic has all Platonic symmetries for any alpha >= 0;')
print('                  zero coupling also respects every symmetry.')
print('PHYSICAL SCOPE: random-axis averaging is a modelling postulate, not a')
print('                derivation of torque, gravity, gauge forces or particles.')

# Under arbitrary *rigid* rotation the set of incident vertex labels on each
# face is unchanged.  Thus the incidence matrix, cellular Hodge matrix, and
# internal hidden-sector graph Laplacian have no orientation dependence.
from scipy.spatial import ConvexHull

def face_sets(points):
    hull=ConvexHull(points)
    groups={}
    for simplex,equation in zip(hull.simplices,hull.equations):
        groups.setdefault(tuple(np.round(equation,8)),set()).update(simplex.tolist())
    return tuple(sorted(tuple(sorted(v)) for v in groups.values()))

spin=Rotation.from_euler('xyz',[theta,theta/2,-theta/3]).as_matrix()
for name,points in solids.items():
    assert face_sets(points)==face_sets(points@spin.T),name
print('ALL FIVE: actual rigid spinning preserves every face incidence set.')

# Deterministic golden-angle axes, with equal-area elevation.  As N->infty
# this axis sequence becomes equidistributed over S2.  Proof: expand a
# continuous test function into azimuthal Fourier modes, use Riemann sums for
# the k=0 mode and bounded geometric sums (irrational 1/phi**2) plus Abel
# summation for k !=0.  This supplies a deterministic approximation to the
# Haar-axis spin operator; the equal-area elevation rule is an additional
# geometrically natural choice, not forced by pi,phi,e alone.
for N in (24,365,1460):
    i=np.arange(N)
    z=1-2*(i+0.5)/N
    a=2*pi*i/phi**2
    directions=np.column_stack([np.sqrt(1-z*z)*np.cos(a),
                                np.sqrt(1-z*z)*np.sin(a),z])
    errors=[]
    for l in (3,4,6):
        target=kl(l)*moments(verts,l)
        mean=np.zeros(2*l+1,complex)
        for direction in directions:
            v=verts*cos(theta)+np.cross(direction,verts)*sin(theta) \
                +np.outer(verts@direction,direction)*(1-cos(theta))
            mean+=moments(v,l)/N
        errors.append(np.linalg.norm(mean-target))
    print('DETERMINISTIC GOLDEN AXES N=',N,
          'errors l=3,4,6:',*[f'{x:.9g}' for x in errors])

print('AUDIT COMPLETE: stability theorem proved under isotropic-axis sampling;')
print('                unique physical coupling not entailed by stated premises.')
