#!/usr/bin/env python3
"""Q161 Part-21 independent finite-operator audit (NumPy only).
Original named v61 offset formula and original Q101 3+5 source projector;
no fitted coefficients. Reports finite theorems, not continuum/physical completion.
"""
from collections import Counter
from itertools import combinations,product
from pathlib import Path
import numpy as np
R=Path(__file__).resolve()
# This is the ORIGINAL v61 displacement list (verify when native source available).
D=[(0,1,0,0),(0,0,1,0),(0,0,0,1)]+[(1,*b) for b in product((0,-1),repeat=3)]
orig=R.parents[2]/'research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py'
if orig.is_file():
 import importlib.util,sys
 spec=importlib.util.spec_from_file_location('v61_orig',orig)
 native=importlib.util.module_from_spec(spec);sys.modules[spec.name]=native;spec.loader.exec_module(native)
 assert D==native.DIRECTIONS and tuple(native.LATTICE_SHAPE)==(6,2,2,2)
 print('v61 DIRECT NATIVE SOURCE: YES')
else: print('v61 DIRECT NATIVE SOURCE: NO; exact original directions transcribed')
phi=(1+np.sqrt(5))/2
v=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
e=[(i,j) for i,j in combinations(range(12),2) if abs(sum((v[i]-v[j])**2)-4)<1e-9];es=set(e)
f=[q for q in combinations(range(12),3) if all(tuple(sorted(z)) in es for z in combinations(q,2))]
assert(len(e),len(f))==(30,20)
C=np.array([[int(i in g) for i in range(12)] for g in f],int)
A=(C@C.T==2).astype(int);L=3*np.eye(20,dtype=int)-A;I=np.eye(20)
assert np.array_equal(C@C.T,(L-3*I)@(L-5*I))
cent=np.array([v[list(q)].mean(0) for q in f]);W=np.zeros((20,20),int)
for k in range(20):
 for m,n in combinations(np.where(A[k])[0],2):
  t=float(np.linalg.det([cent[k],cent[m],cent[n]]));assert abs(t)>1e-8
  W[m,n]+=int(np.sign(t));W[n,m]-=int(np.sign(t))
assert set(W.flat)<={-1,0,1} and np.array_equal(W,-W.T) and np.array_equal(W@C,np.zeros((20,12),int))
assert np.array_equal(L@W+W@L,8*W)
lam,ev=np.linalg.eigh(L.astype(float));P3=ev[:,abs(lam-3)<1e-8]@ev[:,abs(lam-3)<1e-8].T;P5=ev[:,abs(lam-5)<1e-8]@ev[:,abs(lam-5)<1e-8].T
assert np.max(abs(W@W+15*(P3+P5)))<1e-11
assert np.max(abs(P3-(L-5*I)@(W@W)/30))<1e-11
assert np.max(abs(P5+(L-3*I)@(W@W)/30))<1e-11
assert abs(15*sum(1/z for z in lam if z>1e-8)-137)<1e-10
# Original Q101 all-five minimal-norm visible 3+5 projector.
op=[next(j for j in range(12) if np.linalg.norm(v[i]+v[j])<1e-9) for i in range(12)]
V3=v@np.linalg.inv(v.T@v)@v.T;V5=(np.eye(12)+np.eye(12)[op])/2-np.ones((12,12))/12;PV=V3+V5
assert np.linalg.norm(PV@PV-PV)<1e-11
states=[]
for c in (-1,1):
 for mask in range(4096):
  s=np.array([1-2*((mask>>i)&1) for i in range(12)])
  H=sum(s[i]*s[j] for i,j in e)-phi*c*sum(s)
  if H<=-10+1e-8:states.append((mask,c,s,H))
