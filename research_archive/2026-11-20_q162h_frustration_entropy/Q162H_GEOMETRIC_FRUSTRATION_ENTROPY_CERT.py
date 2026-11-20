#!/usr/bin/env python3
"""Q162h native all-five frustration->A4 selection->Shannon/H64 entropy.
The ONLY inputs are ORIGINAL Q162E whole-five K/G, Q101 60 genuine
frustration ground words, and Q101 P3/P5 hidden-source operators.
DECLARED premise: Euclidean gradient G da/dt=-K a, and survival weights
p_s(t)=||u_s(t)||²/sum_j||u_j(t)||². Not a Born or second-law derivation.
No empirical data, masses, coefficients or synthetic source matrices.
"""
from pathlib import Path
from itertools import product,combinations
import contextlib,io,runpy,math
import numpy as np
import networkx as nx
from scipy.linalg import expm
source=Path(__file__).resolve().parent.parent.parent/(
 '2026-11-20_q162d_h64_charge_doubling/Q162E_WHOLE_FIVE_TO_Q4_KINETIC_CERT.py')
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(source))
Iico,kin,C,P3,P5,Ph=d['Iico'],d['kin'],d['C'],d['P3'],d['P5'],d['Ph']
Delta=d['Delta'];ground=d['ground'];V=d['original_v']
assert len(ground)==60 and len(V)==12 and Iico.shape==(12,8)
U=[];Ut=[];rates=[]
for mask,s,m in ground:
 z=Iico.T@s;dz=-kin@z;x=Iico@z;dx=Iico@dz
 f=(C@x)**2;ft=2*(C@x)*(C@dx)
 u=P3@f+Delta*P5@f
 ut=P3@ft+Delta*P5@ft
 U.append(u);Ut.append(ut);rates.append(2*u@ut/(u@u))
U=np.stack(U,axis=1);Ut=np.stack(Ut,axis=1);rates=np.array(rates)
assert np.linalg.norm(U@U.T-(96*P3+32*Delta**2*P5))<1e-9
groups=[(12,-12.747669375272),(24,-12.351761140940),(24,-11.296778573217)]
assert all(sum(abs(rates-r)<1e-8)==num for num,r in groups)
mean=float(rates.mean());var=float(rates.var())
assert abs(mean+12.00894976071713)<1e-9
assert abs(var-0.3590243108722678)<1e-9
# p_s'=p_s(r_s-mean_p r); all initial norms equal -> p_s(0)=1/60.
# Thus for H=-sum p_s log(p_s): H'(0)=0, H''(0)=-Var(r_s).
C0=U@U.T;Cd=Ut@U.T+U@Ut.T
rho=C0/np.trace(C0)
drho=(Cd-rho*np.trace(Cd))/np.trace(C0)
p5=float(np.trace(P5@rho));dp5=float(np.trace(P5@drho))
Sdot=dp5*math.log((1-p5)/p5)
assert abs(p5-Delta**2/(3+Delta**2))<1e-12
assert abs(dp5+7.652339387623173e-6)<1e-11
assert abs(Sdot+0.00010017071627677586)<1e-10
# Check the original common A4 action in ORIGINAL face incidence, not
# just hypothesized block dimensions. It preserves drho; whole A5 does not.
edges=sorted((i,j) for i,j in combinations(range(12),2)
 if abs(np.sum((V[i]-V[j])**2)-4)<1e-10)
faces=sorted(f for f in combinations(range(12),3)
 if all(tuple(sorted((i,j))) in edges for i,j in combinations(f,2)))
assert (len(edges),len(faces))==(30,20)
fd={f:i for i,f in enumerate(faces)}
A4=[]
for t in range(3):
 P=np.roll(np.eye(3),-t,axis=1)
 for a,b in product((-1,1),repeat=2):
  R=np.diag([a,b,a*b])@P
  perm=np.argmin(np.linalg.norm(V[:,None,:]-(V@R.T)[None,:,:],axis=2),axis=0)
  assert np.max(np.linalg.norm(V[perm]-V@R.T,axis=1))<1e-10
  fp=[fd[tuple(sorted(perm[list(f)]))] for f in faces]
  M=np.zeros((20,20));M[fp,range(20)]=1
  A4.append(M)
assert len(A4)==12
comm=max(np.linalg.norm(M@drho-drho@M) for M in A4)
assert comm<1e-11
singlet_projector=(sum(A4)/12)@P3
assert np.linalg.matrix_rank(singlet_projector,tol=1e-8)==1
singlet=float(np.trace(singlet_projector@drho))
triplet=float(np.trace((P3-singlet_projector)@drho)/3)
assert abs(singlet-0.12312134027331831)<1e-9
assert abs(triplet+0.04103789597797657)<1e-9
graph=nx.Graph();graph.add_nodes_from(range(12));graph.add_edges_from(edges)
nonA4=None
for perm in nx.algorithms.isomorphism.GraphMatcher(graph,graph).isomorphisms_iter():
 w=np.array([V[perm[i]] for i in range(12)])
 Rfit=np.linalg.lstsq(V,w,rcond=None)[0]
 if np.linalg.det(Rfit)<0 or np.linalg.norm(V@Rfit-w)>1e-9:continue
 fp=[fd[tuple(sorted(perm[i] for i in f))] for f in faces]
 M=np.zeros((20,20));M[fp,range(20)]=1
 if all(np.linalg.norm(M-g)>1e-8 for g in A4):
  nonA4=float(np.linalg.norm(M@drho-drho@M))
  break
assert nonA4 is not None and nonA4>0.2

def diagnostics(t):
 T=expm(-kin*t);u=[]
 for mask,s,m in ground:
  x=Iico@(T@(Iico.T@s));f=(C@x)**2
  u.append(P3@f+Delta*P5@f)
 u=np.stack(u,axis=1);w=np.sum(u*u,axis=0);p=w/w.sum()
 cov=u@u.T/w.sum();eig=np.linalg.eigvalsh(cov)
 return (-float(p@np.log(p)),
         -sum(e*math.log(e) for e in eig if e>1e-15),p)
h=1e-4;H0,S0,p0=diagnostics(0);Hp,Sp,pp=diagnostics(h);Hm,Sm,pm=diagnostics(-h)
Hpp=(Hp+Hm-2*H0)/h**2
assert abs(H0-math.log(60))<1e-12
assert np.max(abs(p0-1/60))<1e-12
assert abs(Hpp+var)<3e-5
assert abs((Sp-Sm)/(2*h)-Sdot)<3e-7
H1,S1,p1=diagnostics(1);H2,S2,p2=diagnostics(2);H3,S3,p3=diagnostics(3)
assert H2<H1<H0 and H3>H2 # NO MONOTONE-ENTROPY CLAIM
last=np.abs(rates-groups[2][1])<1e-8
assert abs(p1[last].sum()-0.6673433278593067)<1e-7
assert abs(p2[last].sum()-0.9013852257274615)<1e-7
print('Q162h ORIGINAL 50/90/50->8->12->20->H64/60 PASS')
print('history rates sizes',groups,'mean',mean,'variance',var)
print('Shannon Hdot0=0, Hddot0',-var,'direct difference',Hpp)
print('hidden quantum p5,dp5,Sdot',p5,dp5,Sdot)
print('A4 4->1+3 derivative',singlet,triplet,'A4 comm',comm,'nonA4 defect',nonA4)
print('classC survival weight t1 t2',p1[last].sum(),p2[last].sum())
print('Shannon H at t0,t1,t2,t3',H0,H1,H2,H3)
print('STATUS conditional Euclidean gradient and norm conditioning; Q96 Ward/physical clock OPEN')
