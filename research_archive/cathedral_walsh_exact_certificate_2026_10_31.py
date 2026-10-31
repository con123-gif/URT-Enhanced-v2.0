#!/usr/bin/env python3
"""Exact H64 Walsh to H13/H51 hidden-return Gram; arithmetic in Q(sqrt(5))."""
import sympy as S
from itertools import combinations
r=S.sqrt(5);phi=(1+r)/2
u=S.Matrix([[0,1,phi],[0,-1,phi],[1,phi,0],[-1,phi,0],[phi,0,1],[phi,0,-1]])
pairs=list(combinations(range(6),2))
c=[]
for i,j in pairs:
    cij=S.simplify(r*(u.row(i).dot(u.row(j)))/(1+phi**2))
    assert cij in (1,-1),(i,j,cij)
    c.append(int(cij))
B=S.zeros(15,5)
for k,(i,j) in enumerate(pairs):
    a,b=u.row(i),u.row(j)
    B[k,0]=S.expand(2*(a[0]*b[0]-a[1]*b[1]))
    B[k,1]=S.expand(2*(a[0]*b[0]+a[1]*b[1]-2*a[2]*b[2]))
    B[k,2]=S.expand(a[0]*b[1]+a[1]*b[0])
    B[k,3]=S.expand(a[0]*b[2]+a[2]*b[0])
    B[k,4]=S.expand(a[1]*b[2]+a[2]*b[1])
E=S.zeros(64,13)
E[0,0]=1; E[63,1]=1
for i in range(6):E[1<<i,i+2]=1
for k,(i,j) in enumerate(pairs):
    for z in range(5):E[(1<<i)|(1<<j),8+z]=B[k,z]
Y=6*E
for (i,j),ci in zip(pairs,c):
    mask=(1<<i)|(1<<j)
    for row in range(64):
        for col in range(13):
            if E[row^mask,col]!=0:
                Y[row,col]+=2*r*S.Rational(ci,5)*E[row^mask,col]
D=(E.T*E).applyfunc(S.expand)
D5i=D[8:13,8:13].inv().applyfunc(S.simplify)
DI=S.eye(8).row_join(S.zeros(8,5)).col_join(S.zeros(5,8).row_join(D5i))
A=(E.T*Y).applyfunc(S.expand)
N=(Y.T*Y).applyfunc(S.expand)
G=(DI*(N-A*DI*A)).applyfunc(S.simplify)
p=5*G**3-119*G**2+860*G-1824*S.eye(13)
for i in range(13):
    for j in range(13):assert S.simplify(p[i,j])==0,(i,j,p[i,j])
assert S.simplify(S.trace(G))==91
assert S.simplify(S.trace(G*G))==S.Rational(3721,5)
print("PASS EXACT Q(sqrt5) polynomial: 5G^3-119G^2+860G-1824I=0")
print("PASS Tr G=91, Tr G^2=3721/5")
print("THEREFORE eigen 12(x2), 8(x6), 19/5(x5), rank13")
