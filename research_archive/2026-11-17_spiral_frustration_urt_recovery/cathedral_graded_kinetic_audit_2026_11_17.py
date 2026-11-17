"""Original-source-formula v61 192x192 graded determinant Fourier-response check.
Transcribed from original github v61 gamma/hopping/source with Q106 exact band polys.
Computes 11x11 Fourier Hessians from first/second original-formula Wilson derivatives.
Original published in con123-gif/URT-Enhanced-v2.0 newtons-cathedral:
 research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py
 Q106 source: research_archive/2026-11-14_q106_exact_berry_wilson/Q106_EXACT_BERRY_SPECTRUM.py
This is a transcribed formula test, not a direct import, and uses the 60-mode Q106
moving spectrum (NOT the 42624-dimensional Q125a H_ch charged operator).
Not a proof of primitive graded physical completion / reflection positivity.
"""
import numpy as np
from itertools import product
# imports common original definitions from standalone audit file
import numpy as np
from itertools import product

r=355508034923519/1e15
m=790940592107124/1e15
phi=(1+np.sqrt(5))/2
Delta=0.15-80*np.pi/(1053*phi)
k=Delta/(1+Delta**2)
# native gamma conventions
I2=np.eye(2,dtype=complex)
s1=np.array([[0,1],[1,0]],complex);s2=np.array([[0,-1j],[1j,0]],complex);s3=np.diag([1.,-1.]).astype(complex)
gammas=[np.kron(s1,I2),np.kron(s2,s1),np.kron(s2,s2),np.kron(s2,s3)]; g5=np.kron(s3,I2)
I4=np.eye(4,dtype=complex)
D=np.array([(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*bits) for bits in product((0,-1),repeat=3)],float)
F=[];B=[]
for j in range(11):
 if j<3:
  F.append(.5*(gammas[j+1]-r*I4));B.append(.5*(-gammas[j+1]-r*I4))
 else:
  F.append((gammas[0]-I4)/16); B.append((-gammas[0]-I4)/16)
F=np.array(F);B=np.array(B)
# moving 30 singlet and 30 weak genuine Q106 algebraic values
scale=np.sqrt(2-2*np.sqrt(5)/5)
poly=[([1,0],2),([1,-np.sqrt(5)],2),([1,phi**2,3*(np.sqrt(5)-3)/8],4),([1,-1,-(3+np.sqrt(5)),(5+np.sqrt(5))/4],6)]
weak=[]
for coef,mult in poly:
 for root in np.roots(coef):
  assert abs(root.imag)<1e-8
  weak.extend([scale*root.real]*mult)
sing=[-2]*10 + [1-np.sqrt(5)]*3+[-1]*4+[1]*4+[2]*5+[1+np.sqrt(5)]*3+[4]
mu=np.array(weak+sing)
assert len(mu)==60
print('k',k,'move 60 spectrum min max',mu.min(),mu.max())


shape=(6,2,2,2)
sites=list(product(*(range(n) for n in shape)))
idx={x:i for i,x in enumerate(sites)}
S=len(sites); dim=4*S
G5=np.kron(np.eye(S),g5)
Dint=D.astype(int)

def wilson_derivs(mode):
 """mode: 4 Fourier integer components of field A_j(x)=a_j cos(q.x); on size 2 spatial, real ±1"""
 Q=2*np.pi*np.array(mode)/shape
 field=np.array([np.cos(Q@np.array(x)) for x in sites])
 assert np.max(np.abs(field**2-1))<1e-12
 H0raw=np.zeros((dim,dim),complex)
 Jraw=np.zeros((11,dim,dim),complex)
 Wraw=np.zeros((11,dim,dim),complex)
 for site_id,x in enumerate(sites):
  sl=slice(4*site_id,4*site_id+4)
  H0raw[sl,sl]+=(3*r+1-m)*I4
  for j,d in enumerate(Dint):
   yp=tuple((x[i]+d[i])%shape[i] for i in range(4));ym=tuple((x[i]-d[i])%shape[i] for i in range(4))
   yi=idx[yp]; zi=idx[ym]
   sf=-1 if x[0]+d[0]>=shape[0] or x[0]+d[0]<0 else 1
   sb=-1 if x[0]-d[0]>=shape[0] or x[0]-d[0]<0 else 1
   sy=field[site_id];sz=field[zi]
   outp=(sl,slice(4*yi,4*yi+4));outm=(sl,slice(4*zi,4*zi+4))
   H0raw[outp]+=sf*F[j]; H0raw[outm]+=sb*B[j]
   Jraw[(j,*outp)]+=1j*sy*sf*F[j];Jraw[(j,*outm)]-=1j*sz*sb*B[j]
   Wraw[(j,*outp)]-=sy*sy*sf*F[j];Wraw[(j,*outm)]-=sz*sz*sb*B[j]
 h=G5@H0raw;J=np.einsum('ab,jbc->jac',G5,Jraw);W=np.einsum('ab,jbc->jac',G5,Wraw)
 assert np.linalg.norm(h-h.conj().T)<1e-9
 assert max(np.linalg.norm(j-j.conj().T) for j in J)<1e-9
 return h,J,W

def evalhess(mode):
 h,J,W=wilson_derivs(mode)
 e,U=np.linalg.eigh(h)
 Ju=np.einsum('ab,jbc,cd->jad',U.conj().T,J,U,optimize=True)
 Wu_diag=np.array([np.einsum('ia,ij,ja->a',U.conj(),w,U,optimize=True) for w in W])
 H=np.zeros((11,11),float)
 for shift in mu:
  z=(k*shift)**2
  den=e*e+z
  weight=(np.outer(e,e)-z)/np.outer(den,den)
  H+=np.einsum('ab,iab,jab->ij',weight,Ju,Ju.conj(),optimize=True).real
  H[np.diag_indices(11)]-=np.einsum('a,ja->j',e/den,Wu_diag).real
 H*=16/S
 H=(H+H.T)/2
 vals,V=np.linalg.eigh(H)
 q=2*np.pi*np.asarray(mode)/np.asarray(shape)
 grad=np.array([1-np.exp(1j*q@d) for d in D])
 ward=np.linalg.norm(H@grad)/max(1,np.linalg.norm(H)*np.linalg.norm(grad))
 print('mode',mode,'negative',sum(vals<-1e-6),'min eig',vals[0],'max eig',vals[-1],'Ward rel',ward)
 return H,vals

if __name__=='__main__':
 for mode in [(0,0,0,0),(0,1,0,0),(0,1,1,1)]:
  evalhess(mode)