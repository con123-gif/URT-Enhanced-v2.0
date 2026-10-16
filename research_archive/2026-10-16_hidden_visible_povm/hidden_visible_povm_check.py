"""Finite icosahedral hidden->visible POVM and BKM response, no fitted inputs.
Run python hidden_visible_povm_check.py (requires NumPy). No file mutation.
A finite measurement/response calculation, NOT dark-matter or gravity proof.
"""
import numpy as np
from itertools import combinations
from math import sqrt,pi,log
phi=(1+sqrt(5))/2
delta=3/20-80*pi/(1053*phi)
a=1/(4*(1+delta**2));b=a*delta**2
chi=8*(-log(delta))*(1+delta**2)/(1-delta**2)
v=[]
for x in (-1,1):
 for y in (-phi,phi):
  v.extend([(0,x,y),(x,y,0),(y,0,x)])
v=np.array(v,float)
dist=np.sum((v[:,None]-v[None,:])**2,axis=2)
dmin=np.min(dist[dist>1e-10])
edges=[(i,j) for i,j in combinations(range(12),2) if abs(dist[i,j]-dmin)<1e-9]
edge_set=set(edges)
faces=[q for q in combinations(range(12),3) if all(tuple(sorted(z)) in edge_set for z in combinations(q,2))]
assert (len(edges),len(faces))==(30,20)
C=np.zeros((20,12))
for i,f in enumerate(faces):C[i,list(f)]=1
Lv=5*np.eye(12)
for i,j in edges:Lv[i,j]=Lv[j,i]=-1
Lf=3*np.eye(20)-(C@C.T==2).astype(float)
fval,F=np.linalg.eigh(Lf)
H3=F[:,abs(fval-3)<1e-9];H5=F[:,abs(fval-5)<1e-9]
assert H3.shape==H5.shape==(20,4)
H=np.column_stack([H3,H5])
assert np.linalg.norm(C.T@H)<1e-10
opp=[int(np.argmin(np.linalg.norm(v+v[i],axis=1))) for i in range(12)]
faceid={frozenset(f):i for i,f in enumerate(faces)}
Pface=np.zeros((20,20));Pvert=np.zeros((12,12))
for i,j in enumerate(opp):Pvert[j,i]=1
for i,f in enumerate(faces):Pface[faceid[frozenset(opp[j] for j in f)],i]=1
assert np.linalg.norm(Pface@H3+H3)<1e-10
assert np.linalg.norm(Pface@H5-H5)<1e-10
# Effects on the hidden 8D state: one effect per visible vertex.
effects=np.array([H.T@np.diag(C[:,i])@H/3 for i in range(12)])
assert np.linalg.norm(effects.sum(axis=0)-np.eye(8))<1e-10
assert np.linalg.eigvalsh(effects).min()>-1e-10
rho=np.diag([a]*4+[b]*4)
p=np.einsum('iab,ba->i',effects,rho)
assert np.max(abs(p-1/12))<1e-11
# Odd interquartet coherences.
Z=np.einsum('fi,fa,fb->iab',C,H3,H5).reshape(12,16)
w,U=np.linalg.eigh(Lv)
def proj(eig,mul):
 T=U[:,abs(w-eig)<1e-9];assert T.shape==(12,mul)
 return T@T.T
P0=proj(0,1);P3=proj(5-sqrt(5),3)
P5=proj(6,5);P3p=proj(5+sqrt(5),3)
gram=(5+2*sqrt(5))/15*P3+(5-2*sqrt(5))/15*P3p
assert np.linalg.norm(Z@Z.T-gram)<1e-10
assert np.linalg.matrix_rank(Z,tol=1e-10)==6
assert np.linalg.norm(Pvert@Z+Z)<1e-10
# Density-matrix basis: real-symmetric within each 4D block, real Hermitian
# offdiagonal 4x4 with 1/sqrt(2) normalization.
basis=[]
for i in range(4):
 for j in range(i,4):
  B=np.zeros((4,4))
  if i==j:B[i,i]=1
  else:B[i,j]=B[j,i]=1/sqrt(2)
  basis.append(B)
T3=np.array([[np.trace(E[:4,:4]@B) for B in basis] for E in effects])
T5=np.array([[np.trace(E[4:,4:]@B) for B in basis] for E in effects])
Tc=sqrt(2)/3*Z
t=np.array([np.trace(B) for B in basis]*2)
W=np.diag([a]*10+[b]*10)
W-=np.outer(W@t,W@t)/(t@W@t) # impose Tr(delta rho)=0
Td=np.column_stack([T3,T5])
response=Td@W@Td.T+(Tc@Tc.T)/chi
r5=a/75+b/27
r3=2*(5+2*sqrt(5))/(135*chi)
r3p=2*(5-2*sqrt(5))/(135*chi)
exact=r5*P5+r3*P3+r3p*P3p
assert np.linalg.norm(response-exact)<1e-10
assert np.linalg.norm(response@np.ones(12))<1e-10
# The positive master state has no 32/chi equilibrium without a real bath.
print('PASS hidden POVM; rho* uniform p_i=1/12; offdiagonal rank 6')
print('Face quartets parity: 4_3=odd, 4_5=even')
print('Singular-value ratio phi^3:',phi**3)
print('BKM static response on (1,3,5,3prime):',0.,r3,r5,r3p)
print('Response 3-to-3prime ratio phi^6:',r3/r3p)
print('Independently reproduced finite response matrix residual:',np.linalg.norm(response-exact))
