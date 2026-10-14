"""Verify the first-principles, triplet-sector Platonic scale relation.

Run from repository root:
  python research_archive/2026-10-14_platonic_unification/first_principles_scale.py
Uses the independently reconstructing neighbouring two archive scripts;
no measured data, Planck anchor or fitted s enters this calculation.
"""
from pathlib import Path
import runpy
import numpy as np
from math import sqrt, cos, sin, pi
here=Path(__file__).resolve().parent
g=runpy.run_path(str(here/"test_platonic_entropy_nonlinear.py"))
t=runpy.run_path(str(here/"positive_transfer_observable_gate.py"))
L=g["ld"]; C=g["c"]; K=t["K"]; K13=t["K13"]
# Previously recovered cube-label doubling on this canonical
# vertex ordering, validated below as an orthogonal 20-site operation.
p=[1,3,0,2,5,7,4,6,10,8,11,9,18,19,16,17,15,14,13,12]
D=np.eye(20)[:,p]
assert np.linalg.norm(D.T@D-np.eye(20))<1e-12
assert np.linalg.norm(np.linalg.matrix_power(D,4)-np.eye(20))<1e-12
w,U=np.linalg.eigh(L)
lo,hi=3-sqrt(5),3+sqrt(5)
def proj(e,U,z,tol=1e-8):
    a=U[:,abs(e-z)<tol]
    return a@a.T
Plo,Phi=proj(w,U,lo),proj(w,U,hi)
assert abs(np.trace(Plo)-3)<1e-9 and abs(np.trace(Phi)-3)<1e-9
assert np.linalg.norm(D@Plo@D.T-Phi)<1e-12
assert np.linalg.norm(D@Phi@D.T-Plo)<1e-12
assert np.linalg.norm(D@L@D.T-L-2*sqrt(5)*(Plo-Phi))<1e-12
# Doubling keeps the two four-dimensional hidden entropy projectors.
assert np.linalg.norm(D@g["p3"]@D.T-g["p3"])<1e-12
assert np.linalg.norm(D@g["p5"]@D.T-g["p5"])<1e-12
# Face-incidence map converts D to an orthogonal shell-sector action.
c,V=np.linalg.eigh(C.T@C)
Q=C@((V/np.sqrt(c))@V.T)
W=Q.T@D@Q
assert np.linalg.norm(W.T@W-np.eye(12))<1e-12
k,E=np.linalg.eigh(K)
small,big=k[0],k[3]
assert np.sum(abs(k-small)<1e-11)==3
assert np.sum(abs(k-big)<1e-11)==3
assert np.linalg.norm(W@proj(k,E,small)@W.T-proj(k,E,big))<1e-9
assert np.linalg.norm(W@proj(k,E,big)@W.T-proj(k,E,small))<1e-9
s2=sqrt(lo/hi)
s3=(small/big)**(1/3)
phi=(1+sqrt(5))/2
assert abs(s2-phi**-2)<1e-12
assert abs(s2-s3)<1e-9
# Independent pentagram diagonal intersection.
v=np.array([(cos(2*pi*j/5),sin(2*pi*j/5)) for j in range(5)])
inner=[]
for j in range(5):
    a,b=v[j],v[(j+2)%5]
    c,d=v[(j+1)%5],v[(j+3)%5]
    u=np.linalg.solve(np.column_stack((b-a,-(d-c))),c-a)
    inner.append(a+u[0]*(b-a))
star=np.mean(np.linalg.norm(inner,axis=1))
assert abs(star-s2)<1e-12
assert np.linalg.norm(D@L@D.T-L/s2**2)>1   # Not a global scale symmetry
W13=np.eye(13);W13[1:,1:]=W
assert np.linalg.norm(W13@K13@W13.T-K13)>1e-8
print("PASS: fixed-point ratio from L order 2 =",s2)
print("PASS: independent positive-contact order-3 ratio =",s3)
print("PASS: geometric pentagram ratio =",star)
print("scope: exact triplet-sector duality, NOT globally scaled physical T_star")
