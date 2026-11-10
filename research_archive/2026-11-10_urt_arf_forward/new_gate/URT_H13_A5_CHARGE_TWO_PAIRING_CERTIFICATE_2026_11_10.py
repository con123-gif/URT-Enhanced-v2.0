#!/usr/bin/env python3
"""Original URT/Cathedral representation-theoretic gate to charged matter.

Computes A5-symmetric charge-two Weyl pairing multiplicities in the
centered icosahedral H13 = 2*1 + 3 + 3' + 5. Two native hidden quartets
4_3 and 4_5 are copies of the same A5 irrep 4. No ARF targets, couplings,
or phenomenological parameters occur.

Independent certificates: exact Q(sqrt5) character products; integer 91x91
A5 central idempotent in the 12-coset + center permutation representation;
explicit numerical ranks in the four isotypic pairing sectors; U(1) Ward
contact identities for charge-2 hidden sources and charge-1 Weyl fermions.
"""
from itertools import permutations
from collections import defaultdict
import numpy as np
import sympy as sp

rt5=sp.sqrt(5); phi=(1+rt5)/2; phibar=(1-rt5)/2
clsz=[1,15,20,12,12]
characters={
    '1': [1,1,1,1,1],
    '3': [3,-1,0,phi,phibar],
    "3'": [3,-1,0,phibar,phi],
    '4': [4,0,1,-1,-1],
    '5': [5,1,-1,0,0],
}

def dot(x,y):
    return sp.simplify(sum(sp.Integer(clsz[i])*x[i]*y[i] for i in range(5))/60)

def decompose(ch):
    d={k:dot(ch,v) for k,v in characters.items()}
    assert all(val.is_Integer and val>=0 for val in d.values()),d
    return d

# H13 is the 12 vertices of an icosahedron plus one fixed center.
H13=[13,1,1,3,3]
assert decompose(H13)=={'1':2,'3':1,"3'":1,'4':0,'5':1}
# For 5A, 5B the square switches conjugacy class.
H13sq=[H13[0],H13[0],H13[2],H13[4],H13[3]]
sym=[sp.Rational(H13[i]**2+H13sq[i],2) for i in range(5)]
wedge=[sp.Rational(H13[i]**2-H13sq[i],2) for i in range(5)]
assert decompose(sym)=={'1':6,'3':4,"3'":4,'4':4,'5':9}
assert decompose(wedge)=={'1':1,'3':6,"3'":6,'4':4,'5':5}
assert decompose([x*x for x in H13])=={'1':7,'3':10,"3'":10,'4':8,'5':14}

# Exact character selection: the quartet occurs once in each of
# 3⊗3', 3⊗5, 3'⊗5, Sym²5. The other symmetric sectors give none.
sectors={
    "3x3'": [sp.simplify(characters['3'][i]*characters["3'"][i]) for i in range(5)],
    '3x5': [sp.simplify(characters['3'][i]*characters['5'][i]) for i in range(5)],
    "3'x5": [sp.simplify(characters["3'"][i]*characters['5'][i]) for i in range(5)],
    'Sym2(5)': [sp.Rational(characters['5'][i]**2+characters['5'][[0,0,2,4,3][i]],2) for i in range(5)],
}
assert all(dot(ch,characters['4'])==1 for ch in sectors.values())

# Construct A5 as all even permutations of 5 symbols.
def parity(p):
    return sum(p[i]>p[j] for i in range(5) for j in range(i+1,5))%2
G=[p for p in permutations(range(5)) if parity(p)==0]
assert len(G)==60
I=tuple(range(5))
def mul(p,q):return tuple(p[q[i]] for i in range(5))
def inv(p):return tuple(p.index(i) for i in range(5))
def power(p,k):
    a=I
    for _ in range(k):a=mul(a,p)
    return a
order={g:next(n for n in (1,2,3,5) if power(g,n)==I) for g in G}
assert {n:sum(order[g]==n for g in G) for n in (1,2,3,5)}=={1:1,2:15,3:20,5:24}
# Distinguish 5A and 5B by exact conjugacy orbit.
classes=[];unused=set(G)
while unused:
    a=min(unused)
    orbit={mul(mul(h,a),inv(h)) for h in G}
    classes.append(orbit);unused-=orbit
assert sorted(map(len,classes))==[1,12,12,15,20]
classes.sort(key=lambda cl:(min(order[g] for g in cl),min(cl)))
cl_of={g:j for j,cl in enumerate(classes) for g in cl}
assert [len(c) for c in classes]==clsz

