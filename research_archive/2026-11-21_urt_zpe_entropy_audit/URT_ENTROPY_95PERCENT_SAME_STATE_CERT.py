#!/usr/bin/env python3
"""Reproducible, unfitted audit of the URT 95.6157% entropy/ZPE comparison.

The historic de Sitter ratio combines the 2D finite-cycle relative Gaussian ZPE
with an independent 8-state URT master entropy. This checks exactly which
part contributes the deficit and independently evaluates the entanglement
and modular energies from the SAME original 4-site magnetic Gaussian state.
No fit, adjustment, horizon-carrier identification or cosmological inference.
"""
from __future__ import annotations
import math
import numpy as np
import mpmath as mp
from scipy.linalg import eigh

mp.mp.dps=65
phi=(1+mp.sqrt(5))/2
th=2*mp.pi/phi**2
delta=mp.mpf(3)/20 - 80*mp.pi/(1053*phi)
p=delta**2/(1+delta**2)
h=-p*mp.log(p)-(1-p)*mp.log(1-p)
svis=mp.log(4)
sstar=svis+h

def cycle_energy(F):
    return 2*((1+mp.sqrt(2))*mp.cos(F/8)+mp.sin(F/8))

d=cycle_energy(th)-cycle_energy(mp.pi-th)
ratio=2*mp.pi*d/sstar
missing_entropy=sstar-2*mp.pi*d
required_energy=sstar/(2*mp.pi)
assert abs(ratio-mp.mpf('0.95615737316656298383899791644'))<mp.mpf('1e-26')
assert abs(d-mp.mpf('0.210974605569419082323337237586'))<mp.mpf('1e-27')
assert abs(h-mp.mpf('0.0000804963073331314360743301745652'))<mp.mpf('1e-30')
assert abs(missing_entropy-(svis-2*mp.pi*d+h))<mp.mpf('1e-58')

# The chosen horizon normalization: E_MS= c^4 R/(2G) = T_GH S_GH
# for T_GH= hbar c/(2 pi k_B R), S_GH/k_B=pi R^2/lp^2.
# For E_candidate= N*d*hbar*c/R and S_candidate=N*k_B*sstar,
# ratio E_candidate/(T_GH*S_candidate) = 2*pi*d/sstar.
import sympy as sp
RR,nn,hh,cc,GG,kk=sp.symbols('R N hbar c G k_B',positive=True)
lp2=hh*GG/cc**3
Sh=kk*sp.pi*RR**2/lp2
Th=hh*cc/(2*sp.pi*kk*RR)
Ems=cc**4*RR/(2*GG)
assert sp.simplify(Th*Sh-Ems)==0

# Native 4-cycle: true degree-two 2D magnetic graph, NOT 4I-A compression.
def cycle(F):
    A=np.zeros((4,4),complex)
    z=np.exp(-1j*float(F))
    for i,j,w in ((0,1,1),(0,2,1),(1,3,z),(2,3,1)):
        A[i,j]=w;A[j,i]=complex(w).conjugate()
    return 2*np.eye(4)-A

def gaussian_cut(F, ids):
    L=cycle(F)
    ev,U=eigh(L)
    assert ev[0]>1e-9
    W=(U*np.sqrt(ev))@U.conj().T
    V=(U/np.sqrt(ev))@U.conj().T
    q=V[np.ix_(ids,ids)];r=W[np.ix_(ids,ids)]
    nu=np.sqrt(np.linalg.eigvals(q@r).real)/2
    assert min(nu)>=.5-1e-10
    def h_of_nu(x):
        x=max(x-.5,0.)
        return 0. if x<1e-12 else (x+1)*np.log1p(x)-x*np.log(x)
    S=2*sum(h_of_nu(x) for x in nu)  # two real oscillator polarisations
    E=np.sqrt(ev).sum()
    # Exactly two distinct modular single-particle levels for two physical sites;
    # each repeated for the two real polarisations.
    eps=np.log((nu+.5)/(nu-.5))
    return E,S,sorted(nu,reverse=True),sorted(eps)

for F,sign in ((th,+1),(mp.pi-th,-1)):
    E,S,nu,eps=gaussian_cut(F,(0,1))
    assert abs(E-float(cycle_energy(F)))<1e-12
    target={+1:0.542933527495884776,-1:1.438786007428435997}[sign]
    assert abs(S-target)<5e-12
    E2,S2,_,_=gaussian_cut(F,(0,3))
    assert abs(E-E2)<2e-12
    print(f'sector {sign:+d}: E={E:.15f}, S_adjacent={S:.15f}, S_diagonal={S2:.15f}')
    print(f'  adjacent nu={nu}; modular level energies={eps}')
    print(f'  illustrative adjacent entropy-per-two-site={S/2:.15f}; 2pi*d/(S/2)={2*math.pi*float(d)/(S/2):.12f}')

Sp=gaussian_cut(th,(0,1))[1]
Sm=gaussian_cut(mp.pi-th,(0,1))[1]
assert Sp<Sm
assert float(cycle_energy(th))>float(cycle_energy(mp.pi-th))
print('Deltaratio: ',mp.nstr(1-ratio,35))
print('d2 finite-loop: ',mp.nstr(d,35))
print('s_visible: ',mp.nstr(svis,35))
print('s_hidden: ',mp.nstr(h,35))
print('s_star: ',mp.nstr(sstar,35))
print('2pi*d: ',mp.nstr(2*mp.pi*d,35))
print('entropy coefficient deficit: ',mp.nstr(missing_entropy,35))
print('visible contribution: ',mp.nstr(svis-2*mp.pi*d,35))
print('hidden fraction of coefficient deficit: ',mp.nstr(h/missing_entropy,35))
print('hypothetical required d for unit horizon ratio: ',mp.nstr(required_energy,35))
print('difference d_required-d: ',mp.nstr(required_energy-d,35))
print('S_plus minus S_minus from same ground state: ',Sp-Sm)
print('PASS: exact historical coefficient accounting; Misner-Sharp/GH identity;')
print('  physical-site gauge-covariant Gaussian energy/entropy; distinct modular gaps.')
print('STATUS: 95.6157 is an unreconciled cross-state energy/entropy ratio, NOT a 4.38% physical deficit.')
