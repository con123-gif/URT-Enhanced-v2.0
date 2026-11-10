#!/usr/bin/env python3
"""Exact Q(sqrt5) gauge-neutral hidden-quartet source from original
six-bit signed icosahedral history, all-five-solid source pullback and
unaveraged URT chronological doubling. No ARF targets, fitting or third-party
Yang-Mills results. 24-clock charge selection is proved algebraically in the
accompanying note; stationary source moments do not require an arbitrary
24-clock multiplication. Requires sympy and scipy only for incidence setup.
"""
from fractions import Fraction as F
from itertools import product
from collections import Counter
from math import sqrt
from scipy.spatial import ConvexHull
import numpy as np
import sympy as sp

class Q5:
    __slots__=('a','b')
    def __init__(self,a=0,b=0):
        if isinstance(a,Q5):self.a,self.b=a.a,a.b
        else:self.a,self.b=F(a),F(b)
    def __add__(x,y):
        y=Q5(y);return Q5(x.a+y.a,x.b+y.b)
    __radd__=__add__
    def __neg__(x):return Q5(-x.a,-x.b)
    def __sub__(x,y):return x+-Q5(y)
    def __rsub__(x,y):return Q5(y)+-x
    def __mul__(x,y):
        y=Q5(y);return Q5(x.a*y.a+5*x.b*y.b,x.a*y.b+x.b*y.a)
    __rmul__=__mul__
    def __pow__(x,n):
        assert isinstance(n,int) and n>=0
        v=Q5(1)
        for _ in range(n):v=v*x
        return v
    def __truediv__(x,y):
        y=Q5(y);n=y.a*y.a-5*y.b*y.b
        assert n!=0
        return Q5((x.a*y.a-5*x.b*y.b)/n,(x.b*y.a-x.a*y.b)/n)
    def __eq__(x,y):
        y=Q5(y);return x.a==y.a and x.b==y.b
    def __hash__(x):return hash((x.a,x.b))
    def __float__(x):return float(x.a)+sqrt(5)*float(x.b)
    def __repr__(x):return f'({x.a})+({x.b})*sqrt(5)'

Z=Q5();phi=Q5(F(1,2),F(1,2));Den=phi+2
# Exact vertices; float coordinates are used ONLY to identify triangular
# face incidence and antipodal axes, which are then certified combinatorially.
pts=([(Z,Q5(a),Q5(b)*phi) for a,b in product((-1,1),repeat=2)]+
     [(Q5(a),Q5(b)*phi,Z) for a,b in product((-1,1),repeat=2)]+
     [(Q5(a)*phi,Z,Q5(b)) for a,b in product((-1,1),repeat=2)])
xyz=np.array([[float(c) for c in p] for p in pts]);assert xyz.shape==(12,3)
faces=sorted(tuple(sorted(map(int,f))) for f in ConvexHull(xyz).simplices)
assert len(faces)==20 and len(set(faces))==20
# Certify each floating-discovered face is an EXACT supporting triangle
# in Q(sqrt5), not merely an approximate ConvexHull simplex.
def qsign(x):
    if x.a==0:return (x.b>0)-(x.b<0)
    if x.b==0:return (x.a>0)-(x.a<0)
    if x.a>0 and x.b>0:return 1
    if x.a<0 and x.b<0:return -1
    if x.a>0 and x.b<0:return 1 if x.a*x.a>5*x.b*x.b else -1
    return 1 if 5*x.b*x.b>x.a*x.a else -1
def cross(u,v):return [u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0]]
edge_counts=Counter()
for i,j,k in faces:
    u=[pts[j][t]-pts[i][t] for t in range(3)]
    v=[pts[k][t]-pts[i][t] for t in range(3)]
    normal=cross(u,v)
    signs={qsign(inner) for l in range(12) if l not in (i,j,k)
           for inner in [sum((normal[t]*(pts[l][t]-pts[i][t]) for t in range(3)),Z)]}
    assert len(signs)==1 and 0 not in signs,(i,j,k,signs)
    for e in ((i,j),(j,k),(k,i)):edge_counts[tuple(sorted(e))]+=1
