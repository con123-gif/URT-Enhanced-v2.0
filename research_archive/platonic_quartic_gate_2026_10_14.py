"""Fourth-order icosahedral scalar gate; requires sibling Platonic A4 verifier."""
import itertools as it,runpy
from pathlib import Path
import numpy as np
s=runpy.run_path(str(Path(__file__).with_name("platonic_A4_emergence_2026_10_14.py")))
B,A=s["B"],s["Ad"]
eig,U=np.linalg.eigh(A)
L=U[:,abs(eig)<1e-8];R=U[:,abs(eig+2)<1e-8]
def h(x):
 y=(B@x)**2
 return np.outer(L.T@y,R.T@y).ravel()
w=[]
for k in (1,2,3):
 for ids in it.combinations(range(12),k):
  x=np.zeros(12);x[list(ids)]=1;w.append(h(x))
W=np.array(w)
assert np.linalg.matrix_rank(W,tol=1e-9)==15
S=np.linalg.svd(W,full_matrices=False)[2][-1].reshape(4,4)
assert np.linalg.norm(S.T@S-np.eye(4)/4)<1e-9
A3=np.einsum("fi,fj,fa->ija",B,B,L)
A5=np.einsum("fi,fj,fa->ija",B,B,R)
coef={}
for ids in it.combinations_with_replacement(range(12),4):
 coef[ids]=sum(A3[i,j]@S@A5[k,l] for i,j,k,l in set(it.permutations(ids)))
assert max(abs(c) for ids,c in coef.items() if len(set(ids))<4)<1e-10
nz=[c for ids,c in coef.items() if len(set(ids))==4 and abs(c)>1e-9]
assert len(nz)==120 and sum(c>0 for c in nz)==60
assert np.max(abs(np.abs(nz)-2/np.sqrt(15)))<1e-10
V=[]
for ids in it.combinations(range(12),4):
 x=np.zeros(12);x[list(ids)]=1;V.append(h(x))
assert np.linalg.matrix_rank(np.vstack([W,V]),tol=1e-9)==16
print("PASS rank 15 -> 16; 120 allowed 4-site monomials; 60 +, 60 -")
