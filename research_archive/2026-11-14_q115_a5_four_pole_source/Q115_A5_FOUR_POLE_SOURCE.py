#!/usr/bin/env python3
"""Q115 ORIGINAL A5 history isotypic quartet and 4x4 source resolvent.

No invented 64x64 coupling. Q112 reexecutes Q77 original selected golden
24-clock rigorous intervals and Q82 hidden icosahedral 4_5 source.
Q114 face-distance P5 kernel is cross-checked independently.
"""
from collections import Counter
from contextlib import redirect_stdout
from fractions import Fraction as Fr
from io import StringIO
from math import lcm
from pathlib import Path
import runpy
import numpy as np
import networkx as nx
import sympy as sp

ARCH=Path(__file__).resolve().parents[1]
source=ARCH/'2026-11-14_q112_native_hidden_clock_leak/Q112_NATIVE_G5_CLOCK_LEAK.py'
with redirect_stdout(StringIO()) as stdout:
    q=runpy.run_path(str(source))
assert q['lower']>0
faces=q['faces']
assert len(faces)==20
dual=nx.Graph()
dual.add_nodes_from(range(20))
dual.add_edges_from((i,j) for i in range(20) for j in range(i+1,20)
                    if len(set(faces[i])&set(faces[j]))==2)
assert nx.is_connected(dual) and nx.diameter(dual)==5
kernel={0:Fr(1,5),1:-Fr(2,15),2:Fr(1,30),
        3:Fr(1,30),4:-Fr(2,15),5:Fr(1,5)}
Pdistance=sp.Matrix(20,20,lambda i,j:sp.Rational(
             kernel[nx.shortest_path_length(dual,i,j)].numerator,
             kernel[nx.shortest_path_length(dual,i,j)].denominator))
assert Pdistance==q['P5'], "Original Q82 hidden projector disagrees with Q114 exact dual distance"
assert q['Mh']*Pdistance*q['Mh'].T/2==q['G5']
print('Q114 original 20-face P5 distance kernel exactly reproduces Q112 hidden G5',flush=True)

perms=[np.asarray(p,dtype=int) for p in q['perms']]
assert len(perms)==60 and all(sorted(p)==list(range(64)) for p in perms)
def order(p):
    seen=set(); ans=1
    for i in range(64):
        if i in seen:continue
        x=i;length=0
        while x not in seen:
            seen.add(x);x=int(p[x]);length+=1
        ans=lcm(ans,length)
    return ans
