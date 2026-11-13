#!/usr/bin/env python3
"""Q90: native Q88 joint constraints and unnormalised Q81 source clock energies."""
import runpy
from pathlib import Path
v=runpy.run_path(str(Path(__file__).resolve().parents[1]/'2026-11-13_q89_exact_source'/'Q89_EXACT_SOURCE.py'))
s=v['s']; V=v['V']; C=v['C']; faces=v['faces']; f=v['f']
L=3*s.eye(20)
for i in range(20):
 for j in range(20):
  if i!=j and len(set(faces[i])&set(faces[j]))==2:L[i,j]=-1
Ph=s.eye(20)-C*(C.T*C).inv()*C.T
P3=Ph*(5*s.eye(20)-L)/2
assert P3*P3==P3 and s.trace(P3)==4
pairs=[];remaining=set(range(12))
while remaining:
 i=min(remaining)
 j=next(k for k in sorted(remaining-{i}) if all(s.simplify(V[i][t]+V[k][t])==0 for t in range(3)))
 pairs.append((i,j));remaining-={i,j}
M=s.Matrix([[int(set(face)<={pairs[k][(h>>k)&1] for k in range(6)}) for face in faces] for h in range(64)])
sig=[2*h+1 if h<32 else 2*(h-32) for h in range(64)]
Ds=[(0,2,4,6,10,9),(0,2,7,5,9,10),(0,2,9,10,4,6),(0,2,10,9,7,5),(0,3,4,7,10,8),(0,3,7,4,9,11),(0,3,9,11,4,7),(0,3,10,8,7,4)]
Qall=[]
for D in Ds:
 idx=[sum(((((h>>j)&1)^(D[j]&1))<<(D[j]//2)) for j in range(6)) for h in range(64)]
 assert sorted(idx)==list(range(64))
 B=(M*P3).extract(idx,range(20))
 Q=s.Matrix.vstack(*[(B.row(sig[sig[h]])+B.row(h)) for h in range(64)])
 assert B.rank()==4 and Q.rank()==2
 Qall.append(Q)
Qjoint=s.Matrix.vstack(*Qall)
assert Qjoint.rank()==3
_,piv=Qjoint.T.rref()
assert len(piv)==3
for i in piv:assert s.simplify(s.radsimp(Qjoint.row(i).dot(f)))==0
K=P3*M.T*M*P3
alpha=s.trace(K)/s.trace(P3)
assert alpha==2 and K==alpha*P3
h3=P3*f
assert any(abs(complex(s.N(t,18)))>1e-8 for t in h3)
# H64 history embedding factor 1/sqrt(2); total energy=||M P3 f||²/2.
# (P_sigma²+I)z=0 gives only k=6,18; reality gives equal energies.
# E6=E18=alpha/4*sum_i(P3 f)_i²=1/2*sum_i(P3 f)_i².
E6=s.Rational(1,2)*sum(t*t for t in h3)
print('joint rank=3; alpha=2; exact E6=E18=1/2*sum_i(P3*f)_i^2')
print('E6=E18 numerical diagnostic',s.N(E6,16))
print('Q90_EXACT_NATIVE_FOURIER_PASS')
