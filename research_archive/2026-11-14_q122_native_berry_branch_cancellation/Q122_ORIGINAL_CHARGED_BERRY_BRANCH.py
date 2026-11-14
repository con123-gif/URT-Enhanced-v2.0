#!/usr/bin/env python3
"""Q122: exact branch reversal of the native Q101/Q105 charged Berry current.

TRACK M ONLY.  The whole-five 190/50/H64 source is reexecuted from Q101.
No old Q77 selected history, no arbitrary Q101 Peierls alpha, no fitted ARF.
The already-specified Q105 unit shortest SU2 transport and Born observation
remain CONDITIONAL physical assumptions, not primitive time dynamics.
"""
from pathlib import Path
import math,runpy
from itertools import combinations
import numpy as np
import sympy as sp
from scipy.linalg import expm

ROOT=Path(__file__).resolve().parents[2]
r=runpy.run_path(str(ROOT/'research_archive/2026-11-14_q101_moving_arf/MOVING_ARF_DERIVATION.py'))
orig=r['minima']
assert len(orig)==60 and sorted(map(len,r['parts']))==[30,30]
masks=[row[0] for row in orig]
states=np.asarray([row[1] for row in orig],int)
by_mask={x:i for i,x in enumerate(masks)}
rev=np.asarray([by_mask[m^4095] for m in masks],int)
assert np.array_equal(rev[rev],np.arange(60))
pos=np.asarray([i for i,s in enumerate(states) if sum(s)==4],int)
neg=np.asarray([i for i,s in enumerate(states) if sum(s)==-4],int)
assert len(pos)==len(neg)==30
assert set(rev[pos])==set(neg)
B=np.asarray(r['B'],int)
A=np.abs(B)
assert np.array_equal(B,-B.T) and np.count_nonzero(B)==240
assert np.array_equal(B[np.ix_(rev,rev)],B)
assert np.array_equal(A[np.ix_(rev,rev)],A)
assert np.all(A.sum(axis=1)==4)
V=np.asarray(r['v'],float);phi=(1+math.sqrt(5))/2
n=(phi/4)*states@V
assert np.max(abs(np.linalg.norm(n,axis=1)-1))<1e-11
assert np.linalg.norm(n+n[rev])<1e-11

# True spatial inversion permutes the original antipodal outer contacts.
# Distinct from contact-spin inversion: it is ODD on native signed W current.
opposite={a:next(b for b in range(12) if np.linalg.norm(V[a]+V[b])<1e-11)
          for a in range(12)}
parity=[]
for s in states:
    t=s[[opposite[k] for k in range(12)]]
    mask=sum(1<<k for k in range(12) if t[k]==-1)
    parity.append(by_mask[mask])
parity=np.asarray(parity,int)
assert np.array_equal(parity[parity],np.arange(60))
assert np.array_equal(B[np.ix_(parity,parity)],-B)
assert np.array_equal(A[np.ix_(parity,parity)],A)
assert np.linalg.norm(n+n[parity])<1e-11
print("Original Q101 all-five/H64: inversion B EVEN, spatial parity B ODD: PASS",flush=True)

sigma=np.asarray([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]],complex)
S=np.einsum('aj,jkl->akl',n,sigma)
spinors=np.asarray([np.linalg.eigh(x)[1][:,-1] for x in S])
P=(np.eye(2)+S)/2
H=np.zeros((60,60),complex)
for a,b in combinations(range(60),2):
    if not A[a,b]: continue
    Uab=(np.eye(2)+S[a]@S[b])/np.sqrt(2*(1+n[a]@n[b]))
    assert np.linalg.norm(Uab.conj().T@Uab-np.eye(2))<1e-11
    assert np.linalg.norm(S[a]@Uab-Uab@S[b])<1e-11
    h=np.vdot(spinors[a],Uab@spinors[b])
    assert abs(abs(h)-1)<1e-11
    H[a,b]=h;H[b,a]=np.conj(h)
assert np.linalg.norm(H-H.conj().T)<1e-11
hp=H[np.ix_(pos,pos)]
hn=H[np.ix_(rev[pos],rev[pos])]
bp=B[np.ix_(pos,pos)]
bn=B[np.ix_(rev[pos],rev[pos])]
assert np.array_equal(bp,bn)

# Kramers SU2 antiunitary T=i sigma_y complex-conjugation maps
# the + eigenline at n to the + eigenline at -n.
epsilon=np.asarray([[0,1],[-1,0]],complex)
phase=np.asarray([np.vdot(epsilon@spinors[a].conj(),spinors[rev[a]])
                  for a in pos])
assert np.max(abs(abs(phase)-1))<1e-11
expected=np.conj(hp)*np.conj(phase)[:,None]*phase[None,:]
assert np.linalg.norm(hn-expected)<1e-10
print("Actual 30+30 Q105 charged Berry hopping is antiunitarily paired: PASS",flush=True)

# Outward orientation of the POSITIVE-branch 30/60/32 surface.
ix=list(pos)
tri=[f for f in combinations(ix,3) if A[f[0],f[1]] and A[f[1],f[2]] and A[f[2],f[0]]]
assert len(tri)==20
def canon(t):
    v=list(t)
    return min(tuple(z[k:]+z[:k]) for z in (v,list(reversed(v))) for k in range(len(v)))
