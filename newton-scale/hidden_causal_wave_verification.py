#!/usr/bin/env python3
"""Recompute icosahedral spatial isotropy and Newton multiscale wave law.

Uses only archived original Platonic constructions to regenerate K and L13.
No physical metric, Lorentzian clock, or Planck-scale anchor is assumed.
Requires numpy scipy.
"""
from pathlib import Path
from math import sqrt, pi, factorial
import runpy, json
import numpy as np
from scipy.sparse.csgraph import shortest_path

root=Path(__file__).resolve().parents[1]
r=runpy.run_path(str(root/"research_archive/2026-10-14_platonic_unification/positive_transfer_observable_gate.py"))
K=np.asarray(r["K"]);L13=np.asarray(r["L13"])
eig,U=np.linalg.eigh(K)
assert K.shape==(12,12)
Ep=U[:,3:6]@U[:,3:6].T
Em=U[:,:3]@U[:,:3].T
E5=U[:,6:11]@U[:,6:11].T
E1=U[:,11:]@U[:,11:].T
Ahat=5*E1-E5+sqrt(5)*(Ep-Em)
A=np.rint(Ahat).astype(int)
assert np.max(abs(A-Ahat))<1e-9
assert np.array_equal(A,A.T) and np.all(A.sum(1)==5)
X=2*U[:,3:6]
assert np.allclose(X.T@X,4*np.eye(3))
fourth=np.einsum("ia,ib,ic,id->abcd",X,X,X,X)
I=np.eye(3)
target=.8*(np.einsum("ab,cd->abcd",I,I)+
           np.einsum("ac,bd->abcd",I,I)+
           np.einsum("ad,bc->abcd",I,I))
assert np.max(abs(fourth-target))<1e-9
vertex=X[0]
tri=next((i,j,k) for i in range(12) for j in range(i+1,12)
         for k in range(j+1,12) if A[i,j]*A[j,k]*A[k,i])
face=sum(X[list(tri)]);face/=np.linalg.norm(face)
m6v=sum((X@vertex)**6)
m6f=sum((X@face)**6)
assert abs(m6v-52/25)<1e-8
assert abs(m6f-68/45)<1e-8

# Hidden-state gap controls rank of full shell response (no new parameter).
a=1/4
Kgap0=(3/16)*E1+(3/400)*E5
assert np.linalg.matrix_rank(Kgap0,tol=1e-10)==6
assert np.linalg.matrix_rank(K,tol=1e-12)==12

# A local discrete-time, energy-conserving, strictly graph-causal equation.
h=1/sqrt(13)
origin=1
x0=np.eye(13)[:,origin];x1=x0-h*h*L13@x0
E=lambda x,y:np.linalg.norm(y-x)**2/(2*h*h)+.5*x@L13@y
En=E(x0,x1)
d=shortest_path((abs(L13-np.diag(np.diag(L13)))>0).astype(int),
                directed=False,unweighted=True)
for t in range(1,15):
    assert np.max(abs(x1[d[origin]>t]),initial=0)<1e-10
    assert abs(E(x0,x1)-En)<1e-9
    x0,x1=x1,2*x1-x0-h*h*L13@x1

# Independently defined multiscale spatial shift operator and its symbol.
s=(3-sqrt(5))/2
bands=[(1/1024,8),(1/216,6),(32/3125,5)]
Z=sum(m/(1-l) for l,m in bands)
mu=lambda n:sum(m*l**n for l,m in bands)/Z
U0=sum(m/(1-l/s**2) for l,m in bands)/Z
M2=sum(m/(1-l*s**2) for l,m in bands)/Z
M4=sum(m/(1-l*s**4) for l,m in bands)/Z
def symbol(k):
    return sum(mu(n)*(12-np.cos((s**n)*(X@k)).sum())/
               (2*s**(2*n)) for n in range(35))
for k in (.03,.06,.1):
    assert abs(symbol(k*vertex)-(k*k-M2*k**4/20))<2*k**6
    assert abs(symbol(k*face)-(k*k-M2*k**4/20))<2*k**6
assert symbol(1000*vertex)<12*U0
tau=1/sqrt(12*U0)
assert tau*tau*12*U0<=1+1e-12
print(json.dumps({
 "hidden_shell_rank_gap0":6,"hidden_shell_rank_gap_nonzero":12,
 "ico_second_moment_error":float(np.linalg.norm(X.T@X-4*np.eye(3))),
 "ico_fourth_moment_error":float(np.max(abs(fourth-target))),
 "sixth_moment_vertex":float(m6v),"sixth_moment_face":float(m6f),
 "wave_graph_causal_steps":14,"wave_graph_energy_conserved":True,
 "Newton_ratio":s,"multiscale_M2":M2,"multiscale_M4":M4,
 "quartic_dispersion_coefficient":-M2/20,
 "sixth_order_icosahedral_anisotropy":4*M4/10125,
 "symbol_upper_bound":12*U0,"microstep_tau_unit_ell0_c":tau,
 "physical_status":"conditional emergent low-k Lorentzian wave, not physical sub-Planck law"
},indent=2))
