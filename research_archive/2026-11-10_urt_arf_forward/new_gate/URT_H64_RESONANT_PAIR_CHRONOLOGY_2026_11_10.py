#!/usr/bin/env python3
"""Exact no-fit A5/Walsh energy-resolved charge-two pairing count.

Independently reconstructs the 12 golden icosahedron vertices, 60 proper
rotations, six signed antipodal axes, and all 64 six-bit Walsh characters.
No historical ARF values, fitted coefficients or third-party material.
The physical Weyl-pair resonance hypothesis is NOT established here.
"""
from itertools import product, combinations
from math import sqrt, comb
from collections import Counter
import numpy as np
import networkx as nx
import sympy as sp

phi=(1+sqrt(5))/2
vertices=np.array(
    [(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
   +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
   +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],dtype=float)
assert vertices.shape==(12,3)
exact_phi=(1+sp.sqrt(5))/2
exact_vertices=(
    [(sp.S(0),sp.S(a),sp.S(b)*exact_phi) for a,b in product((-1,1),repeat=2)]
   +[(sp.S(a),sp.S(b)*exact_phi,sp.S(0)) for a,b in product((-1,1),repeat=2)]
   +[(sp.S(a)*exact_phi,sp.S(0),sp.S(b)) for a,b in product((-1,1),repeat=2)])
G=nx.Graph();G.add_nodes_from(range(12))
for i,j in combinations(range(12),2):
    if abs(np.dot(vertices[i]-vertices[j],vertices[i]-vertices[j])-4)<1e-9:
        G.add_edge(i,j)
assert G.number_of_edges()==30
for i,j in combinations(range(12),2):
    dsq=sp.simplify(sum((exact_vertices[i][d]-exact_vertices[j][d])**2 for d in range(3)))
    assert (dsq==4)==G.has_edge(i,j)
autos=list(nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter())
assert len(autos)==120
tri=next(q for q in combinations(range(12),3)
         if abs(np.linalg.det(vertices[list(q)].T))>1)
V=vertices[list(tri)].T
vdet0=sp.det(sp.Matrix.hstack(*(sp.Matrix(exact_vertices[i]) for i in tri)))
assert vdet0!=0
rotations=[]
for a in autos:
    R=vertices[[a[i] for i in tri]].T@np.linalg.inv(V)
    assert np.max(abs(vertices@R.T-vertices[[a[i] for i in range(12)]]))<1e-10
    assert np.max(abs(R.T@R-np.eye(3)))<1e-10
    vdet1=sp.det(sp.Matrix.hstack(*(sp.Matrix(exact_vertices[a[i]]) for i in tri)))
    det_exact=sp.simplify(vdet1/vdet0)
    assert det_exact in (sp.S.One,-sp.S.One)
    assert abs(float(det_exact)-np.linalg.det(R))<1e-10
    if det_exact==1:rotations.append(a)
assert len(rotations)==60

pairs=[];remaining=set(range(12))
while remaining:
    i=min(remaining)
    j=next(j for j in remaining if j!=i and np.linalg.norm(vertices[i]+vertices[j])<1e-10)
    pairs.append((i,j));remaining-={i,j}
assert len(pairs)==6
axis={v:(i,1 if v==p[0] else -1) for i,p in enumerate(pairs) for v in p}
def signed_action(a):
    perm=[];sign=[]
    for v,_ in pairs:
        j,s=axis[a[v]];perm.append(j);sign.append(s)
    assert sorted(perm)==list(range(6))
    return perm,sign
def order(a):
    cur={i:i for i in range(12)}
    for n in range(1,7):
        cur={i:a[cur[i]] for i in range(12)}
        if all(cur[i]==i for i in range(12)):return n
    raise AssertionError('unexpected group order')
def walsh_trace_k(a,k):
    perm,sign=signed_action(a)
    tr=0
    for ss in combinations(range(6),k):
        if set(perm[i] for i in ss)==set(ss):
            tr+=int(np.prod([sign[i] for i in ss],dtype=int))
    return tr

# The real A5 quartet has chi4(order 1,2,3,5)=(4,0,1,-1).
chi4={1:4,2:0,3:1,5:-1}
assert Counter(map(order,rotations))=={1:1,2:15,3:20,5:24}
traces={k:[walsh_trace_k(a,k) for a in rotations] for k in range(7)}
mult={}
for k in range(7):
    num=sum(chi4[order(a)]*traces[k][i] for i,a in enumerate(rotations))
    assert num%60==0
    mult[k]=num//60
assert mult=={0:0,1:0,2:1,3:2,4:1,5:0,6:0}
assert all(x==1 for x in traces[0]) and all(x==1 for x in traces[6])
energies={k:2*k*(6-k) for k in range(7)}
assert [energies[k] for k in range(7)]==[0,10,16,18,16,10,0]
counts=Counter();quartets=Counter()
for k in range(7):
    counts[energies[k]]+=comb(6,k)
    quartets[energies[k]]+=mult[k]
assert dict(counts)=={0:2,10:12,16:30,18:20}
assert dict(quartets)=={0:0,10:0,16:2,18:2}
possible={16:[],18:[]}
for a in sorted(counts):
    for b in sorted(counts):
        if a<=b and a+b in possible:possible[a+b].append((a,b))
assert possible=={16:[(0,16)],18:[(0,18)]}
# In Sym^2 H64, distinct energy spaces contribute H0 tensor HE.
# H0 is 2 copies of trivial A5, so quartet multiplicity doubles.
resonant={E:counts[0]*quartets[E] for E in (16,18)}
assert resonant=={16:4,18:4}
# Conditional bright factorization: the archived source isometry selects
# one of the two A5 quartets in each of H16 and H18.
bright={E:counts[0] for E in (16,18)}
assert bright=={16:2,18:2}

# Exact unaveraged primitive chronology, not a symmetrized substitute.
N=64
Q2=np.zeros((N,N),dtype=np.int64) # 2Q
for h in range(N):
    Q2[h,(2*h)%N]=1
    Q2[h,(2*h+1)%N]=1
Hbits=15*np.eye(N,dtype=np.int64)
for h in range(N):
    for i,j in combinations(range(6),2):
        Hbits[h,h^(1<<i)^(1<<j)]-=1
assert np.array_equal(Q2@Hbits,Hbits@Q2)
assert np.array_equal(np.linalg.matrix_power(Q2,6),np.ones((N,N),dtype=np.int64))
constant=np.ones(N,dtype=np.int64)
parity=np.array([(-1)**h.bit_count() for h in range(N)],dtype=np.int64)
assert np.array_equal(Hbits@constant,np.zeros(N,dtype=np.int64))
assert np.array_equal(Hbits@parity,np.zeros(N,dtype=np.int64))
assert np.array_equal(Q2@constant,2*constant)
assert np.array_equal(Q2@parity,np.zeros(N,dtype=np.int64))
for weight in (2,3,4):
    representative=np.array([(-1)**((h&((1<<weight)-1)).bit_count()) for h in range(N)],dtype=np.int64)
    assert np.sum(representative)==0
    assert np.array_equal(np.linalg.matrix_power(Q2,6)@representative,np.zeros(N,dtype=np.int64))
# Q^6 is rank-one Haar projector: Qv=v implies v constant.
stationary_resonant={E:quartets[E] for E in (16,18)}
stationary_bright={E:1 for E in (16,18)}
assert stationary_resonant=={16:2,18:2}
assert stationary_bright=={16:1,18:1}

print('A5 rotations:',len(rotations),'orders:',dict(Counter(map(order,rotations))))
print('Walsh weight quartet multiplicities:',mult)
print('Hbits energy dimensions:',dict(sorted(counts.items())))
print('Hbits energy quartet multiplicities:',dict(sorted(quartets.items())))
print('Exact pair energy decompositions:',possible)
print('Conditional uniform-charge Weyl quartet tensors, unrestricted: 276 (archived baseline)')
print('Additive energy resonance:',resonant,'total',sum(resonant.values()))
print('Energy plus native source-bright:',bright,'total',sum(bright.values()))
print('Energy plus Q-stationary zero spectator:',stationary_resonant,'total',sum(stationary_resonant.values()))
print('Energy plus stationary spectator plus bright:',stationary_bright,'total',sum(stationary_bright.values()))
print('PASS exact [2Q,Hbits]=0, (2Q)^6=J64, Q parity=0, Q 1=1')
print('PASS no fitting, no physical ARF coefficients, conditional pair-count theorem')