pent=set()
for a in ix:
 for b in ix:
  if not A[a,b]:continue
  for c in ix:
   if c in (a,b) or not A[b,c]:continue
   for d in ix:
    if d in (a,b,c) or not A[c,d]:continue
    for e in ix:
     if e in (a,b,c,d) or not A[d,e] or not A[e,a]:continue
     cycle=[a,b,c,d,e]
     if any(A[cycle[k],cycle[(k+2)%5]] for k in range(5)):continue
     pent.add(canon(cycle))
assert len(pent)==12
faces=[]
for f in tri+sorted(pent):
    f=list(f)
    normal=sum((np.cross(n[f[k]],n[f[(k+1)%len(f)]])
               for k in range(len(f))),np.zeros(3))
    if normal@np.sum(n[f],axis=0)<0: f=f[::-1]
    faces.append(f)
z3=(7-3*math.sqrt(5)+1j*(1+math.sqrt(5)))/16
z5=(24-10*math.sqrt(5)+1j*(5*math.sqrt(5)-7))/64
pflux=nflux=0.
for f in faces:
    z=np.trace(np.linalg.multi_dot([P[i] for i in f]))
    zinv=np.trace(np.linalg.multi_dot([P[rev[i]] for i in f]))
    expected=z3 if len(f)==3 else z5
    assert abs(z-expected)<1e-10
    assert abs(zinv-z.conjugate())<1e-10
    pflux+=np.angle(z);nflux+=np.angle(zinv)
assert abs(pflux-14*math.pi)<1e-10
assert abs(nflux+14*math.pi)<1e-10
print("Fixed face-orientation Berry Chern +7 / -7: PASS",flush=True)

# Each native directed link belongs to one triangle. Triangle holonomy of
# the UNIT SU2 hop is the Bargmann angle theta3 (not a fitted Peierls alpha).
# Direct-hop vs two-hop interference yields exact J'''(0)/6=-4 sin(theta3).
cubic=-4*float(z3.imag/abs(z3))
exact=-2*(1+math.sqrt(5))/math.sqrt(25-10*math.sqrt(5))
assert abs(cubic-exact)<1e-12
def current(t):
    up=expm(-1j*t*hp);un=expm(-1j*t*hn)
    tp=abs(up)**2;tn=abs(un)**2
    jp=float(np.sum(bp*tp)/30)
    jn=float(np.sum(bn*tn)/30)
    assert abs(jp+jn)<2e-11
    return jp,jn,tp,tn
for t in (.0125,.025,.05,.1,.2):
    jp,jn,tp,tn=current(t)
    print("tau",t,"J+",jp,"J-",jn,flush=True)
csmall=current(.025)[0]/.025**3
chalf=current(.0125)[0]/.0125**3
assert abs((4*chalf-csmall)/3-cubic)<3e-5
print("Exact +branch cubic",sp.simplify(-2*(1+sp.sqrt(5))/sp.sqrt(25-10*sp.sqrt(5))),flush=True)

# Q103 positive Born counting remains derivable without the old golden phase.
# 24 is the number of DECLARED measurements, not a derived time/clock.
t=.1
jp,jn,tp,tn=current(t)
pplus=[tp[a,b] for a in range(30) for b in range(30) if bp[a,b]==1]
pminus=[tp[a,b] for a in range(30) for b in range(30) if bp[a,b]==-1]
assert len(pplus)==len(pminus)==60
assert max(pplus)-min(pplus)<1e-10
assert max(pminus)-min(pminus)<1e-10
p_plus=2*np.mean(pplus);p_minus=2*np.mean(pminus)
p_zero=1-p_plus-p_minus
mu=p_plus-p_minus
assert p_zero>0 and abs(jp-mu)<1e-12
assert abs(jn+mu)<1e-12
assert abs(np.mean([tn[a,b] for a in range(30) for b in range(30) if bn[a,b]==1])*2-p_minus)<1e-12
for Nobs in (1,4,24):
 for chi in (.1,.4):
    tilted_plus=tp*np.exp(chi*bp)
    tilted_minus=tn*np.exp(chi*bn)
    mgf_plus=np.sum(np.linalg.matrix_power(tilted_plus,Nobs))/30
    mgf_minus=np.sum(np.linalg.matrix_power(tilted_minus,Nobs))/30
    g=p_zero+p_plus*math.exp(chi)+p_minus*math.exp(-chi)
    gm=p_zero+p_minus*math.exp(chi)+p_plus*math.exp(-chi)
    assert abs(mgf_plus-g**Nobs)<1e-10
    assert abs(mgf_minus-gm**Nobs)<1e-10
    assert abs(.5*(mgf_plus+mgf_minus)-.5*(g**Nobs+gm**Nobs))<1e-10
Nobs=24
variance_mix=Nobs*(p_plus+p_minus)+Nobs*(Nobs-1)*mu**2
variance_independent_sign=Nobs*(p_plus+p_minus)
assert variance_mix>variance_independent_sign
print("24 fixed-sector unbiased mean=0, variance",variance_mix,
      "orientation-memory excess",variance_mix-variance_independent_sign,flush=True)
print("Arbitrary positive hopping scale k rescales current J(t)->J(k*t): k unselected")
print("No old Q77, no Peierls-angle input, no selected physical time/charged Wilson ARF")
print("Q122 ORIGINAL CHARGED BERRY OPPOSITE-CURRENT/COUNTING: PASS")
