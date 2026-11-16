from itertools import product,combinations
from sympy import Matrix,sqrt,simplify
phi=(1+sqrt(5))/2
V=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(a,b):return simplify(sum((x-y)**2 for x,y in zip(a,b)))
faces=[f for f in combinations(range(12),3) if all(d2(V[i],V[j])==4 for i,j in combinations(f,2))]
assert len(faces)==20
pairs=[];unused=set(range(12))
while unused:
 i=min(unused);j=next(j for j in unused-{i} if all(simplify(V[i][k]+V[j][k])==0 for k in range(3)));pairs.append((i,j));unused-={i,j}
axis={v:i for i,p in enumerate(pairs) for v in p}
patterns={tuple(sorted(axis[v] for v in f)) for f in faces}
print('face patterns',sorted(patterns),len(patterns))
M=Matrix(64,20,lambda x,f:int(set(faces[f]).issubset({pairs[i][(x>>i)&1] for i in range(6)})))
par=Matrix([(-1)**x.bit_count() for x in range(64)])
def P(v):return Matrix([sum((v[x^(1<<i)^(1<<j)] for i in range(6) for j in range(i+1,6)),0)/15 for x in range(64)])
def Q(v,i):return Matrix([(v[x]+v[x^(1<<i)])/2 for x in range(64)])
R=[Matrix.hstack(*[Q(P(Matrix([par[x]*M[x,j] for x in range(64)])),i) for j in range(20)]) for i in range(6)]
for s in combinations(range(6),3):
 rank=Matrix.vstack(*(R[i] for i in s)).rank()
 print(s,rank,'face-pattern',s in patterns,'complement-pattern',tuple(i for i in range(6) if i not in s) in patterns)
assert len(patterns)==10
assert all((Matrix.vstack(*(R[i] for i in s)).rank()==20)==(s in patterns) for s in combinations(range(6),3))
assert all((s in patterns)!=(tuple(i for i in range(6) if i not in s) in patterns) for s in combinations(range(6),3))
print('CERTIFIED: three-axis readout is injective iff axes occur together in an original icosahedral face; otherwise rank 18')
