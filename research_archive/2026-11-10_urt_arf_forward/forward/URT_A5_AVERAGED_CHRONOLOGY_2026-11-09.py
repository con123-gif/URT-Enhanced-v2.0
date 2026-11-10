#!/usr/bin/env python3
"""Optional new test: remove preferred six-axis ordering of URT doubling
by averaging its 64x64 Bernoulli-history kernel over the physical 60 icosahedral rotations.
This is a mathematically unique equivariantization of THAT kernel, but it
introduces the modelling premise that physical time/history is group-averaged.
No four-ARF targets used.
"""
import numpy as np,networkx as nx,runpy,contextlib,io
from pathlib import Path
from itertools import combinations
H=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(H/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
    src=runpy.run_path(str(H/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
G=nx.Graph();G.add_nodes_from(range(12))
for f in m['ico']['faces']:
    for i,j in combinations(f,2): G.add_edge(i,j)
all_g=list(nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter())
points=m['ico']['points']; pairs=m['pairs']; v2pair={x:(i,j) for i,p in enumerate(pairs) for j,x in enumerate(p)}
proper=[];perms=[]
for g in all_g:
    A=np.linalg.lstsq(points,points[[g[i] for i in range(12)]],rcond=None)[0]
    assert np.linalg.norm(points@A-points[[g[i] for i in range(12)]])<1e-10
    if np.linalg.det(A)<0:continue
    proper.append(g)
    perm=[]
    for h in range(64):
        new=0
        for i,pair in enumerate(pairs):
            selected=pair[(h>>i)&1]
            j,bb=v2pair[g[selected]]
            new|=bb<<j
        perm.append(new)
    assert set(perm)==set(range(64))
    perms.append(perm)
assert len(proper)==60
Q=np.zeros((64,64));K=m['Hbits']
for h in range(64):Q[h,2*h%64]+=.5;Q[h,2*h%64+1]+=.5
Qav=np.zeros_like(Q)
for perm in perms:
    assert np.linalg.norm(K[np.ix_(perm,perm)]-K)<1e-12
    Qav+=Q[np.ix_(perm,perm)]/60
assert np.linalg.norm(Qav@np.ones(64)-np.ones(64))<1e-12
assert np.linalg.norm(Qav.T@np.ones(64)-np.ones(64))<1e-12
assert np.linalg.norm(Qav@K-K@Qav)<1e-12
for perm in perms:
    assert np.linalg.norm(Qav[np.ix_(perm,perm)]-Qav)<1e-12
print('proper A5 icosahedral rotations:',len(proper))
print('Original Q not A5 invariant: worst conjugation residual',max(np.linalg.norm(Q[np.ix_(p,p)]-Q) for p in perms))
print('A5-averaged Q 64x64 row nnz distribution',np.unique((Qav>1e-12).sum(axis=1),return_counts=True))
print('A5-averaged Q reversible symmetry residual',np.linalg.norm(Qav-Qav.T))
print('||Qav||2',np.linalg.norm(Qav,2),'rank',np.linalg.matrix_rank(Qav,tol=1e-10))
print('Qav eigenvalue top 20',np.sort(np.linalg.eigvals(Qav).real)[::-1][:20])
print('A5 and K commutators',np.linalg.norm(Qav@K-K@Qav))
for name,R in [('3',src['R3']),('5',src['R5'])]:
    mean=R.mean(axis=0)
    print('source',name,'mean norm',np.linalg.norm(mean))
    print('original 1step trace',np.trace(R.T@Q@R)/64,'A5-averaged 1step trace',np.trace(R.T@Qav@R)/64)
    print('original 2step trace',np.trace(R.T@Q@Q@R)/64,'A5-averaged 2step trace',np.trace(R.T@Qav@Qav@R)/64)
print('PASS: canonical symmetry average, not a new physically proven URT law')
