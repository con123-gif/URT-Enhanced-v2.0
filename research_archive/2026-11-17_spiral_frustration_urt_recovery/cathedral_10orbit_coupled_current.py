#!/usr/bin/env python3
"""Native Cathedral 444-state Q101/Q125 collective-current mechanism.
  Original source: all-five 50->8->12 minimum-norm portal, 20-face W, 444 states;
  candidate centre-graded source f_{s,c}=h3+c h5 and equal-amplitude J0+Jg;
  conditional positive rates q_xy=exp(alpha Jxy/j1)/(1+exp(beta (Ey-Ex)));
  exact 12-orbit A5 quotient and full state current/EP proof.
This is not a primitive derivation of the phase-to-affinity rule.
"""
import contextlib,io,runpy,itertools,collections,numpy as np
from pathlib import Path
from scipy.sparse import coo_matrix
from scipy.sparse.linalg import spsolve
from scipy.special import expit
import mpmath as mp
with contextlib.redirect_stdout(io.StringIO()) as stdout:
 src=runpy.run_path(str(Path(__file__).with_name('cathedral_full_machine_bridge_2026_11_17.py')))
S=src['states']; J0=src['J0']; Jg=src['Jg']; rot=list(src['rots'].keys()); phi=src['phi'];N=len(S)
idx=src['state_index']; C=src['C'];W=src['W'];P3=src['P3'];P5=src['P5'];Pl=src['Pl']
E=np.array([s[3] for s in S]); cs=np.array([s[1] for s in S]);

def perm_word(mask,perm):
 m=0
 for i in range(12):m|=((mask>>i)&1)<<perm[i]
 return m

a5map=np.empty((len(rot),N),dtype=int)
for k,perm in enumerate(rot):
 for i,(mask,c,s,e) in enumerate(S):a5map[k,i]=idx[(perm_word(mask,perm),c)]
assert len(rot)==60
seen=set();orbits=[]
for i in range(N):
 if i in seen:continue
 O=sorted({int(x) for x in a5map[:,i]});seen.update(O);orbits.append(O)
assert len(orbits)==12, len(orbits)
orb_of=np.empty(N,dtype=int)
for k,o in enumerate(orbits):orb_of[o]=k
print('12 proper A5 orbits (id, size, energy, centre, sample mask):')
for k,o in enumerate(orbits):print(k,len(o),float(E[o[0]]),int(cs[o[0]]),int(S[o[0]][0]))
# Source chiral currents transform equivariantly under all 60 proper A5 rotations
for perm in a5map:
 assert np.max(np.abs(E[perm]-E))<1e-10
 assert np.max(np.abs(J0[np.ix_(perm,perm)]-J0))<1e-9
 assert np.max(np.abs(Jg[np.ix_(perm,perm)]-Jg))<1e-9
print('A5 covariance verified on all 60 orbits and all 444x444 J entries')
# Native 1032 edges, and exact per-orbit source multisets. Group by orbit pair, current
# signs and magnitudes. For same-orbit currents count both directed incidences.
links=[];neighbors=[[] for _ in range(N)]
for i,(mask,c,s,en) in enumerate(S):
 for bit in range(13):
  key=(mask^(1<<bit),c) if bit<12 else (mask,-c)
  j=idx.get(key)
  if j is None:continue
  neighbors[i].append((j,bit))
  if i<j:links.append((i,j,bit))
assert len(links)==1032
u=np.array([i for i,j,k in links],dtype=int)
v=np.array([j for i,j,k in links],dtype=int)
bits=np.array([k for i,j,k in links],dtype=int)
J=J0+Jg
junit=8*np.sqrt(5)/5
Delta=.15-80*np.pi/(1053*phi);beta=-np.log(Delta);eps=np.pi/(3*phi**12);alpha=eps/24
# Verify exact source-oriented local intensity binning of the two currents
for nm,T in [('J0',J0),('Jg',Jg),('Jsum',J)]:
 print(nm,'edge normalized signed J/j1 counts',collections.Counter(np.round(T[u,v]/junit,7)))

# Exact equivariant quotient by A5 orbit indicator, to avoid 444x444 ill-conditioned solve.
# Include multiple edge strengths between same orbit pair; aggregate each native rate.

def build_quotient(a):
 Q=np.zeros((len(orbits),len(orbits)))
 rowlist=[]
 for i,o in enumerate(orbits):
  x=o[0]
  row=np.zeros(len(orbits))
  for j,bit in neighbors[x]:
   rate=expit(-beta*(E[j]-E[x]))*np.exp(a*J[x,j]/junit)
   if orb_of[j]!=i:
    row[orb_of[j]]+=rate
    row[i]-=rate
  Q[i]=row
  # Strict orbit-wise lumpability: every x in given orbit gives identical row
  for x in o[1:]:
   row2=np.zeros(len(orbits))
   for j,bit in neighbors[x]:
    rate=expit(-beta*(E[j]-E[x]))*np.exp(a*J[x,j]/junit)
    if orb_of[j]!=i:
     row2[orb_of[j]]+=rate;row2[i]-=rate
   assert np.max(abs(row2-row))<3e-12, (i,x,max(abs(row2-row)))
 assert np.max(abs(Q.sum(axis=1)))<1e-14
 return Q