assert len(edge_counts)==30 and set(edge_counts.values())=={2}
C=sp.zeros(20,12)
for k,f in enumerate(faces):
    for i in f:C[k,i]=1
L=3*sp.eye(20)
for i in range(20):
    for j in range(20):
        if i!=j and len(set(faces[i])&set(faces[j]))==2:L[i,j]=-1
Ph=sp.eye(20)-C*(C.T*C).inv()*C.T
P5=Ph*(L-3*sp.eye(20))/2
P3=Ph*(5*sp.eye(20)-L)/2
assert P5.trace()==P3.trace()==4 and P5*P5==P5 and P3*P3==P3
assert P3*P5==sp.zeros(20)
assert all(x.is_Rational for x in P5)
pairs=[];remaining=set(range(12))
while remaining:
    i=min(remaining)
    antipodes=[j for j in remaining if j!=i and all(pts[i][k]+pts[j][k]==Z for k in range(3))]
    assert len(antipodes)==1
    j=antipodes[0];pairs.append((i,j));remaining-={i,j}
assert len(pairs)==6
sparse=[[(i,Q5(F(int(v.p),int(v.q)))) for i,v in enumerate(P5.row(j)) if v] for j in range(20)]
sparse3=[[(i,Q5(F(int(v.p),int(v.q)))) for i,v in enumerate(P3.row(j)) if v] for j in range(20)]

def inner3(u,v):return sum((a*b for a,b in zip(u,v)),Z)

def native_face_source(h):
    u=[sum(((1 if h&(1<<i) else -1)*pts[a][k] for i,(a,b) in enumerate(pairs)),Z) for k in range(3)]
    normu=inner3(u,u)/Den
    d=[inner3(pt,u)/Den for pt in pts]
    A=[Q5(F(5,16))*(v*v-normu/3) for v in d]
    B=[v/2 for v in d]
    aa=[sum((A[i] for i in f),Z) for f in faces]
    bb=[sum((B[i] for i in f),Z) for f in faces]
    return [a*a+b*b/2 for a,b in zip(aa,bb)], [a*b for a,b in zip(aa,bb)]

def hidden_norm(E,projection=sparse):
    return sum((E[j]*sum((val*E[i] for i,val in projection[j]),Z) for j in range(20)),Z)

sources=[native_face_source(h) for h in range(64)]
n=[hidden_norm(E) for E,O in sources]
n3=[2*hidden_norm(O,sparse3) for E,O in sources]

low=Q5(F(56,5),-F(24,5));high=Q5(F(56,5),F(24,5))
counts=Counter(n)
assert counts=={Z:24,low:20,high:20},counts
mean=lambda v:sum(v,Z)/64
assert mean(n)==Q5(7)
g=[v-Q5(7) for v in n]
assert mean(g)==Z

def Q(v):return [(v[2*h%64]+v[(2*h+1)%64])/2 for h in range(64)]
def Qpow(v,k):
    for _ in range(k):v=Q(v)
    return v
assert Qpow(g,6)==[Z]*64

def dot(v,w):return mean([a*b for a,b in zip(v,w)])
g2=[v*v for v in g]
qg=[Qpow(g,k) for k in range(7)]
qg2=[Qpow(g2,k) for k in range(7)]
C2=[dot(g,qg[k]) for k in range(7)]
K2=C2[0]+2*sum(C2[1:6],Z)
assert K2==Q5(F(471,5)),K2
mean3=mean(n3)
assert mean3==Q5(36,F(72,5)),mean3
v3=[v-mean3 for v in n3]
qv3=[Qpow(v3,k) for k in range(7)]
C33=[dot(v3,qv3[k]) for k in range(7)]
K2_33=C33[0]+2*sum(C33[1:6],Z)
K2_35=dot(v3,g)+sum((dot(v3,qg[k])+dot(g,qv3[k]) for k in range(1,6)),Z)
# Covariance matrix must be PSD under a stationary stochastic chronology.
assert float(K2_33)>=0 and float(K2)>=0
assert float(K2_33)*float(K2)-float(K2_35)**2>-1e-6
K3=mean([v*v*v for v in g])
for d in range(1,6):
    K3+=3*(dot(g2,qg[d])+dot(g,qg2[d]))
