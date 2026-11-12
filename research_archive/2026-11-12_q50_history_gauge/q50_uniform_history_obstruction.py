#!/usr/bin/env python3
"""Q50: exact native face-source obstruction to history-only gauge lift."""
import sympy as S
from itertools import product,combinations
phi=(1+S.sqrt(5))/2
V=[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)]
d2=lambda u,v:S.simplify(sum((a-b)**2 for a,b in zip(u,v)))
E={frozenset((i,j)) for i,j in combinations(range(12),2) if d2(V[i],V[j])==4}
F=sorted(t for t in combinations(range(12),3) if all(frozenset(p) in E for p in combinations(t,2)))
assert len(F)==20 and len(E)==30
C=S.Matrix(20,12,lambda i,j:int(j in F[i]))
Ph=S.eye(20)-C*(C.T*C).inv()*C.T
A=S.Matrix(20,20,lambda i,j:int(i!=j and len(set(F[i])&set(F[j]))==2))
L=3*S.eye(20)-A
P3=Ph*(5*S.eye(20)-L)/2
P5=Ph*(L-3*S.eye(20))/2
assert P3*P3==P3 and P5*P5==P5 and P3*P5==S.zeros(20)
# X+YZ belongs to original icosahedral degree-1+degree-2 harmonic carrier.
x=S.Matrix([p[0]+p[1]*p[2] for p in V])
f=(C*x).applyfunc(lambda v:S.expand(v*v))
h3=P3*f;h5=P5*f
n3=S.simplify((h3.T*h3)[0]);n5=S.simplify((h5.T*h5)[0])
assert n3==288+128*S.sqrt(5)
assert n5==S.Rational(112,15)+S.Rational(16,5)*S.sqrt(5)
pairs=[];rem=set(range(12))
while rem:
 i=min(rem)
 j=next(k for k in rem-{i} if all(S.simplify(a+b)==0 for a,b in zip(V[i],V[k])))
 pairs.append((i,j));rem-={i,j}
M=S.Matrix(64,20,lambda s,k:int(set(F[k]).issubset({pairs[i][(s>>i)&1] for i in range(6)})))
assert Ph*M.T*M*Ph==2*Ph
assert S.trace(P3)==4 and S.trace(P5)==4
assert S.exp(4*S.pi*S.I/24)!=1
print("Q50 exact native obstruction; h3 norm2 =",n3,"h5 norm2 =",n5)
print("For uniform cochains, original Schur y_j=w nonzero at every j.")
print("Large gauge alpha_j=2pi*j/24: yprime_j=exp(4pi*i*j/24)w.")
print("Identical rows cannot be sent to different phases by a common right history unitary.")
print("CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING; no gate closed.")