def solve10(Q):
 A=Q.T.copy();A[0,:]=1
 b=np.zeros(len(orbits));b[0]=1
 mass=np.linalg.solve(A,b)
 assert min(mass)>-1e-10
 return mass

def compare_full(a,mass):
 p=np.zeros(N)
 for k,o in enumerate(orbits):p[o]=mass[k]/len(o)
 quv=expit(-beta*(E[v]-E[u]))*np.exp(a*J[u,v]/junit)
 qvu=expit(-beta*(E[u]-E[v]))*np.exp(-a*J[u,v]/junit)
 F=p[u]*quv-p[v]*qvu
 diverg=np.bincount(u,weights=F,minlength=N)-np.bincount(v,weights=F,minlength=N)
 lr=np.log((p[u]*quv)/(p[v]*qvu))
 EP=float(F@lr)
 power=float(2*(F@(a*J[u,v]/junit)))
 bias=float(sum(mass[k]*cs[o[0]] for k,o in enumerate(orbits)))
 return dict(mass=mass,pi=p,biased=bias,EP=EP,power=power,maxdiv=np.max(np.abs(diverg)),current_c=np.sum(np.abs(F[bits==12])),F=F)

for a in (0,alpha/2,alpha,2*alpha,10*alpha,100*alpha):
 mass=solve10(build_quotient(a));r=compare_full(a,mass)
 print('a=',format(a,'.13g'),'central-bias=',format(r['biased'],'.13g'),'EP=',format(r['EP'],'.13g'),'Pwr=',format(r['power'],'.13g'),'maxdiv=',r['maxdiv'],'center-current-L1=',format(r['current_c'],'.13g'))
 if a:print('EP/a^2=',r['EP']/a**2,'bias/a^2=',r['biased']/a**2)

# Prove quotient perturbation selection: alpha^1 effect in probability is zero; mixed
# current orientation appears at alpha². Derive exact P''(0)/2 via resolvent Q0,Q1,Q2.
# If q_ij(a)=q0 exp(a J/j1), Q(a)=Q0+aQ1+a²Q2/2+..., then Q0^T m0=0,
# Q0^T m1=-Q1^T m0, Q0^T m2=-2Q1^T m1-Q2^T m0.
# quotient derivatives via exact exponent derivative over native neighbours.
def quotient_jet(n):
 Q=np.zeros((len(orbits),len(orbits)))
 for i,o in enumerate(orbits):
  x=o[0]
  for j,bit in neighbors[x]:
   if orb_of[j]==i:continue
   rate=expit(-beta*(E[j]-E[x]))*(J[x,j]/junit)**n
   Q[i,orb_of[j]]+=rate;Q[i,i]-=rate
 return Q
Q0,Q1,Q2=(quotient_jet(n) for n in range(3))
A=Q0.T.copy();A[0,:]=1
m0=solve10(Q0)
b=-Q1.T@m0;b[0]=0;m1=np.linalg.solve(A,b)
b=-2*Q1.T@m1-Q2.T@m0;b[0]=0;m2=np.linalg.solve(A,b)
cvec=np.array([cs[o[0]] for o in orbits])
print('Maclaurin bias b0,b1,b2/2',cvec@m0,cvec@m1,cvec@m2/2)
print('At alpha predicted',alpha*(cvec@m1)+alpha**2*(cvec@m2/2))
# Compute pure J0 and pure Jg exact quotient bias at same alpha and see symmetries
for tag,T in [('J0',J0),('Jg',Jg)]:
 J_orig=J;J=T
 Q=build_quotient(alpha)
 mass=solve10(Q);bias=sum(mass[k]*cs[o[0]] for k,o in enumerate(orbits))
 print(tag,'A5-reduced central bias',bias)
 J=J_orig
