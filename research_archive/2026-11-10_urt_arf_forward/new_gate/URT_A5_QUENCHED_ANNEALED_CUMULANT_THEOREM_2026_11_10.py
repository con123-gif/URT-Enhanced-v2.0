#!/usr/bin/env python3
"""Exact A5 five-vacuum mixing theorem; no physical ARF claims.

Inputs: five second cumulant rates in archived
URT_A5_SYMMETRIC_THIRD_CUMULANT_THEOREM_2026_11_10.md.
Exact fixed-vacuum mixture fourth cumulant has n^2 leading term.
"""
from fractions import Fraction as F
from itertools import product
import json

v=(F(67,48),F(33,16),F(25,24),F(33,16),F(5,6))
mean=lambda xs:sum(xs,F(0))/len(xs)
mu=mean(v);mu2=mean([x*x for x in v])
var=mu2-mu*mu;coef=3*var
assert mu==F(71,48)
assert var==F(1493,5760)
assert coef==F(1493,1920)
assert max(v)==F(33,16)

for h in range(64):
    states={h:F(1)}
    for _ in range(6):
        nxt={}
        for x,p in states.items():
            for bit in (0,1):
                y=(2*x+bit)%64
                nxt[y]=nxt.get(y,F(0))+p/2
        states=nxt
    assert len(states)==64 and all(p==F(1,64) for p in states.values())

# Independent finite-n stress model:
# epsilon_t=(-1)^(b_t XOR b_{t+1}) are iid Rademacher.
# In fixed vacuum i, X_t=sqrt(v_i)*epsilon_t, so
# E[S_n^2|i]=n*v_i; E[S_n^4|i]=(3*n^2-2*n)*v_i^2.
for n in (1,2,3,7,24,64,1000):
    m2=n*mu;m4=(3*n*n-2*n)*mu2
    k4=m4-3*m2*m2
    assert k4==3*n*n*var-2*n*mu2
    assert k4/n**2==coef-2*mu2/n

for n in range(1,7):
    m2=F(0);m4=F(0)
    for a in v:
        moment2=sum(F(sum(bits)**2) for bits in product((-1,1),repeat=n))/2**n
        moment4=sum(F(sum(bits)**4) for bits in product((-1,1),repeat=n))/2**n
        m2+=a*moment2/5
        m4+=a*a*moment4/5
    assert m2==n*mu
    assert m4-3*m2*m2==3*n*n*var-2*n*mu2

print(json.dumps({
    'status':'exact_pass',
    'scope':'fixed-vacuum mixture, conditional on archived exact per-vacuum URT K2 rates',
    'source':'five A4 hidden-5 singlet branches of native 64-history URT',
    'rates':[str(x) for x in v],
    'quenched_mean_K2':str(mu),
    'variance_of_branch_K2':str(var),
    'universal_mixture_kappa4_leading_n2':str(coef),
    'finite_n_iid_stress_kappa4':'(1493/1920)*n^2 - 2*n*('+str(mu2)+')',
    'annealed_SCGF_quadratic_coefficient':'(1/2)*(33/16) near t=0, not (1/2)*(71/48)',
    'orientation_sign_dependence':'none for fourth-cumulant anomaly',
    'physical_ARFs':'not derived',
    'next_step':'derive a single ergodic A5-compatible history/source law or prove a physical observable uses quenched branch averaging'
},indent=2))
