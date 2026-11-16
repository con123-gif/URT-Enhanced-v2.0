#!/usr/bin/env python3
"""Q161w: native icosahedral 20-face source, six original bit-axis parity transfers."""
from itertools import product, combinations
from sympy import Matrix, sqrt, simplify
phi=(1+sqrt(5))/2
V=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
  +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
  +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(a,b): return simplify(sum((x-y)**2 for x,y in zip(a,b)))
faces=[f for f in combinations(range(12),3)
       if all(d2(V[i],V[j])==4 for i,j in combinations(f,2))]
assert len(faces)==20
pairs=[];unused=set(range(12))
while unused:
    i=min(unused)
    js=[j for j in unused-{i} if all(simplify(V[i][k]+V[j][k])==0 for k in range(3))]
    assert len(js)==1
    j=js[0];pairs.append((i,j));unused-={i,j}
assert len(pairs)==6
M=Matrix(64,20,lambda x,f:int(set(faces[f]).issubset(
    {pairs[i][(x>>i)&1] for i in range(6)})))
assert M.rank()==20
par=Matrix([(-1)**x.bit_count() for x in range(64)])
def P(v):
    return Matrix([sum((v[x^(1<<i)^(1<<j)]
        for i in range(6) for j in range(i+1,6)),0)/15 for x in range(64)])
def Q(v,i): return Matrix([(v[x]+v[x^(1<<i)])/2 for x in range(64)])
R=[]
for i in range(6):
    A=Matrix.hstack(*[Q(P(Matrix([par[x]*M[x,j] for x in range(64)])),i)
                      for j in range(20)])
    active=[j for j,f in enumerate(faces) if any(v in f for v in pairs[i])]
    assert len(active)==10 and A.rank()==10
    assert all(A[:,j]==Matrix.zeros(64,1) for j in range(20) if j not in active)
    assert Matrix.hstack(*(A[:,j] for j in active)).rank()==10
    R.append(A)
assert Matrix.vstack(*R).rank()==20
# Q161w: exhaustive exact rank distribution for all subsets of antipodal axes.
histograms={}
for k in range(1,7):
    ranks_k=[Matrix.vstack(*(R[i] for i in subset)).rank()
             for subset in combinations(range(6),k)]
    histograms[k]={r:ranks_k.count(r) for r in sorted(set(ranks_k))}
assert histograms=={
    1:{10:6}, 2:{16:15}, 3:{18:10,20:10},
    4:{20:15}, 5:{20:6}, 6:{20:1}}
print("Q161w native axis subset rank distributions:",histograms)
assert all(sum(any(v in f for v in pairs[i]) for i in range(6))==3 for f in faces)
ranks=[Matrix.vstack(*(R[i] for i in s)).rank() for s in combinations(range(6),3)]
assert sorted(set(ranks))==[18,20] and ranks.count(20)==10 and ranks.count(18)==10
print("Q161w exact: native rank M=20; six single-axis ranks 10; stacked rank 20, nullity 0")
print("Three-axis subsets: 10 rank-20, 10 rank-18; source/clock/Ward identification pending")
