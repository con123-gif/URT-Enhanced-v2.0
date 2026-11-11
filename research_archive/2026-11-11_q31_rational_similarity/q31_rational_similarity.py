#!/usr/bin/env python3
"""Q31: exact rational similarity on the native icosahedral A5-twirled Q2.
Reuses verbatim the Q3 geometric A5 action and Q28 dictionary/orbit
construction; no synthetic matrices, measured inputs, or fitted constants.
Certificate: common Q-characteristic polynomial and exact Q-ranks of g(S)^j.
"""
import itertools, json, time
from collections import Counter
from itertools import combinations, permutations
import numpy as np
import networkx as nx
import sympy as sp
from sympy.polys.matrices import DomainMatrix

t0=time.time()
PHI=(1+5**.5)/2

def geometric_a5_on_codes():
    pts = np.array([(0, a, b * PHI) for a, b in itertools.product((-1, 1), repeat=2)]
                   + [(a, b * PHI, 0) for a, b in itertools.product((-1, 1), repeat=2)]
                   + [(a * PHI, 0, b) for a, b in itertools.product((-1, 1), repeat=2)], float)
    pairs, rem = [], set(range(12))
    while rem:
        i = min(rem); j = min(rem - {i}, key=lambda k: np.linalg.norm(pts[i] + pts[k]))
        pairs.append((i, j)); rem -= {i, j}
    G = nx.Graph(); G.add_edges_from((i, j) for i, j in combinations(range(12), 2) if abs(np.linalg.norm(pts[i] - pts[j]) - 2) < 1e-9)
    code_of = {}
    for c in range(64):
        code_of[frozenset(pairs[k][(c >> k) & 1] for k in range(6))] = c
    perms = []
    for m in nx.algorithms.isomorphism.GraphMatcher(G, G).isomorphisms_iter():
        p = [m[i] for i in range(12)]
        if np.linalg.det(np.linalg.lstsq(pts, pts[p], rcond=None)[0]) > 0:
            perms.append(np.array([code_of[frozenset(p[pairs[k][(c >> k) & 1]] for k in range(6))] for c in range(64)]))
    assert len(perms) == 60
    return perms


perms=geometric_a5_on_codes()
assert len(perms)==60

Q=np.zeros((64,64),dtype=np.int64)
for h in range(64):Q[h,2*h%64]=Q[h,(2*h+1)%64]=1
assert np.all(Q.sum(axis=1)==2)
bits=np.array([[(h>>i)&1 for i in range(6)] for h in range(64)],dtype=np.int64)
# Every S entry <=60 and each row sum =120. Thus each (S^3)_ii <=120^3
# and Tr S^3 <=64*120^3=110592000 <<2^63; integer matmul cannot overflow.
assert 64*120**3 < 2**63

