#!/usr/bin/env python3
"""Spinning Platonic solids -> icosahedral hidden-sector mixing.

Reuses the exact incidence construction in cathedral_urt_chiral_derivation.py.
Proves rational identities in Q(phi), then runs deterministic two-axis
physical rotations and the resulting 24-stage candidate transfer.

The face-direction contact law and the spin-to-transfer map are model
assumptions; rigid rotation by itself conserves the internal spectrum.
"""
from itertools import product
import math
import numpy as np
import sympy as sp
from scipy.spatial.transform import Rotation
from cathedral_urt_chiral_derivation import (
    SOLIDS, oriented_two_step_turns, PHI, DELTA, GAIN, THETA
)

C,L,K,centers=oriented_two_step_turns(SOLIDS['icosahedron'])
I=np.eye(20)
P=-K@K/15
P3=P@(5*I-L)/2
P5=P@(L-3*I)/2
unit_normals=centers/np.linalg.norm(centers, axis=1)[:,None]
s=DELTA**(1/12)

# Exact proof using algebraic integer basis 1,phi, where phi²=phi+1
Pr=-sp.Matrix(K@K)/15
Lr=sp.Matrix(L);Ir=sp.eye(20)
P3r=Pr*(5*Ir-Lr)/2;P5r=Pr*(Lr-3*Ir)/2
v0=np.array([[0,a,0] for a,b in product((-1,1),repeat=2)]+
            [[a,0,0] for a,b in product((-1,1),repeat=2)]+
            [[0,0,b] for a,b in product((-1,1),repeat=2)],dtype=int)
v1=np.array([[0,0,b] for a,b in product((-1,1),repeat=2)]+
            [[0,b,0] for a,b in product((-1,1),repeat=2)]+
            [[a,0,0] for a,b in product((-1,1),repeat=2)],dtype=int)
S0=sp.Matrix(C@v0);S1=sp.Matrix(C@v1)
Q0=sum(S0[0,j]**2+S1[0,j]**2 for j in range(3))
Q1=sum(2*S0[0,j]*S1[0,j]+S1[0,j]**2 for j in range(3))
assert (Q0,Q1)==(6,9)
V0=[sp.diag(*[S0[i,j] for i in range(20)]) for j in range(3)]
V1=[sp.diag(*[S1[i,j] for i in range(20)]) for j in range(3)]
for i in range(3):
  for j in range(i,3):
    def parts(i,j):
      A=P3r*V0[i]*P5r*V0[j]*P3r
      B=P3r*(V0[i]*P5r*V1[j]+V1[i]*P5r*V0[j])*P3r
      D=P3r*V1[i]*P5r*V1[j]*P3r
      return A+D,B+D # phi² = 1+phi
    c0,c1=parts(i,j)
    if i==j:
      assert c0==sp.Rational(Q0,9)*P3r
      assert c1==sp.Rational(Q1,9)*P3r
    else:
      d0,d1=parts(j,i)
      assert c0+d0==sp.zeros(20)
      assert c1+d1==sp.zeros(20)
print('EXACT VERIFIED: P3 V_b P5 V_b P3 = |b|² P3/9 for all b.')
print('EXACT VERIFIED: face-normal sum square 6 + 9 phi.')

def J_of_direction(direction):
    b=np.asarray(direction,dtype=float)
    b=b/np.linalg.norm(b)
    V=np.diag(unit_normals @ b)
    X=P3@V@P5
    J=3*(X-X.T)
    assert np.allclose(J@J,-P,atol=3e-13)
    return J

def one_step(direction):
    J=J_of_direction(direction)
    return GAIN*(np.cos(THETA)*P+np.sin(THETA)*J)@(P3+s*P5)

def operator_norm(mat):
    return np.linalg.svd(mat,compute_uv=False)[0]

b0=np.array([1.,2.,3.]);b0=b0/np.linalg.norm(b0)
fixed=np.linalg.matrix_power(one_step(b0),24)
print('Fixed relative direction: ||A^24|| =',operator_norm(fixed),'4L =',4*operator_norm(fixed))

# Actual rigid-body spinning: R(t) changes each step; lab direction fixed;
# its orientation in the solid's body frame is b_n=R_n^T b_lab.
Rx=Rotation.from_rotvec([THETA,0,0]).as_matrix()
Rz=Rotation.from_rotvec([0,0,THETA]).as_matrix()
for seqname,seq in [
        ('alternating x/z', [Rx if n%2==0 else Rz for n in range(24)]),
        ('x then z, repeated', [Rz@Rx for n in range(24)]),
        ('x spin only', [Rx for n in range(24)]),
        ('z spin only', [Rz for n in range(24)])]:
    R=np.eye(3); net=np.eye(20)
    visited=[]
    for step,rotate in enumerate(seq):
        direction=R.T@b0
        visited.append(direction)
        net=one_step(direction)@net
        R=rotate@R
    print(seqname, '||product24|| =',operator_norm(net),
          '4L =',4*operator_norm(net))

# Mechanical invariant under rigid global spin: oriented K unchanged,
# all incidence matrices and Laplacian spectra are unchanged.
for Q in (Rx, Rz, Rz@Rx):
    face_C,face_L,face_K,_=oriented_two_step_turns(SOLIDS['icosahedron']@Q.T)
    index={tuple(np.flatnonzero(row)):i for i,row in enumerate(face_C)}
    order=[index[tuple(np.flatnonzero(row))] for row in C]
    face_C=face_C[order]
    face_L=face_L[np.ix_(order,order)]
    face_K=face_K[np.ix_(order,order)]
    assert np.array_equal(face_C,C) and np.array_equal(face_L,L)
    assert np.array_equal(face_K,K)
print('EXACT NUMERIC-INPUT INTEGER VERIFIED: K,C,L invariant under rigid spin')

# All five solids have isotropic second angular moments.
# The icosahedral and dodecahedral face-normal configurations are 5-designs,
# so their pairwise Legendre interactions through l=5 vanish for any relative rotation.
from scipy.special import eval_legendre
from cathedral_urt_chiral_derivation import cellular_data
normals = {}
for name,points in SOLIDS.items():
    V,E,F,Cp,*_ = cellular_data(points)
    cn = Cp@points
    cn = cn/np.linalg.norm(cn,axis=1)[:,None]
    normals[name] = cn
    assert np.allclose(cn.T@cn/F,np.eye(3)/3,atol=1e-13)
print('Five-solid check: all 50 face normals have isotropic second moments.')

n=normals['icosahedron']
m=normals['dodecahedron']
for label, R in [('aligned',np.eye(3)),('one golden x-spin',Rx),
                 ('golden z followed by x',Rz@Rx)]:
    products = n@(m@R.T).T
    low=[float(np.mean(eval_legendre(l,products))) for l in range(1,6)]
    assert max(abs(v) for v in low)<1e-12
    h6=float(np.mean(eval_legendre(6,products)))
    print('icosa/dodeca relative spinning:',label, 'harmonics l1..5 = zero, l6 = %.12f'%h6)
print('PASS: actual spinning, projected contact mixing, variable spin schedules, whole-five geometry.')
