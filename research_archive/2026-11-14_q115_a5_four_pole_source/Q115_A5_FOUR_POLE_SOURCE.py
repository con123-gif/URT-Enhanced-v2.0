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
assert count==Counter({(1,64):1,(2,16):15,(3,4):20,(5,4):24}),count
m1=(64+15*16+20*4+24*4)//60
m3=(3*64-15*16+12*4)//60
m4=(4*64+20*4-24*4)//60
m5=(5*64+15*16-20*4)//60
assert (m1,m3,m4,m5)==(8,0,4,8)
assert 8+16+40==64
print('EXACT original 64-history A5 reps: 8·1 + 4·4 + 8·5, no 3 or 3prime',flush=True)

# Construct A5 central projectors directly from original 60 history permutations.
idc=np.arange(64)
Pi1=np.zeros((64,64));Pi4=np.zeros((64,64));Pi5=np.zeros((64,64))
for perm in perms:
    k=order(perm)
    E=np.zeros((64,64))
    E[perm,idc]=1
    Pi1+=E/60.
    Pi4+=(4/60.)*{1:4,2:0,3:1,5:-1}[k]*E
    Pi5+=(5/60.)*{1:5,2:1,3:-1,5:0}[k]*E
for P,rank in ((Pi1,8),(Pi4,16),(Pi5,40)):
    assert np.linalg.norm(P-P.T)<2e-12
    assert np.linalg.norm(P@P-P)<3e-11
    assert np.linalg.matrix_rank(P,tol=1e-8)==rank
assert np.linalg.norm(Pi1+Pi4+Pi5-np.eye(64))<3e-11

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
    return lam,weights,var
for c in (0.1,1.0,2.0):
    lam,w,var=reduce_c(c)
    print('c=',c,'FOUR native poles:',np.array2string(lam,precision=12),
          'nonfitted weights:',np.array2string(w,precision=12),
          'variance',var,flush=True)
print('Q115 ORIGINAL A5 FOUR-POLE SOURCE RESOLVENT: PASS',flush=True)
print('Physical action c and gauge/mass observable selection still OPEN.',flush=True)
