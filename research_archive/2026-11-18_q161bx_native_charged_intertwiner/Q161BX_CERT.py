#!/usr/bin/env python3
"""Exact native Q104 sigma1 -> URT 24-clock intertwiner obstruction."""
from collections import Counter
from fractions import Fraction
from math import gcd
import sympy as s
N=64; beta=(1<<32)-1
sigma=tuple(((2*h)%N)|(((h>>5)&1)^((beta>>(h&31))&1)) for h in range(N))
assert sorted(sigma)==list(range(N))
seen=set(); lengths=[]
for h in range(N):
    if h in seen: continue
    x=h; n=0
    while x not in seen:
        seen.add(x);n+=1;x=sigma[x]
    assert x==h
    lengths.append(n)
assert Counter(lengths)==Counter({12:5,4:1})
assert sum(gcd(n,24) for n in lengths)==64
assert all(24%n==0 for n in lengths)
phi=(1+s.sqrt(5))/2
omega=s.simplify(phi**-2)
assert s.simplify(omega-(3-s.sqrt(5))/2)==0
charges=[Fraction(-1),Fraction(-2,3),Fraction(-1,3),Fraction(0),Fraction(1,3),Fraction(2,3),Fraction(1)]
for q in charges:
    z=s.simplify(24*s.Rational(q.numerator,q.denominator)*omega)
    if q:
        assert z.is_irrational is True
    else:
        assert z==0
print('Q161bx EXACT PASS: native sigma1 cycles 12x5 + 4x1; neutral Hom dimension 64; all six nonzero Q96 rational charges Hom dimension 0')
print('Scope: direct unmodified 64-history to twisted 24-clock intertwiner only; source-dependent 190/H64 seam and physical Ward OPEN')
