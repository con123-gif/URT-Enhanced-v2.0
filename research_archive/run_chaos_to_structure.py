"""
URT chaos-to-structure simulation.

The same frozen URT recursion is applied to random point clouds on S^2 with:

    N = 2, 3, 4, 6, 12.

No target coordinates or target edges enter the update.

Expected selected structures, checked only after convergence:

    N=2  antipodal pair
    N=3  equilateral triangle
    N=4  tetrahedron
    N=6  octahedron
    N=12 icosahedron
"""

import math
import numpy as np

ALPHA = 1.155
THETA_H = 2.4
BETA = 0.235
GAMMA = 1/81
PHI = (1 + math.sqrt(5))/2
DELTA_STAR = ((1-GAMMA)*math.pi)/(13*PHI)

def normalize(x):
    return x/np.linalg.norm(x, axis=1)[:,None]

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

def select(N,seed=0):
    rng=np.random.default_rng(seed)
    x=normalize(rng.normal(size=(N,3)))
    p=np.zeros(N)
    S=entropy(x)

    for iteration in range(5000):
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

    return x,iteration+1,S

for N in [2,3,4,6,12]:
    x,iterations,S=select(N,seed=0)
    print()
    print("N =",N)
    print("iterations =",iterations)
    print("ordering entropy =",S)
    print("coordinates:")
    print(x)