#!/usr/bin/env python3
"""Exact five-Platonic-solid cellular kernel certificate; native bridge theorem."""
from itertools import product
from math import sqrt
import numpy as np
import sympy as sp
from scipy.spatial import ConvexHull
phi=(1+sqrt(5))/2
verts=[[(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)],list(product((-1,1),repeat=3)),[(1,0,0),(-1,0,0),(0,1,0),(0,-1,0),(0,0,1),(0,0,-1)],list(product((-1,1),repeat=3))+[(0,a/phi,b*phi) for a,b in product((-1,1),repeat=2)]+[(a/phi,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b/phi) for a,b in product((-1,1),repeat=2)],[(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)]]
expected=[(4,6,4),(8,12,6),(6,12,8),(20,30,12),(12,30,20)]
for pts,exp in zip(verts,expected):
    assert np.max(np.abs(np.sum(np.asarray(pts,float),axis=0)))<1e-10
    pts=np.asarray(pts,float);hull=ConvexHull(pts);groups=[]
    for tri,eq in zip(hull.simplices,hull.equations):
        for g in groups:
            if np.linalg.norm(eq[:3]-g[0])<1e-7 and abs(eq[3]-g[1])<1e-7:
                g[2].update(map(int,tri));break
        else:groups.append([eq[:3],eq[3],set(map(int,tri))])
    faces=[]
    for normal,_,indices in groups:
        ids=sorted(indices);cen=np.mean(pts[ids],axis=0)
        e1=pts[ids[0]]-cen;e1/=np.linalg.norm(e1);e2=np.cross(normal,e1)
        faces.append(sorted(ids,key=lambda i:np.arctan2(np.dot(pts[i]-cen,e2),np.dot(pts[i]-cen,e1))))
    assert np.max(np.abs(np.sum([np.mean(pts[f],axis=0) for f in faces],axis=0)))<1e-9
    edges=sorted(set(tuple(sorted((i,j))) for f in faces for i,j in zip(f,f[1:]+f[:1])))
    V,E,F=len(pts),len(edges),len(faces)
    assert (V,E,F)==exp
    idx={edge:k for k,edge in enumerate(edges)}
    b1=sp.zeros(V,E);b2=sp.zeros(E,F)
    for k,(i,j) in enumerate(edges):b1[i,k]=-1;b1[j,k]=1
    for k,f in enumerate(faces):
        for i,j in zip(f,f[1:]+f[:1]):b2[idx[tuple(sorted((i,j)))],k]=1 if i<j else -1
    assert b1*b2==sp.zeros(V,F)
    assert b1.rank()==V-1 and b2.rank()==F-1 and V-E+F==2
    print(f'V,E,F={V},{E},{F}; exact ranks b1={V-1}, b2={F-1}; H0=H2=1 H1=0')
L=5*sp.eye(5)-sp.ones(5)
assert L.rank()==4 and L*sp.ones(5,1)==sp.zeros(5,1)
assert sum(map(sum,expected))==190
print('Q161bz EXACT PASS: native five-solid boundary ranks and dipole orthogonality. K rank188 follows from archived positive Cbridge formula, not a direct matrix-rank test.')
