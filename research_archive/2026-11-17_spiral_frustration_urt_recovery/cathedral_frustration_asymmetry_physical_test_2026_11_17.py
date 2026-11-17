#!/usr/bin/env python3
"""Executable native-math test: frustration order parameter vs Q96 baryon number.
Uses same Q101 full-five projected face source and Q124 charged transport as
cathedral_full_machine_bridge_2026_11_17.py and original Q125 source.
No empirical constants or fitted parameters. Q96 B assignment is the Standard Model
quark (1/3) / lepton (0) assignment, not a derivation from geometry.
"""
import contextlib, io, runpy
from itertools import combinations
from collections import Counter
import numpy as np
from scipy.special import logsumexp

with contextlib.redirect_stdout(io.StringIO()):
    source=runpy.run_path(str(__import__('pathlib').Path(__file__).with_name('cathedral_full_machine_bridge_2026_11_17.py')))
phi=source['phi']; v=source['v'];edges=source['edges'];states=source['states']; index=source['state_index']; J0=source['J0'];Jg=source['Jg']
assert len(states)==444

# Exact ground and sublevel census over all 8192 spin states.
energy=np.zeros(8192);M=np.zeros(8192,dtype=int);C0=np.zeros(8192,dtype=int)
for x in range(8192):
    s=np.array([1-2*((x>>i)&1) for i in range(12)],dtype=int)
    c=1-2*((x>>12)&1)
    M[x]=sum(s);C0[x]=c
    energy[x]=sum(s[i]*s[j] for i,j in edges)-phi*c*M[x]
assert np.max(np.abs(energy-energy[np.arange(8192)^8191]))<1e-12
levels=Counter(round(float(z),9) for z in energy if z<=-10+1e-9)
assert sorted(levels.values())==[60,144,240]
Emin=energy.min();ground=np.flatnonzero(abs(energy-Emin)<1e-10)
assert len(ground)==60
for x in ground:
    assert abs(M[x])==4 and C0[x]*M[x]==4
    s=np.array([1-2*((x>>i)&1) for i in range(12)],dtype=int)
    same=sum(s[i]==s[j] for i,j in edges)
    assert same==12
assert sum(M[x]==4 for x in ground)==30
assert sum(M[x]==-4 for x in ground)==30

# Derivative of the ORIGINAL frustration energy w.r.t. contact strength t.
# For 1<t<3 the same sixty minimizers survive: dEground/dt = -cM = -4.
for t in (1.001, phi, 2.999):
    en=energy+(phi-t)*C0*M
    gs=np.flatnonzero(abs(en-en.min())<1e-10)
    assert len(gs)==60 and set(gs)==set(ground)
    assert np.max(np.abs(en[gs]-(-6-4*t)))<1e-9

Delta=.15-80*np.pi/(1053*phi)
beta=-np.log(Delta)
weights=np.exp(-beta*(energy-Emin))
p=weights/weights.sum()
subsel=energy<=-10+1e-10
q=np.where(subsel,weights,0);q=q/q.sum()
print('Full 8192 spin states, 444 sublevel states, 60 ground states: PASS')
print('GROUND: 30 M=+4 c=+1 and 30 M=-4 c=-1')
print('GROUND: 8:4 spin population; 12 frustrated/30 bonds, 18 satisfied/30')
print('GROUND dEmin/dt=-4; frustration contact order parameter cM/12 = 1/3')
print('beta',format(beta,'.15g'))
print('GIBBS full 8192 <cM>/12',format(float(np.dot(p,C0*M)/12),'.15g'))
print('GIBBS 444 <cM>/12',format(float(np.dot(q,C0*M)/12),'.15g'))
print('GIBBS full <M>/12',float(np.dot(p,M)/12),'<c>',float(np.dot(p,C0)))
print('GIBBS 444 <M>/12',float(np.dot(q,M)/12),'<c>',float(np.dot(q,C0)))
print('GIBBS full P(M>0), P(M<0), P(M=0)',*[float(sum(p[M==d])) if d==0 else float(sum(p[M>0] if d==1 else p[M<0])) for d in (1,-1,0)])

# Original all-five source has f(-s)=f(s) and J0 invariant under the combined
# 13-spin flip, whereas the candidate centre-sensitive Jg is odd.
f=source['fmap'];
Tm=np.array([index[(mask^4095,-c)] for mask,c,s,e in states],dtype=int)
assert np.max(abs(f[Tm]-f))<1e-10
assert np.max(abs(J0[np.ix_(Tm,Tm)]-J0))<1e-8
assert np.max(abs(Jg[np.ix_(Tm,Tm)]+Jg))<1e-8
print('FULL FIVE-SOLID SOURCE: f(-s)=f(s), native Q125 J0 is global-spin-even: PASS')

# Native Q124 Q16+conjugate Q96 transport: the 12 quark states in each Q16
# carry B=1/3, 4 lepton states B=0. Three Q16 generations plus three charge
# conjugates make B96 exactly traceless. This is a physical B assignment, not
# the geometric signed-spin order parameter.
B16=np.diag([1/3]*6+[0]*2+[1/3]*6+[0]*2).astype(complex)
B96=np.diag(list(np.tile(np.diag(B16),3))+list(-np.tile(np.diag(B16),3)))
assert B96.shape==(96,96) and abs(np.trace(B96))<1e-12
assert abs(np.trace(B96@B96)-8)<1e-12
I2=np.eye(2,dtype=complex)
sigma=np.array([[[0,1],[1,0]],[[0,-1j],[1j,0]],[[1,0],[0,-1]]])
axis=np.array([s@v / np.linalg.norm(s@v) for mask,c,s,e in states])
S=np.einsum('ai,ijk->ajk',axis,sigma)
Y=np.diag([1/6]*6+[-1/2]*2+[2/3]*3+[-1/3]*3+[-1,0]).astype(complex)
Q=[]
for ss in S:
   A=Y.copy()
   for t in range(4):A[2*t:2*t+2,2*t:2*t+2]+=ss/2
   Q.append(A)
max_b_comm=0;max_q_ward=0;edge_count=0
for i,(mask,c,s,e) in enumerate(states):
  for bit in range(13):
    dst=(mask^(1<<bit),c) if bit<12 else (mask,-c)
    j=index.get(dst)
    if j is None or j<=i:continue
    dot=float(axis[i]@axis[j]);assert dot>-1+1e-9
    U=(I2+S[i]@S[j])/np.sqrt(2*(1+dot))
    U16=np.zeros((16,16),complex)
    for t in range(4):U16[2*t:2*t+2,2*t:2*t+2]=U
    U16[8:16,8:16]=np.eye(8)
    b_comm=np.linalg.norm(B16@U16-U16@B16)
    q_ward=np.linalg.norm(Q[i]@U16-U16@Q[j])
    max_b_comm=max(max_b_comm,b_comm);max_q_ward=max(max_q_ward,q_ward)
    edge_count+=1
assert edge_count==1032 and max_b_comm<2e-13 and max_q_ward<2e-12
print('CHARGED Q124: 1032 native links, [B16,U16]=0, local Q16 Ward = 0; PASS')
print('Q96 includes particle+antiparticle: Tr(B96)=',np.trace(B96),'Tr(B96^2)=',np.trace(B96@B96))
print('max baryon-number transport commutator',format(max_b_comm,'.3g'))
print('max gauge Ward residual',format(max_q_ward,'.3g'))
print('B conserved by original Q125 coherent Hch and charge-covariant Q124 jumps')
print('CAUTION: spin order parameter cM is C-even under global inversion, not a CP-odd physical baryon observable')