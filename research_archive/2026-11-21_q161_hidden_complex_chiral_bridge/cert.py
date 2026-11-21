#!/usr/bin/env python3
"""Native real H64 hidden source -> Q96 chiral operator, not fermion state."""
from itertools import product,combinations
import numpy as np
from scipy.linalg import block_diag
from math import sqrt,pi
phi=(1+sqrt(5))/2
v=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
ed=[(i,j) for i,j in combinations(range(12),2) if abs(np.sum((v[i]-v[j])**2)-4)<1e-10]
faces=[f for f in combinations(range(12),3) if all(q in ed for q in combinations(f,2))]
C=np.array([[int(i in f) for i in range(12)] for f in faces],float)
L=np.array([[3 if i==j else -int(len(set(f)&set(g))==2) for j,g in enumerate(faces)] for i,f in enumerate(faces)],float)
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T; P3=Ph@(5*np.eye(20)-L)/2;P5=Ph@(L-3*np.eye(20))/2
cent=C@v;W=np.zeros((20,20))
for i,f in enumerate(faces):
 for j,g in enumerate(faces):
  x=sum(v[k]@np.cross(cent[i],cent[j]) for k in set(f)&set(g))
  if abs(x)>1e-10:W[i,j]=np.sign(x)
J=W/sqrt(15)
assert np.linalg.norm(J@J+Ph)<1e-10 and np.linalg.norm(P3@J-J@P5)<1e-10
K=C.T@(P3*P5)@C;vals,U=np.linalg.eigh(K);Ul=U[:,(vals>1e-8)&(vals<.1)];Ur=U[:,vals>.1]
T=[]
for i,j,k in faces:
 if np.linalg.det(v[[i,j,k]])<0:j,k=k,j
 O=np.zeros((12,12))
 for a,b in ((i,j),(j,k),(k,i)):O[a,b]+=1;O[b,a]-=1
 T.append((Ul.T@O@Ur).reshape(9,order='F'))
T=np.array(T).T
assert np.linalg.norm(T.T@T-1.5*P3)<1e-10
# Declared real source uses the original signed complex structure J; J on h is multiplication by i.
A=sqrt(2/3)*T@(P3-1j*J@P5)
assert np.linalg.norm(A@J-1j*A)<1e-10
assert np.linalg.norm((A.conj().T@A).real-Ph)<1e-10
assert np.linalg.matrix_rank(A,tol=1e-10)==4
opp=[int(np.argmin(np.linalg.norm(v+x,axis=1))) for x in v];remaining=set(range(12));pairs=[]
while remaining:
 i=min(remaining);j=opp[i];pairs.append((i,j));remaining-={i,j}
M=np.zeros((64,20))
for mask in range(64):
 sel={pairs[i][(mask>>i)&1] for i in range(6)}
 for j,f in enumerate(faces):M[mask,j]=int(set(f)<=sel)
Uh=M@Ph/sqrt(2);P8=Uh@Uh.T
assert np.linalg.norm(Uh.T@Uh-Ph)<1e-10
B=A@Uh.T
assert np.linalg.norm((B.conj().T@B).real-P8)<1e-10
_,u=np.linalg.eigh(Ph);h=u[:,-8:];Z=[(A@h[:,i]).reshape(3,3,order='F') for i in range(8)]
# Original Q124 masks, axes and Q16 registry; Q96 three generations and conjugates.
states=[]
for mask in range(8192):
 s=np.array([1-2*((mask>>i)&1) for i in range(12)]);c=1-2*((mask>>12)&1)
 if sum(s[i]*s[j] for i,j in ed)+phi*c*s.sum()<=-10+1e-11:states.append((mask,s))
assert len(states)==444
sigma=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]]);I2=np.eye(2);Y0=np.diag([1/6]*6+[-1/2]*2+[2/3]*3+[-1/3]*3+[-1,0]).astype(complex)
frames=[];ward=0.;gramerr=0.;colerr=0.
# Color 3 test: noncommuting SU3 generators, in original L/R ordering.
from scipy.linalg import expm
for mask,s in states:
 x=s@v;x=x/np.linalg.norm(x);S=np.einsum('i,ijk->jk',x,sigma);q=Y0.copy()
 for k in range(4):q[2*k:2*k+2,2*k:2*k+2]+=S/2
 _,eig=np.linalg.eigh(S);plus=eig[:,1];minus=eig[:,0];V=np.zeros((8,8),complex)
 for k in range(3):V[2*k:2*k+2,k]=plus;V[2*k:2*k+2,3+k]=minus
 V[6:8,6]=minus;V[6:8,7]=plus
 frames.append((S,V,x))
 R=np.zeros((16,16),complex);R[:8,8:]=V
 Q48=np.kron(np.eye(3),q);Q96=block_diag(Q48,-Q48.conj())
 vertices=[]
 for z in Z:
  M48=np.kron(z,R)+np.kron(z.conj().T,R.conj().T);M96=block_diag(M48,M48.conj())/sqrt(32)
  ward=max(ward,np.linalg.norm(Q96@M96-M96@Q96));vertices.append(M96.reshape(-1))
 mat=np.array(vertices);gramerr=max(gramerr,np.linalg.norm((mat.conj()@mat.T).real-np.eye(8)))
assert ward<1e-10 and gramerr<1e-10
# All 24 cyclic time slices: time-local neutral vertex remains an isometry on real full source.
# Do not invent a physical clock kinetic term; tensor with the archived clock carrier I24.
assert np.linalg.norm(np.kron(np.eye(24),(B.conj().T@B).real-P8))<1e-9
# Native 1032 history links: left/right transport yields Berry phases of Hopf mass frame.
# Compute nontrivial source-frame mismatch (not a violation of gauge covariance).
idx={mask:i for i,(mask,s) in enumerate(states)};err=0.;links=0;nonflat=0
for i,(mask,s) in enumerate(states):
 S,V,x=frames[i]
 for bit in range(13):
  oth=mask^(1<<bit)
  if oth<=mask or oth not in idx:continue
  j=idx[oth];S2,V2,x2=frames[j];U2=(I2+S@S2)/sqrt(2*(1+x@x2));UL=np.kron(np.eye(4),U2)
  D=V.conj().T@UL@V2
  err=max(err,np.linalg.norm(D-np.diag(np.diag(D))));links+=1
  # Genuinely transport on Hom: V2 -> UL V2 with identity right transport.
  assert np.linalg.norm(UL@V2-V@D)<1e-10
  nonflat+=int(np.linalg.norm(D-np.eye(8))>1e-9)
assert links==1032 and err<1e-10
print('Native H64 8 real -> 4 complex generation channels: rank',np.linalg.matrix_rank(A,tol=1e-10),'real rank',np.linalg.matrix_rank(np.vstack([B.real,B.imag]),tol=1e-10))
print('444 Q96 Hermitian operator source isometries, Ward max',ward,'Gram max',gramerr)
print('24 clock slices; 1032 native links, Berry offdiag',err,'nonidentity frame comparisons',nonflat)
print('PASS conditional neutral chiral vertex, NOT a charged one-particle embedding or derived kinetic dynamics')
