#!/usr/bin/env python3
"""Native Cathedral 20-face Peierls photon Hessian: exact rational closed form.
Rational coefficients are derived by the projector construction documented in
NATIVE_PEIERLS_PHOTON_EXACT_TWO_SECTOR_RESPONSE.md. The source has no measured
fine-structure constant. This does not derive the 4D infrared photon coupling.
"""
from math import pi,sqrt,log
from scipy.special import expit
from scipy.optimize import brentq
import json
from fractions import Fraction as F

phi=(1+sqrt(5))/2
delta=3/20-80*pi/(1053*phi)
eta=-log(delta)
E=(-3,-2,1,2,6)
contact={-3:F(6,5),-2:F(1),1:-F(2,5),2:-F(6,5),6:-F(3,5)}
B5={(-3,-2):F(14,15),(-3,1):F(16,15),
    (-2,2):F(56,15),(1,2):F(94,15)}
B6={(-3,2):F(2),(-2,-2):F(20,9),(-2,1):F(2,9),
    (1,1):F(32,9),(2,2):F(4)}
def source_coefficient(beta,terms):
    n={x:float(expit(-beta*x)) for x in E}
    D=lambda x,y:(-beta*n[x]*(1-n[x]) if x==y
                  else (n[x]-n[y])/(x-y))
    return beta*(sum(float(z)*n[k] for k,z in contact.items())
                 +sum(float(v)*D(*k) for k,v in terms.items()))
h5=lambda b:source_coefficient(b,B5)
h6=lambda b:source_coefficient(b,B6)
crit6=brentq(h6,.05,1.25,xtol=5e-14)
crit5=brentq(h5,1.01,3.,xtol=5e-14)
assert abs(crit6-0.913084300421373)<1e-12
assert abs(crit5-1.356292132649312)<1e-12
assert abs(h5(eta)-5.900702960956777)<1e-11
assert abs(h6(eta)-10.025408677635891)<1e-11
print(json.dumps({'alpha_observed_input':False,
    'finite_model_unit_hopping_hypothesis':True,
    'beta_c_6':crit6,'beta_c_5':crit5,'eta_delta':eta,
    'h5_at_eta':h5(eta),'h6_at_eta':h6(eta),
    'physical_alpha_derived':False},indent=2))
