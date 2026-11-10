#!/usr/bin/env python3
"""Exact no-fit URT recurrence gate and four-ARF prediction test.

This deliberately uses NO historical four-ARF coefficient as an input.
It compares multiple explicitly declared history transitions and computes
which physical information is and is not fixed by the primitive doubling.
Source residues from independent exact Q(sqrt5) proof (2026-11-09).
"""
from fractions import Fraction as F
from math import sqrt, pi, e, log
from collections import Counter
import numpy as np
import sympy as s

N=64
Q=np.zeros((N,N),dtype=float)
for h in range(N):
    Q[h,(2*h)%N] += .5
    Q[h,(2*h+1)%N] += .5
assert np.allclose(Q@np.ones(N),np.ones(N))
assert np.allclose(Q.T@np.ones(N),np.ones(N))
for n in range(7):
    rank=np.linalg.matrix_rank(np.linalg.matrix_power(Q,n),tol=1e-9)
    assert rank==2**(6-n), (n,rank)
assert np.max(np.abs(np.linalg.matrix_power(Q,6)-np.ones((N,N))/N)) < 1e-14
# e^{tL} is invertible for any finite matrix L (with inverse e^{-tL}).
# Therefore the exact symbolic six-bit shift Q is not exp(tL) for finite L.
assert np.linalg.matrix_rank(Q)<N

phi=(1+s.sqrt(5))/2
S=s.Integer(18)+s.Rational(36,5)*s.sqrt(5)
# Qbar, isotropic six-bit chronology: exact Q(sqrt5) source residues.
r3=[(S,s.Rational(3,20)),(S,s.Rational(1,20))]
r5=[(s.Rational(9,2),s.Rational(1,15)),(s.Rational(5,2),-s.Rational(1,20))]

def response(poles,n=1):
    return s.simplify(sum(w/(1-lam**n) for w,lam in poles))

for name,poles in [('hidden3',r3),('hidden5',r5)]:
    z=response(poles,1)
    coarse=response(poles,2)
    assert s.simplify(z-coarse)!=0
    print(name, 'one native isotropised step:',z, float(z.evalf(20)))
    print(name, 'two consecutive URT steps viewed as one:',coarse,float(coarse.evalf(20)))
    print(name, 'difference:',s.factor(z-coarse),float((z-coarse).evalf(20)))

# The source unweighted covariances (not fitted ARF parameters).
raw3=s.simplify(sum(w for w,_ in r3))
raw5=s.simplify(sum(w for w,_ in r5))
print('source covariance total 3/5',raw3,raw5)
# Frozen rail bandwidth is independent and not spontaneously produced by Qbar.
delta=s.Rational(3,20)-80*s.pi/(1053*phi)
p5_float=float(delta.evalf(35))**2/(1+float(delta.evalf(35))**2)
source_p5=float((raw5/(raw3+raw5)).evalf(30))
weighted_p5=float((response(r5)/(response(r3)+response(r5))).evalf(30))
print('native source p5',source_p5)
print('A5-coupled feedback source p5',weighted_p5)
print('separately frozen KMS p5',p5_float)
assert abs(weighted_p5-p5_float)>0.01
# In bare Gaussian November 7 K: 18 on hidden3 and 16 on hidden5.
# Coupling to a source and solving K y=h contributes h^T K^-1 h.
g3=s.simplify(raw3/18)
g5=s.simplify(raw5/16)
print('native Gaussian response ratio hidden5/hidden3',float((g5/g3).evalf(30)))
# KMS directly from K would enhance lower-energy 5 vs 3 by e^{+2eta}.
print('ordinary Gaussian-K thermal5/3',float((delta**-2).evalf(30)))
print('complementary-(18-K) thermal5/3',float((delta**2).evalf(30)))
# A positive rail filter exp[-eta(18-K)] is a NEW cost orientation; 
# it is not the energy function in the November source-loaded Gaussian.
assert s.simplify(delta**-2-delta**2)!=0
print('PASS: finite-step URT exact; response nonuniqueness; native-vs-selected KMS polarity')
