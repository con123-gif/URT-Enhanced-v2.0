#!/usr/bin/env python3
"""Native Q3 A5-twirl on sigma1 clock-fixed space, selected Q64 dictionary."""
import itertools, numpy as np, networkx as nx
from itertools import combinations
from sympy import Matrix, Rational, ones, eye, factor
phi=(1+5**.5)/2
pts=np.array([(0,a,b*phi) for a,b in itertools.product((-1,1),repeat=2)]+[(a,b*phi,0) for a,b in itertools.product((-1,1),repeat=2)]+[(a*phi,0,b) for a,b in itertools.product((-1,1),repeat=2)],float)
pairs=[];rem=set(range(12))
while rem:
 i=min(rem);j=min(rem-{i},key=lambda k:np.linalg.norm(pts[i]+pts[k]));pairs.append((i,j));rem-={i,j}
G=nx.Graph();G.add_edges_from((i,j) for i,j in combinations(range(12),2) if abs(np.linalg.norm(pts[i]-pts[j])-2)<1e-9)
code_of={frozenset(pairs[k][(c>>k)&1] for k in range(6)):c for c in range(64)}
perms=[]
automorphisms=0
for m in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
 automorphisms+=1
 p=[m[i] for i in range(12)]
 if np.linalg.det(np.linalg.lstsq(pts,pts[p],rcond=None)[0])>0:
  perms.append(np.array([code_of[frozenset(p[pairs[k][(c>>k)&1]] for k in range(6))] for c in range(64)]))
assert automorphisms==120 and len(perms)==60, (automorphisms,len(perms))
D=(0,2,4,6,10,9)
assert len(set(D))==6 and all(0<=d<12 for d in D)
bits=np.array([[(h>>i)&1 for i in range(6)] for h in range(64)],dtype=int)
axis=[d//2 for d in D];sgn=[d&1 for d in D]
idx=np.array([sum(int(bits[h,j]^sgn[j])<<axis[j] for j in range(6)) for h in range(64)])
assert sorted(idx.tolist())==list(range(64))
inv=np.empty(64,dtype=int);inv[idx]=np.arange(64)
Q2=np.zeros((64,64),dtype=np.int64)
for h in range(64):Q2[h,2*h%64]=Q2[h,(2*h+1)%64]=1
X=Q2[np.ix_(inv,inv)];S=np.zeros((64,64),dtype=np.int64)
for p in perms:S+=X[np.ix_(p,p)]
S=S[np.ix_(idx,idx)]
assert np.all(S.sum(axis=1)==120) and np.all(S.sum(axis=0)==120)
sig=[None]*64
for x in range(32):sig[x]=2*x+1;sig[x+32]=2*x
cycles=[];seen=set()
for x in range(64):
 if x in seen:continue
 cyc=[];y=x
 while y not in seen:seen.add(y);cyc.append(y);y=sig[y]
 assert y==x;cycles.append(cyc)
assert sorted(map(len,cycles))==[4,12,12,12,12,12]
B=np.zeros((64,6),dtype=np.int64)
for j,cyc in enumerate(cycles):B[cyc,j]=1
N=Matrix(6,6,lambda i,j:Rational(int(B[:,i]@S@B[:,j]),120*len(cycles[i])))
assert N*ones(6,1)==ones(6,1)
P=Matrix(64,64,lambda i,j:Rational(1,len(cycles[next(k for k,c in enumerate(cycles) if i in c)])) if any(i in c and j in c for c in cycles) else 0)
K=Matrix(S.tolist())/120
leak=(eye(64)-P)*K*P;comm=K*P-P*K
pi=ones(6,1)*Matrix([[Rational(len(c),64) for c in cycles]])
assert N.rank()==6 and (N-pi).rank()==5
assert leak.rank()==0 and comm.rank()==0
char=factor(N.charpoly().as_expr())
la=N.charpoly().gen
expected=(la-1)*(3*la-1)*(6*la-1)*(12*la+1)*(15*la-2)*(15*la-1)/48600
assert factor(char-expected)==0
assert (N**6-pi).rank()==5
print('Q3_CYCLE_SIZES',sorted(map(len,cycles)))
print('Q3_CYCLE_COMPRESSED_MATRIX',N)
print('Q3_CYCLE_COMPRESSED_RANK',N.rank(),'CENTERED_RANK',(N-pi).rank())
print('Q3_CLOCK_LEAKAGE_RANK',leak.rank(),'Q3_CLOCK_COMMUTATOR_RANK',comm.rank())
print('Q3_COMPRESSED_CHARPOLY',char)
print('Q71_NATIVE_Q3_FIXED_SPACE_CERTIFICATE_OK')
