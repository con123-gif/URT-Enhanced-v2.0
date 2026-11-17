"""Q161z: exact original icosahedral face-uniform conditional readout certificate."""
from itertools import product, combinations
from collections import Counter
from fractions import Fraction
from sympy import Matrix, sqrt, simplify

phi = (1 + sqrt(5)) / 2
V = ([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
   + [(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
   + [(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(i,j):
    return simplify(sum((V[i][k]-V[j][k])**2 for k in range(3)))
faces = [f for f in combinations(range(12),3)
         if all(d2(i,j)==4 for i,j in combinations(f,2))]
assert len(V)==12 and len(faces)==20
pairs=[]; unused=set(range(12))
while unused:
    i=min(unused)
    candidates=[j for j in unused-{i} if all(simplify(V[i][k]+V[j][k])==0 for k in range(3))]
    assert len(candidates)==1
    j=candidates[0]; pairs.append((i,j)); unused-={i,j}
assert len(pairs)==6
M=[[int(set(f).issubset({pairs[i][(x>>i)&1] for i in range(6)}))
    for f in faces] for x in range(64)]
u=[sum(row) for row in M]
assert Counter(u)==Counter({0:12,1:20,4:20,5:12}) and sum(u)==160
w=[(-1)**x.bit_count()*u[x] for x in range(64)]
def P(v):
    return [sum((v[x^(1<<i)^(1<<j)] for i in range(6)
                 for j in range(i+1,6)),0)/Fraction(15) for x in range(64)]
def Q(v,i):
    return [(v[x]+v[x^(1<<i)])/Fraction(2) for x in range(64)]
pw=P(w)
assert Counter(pw)==Counter({Fraction(12,5):20,Fraction(-13,5):20,
                            Fraction(-7,3):12,Fraction(8,3):12})
responses=[Q(pw,i) for i in range(6)]
for v in responses:
    assert Counter(v)==Counter({Fraction(1,30):40,Fraction(-1,10):20,Fraction(1,6):4})
    assert sum(v)==0 and sum(a*a for a in v)==Fraction(16,45)
assert Matrix.hstack(*(Matrix(v) for v in responses)).rank()==6
print("Q161z LOCAL EXACT CERTIFICATE: 20 faces, 6 axes, rank 6, norm2 16/45; PHYSICAL SOURCE OPEN")