# Compare full native reversible thermal rate slow mode for 10-orbit reduced generator
from scipy.linalg import eigvals
w=np.sort(np.abs(np.real(eigvals(Q0))))
print('12-orbit relaxation eigenvalues first 5',w[:5])
print('epsilon',eps,'alpha',alpha,'beta',beta,'Delta',Delta)
# 70-digit certificate: express native J0+Jg edge coefficients exactly as
# 0, +/-2, +/-2phi^2, +/-4 times j1; energy orbit values are E0, E1, E2.
mp.mp.dps=70
pp=(1+mp.sqrt(5))/2
DD=mp.mpf(3)/20-80*mp.pi/(1053*pp);bb=-mp.log(DD)
epsmp=mp.pi/(3*pp**12);amp=epsmp/24
EG=-6-4*pp;EI=-8-2*pp;ES=-10
ene_levels=[int(np.argmin(np.abs(np.array([float(EG),float(EI),float(ES)])-E[o[0]]))) for o in orbits]
energy_mp=[(EG,EI,ES)[l] for l in ene_levels]
levels={0:EG,1:EI,2:ES}
mps=[mp.mpf(0),mp.mpf(2),-mp.mpf(2),2*pp**2,-2*pp**2,mp.mpf(4),-mp.mpf(4)]
counts=[[collections.Counter() for j in range(len(orbits))] for i in range(len(orbits))]
for i,o in enumerate(orbits):
 x=o[0]
 for y,k in neighbors[x]:
  if orb_of[y]==i:continue
  q=J[x,y]/junit
  best=int(np.argmin([abs(float(m)-q) for m in mps]))
  assert abs(float(mps[best])-q)<2e-12,(q,best)
  counts[i][orb_of[y]][best]+=1

def mpQ(a,deriv=0):
 m=len(orbits);mat=mp.matrix(m)
 for i in range(m):
  for j in range(m):
   if i==j:continue
   z=mp.mpf('0')
   for label,mul in counts[i][j].items():
    x=mps[label]
    z+=mul*x**deriv*mp.exp(a*x)/(1+mp.exp(bb*(energy_mp[j]-energy_mp[i])))
   mat[i,j]=z
  mat[i,i]=-sum(mat[i,j] for j in range(m) if j!=i)
 return mat

def mp_stationary(Q):
 m=len(orbits);A=mp.matrix(Q.T);b=mp.matrix(m,1)
 for k in range(m):A[0,k]=1
 b[0]=1
 return mp.lu_solve(A,b)

def mpcb(p):return sum(mp.mpf(int(cs[o[0]]))*p[k] for k,o in enumerate(orbits))
for a in [mp.mpf('0'),amp/2,amp,-amp,amp*2]:
 q=mpQ(a);p=mp_stationary(q)
 cb=mpcb(p)
 print('MP70 alpha',mp.nstr(a,23),'central bias',mp.nstr(cb,33),'bias/alpha^2',mp.nstr(cb/a**2,25) if a else 'NA')
 if a==amp:
  mp_pi=np.array([float(p[int(orb_of[i])]/len(orbits[int(orb_of[i])])) for i in range(N)])
  quv=expit(-beta*(E[v]-E[u]))*np.exp(alpha*J[u,v]/junit)
  qvu=expit(-beta*(E[u]-E[v]))*np.exp(-alpha*J[u,v]/junit)
  F=mp_pi[u]*quv-mp_pi[v]*qvu
  EP=np.dot(F,np.log((mp_pi[u]*quv)/(mp_pi[v]*qvu)))
  print('MP fine state EP',repr(float(EP)),'Pcenter+',mp.nstr((1+cb)/2,30),'Pcenter-',mp.nstr((1-cb)/2,30))
  cap=np.where(bits==12)[0];jumpsplus=np.sum(mp_pi[u[cap]]*quv[cap]*(cs[u[cap]]==1))+np.sum(mp_pi[v[cap]]*qvu[cap]*(cs[v[cap]]==1))
  jumpsminus=np.sum(mp_pi[u[cap]]*quv[cap]*(cs[u[cap]]==-1))+np.sum(mp_pi[v[cap]]*qvu[cap]*(cs[v[cap]]==-1))
  print('MP center flux each orientation',jumpsplus,jumpsminus,'conditional exit rates',jumpsplus/float((1+cb)/2),jumpsminus/float((1-cb)/2))
