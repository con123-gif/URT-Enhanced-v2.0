"""
Standalone URT selection simulation.

The complete executed version, numerical tables, figures and report are in the
same output package. This compact script contains the core selection rule.
"""

import math
import numpy as np
from scipy.spatial import ConvexHull

ALPHA = 1.155
THETA_H = 2.4
BETA = 0.235
GAMMA = 1/81
PHI = (1 + math.sqrt(5))/2
DELTA_STAR = ((1-GAMMA)*math.pi)/(13*PHI)

def normalize(x):
    return x/np.linalg.norm(x, axis=1)[:, None]

def entropy(x):
    d=x[:,None,:]-x[None,:,:]
    r=np.linalg.norm(d,axis=2)
    iu=np.triu_indices(len(x),1)
    return float(np.sum(np.log(r[iu])))

def gradient(x):
    d=x[:,None,:]-x[None,:,:]
    r2=np.sum(d*d,axis=2)
    np.fill_diagonal(r2,np.inf)
    g=np.sum(d/r2[:,:,None],axis=1)
    return g-np.sum(g*x,axis=1)[:,None]*x

def phi(p):
    return np.where(np.abs(p)<=math.pi,np.sin(p),np.sign(p))

def exp_sphere(x,v):
    n=np.linalg.norm(v,axis=1)
    y=x.copy()
    active=n>1e-15
    y[active]=(
        np.cos(n[active])[:,None]*x[active]
        +np.sin(n[active])[:,None]*v[active]/n[active,None]
    )
    return normalize(y)

def select(seed=0):
    rng=np.random.default_rng(seed)
    x=normalize(rng.normal(size=(12,3)))
    p=np.zeros(12)
    S=entropy(x)

    for iteration in range(6000):
        g=gradient(x)
        q=np.linalg.norm(g,axis=1)
        u=q/(1+q)

        p_new=BETA*(ALPHA*(p-THETA_H*phi(p))+u)

        direction=np.divide(
            g,q[:,None],
            out=np.zeros_like(g),
            where=q[:,None]>1e-15,
        )

        step=DELTA_STAR*p_new[:,None]*direction
        y=exp_sphere(x,step)
        Sy=entropy(y)

        scale=1.0
        while Sy<S-1e-14:
            scale*=0.5
            y=exp_sphere(x,scale*step)
            Sy=entropy(y)

        movement=np.max(np.linalg.norm(y-x,axis=1))
        x,p,S=y,p_new,Sy

        if movement<1e-10 and np.max(q)<1e-7:
            break

    return x,iteration+1

x,iterations=select(0)
hull=ConvexHull(x)
edges=set()

for a,b,c in hull.simplices:
    edges.update({
        tuple(sorted((int(a),int(b)))),
        tuple(sorted((int(b),int(c)))),
        tuple(sorted((int(c),int(a)))),
    })

degrees=[sum(i in edge for edge in edges) for i in range(12)]

A=np.zeros((13,13))
for i,j in edges:
    A[i,j]=A[j,i]=1
for i in range(12):
    A[i,12]=A[12,i]=1

L=np.diag(A.sum(axis=1))-A

print("Iterations:",iterations)
print("Entropy:",entropy(x))
print("Hull edges:",len(edges))
print("Hull faces:",len(hull.simplices))
print("Degrees:",degrees)
print("Centred spectrum:")
print(np.linalg.eigvalsh(L))