#!/usr/bin/env python3
"""Koide/URT three-return phase: independent no-fitting diagnostic.

Inputs CODATA 2022 mu/e mass ratio and its uncertainty, PDG 2026 tau mass.
The Koide Q=2/3 condition is a MODEL ASSUMPTION, not derived in this script.
No data are used to tune the historical 4-species charge-plane matrix.

This is NOT the previously mentioned kl_urt_koide_action.py (not available to
this session). Its detailed action-level phase-selection claims are not audited.
Requires Python standard library only; writes no files.
"""
from __future__ import annotations
from itertools import combinations
from math import acos, atan2, atan, cos, pi, sin, sqrt
import json

MUE_CODATA=206.7682827
MUE_SIGMA=0.0000046
E_MEV=0.51099895069
TAU_PDG_MEV=1776.93
TAU_PDG_SIGMA_MEV=0.09
PHASE_RATIONAL=2/9

def square_root_weight(delta,amplitude=sqrt(2)):
    return [1+amplitude*cos(delta+2*pi*j/3) for j in range(3)]

def muon_electron_ratio(delta,amplitude=sqrt(2)):
    w=square_root_weight(delta,amplitude)
    return (w[2]/w[1])**2

def phase_from_ratio_exact_Q(ratio):
    """Algebraic quadratic inversion, choose physical small phase branch."""
    s=sqrt(ratio)
    k=(s-1)/(s+1)
    u=2*k*(1-1/sqrt(2))/(sqrt(6)+sqrt(6-2*k*k))
    d=2*atan(u)
    if not all(x>0 for x in square_root_weight(d)):
        raise ValueError("Derived square-root mass ratios must be positive")
    return d

def predicted_tau(delta,amplitude=sqrt(2)):
    w=square_root_weight(delta,amplitude)
    return E_MEV*(w[0]/w[1])**2

def koide_Q(amplitude):
    return 1/3+amplitude**2/6

d=phase_from_ratio_exact_Q(MUE_CODATA)
dplus=phase_from_ratio_exact_Q(MUE_CODATA+MUE_SIGMA)
dminus=phase_from_ratio_exact_Q(MUE_CODATA-MUE_SIGMA)
sigma_d=(dplus-dminus)/2
assert abs(muon_electron_ratio(d)-MUE_CODATA)<1e-9
assert abs(koide_Q(sqrt(2))-2/3)<1e-15
delta_ratio=muon_electron_ratio(PHASE_RATIONAL)-MUE_CODATA
sigma_ratio=delta_ratio/MUE_SIGMA
tauQ=predicted_tau(d)
assert abs((tauQ-TAU_PDG_MEV)/TAU_PDG_SIGMA_MEV)<1

# At delta=2/9, solve the *free amplitude* from measured mu/e. This
# quantitatively determines how small a Q violation saves that rational phase.
s=sqrt(MUE_CODATA)
ce=cos(PHASE_RATIONAL+2*pi/3)
cm=cos(PHASE_RATIONAL+4*pi/3)
amp_rational=(s-1)/(cm-s*ce)
Q_rational=koide_Q(amp_rational)
tau_rational=predicted_tau(PHASE_RATIONAL,amp_rational)
assert abs(muon_electron_ratio(PHASE_RATIONAL,amp_rational)-MUE_CODATA)<1e-9

# Earlier canonical URT four-species charge plane: q_f=(integer triple),
# q_f·(1,1,1)=0. The 4×4 Hermitian pairing is one positive outer product.
words={
    "u":(1,3,-4),
    "d":(1,-3,2),
    "e":(-3,-3,6),
    "nu":(-3,3,0)
}
names=list(words)
def dot(x,y):return sum(a*b for a,b in zip(x,y))
def cross(x,y):
    return (x[1]*y[2]-x[2]*y[1],
            x[2]*y[0]-x[0]*y[2],
            x[0]*y[1]-x[1]*y[0])
