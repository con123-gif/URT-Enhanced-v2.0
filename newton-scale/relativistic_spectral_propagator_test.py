#!/usr/bin/env python3
"""Independent Newton-Platonic generalized free scalar spacetime bridge.

Only exact rational eigenvalues from the separate five-cube projector proof
are imported as mathematical inputs. KG spacetime masses mu_n=mu0*s^(-n)
are an additional PHYSICAL HYPOTHESIS; units mu0=1 here.
"""
from math import sqrt, log, exp
from fractions import Fraction
import numpy as np

s=(3-sqrt(5))/2
bands=[(Fraction(1,64),8),(Fraction(1,36),6),(Fraction(8,125),5)]
R=Fraction(27,160)*np.eye(5,dtype=object)+Fraction(1,32)*np.ones((5,5),dtype=object)
assert sum(R[i,i] for i in range(5))==1
assert all(np.linalg.eigvalsh(np.array(R,dtype=float))>0)
def W(n):return sum(mult*float(lam)**n for lam,mult in bands)
def moment(p):return sum(mult/(1-float(lam)/s**p) for lam,mult in bands)
S0=moment(0)
S2=moment(2)
assert abs(S0-float(Fraction(26809,1365)))<1e-12
assert abs(S2-25.27781233823037)<1e-12
assert abs(W(1)-float(Fraction(367,600)))<1e-12
assert max(float(l) for l,_ in bands)<s*s
def component(lam,Q):
    return sum(lam**n*s**(2*n)/(1+Q*Q*s**(2*n)) for n in range(170))
def euclidean(Q):
    return sum(mult*component(float(lam),Q) for lam,mult in bands)
for lam,_ in bands:
    lam=float(lam)
    for Q in (0,.2,1,5,80):
        # An exact discrete-scale functional equation
        assert abs(component(lam,Q) -
             (1/(1+Q*Q)+lam*s*s*component(lam,s*Q)))<1e-12
for Q in (.1,1,10,100,1000):
    assert 0 < Q*Q*euclidean(Q) < S0
assert abs(1e6*euclidean(1000)-S0)<.0001
# Time-reflection positivity at several spatial momenta:
for k in (0,1,10):
    times=np.array([.1,.25,.6,1.])
    C=np.zeros((len(times),len(times)))
    for n in range(35):
        m=s**(-n);o=sqrt(k*k+m*m)
        C+=W(n)*np.exp(-o*(times[:,None]+times[None,:]))/(2*o)
    assert min(np.linalg.eigvalsh(C))>-1e-12
# The static source-source potential retains its short-distance 1/r.
def static(r):
    return sum(W(n)*exp(-r*s**(-n)) for n in range(35)
               if r*s**(-n)<700)
assert abs(static(1e-8)-S0)<1e-6
assert max(float(l) for l,_ in bands)>s**4
print("PASS: Newton-Platonic positive scalar Kallen-Lehmann spectrum")
print("Mass ratio phi^2",1/s)
print("Pole spectral strengths n=0,1,2:",[(n,W(n),W(n)/S0) for n in range(3)])
print("Euclidean high Q: D(Q)=S0/Q²-mu0²*S2/Q⁴+o(Q^-4)")
print("S0 =",S0,"S2 =",S2)
print("Model causal/reflection-positive; physical Planck gravity NOT derived")


# Subleading fractional-power UV residue: analytically positive formula.
alpha=-log(float(Fraction(8,125)))/log(1/s)
def UV_remainder(Q):
    return sum(W(n)*s**(-4*n)/(Q**4*(Q**2+s**(-2*n)))
               for n in range(120))
Q=1e5
expected_ratio=s**(2+alpha)
ratio=UV_remainder(Q/s)/UV_remainder(Q)
assert abs(ratio-expected_ratio)<2e-5
print("Newton UV correction exponent 2+alpha =",2+alpha)
print("Log-periodic step ratio measured / exact =",ratio,expected_ratio)
