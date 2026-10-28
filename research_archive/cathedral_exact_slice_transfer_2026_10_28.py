"""Reproduce exact interacting slice from all-five-Platonic/H64 incidence.
Rational norms 2/5, 2/15 are finite incidence results, never fitted data.
Restricted witness, not a nature/continuum mass-gap proof.
"""
import json, math
import numpy as np
from scipy.linalg import eigh
phi=(1+math.sqrt(5))/2
Delta=3/20-80*math.pi/(1053*phi)
A=1/810+Delta**2/1920
mu=(1/45+Delta**2/120)/A
d=(1/45+Delta**2/120)/math.sqrt(A)
c=1/10+Delta**2/30
ceff=4/45+7*Delta**2/240
assert abs(c-d*d/(2*mu)-ceff)<1e-14

def V(t,s):
    return 3*t*t+0.5*mu*s*s+c*t**4-d*s*t*t

n=17
xs=np.linspace(-1.5,1.5,n)
h=xs[1]-xs[0]
w1=np.ones(n)
w1[1:-1:2]=4
w1[2:-1:2]=2
w1*=h/3
nodes=np.array([(x,y) for x in xs for y in xs])
weights=np.array([x*y for x in w1 for y in w1])
values=np.array([V(*q) for q in nodes])
D=((nodes[:,None,:]-nodes[None,:,:])**2).sum(axis=2)
K=np.sqrt(np.outer(weights,weights))*np.exp(-.5*(values[:,None]+values[None,:])-D/2)
e=np.sort(eigh(K,eigvals_only=True))[::-1]
assert e[0]>e[1]>0 and e[-1]>-1e-13
print(json.dumps(dict(Delta=Delta,mu=mu,d=d,c=c,ceff=ceff,
   eigen_0=float(e[0]),eigen_1=float(e[1]),
   gap=float(math.log(e[0]/e[1])),grid_nodes=len(nodes)),indent=2))
