#!/usr/bin/env python3
"""New source-level Ward-neutral observable from the native 64 six-bit
history, all-five-solid pullback, icosahedral hidden 4_5 and 24-clock.
No historical ARF targets, fitted coefficients or third-party material.
The 24-clock appears in the gauge dressing theorem (not a spurious factor
in a stationary six-bit source cumulant)."""
from itertools import product
from math import sqrt
import numpy as np
from scipy.spatial import ConvexHull
from fractions import Fraction

phi=(1+sqrt(5))/2
points=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
assert points.shape==(12,3)
hull=ConvexHull(points)
faces=sorted([tuple(sorted(map(int,f))) for f in hull.simplices])
assert len(faces)==20
C=np.zeros((20,12))
for k,f in enumerate(faces):C[k,list(f)]=1
L=3*np.eye(20)
for i in range(20):
    for j in range(20):
        if i!=j and len(set(faces[i]).intersection(faces[j]))==2:L[i,j]=-1
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
P3=Ph@(5*np.eye(20)-L)/2
P5=Ph@(L-3*np.eye(20))/2
assert np.linalg.norm(P5@P5-P5)<1e-12
assert abs(np.trace(P5)-4)<1e-12
pairs=[];remaining=set(range(12))
while remaining:
    i=min(remaining)
    j=min(remaining-{i},key=lambda k:np.linalg.norm(points[i]+points[k]))
    assert np.linalg.norm(points[i]+points[j])<1e-12
    pairs.append((i,j));remaining.remove(i);remaining.remove(j)
assert len(pairs)==6
Den=phi+2
E=[];O=[]
for h in range(64):
    u=sum((1 if h&(1<<i) else -1)*points[a] for i,(a,b) in enumerate(pairs))
    # Pair index order does not matter: each vertex pair is antipodal.
    normu=(u@u)/Den
    d=points@u/Den
    A=5/16*(d*d-normu/3)
    B=d/2
    Es=np.array([(sum(A[list(f)]))**2+0.5*(sum(B[list(f)]))**2 for f in faces])
    E.append(Es)
    O.append(np.array([sum(A[list(f)])*sum(B[list(f)]) for f in faces]))
E=np.array(E);O=np.array(O)
Q=np.zeros((64,64))
for h in range(64):
    Q[h,(2*h)%64]+=.5
    Q[h,(2*h+1)%64]+=.5
assert np.max(np.abs(np.linalg.matrix_power(Q,6)-np.ones((64,64))/64))<1e-15
Powers=[np.linalg.matrix_power(Q,k) for k in range(12)]
C5=[np.einsum('hi,ij,hj->',E,P5,Powers[k]@E)/64 for k in range(6)]
# The exact native certificate is C5=[7,7/40,-61/120,-1/24,-1/6,0].
want=np.array([7,7/40,-61/120,-1/24,-1/6,0])
assert np.max(np.abs(np.array(C5)-want))<2e-11,(C5,want)
C3=[2*np.einsum('hi,ij,hj->',O,P3,Powers[k]@O)/64 for k in range(6)]
want3=np.array([36+72*sqrt(5)/5,18/5+36*sqrt(5)/25,27/25+9*sqrt(5)/25,36/25+18*sqrt(5)/25,0,0])
assert np.max(np.abs(np.array(C3)-want3))<2e-10,(C3,want3)
G5=C5[0]+2*sum(C5[1:])
assert abs(G5-71/12)<2e-11

# A genuinely gauge-neutral observable, n=||P5 E||^2, rather than
# the gauge-charged linear tetrahedral scalar g=v^T P5 E.
n=np.einsum('hi,ij,hj->h',E,P5,E)
assert np.min(n)>-1e-11
n3=2*np.einsum('hi,ij,hj->h',O,P3,O)
assert abs(n3.mean()-(36+72*sqrt(5)/5))<1e-10
mu=n.mean();g=n-mu
assert abs(g.mean())<1e-12
Qv=lambda v,k:Powers[k]@v
inner=lambda a,b:float(np.dot(a,b)/64)
K2=inner(g,g)+2*sum(inner(g,Qv(g,d)) for d in range(1,6))
g3=n3-n3.mean()
K2_33=inner(g3,g3)+2*sum(inner(g3,Qv(g3,d)) for d in range(1,6))
K2_35=inner(g3,g)+sum(inner(g3,Qv(g,d))+inner(g,Qv(g3,d)) for d in range(1,6))
assert abs(K2_33-(2554416+1135296*sqrt(5))/625)<2e-8
assert abs(K2_35-(11556/25+23112*sqrt(5)/125))<2e-8
K3=inner(g*g,g)
for d in range(1,6):K3+=3*(inner(g*g,Qv(g,d))+inner(g,Qv(g*g,d)))
for a in range(1,6):
    for b in range(1,6):
        K3+=6*inner(g,Qv(g*Qv(g,b),a))
