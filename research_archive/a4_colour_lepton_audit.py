import itertools, json, math
from pathlib import Path
import numpy as np
import active_core as ac
G=ac.aperms; reps=ac.rhoH3
identity=tuple(range(len(G[0])))
def compose(p,q): return tuple(p[q[i]] for i in range(len(q)))
def inv(p):
 o=[0]*len(p)
 for i,j in enumerate(p):o[j]=i
 return tuple(o)
index={p:i for i,p in enumerate(G)}
def order(p):
 x=identity
 for n in range(1,61):
  x=compose(p,x)
  if x==identity:return n
orders=[order(p) for p in G]
def subgroup(gens):
 S={identity}; changed=True
 while changed:
  changed=False
  for a in list(S):
   for b in gens+list(S):
    for c in (compose(a,b),compose(b,a)):
     if c not in S:S.add(c);changed=True
 return frozenset(S)
subs=set()
for i,j in itertools.combinations(range(60),2):
 H=subgroup([G[i],G[j]])
 if len(H)==12:
  cnt={k:sum(order(x)==k for x in H) for k in [1,2,3,5]}
  if cnt=={1:1,2:3,3:8,5:0}:subs.add(H)
print('A4 subgroups',len(subs))
vecs=[]; sub_indices=[]
for H in subs:
 ids=[index[x] for x in H]; sub_indices.append(ids)
 A=np.vstack([reps[i]-np.eye(4) for i in ids])
 _,_,vh=np.linalg.svd(A);v=vh[-1];v/=np.linalg.norm(v)
 # deterministic sign: first significant positive
 if v[np.argmax(np.abs(v))]<0:v=-v
 vecs.append(v)
# choose signs globally so all pair inner products -1/4. brute signs fixing first +
V=np.array(vecs)
best=None
for signs_tail in itertools.product([-1,1], repeat=len(V)-1):
 signs=np.array([1,*signs_tail]);W=V*signs[:,None];gram=W@W.T
 err=np.linalg.norm((gram-np.eye(len(V)))-(-.25)*(np.ones_like(gram)-np.eye(len(V))))
 if best is None or err<best[0]:best=(err,W,gram,signs)
err,V,gram,signs=best
# projectors and properties
sumv=np.linalg.norm(V.sum(axis=0));frame=V.T@V
# subgroup restriction characters: invariant line and orth complement
restr=[]
for H,v in zip(subs,V):
 P=np.eye(4)-np.outer(v,v)
 tr3=[]
 for x in H:
  R=reps[index[x]]
  tr3.append(np.trace(P@R@P))
 restr.append({'fixed_error':max(np.linalg.norm(reps[index[x]]@v-v) for x in H),
               'orth_trace_orders':{str(k):sorted(set(round(float(tr3[j]),12) for j,x in enumerate(H) if order(x)==k)) for k in [1,2,3]}})
# stabilizers among full A5
stabs=[]
for v in V:
 ids=[i for i,R in enumerate(reps) if np.linalg.norm(R@v-v)<1e-8]
 stabs.append(ids)
# A5 orbit check
orbit=[]
v0=V[0]
for R in reps:
 w=R@v0
 if not any(min(np.linalg.norm(w-u),np.linalg.norm(w+u))<1e-8 for u in orbit):orbit.append(w)
# Exact colour/lepton grading for chosen t
chosen=V[0]; P_l=np.outer(chosen,chosen);P_c=np.eye(4)-P_l; grading=P_c-3*P_l
out={'num_A4_subgroups':len(subs),'simplex_vectors':V.tolist(),'gram':gram.tolist(),'simplex_error':err,
 'sum_vector_error':sumv,'tight_frame':frame.tolist(),'tight_frame_error':float(np.linalg.norm(frame-1.25*np.eye(4))),
 'restriction_audits':restr,'stabilizer_sizes':[len(x) for x in stabs],'orbit_lines':len(orbit),
 'chosen_t':chosen.tolist(),'P_lepton':P_l.tolist(),'P_colour':P_c.tolist(),'grading_X':grading.tolist(),
 'grading_eigenvalues':np.linalg.eigvalsh(grading).tolist(),
 'identities':{'restriction':'4|A4 = 1 + 3','simplex':'t_i.t_j=-1/4','projectors':'P_l=t t^T, P_c=I-P_l','grading':'X=P_c-3P_l, Tr X=0'}}
Path('/mnt/data/a4_colour_lepton_results.json').write_text(json.dumps(out,indent=2))
report=f'''A5 -> A4 COLOUR/LEPTON BREAKING AUDIT
======================================
A4 subgroups: {len(subs)}
Stabilizer sizes: {[len(x) for x in stabs]}
Regular 4-simplex Gram error: {err:.3e}
Sum of five vacuum vectors: {sumv:.3e}
Tight-frame error sum_i t_i t_i^T=(5/4)I: {out['tight_frame_error']:.3e}
Orbit lines: {len(orbit)}

Exact restriction:
  V4 restricted to every tetrahedral stabilizer A4 is 1 + 3.
  The fixed line is the lepton direction t.
  Its orthogonal complement is the colour triplet.

Projectors:
  P_l = t t^T
  P_c = I - t t^T
  X_CL = P_c - 3 P_l = I - 4 t t^T

Spectrum X_CL: {out['grading_eigenvalues']}
The five choices t_i obey t_i.t_j=-1/4 and are the vertices of a regular 4-simplex.
'''
Path('/mnt/data/a4_colour_lepton_report.txt').write_text(report)
print(report)