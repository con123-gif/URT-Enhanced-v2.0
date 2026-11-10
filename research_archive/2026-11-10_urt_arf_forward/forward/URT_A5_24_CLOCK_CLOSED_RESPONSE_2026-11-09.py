#!/usr/bin/env python3
"""Exact rational-pole A5-isotropized URT history source, periodized on
original 24-clock, through native charge-2 Gaussian history Schur kernel.
Conditional: A5 averaging and covariance periodization are specified
source-ensemble choices; not claimed uniquely selected physical vacuum.
"""
from pathlib import Path
import numpy as np,mpmath as mp
mp.mp.dps=70
phi=(1+mp.sqrt(5))/2
w=2*mp.pi/phi**2
r=mp.pi/mp.e
Delta=mp.mpf(3)/20-80*mp.pi/(1053*phi)
c0=36+72*mp.sqrt(5)/5
source_weights={'3':[(c0/2,mp.mpf(3)/20),(c0/2,mp.mpf(1)/20)],'5':[(mp.mpf(9)/2,mp.mpf(1)/15),(mp.mpf(5)/2,-mp.mpf(1)/20)]}
def spectral_density(la,nu):return (1-la**2)/(1-2*la*mp.cos(nu)+la**2)
def energy_and_derivative(angle):
    total=mp.mpf(0);current=mp.mpf(0);components=[]
    for tag,E,weight in [('3',18,1),('5',16,Delta**2)]:
        c00=sum(a for a,la in source_weights[tag]);sum_inv=mp.mpf(0);d_inv=mp.mpf(0)
        for m in range(24):
            nu=2*mp.pi*m/24
            pow=sum(a*spectral_density(la,nu) for a,la in source_weights[tag])
            den=E+r*r*(2-2*mp.cos(2*angle-nu))
            sum_inv+=pow/den
            d_inv+=pow*(4*r*r*mp.sin(2*angle-nu))/(den**2)
        energy=6*c00-mp.mpf('0.5')*sum_inv
        total+=weight*energy
        current+=mp.mpf('0.5')*weight*d_inv
        components.append((tag,c00,sum_inv,energy,weight*energy))
    return total,current,components
v,j,comps=energy_and_derivative(w)
assert abs(mp.diff(lambda t:energy_and_derivative(t)[0],w)-j)<mp.mpf('1e-57')
print('A5-isotropized source 24 cyclic power spectral densities rational (4 exact poles)')
for x in comps:print(' tag',x[0],'c0',mp.nstr(x[1],25),'sum_src_A^-1',mp.nstr(x[2],40),'energy',mp.nstr(x[3],40),'weighted',mp.nstr(x[4],40))
print('full 24-clock mean source history eliminated energy',mp.nstr(v,60))
print('full 24-clock golden orientation source derivative',mp.nstr(j,60))
print('PASS')