# Independent stationary 64-state 3-point computation over all ordered
# pairs of lags. Finite memory ensures exact stabilization by horizon 10.
D=np.diag(g)
def triple(a,b):
    return float(g@Powers[a]@D@Powers[b]@g/64)
def k3_brute(L):
    out=0.
    for u in range(-L,L+1):
        for v in range(-L,L+1):
            t=sorted((0,u,v));a=t[1]-t[0];b=t[2]-t[1]
            if a<6 and b<6:out+=triple(a,b)
    return out
assert abs(K3-k3_brute(10))<2e-7*(1+abs(K3)),(K3,k3_brute(10))
assert abs(k3_brute(10)-k3_brute(12))<2e-7*(1+abs(K3))
# Independent direct lag enumeration of the full neutral 2-source cubic
# tensor. Reconstruct the mixed components from four polynomial evaluations.
def brute_for(v,L=10):
    Dv=np.diag(v)
    out=0.0
    for u in range(-L,L+1):
        for w in range(-L,L+1):
            t=sorted((0,u,w));a=t[1]-t[0];b=t[2]-t[1]
            if a<6 and b<6:out+=float(v@Powers[a]@Dv@Powers[b]@v/64)
    return out
N333=brute_for(g3);N555=brute_for(g)
Np=brute_for(g3+g);Nm=brute_for(g3-g)
N335=((Np-N333-N555)-(Nm-N333+N555))/6
N355=((Np-N333-N555)+(Nm-N333+N555))/6
expected=[(8470303488+3786974208*sqrt(5))/15625,
          (182596032+81248832*sqrt(5))/3125,
          (4092552+1671408*sqrt(5))/625,
          (152754+6912*sqrt(5))/125]
assert np.max(np.abs(np.array([N333,N335,N355,N555])-expected))<5e-6
# 24-clock Ward selection: h -> exp(2i lambda)h, so all cubic source
# tensors have charge +6 and their gauge average vanishes.
roots=np.exp(2j*np.pi*np.arange(24)/24)
assert abs(sum(roots**6)/24)<1e-14
# A5 simplex exact frame identity and cubic tensor norm.
from fractions import Fraction as F
Gram=[[F(1) if i==j else -F(1,4) for j in range(5)] for i in range(5)]
assert all(sum(Gram[i])==0 for i in range(5))
assert all(sum(Gram[i][k]*Gram[k][j] for k in range(5))==F(5,4)*Gram[i][j] for i in range(5) for j in range(5))
t3norm2=sum((Gram[i][j]**3 for i in range(5) for j in range(5)),F(0))/25
assert t3norm2==F(3,16)
# Nonlinear source Ward contact in the ORIGINAL diagonal charge-one geometry:
# h_a=P_a (C x)^2 has charge two, n_a=||h_a||^2 is neutral.
# The second derivative of a gauge orbit requires the x''=-x contact;
# dropping it falsely produces a nonzero gauge stiffness.
rng=np.random.default_rng(20261110)
x=rng.normal(size=12)+1j*rng.normal(size=12)
w=C@x
ward_checks=[]
for P in (P3,P5):
    h=P@(w*w)
    dn=lambda dx:2*np.real(np.vdot(h,2*P@(w*(C@dx))))
    d2n=lambda dx:2*np.real(np.vdot(2*P@(w*(C@dx)),2*P@(w*(C@dx)))+np.vdot(h,2*P@((C@dx)**2)))
    n0=np.vdot(h,h).real
    assert abs(dn(1j*x))<1e-10
    assert abs(d2n(1j*x)+dn(-x))<1e-10
    assert abs(d2n(1j*x)-4*n0)<1e-10
    assert abs(dn(-x)+4*n0)<1e-10
    for lam in (.12,-.4,.8):
        hg=P@((C@(x*np.exp(1j*lam)))**2)
        assert np.linalg.norm(hg-np.exp(2j*lam)*h)<1e-10
    ward_checks.append((n0,dn(1j*x),d2n(1j*x)+dn(-x)))
print('Original five-solid pullback: native 64 histories and hidden 4_5; 24-clock gauge phase')
print('Native exact hidden C5 lag sequence verified numerically:',C5)
print('Hidden full-quartet Green-Kubo trace:',G5,'exact 71/12')
print('Original 4_3 autocorrelation lags:',C3)
print('Independent floating K2_33 and K2_35:',K2_33,K2_35)
print('A5 five-simplex second tensor = I4/4; cubic tensor norm^2:',t3norm2)
print('Gauge-charged A5 cubic is annihilated by 24-clock Haar phase average')
print('Gauge-neutral n(h)=||P5 E(h)||^2: min/max/mean:',n.min(),n.max(),mu)
print('Gauge-neutral centered n Green-Kubo K2:',K2)
print('Gauge-neutral centered n third cumulant K3:',K3)
print('Independent 3-point lag enumeration:',k3_brute(10))
print('Independent four cubic neutral channels:',N333,N335,N355,N555)
print('Native nonlinear source Ward first/second contacts:',ward_checks)
print('PASS source-level neutral cumulant; not physical ARF or mass pole')
