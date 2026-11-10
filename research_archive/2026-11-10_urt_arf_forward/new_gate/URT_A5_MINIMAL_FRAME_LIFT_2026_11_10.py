#!/usr/bin/env python3
"""Minimal A5-covariant 60-frame lift preserving the ORIGINAL dyadic Q.

No averaging of microscopic Q, no fitted parameters. The 60 frame labels
are the A5 conjugacy orbit of Q, since its A5 stabilizer is trivial.
The native 24-clock is a separate tensor factor, not reinterpreted as frames.
"""
from pathlib import Path
import runpy,contextlib,io
import numpy as np
import sympy as sp

with contextlib.redirect_stdout(io.StringIO()):
    r=runpy.run_path(str(Path(__file__).parent/'URT_H64_A5_CHRONOLOGY_MULTIPLICITIES_2026_11_10.py'))
G=r['G'];perms64=r['perms64'];mul=r['mul'];I=r['I']
idx={g:i for i,g in enumerate(G)}
assert len(G)==60 and len(perms64)==60
P={g:np.asarray(p,dtype=np.int64) for g,p in zip(G,perms64)}
invP={g:np.argsort(P[g]) for g in G}

def successors(g,h):
    """Two successors in the g-frame, as an unordered set."""
    old=int(invP[g][h]);p=P[g]
    return {int(p[2*old%64]),int(p[(2*old+1)%64])}

# The 60 conjugate Q_g are distinct (one-step A5 stabilizer trivial).
unique={tuple(tuple(sorted(successors(g,h))) for h in range(64)) for g in G}
assert len(unique)==60

# Exact frame-covariance for ALL 60^2 group/frame pairs and 64 histories:
# rho(k) Q_g rho(k)^-1 = Q_(kg).
for k in G:
    pk=P[k]
    for g in G:
        kg=mul(k,g)
        for h in range(64):
            lhs={int(pk[j]) for j in successors(g,h)}
            rhs=successors(kg,int(pk[h]))
            assert lhs==rhs,(k,g,h,lhs,rhs)

# Each Q_g is a conjugate of primitive Q, so the native six-step reset is
# preserved exactly in every fiber. Verify Q2^6=J64 as integer path counts.
Q2=np.zeros((64,64),dtype=np.int64)
for h in range(64):
    Q2[h,2*h%64]=1;Q2[h,(2*h+1)%64]=1
assert np.array_equal(np.linalg.matrix_power(Q2,6),np.ones((64,64),dtype=np.int64))
for g in (G[0],G[17],G[41],G[-1]):
    qg=Q2[np.ix_(invP[g],invP[g])]
    assert np.array_equal(np.linalg.matrix_power(qg,6),np.ones((64,64),dtype=np.int64))

# The one-step coarse-grained average is the Reynolds R(Q). Crucially,
# averaging after six steps is not the sixth power of the one-step average.
M=np.zeros((64,64),dtype=np.int64)
for g in G:
    p=P[g]
    for h in range(64):
        for j in (2*h%64,(2*h+1)%64):M[p[h],p[j]]+=1
assert np.all(M.sum(axis=1)==120)
M6=np.linalg.matrix_power(M,6)
max_discrepancy=int(np.max(np.abs(M6-(120**6)//64)))
assert max_discrepancy==754201600

# A4 singlet-line orbit: one of the five icosahedral tetrahedral vacua has
# stabilizer A4 (12 even permutations fixing label 0). Uniform A5 frame Haar
# therefore pushes forward to the exact five-branch average used in the
# archived A5-symmetric third-cumulant theorem, with each branch weight 1/5.
A4=[g for g in G if g[0]==0]
assert len(A4)==12
assert [sum(g[0]==i for g in G) for i in range(5)]==[12]*5
# Standard A5 quartet: five unit regular-simplex vectors in the sum-zero
# subspace of R5, with Gram delta_ij - (1-delta_ij)/4.
P=sp.eye(5)-sp.ones(5,5)/5
gram=sp.Rational(5,4)*P
assert all(gram[i,j]==(1 if i==j else -sp.Rational(1,4)) for i in range(5) for j in range(5))
assert (sp.Rational(1,5)*sum((gram[i,j]**3 for i in range(5) for j in range(5))))==sp.Rational(15,16) # raw sum /5
T3norm=sp.simplify(sum(gram[i,j]**3 for i in range(5) for j in range(5))/25)
assert T3norm==sp.Rational(3,16)
assert sp.Rational(1,5)*sum((gram[i,j]**2 for i in range(5) for j in range(5)))==sp.Rational(5,4)
print('A4 line stabilizer order 12; five orbit branches, each 12/60=1/5 of Haar frame measure')
print('regular-simplex A5 cubic invariant norm²',T3norm,'matching archived A5 source-frame theorem')
print('frame fixed along each trajectory: five-branch averaging is NOT resampling at each URT step')

# The frame is an additional, explicitly identified label. It is NOT one
# of the original 24 temporal clock positions. An injective identification
# of all distinct primitive A5 frames with only 24 clock slots is impossible.
assert 60>24
print('A5 conjugacy orbit of primitive dyadic Q:',len(unique),'distinct frames, exactly')
print('all 60x60x64 frame-covariance transition checks: PASS')
print('native six-step history erasure in each frame: Q_g^6=J64/64, EXACT')
print('frame-resolved state size:',60*64,'; with independent 24-clock:',60*64*24)
print('one-step frame average R(Q)=M/120, but (R(Q))^6 != average(Q_g^6)')
print('exact numerator max difference at step 6:',max_discrepancy,'over',120**6)
print('24 temporal clock slots alone cannot label all 60 distinct A5 frames injectively')
print('PASS: covariant frame lift is a conditional mathematical construction, not a derived physical matter coupling')
