#!/usr/bin/env python3
"""
URT / Newton's Cathedral — Minimal Recursive Network Completion
Construction section contains no observed particle masses, mixing entries,
fine-structure constant, Newton constant, or cosmological fit values.

The completion rule is:
  1. serial independent transmissions multiply;
  2. parallel independent responses add;
  3. a conserved source shared by m symmetry-equivalent exits contributes 1/m per exit;
  4. Gaussian hidden modes are eliminated by Schur complement;
  5. a positive complex radial mode carries the invariant -log r Jacobian;
  6. the outer/Galois sheet fixes orientation sign.

Observed values appear only below the DIAGNOSTIC marker.
"""
from __future__ import annotations
import math, json
from pathlib import Path

# -------------------- THEORY CONSTRUCTION --------------------
D = 3
L = D + 1                           # local quaternionic dimension
gamma = D ** (-L)                   # one unresolved C3 cell in L coordinates

V = 12
N = V + 1
E = 30
F = 20
q = 5
h = 2 * L                           # Lambda^1 + Lambda^3 hidden dimension
phi = (1.0 + math.sqrt(5.0))/2.0

lam_lo = 5.0 - math.sqrt(5.0)
lam_hi = 5.0 + math.sqrt(5.0)
golden_impedance = math.sqrt(lam_hi/lam_lo)
assert abs(golden_impedance - phi) < 1e-14

dstar = (1.0 - gamma) * math.pi / (N * golden_impedance)
dcl = D / F
Delta = dcl - dstar
eta = -math.log(Delta)
rail = dstar/dcl

# Unique even scalar/five return ratio from Sym^2(4_5).
Ws = 9.0/5.0

# Root scalar response.
alpha_inv = (
    N*N - E - (D - 1)
    + Delta * (N + Ws - (1.0 + gamma)/D)
    - Delta**2 * (N - D - 1)/(q*N)
)
alpha_root = 1.0/alpha_inv

# Flavour response.
hidden_share_norm2 = h*(1.0/h)**2
k12 = F - hidden_share_norm2
sQ12 = 1.0/math.sqrt(k12)
sQ23 = Delta*(phi**6 - 1.0)
sQ13 = D*Delta/2.0
JQ = gamma*Delta*(1.0 + Ws*gamma)

xL12 = 1.0/D - V*Delta
xL23 = 0.5 + F*Delta + gamma
xL13 = 2.0*gamma*rail**2*(1.0 - F*Delta)
JL = -N*Delta

def phase_from_J(s12,s23,s13,J):
    c12=math.sqrt(1-s12*s12); c23=math.sqrt(1-s23*s23); c13=math.sqrt(1-s13*s13)
    Jmax=s12*c12*s23*c23*s13*c13*c13
    return math.asin(max(-1.0,min(1.0,J/Jmax)))

def standard_matrix(s12,s23,s13,delta):
    import cmath
    c12=math.sqrt(1-s12*s12); c23=math.sqrt(1-s23*s23); c13=math.sqrt(1-s13*s13)
    ep=cmath.exp(1j*delta); em=ep.conjugate()
    return [
      [c12*c13, s12*c13, s13*em],
      [-s12*c23-c12*s23*s13*ep, c12*c23-s12*s23*s13*ep, s23*c13],
      [s12*s23-c12*c23*s13*ep, -c12*s23-s12*c23*s13*ep, c23*c13]
    ]

dQ = phase_from_J(sQ12,sQ23,sQ13,JQ)
sL12,sL23,sL13 = map(math.sqrt,(xL12,xL23,xL13))
dL = phase_from_J(sL12,sL23,sL13,JL)
VCKM = standard_matrix(sQ12,sQ23,sQ13,dQ)
UPMNS = standard_matrix(sL12,sL23,sL13,dL)

# Low-energy response slots.
sin2W_eff = D/N
alpha_s_eff = F/(N*N)
lambda_H_eff = 1.0/h + gamma/D
yt_eff = 1.0 - Delta

# Finite spectral-action boundary invariants.
aY = 16.0*(100.0 + 183.0*Delta**2)/75.0
bY = (
    976.0/27.0 + (384.0/5.0)*Delta + (99584.0/225.0)*Delta**2
    + (1728.0/5.0)*Delta**3 + (420592.0/1875.0)*Delta**4
)
rhoH_boundary = bY/(aY*aY)
sin2W_boundary = 3.0/8.0

# Minimal exponential spectral lift: f(v)=A exp(-eta v^2).
# After eliminating A with canonical gauge normalization and taking c_Majorana=0:
G_Lambda2_over_gU2 = eta/(16.0*math.pi)

# Recursive mass tree, in units of the top mass.
mass_ratio_to_top = {
    "t": 1.0,
    "b": 2.0*q*Delta,
    "tau": (D+1.0)*Delta,
    "c": D*Delta,
    "s": (2.0*q*Delta)*(3.0*D*Delta),
    "mu": ((D+1.0)*Delta)*(D*h*Delta),
    "u": 2.0*Delta**2,
    "d": (2.0*q*Delta)*(2.0*D*E*Delta**2),
    "e": ((D+1.0)*Delta)*(2.0*D*h*Delta**2*rail**2),
}

