#!/usr/bin/env python3
"""Exact original icosahedral 20-face hidden P5 projector orbit classification."""
from itertools import combinations
from collections import Counter
import networkx as nx
import sympy as s
G=nx.icosahedral_graph()
assert G.number_of_nodes()==12 and G.number_of_edges()==30
faces=sorted(tuple(c) for c in nx.enumerate_all_cliques(G) if len(c)==3)
assert len(faces)==20
C=s.Matrix([[int(v in f) for v in range(12)] for f in faces])
assert C.rank()==12
Ph=s.eye(20)-C*(C.T*C).inv()*C.T
L=s.Matrix(20,20,lambda i,j:3*int(i==j)-int(len(set(faces[i])&set(faces[j]))==2))
P5=s.simplify(Ph*(L-3*s.eye(20))/2)
assert P5*P5==P5 and P5.T==P5 and s.trace(P5)==4
assert L*P5==5*P5
dual=nx.Graph();dual.add_nodes_from(range(20));dual.add_edges_from((i,j) for i in range(20) for j in range(i+1,20) if len(set(faces[i])&set(faces[j]))==2)
assert nx.is_connected(dual) and nx.diameter(dual)==5
classes={}
for i in range(20):
 for j in range(i,20):
  dist=nx.shortest_path_length(dual,i,j)
  classes.setdefault(dist,set()).add(P5[i,j])
print('rank',s.trace(P5),'classes', {str(k):sorted(map(str,v)) for k,v in classes.items()})
assert all(len(v)==1 for v in classes.values()),'Overlap classes not scalar: report finer invariant'
