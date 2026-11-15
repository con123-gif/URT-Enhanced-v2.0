#!/usr/bin/env python3
"""Independent Q144a original golden 444-state graph, shell and typed equitable quotient.
Original 12-vertex icosahedron, no synthetic graph, no legacy Q77 law.
Q125a source-weighted charged equitable quotient is a separate OPEN problem.
"""
from itertools import product,combinations
from collections import Counter,defaultdict
from math import sqrt
phi=(1+sqrt(5))/2
V=[(0.,a,b*phi) for a,b in product((-1,1),repeat=2)]+[(a,b*phi,0.) for a,b in product((-1,1),repeat=2)]+[(a*phi,0.,b) for a,b in product((-1,1),repeat=2)]
edges=[(i,j) for i,j in combinations(range(12),2) if abs(sum((V[i][k]-V[j][k])**2 for k in range(3))-4)<1e-12]
assert len(edges)==30
H={};E={};M={};C={}
for x in range(8192):
 s=[1-2*((x>>i)&1) for i in range(12)];e=sum(s[i]*s[j] for i,j in edges);m=sum(s);c=1-2*((x>>12)&1)
 H[x]=e+phi*c*m;E[x]=e;M[x]=m;C[x]=c
xs=[x for x in range(8192) if H[x]<=-10+1e-10]
assert len(xs)==444
index={x:i for i,x in enumerate(xs)}
E_levels=sorted(set(round(H[x],10) for x in xs));assert len(E_levels)==3
shell=[E_levels.index(round(H[x],10)) for x in xs]
assert [shell.count(i) for i in range(3)]==[60,240,144]
adj=[[] for _ in xs];links=[]
for i,x in enumerate(xs):
 for bit in range(13):
  y=x^(1<<bit)
  if y in index:
   j=index[y];adj[i].append((j,bit))
   if i<j:links.append((i,j,bit))
assert len(links)==1032
assert Counter(bit==12 for _,_,bit in links)==Counter({False:960,True:72})
assert Counter(tuple(sorted((shell[i],shell[j]))) for i,j,_ in links)==Counter({(0,1):360,(1,2):600,(2,2):72})
# Equitable refinement means each cell has identical numbers of neighbours in each other cell.
def refine(color,typed):
 color=list(color);history=[]
 for _ in range(20):
  signatures=[]
  for i in range(444):
   counts=Counter(((bit==12) if typed else False,color[j]) for j,bit in adj[i])
   signatures.append((color[i],tuple(sorted(counts.items()))))
  keys={z:k for k,z in enumerate(sorted(set(signatures)))}
  nxt=[keys[z] for z in signatures];history.append(len(keys))
  if len(keys)==len(set(color)):
   assert all(len({nxt[i] for i in range(444) if color[i]==c})==1 for c in set(color))
   return nxt,history
  color=nxt
 raise RuntimeError('Refinement not stable')
def certify(colors,typed):
 groups=defaultdict(list)
 for i,c in enumerate(colors):groups[c].append(i)
 for group in groups.values():
  def row(i):return Counter(((bit==12) if typed else False,colors[j]) for j,bit in adj[i])
  assert all(row(i)==row(group[0]) for i in group)
 rev=[index[x^8191] for x in xs]
 assert all(rev[rev[i]]==i for i in range(444))
 assert all(set((rev[j],bit) for j,bit in adj[i])==set(adj[rev[i]]) for i in range(444))
 mapping={}
 for i,c in enumerate(colors):
  d=colors[rev[i]]
  assert c not in mapping or mapping[c]==d
  mapping[c]=d
 assert all(mapping[mapping[c]]==c for c in mapping)
 return sorted(len(v) for v in groups.values())
plain,h1=refine(shell,False)
typed,h2=refine([(shell[i],C[x]) for i,x in enumerate(xs)],True)
assert len(set(plain))==5 and h1==[5,5]
assert len(set(typed))==10 and h2==[10,10]
assert certify(plain,False)==[24,60,120,120,120]
assert certify(typed,True)==[12,12,30,30,60,60,60,60,60,60]
# Because the existing Q125a antisymmetric source f_x^T W f_y uses the OUTER
# spins only, all 72 centre flips have f_x=f_y, hence J_xy=0 exactly.
# All remaining hopping links flip one outer spin and change outer bit parity.
# Each centre sector has (102,120) opposite-parity vectors: index lower bound.
parity={x:(x&4095).bit_count()%2 for x in xs}
for c in (-1,1):
 counts=Counter(parity[x] for x in xs if C[x]==c)
 assert sorted(counts.values())==[102,120]
assert 2*(120-102)*96==3456
print('Q144a original 444-state energy shell quotient [60,240,144]')
print('Q144a exact ordinary equitable quotient:',len(set(plain)),certify(plain,False))
print('Q144a exact centre/flip-type equitable quotient:',len(set(typed)),certify(typed,True))
print('Q142 recovered bipartite charge-index lower bound >= 3456, conditional on existing Q125a source definition')
print('Q144a exact native graph certificate: PASS')