# Neutrino normal hierarchy.
nu3_over_top = D*Delta**q
nu2_over_nu3 = math.sqrt(V*Delta)
nu1_over_nu3 = D*Delta**3
nu_dm21_over_dm31 = (
    nu2_over_nu3**2 - nu1_over_nu3**2
)/(1.0 - nu1_over_nu3**2)

# Channel-count equilibrium cosmology.
Omega_m = 2.0*D/(F-1.0)
Omega_L = N/(F-1.0)
Omega_b = Omega_m*(2.0/N)
Omega_c = Omega_m*((N-2.0)/N)

# Perturbative response slots.
n_s = 1.0 - D*gamma + Delta
tensor_r = 16.0*gamma*Delta
running = -Delta**2

# New recursive gravitational closure candidate:
# full 21-channel serial scalar survival × 4D/3D normalization
# × rail survival × isotropically shared hidden entropy survival.
A_G = ((D+1.0)/D)*rail*(1.0-gamma/h)
alphaG_e_candidate = alpha_root**(N+h)*A_G

theory = {
 "primitives":{
  "D":D,"L":L,"gamma":gamma,"V":V,"N":N,"E":E,"F":F,"q":q,"h":h,
  "phi":phi,"dstar":dstar,"dcl":dcl,"Delta":Delta,"eta":eta,"rail":rail
 },
 "flavour":{
  "quark":{"s12":sQ12,"s23":sQ23,"s13":sQ13,"J":JQ,"delta_deg":math.degrees(dQ)%360,
           "abs":[[abs(z) for z in row] for row in VCKM]},
  "lepton":{"s12sq":xL12,"s23sq":xL23,"s13sq":xL13,"J":JL,"delta_deg":math.degrees(dL)%360,
            "abs":[[abs(z) for z in row] for row in UPMNS]},
 },
 "effective_couplings":{
   "alpha_root_inverse":alpha_inv,
   "sin2_thetaW_effective":sin2W_eff,
   "alpha_s_effective":alpha_s_eff,
   "lambda_H_effective":lambda_H_eff,
   "y_t_effective":yt_eff,
 },
 "spectral_boundary":{
   "sin2_thetaW":sin2W_boundary,
   "a":aY,"b":bY,"b_over_a2":rhoH_boundary,
   "G_Lambda2_over_gU2":G_Lambda2_over_gU2,
 },
 "mass_ratios_to_top":mass_ratio_to_top,
 "neutrinos":{
   "m3_over_top":nu3_over_top,
   "m2_over_m3":nu2_over_nu3,
   "m1_over_m3":nu1_over_nu3,
   "dm21_over_dm31":nu_dm21_over_dm31,
 },
 "cosmology":{
   "Omega_m":Omega_m,"Omega_Lambda":Omega_L,"Omega_b":Omega_b,"Omega_c":Omega_c,
   "n_s":n_s,"r":tensor_r,"running":running,
 },
 "recursive_gravity_candidate":{
   "A_G":A_G,"alphaG_e":alphaG_e_candidate
 }
}

# -------------------- DIAGNOSTIC ONLY --------------------
# The numbers below are external observations and are not used anywhere above.
diagnostic = {
 "PDG_2026_quark_masses_GeV":{
   "u":0.00216,"d":0.00470,"s":0.0929,"c":1.2729,"b":4.186,"t":172.60
 },
 "charged_lepton_masses_GeV":{
   "e":0.00051099895000,"mu":0.1056583755,"tau":1.77693
 },
 "NuFIT_2024":{"dm21":7.49e-5,"dm31":2.534e-3},
 "Higgs_mass_GeV":125.13,
 "alpha_inverse_CODATA_2022":137.035999177,
 "alphaG_e_CODATA_2022":1.7518093988e-45
}

# Use only the observed top as a convenient unit for displaying the dimensionless mass tree.
mt_obs=diagnostic["PDG_2026_quark_masses_GeV"]["t"]
diagnostic["mass_tree_using_top_unit_GeV"]={k:v*mt_obs for k,v in mass_ratio_to_top.items()}
diagnostic["neutrino_masses_using_top_unit_eV"]={
 "m3":nu3_over_top*mt_obs*1e9,
 "m2":nu3_over_top*nu2_over_nu3*mt_obs*1e9,
 "m1":nu3_over_top*nu1_over_nu3*mt_obs*1e9,
}
diagnostic["neutrino_dm2_using_top_unit_eV2"]={
 "dm21":((nu3_over_top*nu2_over_nu3*mt_obs*1e9)**2 -
         (nu3_over_top*nu1_over_nu3*mt_obs*1e9)**2),
 "dm31":((nu3_over_top*mt_obs*1e9)**2 -
         (nu3_over_top*nu1_over_nu3*mt_obs*1e9)**2),
}

result={"theory":theory,"diagnostic":diagnostic}
Path("/mnt/data/urt_final/urt_minimal_completion_results.json").write_text(json.dumps(result,indent=2))
print(json.dumps(theory,indent=2))