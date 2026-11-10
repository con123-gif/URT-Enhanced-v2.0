#!/usr/bin/env python3
"""High-precision Fourier evaluation of the 24-periodic URT source's
original Gaussian action after Schur elimination, using algebraic
lag-coefficient candidates checked independently against unmodified source.
No four ARF historical numbers used.
"""
from pathlib import Path
import contextlib,io,runpy
import numpy as np, sympy as sp, mpmath as mp
HERE=Path(__file__).resolve().parent
with contextlib.redirect_stdout(io.StringIO()):
    source=runpy.run_path(str(HERE/'URT_NATIVE_24_PERIODIC_SOURCE_SCHUR_2026-11-09.py'))
C3=[36+72*sp.sqrt(5)/5, sp.Rational(18,5)+36*sp.sqrt(5)/25, sp.Rational(27,25)+9*sp.sqrt(5)/25,sp.Rational(36,25)+18*sp.sqrt(5)/25,sp.S(0)]
C5=[sp.S(7),sp.Rational(7,40),-sp.Rational(61,120),-sp.Rational(1,24),-sp.Rational(1,6)]
for tag, arr in [('3',C3),('5',C5)]:
    for k,(exact, numeric) in enumerate(zip(arr,source['cs'][tag])):
        assert abs(float(exact)-numeric)<2e-12,(tag,k,exact,numeric)
mp.mp.dps=60
PHI=(1+mp.sqrt(5))/2
omega=2*mp.pi/PHI**2
r=mp.pi/mp.e
Delta=mp.mpf(3)/20-(80*mp.pi)/(1053*PHI)
cs={tag:list(map(lambda v:mp.mpf(str(sp.N(v,70))),vs)) for tag,vs in [('3',C3),('5',C5)]}
def response(angle):
    # exact 24-period source spectral power after six-bit digit averaging
    total=mp.mpf(0)
    parts=[]
    for tag,E,factor in [('3',18,1),('5',16,Delta**2)]:
        c=cs[tag];series=mp.mpf(0)
        for m in range(24):
            a=2*mp.pi*m/24
            sm=c[0]+2*sum(c[k]*mp.cos(k*a) for k in range(1,5))
            den=E+r*r*(2-2*mp.cos(2*angle-a))
            series+=sm/den
        val=6*c[0]-series/2
        total+=factor*val
        parts.append((tag,val,factor*val))
    return total,parts
v,parts=response(omega)
# Differentiation: exact analytic sum of 24 Fourier modes.
def phase_current(angle):
    out=mp.mpf(0)
    for tag,E,factor in [('3',18,1),('5',16,Delta**2)]:
        c=cs[tag]
        for m in range(24):
            a=2*mp.pi*m/24
            sm=c[0]+2*sum(c[k]*mp.cos(k*a) for k in range(1,5))
            den=E+r*r*(2-2*mp.cos(2*angle-a))
            out+=mp.mpf('0.5')*factor*sm*(4*r*r*mp.sin(2*angle-a))/(den*den)
    return out
j=phase_current(omega)
assert abs(mp.diff(lambda t:response(t)[0],omega)-j)<mp.mpf('1e-51')
print('Closed form chronological C3',list(map(str,C3)))
print('Closed form chronological C5',list(map(str,C5)))
print('URT phase',mp.nstr(omega,54))
print('Delta',mp.nstr(Delta,54))
print('24-periodic original action V=',mp.nstr(v,54))
for tag,raw,weighted in parts:print(' ',tag, 'part=',mp.nstr(raw,50),'weighted=',mp.nstr(weighted,40))
print('clock derivative (declared phase source) J=',mp.nstr(j,54))
print('all algebraic lag candidates checked against original sources: PASS')
print('derivative high precision: PASS')
