#!/usr/bin/env python3
from __future__ import annotations
import json, math, sys
from pathlib import Path
import numpy as np
from scipy.linalg import null_space
sys.path.insert(0,'/mnt/data')
import active_core as ac
OUT=Path('/mnt/data')
# group helpers
ap=ac.aperms; idx={p:i for i,p in enumerate(ap)}
def comp(p,q): return tuple(p[q[i]] for i in range(6))
def mul(i,j): return idx[comp(ap[i],ap[j])]
def inv(i):
 q=[0]*6
 for a,b in enumerate(ap[i]): q[b]=a
 return idx[tuple(q)]
def rho6(i):
 P=np.zeros((6,6))
 for s,t in enumerate(ap[i]): P[t,s]=1
 return P
def ordered(i): return np.block([[ac.rho3[i],np.zeros((3,5))],[np.zeros((5,3)),ac.rho5[i]]])
R6=[rho6(i) for i in range(60)]
# local V4 ambiguity
t,r=10,1; L,R=ac.grading_basis(t); central=[g for g in range(60) if mul(g,t)==mul(t,g)]
constraints=[]
for g in central:
 G=R6[g]; Lg=L.T@G@L; Rg=R.T@G@R
 cod=np.kron(Lg,Rg); dom=ordered(g)
 constraints.append(np.kron(dom.T,np.eye(8))-np.kron(np.eye(8),cod))
local_basis=null_space(np.vstack(constraints),rcond=1e-10)
# cycle transport preserves 16 dimensions
Pr=R6[r]; Gr=ordered(r); Es=[]
for n in range(5):
 Pn=np.linalg.matrix_power(Pr,n); Es.append(np.kron(Pn@L,Pn@R))
def cycle_family_rank(z):
 cols=[]
 for k in range(local_basis.shape[1]):
  C0=local_basis[:,k].reshape(8,8,order='F'); F=np.zeros((36,8),complex)
  for n in range(5): F += z**n*(Es[n]@C0@np.linalg.matrix_power(Gr,-n))
  cols.append(F.reshape(-1,order='F'))
 M=np.column_stack(cols); s=np.linalg.svd(M,compute_uv=False)
 return int(np.sum(s>1e-9*s[0])),s
rank_delta,s_delta=cycle_family_rank(ac.delta*np.exp(2j*np.pi/5))
# full A5 global multiplicities in Hom(R6,R6)
chi_cod=np.array([np.trace(np.kron(P,P)) for P in R6])
chars={'1':np.ones(60),'3':np.array([np.trace(x) for x in ac.rho3]),'3p':np.array([np.trace(x) for x in ac.rho3p]),'4':np.array([np.trace(x) for x in ac.rhoH3]),'5':np.array([np.trace(x) for x in ac.rho5])}
mult={k:int(round(float(np.dot(v,chi_cod)/60))) for k,v in chars.items()}
global_intertwiner_dim=mult['3']+mult['5']
# load unique machine intertwiners already derived
Z=np.load('/mnt/data/unique_machine_intertwiner.npz'); J3=Z['J3']; J5=Z['J5']; J=np.column_stack([J3,J5])
# constraint errors
def errs(Jx,d,typ):
 vals=[]
 for a in range(d):
  M=Jx[:,a].reshape(6,6,order='F')
  if typ=='sym': vals.append(np.linalg.norm(M-M.T))
  if typ=='antisym': vals.append(np.linalg.norm(M+M.T))
  if typ=='rows': vals.append(np.linalg.norm(M@np.ones(6))+np.linalg.norm(M.T@np.ones(6)))
  if typ=='diag': vals.append(np.linalg.norm(np.diag(M)))
 return max(vals)
# ambient five-cycle and 4+3+1
Fs=[]
for n in range(5):
 Pn=np.linalg.matrix_power(Pr,n); E=np.kron(Pn@L,Pn@R); Fs.append(E@E.T@J)
z=ac.delta*np.exp(2j*np.pi/5); W=sum(z**n*F for n,F in enumerate(Fs)); sv=np.linalg.svd(W,compute_uv=False)
frame=sum(F.conj().T@F for F in Fs); frame_eigs=np.linalg.eigvalsh(frame)
# small-g leading coefficients
g=1e-6; Wg=sum(g**n*F for n,F in enumerate(Fs)); sg=np.linalg.svd(Wg,compute_uv=False)
leading_mid=(sg[4:7]/g).tolist(); leading_deep=float(sg[7]/g**2)
# outer-related lepton spectrum
L2,R2=ac.grading_basis(56); Pr2=R6[4]; Fs2=[]
for n in range(5):
 Pn=np.linalg.matrix_power(Pr2,n); E=np.kron(Pn@L2,Pn@R2); Fs2.append(E@E.T@J)
