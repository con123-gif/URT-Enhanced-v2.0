#!/usr/bin/env python3
"""Native Q101-defined hidden source, extended centre-channel calculation.
Rebuilds named original icosahedral source geometry from Q101 formulas.
All-five minimal-norm projector Pl=P_3v+P_5v is exactly Q101's Iico Iico.T.
No fitted parameters; candidate centre-odd source clearly distinguished from native Q125.
"""
import numpy as np
from itertools import product, combinations
from collections import Counter
rt=np.sqrt(5); phi=(1+rt)/2
v=np.array([(0,a,b*phi) for a,b in product((-1,1),repeat=2)] + [(a,b*phi,0) for a,b in product((-1,1),repeat=2)] + [(a*phi,0,b) for a,b in product((-1,1),repeat=2)],float)
d2=lambda i,j: float(np.sum((v[i]-v[j])**2))
edges=[(i,j) for i,j in combinations(range(12),2) if abs(d2(i,j)-4)<1e-9]; eset=set(edges)
faces=[f for f in combinations(range(12),3) if all(tuple(sorted((i,j))) in eset for i,j in combinations(f,2))]
assert len(edges)==30 and len(faces)==20
C=np.array([[int(j in f) for j in range(12)] for f in faces],float)
L=np.array([[3 if i==j else (-1 if len(set(faces[i]) & set(faces[j]))==2 else 0) for j in range(20)] for i in range(20)],float)
Ph=np.eye(20)-C@np.linalg.inv(C.T@C)@C.T
P3=Ph@(5*np.eye(20)-L)/2;P5=Ph@(L-3*np.eye(20))/2
P3=(P3+P3.T)/2;P5=(P5+P5.T)/2
Fcent=[np.sum(v[list(f)],axis=0) for f in faces]
W=np.zeros((20,20))
for i in range(20):
 for j in range(20):
  chir=sum(v[k]@np.cross(Fcent[i],Fcent[j]) for k in set(faces[i]) & set(faces[j]))
  W[i,j]=np.sign(chir) if abs(chir)>1e-10 else 0
assert np.linalg.norm(W+W.T)<1e-9
assert np.linalg.norm(W@W+15*Ph)<1e-8
assert np.linalg.norm(L@W+W@L-8*W)<1e-8
opp={i:next(j for j in range(12) if np.linalg.norm(v[i]+v[j])<1e-10) for i in range(12)}
Kv=np.zeros((12,12))
for i,j in opp.items():Kv[i,j]=1
P3v=v@np.linalg.inv(v.T@v)@v.T
P5v=(np.eye(12)+Kv)/2-np.ones((12,12))/12
Pl=P3v+P5v
assert np.linalg.norm(Pl@Pl-Pl)<1e-11
levels=Counter();states=[]
for c in (-1,1):
 for mask in range(4096):
  s=np.array([1-2*((mask>>i)&1) for i in range(12)],float)
  E=sum(s[i]*s[j] for i,j in edges)-phi*c*sum(s)
  if E<=-10+1e-8:
   levels[round(E,8)]+=1
   states.append((mask,c,s,E))
assert len(states)==444
saddles=[(mask,s) for mask,c,s,E in states if c==1 and abs(E+10)<1e-8]
assert len(saddles)==72
jn=[];J_outer_fifths=[]; bs=[]; b4s=[]
for mask,s in saddles:
 f=(C@Pl@s)**2
 h3=P3@f;h5=P5@f
 # Candidate EVEN and ODD channels f_c=h3+c*h5
 J_c=float((h3+h5)@W@(h3-h5)/2)
 jn.append(J_c)
 bs.append(h3+h5)
 b4s.append(Ph@((h3+h5)**2))
A=np.array(bs).T;A4=np.array(b4s).T
print('source formula: f=(C Pl s)^2 with original Q101 P3/P5/W')
print('sublevel shells:',dict(levels))
print('Jcentral candidate centre-weighted: counts rounded 12 places:', Counter(np.round(jn,12)))
print('Jcentral candidate min max mean abs rms nonzero:',min(jn),max(jn),np.mean(np.abs(jn)),np.sqrt(np.mean(np.array(jn)**2)),sum(abs(z)>1e-9 for z in jn))
print('hidden source rank 72 saddle sources:',np.linalg.matrix_rank(A,tol=1e-9),'quadratic charge4 rank:',np.linalg.matrix_rank(A4,tol=1e-9))
print('P3/P5 quadratic charge4 projected norms across saddle:',np.min(np.linalg.norm(A4,axis=0)),np.max(np.linalg.norm(A4,axis=0)))
print('theorem candidate iff Jcen!=0: 0.5(h3+h5) W (h3-h5)=-h3 W h5',np.max(np.abs(np.array(jn)+np.einsum('mi,ij,mj->m',np.array([P3@(C@Pl@s)**2 for _,s in saddles]),W,np.array([P5@(C@Pl@s)**2 for _,s in saddles])))))
for value in (-1,0,1):
 idx=[t for t in range(72) if (0 if abs(jn[t])<1e-9 else np.sign(jn[t]))==value]
 d=[]; mk=[];odd=[]
 for t in idx:
  mask,s=saddles[t]
  d.append(round(float(np.linalg.norm(s@v)**2),7))
  mk.append(round(float(np.sum((s@v)**4)),7))
  odd.append(sum(int(np.allclose(s@v, z*v[i],atol=1e-8)) for i in range(12) for z in (1,-1)))
 print('current-sign',value,'count',len(idx),'dipole_norm_squared',Counter(d),'fourth',Counter(mk),'dipole_aligned_vertex',Counter(odd))