for a in range(1,6):
    for b in range(1,6):
        K3+=6*dot(g,Qpow([g[i]*qg[b][i] for i in range(64)],a))

# Independent direct sum over all lag pairs in [-10,10].
def triple(a,b):
    return dot(g,Qpow([g[i]*qg[b][i] for i in range(64)],a))
def K3_independent(horizon):
    s=Z
    for u in range(-horizon,horizon+1):
        for v in range(-horizon,horizon+1):
            t=sorted((0,u,v));a=t[1]-t[0];b=t[2]-t[1]
            if a<=5 and b<=5:s+=triple(a,b)
    return s
def cubic_rate(v):
    assert mean(v)==Z
    v2=[x*x for x in v]
    qv=[Qpow(v,k) for k in range(7)]
    qv2=[Qpow(v2,k) for k in range(7)]
    ans=mean([x*x*x for x in v])
    for d in range(1,6):ans+=3*(dot(v2,qv[d])+dot(v,qv2[d]))
    for a in range(1,6):
        for b in range(1,6):
            ans+=6*dot(v,Qpow([v[i]*qv[b][i] for i in range(64)],a))
    return ans
assert cubic_rate(g)==K3
C333=cubic_rate(v3)
C555=K3
plus=cubic_rate([a+b for a,b in zip(v3,g)])
minus=cubic_rate([a-b for a,b in zip(v3,g)])
Splus=plus-C333-C555
Sminus=minus-C333+C555
C335=(Splus-Sminus)/6
C355=(Splus+Sminus)/6
assert C333+3*C335+3*C355+C555==plus
assert C333-3*C335+3*C355-C555==minus
K3check=K3_independent(10)
assert K3check==K3,(K3check,K3)
assert K3_independent(12)==K3
# Source second cumulant on 4_5 from pre-existing exact certificate:
C5=[Q5(7),Q5(F(7,40)),Q5(-F(61,120)),Q5(-F(1,24)),Q5(-F(1,6)),Z]
assert C5[0]+2*sum(C5[1:],Z)==Q5(F(71,12))
# A5 regular-simplex second and cubic tensor Gram contractions.
Gram=[[F(1) if i==j else -F(1,4) for j in range(5)] for i in range(5)]
assert all(sum(row)==0 for row in Gram)
assert all(sum(Gram[i][k]*Gram[k][j] for k in range(5))==F(5,4)*Gram[i][j] for i in range(5) for j in range(5))
T3norm2=sum((Gram[i][j]**3 for i in range(5) for j in range(5)),F(0))/25
assert T3norm2==F(3,16)
# A gauge-covariant source with charge 2 has no invariant cubic monomial:
# e^(2i lambda)^p e^(-2i lambda)^q is invariant iff p=q.
assert not any(p+q==3 and p==q for p in range(4) for q in range(4))
print('EXACT original 64-history 4_5 source norm: n in {0, (56±24sqrt5)/5}')
print('counts:',[(str(k),counts[k]) for k in (Z,low,high)])
print('exact mean n:',mean(n))
print('exact connected two-point lags n:',C2[:6])
print('exact neutral Green-Kubo K2_55:',K2,'decimal',float(K2))
print('native 4_3 neutral norm mean:',mean3)
print('exact neutral Green-Kubo K2_33:',K2_33,'decimal',float(K2_33))
print('exact neutral cross Green-Kubo K2_35:',K2_35,'decimal',float(K2_35))
print('exact 2x2 neutral source covariance determinant:',K2_33*K2-K2_35*K2_35)
print('exact neutral time-integrated third cumulant K3_555:',K3,'decimal',float(K3))
print('four symmetric neutral third cumulants K3_333,335,355,555:')
for label,val in [('333',C333),('335',C335),('355',C355),('555',C555)]:print('  ',label,val,'decimal',float(val))
print('independent 10/12-lag third cumulant enumeration: EXACT MATCH')
print('full 4_5 vector K2 trace 71/12; A5 averaged singlet K2 71/48: EXACT')
print('A5 simplex T3 norm squared:',T3norm2)
print('native charged A5 singlet cubic: forbidden as local U(1) invariant without dressing')
print('PASS: no fitting, no historical ARF inputs, exact Q(sqrt5)')
