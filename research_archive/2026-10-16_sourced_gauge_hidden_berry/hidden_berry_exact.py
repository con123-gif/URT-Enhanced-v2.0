"""Exact Cathedral hidden POVM, complete u(8) Lie closure and Berry curvature.

Tested independent finite operators; NumPy + SymPy. No measured input,
output file mutation or fitted coefficient.
Run: python hidden_berry_exact.py
"""
from itertools import combinations
import json
import numpy as np
import sympy as s

phi=(1+s.sqrt(5))/2
v=[]
for a in (-1,1):
 for b in (-phi,phi):
  v.extend(((0,a,b),(a,b,0),(b,0,a)))
edges={(i,j) for i,j in combinations(range(12),2)
       if s.simplify(sum((v[i][k]-v[j][k])**2 for k in range(3))-4)==0}
faces=[f for f in combinations(range(12),3)
       if all(pair in edges for pair in combinations(f,2))]
assert (len(v),len(edges),len(faces))==(12,30,20)
C=s.Matrix(20,12,lambda f,i:int(i in faces[f]))
Lf=3*s.eye(20)
for i,j in combinations(range(20),2):
 if len(set(faces[i])&set(faces[j]))==2:
  Lf[i,j]=Lf[j,i]=-1
H=s.Matrix.hstack(*[x for z in (3,5)
                      for x in (Lf-z*s.eye(20)).nullspace()])
assert H.shape==(20,8)
assert C.T*H==s.zeros(12,8)
left=(H.T*H).inv()*H.T
E=[left*s.diag(*[int(C[f,i]) for f in range(20)])*H/3
   for i in range(12)]
assert sum(E,s.zeros(8))==s.eye(8)
F={}
strengths={}
for i,j in combinations(range(12),2):
 T=-9*(E[i]*E[j]-E[j]*E[i])
 length=s.simplify(sum((v[i][k]-v[j][k])**2 for k in range(3)))
 if s.simplify(length-4)==0:category="edge"
 elif s.simplify(length-(6+2*s.sqrt(5)))==0:category="distance2"
 elif s.simplify(length-(10+2*s.sqrt(5)))==0:category="antipodal"
 else:raise AssertionError(length)
 mag=s.factor(-s.trace(T*T))
 strengths.setdefault(category,[]).append(mag)
 F[(i,j)]=T
assert {k:len(x) for k,x in strengths.items()}=={
 "edge":30,"distance2":30,"antipodal":6}
assert all(len(set(x))==1 for x in strengths.values())
assert strengths["edge"][0]==s.Rational(2288,50625)
assert strengths["distance2"][0]==s.Rational(3968,50625)
assert strengths["antipodal"][0]==s.Rational(16,135)
total=s.factor(sum(z for x in strengths.values() for z in x))
mixed=s.factor(-sum(s.trace(T[:4,4:]*T[4:,:4]) for T in F.values()))
assert total==s.Rational(14912,3375)
assert mixed==s.Rational(4,5)

P=1009
def modval(z):
 z=s.Rational(z)
 assert int(z.q)%P!=0
 return int(z.p)*pow(int(z.q)%P,-1,P)%P
Am=[np.array([[modval(A[i,j]) for j in range(8)]
             for i in range(8)],dtype=np.int64) for A in E]
def rank_mod(M):
 B=M.copy()%P;r=0
 for col in range(B.shape[1]):
  eligible=np.flatnonzero(B[r:,col])
  if not len(eligible):continue
  q=r+int(eligible[0]); B[[q,r]]=B[[r,q]]
  B[r]=B[r]*pow(int(B[r,col]),-1,P)%P
  for k in range(r+1,len(B)):
   if B[k,col]: B[k]=(B[k]-int(B[k,col])*B[r])%P
  r+=1
  if r==B.shape[1]:break
 return r
# Common commutant equation X Ei-Ei X=0; 768 rows, 64 unknowns.
rows=[]
for A in E:
 for i in range(8):
  for j in range(8):
   row=[s.Rational(0)]*64
   for k in range(8):
    row[i*8+k]+=A[k,j]
    row[8*k+j]-=A[i,k]
   rows.append([modval(x) for x in row])
commutant_rank=rank_mod(np.asarray(rows,dtype=np.int64))
assert commutant_rank==63
# Exact identity commutes with all: upper bound rank=63.
assert all(s.eye(8)*A-A*s.eye(8)==s.zeros(8) for A in E)

# Incremental modular proof: products through length 3 span M8(C).
pivot={};word_basis=[];depths=[]
def accept(T,d,phase=None):
 vec=np.zeros(128 if phase is not None else 64,dtype=np.int64)
 if phase is None:vec=T.reshape(-1)%P
 else:vec[64*phase:64*(phase+1)]=T.reshape(-1)%P
 for k,b in sorted(pivot.items()):
  if vec[k]: vec=(vec-int(vec[k])*b)%P
 nonzero=np.flatnonzero(vec)
 if not len(nonzero):return False
 k=int(nonzero[0]);pivot[k]=(vec*pow(int(vec[k]),-1,P))%P
 word_basis.append((T.copy(),phase));depths.append(d)
 return True
accept(np.eye(8,dtype=np.int64),0)
assoc=[1];start=0
for d in (1,2,3):
 stop=len(word_basis)
 for j in range(start,stop):
  M,_=word_basis[j]
  for A in Am:accept(M@A%P,d)
 start=stop
 assoc.append(len(word_basis))
assert assoc==[1,12,62,64]

pivot={};word_basis=[];depths=[]
for A in Am:accept(A,1,phase=1) # i*A anti-Hermitian
lie=[len(word_basis)];start=0
for d in (2,3,4):
 stop=len(word_basis)
 for j in range(start,stop):
  M,phase=word_basis[j]
  for A in Am:
   T=(M@A-A@M)%P
   if phase==1:T=(-T)%P
   accept(T,d,phase=1-phase)
 start=stop
 lie.append(len(word_basis))
assert lie==[12,39,63,64]
# These 64 exact rational Lie-word directions are anti-Hermitian in the
# inherited real Hilbert metric. Since u8 has real dimension 64, equality.

# Exact information-theoretic curvature orbit Hessian:
# rho_star=a I4 + b I4, chi=(log a-log b)/(a-b).
Delta=3/20-80*s.pi/(1053*phi)
eta=-s.log(Delta)
chi=8*eta*(1+Delta**2)/(1-Delta**2)
a=1/(4*(1+Delta**2));b=Delta**2*a
orbit=s.simplify(mixed*chi*(a-b)**2)
assert s.simplify(orbit-s.Rational(2,5)*eta*(1-Delta**2)/(1+Delta**2))==0
print(json.dumps({
 "hidden_POVM_effects":12,
 "associative_rank_by_word_degree":assoc,
 "Lie_u8_rank_by_commutator_depth":lie,
 "rational_commutant_constraint_rank":commutant_rank,
 "Berry_strengths_per_pair":{k:str(v[0]) for k,v in strengths.items()},
 "Berry_total_strength":str(total),
 "Berry_off_quartet_strength":str(mixed),
 "BKM_orbit_Hessian_expression":"(2/5)*eta*tanh(eta)",
 "BKM_orbit_Hessian_value":float(orbit),
 "checks":"exact rational identities and modular rank over F1009",
 "physical_status":"finite connection/curvature and relative-entropy response established; empirical gauge dynamics not thereby selected"
},indent=2))