print('current magnitude vs 32 sqrt5/5',max(abs(abs(x)-32*np.sqrt(5)/5) for x in jn if abs(x)>1e-9))
# Exact-operator numeric spectral consequence on ALL 444 genuine sublevel states
state_index={(mask,c):i for i,(mask,c,s,E) in enumerate(states)}
fmap=np.array([ (C@Pl@s)**2 for mask,c,s,E in states ])
h3all=fmap@P3.T;h5all=fmap@P5.T
f_graded=h3all+np.array([c for mask,c,s,E in states])[:,None]*h5all
J0=np.zeros((444,444)); Jg=np.zeros((444,444)); flip_counts=Counter(); grd_counts=Counter(); old_counts=Counter()
for i,(mask,c,s,E) in enumerate(states):
 for bit in range(13):
  target=(mask^1<<bit,c) if bit<12 else (mask,-c)
  j=state_index.get(target)
  if j is None or j<=i: continue
  a=float(fmap[i]@W@fmap[j]/2)
  b=float(f_graded[i]@W@f_graded[j]/2)
  J0[i,j]=a;J0[j,i]=-a
  Jg[i,j]=b;Jg[j,i]=-b
  flip_counts['centre' if bit==12 else 'outer']+=1
  old_counts['centre nonzero' if bit==12 and abs(a)>1e-9 else 'outer nonzero' if bit<12 and abs(a)>1e-9 else 'zero']+=1
  grd_counts['centre nonzero' if bit==12 and abs(b)>1e-9 else 'outer nonzero' if bit<12 and abs(b)>1e-9 else 'zero']+=1
print('native vs centre-graded current census:',old_counts,grd_counts)
assert old_counts == {'outer nonzero':720,'zero':312}
assert grd_counts == {'outer nonzero':720,'centre nonzero':60,'zero':252}
print('old/new current second moments:',np.sum(J0*J0)/2,np.sum(Jg*Jg)/2)
print('target new moment:',29184+4608*np.sqrt(5))
assert abs(np.sum(Jg*Jg)/2 -(29184+4608*np.sqrt(5)))<1e-7
for name,J in [('native Q125',J0),('candidate graded-centre',Jg)]:
 ev=np.linalg.eigvalsh(1j*J);nonzero=np.sum(abs(ev)>1e-8)
 print(name,'rank',nonzero,'nullity',444-nonzero,'max_ev',max(ev),'min_abs_nonzero',min(abs(ev[abs(ev)>1e-8])))
 # charge registry tensor 96 -> at least nullity *96
print('combined XOR parity class balanced:',Counter((int((mask.bit_count()+int(c==-1))%2)) for mask,c,s,E in states))
# A5 rotation orbit decomposition of 72 outer saddle configurations.
base=[0,1,4]
assert abs(np.linalg.det(v[base].T))>1e-8
vi=np.linalg.inv(v[base].T);rots={}
for triple in product(range(12),repeat=3):
 if len(set(triple))<3:continue
 R=v[list(triple)].T@vi
 if np.linalg.norm(R.T@R-np.eye(3))>1e-9 or abs(np.linalg.det(R)-1)>1e-9:continue
 perm=[]
 for x in v:
  y=R@x; ds=np.linalg.norm(v-y,axis=1);i=int(np.argmin(ds))
  if ds[i]>1e-8:break
  perm.append(i)
 else:rots[tuple(perm)]=R
assert len(rots)==60
masks72={mask for mask,s in saddles}
perms=list(rots)
seen=set();orbits=[]
for mask in sorted(masks72):
 if mask in seen:continue
 orb=set()
 for perm in perms:
  newmask=sum((((mask>>i)&1)<<perm[i]) for i in range(12))
  assert newmask in masks72
  orb.add(newmask)
 seen|=orb;orbits.append(orb)
print('72 saddle A5 orbits:',sorted(len(x) for x in orbits))
for orb in sorted(orbits,key=len):
 vals={round(jn[next(i for i,(mask,s) in enumerate(saddles) if mask==m)],7) for m in orb}
 print('A5 orbit size',len(orb),'J values',vals)