# exact perturbation coeff including stationary gauge normalization
Q00=mpQ(mp.mpf(0),0);Q11=mpQ(mp.mpf(0),1);Q22=mpQ(mp.mpf(0),2)
mm=len(orbits)
AAA=mp.matrix(Q00.T)
for j in range(mm):AAA[0,j]=1
b0=mp.matrix(mm,1);b0[0]=1
z0=mp.lu_solve(AAA,b0)
b1=-(Q11.T*z0);b1[0]=0
z1=mp.lu_solve(AAA,b1)
b2=-(2*Q11.T*z1+Q22.T*z0);b2[0]=0
z2=mp.lu_solve(AAA,b2)
print('MP70 BIAS expansion b0',mp.nstr(mpcb(z0),45),'b1',mp.nstr(mpcb(z1),45),'b2/2',mp.nstr(mpcb(z2)/2,45))
print('MP70 predicted alpha^2 term',mp.nstr(mpcb(z2)/2*amp**2,28))
# Explicit parity selection theorem: original J0 is invariant under full-spin
# inversion T=(s,c)->(-s,-c); centre-graded Jg is invariant under RT where
# R is spatial antipodal permutation. Both map c to -c and leave E invariant;
# thus either separately driven current gives exact P(c=+)=P(c=-).
vgeo=src['v']
opp=[int(np.argmin(np.linalg.norm(vgeo+vgeo[i],axis=1))) for i in range(12)]
assert all(np.linalg.norm(vgeo[i]+vgeo[opp[i]])<1e-10 for i in range(12))
Tm=np.array([idx[(mask^4095,-c)] for mask,c,s,en in S],dtype=int)
Rm=np.array([idx[(perm_word(mask,opp),c)] for mask,c,s,en in S],dtype=int)
RT=Tm[Rm]
assert np.max(np.abs(E[Tm]-E))<1e-10
assert np.max(np.abs(E[Rm]-E))<1e-10
assert np.max(np.abs(J0[np.ix_(Tm,Tm)]-J0))<1e-9
assert np.max(np.abs(Jg[np.ix_(Tm,Tm)]+Jg))<1e-9
assert np.max(np.abs(J0[np.ix_(Rm,Rm)]+J0))<1e-9
assert np.max(np.abs(Jg[np.ix_(Rm,Rm)]+Jg))<1e-9
assert np.max(np.abs(Jg[np.ix_(RT,RT)]-Jg))<1e-9
assert np.max(np.abs(J0[np.ix_(RT,RT)]+J0))<1e-9
print('EXACT finite involution selection rule: T preserves J0, RT preserves Jg, each flips c')
print('Combined J0+Jg has no such centre-flipping invariance')
# Check source algebra on all outer and centre native links
outer=bits!=12;center=bits==12
assert np.max(np.abs(Jg[u[outer],v[outer]]-cs[u[outer]]*J0[u[outer],v[outer]]))<1e-9
assert np.max(abs(J0[u[center],v[center]]))<1e-9
assert np.max(np.abs(J[u[outer],v[outer]]-(1+cs[u[outer]])*J0[u[outer],v[outer]]))<1e-9
print('SOURCE THEOREM VERIFIED: Jg_outer=c*J0, Jsum_outer=(1+c)*J0, J0_center=0')
print('Jsum active by centre:',collections.Counter((int(cs[i]),'nonzero' if abs(J[i,j])>1e-8 else 'zero') for i,j,k in links if k<12))

print('MP70 first-order orbit mass derivatives', [mp.nstr(zz,22) for zz in z1])
print('MP70 first-order max',mp.nstr(max(abs(zz) for zz in z1),30))
# exact EP coefficient if first-order correction vanishes
p0f=np.array([float(z0[int(orb_of[i])]/len(orbits[int(orb_of[i])])) for i in range(N)])
r0=expit(-beta*(E[v]-E[u]))
coeff=4*np.sum(p0f[u]*r0*(J[u,v]/junit)**2)
print('direct linear entropy coefficient sigma2',coeff,'obs sigma2',compare_full(alpha,np.array([float(t) for t in mp_stationary(mpQ(amp))]))['EP']/alpha**2)
# Linear-response entropy production is the conductance-weighted cycle projection.
# p_x(a)=pi_x[1+a v_x+O(a²)], and cxy=pi_x q0xy.
# Fxy=a cxy(2yxy+v_x-v_y)+..., sigma=a² sum cxy(2yxy+v_x-v_y)²+...
p0mass=np.array([float(zz) for zz in z0]);p1mass=np.array([float(zz) for zz in z1]);
p0fine=p0mass[orb_of]/np.array([len(orbits[int(k)]) for k in orb_of]);
v1fine=(p1mass/p0mass)[orb_of]
conductance=p0fine[u]*expit(-beta*(E[v]-E[u]))
force=2*J[u,v]/junit+v1fine[u]-v1fine[v]
sigma2=float(np.dot(conductance,force**2))
print('GREEN-KUBO cycle-resolved EP coefficient',repr(sigma2),'at alpha projected EP',repr(sigma2*alpha**2))
print('EP coefficient by outer c+, c-, centre',*[float(np.dot(conductance[filter],force[filter]**2)) for filter in [((bits!=12)&(cs[u]==1)),((bits!=12)&(cs[u]==-1)),bits==12]])
# Kirchhoff current divergence O(a) vanishes exactly when using derived vertex potential
F1=conductance*force
div1=np.bincount(u,weights=F1,minlength=N)-np.bincount(v,weights=F1,minlength=N)
print('KIRCHHOFF weighted current divergence maximum',max(abs(div1)),'total EP>=0',sigma2>0)
print('source force non-gradient detectable at epsilon KMS',sigma2>0)