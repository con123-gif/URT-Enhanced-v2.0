#!/usr/bin/env python3
"""URT 64-word source, tetrahedral A4 singlet selected from original A5 geometry.
Exact group-theoretic projection; no physical ARF weights or mass inputs.
Computes one-point moments and temporal 2- and 3-point cumulant densities.
"""
import contextlib,io,runpy
from itertools import combinations
from pathlib import Path
import networkx as nx
import numpy as np
_root=Path(__file__).resolve().parent
H=next((p for p in (_root.parent/'forward',_root.parent/'urt_arf_forward_2026_11_09') if (p/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py').exists()),None)
assert H is not None, 'original Nov 9 source cannot be found'
with contextlib.redirect_stdout(io.StringIO()):
 m=runpy.run_path(str(H/'cathedral_constructed_joint_dynamics_2026_11_07.py'))
 src=runpy.run_path(str(H/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
R3,R5=np.asarray(src['R3'],float),np.asarray(src['R5'],float)
P3,P5=np.asarray(src['P3'],float),np.asarray(src['P5'],float)
pts=m['geom']['icosahedron']['points'];faces=m['geom']['icosahedron']['faces']
G=nx.Graph();G.add_nodes_from(range(12))
for face in faces:
 for i,j in combinations(face,2):G.add_edge(i,j)
allg=list(nx.algorithms.isomorphism.GraphMatcher(G,G).isomorphisms_iter())
proper=[]
for gm in allg:
 tg=pts[[gm[i] for i in range(12)]]
 rot=np.linalg.lstsq(pts,tg,rcond=None)[0]
 if np.linalg.det(rot)>0:proper.append(tuple(gm[i] for i in range(12)))
assert len(proper)==60
compose=lambda a,b:tuple(a[b[i]] for i in range(12))
e=tuple(range(12)); invol=[a for a in proper if a!=e and compose(a,a)==e]
Vs={frozenset((e,a,b,compose(a,b))) for a in invol for b in invol if a!=b and compose(a,b)==compose(b,a)}
assert len(Vs)==5,len(Vs)
faceid={frozenset(f):i for i,f in enumerate(faces)}
Gface={}
for g in proper:
  T=np.zeros((20,20))
  for i,f in enumerate(faces):T[faceid[frozenset(g[x] for x in f)],i]=1
  Gface[g]=T

def third_cumulant_density(g):
  """For mean-zero scalar cylinder g of six Bernoulli bits, 3rd cumulant per time.
  Joint moments factor across disjoint digit supports. Max total span 10.
  Sum over ordered pairs of time lags u,v in [-12,12].
  """
  assert abs(g.mean())<1e-11
  Q=np.zeros((64,64))
  for h in range(64):Q[h,2*h%64]+=.5;Q[h,2*h%64+1]+=.5
  Ps=[np.linalg.matrix_power(Q,k) for k in range(13)]
  D=np.diag(g);one=np.ones(64)
  triple={}
  for a in range(13):
   for b in range(13):
    triple[(a,b)]=float(g@Ps[a]@D@Ps[b]@g/64)
  kapp=[]
  for L in (6,8,10,12):
   k3=0.0
   for u in range(-L,L+1):
    for v in range(-L,L+1):
     t=sorted([0,u,v]);a=t[1]-t[0];b=t[2]-t[1]
     if a<=12 and b<=12:k3+=triple[a,b]
   kapp.append((L,k3))
  return kapp

q=np.zeros((64,64))
for h in range(64):q[h,2*h%64]+=.5;q[h,2*h%64+1]+=.5
allres=[]
for V in Vs:
 def inverse(g):return tuple(g.index(i) for i in range(12))
 normalizer=[g for g in proper if frozenset(compose(compose(g,a),inverse(g)) for a in V)==V]
 assert len(normalizer)==12
 A=sum(Gface[g] for g in normalizer)/12
 for P,R,lab in [(P3,R3,'3'),(P5,R5,'5')]:
  B=P@A@P
  ee,U=np.linalg.eigh(B)
  assert abs(ee[-1]-1)<1e-10 and np.linalg.norm(ee[:-1])<1e-10
  vec=U[:,-1];vec*=np.sign(vec[np.argmax(np.abs(vec))])
  vals=R@vec
  assert abs(vals.mean())<3e-13
  v=np.array([float(np.mean(vals**j)) for j in range(1,5)])
  if lab=='3': assert abs(v[2])<1e-11
  k=third_cumulant_density(vals)
  allres.append((lab,v,k))
for lab in ('3','5'):
 sub=[z for z in allres if z[0]==lab]
 print('A4 hidden'+lab+' singlet one-point mean,variance,skew-third,4th:',sub[0][1])
 print('A4 hidden'+lab+' 3rd additive URT cumulant rates by horizon:',sub[0][2])
 # Five A4 vacua are related by icosahedral rotations. Their one-time
 # moments must be equal even though URT time order is not A5-invariant.
 print('five tetrahedral singlet variance/third-moment range',min(x[1][1] for x in sub),max(x[1][1] for x in sub),min(abs(x[1][2]) for x in sub),max(abs(x[1][2]) for x in sub))
 print('five tetrahedral time-cumulant range',min(x[2][-1][1] for x in sub),max(x[2][-1][1] for x in sub))
print('PASS A4 subgroup enumeration, rank-one singlets, source-moment and URT-cumulant sums')