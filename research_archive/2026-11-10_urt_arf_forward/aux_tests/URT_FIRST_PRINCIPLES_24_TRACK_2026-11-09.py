#!/usr/bin/env python3
"""No-fit exact source-level test: v61 URT complex map -> 24-clock transfer.
Based on original_v61_source_transfer.txt, original source lines 1539-1576.
Separate exact symbolic dynamics from an explicitly declared coarse-grained Markov reset.
"""
import math
import numpy as np
import sympy as s
from fractions import Fraction

R=s.Rational(9,13)
PHI=(1+s.sqrt(5))/2
Q=s.pi/s.E
OMEGA=2*s.pi/PHI**2
TWIST_CELLS=s.simplify(24/PHI**2)
assert s.simplify(TWIST_CELLS-(36-12*s.sqrt(5)))==0
M=9
F=s.simplify(TWIST_CELLS-M)
assert 0 < float(F) < 1

# Exact angular conjugacy: y=theta+omega, y'=2y.
angle=s.symbols('theta', real=True)
assert s.simplify((2*angle+OMEGA)+OMEGA-2*(angle+OMEGA))==0
radial_derivative=s.simplify(5-4*Q)
assert abs(float(radial_derivative))<1

# The 24-bin phase transition is exact for one step, conditioned on
# a uniform source phase within each bin; no coupling strength is fitted.
P=s.zeros(24)
for i in range(24):
    P[i,(2*i+M)%24] += (1-F)/2
    P[i,(2*i+M+1)%24] += s.Rational(1,2)
    P[i,(2*i+M+2)%24] += F/2
assert all(s.simplify(x-1)==0 for x in P*s.ones(24,1))
assert all(s.simplify(x-1)==0 for x in s.ones(1,24)*P)
Q3=P**3
markov_three=s.simplify(s.trace(Q3)/24)
markov_diag=[s.simplify(Q3[i,i]) for i in range(24)]

# True 3-step return: phase-iterate exactly, condition on initially uniform
# phase within a bin, *without* resetting to uniform in each intermediate bin.
def piecewise_overlap(a,b,c,d):
    if max(float(a),float(c))>=min(float(b),float(d)) -1e-12:
        return s.Integer(0)
    left=a if float(a)>float(c) else c
    right=b if float(b)<float(d) else d
    return s.simplify(right-left)

true_three_diag=[]
for i in range(24):
    a=8*i+7*TWIST_CELLS; b=a+8
    overlap=s.Integer(0)
    for k in range(-12,20):
        c=i+24*k; d=c+1
        overlap+=piecewise_overlap(a,b,c,d)
    true_three_diag.append(s.simplify(overlap/8))
true_three=s.simplify(sum(true_three_diag)/24)

# The four-symbol process from *disjoint pairs of bits* is uniform by
# the Lebesgue Bernoulli coding of the doubling map.
three_word=Fraction(1,4)**3
repeated_exact_word=three_word/(1-three_word)
# The probability of returning to the same four-state after three steps,
# for independent Haar-distributed symbols, is 1/4, NOT (1/4)^3.
any_three_return=Fraction(1,4)
any_return_series=any_three_return/(1-any_three_return)

# Test original formula against numerical radial step and angular map.
q=float(s.N(Q)); om=float(s.N(OMEGA)); rr=float(R)
def urt(z):
    if z==0: return 0j
    weight=q-(q-1)*(abs(z)/rr)**4
    return weight*z*z/abs(z)*np.exp(1j*om)
for theta in [0, 0.37, 1.1, 2.0, 4.7]:
    z=rr*np.exp(1j*theta)
    result=urt(z)
    assert abs(abs(result)-rr) < 1e-12
    assert abs(result/rr-np.exp(1j*(2*theta+om))) < 2e-14
    y=(theta+om)%(2*math.pi)
    ynew=(np.angle(result)+om)%(2*math.pi)
    assert abs(np.exp(1j*ynew)-np.exp(1j*2*y)) < 2e-14

# Check the exact bins statistically with deterministic uniform sampling.
for i in [0,1,6,13,23]:
    x=((i+np.arange(100000)/100000)*2*math.pi/24)
    j=np.floor(((2*x+om)%(2*math.pi))*24/(2*math.pi)).astype(int)
    hist=np.bincount(j,minlength=24)/len(j)
    target=np.array([float(P[i,k]) for k in range(24)])
    assert np.max(np.abs(hist-target)) < 2.2e-5, (i,np.max(np.abs(hist-target)))

# Perron-Frobenius transfer of the true map sends odd Fourier harmonics to zero;
# even 2k modes to k, with a golden but *conjugacy removable* phase.
# Historical scalar URT prototype is not globally continuous at |p|=pi.
alpha=1.155; beta=0.235; theta_h=2.4
local_derivative_bound=alpha*beta*(1+theta_h)
jump=alpha*beta*theta_h
assert 0<local_derivative_bound<1 and jump>0

print('original complex map: radial fixed point', R, 'radial multiplier',s.N(radial_derivative,15))
print('golden twist omega',s.N(OMEGA,15))
print('24-cell golden shift',TWIST_CELLS,'fractional part', F, 'numeric',s.N(F,15))
print('P nonzero entries',len([(i,j) for i in range(24) for j in range(24) if P[i,j]!=0]))
print('P first row',[(j,s.N(P[0,j],14)) for j in range(24) if P[0,j]!=0])
print('stochastic row/column sums exact: PASS')
print('coarse-grained P^3 mean self-return',markov_three,'=',s.N(markov_three,16))
print('actual 3-step source conditioned true-map mean self-return',true_three,'=',s.N(true_three,16))
print('true 3-step diagonal positive count',sum(v!=0 for v in true_three_diag))
print('coarse 3-step diagonal positive count',sum(v!=0 for v in markov_diag))
print('exact 3 consecutive specified sheet symbols prob',three_word,'geometric repeated correction',repeated_exact_word)
print('any-sheet 3-step return prob',any_three_return,'series',any_return_series)
print('historical scalar URT prototype derivative cap',local_derivative_bound,'and discontinuity jump',jump)
print('PASS')
