"""Exact positive-URT-scale-ladder radial kernel: a conditional construction.

The finite 3' transfer eigenvalue is *derived* from the centred-icosahedral
Laplacian. The identification of transfer time with r/length and the use of
its second radial derivative to define an effective density remain assumptions.
No physical stress-energy, gravity coupling, baryonic normalization or lensing
observable is claimed.
"""
from __future__ import annotations
import mpmath as mp
mp.mp.dps=65
phi=(1+mp.sqrt(5))/2
kappa=mp.pi/mp.e
a=mp.log(kappa)
lam=6+mp.sqrt(5)
w=2*mp.pi/a
amp=2*abs(mp.gamma(2+1j*w))

def ladder(r):
    # alpha=lam*r/kappa^n; centred at the contributing log scale
    x=mp.log(lam*r)/a
    ns=range(int(mp.floor(x))-300,int(mp.ceil(x))+300)
    return mp.fsum(a*(lam*mp.exp(-a*n))**2 * mp.exp(-lam*r*mp.exp(-a*n)) for n in ns)

for r in [mp.mpf('0.0001'),mp.mpf('1'),mp.mpf('5'),mp.mpf('100'),mp.mpf('1e7')]:
    rr=r*r*ladder(r)
    assert abs(rr-1) < mp.mpf('1e-25')
    print('r=',mp.nstr(r,8),'r^2 K(r)=',mp.nstr(rr,33),'deviation=',mp.nstr(rr-1,12))
print('URT scale kappa=',mp.nstr(kappa,25))
print('a=ln kappa=',mp.nstr(a,25))
print('L13 hidden eigenvalue=',mp.nstr(lam,25))
print('First relative log-periodic harmonic <=',mp.nstr(amp,25))
print('Exact averaged radial profile 1/r^2; amplitude and physical identification UNRESOLVED')
print('PASS: positive scale ladder and Poisson-summation agreement')
