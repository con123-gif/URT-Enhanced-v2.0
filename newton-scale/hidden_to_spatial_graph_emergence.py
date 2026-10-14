#!/usr/bin/env python3
"""Recover an icosahedral graph and 3D coordinates from the hidden
Platonic quadratic response. Not a proof of Lorentzian spacetime.
Requires numpy and scipy plus the two dated adjacent archived generators.
"""
import runpy
import json
from pathlib import Path
from math import sqrt, factorial
import numpy as np
from scipy.sparse.csgraph import shortest_path

root=Path(__file__).resolve().parents[1]
path=root/"research_archive/2026-10-14_platonic_unification/positive_transfer_observable_gate.py"
d=runpy.run_path(str(path))
K=np.asarray(d["K"],float)
B=np.asarray(d["F"],float)
assert K.shape==(12,12) and np.linalg.norm(K-B@B.T)<1e-12

w,U=np.linalg.eigh(K)
weak,strong,five,scalar=map(float,(w[:3].mean(),w[3:6].mean(),
                                   w[6:11].mean(),w[-1]))
Eweak=U[:,:3]@U[:,:3].T
Estrong=U[:,3:6]@U[:,3:6].T
Efive=U[:,6:11]@U[:,6:11].T
Escalar=U[:,11:]@U[:,11:].T
Aexact=5*Escalar-Efive+sqrt(5)*(Estrong-Eweak)
A=np.rint(Aexact).astype(int)
error=float(np.max(abs(Aexact-A)))
assert error<1e-8
assert np.array_equal(A,A.T)
assert np.all((A==0)|(A==1))
assert np.all(A.sum(axis=1)==5)
assert np.all(np.diag(A)==0)
D=shortest_path(A,directed=False,unweighted=True)

phi=(1+sqrt(5))/2
delta=3/20-80*np.pi/(1053*phi)
a=1/(4*(1+delta**2))
b=a*delta**2
bands=[3*(a*a+b*b),3*a*a/25+b*b/3,
       2*a*b*(5+2*sqrt(5))/15,
       2*a*b*(5-2*sqrt(5))/15]
assert np.allclose([scalar,five,strong,weak],bands,atol=1e-12)
dist=np.diag(K)[:,None]+np.diag(K)[None,:]-2*K
sq={
 1:3*a*a/25+2*a*b/5+b*b/3,
 2:3*a*a/25+14*a*b/15+b*b/3,
 3:4*a*b/3,
}
for h,q in sq.items():
    assert np.max(abs(dist[D==h]-q))<1e-12
assert sq[3]<sq[1]<sq[2]
assert abs((K[D==1].mean()-K[D==2].mean())-4*a*b/15)<1e-12
# Extract six antipodal pairs and verify their 5D regular simplex.
opp=[]
for i in range(12):
    row=K[i].copy();row[i]=-np.inf
    opp.append(int(np.argmax(row)))
assert all(opp[opp[i]]==i and D[i,opp[i]]==3 for i in range(12))
reps=[i for i in range(12) if i<opp[i]]
gram=Efive[np.ix_(reps,reps)]
assert len(reps)==6
assert np.allclose(gram*12/5,
                   np.eye(6)+(np.ones((6,6))-np.eye(6))*(-1/5),atol=1e-9)
# 3D coordinates from eigenvectors alone, up to rotation.
xyz=2*U[:,3:6]
assert np.allclose(np.linalg.norm(xyz,axis=1),1,atol=1e-8)
dots=xyz@xyz.T
for h,target in ((1,1/sqrt(5)),(2,-1/sqrt(5)),(3,-1)):
    assert np.max(abs(dots[D==h]-target))<1e-8
# The Newton invariant arises from hidden triplet ratios without fitted units.
newton=(weak/strong)**(1/3)
assert abs(newton-phi**-2)<1e-9
L=5*np.eye(12)-A
walk_terms={}
for h in (1,2,3):
    i,j=map(int,np.argwhere(D==h)[0])
    assert all(abs(np.linalg.matrix_power(L,n)[i,j])<1e-12
               for n in range(h))
    c=int(np.linalg.matrix_power(A,h)[i,j])
    assert c=={1:1,2:2,3:10}[h]
    walk_terms[h]=c/factorial(2*h)
print(json.dumps({
 "reconstructed_graph":"regular icosahedral graph, 12 sites, degree 5",
 "adjacency_max_residual":error,
 "newton_ratio":newton,
 "squared_information_distances":sq,
 "antipodal_to_edge_distance_ratio":sqrt(sq[3]/sq[1]),
 "edge_vs_two_step_correlation_difference":4*a*b/15,
 "zero_rail_limit":"six unoriented axes, regular 5D simplex",
 "wave_leading_coefficients":walk_terms,
 "lorentzian_metric_derived":False,
 "physical_sub_planck_prediction_verified":False
},indent=2))