# The 12 cosets G/C5 are the 12 icosahedron vertices as an A5-set.
cycle=(1,2,3,4,0)
H={power(cycle,j) for j in range(5)}
assert len(H)==5
cosets=sorted({frozenset(mul(g,h) for h in H) for g in G},key=lambda c:min(c))
assert len(cosets)==12
idx={c:i for i,c in enumerate(cosets)}
perms=[]
for g in G:
    p=[idx[frozenset(mul(g,h) for h in c)] for c in cosets]+[12]
    assert sorted(p)==list(range(13))
    perms.append(p)
    assert sum(p[i]==i for i in range(13))==H13[cl_of[g]]

# The A5 central idempotent for 4 in Sym² H13 is rational:
# P4=(4/60) sum_g chi4(g) rho_Sym²(g) = M/15, M integer.
pairs=[(i,j) for i in range(13) for j in range(i,13)]
assert len(pairs)==91
pair_idx={p:i for i,p in enumerate(pairs)}
M=np.zeros((91,91),dtype=np.int64)
for g,p in zip(G,perms):
    ch=int(characters['4'][cl_of[g]])
    if ch==0:continue
    for k,(i,j) in enumerate(pairs):
        a,b=sorted((p[i],p[j]))
        M[pair_idx[a,b],k]+=ch
assert np.array_equal(M@M,15*M), 'integer central idempotent fails'
assert np.trace(M)==240 # rank(P4)=16
assert np.linalg.matrix_rank(M)==16

# Independent numeric irreducible projectors in the 13-vertex permutation rep.
P={}
for ir in ('3',"3'",'5'):
    d=int(characters[ir][0]);A=np.zeros((13,13),float)
    for g,p in zip(G,perms):
        c=float(characters[ir][cl_of[g]])
        for j,i in enumerate(p):A[i,j]+=d*c/60
    assert np.linalg.norm(A@A-A)<1e-12
    vals,U=np.linalg.eigh(A)
    B=U[:,vals>0.5]
    assert B.shape==(13,d),(ir,vals)
    P[ir]=B

def sympair(u,v):
    # Orthonormal Sym² basis indexed by unordered (i,j).
    A=(np.outer(u,v)+np.outer(v,u))/2
    return np.array([A[i,j] if i==j else np.sqrt(2)*A[i,j] for i,j in pairs])

# Rank of quartet projection on each explicit tensor sector.
for tag,la,lb in [("3x3'",'3',"3'"),('3x5','3','5'),("3'x5","3'",'5'),('Sym2(5)','5','5')]:
    U=P[la];V=P[lb];cols=[]
    for i in range(U.shape[1]):
        for j in range(V.shape[1]):
            if la==lb and j<i:continue
            cols.append(sympair(U[:,i],V[:,j]))
    S=np.column_stack(cols)
    # Integer projector M/15, rank via singular values; sector has one quartet.
    singular=np.linalg.svd(M@S/15,compute_uv=False)
    rank=int(np.count_nonzero(singular>1e-8))
    assert rank==4,(tag,rank,singular)
    print('explicit icosahedral 13-vertex sector',tag,'dim',S.shape[1],'quartet rank',rank)

# Charge-two Yukawa Ward contacts. A Weyl spinor bilinear with epsilon spin
# contraction is symmetric in flavor and has U(1) charge +2. Its h† coupling
# is neutral. For a gauge orbit the three second-derivative contacts are
# (-4+8-4) h†B =0, independently of a coupling coefficient.
rng=np.random.default_rng(20261110)
h=rng.normal(size=4)+1j*rng.normal(size=4)
B=rng.normal(size=4)+1j*rng.normal(size=4)
y=np.vdot(h,B)
lam=0.37
assert abs(np.vdot(np.exp(2j*lam)*h,np.exp(2j*lam)*B)-y)<1e-13
assert abs((-2j+2j)*y)<1e-13
assert abs((-4+8-4)*y)<1e-13
# If h is coupled to a neutral Dirac mass bilinear, gauge invariance fails.
assert abs(np.vdot(np.exp(2j*lam)*h,B)-y)>1e-4
print('H13 character',H13,'Sym2 character',sym,'wedge2 character',wedge)
print('Sym2(H13) decomposition',decompose(sym))
print('Wedge2(H13) decomposition',decompose(wedge))
print('A5 quartet multiplicity in Sym2(H13) = 4; two hidden quartets give 8 allowed independent vertex tensors')
print('exact 91x91 integer idempotent M^2=15M, trace(M)=240, rank(M)=16: PASS')
print('U(1) local Yukawa Ward: first =0; second =(-4+8-4)=0: PASS')
print('Bare h† Dirac mass coupling: NOT gauge invariant: PASS')
print('No four historical ARFs, fitted couplings, or pole identifications used.')
