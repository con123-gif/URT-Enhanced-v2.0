#!/usr/bin/env python3
"""Exact native Cathedral 20-face / 30-link hidden8 photon-source closure.
All source Gram identities are rational matrix equalities; NO measured alpha.
Unit Peierls hopping is a declared finite-model assumption, not physical H64.
"""
import itertools,math,json
import numpy as np,sympy as s
phi=(1+math.sqrt(5))/2
v=[]
for a,b in itertools.product((-1,1),repeat=2):
 v.extend(((0,a,b*phi),(a,b*phi,0),(b*phi,0,a)))
v=np.asarray(v,float)
ed={(i,j) for i,j in itertools.combinations(range(12),2)
    if abs(np.linalg.norm(v[i]-v[j])-2)<1e-9}
fs=[f for f in itertools.combinations(range(12),3)
    if all(tuple(sorted(ab)) in ed for ab in itertools.combinations(f,2))]
assert (len(v),len(ed),len(fs))==(12,30,20)
adj=np.asarray([[i!=j and len(set(fs[i])&set(fs[j]))==2 for j in range(20)]
                for i in range(20)],int)
center=np.asarray([v[list(f)].sum(axis=0) for f in fs])
W=s.zeros(20)
for i in range(20):
 for j in range(20):
  if i==j:continue
  chir=sum(v[k]@np.cross(center[i],center[j])
           for k in set(fs[i])&set(fs[j]))
  W[i,j]=int(np.sign(chir)) if abs(chir)>1e-8 else 0
L=3*s.eye(20)-s.Matrix(adj.tolist())
P=-(W**2)/15
P3=P*(5*s.eye(20)-L)/2
P5=P*(L-3*s.eye(20))/2
assert P**2==P and s.trace(P3)==s.trace(P5)==4
edges=[(a,b) for a in range(20) for b in range(a+1,20) if adj[a,b]]
index={e:k for k,e in enumerate(edges)}
assert len(edges)==30
F=s.zeros(30,12)
for vi in range(12):
 star=[j for j,f in enumerate(fs) if vi in f]
 cyc=[min(star)]
 cyc.append(min(j for j in star if adj[cyc[0],j]))
 while len(cyc)<5:
  nxt=[j for j in star if adj[cyc[-1],j] and j!=cyc[-2] and j not in cyc]
  assert len(nxt)==1
  cyc.append(nxt[0])
 for a,b in zip(cyc,cyc[1:]+cyc[:1]):
  F[index[tuple(sorted((a,b)))],vi]+=1 if a<b else -1
K=F*F.T
P0=-(K-6*s.eye(30))*(K**2-10*K+20*s.eye(30))/120
Pe5=-K*(K**2-10*K+20*s.eye(30))/24
Pe6=s.eye(30)-P0-Pe5
PT=Pe5+Pe6
assert (s.trace(P0),s.trace(Pe5),s.trace(Pe6))==(19,5,6)
R=[s.zeros(20) for _ in range(30)]
pairs=[]
for a in range(20):
 for b in range(a+1,20):
  middle=[k for k in range(20) if adj[a,k] and adj[k,b]]
  if len(middle)!=1:continue
  pairs.append((a,b))
  m=middle[0]
  for x,y in ((a,m),(m,b)):
   ei=index[tuple(sorted((x,y)))]
   coeff=1 if x<y else -1
   R[ei][a,b]+=coeff
   R[ei][b,a]-=coeff
assert len(pairs)==60
U=[P3*Re*P5 for Re in R]
G35=s.Matrix(30,30,lambda e,f:2*sum(
 (U[e][a,b]-U[e][b,a])*int(R[f][a,b]) for a,b in pairs))
G55=s.Matrix(30,30,lambda e,f:-s.trace(P5*R[e]*P5*R[f]))
G33=s.Matrix(30,30,lambda e,f:-s.trace(P3*R[e]*P3*R[f]))
assert G33==s.zeros(30)
assert PT*G35*PT==s.Rational(16,15)*Pe5
assert PT*G55*PT==G55==s.Rational(32,9)*Pe6
G=PT*(G35+G55)*PT
assert G==s.Rational(16,15)*Pe5+s.Rational(32,9)*Pe6
assert G.rank()==11
z=s.symbols('z')
assert s.expand(G.charpoly(z).as_expr()-z**19*
 (z-s.Rational(16,15))**5*(z-s.Rational(32,9))**6)==0
assert s.expand(G35.charpoly(z).as_expr()-z**15*
 (z-s.Rational(16,15))**9*
 (z*z-s.Rational(16,5)*z+s.Rational(256,225))**3)==0
delta=3/20-80*math.pi/(1053*phi)
eta=-math.log(delta)
a=1/(4*(1+delta**2));b=delta**2*a
ell=(a-b)/(2*eta)
coef5=float(s.Rational(16,15))*ell
coef6=float(s.Rational(32,9))*b
ratio=coef5/coef6
assert abs(ratio-3*(1-delta**2)/(20*eta*delta**2))<1e-9
print(json.dumps({'gauge_nullity':19,'transverse_modes':11,
 'interquartet_fiveplet':'16/15','intra5quartet_six_triplets':'32/9',
 'intra3quartet_zero':True,'golden_triplet_squared_singulars':'(8/15)(3+-sqrt5)',
 'BKM_weighted_fiveplet':coef5,'BKM_weighted_six_triplets':coef6,
 'BKM_ratio':ratio,'measured_alpha_input':False,'physical_alpha_derived':False},indent=2))
