#!/usr/bin/env python3
"""No-fit A5 Reynolds projection of the original six-bit URT chronology.

IMPORTANT: This is a uniquely defined *ensemble-level candidate* under the
additional Frobenius-minimal A5-equivariance requirement. It is NOT the native
one-step dyadic Q and not a derived physical ARF source-to-pole map.

Requires the accompanying independent native A5/H64 certificate, from which
it reads the verified 60 permutations of 64 signed histories.
"""
from pathlib import Path
from contextlib import redirect_stdout
from itertools import combinations
import io,runpy
import numpy as np
import sympy as sp

with redirect_stdout(io.StringIO()):
    native=runpy.run_path(str(Path(__file__).parent/'URT_H64_A5_CHRONOLOGY_MULTIPLICITIES_2026_11_10.py'))
G=native['G'];p64=native['perms64'];H64=native['H64']
W=native['W'];weights=native['weights'];clidx=native['clidx']
assert len(G)==60 and len(p64)==60
Q2=np.zeros((64,64),dtype=np.int64)
for h in range(64):
    Q2[h,2*h%64]=1;Q2[h,(2*h+1)%64]=1
assert np.all(Q2.sum(axis=0)==2) and np.all(Q2.sum(axis=1)==2)

# R(Q) = 1/60 sum_g P_g Q P_g^{-1} = M/120.
M=np.zeros((64,64),dtype=np.int64)
M4=np.zeros((64,64),dtype=np.int64)
for g,p in zip(G,p64):
    chi4=[4,0,1,-1,-1][clidx[g]]
    for h,k in enumerate(p):
        M4[k,h]+=chi4
        for nxt in (2*h%64,(2*h+1)%64):M[k,p[nxt]]+=1
assert np.all(M>=0)
assert np.all(M.sum(axis=0)==120) and np.all(M.sum(axis=1)==120)
assert np.array_equal(M4@M4,15*M4)
assert np.trace(M4)==240
assert np.array_equal(M@H64,H64@M)
for p in p64:
    assert np.array_equal(M[np.ix_(p,p)],M)

# Exact Hilbert-Schmidt orthogonal-projection certificate. The group average
# is the unique Frobenius-nearest A5-equivariant matrix to Q. As it is itself
# Markov, it is also nearest within the equivariant Markov subset.
D=60*Q2-M
normQ=sp.Rational(int(np.sum(Q2*Q2)),4)
normR=sp.Rational(int(np.sum(M*M)),120**2)
dist=sp.Rational(int(np.sum(D*D)),120**2)
assert (normQ,normR,dist)==(sp.Integer(32),sp.Rational(23,10),sp.Rational(297,10))
assert normQ==normR+dist
# Exact character polynomial of the integer transfer M=120 R(Q).
z=sp.symbols('z')
charpoly=sp.factor(sp.Matrix(M).charpoly(z).as_expr())
expected=(z**9*(z-120)*(z-16)**6*(z-8)**6*(z+2)**4*(z+4)**4*
          (z+8)**5*(z+16)**5*(z*z-2000)**3*(z*z-80)**9)
assert sp.expand(charpoly-expected)==0

# Exact 24-clock-independent source quartet transfer blocks. Project the
# A5 quartet by P4=M4/15 and native history energy by Walsh weight. On each
# energy the projector has rank 8 = two A5 quartets.
quartet={}
for energy,ks in ((16,(2,4)),(18,(3,))):
    ids=[i for i in range(64) if weights[i] in ks]
    E=W[:,ids]@W[:,ids].T # 64 times the energy projector
    Pnum=E@M4            # 64*15 times the joint projector
    assert np.array_equal(Pnum@Pnum,64*15*Pnum)
    assert int(np.trace(Pnum))==64*15*8
    t1=sp.Rational(int(np.trace(Pnum@M)),64*15*120)
    t2=sp.Rational(int(np.trace(Pnum@M@M)),64*15*120**2)
    # Each eigenvalue occurs four times (the quartet dimension).
    S=t1/4; SS=t2/4; prod=sp.simplify((S*S-SS)/2)
    x=sp.symbols('x')
    poly=sp.factor(x*x-S*x+prod)
    quartet[energy]=poly
    if energy==16:
        assert sp.expand(poly-(x+sp.Rational(1,30))*(x+sp.Rational(1,60)))==0
        assert np.any(Pnum@M@M)
    else:
        assert poly==x*x
        assert np.any(Pnum@M)
        assert not np.any(Pnum@M@M) # nonzero nilpotent on E18 quartet sector
    print('energy',energy,'two-quartet reduced characteristic',poly,'trace',t1,'trace squared',t2)

# The native primitive Q has Q^6=J/64. The equivariant Reynolds transfer
# does not retain this exact six-step memory erasure.
M6=np.linalg.matrix_power(M,6)
target=(120**6)//64
max_diff=sp.Rational(int(np.max(np.abs(M6-target))),120**6)
assert max_diff==sp.Rational(29461,116640000)
# An independent floating-point eigenvalue test of the exact char polynomial.
num=np.linalg.eigvals(M/120)
roots=[(0,9),(1,1),(sp.Rational(2,15),6),(sp.Rational(1,15),6),
       (-sp.Rational(1,60),4),(-sp.Rational(1,30),4),
       (-sp.Rational(1,15),5),(-sp.Rational(2,15),5),
       (sp.sqrt(5)/6,3),(-sp.sqrt(5)/6,3),
       (sp.sqrt(5)/30,9),(-sp.sqrt(5)/30,9)]
reference=sorted([float(v) for v,m in roots for _ in range(m)])
assert len(reference)==64
assert max(abs(a-b) for a,b in zip(sorted(num.real),reference))<1e-7
assert max(abs(num.imag))<1e-7
print('Reynolds R(Q)=M/120: nonnegative, doubly stochastic, A5-equivariant, commutes with H64: EXACT')
print('Hilbert-Schmidt squared norms: Q=',normQ,'R(Q)=',normR,'difference=',dist)
print('fraction of original squared transfer norm removed:',sp.simplify(dist/normQ))
print('exact integer charpoly(M):',charpoly)
print('largest nontrivial eigenvalue modulus:',sp.sqrt(5)/6,'~',float(sp.sqrt(5)/6))
print('six-step memory: Q^6=J/64, but R(Q)^6 differs from J/64 by exact max entry',max_diff)
print('PASS: unique Frobenius projection under added A5 criterion, not native Q and not physical ARF')
