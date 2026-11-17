#!/usr/bin/env python3
"""Newton's Cathedral: native icosahedral hidden W -> KMS relative entropy,
444 golden barrier Gibbs entropy, conditional 24-track entropy production.
Finite exact-form identities with numerical checks; no physical clock or baryogenesis claim.
"""
import numpy as np
from itertools import product, combinations
from math import log, pi, sqrt, sin, exp, tanh

phi=(1+sqrt(5))/2
Delta=3/20-80*pi/(1053*phi)
eta=-log(Delta)
V=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)] +
           [(a,b*phi,0) for a,b in product((-1,1),repeat=2)] +
           [(a*phi,0,b) for a,b in product((-1,1),repeat=2)], dtype=float)
E=[(i,j) for i,j in combinations(range(12),2) if abs(np.sum((V[i]-V[j])**2)-4)<1e-9]
ES=set(E)
faces=[f for f in combinations(range(12),3) if all(e in ES for e in combinations(f,2))]
assert len(E)==30 and len(faces)==20
C=np.array([[int(j in f) for j in range(12)] for f in faces],float)
L=np.array([[3 if i==j else (-1 if len(set(faces[i])&set(faces[j]))==2 else 0) for j in range(20)] for i in range(20)],float)
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
P3=Ph@(5*np.eye(20)-L)/2
P5=Ph@(L-3*np.eye(20))/2
P3=(P3+P3.T)/2;P5=(P5+P5.T)/2
F=[V[list(f)].sum(axis=0) for f in faces]
W=np.zeros((20,20))
for i in range(20):
 for j in range(20):
  ch=sum(V[k]@np.cross(F[i],F[j]) for k in set(faces[i])&set(faces[j]))
  if abs(ch)>1e-9: W[i,j]=np.sign(ch)
assert np.linalg.norm(W+W.T)<1e-9
assert np.linalg.norm(W@W+15*Ph)<1e-9
assert np.linalg.norm(P3@W@P3)+np.linalg.norm(P5@W@P5)<1e-8
assert np.linalg.norm(L@W+W@L-8*W)<1e-9

p5=Delta**2/(1+Delta**2)
a=1/(4*(1+Delta**2))
b=a*Delta**2
rho=a*P3+b*P5
lnrho=np.log(a)*P3+np.log(b)*P5
assert abs(np.trace(rho)-1)<1e-11
# The native hidden generator R = W/sqrt(15), R^2 = -Ph.
R=W/sqrt(15)
for angle in [0.001,0.1,0.7,pi/2]:
 U=(np.eye(20)-Ph)+np.cos(angle)*Ph+np.sin(angle)*R
 rt=U@rho@U.T
 # Relative entropy is computed in the exact rank-8 support;
 # log(rt)=U log(rho) U^T, zeros on visible complement.
 Drel=float(np.trace(rt@(U@lnrho@U.T-lnrho)))
 predicted=2*eta*(1-Delta**2)/(1+Delta**2)*np.sin(angle)**2
 dE=float(np.trace(rt@L)-np.trace(rho@L))
 assert abs(Drel-predicted)<1e-9,(angle,Drel,predicted)
 assert abs(Drel-eta*dE)<1e-9,(angle,Drel,eta*dE)
 print('native hidden angle',angle,'relative entropy D',Drel,'energy rise',dE)
print('native hidden full-swap Dmax',2*eta*(1-Delta**2)/(1+Delta**2))

# Exact three-shell 444 Gibbs entropy. Count all states, not a synthetic partition.
levels={}
for center in (-1,1):
 for mask in range(4096):
  s=np.array([1-2*((mask>>i)&1) for i in range(12)])
  Eg=sum(s[i]*s[j] for i,j in E)-phi*center*np.sum(s)
  if Eg<=-10+1e-9:levels[round(float(Eg),8)]=levels.get(round(float(Eg),8),0)+1
assert sorted(levels.values())==[60,144,240],levels
x=exp(-eta*(sqrt(5)-1))
Z=60+240*x+144*x*x
ps=np.array([60,240*x,144*x*x])/Z
S=log(Z)+eta*(sqrt(5)-1)*(ps[1]+2*ps[2])
assert abs(ps.sum()-1)<1e-14
print('444 exact Gibbs Zrelative',Z,'shell probabilities',ps,'S/kB',S)

# Distinguish driven current entropy production from reversible equilibrium.
epsilon=pi/(3*phi**12)
alpha=epsilon/24
sig24=2*epsilon*tanh(alpha)
print('KMS p5',p5,'hidden S/kB',log(4)-(p5*log(p5)+(1-p5)*log(1-p5)),
      '24-clock nonequilibrium EP per 24 transitions',sig24)
print('Finite native algebra and entropy identities: PASS (model-level)')