def moments(D):
    code=((bits^np.array([x&1 for x in D],dtype=np.int64)) << np.array([x//2 for x in D],dtype=np.int64)).sum(axis=1)
    inv=np.empty(64,dtype=np.int64);inv[code]=np.arange(64)
    X=Q[np.ix_(inv,inv)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms:S+=X[np.ix_(p,p)]
    assert np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
    S2=S@S
    return int(np.trace(S2)),int(np.trace(S2@S))

def signed_action(p):
    b=int(p[0]);dst=[];flip=[]
    for i in range(6):
        bit=int(p[1<<i])^b
        assert bit and bit&(bit-1)==0
        j=bit.bit_length()-1
        dst.append(j);flip.append((b>>j)&1)
    assert sorted(dst)==list(range(6))
    return tuple(dst),tuple(flip)
actions=[signed_action(p) for p in perms]
assert len(set(actions))==60

def act(D,a):
    dst,flip=a
    return tuple(2*dst[x//2]+((x&1)^flip[x//2]) for x in D)
def inv(D):return tuple(x^1 for x in D)
def rev(D):return D[::-1]
def alt(D):return tuple(x^(i&1) for i,x in enumerate(D))
def eight(D):
    seen={D};todo=[D]
    while todo:
        x=todo.pop()
        for f in (inv,rev,alt):
            y=f(x)
            if y not in seen:seen.add(y);todo.append(y)
    assert len(seen)==8
    return seen
remaining={tuple(2*p[i]+((s>>i)&1) for i in range(6)) for p in permutations(range(6)) for s in range(64)}
assert len(remaining)==46080
reps=[]
while remaining:
    D=min(remaining)
    orbit={act(d,a) for d in eight(D) for a in actions}
    assert len(orbit)==480 and orbit<=remaining
    remaining-=orbit
    reps.append(D)
assert len(reps)==96


# Reconstruct Q30's residual 48 eight-orbits with native S_D.
def S_of(D):
    code=((bits^np.array([z&1 for z in D],dtype=np.int64)) <<
          np.array([z//2 for z in D],dtype=np.int64)).sum(axis=1)
    assert sorted(code.tolist())==list(range(64))
    inverse=np.empty(64,dtype=np.int64)
    inverse[code]=np.arange(64)
    X=Q[np.ix_(inverse,inverse)]
    S=np.zeros((64,64),dtype=np.int64)
    for p in perms:S+=X[np.ix_(p,p)]
    assert np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
    return S

residual=[]
for D in reps:
    A,B=S_of(D),S_of(alt(D))
    if int(np.trace(A@A@A))==int(np.trace(B@B@B)):
        residual.append(D)
assert len(residual)==48

x=sp.Symbol('x')
def polynomial_matrix(M,g):
    X=np.array(M,dtype=object)
    P=np.zeros((64,64),dtype=object)
    I=np.eye(64,dtype=object)
    for coeff in sp.Poly(g,x).all_coeffs():
        assert coeff.is_Integer
        P=P@X+int(coeff)*I
    return P

def rank_exact(M):
    domain=DomainMatrix.from_Matrix(sp.Matrix(np.array(M,dtype=object).tolist()))
    return len(domain.rref_den()[2])

nonsimple=0
first_jordan=None
patterns=Counter()
for D in residual:
    A,B=S_of(D),S_of(alt(D))
    fA=sp.Matrix(A.tolist()).charpoly(x).as_expr()
    fB=sp.Matrix(B.tolist()).charpoly(x).as_expr()
    assert fA==fB,('different characteristic polynomials',D)
    factors=sp.factor_list(fA)[1]
    assert sum(sp.degree(g)*e for g,e in factors)==64
    patterns[tuple(sorted((sp.degree(g),e) for g,e in factors))]+=1
    nontrivial=False
    for g,e in factors:
        d=sp.degree(g)
        GA=polynomial_matrix(A,g)
        GB=polynomial_matrix(B,g)
        a1,b1=rank_exact(GA),rank_exact(GB)
        a2,b2=rank_exact(GA@GA),rank_exact(GB@GB)
        assert a1==b1 and a2==b2,('Q-rank witness',D,str(g),(a1,a2),(b1,b2))
        assert a2==64-d*e,('Jordan chain length > 2',D,str(g),a2,64-d*e)
        assert a2<=a1<=64
        assert (64-a1)%d==0
        if a1>a2:
            nontrivial=True
            if first_jordan is None:
                first_jordan={'dictionary':list(D),'factor':str(g),
                    'algebraic_multiplicity':e,'rank_g':a1,'rank_g2':a2,
                    'size_two_blocks':e-(64-a1)//d}
    nonsimple+=int(nontrivial)
# Exact rational similarity criterion: for each irreducible g, the equality
# of ranks g(A)^1, g(A)^2, together with rank g(A)^2=64-d*e, fixes every
# elementary divisor: no primary block has length >2. Thus A~_Q B.
assert len(residual)==48
print(json.dumps({
    'task':'Q31','result':'THEOREM','native_A5_order':60,
    'eight_orbit_pairs':48,'rationally_similar_pairs':48,
    'Q30_nonpermutation_pairs_covered':26,
    'nonsemisimple_pairs':nonsimple,'distinct_factor_patterns':len(patterns),
    'first_exact_jordan_witness':first_jordan,
    'method':'exact Q factorization and rational ranks of g(S),g(S)^2',
    'physical_ARFs':'not derived',
    'elapsed_seconds':round(time.time()-t0,2)
},indent=2,sort_keys=True,default=int))
