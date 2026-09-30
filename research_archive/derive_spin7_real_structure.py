#!/usr/bin/env python3
import json,itertools,math
from pathlib import Path
import numpy as np
from scipy.linalg import null_space,polar
D=json.load(open('/mnt/data/clifford_six_axis_results.json'))
gam=[np.array(r)+1j*np.array(im) for r,im in zip(D['gammas_real'],D['gammas_imag'])]
G=[]
for g in gam:G.append(np.block([[np.zeros((4,4),complex),g.conj().T],[g,np.zeros((4,4),complex)]]))
G.append(np.block([[np.eye(4),np.zeros((4,4))],[np.zeros((4,4)),-np.eye(4)]]).astype(complex))
pairs=list(itertools.combinations(range(7),2));L=[.25*(G[a]@G[b]-G[b]@G[a]) for a,b in pairs]
# Solve L C = C conj(L), column vectorization
cons=[]
for A in L:cons.append(np.kron(np.eye(8),A)-np.kron(A.conj().T,np.eye(8)))
K=null_space(np.vstack(cons))
print('kernel',K.shape)
Cs=[]
for j in range(K.shape[1]):
 C=K[:,j].reshape(8,8,order='F');U,_=polar(C);Cs.append(U)
# choose candidate closest to involution and symmetric
cand=[]
for C in Cs:
 cand.append((np.linalg.norm(C@C.conj()-np.eye(8)),np.linalg.norm(C-C.T),C))
cand.sort(key=lambda x:x[0]+x[1]);inv_err,sym_err,C=cand[0]
comm=max(np.linalg.norm(A@C-C@A.conj()) for A in L)
print('C errors',comm,inv_err,sym_err,'unit',np.linalg.norm(C.conj().T@C-np.eye(8)))
# Takagi-like factor for symmetric unitary C=U U^T. Use eigendecomp of antiunitary fixed map in real 16 space.
# Find fixed real subspace psi=C conj(psi): [Re;Im] eigenvalue +1 of real-linear map.
Cr,Ci=C.real,C.imag
JR=np.block([[Cr,Ci],[Ci,-Cr]]) # C(conj(x+iy))=(Cr x+Ci y)+i(Ci x-Cr y)
w,V=np.linalg.eigh((JR+JR.T)/2);F=V[:,w>.5]
print('fixed dim',F.shape,'involution real err',np.linalg.norm(JR@JR-np.eye(16)))
# Orthonormal real spinors from columns F.
def cvec(z):return np.r_[z.real,z.imag]
def stab(psi):
 A=np.column_stack([x@psi for x in L]);Ar=np.vstack([A.real,A.imag]);s=np.linalg.svd(Ar,compute_uv=False);rank=int(np.sum(s>1e-9));return rank,s
st=[]
for i in range(F.shape[1]):
 psi=F[:8,i]+1j*F[8:,i];rank,s=stab(psi);st.append((rank,s.tolist(),float(np.linalg.norm(psi-C@psi.conj()))))
print('fixed stabilizers',[(x[0],x[2]) for x in st])
# random real fixed spinors
rng=np.random.default_rng(1);rand=[]
for _ in range(10):
 q=rng.normal(size=F.shape[1]);q/=np.linalg.norm(q);v=F@q;psi=v[:8]+1j*v[8:];rank,s=stab(psi);rand.append((rank,s.tolist()))
print('random ranks',[x[0] for x in rand])
# Verify one rank7 => 14 dim stabilizer and brackets.
psi=(F[:,0][:8]+1j*F[:,0][8:]);rank,s=stab(psi)
A=np.column_stack([x@psi for x in L]);Ar=np.vstack([A.real,A.imag]);ker=null_space(Ar)
Gram=np.array([[np.trace(x.conj().T@y).real for y in L] for x in L])
# Orthonormalize kernel in Gram
M=ker.T@Gram@ker;ew,ev=np.linalg.eigh(M);ker=ker@ev@np.diag(np.maximum(ew,1e-15)**-.5)
Hb=[sum(c*x for c,x in zip(ker[:,j],L)) for j in range(ker.shape[1])]
def projres(Z,basis):
 GG=np.array([[np.trace(x.conj().T@y).real for y in basis] for x in basis]);bb=np.array([np.trace(x.conj().T@Z).real for x in basis]);cc=np.linalg.solve(GG,bb);return np.linalg.norm(Z-sum(c*x for c,x in zip(cc,basis)))
br=max(projres(x@y-y@x,Hb) for x in Hb for y in Hb)
out={'intertwiner_kernel_dim':K.shape[1],'real_structure':{'comm_error':comm,'involution_error':inv_err,'symmetry_error':sym_err,'unitarity_error':float(np.linalg.norm(C.conj().T@C-np.eye(8))),'fixed_real_dimension':F.shape[1]},'fixed_basis_stabilizers':[{'orbit_rank':r,'stabilizer_dim':21-r,'reality_error':e,'singular':s} for r,s,e in st],'random_fixed_ranks':[r for r,_ in rand],'selected':{'orbit_rank':rank,'stabilizer_dim':21-rank,'bracket_closure_error':br,'singular':np.asarray(s).tolist()},'C_real':C.real.tolist(),'C_imag':C.imag.tolist()}
Path('/mnt/data/spin7_real_structure_results.json').write_text(json.dumps(out,indent=2))
print(json.dumps({k:out[k] for k in ['intertwiner_kernel_dim','real_structure','fixed_basis_stabilizers','random_fixed_ranks','selected']},indent=2))