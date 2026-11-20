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


# Q162a - continuating the ORIGINAL selector without changing its update.
# Previously recovered native code above is byte-for-byte the original
# archive/run_chaos_to_structure.py before its demonstration loop.
# Analytic finite nonaxial triangle groups (2,3,p) have p=3,4,5 only.
# Original scheme inputs N=4,6,12 and initial S2; N is NOT URT-derived.
# Duality is separately applied using actual computed convex-hull planes.

from fractions import Fraction
from scipy.spatial import ConvexHull
import json

triangle_families=[]
for p in range(3,101):
    defect=Fraction(1,2)+Fraction(1,3)+Fraction(1,p)-1
    if defect<=0: continue
    G=Fraction(2,1)/defect
    assert G.denominator==1
    order=int(G)
    assert order%p==order%3==order%2==0
    V,E,F=order//p,order//2,order//3
    assert V-E+F==2
    triangle_families.append((p,order,V,E,F))
assert triangle_families==[(3,12,4,6,4),(4,24,6,12,8),(5,60,12,30,20)]

def geometric_hull(P):
    hull=ConvexHull(P)
    faces=[]
    for t,plane in zip(hull.simplices,hull.equations):
        n,b=plane[:3],plane[3]
        for g in faces:
            if np.linalg.norm(g[0]-n)<1e-5 and abs(g[1]-b)<1e-5:
                g[2].update(int(z) for z in t);break
        else: faces.append([n,b,set(int(z) for z in t)])
    edges=set()
    for normal,b,ids in faces:
        ids=sorted(ids);c=P[ids].mean(axis=0)
        u=P[ids[0]]-c;u/=np.linalg.norm(u)
        v=np.cross(normal,u)
        order=sorted(ids,key=lambda i:math.atan2(np.dot(P[i]-c,v),np.dot(P[i]-c,u)))
        edges.update(tuple(sorted((i,j))) for i,j in zip(order,order[1:]+order[:1]))
    lengths=[np.linalg.norm(P[i]-P[j]) for i,j in edges]
    return dict(V=len(P),E=len(edges),F=len(faces),
                edge_cv=float(np.std(lengths)/np.mean(lengths)),
                normals=np.array([x[0] for x in faces]))

def dual(P):
    q=geometric_hull(P)['normals']
    return q/np.linalg.norm(q,axis=1)[:,None]

def info(P):
    d=geometric_hull(P)
    return {k:d[k] for k in ('V','E','F','edge_cv')}

expected={4:((4,6,4),(4,6,4)),6:((6,12,8),(8,12,6)),
          12:((12,30,20),(20,30,12))}
runs=[]
for N in (4,6,12):
    for seed in range(3):
        P,it,S=select(N,seed)
        p=info(P);d=info(dual(P))
        assert (p['V'],p['E'],p['F'])==expected[N][0],(N,seed,p)
        assert (d['V'],d['E'],d['F'])==expected[N][1],(N,seed,d)
        assert max(p['edge_cv'],d['edge_cv'])<1e-6,(N,seed,p,d)
        runs.append(dict(N=N,seed=seed,iterations=it,entropy=S,primal=p,dual=d))
        print('Q162a N',N,'seed',seed,'primal',p,'dual',d,flush=True)

# Comparison proves direct entropy optimization at 8 and 20 points
# does not select the dual objects, hence the dual operation matters.
comparisons=[]
for N,parent in ((8,6),(20,12)):
    P,it,S_direct=select(N,0)
    P_parent=select(parent,0)[0]
    S_dual=entropy(dual(P_parent))
    diff=S_direct-S_dual
    assert diff>({8:0.04,20:0.3}[N]),(N,diff)
    comparisons.append(dict(N=N,entropy_direct=S_direct,
                            entropy_dual=S_dual,entropy_gain=diff,
                            direct_hull=info(P),dual_hull=info(dual(P_parent))))
    print('Q162a direct N',N,'ordering improvement over regular dual',diff,flush=True)

# Check original approximate constants can be replaced by original exact
# pi/e and 2pi/phi^2 while preserving convergence. BETA remains .235.
alpha_old,theta_old=ALPHA,THETA_H
ALPHA=math.pi/math.e
THETA_H=2*math.pi/PHI**2
for N in (4,6,12):
    P,it,S=select(N,0)
    p,d=info(P),info(dual(P))
    assert (p['V'],p['E'],p['F'])==expected[N][0]
    assert (d['V'],d['E'],d['F'])==expected[N][1]
    assert max(p['edge_cv'],d['edge_cv'])<1e-6
ALPHA,THETA_H=alpha_old,theta_old

assert {(d['V'],d['E'],d['F']) for r in runs
        for d in (r['primal'],r['dual'])}=={
            (4,6,4),(6,12,8),(8,12,6),(12,30,20),(20,30,12)}
print('Q162a RECONSTRUCTION PASS: canonical URT+duality gives all five, conditional on N/S2/recursion.')
print('Q162a triangle families:',triangle_families)
# This script does not establish probability-one convergence, selecting
# N and S2 from unstructured chaos, or any physical masses/gauge/gravity.
