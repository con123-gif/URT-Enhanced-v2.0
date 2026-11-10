#!/usr/bin/env python3
"""Time-consistent A5 symmetry restoration of URT 64-history response.
A single A5 frame is sampled and held fixed across all clock steps.
This is mathematically different from re-averaging the Markov kernel at each step.
No fitted coefficients, only preexisting geometry, hidden source and URT map.
"""
import contextlib,io,runpy
from pathlib import Path
from itertools import combinations
import numpy as np
import networkx as nx
_root=Path(__file__).resolve().parent
H=next((p for p in (_root.parent/'forward',_root.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists()),None)
assert H is not None, 'original Nov 9 source cannot be found'
with contextlib.redirect_stdout(io.StringIO()):
    m=runpy.run_path(str(H/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
    src=runpy.run_path(str(H/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
R=np.asarray(src['R3']+src['R5'],float)
P3=np.asarray(src['P3'],float);P5=np.asarray(src['P5'],float)
q=np.zeros((64,64))
for h in range(64):q[h,2*h%64]+=.5;q[h,2*h%64+1]+=.5
C=[];p=np.eye(64)
for k in range(6):C.append(R.T@p@R/64);p=p@q
S=C[0].copy()
for c in C[1:5]:S+=c+c.T

ico=m['geom']['icosahedron'];faces=ico['faces'];pairs=m['pairs'];pts=ico['points']
graph=nx.Graph();graph.add_nodes_from(range(12))
for f in faces:
 for i,j in combinations(f,2):graph.add_edge(i,j)
all_g=list(nx.algorithms.isomorphism.GraphMatcher(graph,graph).isomorphisms_iter())
faceindex={frozenset(face):i for i,face in enumerate(faces)}
pairindex={v:(i,b) for i,pair in enumerate(pairs) for b,v in enumerate(pair)}
phys=[];pbits=[]
for g in all_g:
    tgt=np.array([pts[g[i]] for i in range(12)])
    rot=np.linalg.lstsq(pts,tgt,rcond=None)[0]
    if np.linalg.det(rot)<0:continue
    assert np.linalg.norm(pts@rot-tgt)<2e-10
    idx=[faceindex[frozenset(g[v] for v in f)] for f in faces]
    F=np.zeros((20,20))
    for i,j in enumerate(idx):F[j,i]=1
    assert np.linalg.norm(F.T@P3@F-P3)<2e-12
    assert np.linalg.norm(F.T@P5@F-P5)<2e-12
    phys.append(F)
    perm=[]
    for h in range(64):
        dest=0
        for i,pair in enumerate(pairs):
            vert=pair[(h>>i)&1]
            j,b=pairindex[g[vert]]
            dest |= b<<j
        perm.append(dest)
    assert len(set(perm))==64
    pbits.append(perm)
assert len(phys)==len(pbits)==60

# Isotropic mean of the complete (fixed-frame) time correlation.
Sfixed=sum(F@S@F.T for F in phys)/60
Tfixed=(np.trace(P3@S)/4)*P3+(np.trace(P5@S)/4)*P5
assert np.linalg.norm(Sfixed-Tfixed)<2e-11,(np.linalg.norm(Sfixed-Tfixed),np.trace(S))
assert abs(np.trace(Sfixed)-np.trace(S))<2e-12

# Compare with erroneous replacement of a *fixed* A5 frame by a new random
# frame at every step (the latter is stochastic dynamics on an enlarged system).
qbar=np.zeros((64,64))
for perm in pbits:qbar+=q[np.ix_(perm,perm)]/60
Cbar2=R.T@(qbar@qbar)@R/64
Cfixed2=sum(F@C[2]@F.T for F in phys)/60
assert abs(np.trace(Cfixed2)-np.trace(C[2]))<1e-11
assert np.linalg.norm(Cfixed2-Cbar2)>1e-5

# Unique A5-invariant state on each irreducible quartet gives scalar
# response eigenvalue (Green--Kubo trace)/4, not the bare KMS Gibbs weight.
eigs=np.linalg.eigvalsh(Sfixed)
nonzero=eigs[eigs>1e-8]
assert len(nonzero)==8
p5_dyn=np.trace(P5@Sfixed)/np.trace(Sfixed)
print('A5 physical rotations and fixed frame count',len(phys))
print('time-consistent 60-frame mean vs Schur scalar residual',np.linalg.norm(Sfixed-Tfixed))
print('URT response scalar on hidden3 quartet:',np.trace(P3@Sfixed)/4)
print('URT response scalar on hidden5 quartet:',np.trace(P5@Sfixed)/4)
print('URT stationary linear-response p5 =',p5_dyn)
print('URT fixed-frame lag2 trace:',np.trace(Cfixed2))
print('independently redrawn frame lag2 trace:',np.trace(Cbar2))
print('time-consistent vs independently-redrawn 2-step discrepancy:',np.linalg.norm(Cfixed2-Cbar2))
print('PASS fixed one-frame A5 averaging preserves original multi-time dynamics; trace-level Green-Kubo source is intrinsic')
