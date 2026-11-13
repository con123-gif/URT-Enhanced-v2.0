#!/usr/bin/env python3
"""Exact native icosahedral hidden P3/P5 carrier in the sigma1 Z4 clock quotient."""
from itertools import product, combinations
from sympy import Matrix, eye, zeros, Rational, trace
from math import sqrt
phi=(1+sqrt(5))/2
v=[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)]
def d2(i,j):return sum((v[i][k]-v[j][k])**2 for k in range(3))
edges={frozenset((i,j)) for i,j in combinations(range(12),2) if abs(d2(i,j)-4)<1e-9}
assert len(edges)==30
pairs=[];remaining=set(range(12))
while remaining:
 i=min(remaining);j=min(remaining-{i},key=lambda k:sum((v[i][t]+v[k][t])**2 for t in range(3)))
 pairs.append((i,j));remaining-={i,j}
faces=[t for t in combinations(range(12),3) if all(frozenset(e) in edges for e in combinations(t,2))]
assert len(faces)==20
C=zeros(20,12)
for i,f in enumerate(faces):
 for j in f:C[i,j]=1
Ph=eye(20)-C*(C.T*C).inv()*C.T
L=3*eye(20)
for i in range(20):
 for j in range(20):
  if i!=j and len(set(faces[i])&set(faces[j]))==2:L[i,j]=-1
P3=Ph*(5*eye(20)-L)/2
P5=Ph*(L-3*eye(20))/2
assert P3*P3==P3 and P5*P5==P5 and trace(P3)==trace(P5)==4
M=zeros(64,20)
for h in range(64):
 selected={pairs[k][(h>>k)&1] for k in range(6)}
 for f,t in enumerate(faces):M[h,f]=int(set(t)<=selected)
assert M.T*M*Ph==2*Ph
H3=M*P3*M.T/2
H5=M*P5*M.T/2
assert H3*H3==H3 and trace(H3)==4
sig=[None]*64
for x in range(32):sig[x]=2*x+1;sig[x+32]=2*x
assert sorted(sig)==list(range(64))
P=zeros(64)
for i,j in enumerate(sig):P[i,j]=1
T=P**6
assert T**4==eye(64)
E0=(eye(64)+T+T**2+T**3)/4
E2=(eye(64)-T+T**2-T**3)/4
Eodd=(eye(64)-T**2)/2
assert E0*E0==E0 and E2*E2==E2 and Eodd*Eodd==Eodd
assert E0+E2+Eodd==eye(64)
Ds=[(0,2,4,6,10,9),(0,2,7,5,9,10),(0,2,9,10,4,6),(0,2,10,9,7,5),(0,3,4,7,10,8),(0,3,7,4,9,11),(0,3,9,11,4,7),(0,3,10,8,7,4)]
for D in Ds:
 idx=[sum(((((h>>j)&1)^(D[j]&1))<<(D[j]//2)) for j in range(6)) for h in range(64)]
 assert sorted(idx)==list(range(64))
 H=H3.extract(idx,idx)
 Hf=H5.extract(idx,idx)
 assert T*H==-H and H*T==-H
 assert T*Hf==Hf and Hf*T==Hf
 assert E0*Hf==Hf and E2*Hf==zeros(64) and Eodd*Hf==zeros(64)
 w0=trace(E0*H);w2=trace(E2*H);wodd=trace(Eodd*H)
 assert w0+w2+wodd==4
 assert trace((T-T**3)*H)==0
 assert (w0,wodd/2,w2,wodd/2)==(0,0,4,0)
 print('DICT',D,'NATIVE_P3_Z4_CLOCK_WEIGHTS',w0,wodd/2,w2,wodd/2)
print('Q83_EXACT_NATIVE_CARRIER_Z4_CLOCK_PASS')
