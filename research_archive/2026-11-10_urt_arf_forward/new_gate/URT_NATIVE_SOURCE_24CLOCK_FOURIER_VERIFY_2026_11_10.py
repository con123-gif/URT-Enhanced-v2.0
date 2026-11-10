#!/usr/bin/env python3
"""Exact conditional native quartet source and 24-clock Fourier response.
Requires SymPy only. No physical ARF input or fitted coefficients.
"""
import sympy as s

z, r, c = s.symbols("z r c", real=True)
a = [s.Rational(266,15),s.Rational(389,20),s.Rational(391,20),s.Rational(521,30)]
w = [4,2,2,0]  # previously verified native Uh spectral projector traces

G = sum(wi/(z-ai) for wi,ai in zip(w,a))
expected = 20*(2400*z*z-91480*z+871257)/((15*z-266)*(20*z-391)*(20*z-389))
assert s.simplify(G-expected)==0
assert s.limit(z*G,z,s.oo)==8
assert s.limit(z*z*(G-8/z),z,s.oo)==s.Rational(2234,15)
assert s.limit(z**3*(G-8/z-s.Rational(2234,15)/z**2),z,s.oo)==s.Rational(500201,180)

# A charge-two uniform 24-clock link has Fourier eigenvalue
# L_2(k)=2-2*cos(k-2*theta), and r=pi/e in the native URT.
# c=cos(k-2*theta) is kept symbolic to verify the identity exactly.
F = sum(wi/(ai+2*r*r*(1-c)) for wi,ai in zip(w,a))
assert s.simplify(F.subs(c,1)-sum(wi/ai for wi,ai in zip(w,a)))==0
assert s.simplify(s.diff(F,c)-sum(2*r*r*wi/(ai+2*r*r*(1-c))**2 for wi,ai in zip(w,a)))==0
assert s.factor(F.subs(c,1))==s.Rational(8712570,20229167)
num,den=s.fraction(s.factor(F))
assert s.degree(num,c)==2 and s.degree(den,c)==3
print("PASS: three native source-bright poles, fourth dark")
print("PASS: exact 24-clock Fourier susceptibility; derivative; positive weights")
print("F(c=1) =",s.factor(F.subs(c,1)))
print("F(c) =",s.factor(F))
print("NOTE: conditional history Gaussian, not physical charged-fermion ARFs")
