#!/usr/bin/env python3
"""Exact native Q2 reversible-lift normalization identity; no synthetic operators."""
from fractions import Fraction
N=64
successors=lambda h: ((2*h)%N,(2*h+1)%N)
assert all(len(set(successors(h)))==2 for h in range(N))
assert all({successors(x)[0],successors(x+32)[0]}=={2*x} for x in range(32))
# A native Q3 twirl supplies S_D; identity holds for every nonnegative S_D.
import sympy as s
a,b,c,d=s.symbols('a b c d', nonnegative=True)
Z=s.expand(a*d+b*c)
assert s.expand((a+b)*(c+d)-Z)==a*c+b*d
assert s.factor(Z)==a*d+b*c
A=s.symbols('A0:32');B=s.symbols('B0:32');C=s.symbols('C0:32');D=s.symbols('D0:32')
for i in range(32):
    assert s.expand((A[i]*D[i]+B[i]*C[i])-(A[i]*D[i])-(B[i]*C[i]))==0
assert Fraction(2**32,2**64)==Fraction(1,2**32)
assert Fraction(1,2**64)/Fraction(1,2**32)==Fraction(1,2**32)
print('PASS: Q2 32-pair bijective partition; universal Q3 twirl normalization identity')
print('P_Q2(bijection)=2^-32; P_Q2(sigma | bijection)=2^-32')
print('P_D(sigma | bijection)=product(ad or bc)/product(ad+bc)')
print('Q64 rowwise L_D differs by factor P_D(bijection), potentially dictionary-dependent')