count=Counter((order(p),int(np.sum(p==np.arange(64)))) for p in perms)
# 2026-11-14 Claude repair: half-turns fix NO history (an edge-midpoint
# half-turn sends two antipodal pairs v -> -v, flipping those choices).
# The original assertion (2,16) was never executed; CI run 43590931659
# returned exactly this Counter.
assert count==Counter({(1,64):1,(2,0):15,(3,4):20,(5,4):24}),count
# chi_H on (1, 15 C2, 20 C3, 12 C5A, 12 C5B) = (64,0,4,4,4); A5 characters
# 1:(1,1,1,1,1) 3:(3,-1,0,phi,1-phi) 3':(3,-1,0,1-phi,phi) 4:(4,0,1,-1,-1)
# 5:(5,1,-1,0,0). chi_H is equal on C5A and C5B, so phi cancels exactly.
num={'1':64+0+20*4+24*4,'3':3*64-0+0+12*4*1,'4':4*64+0+20*4-24*4,'5':5*64+0-20*4}
assert all(v%60==0 for v in num.values())
m={k:v//60 for k,v in num.items()}
assert (m['1'],m['3'],m['4'],m['5'])==(4,4,4,4)   # m3 = m3' = 4
assert 4*1+4*3+4*3+4*4+4*5==64
# orbit structure: 2 orbits of size 20 (stabiliser Z3), 2 of size 12 (Z5)
seen=set();orbs=[]
for h in range(64):
    if h in seen:continue
    o=frozenset(int(p[h]) for p in perms);seen|=o;orbs.append(o)
assert sorted(len(o) for o in orbs)==[12,12,20,20]
print('EXACT original 64-history A5 reps: 4·(1+3+3prime+4+5) = 2·Ind_Z3 1 + 2·Ind_Z5 1',flush=True)

# Construct A5 central projectors directly from original 60 history permutations.
idc=np.arange(64)
Pi1=np.zeros((64,64));Pi33=np.zeros((64,64));Pi4=np.zeros((64,64));Pi5=np.zeros((64,64))
for perm in perms:
    k=order(perm)
    E=np.zeros((64,64))
    E[perm,idc]=1
    Pi1+=E/60.
    Pi33+=(3/60.)*{1:6,2:-2,3:0,5:1}[k]*E   # chi_3+chi_3'
    Pi4+=(4/60.)*{1:4,2:0,3:1,5:-1}[k]*E
    Pi5+=(5/60.)*{1:5,2:1,3:-1,5:0}[k]*E
for Pr,rank in ((Pi1,4),(Pi33,24),(Pi4,16),(Pi5,20)):
    assert np.linalg.norm(Pr-Pr.T)<2e-12
    assert np.linalg.norm(Pr@Pr-Pr)<3e-11
    assert np.linalg.matrix_rank(Pr,tol=1e-8)==rank
assert np.linalg.norm(Pi1+Pi33+Pi4+Pi5-np.eye(64))<3e-11
# Ind_Z5 1 contains no 4: the four-isotypic block lives on the 40 histories
# of the two 20-orbits only.
twelve=sorted(set().union(*[o for o in orbs if len(o)==12]))
assert np.max(np.abs(Pi4[twelve,:]))<1e-12
print('four-isotypic rank 16 supported on the two 20-orbits (40 histories)',flush=True)

P=np.array(q['G5'],float);A=np.array(q['Abar'],float)
assert np.linalg.norm(Pi4@P-P)<1e-10
assert np.linalg.norm(P@P-P)<1e-11 and abs(np.trace(P)-4)<1e-11
assert np.linalg.norm(A-A.T)<1e-11
Hbits=15*np.eye(64)
for i in range(6):
    for j in range(i+1,6):
        mask=(1<<i)|(1<<j)
        for h in range(64):Hbits[h,h^mask]-=1.
assert np.linalg.norm(Hbits@P-16*P)<1e-10
for perm in perms:
    # Avoid materialising an extra action matrix; permuting both axes
    # implements simultaneous conjugation of a real matrix.
    assert np.max(np.abs(A[np.ix_(perm,perm)]-A))<1e-10
    assert np.max(np.abs(Hbits[np.ix_(perm,perm)]-Hbits))<1e-12
mean=float(np.trace(P@A)/4.)
assert np.linalg.norm(P@A@P-mean*P)<1e-9
off=(np.eye(64)-P)@A@P
mix=float(np.sum(off**2))
assert mix>float(q['lower'])**2
print('A5-Schur pure-source PAP=aP; exact mixed source c^2 variance coefficient',
      mix/4,flush=True)

# Isotypic Lanczos: original 64x64 K(c) reduces to one real 4x4
# multiplicity matrix tensored with the unique irreducible 4x4 identity.
# Each E_j has four columns carrying the SAME internal A5 irrep.
def reduce_c(c):
    K=Hbits+c*A
    assert np.linalg.norm(K@Pi4-Pi4@K)<1e-12
    ev,E=np.linalg.eigh(P)
    first=E[:,ev>.5]
    assert first.shape==(64,4)
    blocks=[first]
    eye4=np.eye(4)
    for j in range(4):
        W=K@blocks[j]
        for old in blocks:
            b=old.T@W
            a=float(np.trace(b)/4)
            assert np.linalg.norm(b-a*eye4)<1e-7
            W-=a*old
        # Second Gram-Schmidt pass (2026-11-14 Claude repair). The first
        # Lanczos off-diagonal is beta_1^2 = c^2*mix/4 ~ 1e-5 c^2, so single-pass
        # classical Gram-Schmidt loses orthogonality (measured 1.5e-8 at c=1,
        # 9e-7 at c=0.1) and the Q^T Q = I assertion failed. Reorthogonalising
        # changes no tolerance: it only removes rounding components along
        # earlier blocks. M4 below is computed directly from traces of K.
        # K commutes with the exact central projector Pi4 (checked below), so
        # Pi4 W = W in exact arithmetic; applying it strips rounding leakage
        # that 1/sqrt(beta^2) would otherwise amplify.
        W=Pi4@W
        for old in blocks:
            W-=old@(old.T@W)
        if j<3:
            gram=W.T@W
            n=float(np.trace(gram)/4)
            assert n>1e-11,('Krylov source not cyclic, shorten reduction',j,n)
            assert np.linalg.norm(gram-n*eye4)<1e-8
            blocks.append(W/np.sqrt(n))
    Q=np.hstack(blocks)
    assert Q.shape==(64,16) and np.linalg.norm(Q.T@Q-np.eye(16))<1e-8
    assert np.linalg.norm(Q@Q.T-Pi4)<1e-8
    M4=np.array([[np.trace(B.T@K@C)/4 for C in blocks] for B in blocks])
    assert np.linalg.norm(M4-M4.T)<1e-9
    assert np.linalg.norm(K@Q-Q@np.kron(M4,eye4))<1e-7
    lam,U=np.linalg.eigh(M4)
    weights=U[0]**2
    assert np.min(weights)>-1e-10 and abs(sum(weights)-1)<1e-10
    target=16+c*mean
    assert abs(np.dot(weights,lam)-target)<1e-8
    var=np.dot(weights,(lam-target)**2)
    assert abs(var-c*c*mix/4)<1e-8
    full=np.linalg.eigvalsh(K)
    # Not all full 64 spectra occur in G5: only these FOUR 4-fold energies.
    for e in lam:
        assert sum(np.abs(full-e)<2e-8)>=4
    # Independent cross-check (2026-11-14 Claude): the source measure from the
    # full 64x64 eigendecomposition carries the same four residues.
    fv,FU=np.linalg.eigh(K)
    wfull=np.sum((FU.T@first)**2,axis=1)/4
    for e,wj in zip(lam,weights):
        assert abs(wfull[np.abs(fv-e)<1e-7].sum()-wj)<1e-9
    assert abs(wfull[np.min(np.abs(fv[:,None]-lam[None,:]),axis=1)>1e-7].sum())<1e-12
    return lam,weights,var
for c in (0.1,1.0,2.0):
    lam,w,var=reduce_c(c)
    print('c=',c,'FOUR native poles:',np.array2string(lam,precision=12),
          'nonfitted weights:',np.array2string(w,precision=12),
          'variance',var,flush=True)
print('Q115 ORIGINAL A5 FOUR-POLE SOURCE RESOLVENT: PASS',flush=True)
print('Physical action c and gauge/mass observable selection still OPEN.',flush=True)
