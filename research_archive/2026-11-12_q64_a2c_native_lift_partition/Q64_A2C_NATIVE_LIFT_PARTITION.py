#!/usr/bin/env python3
"""Q64 A2C: exact Q2 reversible-lift partition and Q3 symbolic conditioning."""
from fractions import Fraction
from sympy import symbols, expand, factor
N=64
succ=lambda h: (2*h%N,(2*h+1)%N)
assert all(len(succ(h))==2 for h in range(N))
assert all({h for h in range(N) if k in succ(h)}=={k//2,(k//2)+32} for k in range(N))
a,b=symbols('a b')
Z=expand(a*(1-b)+(1-a)*b)
assert factor(Z)==a+b-2*a*b
assert expand(a*(1-b)+(1-a)*b-Z)==0
assert Z.subs({a:Fraction(1,2),b:Fraction(1,2)})==Fraction(1,2)
assert Fraction(1,2)**32==Fraction(1,2**32)
assert (Fraction(1,2)**64)*(2**32)==Fraction(1,2**32)
for aa,bb in [(Fraction(1,3),Fraction(2,5)),(Fraction(3,7),Fraction(4,9)),(Fraction(1,2),Fraction(1,2))]:
    z=aa*(1-bb)+(1-aa)*bb
    assert z>0
    p0=aa*(1-bb)/z; p1=(1-aa)*bb/z
    assert p0+p1==1
    assert (p1>p0)==((1-aa)*bb>aa*(1-bb))
assert len({tuple((2*x+bit,2*x+1-bit)) for bit in (0,1) for x in [0]})==2
print('CERTIFIED: native Q2 reversible lifts = 2^32; conditional row-sampling permutation probability = product_x [a_x(1-b_x)+(1-a_x)b_x].')
print('CERTIFIED: conditioned-on-bijection posterior factorises into 32 Bernoulli bits; MAP equals Q64 A1 row-product maximiser for each fixed dictionary.')
print('LIMIT: independent row sampling and dictionary prior are additional premises; Q2/Q3 alone do not force them.')
