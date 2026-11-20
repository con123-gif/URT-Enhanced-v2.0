#!/usr/bin/env python3
"""Q162d — Original Q101/H64 source creates a GLOBAL charge-four quadratic response.

Native icosahedron 12 contacts/20 faces, true P3/P5, original H64 Uh,
actual 60 frustrated ground configurations and 24 golden temporal blocks.
The facewise product is a DECLARED nonlinear source operation, not yet a
unique local-gauge-covariant physical interaction. No fitted parameters.
"""
from itertools import product,combinations
import math
import numpy as np
import sympy as sp
import networkx as nx

phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
r=math.pi/math.e;theta=2*math.pi/phi**2
v=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
 +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
 +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
ed=sorted((i,j) for i,j in combinations(range(12),2)
          if abs(np.sum((v[i]-v[j])**2)-4)<1e-11)
faces=sorted(f for f in combinations(range(12),3)
        if all(tuple(sorted((i,j))) in ed for i,j in combinations(f,2)))
assert len(ed)==30 and len(faces)==20
C=np.zeros((20,12))
for i,f in enumerate(faces):C[i,list(f)]=1
L=np.array([[3 if i==j else (-1 if len(set(faces[i])&set(faces[j]))==2 else 0)
    for j in range(20)] for i in range(20)],float)
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
P3=Ph@(5*np.eye(20)-L)/2
P5=Ph@(L-3*np.eye(20))/2
assert np.linalg.norm(P3@P5)<1e-11
assert np.linalg.matrix_rank(P3)==np.linalg.matrix_rank(P5)==4
opp={i:next(j for j in range(12) if np.linalg.norm(v[i]+v[j])<1e-12)
     for i in range(12)}
Kv=np.zeros((12,12))
for i,j in opp.items():Kv[i,j]=1
Pl=v@np.linalg.inv(v.T@v)@v.T+(np.eye(12)+Kv)/2-np.ones((12,12))/12
assert np.linalg.norm(Pl@Pl-Pl)<1e-12
pairs=[];remaining=set(range(12))
while remaining:
 i=min(remaining);j=opp[i];pairs.append((i,j));remaining-={i,j}
M=np.zeros((64,20))
for k in range(64):
 selected={pairs[j][(k>>j)&1] for j in range(6)}
 for i,f in enumerate(faces):M[k,i]=int(set(f).issubset(selected))
Uh=M@Ph/math.sqrt(2)
H8=15*np.eye(64)
for k in range(64):
 for i,j in combinations(range(6),2):H8[k,k^(1<<i)^(1<<j)]-=1
assert np.linalg.norm(Uh.T@Uh-Ph)<1e-11
assert np.linalg.norm(H8@Uh@P3-18*Uh@P3)<1e-10
assert np.linalg.norm(H8@Uh@P5-16*Uh@P5)<1e-10

# Original 60 ground configurations from 13-contact phi-frustration.
ground=[]
for mask in range(4096):
 s=np.array([1-2*((mask>>i)&1) for i in range(12)],float)
 if sum(s[i]*s[j] for i,j in ed)==-6 and abs(sum(s))==4:
  ground.append((mask,s))
assert len(ground)==60
# Exactly two inversion-paired 30-state SO3 icosahedral orbits.
g=nx.Graph();g.add_nodes_from(range(12));g.add_edges_from(ed)
rot=[]
for auto in nx.algorithms.isomorphism.GraphMatcher(g,g).isomorphisms_iter():
 w=np.array([v[auto[i]] for i in range(12)])
 A=np.linalg.lstsq(v,w,rcond=None)[0]
 if abs(np.linalg.det(A)-1)<1e-10 and np.linalg.norm(v@A-w)<1e-10:
  rot.append(auto)
assert len(rot)==60
rep=ground[0][1];orbit=set()
for auto in rot:
 s=np.zeros(12)
 for i in range(12):s[auto[i]]=rep[i]
 orbit.add(tuple(s))
assert len(orbit)==30
assert len(orbit | {tuple(-np.array(x)) for x in orbit})==60

values=[]
for mask,s in ground:
 f=(C@(Pl@s))**2
 h3=P3@f;h5=P5@f
 u=h3+Delta*h5
 Q=Ph@(u*u);q3=P3@Q;q5=P5@Q
 assert np.linalg.norm(q3-2*Delta*P3@(h3*h5))<1e-11
 assert np.linalg.norm(q5-P5@(h3*h3+Delta**2*h5*h5))<1e-11
 assert abs(np.linalg.norm(Uh@u)**2-np.linalg.norm(u)**2)<1e-10
 assert abs(np.linalg.norm(Uh@Q)**2-np.linalg.norm(Q)**2)<1e-10
 values.append((np.vdot(h3,h3).real,np.vdot(h5,h5).real,
    np.vdot(q3,q3).real,np.vdot(q5,q5).real,np.vdot(Q,Q).real))