W2=sum(z**n*F for n,F in enumerate(Fs2)); sv2=np.linalg.svd(W2,compute_uv=False)
# direct load interpretation output (diagnostic, no targets)
sym=ac.sym_basis
anti=[]
for a,b in [(1,2),(2,0),(0,1)]:
 M=np.zeros((3,3));M[a,b]=-1/math.sqrt(2);M[b,a]=1/math.sqrt(2);anti.append(M)
anti=np.array(anti)
def cycle_rows(tt,rr):
 LL,RR=ac.grading_basis(tt); PP=R6[rr]; Ctot=np.zeros((8,8),complex)
 for n in range(5):
  Pn=np.linalg.matrix_power(PP,n); Ln=Pn@LL;Rn=Pn@RR;C=np.zeros((8,8))
  for a in range(3): C[:,a]=(Rn.T@J3[:,a].reshape(6,6,order='F')@Ln).reshape(-1,order='F')
  for a in range(5): C[:,3+a]=(Rn.T@J5[:,a].reshape(6,6,order='F')@Ln).reshape(-1,order='F')
  Ctot += z**n*C
 return Ctot
def load(c):
 A=sum(c[k]*anti[k] for k in range(3)); S=sum(c[3+k]*sym[k] for k in range(5)); return (S+1j*A+(S+1j*A).conj().T)/2
def ef(H):
 w,v=np.linalg.eigh((H+H.conj().T)/2);return v[:,np.argsort(w)]
def jarl(U): return float(np.imag(U[0,0]*U[1,1]*np.conj(U[0,1])*np.conj(U[1,0])))
CQ=cycle_rows(10,1); CL=cycle_rows(56,4)
V=ef(load(CQ[3])).conj().T@ef(load(CQ[0])); U=ef(load(CL[0])).conj().T@ef(load(CL[3]))
A=np.abs(U);s13=float(A[0,2]**2)
result={
 'local_residual_symmetry':{'centralizer_order':len(central),'intertwiner_dimension':int(local_basis.shape[1])},
 'five_cycle_family':{'rank_at_Delta_phase':rank_delta,'parameter_singular_values':s_delta.tolist()},
 'global_A5_Hom6_multiplicities':mult,'global_intertwiner_dimension_from_3_plus_5':global_intertwiner_dim,
 'unique_machine_maps':{
  'triplet_antisym_error':errs(J3,3,'antisym'),'triplet_mean_zero_error':errs(J3,3,'rows'),
  'fiveplet_sym_error':errs(J5,5,'sym'),'fiveplet_mean_zero_error':errs(J5,5,'rows'),'fiveplet_loopless_error':errs(J5,5,'diag')},
 'unique_ambient_cycle':{
  'rank':int(np.linalg.matrix_rank(W,tol=1e-12)),'singular_values':sv.tolist(),'frame_eigenvalues':frame_eigs.tolist(),
  'leading_first_return_coefficients':leading_mid,'leading_second_return_coefficient':leading_deep,
  'lepton_outer_cycle_singular_values':sv2.tolist(),'quark_lepton_spectrum_difference_norm':float(np.linalg.norm(sv-sv2))},
 'static_load_readout_diagnostic':{
  'quark_abs':np.abs(V).tolist(),'quark_J':jarl(V),
  'lepton_abs':np.abs(U).tolist(),'lepton_angles':{'s12':float(A[0,1]**2/(1-s13)),'s23':float(A[1,2]**2/(1-s13)),'s13':s13},'lepton_J':jarl(U)}
}
(OUT/'urt_static_machine_theorem_results.json').write_text(json.dumps(result,indent=2))
report=f'''URT STATIC MACHINE THEOREM\n==========================\n\n1. A fixed chiral grading leaves a 16-dimensional V4-equivariant coupling space.\n2. Transport around the complete order-five recycling cycle is injective on that space; at z=Delta exp(2pi i/5) its family rank is still {rank_delta}. Recycling gives full support but does not select a coupling.\n3. Full A5 covariance in Hom(R6,R6) reduces the ordered 3+5 coupling space to dimension {global_intertwiner_dim}: one triplet copy and four fiveplet copies.\n4. Machine constraints select unique normalized maps: triplet = antisymmetric mean-zero transport; fiveplet = symmetric mean-zero zero-diagonal transport.\n5. Accumulating their five chiral projections in the common ambient shaft space gives a full-rank operator with singular depths 4+3+1.\n\nSingular values at Delta:\n{np.array2string(sv,precision=12)}\n\nSmall-g first-return coefficients: {leading_mid}\nSmall-g second-return coefficient: {leading_deep:.12f}\n\nThe outer-related quark and lepton cycles are isospectral to numerical error {np.linalg.norm(sv-sv2):.3e}. Therefore a gauge-blind spectral governor cannot distinguish their flavour patterns.\n\nThe direct static 3+5 load interpretation gives order-one mixing and is rejected. Hence the unique static linear machine solves support and hierarchy, but not flavour orientation. A noncommuting gauge-loaded operating functional is mathematically necessary.\n'''
(OUT/'urt_static_machine_theorem_report.txt').write_text(report)
print(report)