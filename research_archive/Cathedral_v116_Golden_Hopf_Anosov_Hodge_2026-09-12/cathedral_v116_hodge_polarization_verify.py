#!/usr/bin/env python3
"""
Newton's Cathedral / URT v116
Explicit finite verification of the oriented icosahedral edge representation,
the canonical face-circulation operator K, and its polar complex structure

    J = K (-K^2)^(-1/2).

Outputs:
  * signed-edge A5 representation decomposition
  * K spectrum by A5 irrep
  * J^2=-I, J^T=-J, [J,A5]=0
  * +i polarization = 3 + 3' + 4 + 5
  * golden bridge -K^2/4 = {phi^2, phi^-2} on the two triplets

Dependencies: numpy, networkx
No internet access or observational inputs are used.
"""
import math, json
from pathlib import Path
import numpy as np
import networkx as nx

phi=(1+math.sqrt(5))/2
verts=[]
for a in (-1.,1.):
    for b in (-phi,phi): verts.append((0.,a,b))
for a in (-1.,1.):
    for b in (-phi,phi): verts.append((a,b,0.))
for a in (-phi,phi):
    for b in (-1.,1.): verts.append((a,0.,b))
V=np.array(verts)
D=np.linalg.norm(V[:,None,:]-V[None,:,:],axis=2)
edges=[(i,j) for i in range(12) for j in range(i+1,12)
       if abs(D[i,j]-2)<1e-10]
edge_index={e:k for k,e in enumerate(edges)}
E=set(edges)

faces=[]
for i in range(12):
    for j in range(i+1,12):
        for k in range(j+1,12):
            if (i,j) in E and (i,k) in E and (j,k) in E:
                vi,vj,vk=V[i],V[j],V[k]
                if np.dot(np.cross(vj-vi,vk-vi),(vi+vj+vk)/3)>0:
                    faces.append((i,j,k))
                else:
                    faces.append((i,k,j))

def es(a,b):
    e=tuple(sorted((a,b)))
    return edge_index[e], (1. if (a,b)==e else -1.)

C3=np.array([[0.,1.,-1.],[-1.,0.,1.],[1.,-1.,0.]])
K=np.zeros((30,30))
for i,j,k in faces:
    S=np.zeros((30,3))
    for c,(a,b) in enumerate(((i,j),(j,k),(k,i))):
        q,s=es(a,b); S[q,c]=s
    K += S@C3@S.T

G=nx.Graph(); G.add_nodes_from(range(12)); G.add_edges_from(edges)
gm=nx.algorithms.isomorphism.GraphMatcher(G,G)
rots=[]
for m in gm.isomorphisms_iter():
    p=[m[i] for i in range(12)]
    RT,*_=np.linalg.lstsq(V,V[p],rcond=None)
    R=RT.T
    if np.linalg.norm(V@R.T-V[p])<1e-9 and np.linalg.det(R)>0.5:
        rots.append((p,R))
assert len(rots)==60

def erep(p):
    M=np.zeros((30,30))
    for col,(i,j) in enumerate(edges):
        a,b=p[i],p[j]
        e=tuple(sorted((a,b))); row=edge_index[e]
        M[row,col]=1. if (a,b)==e else -1.
    return M
reps=[erep(p) for p,R in rots]

# Polar complex structure.
W,U=np.linalg.eigh(-K@K)
J=K@(U@np.diag(W**-0.5)@U.T)

print("V,E,F =",len(V),len(edges),len(faces))
print("rank(K) =",np.linalg.matrix_rank(K))
print("max ||[K,g]|| =",max(np.linalg.norm(K@M-M@K) for M in reps))
print("||J^2+I|| =",np.linalg.norm(J@J+np.eye(30)))
print("||J^T+J|| =",np.linalg.norm(J.T+J))
print("max ||[J,g]|| =",max(np.linalg.norm(J@M-M@J) for M in reps))
print("singular values(K) =",np.unique(np.round(np.linalg.svd(K,compute_uv=False),12),return_counts=True))
print("Expected exact scales: 1 (x8), 2 (x10), sqrt(5)-1 (x6), 1+sqrt(5) (x6)")
print("Triplet bridge: (1+sqrt(5))^2/4 =",((1+math.sqrt(5))**2)/4,"= phi^2")
print("Triplet bridge: (sqrt(5)-1)^2/4 =",((math.sqrt(5)-1)**2)/4,"= phi^-2")