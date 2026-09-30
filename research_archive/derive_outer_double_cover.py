#!/usr/bin/env python3
import sys,itertools,math,json
from pathlib import Path
import numpy as np
sys.path.insert(0,'/mnt/data');import active_core as ac
V=ac.unit_vertices[ac.axis_reps];S=math.sqrt(5)*(V@V.T);np.fill_diagonal(S,0);S=np.rint(S).astype(int)
# signed A5 lifts as monomial tuples: tuple image rows and signs per column
def matkey(M):return tuple(M.astype(int).ravel())
def mul(A,B):return A@B
signed=[]
for R in ac.rotations:
 G=np.zeros((6,6),int)
 for a,v in enumerate(V):
  z=R@v;dots=V@z;b=int(np.argmax(np.abs(dots)));G[b,a]=int(np.sign(dots[b]))
 signed.append(G)
assert len({matkey(x) for x in signed})==60
# normalizer and one order6 outer permutation
ap=ac.aperms;gs=set(ap)
def co(p,q):return tuple(p[q[i]] for i in range(6))
def iv(p):
 o=[0]*6
 for i,j in enumerate(p):o[j]=i
 return tuple(o)
def od(p):
 z=tuple(range(6));x=z
 for n in range(1,61):
  x=co(p,x)
  if x==z:return n
N=[]
for p in itertools.permutations(range(6)):
 pi=iv(p)
 if {co(co(p,g),pi) for g in gs}==gs:N.append(p)
p=next(x for x in N if x not in gs and od(x)==6)
P=np.zeros((6,6),int);P[list(p),range(6)]=1
outer=None
for bits in itertools.product([1,-1],repeat=6):
 G=np.diag(bits)@P
 if np.array_equal(G@S@G.T,-S) and round(np.linalg.det(G))==1:outer=G;break
assert outer is not None
# Generate closure from all signed A5 plus outer.
gens=signed+[outer]
group={matkey(np.eye(6,dtype=int)):np.eye(6,dtype=int)};front=[np.eye(6,dtype=int)]
while front:
 A=front.pop()
 for B in gens:
  C=A@B;k=matkey(C)
  if k not in group:group[k]=C;front.append(C)
print('group order',len(group))
# projection to underlying unsigned permutation
perms=set();kernel=[]
def underlying(M):return tuple(int(np.argmax(np.abs(M[:,j]))) for j in range(6))
for M in group.values():
 perms.add(underlying(M))
 if underlying(M)==tuple(range(6)):kernel.append(M)
# center
vals=list(group.values());center=[A for A in vals if all(np.array_equal(A@B,B@A) for B in vals)]
def orderM(A):
 X=np.eye(6,dtype=int)
 for n in range(1,49):
  X=X@A
  if np.array_equal(X,np.eye(6,dtype=int)):return n
orders={}
for A in vals:orders[orderM(A)]=orders.get(orderM(A),0)+1
out={'group_order':len(group),'quotient_permutation_order':len(perms),'kernel_size':len(kernel),'kernel':[M.tolist() for M in kernel],'center_size':len(center),'center':[M.tolist() for M in center],'outer_permutation':list(p),'outer_lift':outer.tolist(),'outer_lift_order':orderM(outer),'outer_lift_sixth':np.linalg.matrix_power(outer,6).tolist(),'orders':orders,'A5_signed_order':len(signed),'preserve_hodge_A5':max(np.linalg.norm(G@S@G.T-S) for G in signed),'reverse_hodge_outer':float(np.linalg.norm(outer@S@outer.T+S))}
Path('/mnt/data/outer_double_cover_results.json').write_text(json.dumps(out,indent=2))
print(json.dumps({k:out[k] for k in ['group_order','quotient_permutation_order','kernel_size','center_size','outer_lift_order','orders','preserve_hodge_A5','reverse_hodge_outer']},indent=2))