unitn=(1/sqrt(3),)*3
h={(f,g):complex(dot(words[f],words[g]),
                  dot(unitn,cross(words[f],words[g])))
   for f in names for g in names}
trace_h=sum(h[f,f].real for f in names)
assert trace_h==112
rankone_res=max(abs(sum(h[(f,k)]*h[(k,g)] for k in names)-112*h[(f,g)])
                for f in names for g in names)
assert rankone_res<1e-11
loop={}
for triple in combinations(names,3):
    i,j,k=triple
    z=h[(i,j)]*h[(j,k)]*h[(k,i)]
    expected=dot(words[i],words[i])*dot(words[j],words[j])*dot(words[k],words[k])
    assert abs(z-expected)<1e-10
    loop["-".join(triple)]={"real":z.real,"imag":z.imag,"phase_rad":atan2(z.imag,z.real)}
assert max(abs(t["phase_rad"]) for t in loop.values())<1e-12

# Algebraic counterexample: positive rank-2 complex Gram has a nonzero,
# gauge-invariant Bargmann triangle phase, showing rank>=2 is necessary
# but not sufficient. This is NOT constructed from canonical H64.
z1=(1+0j,0j)
z2=(1/sqrt(2)+0j,1/sqrt(2)+0j)
z3=(1/sqrt(2)+0j,1j/sqrt(2))
inner=lambda x,y:sum(a.conjugate()*b for a,b in zip(x,y))
triangle=inner(z1,z2)*inner(z2,z3)*inner(z3,z1)
assert abs(atan2(triangle.imag,triangle.real)-pi/4)<1e-12

# The bare golden-angle 3-step phase does not equal the required Koide phase.
phi=(1+sqrt(5))/2
urt_angle=2*pi/phi**2
three_step_phase=(3*urt_angle+pi)%(2*pi)-pi
out={
 "inputs":{"mu_e_ratio":MUE_CODATA,"mu_e_ratio_1sigma":MUE_SIGMA,
           "m_e_MeV":E_MEV,"m_tau_MeV":TAU_PDG_MEV,"m_tau_1sigma_MeV":TAU_PDG_SIGMA_MEV},
 "exact_Q_hypothesis":{"Q":2/3,"delta_inferred_from_measured_mu_e":d,
      "delta_1sigma":sigma_d,"beta_inferred_rad":-3*d,
      "m_tau_predicted_MeV":tauQ,"tau_pull_sigma":(tauQ-TAU_PDG_MEV)/TAU_PDG_SIGMA_MEV},
 "rational_2_over_9_test":{"delta":PHASE_RATIONAL,
      "mu_e_ratio_pred_if_Q_exact":muon_electron_ratio(PHASE_RATIONAL),
      "mu_e_ratio_discrepancy_sigma":sigma_ratio,
      "amplitude_required_if_delta_exact":amp_rational,
      "Q_required_if_delta_exact":Q_rational,
      "Q_shift_from_2_over_3":Q_rational-2/3,
      "tau_pred_with_Q_relaxed_MeV":tau_rational,
      "tau_pull_sigma_if_Q_relaxed":(tau_rational-TAU_PDG_MEV)/TAU_PDG_SIGMA_MEV},
 "original_URT_charge_plane":{"rank_one_identity_residual":rankone_res,
      "trace_h":trace_h,"loop_products":loop,
      "all_loop_phases_zero":True},
 "two_dimensional_counterexample":{"bargmann_phase_rad":atan2(triangle.imag,triangle.real)},
 "original_URT_golden_angle_rad":urt_angle,
 "original_URT_bare_three_step_holonomy_rad":three_step_phase,
 "status":"no first-principles generation-space phase selected; original charge Gram has trivial holonomy",
 "source_note":"Independent computation from reported equations, NOT reproduction of unavailable kl_urt_koide_action.py"
}
print(json.dumps(out,indent=2))