assert len(states)==444
idx={(m,c):i for i,(m,c,s,H) in enumerate(states)}
raw=np.array([(C@s)**2 for m,c,s,H in states]);projected=np.array([(C@PV@s)**2 for m,c,s,H in states]);gamma=np.array([(-1)**sum(s<0) for m,c,s,H in states]);J=np.zeros((444,444))
outer=central=raw_mismatch=0
for i,(mask,c,s,H) in enumerate(states):
 for bit in range(13):
  k=(mask^(1<<bit),c) if bit<12 else (mask,-c);j=idx.get(k)
  if j is None or j<=i:continue
  a=raw[i]@W@raw[j]/2;b=projected[i]@W@projected[j]/2
  assert abs(a/32-round(a/32))<1e-9
  if bit==12:central+=1;assert abs(b)<1e-9
  else:
   outer+=1;assert gamma[i]==-gamma[j]
   if abs(a-b)>1e-7:raw_mismatch+=1
  J[i,j]=b;J[j,i]=-b
assert (outer,central)==(960,72) and raw_mismatch>0
jw=np.linalg.eigvalsh(1j*J);nullity=int(sum(abs(jw)<1e-8));assert nullity==112
# The original v61 topology: 48 sites, 11 links/site, 55 squares/site,
# 12 independent temporal/spatial triangles/site; exact binary rank certificate.
shape=(6,2,2,2);sites=list(product(*(range(k) for k in shape)));si={s:i for i,s in enumerate(sites)}
def step(s,d):return tuple((s[i]+d[i])%shape[i] for i in range(4))
def edge(s,k):return 11*si[s]+k
rows=[]
for s in sites:
 for a,b in combinations(range(11),2):
  row={}
  for q,sign in ((edge(s,a),1),(edge(step(s,D[a]),b),1),(edge(step(s,D[b]),a),-1),(edge(s,b),-1)):row[q]=row.get(q,0)+sign
  rows.append(row)
# 12 independent triangles/site, one orientation per local 2-simplex.
bits=list(product((0,-1),repeat=3))
for s in sites:
 for a in range(3):
  for two in product((0,-1),repeat=2):
   low=[0,0,0];other=[i for i in range(3) if i!=a]
   for i,b in zip(other,two):low[i]=b
   low[a]=-1;high=low.copy();high[a]=0
   u=3+bits.index(tuple(low));w=3+bits.index(tuple(high))
   row={}
   for q,sign in ((edge(s,a),1),(edge(step(s,D[a]),u),1),(edge(s,w),-1)):row[q]=row.get(q,0)+sign
   rows.append(row)
assert len(rows)==3216
piv={}
for row in rows:
 z=sum(1<<q for q,c in row.items() if c%2)
 while z:
  lead=z.bit_length()-1
  if lead in piv:z^=piv[lead]
  else:piv[lead]=z;break
assert len(piv)==477
# upper bound: rank d0=47 and four independent flat winding cocycles;
# this is the same Q149 rank/cell result, independently reconstructed.
B=np.zeros((3216,528));d0=np.zeros((528,48));Fflat=np.array([d for s in sites for d in D],float)
for n,row in enumerate(rows):
 for q,c in row.items():B[n,q]=c
for s in sites:
 for a,d in enumerate(D):d0[edge(s,a),si[s]]=-1;d0[edge(s,a),si[step(s,d)]]+=1
assert np.max(abs(B@d0))==0 and np.max(abs(B@Fflat))==0
assert np.linalg.matrix_rank(d0)==47 and np.linalg.matrix_rank(np.column_stack([d0,Fflat]))==51
# Logical counterexample: spin anticommutation alone does not cancel
# mixed space/charge cross terms if Wilson and chiral charge blocks fail to commute.
Z=np.diag([1.,-1.]);X=np.array([[0.,1.],[1.,0.]])
G=np.kron(np.eye(2),Z);H=np.kron(X,X);hv=np.kron(Z,np.eye(2))
assert np.array_equal(G@H+H@G,np.zeros((4,4)))
assert np.linalg.norm((hv@G)@H+H@(hv@G))==4.0
print('AUDIT PASS: integer hidden polynomial/W, 137, 444 parity/current, v61 topology GF2 rank 477')
print('Q125 chiral scalar nullity:',nullity,'raw/projected mismatch links:',raw_mismatch)
print('PHYSICAL CONCLUSION: finite grading does NOT imply a positive 528-link Hessian or continuum loops')