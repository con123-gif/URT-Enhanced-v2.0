#!/usr/bin/env python3
"""Exactly sum all shortest-path Abelian Wilson dressings of chiral face loops.

This is an explicitly defined all-path, gauge-covariant finite model; it is NOT
asserted to be the original selected H64 transfer, nor a physical mass theory.
"""
import json
from itertools import product
from functools import lru_cache
import numpy as np
import networkx as nx
import cathedral_strict_64_closure as c

v,vc,edges,faces,ds,inc=c.icosahedron()
cent=np.array([v[list(f)].sum(axis=0) for f in faces])
g=nx.Graph();g.add_nodes_from(range(20))
for i in range(20):
 for j in range(i+1,20):
  if len(set(faces[i])&set(faces[j]))==2:g.add_edge(i,j)
ed=list(sorted(tuple(sorted(e)) for e in g.edges))
edix={p:i for i,p in enumerate(ed)}
B=np.zeros((20,30))
for t,(i,j) in enumerate(ed):B[i,t]=-1;B[j,t]=1
D=np.zeros((30,12))
for p in range(12):
 incident=[f for f in range(20) if p in faces[f]]
 n=v[p]/np.linalg.norm(v[p]);e1=cent[incident[0]]-(cent[incident[0]]@n)*n
 e1/=np.linalg.norm(e1);e2=np.cross(n,e1)
 inc_order=sorted(incident,key=lambda f:np.arctan2(cent[f]@e2,cent[f]@e1))
 for f,h in zip(inc_order,inc_order[1:]+inc_order[:1]):
  edge_id=edix[tuple(sorted((f,h)))]
  D[edge_id,p]+=1 if f<h else -1
assert np.linalg.norm(B@D)<1e-12
assert np.linalg.norm(D@np.ones(12))<1e-12
assert np.linalg.matrix_rank(D)==11
K=D@D.T;Kpinv=np.linalg.pinv(K,rcond=1e-12)
assert np.linalg.norm(D.T@Kpinv@D-(np.eye(12)-np.ones((12,12))/12))<1e-12

@lru_cache(None)
def paths(a,b):
 ret=[]
 for p in nx.all_shortest_paths(g,a,b):
  J=np.zeros(30)
  for x,y in zip(p,p[1:]):J[edix[tuple(sorted((x,y)))]]+=(1 if x<y else -1)
  ret.append(J)
 return ret

# Construct original signed W and projectors exactly as in original October 15 code.
Fgraph=ds[2].T@ds[2]
l,U=np.linalg.eigh(Fgraph)
H=U[:, (np.abs(l-3)<1e-8) | (np.abs(l-5)<1e-8)]
P=H@H.T
W=np.zeros((20,20))
for a in range(20):
 for b in range(20):
  cross=sum(v[k] @ np.cross(cent[a],cent[b]) for k in set(faces[a])&set(faces[b]))
  W[a,b]=np.sign(cross) if abs(cross)>1e-8 else 0
assert np.linalg.norm(W@W+15*P)<1e-10
J=W/np.sqrt(15.)
Pi=(P-1j*J)/2
assert np.linalg.norm(Pi@Pi-Pi)<1e-10
sets=[[f for f in range(20) if vtx in faces[f]] for vtx in range(12)]

@lru_cache(None)
def loops_info(a,b,d):
 vals=[]
 for p1,p2,p3 in product(paths(a,b),paths(b,d),paths(d,a)):
  loop=p1+p2+p3
  if np.linalg.norm(B@loop)>1e-9:raise RuntimeError('not closed')
  vals.append(float(loop@Kpinv@loop))
 return np.array(vals)

coupling=4*np.pi/(137+(17572/1215)*c.DELTA-(9/65)*c.DELTA**2)

def amplitude(ico_tri,g2):
 i,j,k=ico_tri
 out=0j
 for a,b,d in product(sets[i],sets[j],sets[k]):
  amp=Pi[a,b]*Pi[b,d]*Pi[d,a]/27
  if abs(amp)<1e-14:continue
  variance=loops_info(a,b,d)
  out+=amp*np.mean(np.exp(-.5*g2*variance))
 return out

def calc(g2):
 vals=[amplitude(t,g2) for t in faces]
 return np.array(vals)
base=calc(0)
assert max(abs(x-(743/182250-1j*13*np.sqrt(15)/60750)) for x in base)<1e-12
vals=calc(coupling)
print('dual graph',len(ed),'edges, rank',np.linalg.matrix_rank(D),'K pseudoinverse 30x30')
print('original face loop',base[0], 'phase',np.angle(base[0]))
print('dressed face loop',vals[0], 'phase',np.angle(vals[0]))
print('phase shift',np.angle(vals[0]/base[0]))
print('A5 all face residual',max(abs(x-vals[0]) for x in vals))
print('triangle path variance ranges',sorted(set(np.round(np.hstack([loops_info(a,b,d) for a,b,d in product(*[sets[vtx] for vtx in faces[0]])]),8)))[:35])
for g2 in [0.01,0.05,0.1,0.2,0.5,1]:
 out=calc(g2)
 print('coupling',g2,'phase',np.angle(out[0]),'shift',np.angle(out[0]/base[0]))
results={'native_phase':float(np.angle(base[0])),'dressed_phase':float(np.angle(vals[0])),'phase_shift':float(np.angle(vals[0]/base[0])),'max_face_invariance_residual':float(max(abs(x-vals[0]) for x in vals)),'conditional_g_squared':coupling,'max_number_shortest_paths':max(len(paths(i,j)) for i in range(20) for j in range(20))}
from pathlib import Path
Path(__file__).with_name('GAUGED_LOOPS.json').write_text(json.dumps(results,indent=2)+'\n')

# Full canonical chiral Gibbs state, rather than a pure chiral projector.
sel3=np.abs(l-3)<1e-8
sel5=np.abs(l-5)<1e-8
P3=U[:,sel3]@U[:,sel3].T
P5=U[:,sel5]@U[:,sel5].T
a=1/(4*(1+c.DELTA*c.DELTA));b=c.DELTA*c.DELTA*a
rho=(a*P3+b*P5)-1j*np.sqrt(a*b)*J
assert abs(np.trace(rho)-1)<1e-12
assert np.linalg.eigvalsh(rho).min()>-1e-12

def gibbs_tri(tri,g2):
 i,j,k=tri
 out=0j
 for f,g,h in product(sets[k],sets[i],sets[j]):
  amp=rho[f,g]*P[g,h]*P[h,f]/27
  if abs(amp)<1e-14:continue
  variance=loops_info(f,g,h)
  out+=amp*np.mean(np.exp(-.5*g2*variance))
 return out
expected=(699+655*c.DELTA*c.DELTA-1j*54*np.sqrt(15)*c.DELTA)/(729000*(1+c.DELTA*c.DELTA))
orig=gibbs_tri(faces[0],0)
dressed=gibbs_tri(faces[0],coupling)
assert abs(orig-expected)<1e-12
assert abs(dressed-gibbs_tri(faces[1],coupling))<1e-13
print('gibbs original',orig,'phase',np.angle(orig))
print('gibbs photon dressed',dressed,'phase',np.angle(dressed),'phase shift',np.angle(dressed/orig))
results.update({'gibbs_native_phase':float(np.angle(orig)), 'gibbs_dressed_phase':float(np.angle(dressed)), 'gibbs_phase_shift':float(np.angle(dressed/orig))})
from pathlib import Path
Path(__file__).with_name('GAUGED_LOOPS.json').write_text(json.dumps(results,indent=2)+'\n')
