#!/usr/bin/env python3
"""Cathedral golden-ratio alpha mechanism audit. No observed alpha used to
construct the scalar candidate. CODATA is an after-the-fact comparison."""
import sympy as s
import mpmath as mp
mp.mp.dps = 65
r5 = s.sqrt(5)
phi_exact = (1+r5)/2
spec = [(3-r5,3),(s.Integer(2),5),(s.Integer(3),4),(s.Integer(5),4),(3+r5,3)]
assert s.simplify((3+r5)/(3-r5)-phi_exact**4) == 0
green = s.simplify(sum(s.Integer(m)/lam for lam,m in spec))
assert green == s.Rational(137,15)
phi = (1+mp.sqrt(5))/2
delta = lambda x: mp.mpf(3)/20 - 80*mp.pi/(1053*x)
A, B = mp.mpf(17572)/1215, mp.mpf(9)/65
f = lambda x: 137+A*delta(x)-B*delta(x)**2
measured, sigma = mp.mpf("137.035999177"), mp.mpf("0.000000021")
old = 137+(80*mp.pi/(1053*phi))**2/mp.pi**2 +3/(64*phi)+1/(79*phi**2)
phi_fit = mp.findroot(lambda x: f(x)-measured,phi)
print("Golden-mode ratio: phi^4, exact")
print("Tr(L_dod^+)=",green,"and 15 Tr(L_dod^+)=137 exact")
print("phi =", mp.nstr(phi,40))
print("Delta(phi) =", mp.nstr(delta(phi),36))
print("historical scalar candidate =",mp.nstr(f(phi),37))
print("linear delta term =",mp.nstr(A*delta(phi),31))
print("quadratic delta term =",mp.nstr(B*delta(phi)**2,31))
print("offset in CODATA sigma =",mp.nstr((f(phi)-measured)/sigma,16))
print("d(alpha inverse)/dphi =",mp.nstr(mp.diff(f,phi),25))
print("CODATA-inferred phi (conditioned on historical formula) =",mp.nstr(phi_fit,38))
print("inferred phi minus true phi =",mp.nstr(phi_fit-phi,28))
print("candidate with phi=8/5 =",mp.nstr(f(mp.mpf(8)/5),24))
print("alternative earlier golden formula =",mp.nstr(old,25))
print("earlier formula offset in CODATA sigma =",mp.nstr((old-measured)/sigma,17))
assert abs((f(phi)-measured)/sigma)<1
assert abs((old-measured)/sigma)>500
print("PASS")
