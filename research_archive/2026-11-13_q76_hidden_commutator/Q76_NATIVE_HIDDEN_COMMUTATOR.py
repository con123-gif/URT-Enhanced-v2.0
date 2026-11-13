#!/usr/bin/env python3
"""Native Q3 A5-twirl vs selected Q2 sigma1 permutation: exact commutator audit."""
import itertools,numpy as np,networkx as nx
from itertools import combinations
from sympy import Matrix
phi=(1+5**.5)/2
pts=np.array([(0,a,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in itertools.product((-1,1),repeat=2)],float)
pairs=[];rem=set(range(12))
while rem:
 i=min(rem);j=min(rem-{i},key=lambda k:np.linalg.norm(pts[i]+pts[k]));pairs.append((i,j));rem-={i,j}
G=nx.Graph();G.add_edges_from((i,j) for i,j in combinations(range(12),2) if abs(np.linalg.norm(pts[i]-pts[j])-2)<1e-9)
code_of={frozenset(pairs[k][(c>>k)&1] for k in range(6)):c for c in range(64)}
perms=[];total=0
for m in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
 total+=1;p=[m[i] for i in range(12)]
 if np.linalg.det(np.linalg.lstsq(pts,pts[p],rcond=None)[0])>0:
  perms.append(np.array([code_of[frozenset(p[pairs[k][(c>>k)&1]] for k in range(6))] for c in range(64)]))
assert total==120 and len(perms)==60
D=(0,2,4,6,10,9)
idx=np.array([sum((((h>>j)&1)^(D[j]&1))<<(D[j]//2) for j in range(6)) for h in range(64)])
assert sorted(idx)==list(range(64));inv=np.empty(64,dtype=int);inv[idx]=np.arange(64)
Q=np.zeros((64,64),dtype=np.int64)
for h in range(64):Q[h,2*h%64]=Q[h,(2*h+1)%64]=1
X=Q[np.ix_(inv,inv)];S=np.zeros((64,64),dtype=np.int64)
for p in perms:S+=X[np.ix_(p,p)]
S=S[np.ix_(idx,idx)]
assert np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
sig=[0]*64
for x in range(32):sig[x]=2*x+1;sig[x+32]=2*x
P=np.zeros((64,64),dtype=np.int64)
for i,j in enumerate(sig):P[i,j]=1
assert np.array_equal(P@P.T,np.eye(64,dtype=int))
comm=S@P-P@S
assert np.array_equal(comm@np.ones(64,dtype=np.int64),np.zeros(64,dtype=np.int64))
rank=Matrix(comm.tolist()).rank()
cycles=[];seen=set()
for i in range(64):
 if i in seen:continue
 cyc=[];j=i
 while j not in seen:seen.add(j);cyc.append(j);j=sig[j]
 assert j==i;cycles.append(cyc)
B=np.zeros((64,6),dtype=np.int64)
for k,c in enumerate(cycles):B[c,k]=1
assert np.array_equal(comm@B,np.zeros((64,6),dtype=np.int64))
assert np.array_equal(B.T@comm,np.zeros((6,64),dtype=np.int64))
assert rank==32
assert int(np.sum(comm*comm))==7200
print('Q75_NATIVE_Q3_SIGMA_COMMUTATOR_RANK',rank)
print('Q75_NATIVE_Q3_SIGMA_COMMUTATOR_FROBENIUS_SQUARED',int(np.sum(comm*comm)))
print('Q75_CLOCK_FIXED_LEFT_RIGHT_ANNIHILATION',True)
print('Q75_NATIVE_Q3_SIGMA_COMMUTATOR_PASS')
# Q76: original 20-face incidence and original H64 six-axis occupancy U_h.
# This is the same native geometry/commutator as the locally executed Q76
# standalone script; no fitted or synthetic projector is used.
from sympy import eye, zeros, trace
faces=sorted(tuple(t) for t in combinations(range(12),3) if all(G.has_edge(i,j) for i,j in combinations(t,2)))
assert len(faces)==20
C=zeros(20,12)
for f,t in enumerate(faces):
 for v in t:C[f,v]=1
Ph=eye(20)-C*(C.T*C).inv()*C.T
assert Ph.rank()==8
M=zeros(64,20)
for h in range(64):
 selected={pairs[k][(h>>k)&1] for k in range(6)}
 for f,t in enumerate(faces):M[h,f]=int(set(t)<=selected)
assert M.T*M*Ph==2*Ph
P8=M*Ph*M.T/2
assert P8*P8==P8 and trace(P8)==8
P8h=P8.extract(idx.tolist(),idx.tolist())
assert P8h*P8h==P8h
comm_exact=Matrix(comm.tolist())
left=P8h*comm_exact
right=comm_exact*P8h
left_rank=left.rank();right_rank=right.rank()
energy=trace(P8h*comm_exact*comm_exact.T)
assert energy==1296 and left_rank==right_rank==4
print('Q76_NATIVE_HIDDEN_OVERLAP_RANK',left_rank)
print('Q76_NATIVE_HIDDEN_OVERLAP_ENERGY',energy)
print('Q76_NATIVE_HIDDEN_OVERLAP_PASS')