values=np.array(values)
t=Delta**2/3
expected=np.array([32/5,32/15,(128/375)*4*t,
                   (128/375)*(1-t)**2,(128/375)*(1+t)**2])
assert np.max(abs(values-expected))<1e-10,(values[0],expected)

# Exact Q(sqrt(5)) on a representative. SO3 orbit + inversion shows
# each norm equality is universal over all 60 source ground states.
s5=sp.sqrt(5);gold=(1+s5)/2
vs=sp.Matrix([(0,a,b*gold) for a,b in product((-1,1),repeat=2)]
 +[(a,b*gold,0) for a,b in product((-1,1),repeat=2)]
 +[(a*gold,0,b) for a,b in product((-1,1),repeat=2)])
Cs=sp.Matrix(C.astype(int));Ls=sp.Matrix(L.astype(int))
Hs=sp.eye(20)-Cs*(Cs.T*Cs).inv()*Cs.T
P3s=Hs*(5*sp.eye(20)-Ls)/2;P5s=Hs*(Ls-3*sp.eye(20))/2
Ks=sp.Matrix(Kv.astype(int))
Pls=sp.simplify(vs*(vs.T*vs).inv()*vs.T
 +(sp.eye(12)+Ks)/2-sp.ones(12,12)/12)
s=sp.Matrix([int(x) for x in rep]);z=Cs*Pls*s
f=sp.Matrix([sp.expand(x*x) for x in z])
a=sp.simplify(P3s*f);b=sp.simplify(P5s*f)
A=sp.simplify(P5s*sp.Matrix([x*x for x in a]))
B=sp.simplify(P3s*sp.Matrix([2*x*y for x,y in zip(a,b)]))
D=sp.simplify(P5s*sp.Matrix([x*x for x in b]))
assert sp.simplify(a.dot(a)-sp.Rational(32,5))==0
assert sp.simplify(b.dot(b)-sp.Rational(32,15))==0
for val,target in [(A.dot(A),sp.Rational(128,375)),
 (B.dot(B),sp.Rational(512,1125)),
 (D.dot(D),sp.Rational(128,3375)),
 (A.dot(D),-sp.Rational(128,1125))]:
 assert sp.simplify(val-target)==0,(val,target)

# True H64 history energy levels 18 / 16 and Q161by 24 golden clock.
n2=32/5+(32/15)*Delta**2
n4=expected[4]
e2=(18*(32/5)+16*(32/15)*Delta**2)/n2
e4=(18*expected[2]+16*expected[3])/n4
assert abs(e2-(16+2/(1+t)))<1e-11
assert abs(e4-(16+8*t/(1+t)**2))<1e-11
wm=np.array([r*r*(2-2*math.cos(theta-2*math.pi*m/24))
             for m in range(24)])
chi2=np.mean((32/5)/(18+wm)+(32/15)*Delta**2/(16+wm))
chi4=np.mean(expected[2]/(18+wm)+expected[3]/(16+wm))
ratio=(chi4/n4)/(chi2/n2)
assert abs(ratio-1.109242669037929)<1e-11

# Global U1 charge doubling succeeds. Facewise local U1 DOES NOT
# commute with fixed hidden projection; no physical Ward closure claimed.
f=(C@(Pl@rep))**2
base=P3@f+Delta*P5@f
assert np.linalg.norm(Ph@((np.exp(2j*theta)*base)**2)
     -np.exp(4j*theta)*Ph@(base**2))<1e-11
locphase=theta*np.cos(np.arange(20)*2*math.pi/20)
Dloc=np.diag(np.exp(4j*locphase))
leak=np.linalg.norm(Ph@Dloc@(Ph@(base*base))-Dloc@(Ph@(base*base)))
assert leak>0.1
print('Q162d exact +4 norm²:',(128/375)*(1+Delta**2/3)**2)
print('Q162d all 60 states, H64 charge +2/+4 levels:',e2,e4)
print('Q162d 24-clock chi2 chi4 gain:',chi2,chi4,ratio)
print('Q162d local gauge leakage:',leak)
print('Q162d CERTIFIED finite GLOBAL U1, local Q96 Ward still OPEN')
