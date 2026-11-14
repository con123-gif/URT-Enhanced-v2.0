#!/usr/bin/env python3
"""Q116 exact original hidden P5 wedge² -> visible 3+3prime local golden map."""
from itertools import product,combinations
import networkx as nx
import numpy as np
import sympy as s
r=s.sqrt(5);phi=(1+r)/2;z=s.Integer(0)
vertices=([(z,s.Integer(a),s.Integer(b)*phi) for a,b in product((-1,1),repeat=2)]
 +[(s.Integer(a),s.Integer(b)*phi,z) for a,b in product((-1,1),repeat=2)]
 +[(s.Integer(a)*phi,z,s.Integer(b)) for a,b in product((-1,1),repeat=2)])
G=nx.Graph();G.add_nodes_from(range(12))
G.add_edges_from((i,j) for i,j in combinations(range(12),2)
 if s.simplify(sum((vertices[i][k]-vertices[j][k])**2 for k in range(3)))==4)
assert G.number_of_edges()==30
faces=sorted(tuple(t) for t in nx.enumerate_all_cliques(G) if len(t)==3)
assert len(faces)==20
C=s.Matrix(20,12,lambda i,j:int(j in faces[i]))
dual=nx.Graph();dual.add_nodes_from(range(20))
dual.add_edges_from((i,j) for i,j in combinations(range(20),2)
 if len(set(faces[i])&set(faces[j]))==2)
D=s.Matrix(20,20,lambda i,j:int(dual.has_edge(i,j)))
P=(s.eye(20)-C*(C.T*C).inv()*C.T)*(-D)/2
assert C.rank()==12 and P==P.T and P*P==P and s.trace(P)==4
vals={0:s.Rational(1,5),1:-s.Rational(2,15),2:s.Rational(1,30),
      3:s.Rational(1,30),4:-s.Rational(2,15),5:s.Rational(1,5)}
assert P==s.Matrix(20,20,lambda i,j:vals[nx.shortest_path_length(dual,i,j)])
cent=[s.Matrix([sum(vertices[v][k] for v in f)/3 for k in range(3)]) for f in faces]
stars=[]
for v in range(12):
  attached=[i for i,f in enumerate(faces) if v in f]
  assert len(attached)==5
  B=s.zeros(20)
  for i,j in combinations(attached,2):
    if not dual.has_edge(i,j):continue
    u=cent[i]-s.Matrix(vertices[v]);w=cent[j]-s.Matrix(vertices[v])
    det=s.simplify(s.Matrix.hstack(s.Matrix(vertices[v]),u,w).det())
    assert det!=0
    sign=int(s.sign(det));assert sign in (-1,1)
    B[i,j]=sign;B[j,i]=-sign
  assert sum(abs(B[i,j]) for i in range(20) for j in range(20))==10
  stars.append(B)
PB=[P*B*P for B in stars]
H=s.Matrix(12,12,lambda v,w:-s.trace(PB[v]*PB[w])/2)
A=s.Matrix(12,12,lambda v,w:int(G.has_edge(v,w)))
I=s.eye(12)
W=-(A*A-25*I)*(A*A-I)/80
assert W*W==W and s.trace(W)==6
assert H==(5*I-A)*W/9
assert H*W==H and s.trace(H)==s.Rational(10,3)
assert s.simplify(((5+r)/(5-r))-phi**2)==0
spec=np.linalg.eigvalsh(np.array(H,float))
assert sum(abs(e)>1e-9 for e in spec)==6
print('EXACT hidden 4_5 wedge2 -> 3+3prime Gram (5I-A)P_W/9 rank6')
print('Two 3-fold eigenvalues (5±sqrt5)/9, singular ratio phi: PASS')
face_index={f:i for i,f in enumerate(faces)}
X=s.Matrix.hstack(*(s.Matrix(vertices[k]) for k in (0,1,4)))
assert X.det()!=0
nplus=nminus=0
for p in nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter():
  Y=s.Matrix.hstack(*(s.Matrix(vertices[p[k]]) for k in (0,1,4)))
  orient=s.simplify(Y.det()/X.det());assert orient in (-1,1)
  nplus+=int(orient==1);nminus+=int(orient==-1)
  fp=[face_index[tuple(sorted(p[v] for v in f))] for f in faces]
  for v in range(12):assert stars[p[v]].extract(fp,fp)==orient*stars[v]
assert (nplus,nminus)==(60,60)
print('Exact local oriented face-ring covariance: 60 proper A5 + 60 improper PASS')
print('Q116 EXACT NEW NATIVE INTRA-HIDDEN GOLDEN BRIDGE: PASS')
