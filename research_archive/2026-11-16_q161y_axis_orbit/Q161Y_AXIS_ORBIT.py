#!/usr/bin/env python3
"""Exact native icosahedral axis-triple orbit certificate; no physical source assumed."""
from itertools import product, combinations
from collections import Counter
from sympy import sqrt, simplify, Matrix
import networkx as nx
phi=(1+sqrt(5))/2
V=([(0,a,b*phi) for a,b in product((-1,1),repeat=2)]
  +[(a,b*phi,0) for a,b in product((-1,1),repeat=2)]
  +[(a*phi,0,b) for a,b in product((-1,1),repeat=2)])
def d2(i,j):return simplify(sum((V[i][k]-V[j][k])**2 for k in range(3)))
G=nx.Graph();G.add_nodes_from(range(12));G.add_edges_from((i,j) for i,j in combinations(range(12),2) if d2(i,j)==4)
assert G.number_of_edges()==30
faces=[f for f in combinations(range(12),3) if all(G.has_edge(i,j) for i,j in combinations(f,2))]
assert len(faces)==20
pairs=[];unused=set(range(12))
while unused:
 i=min(unused);j=next(j for j in unused-{i} if all(simplify(V[i][k]+V[j][k])==0 for k in range(3)))
 pairs.append((i,j));unused-={i,j}
axis={v:a for a,p in enumerate(pairs) for v in p}
patterns={tuple(sorted(axis[v] for v in f)) for f in faces}
assert len(patterns)==10
assert Counter(a for t in patterns for a in t)==Counter({a:5 for a in range(6)})
assert all(sum(set(q).issubset(t) for t in patterns)==2 for q in combinations(range(6),2))
base=next(t for t in combinations(range(12),3) if simplify(Matrix.hstack(*(Matrix(V[i]) for i in t)).det())!=0)
base_det=simplify(Matrix.hstack(*(Matrix(V[i]) for i in base)).det())
rotations=[];all_auto=0
for perm in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
 all_auto+=1
 new_det=simplify(Matrix.hstack(*(Matrix(V[perm[i]]) for i in base)).det())
 ratio=simplify(new_det/base_det)
 assert ratio in (1,-1),ratio
 if ratio==1:rotations.append(perm)
assert all_auto==120 and len(rotations)==60,(all_auto,len(rotations))
for perm in rotations:
 for t in patterns:
  image=tuple(sorted({axis[perm[pairs[a][0]]] for a in t}))
  assert len(image)==3 and image in patterns
seed=min(patterns)
orbit={tuple(sorted({axis[perm[pairs[a][0]]] for a in seed})) for perm in rotations}
stabilizer=sum(tuple(sorted({axis[perm[pairs[a][0]]] for a in seed}))==seed for perm in rotations)
assert orbit==patterns and stabilizer==6
print('CERTIFIED native icosahedron: 20 faces, 6 antipodal axes, 10 face triples')
print('CERTIFIED 2-(6,3,2) block design; 120 automorphisms, 60 rotations')
print('CERTIFIED rotation orbit size 10, stabilizer 6; no rotation-invariant face triple')
