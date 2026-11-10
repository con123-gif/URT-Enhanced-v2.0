#!/usr/bin/env python3
"""Exact icosahedral A5 orbit => unique equal-weight pair-flip history operator;
verify against unchanged November 7 Hbits, Walsh energies and source sectors.
No ARF coefficients as inputs.
"""
from pathlib import Path
from collections import defaultdict
from itertools import combinations
import numpy as np, networkx as nx, contextlib,io,runpy
from math import comb
HERE=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    geom=runpy.run_path(str(HERE/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
    src=runpy.run_path(str(HERE/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
ico=geom['geom']['icosahedron']
pairs=geom['pairs']
G=nx.Graph()
G.add_nodes_from(range(12))
for face in ico['faces']:
    for i,j in combinations(face,2): G.add_edge(i,j)
rotations=list(nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter())
assert len(rotations)==120,len(rotations)
which={v:i for i,p in enumerate(pairs) for v in p}
pairmaps=[]
for g in rotations:
    p=tuple(which[g[p[0]]] for p in pairs)
    assert set(p)==set(range(6))
    pairmaps.append(p)
unique=set(pairmaps)
assert len(unique)==60,len(unique)
orbits=defaultdict(set)
for a,b in combinations(range(6),2):
    orb=frozenset(tuple(sorted((p[a],p[b]))) for p in unique)
    orbits[orb].add((a,b))
assert len(orbits)==1
assert len(next(iter(orbits)))==15
# Exact unweighted pair-flip graph on 64 signed six-bit words.
A=np.zeros((64,64),dtype=int)
for h in range(64):
    for a,b in combinations(range(6),2): A[h,h^(1<<a)^(1<<b)]=1
assert np.array_equal(A,A.T)
assert np.all(A.sum(axis=1)==15)
K=15*np.eye(64,dtype=int)-A
assert np.linalg.norm(K-geom['Hbits'])<1e-12
hist={}
for m in range(64):
    d=m.bit_count()
    eigen=15 - (((6-2*d)**2-6)//2)
    hist.setdefault((d,eigen),0);hist[d,eigen]+=1
    w=np.array([(-1)**((h&m).bit_count()) for h in range(64)])
    assert np.linalg.norm(K@w-eigen*w)<1e-12
assert {k:int(v) for k,v in zip(*np.unique(np.rint(np.linalg.eigvalsh(K)).astype(int),return_counts=True))}=={0:2,10:12,16:30,18:20}
# Direct original nonlinear hidden source is in eigenspaces 18 and 16.
assert np.linalg.norm(K@geom['Uh']@src['P3']-18*geom['Uh']@src['P3'])<2e-11
assert np.linalg.norm(K@geom['Uh']@src['P5']-16*geom['Uh']@src['P5'])<2e-11
# Competing canonical Markov dynamics: chronological Bernoulli shift Q and
# uniform even-pair flips P. They both preserve uniform Haar history measure,
# have O(64) update cost (6 and degree15 fixed), but differ in responses.
Q=np.zeros((64,64));P=A/15
for h in range(64):
    Q[h,2*h%64]+=.5
    Q[h,2*h%64+1]+=.5
assert np.linalg.norm(Q@np.ones(64)-np.ones(64))<1e-12
assert np.linalg.norm(P@np.ones(64)-np.ones(64))<1e-12
# Q mixes parity; P conserves parity and has two invariant components.
odd=np.array([h.bit_count()%2 for h in range(64)])
assert np.max(np.abs(P[odd[:,None]!=odd[None,:]]))==0
print('icosahedral graph automorphisms:',len(rotations),'distinct 6-axis permutations',len(unique))
print('all 15 unordered axis pairs form exactly ONE A5 orbit')
print('K=15I-sum_{a<b}X_a X_b agrees with ORIGINAL Hbits exactly')
print('Walsh degree/eigenvalue/multiplicity:')
for (d,eig),n in sorted(hist.items()):print(' ',d,eig,n)
print('original source: P3 degree3->energy18, P5 degrees2,4->energy16')
print('uniform two-bit Markov source eigenvalues: 18 ->',1-18/15,'16 ->',1-16/15)
print('chrono shift Q vs pair P Frobenius difference',np.linalg.norm(Q-P))
print('commutator norm [Q,K]',np.linalg.norm(Q@K-K@Q))
print('PASS')
