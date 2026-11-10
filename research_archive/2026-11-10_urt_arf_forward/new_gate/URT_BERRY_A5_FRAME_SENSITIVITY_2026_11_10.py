#!/usr/bin/env python3
"""Does the phase-binned Wilson response survive true icosahedral A5
signed-axis relabelings? A different answer signals a history/clock dictionary
not yet made A5-covariant. No physical claim made from selected frame alone.
"""
from pathlib import Path
import runpy,contextlib,io
import numpy as np
here=Path(__file__).resolve().parent
Hpath=next(p for p in (here.parent/'forward',here.parent/'urt_arf_forward_2026_11_09') if (p/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py').exists())
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(Hpath/'URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py'))
 a=runpy.run_path(str(here/'URT_A4_SCALAR_CUMULANTS_2026_11_10.py'))
 s=runpy.run_path(str(Hpath/'URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py'))
P=d['P3']+d['P5'];v,E=np.linalg.eigh(P);H8=d['H']@E[:,v>.5]
pairs=s['pairs'];pairmap={frozenset(p):i for i,p in enumerate(pairs)}

def rowmap(g):
 seq=[]
 for i,(one,two) in enumerate(pairs):
  j=pairmap[frozenset((g[one],g[two]))]
  sign=+1 if g[one]==pairs[j][0] else -1
  seq.append((j,sign))
 p=np.empty(64,dtype=int)
 for old in range(64):
  new=0
  for i,(j,sign) in enumerate(seq):
   bit=1 if old&(1<<i) else 0
   if sign<0:bit=1-bit
   new|=bit<<j
  p[new]=old
 assert len(set(p))==64
 return p,seq

def polar(x):
 u,_,v=np.linalg.svd(x,full_matrices=False)
 return u@v

def B(a):
 C=np.zeros((24,64))
 for j in range(24):
  lo=j/24+a;hi=(j+1)/24+a
  for h in range(64):
   for k in range(3):
    left=max(lo,h/64+k);right=min(hi,(h+1)/64+k)
    if right>left:C[j,h]+=right-left
 return np.sqrt(1536)*C

N=384
Bs=[B(k/N) for k in range(N+1)]
def wilson(H):
 prev=polar(Bs[0]@H);hol=np.eye(8)
 for j in range(1,len(Bs)):
  U=polar(Bs[j]@H)
  hol=hol@polar(prev.T@U)
  prev=U
 return np.sort(np.angle(np.linalg.eigvals(hol)))[4:]
orig=wilson(H8)
rots=list(a['proper'])
seen=set()
chosen=[]
for g in rots:
 p,seq=rowmap(g)
 if all(p==np.arange(64)):continue
 signature=tuple(p)
 if signature in seen:continue
 seen.add(signature)
 chosen.append((p,seq))
 if len(chosen)==4:break
print('baseline positive phases',orig.tolist())
for i,(p,seq) in enumerate(chosen):
 angles=wilson(H8[p])
 print('A5 rotation',i+1,'axis map',seq,'phases',angles.tolist(),'max change',np.max(abs(angles-orig)))
# Stronger exact representation check: every proper A5 rotation acts on the
# original all-five nonlinear source by an orthogonal 4_3+4_5 block matrix.
P3in=E[:,v>.5].T@d['P3']@E[:,v>.5]
errors=[]; orth=[]; cross=[]
for g in a['proper']:
 perm,_=rowmap(g)
 G=H8.T@H8[perm]
 errors.append(np.linalg.norm(H8@G-H8[perm]))
 orth.append(np.linalg.norm(G.T@G-np.eye(8)))
 cross.append(np.linalg.norm(G@P3in-P3in@G))
assert len(a['proper'])==60
assert max(errors)<1e-11 and max(orth)<1e-11 and max(cross)<1e-11
print('all 60 A5 rotations: source equivariance, hidden orthogonality, quartet preservation', max(errors),max(orth),max(cross))
print('PASS original A5 source equivariance and hidden-frame invariant Wilson conjugacy class')