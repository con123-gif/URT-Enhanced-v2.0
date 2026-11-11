#!/usr/bin/env python3
"""Q22 exact native tetrahedral Hodge-Dirac sea-energy Hessian certificate.

Construct the tetrahedron's genuine cochain d0,d1 and incidence biadjacency
B=[d0,d1^T] (6x8).  Derive the analytic phase Hessian of -Tr sqrt(B B*)
at the signed cochain point, without finite differences or fitted inputs.
All operations are integers; assertions fail on any discrepancy.
"""
from itertools import combinations
from collections import Counter
import json

V=4
edges=list(combinations(range(V),2))
# Boundary of the positively oriented tetrahedral 3-simplex [0,1,2,3].
faces=[(1,2,3),(0,3,2),(0,1,3),(0,2,1)]
E=len(edges);F=len(faces);C=V+F
edge_index={e:i for i,e in enumerate(edges)}
d0=[[0]*V for _ in range(E)]
for k,(i,j) in enumerate(edges):d0[k][i]=-1;d0[k][j]=1
d1=[[0]*E for _ in range(F)]
for f,cycle in enumerate(faces):
    for a,b in zip(cycle,cycle[1:]+cycle[:1]):
        d1[f][edge_index[min(a,b),max(a,b)]]+=1 if a<b else -1
assert all(sum(d1[f][e]*d0[e][v] for e in range(E))==0 for f in range(F) for v in range(V))
B=[[d0[e][v] for v in range(V)]+[d1[f][e] for f in range(F)] for e in range(E)]
assert all(sum(B[e][c]*B[g][c] for c in range(C))==(4 if e==g else 0)
           for e in range(E) for g in range(E))
links=[(e,c) for e in range(E) for c in range(C) if B[e][c]]
pairs=list(combinations(range(E),2))
assert (len(links),len(pairs))==(24,15)
# X1 for a phase link a=(e,c) is i M_a, with real skew matrix
# M_a[i,j] = B[e,c]*(delta_{i,e} B[j,c] - B[i,c] delta_{j,e}).
# Since B B^T=4I, the analytic sea-energy Hessian is
# H_ab=(1/32)Tr(X1_a X1_b)=(1/16) sum_{i<j} M_a[i,j] M_b[i,j].
W=[[B[e][c]*((int(i==e))*B[j][c]-B[i][c]*int(j==e))
    for e,c in links] for i,j in pairs]
A=[[sum(W[p][a]*W[q][a] for a in range(len(links)))
    for q in range(len(pairs))] for p in range(len(pairs))]
def eye(n):return [[int(i==j) for j in range(n)] for i in range(n)]
def mul(X,Y):
    return [[sum(x*y for x,y in zip(row,col)) for col in zip(*Y)] for row in X]
def minus_scalar(X,k):return [[x-(k if i==j else 0) for j,x in enumerate(row)] for i,row in enumerate(X)]
def trace(X):return sum(X[i][i] for i in range(len(X)))
# Exact integer polynomial annihilator, and exact moments fix multiplicities.
P=A
for eigen in (2,4,6):P=mul(P,minus_scalar(A,eigen))
assert all(v==0 for row in P for v in row),"unexpected spectral root"
assert (trace(A),trace(mul(A,A)),trace(mul(mul(A,A),A)))==(48,240,1296)
# The multiplicities solve 2n2+4n4+6n6=48,
# 4n2+16n4+36n6=240, 8n2+64n4+216n6=1296.
solutions=[(a,b,c) for a in range(16) for b in range(16) for c in range(16)
           if (2*a+4*b+6*c,4*a+16*b+36*c,8*a+64*b+216*c)==(48,240,1296)]
assert solutions==[(3,3,5)],solutions
# The other 4 eigenvalues of A are zero; W^T W has 24-11=13 zero modes.
assert 15-sum(solutions[0])==4
# Verify all 14 node-phase directions are null and the incidence graph is
# connected; hence their span has rank 14-1=13, the entire Hessian kernel.
G=[[int(e==i)-int(E+c==i) for i in range(E+C)] for e,c in links]
assert all(sum(W[p][a]*G[a][j] for a in range(24))==0
           for p in range(15) for j in range(E+C))
seen={0};front=[0]
while front:
    node=front.pop()
    for e,c in links:
        a,b=e,E+c
        other=b if node==a else (a if node==b else None)
        if other is not None and other not in seen:
            seen.add(other);front.append(other)
assert len(seen)==E+C and 24-sum(solutions[0])==E+C-1==13
# Sea-energy H=W^T W/16 => eigenvalues 2/16,4/16,6/16.
# The trace of H is 3; inverse trace is 3*8+3*4+5*(8/3)=148/3.
assert sum(x*m for x,m in zip((2,4,6),(3,3,5)))==48
from fractions import Fraction
assert 3*Fraction(8)+3*Fraction(4)+5*Fraction(8,3)==Fraction(148,3)
# Independent check: direct H= W^T W/16 trace matches trace(A)/16.
assert sum(sum(W[p][a]**2 for p in range(15)) for a in range(24))==48
print(json.dumps({"task":"Q22","result":"THEOREM","operator":"tetrahedron B=[d0,d1^T]", "vertices":4,"edges":6,"faces":4,
 "phase_links":24,"gauge_nullity":13,"physical_modes":11,
 "sea_energy_hessian_spectrum":{"1/8":3,"1/4":3,"3/8":5},
 "trace_H":"3","trace_inverse_on_physical":"148/3",
 "integer_Gram_eigenvalues":{"0":4,"2":3,"4":3,"6":5},
 "exact_Gram_traces":[trace(A),trace(mul(A,A)),trace(mul(mul(A,A),A))],
 "analytic_Hessian":"W^T W/16, W[(i,j),(e,c)]=B[e,c]*(delta[i,e]*B[j,c]-B[i,c]*delta[j,e])",
 "physical_ARFs":"not derived"},indent=2))
