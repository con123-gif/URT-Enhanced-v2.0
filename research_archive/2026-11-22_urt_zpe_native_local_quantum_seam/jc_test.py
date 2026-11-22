#!/usr/bin/env python3
"""Actual energy exchange: native resonant signal mode -> two-level local quantum store.
The URT two-cycle signal marginal is thermal. A standard autonomous local
Jaynes-Cummings interaction transfers ENERGY but need not produce ergotropy.
"""
import numpy as np
from math import pi,e
from scipy.optimize import minimize_scalar
alpha=pi/e
N=alpha**4-1
lam=N/(1+N)
ns=np.arange(1,350,dtype=float)
pn=(1-lam)*lam**ns
assert abs(((1-lam)*np.sum(lam**np.arange(350)))-1)<1e-12

def pe(x):
    return float(np.sum(pn * np.sin(x*np.sqrt(ns))**2))
xs=np.linspace(0,10,5001)
ind=np.argmax([pe(x) for x in xs]); opt=minimize_scalar(lambda x:-pe(x),bounds=(max(xs[ind]-.008,0),xs[ind]+.008),method='bounded')
assert opt.success
for t in (0,.5,1.,pi/2.,pi, opt.x):
    prob=pe(t)
    print(f'dimensionless_g_t={t:.9f} local_store_excited={prob:.12f} signal_deltaE_per_hbaromega={-prob:.12f} total_free_E_conservation=0 ergotropy_qubit={max(0,2*prob-1):.12f}')
assert 0<pe(opt.x)<=lam<.5
print(f'URT_two_cycle_thermal_nbar={N:.12f} lambda={lam:.12f} max_P_at_g_t={opt.x:.9f} max_P={pe(opt.x):.12f} upper_bound_P={lam:.12f}')
print('PASS: thermally populated URT signal charges initially unexcited quantum store by local energy-conserving autonomous Jaynes-Cummings interaction, but cannot make a single qubit population-inverted or a cyclic work source under this protocol')

