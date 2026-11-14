#!/usr/bin/env python3
"""Prove 30-state magnetic motion ARF characteristic polynomial, no fitting.

Loads the native frustration/whole-five oriented transition construction from
MOVING_ARF_DERIVATION.py; verifies A5 equivariance, irrep multiplicities and
symbolic matrix annihilator at 17 rational points (degree <=16), then checks
exact characteristic polynomial at a nontrivial rational phase.
"""
from pathlib import Path
from itertools import combinations
import runpy, math
import numpy as np, networkx as nx
import sympy as sy
from scipy.linalg import eigvalsh
root=Path(__file__).resolve().parent
r=runpy.run_path(str(root/'MOVING_ARF_DERIVATION.py'))
parts=r['parts']; gids=parts[0];G=r['G'];b=r['B'];edges=r['edges'];v=r['v'];minima=r['minima']
A=sy.Matrix(30,30,lambda i,j: int(G.has_edge(gids[i],gids[j])))
B=b.extract(gids,gids)
assert B.T==-B and A.T==A

# Complete original icosahedral proper A5 rotations and their permutation
# action on spontaneous ground configurations. No guessed group generators.
V=np.array(v,float)
icosa=nx.Graph();icosa.add_nodes_from(range(12));icosa.add_edges_from(edges)
proper=[]
for map_ in nx.isomorphism.GraphMatcher(icosa,icosa).isomorphisms_iter():
    perm=[map_[i] for i in range(12)]
    R=np.linalg.lstsq(V,V[perm],rcond=None)[0]
    assert np.linalg.norm(V@R-V[perm])<1e-10
    if np.linalg.det(R)>0:
        proper.append(perm)
assert len(proper)==60
loc={minima[ix][0]:j for j,ix in enumerate(gids)}
cycles={}
Barray=np.array(B,int);Aarray=np.array(A,int)
for perm in proper:
    mapped=[]
    for ix in gids:
        mask=minima[ix][0]
        image=sum(((mask>>i)&1)<<perm[i] for i in range(12))
        assert image in loc
        mapped.append(loc[image])
    assert np.array_equal(Barray[np.ix_(mapped,mapped)],Barray)
    assert np.array_equal(Aarray[np.ix_(mapped,mapped)],Aarray)
    # order of the 12-vertex permutation
    new=list(range(12));o=0
    while True:
        o+=1;new=[perm[i] for i in new]
        if new==list(range(12)):break
    cycles.setdefault(o,[]).append(sum(mapped[i]==i for i in range(30)))
assert {k:len(v) for k,v in cycles.items()}=={1:1,2:15,3:20,5:24}
assert cycles[1]==[30] and set(cycles[2])=={2}
assert set(cycles[3])=={0} and set(cycles[5])=={0}
# Characters chi(2): (1,-1,-1,0,1). Multiplicities 1,1,1,2,3.
print('Original A5 action on 30 states: (1,3,3prime,4x2,5x3), exact covariance PASS')

# The Hermitian Peierls operator H(c,s)=c*A + i*s*B (c²+s²=1).
# Candidate characteristic polynomial:
# (z-4c)(z²-2cz-4c²)^3(z²-(5-4c²))^4
# (z³+2cz²+(4c²-8)z+8c(1-2c²))^5.
# Proof: A5 blocks 1+3+3' (scalar); 2x2 quartet block; 3x3
# quintet block, fixed by traces Tr(H), Tr(H²), Tr(H³).
# We also establish an exact 17-point polynomial identity, because
# Cayley parametrization c=(1-t²)/(1+t²), s=2t/(1+t²) clears all
# denominator factors and annihilator has degree <=16 in t.
An=np.array(A,int).astype(object); Bn=np.array(B,int).astype(object)
I=np.eye(30,dtype=object)
Z=np.zeros((30,30),dtype=object)

def add(a,b):return (a[0]+b[0],a[1]+b[1])
def mul(a,b):return (a[0]@b[0]-a[1]@b[1],a[0]@b[1]+a[1]@b[0])
def scale(k,a):return (k*a[0],k*a[1])
def real(k):return (k*I,Z)
for t in range(17):
    u=1-t*t; w=2*t; d=1+t*t
    h=(u*An,w*Bn)
    h2=mul(h,h);h3=mul(h2,h)
    f1=add(h,real(-4*u))
    f2=add(add(h2,scale(-2*u,h)),real(-4*u*u))
    f3=add(h2,real(-(5*d*d-4*u*u)))
    f4=add(add(add(h3,scale(2*u,h2)),scale(4*u*u-8*d*d,h)),
           real(8*u*(d*d-2*u*u)))
    prod=mul(mul(mul(f1,f2),f3),f4)
    assert not np.any(prod[0]) and not np.any(prod[1]),t
print('17-point exact integer interpolation (matrix annihilator, degree <=16): PASS')

# One nontrivial rational phase fixes the characteristic-factor multiplicities,
# independently of eigenvalue matching or numeric interpolation.
z=sy.Symbol('z');c=sy.Rational(-3,5);sin=sy.Rational(4,5)
H=c*A+sy.I*sin*B
pH=H.charpoly(z).as_expr()
quint=z**3+2*c*z*z+(4*c*c-8)*z+8*c*(1-2*c*c)
expected=(z-4*c)*(z*z-2*c*z-4*c*c)**3*(z*z-(5-4*c*c))**4*quint**5
assert sy.expand(pH-expected)==0
# Coefficient of z^27 via trace H³ = 120 cos3delta, since 20 triangles
# have flux ±3delta (ten of each).
for t in (0,1,2,3):
    c=(1-t*t)/(1+t*t);s=2*t/(1+t*t)
    hf=c*np.array(A,float)+1j*s*np.array(B,float)
    assert abs(np.trace(hf@hf@hf).real-120*(4*c**3-3*c))<1e-9
print('Exact H(c,s) characteristic factors at c=-3/5, s=4/5: PASS')
print('MASTER MAGNETIC ARF: det(zI-H)= (z-4c)(z²-2cz-4c²)^3(z²-5+4c²)^4')
print('                    *[z³+2cz²+(4c²-8)z+8c(1-2c²)]^5')
print('Scope: a derived finite Hermitian Peierls graph under a DECLARED kinetic coupling; NOT physical alpha or mass')
print('MAGNETIC ARF FACTORIZATION CERTIFICATE: PASS')
