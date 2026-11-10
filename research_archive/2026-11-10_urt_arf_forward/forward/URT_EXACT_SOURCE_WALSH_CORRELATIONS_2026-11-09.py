#!/usr/bin/env python3
"""Rational Q(sqrt(5)) exact source proof: all 64 URT signed histories,
original icosahedron incidence and hidden spectral projectors, Walsh
selection, exact temporal lag coefficients, no fitted ARF numbers.
The full five-solid source embedding cancels to the identical 8-coordinate
icosahedral source because Eglobal^T Eglobal=I8 and Plinear=Iico Eglobal^T.
"""
from fractions import Fraction as F
from itertools import product
from pathlib import Path
import numpy as np, sympy as sp,runpy,contextlib,io
H=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):mod=runpy.run_path(str(H/'cathedral_constructed_joint_dynamics_2026_11_07.py'))

class Q5:
    __slots__=('a','b')
    def __init__(self,a=0,b=0):
        self.a=F(a);self.b=F(b)
    def __add__(x,y):
        if not isinstance(y,Q5):y=Q5(y)
        return Q5(x.a+y.a,x.b+y.b)
    __radd__=__add__
    def __neg__(x):return Q5(-x.a,-x.b)
    def __sub__(x,y):return x+-y if isinstance(y,Q5) else x+Q5(-y)
    def __rsub__(x,y):return -x+y
    def __mul__(x,y):
        if not isinstance(y,Q5):y=Q5(y)
        return Q5(x.a*y.a+5*x.b*y.b,x.a*y.b+x.b*y.a)
    __rmul__=__mul__
    def __truediv__(x,y):
        if not isinstance(y,Q5):y=Q5(y)
        norm=y.a*y.a-5*y.b*y.b
        return Q5((x.a*y.a-5*x.b*y.b)/norm,(x.b*y.a-x.a*y.b)/norm)
    def __eq__(x,y):
        if not isinstance(y,Q5):y=Q5(y)
        return x.a==y.a and x.b==y.b
    def __repr__(x):return f'({x.a}+{x.b}*sqrt(5))'
    def __float__(x):return float(x.a)+float(x.b)*5**.5
Z=Q5();ONE=Q5(1);PHI=Q5(F(1,2),F(1,2))
points=([(Z,Q5(a),Q5(b)*PHI) for a,b in product((-1,1),repeat=2)]+
        [(Q5(a),Q5(b)*PHI,Z) for a,b in product((-1,1),repeat=2)]+
        [(Q5(a)*PHI,Z,Q5(b)) for a,b in product((-1,1),repeat=2)])
faces=mod['ico']['faces'];pairs=mod['pairs']
assert len(points)==12 and len(faces)==20
assert max(abs(float(c)-r) for p,q in zip(points,mod['ico']['points']) for c,r in zip(p,q))<1e-12
Den=PHI+2 # squared length of every icosahedral vertex

# Exact integer/rational hidden projectors.
C=sp.zeros(20,12)
for k,face in enumerate(faces):
    for i in face:C[k,i]=1
adj=sp.zeros(20,20)
for i,j in product(range(20),repeat=2):
    if i!=j and len(set(faces[i])&set(faces[j]))==2:adj[i,j]=1
L=3*sp.eye(20)-adj
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*sp.eye(20)-L)/2
P5=Ph*(L-3*sp.eye(20))/2
assert P3*P3==P3 and P5*P5==P5
assert P3.trace()==P5.trace()==4
assert all(y.is_Rational for y in P3) and all(y.is_Rational for y in P5)
P3n=[[(i,Q5(F(int(val.p),int(val.q)))) for i,val in enumerate(list(P3.row(j))) if val!=0] for j in range(20)]
P5n=[[(i,Q5(F(int(val.p),int(val.q)))) for i,val in enumerate(list(P5.row(j))) if val!=0] for j in range(20)]

def dot3(u,v):return sum((x*y for x,y in zip(u,v)),Z)
E=[];O=[]
for h in range(64):
    uraw=[Z,Z,Z]
    for i,(a,b) in enumerate(pairs):
        sign=1 if h&(1<<i) else -1
        for j in range(3):uraw[j]=uraw[j]+sign*points[a][j]
    normu=dot3(uraw,uraw)/Den
    A=[];B=[]
    for pt in points:
        d=dot3(pt,uraw)/Den
        A.append(Q5(F(5,16))*(d*d-normu/3))
        B.append(d/2)
    Es=[];Os=[]
    for face in faces:
        aa=sum((A[i] for i in face),Z);bb=sum((B[i] for i in face),Z)
        Es.append(aa*aa+bb*bb/2)
        Os.append(aa*bb)
    E.append(Es);O.append(Os)
print('all-64 Q(sqrt5) geometric face sources: DONE')
# Walsh Fourier coefficient of E and O arrays, in exact Q(sqrt5).
# H3= sqrt2 P3 O, H5=P5 E.
def walsh_coeff(vals):
    out=[]
    for a in range(64):
        arr=[Z for _ in range(20)]
        for h in range(64):
            sign=(-1)**((a&h).bit_count())
            for j in range(20):arr[j]=arr[j]+sign*vals[h][j]
        out.append([v/64 for v in arr])
    return out
We=walsh_coeff(E);Wo=walsh_coeff(O)
print('raw odd Walsh degree sizes', [(d,sum(sum(abs(float(t)) for t in Wo[a]) for a in range(64) if a.bit_count()==d)) for d in range(7)])
print('raw even Walsh degree sizes', [(d,sum(sum(abs(float(t)) for t in We[a]) for a in range(64) if a.bit_count()==d)) for d in range(7)])
# P5 kills 0,6 raw even components; possible even degree2,4 survive.

def project(P, W):
    return [[sum((val*W[a][i] for i,val in P[j]),Z) for j in range(20)] for a in range(64)]
PWo=project(P3n,Wo)
PWe=project(P5n,We)
assert all(all(v==Z for v in PWo[a]) for a in range(64) if a.bit_count()!=3)
assert all(all(v==Z for v in PWe[a]) for a in range(64) if a.bit_count() not in (2,4))
print('exact hidden P3 degree3, hidden P5 degrees2/4: PASS')
def inner(x,y):return sum((a*b for a,b in zip(x,y)),Z)

def lag(L,R,pref):
    out=[]
    for k in range(6):
        pairs=[(a,a<<k) for a in range(64) if a<<k<64]
        out.append(pref*sum((inner(L[a],R[b]) for a,b in pairs),Z))
    return out
# For h3=sqrt2 P3 O, use orthogonal projection idempotency once:
C3=lag(Wo,PWo,2)
C5=lag(We,PWe,1)
assert C3[5]==C5[5]==Z
want3=[Q5(36,F(72,5)),Q5(F(18,5),F(36,25)),Q5(F(27,25),F(9,25)),Q5(F(36,25),F(18,25)),Z,Z]
want5=[Q5(7),Q5(F(7,40)),Q5(-F(61,120)),Q5(-F(1,24)),Q5(-F(1,6)),Z]
for lab,result,expected in [('3',C3,want3),('5',C5,want5)]:
    print('source',lab,'exact correlations:')
    for i,(a,b) in enumerate(zip(result,expected)):
        print(i,a,'agrees?',a==b)
    assert result==expected
print('Q(sqrt5) exact hidden source autocorrelation certificate: PASS')
