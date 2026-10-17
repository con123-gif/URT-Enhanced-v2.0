#!/usr/bin/env python3
"""Reproduce the actual archived H64 charged Yukawa and photon Ward identity.

This is a source-level uniqueness audit, NOT a fitted Koide model.
Run next to source_arrays.npz (derived only from original 2026-10-08 archive).
Requires numpy. No experimental mass inputs.
"""
from pathlib import Path
import json
import numpy as np
from numpy.linalg import svd,norm,eigvalsh
D=np.load(Path(__file__).with_name('urt_h64_source_arrays.npz'))
D48=D['history_loaded_D48'];Q16=D['Qem_particle16'];Y=D['history_loaded_Yukawa_samples'][2]
# Original archived Higgs probe has charged and neutral components.
# Its SU(2) orbit contains a neutral representative with the SAME norm.
h=np.array([1/np.sqrt(5),2j/np.sqrt(5)])
U=np.array([[h[1],-h[0]],[h[0].conjugate(),h[1].conjugate()]])
assert norm(U.conj().T@U-np.eye(2))<1e-13
assert norm(U@h-np.array([0,1]))<1e-13
G16=np.eye(16,dtype=complex);G16[:6,:6]=np.kron(np.eye(3),U);G16[6:8,6:8]=U
G=np.kron(np.eye(3),G16)
D48_neutral=G@D48@G.conj().T
A=np.kron(np.eye(3),Q16)
Li=[16*k+7 for k in range(3)]
Ri=[16*k+14 for k in range(3)]
M=D48_neutral[np.ix_(Li,Ri)]
Q_L=A[np.ix_(Li,Li)];Q_R=A[np.ix_(Ri,Ri)]
assert norm(Q_L+np.eye(3))<1e-13 and norm(Q_R+np.eye(3))<1e-13
assert norm(Q_L@M-M@Q_R)<1e-13
assert norm(D48-D48.conj().T)<1e-13
assert norm(D48_neutral-D48_neutral.conj().T)<1e-13
assert norm(A@D48_neutral-D48_neutral@A)<1e-13
assert norm(G.conj().T@G-np.eye(48))<1e-13
assert norm(eigvalsh(D48)-eigvalsh(D48_neutral))<1e-12
assert norm(M-Y)<1e-12
s=svd(M,compute_uv=False)
q=lambda s:float(np.dot(s,s)/(np.sum(s)**2))
phi=(1+np.sqrt(5))/2
alpha_urt=phi**(-2)
delta=3/20-80*np.pi/(1053*phi)
results={}
# Gauge-covariant, generation-sensitive deformations are not selected by the
# currently recovered action. Show this constructively rather than claiming
# the gauge Ward identity fixes the mass spectrum.
for n,t in [('original',0.),('canonical_URT_alpha_illustration',alpha_urt),
            ('unit_positive_polynomial',1.),('rail_delta_illustration',delta)]:
    Z=M+t*(M@M.conj().T@M)
    zz=svd(Z,compute_uv=False)
    results[n]={'t':float(t),'singulars':list(map(float,zz)),
                'Koide_Q_if_singulars_sqrt_masses':q(zz),
                'gauge_Ward_error':float(norm(Q_L@Z-Z@Q_R))}
# A second polynomial demonstrates why selecting a particular nonlinear law
# is essential: every polynomial in MM^dagger times M is U(1)-covariant.
for p in [1,3,5,7]:
    ss=s**p
    results[f'power_{p}_illustration']={'Koide_Q_if_sqrt':q(ss)}
# Koide spectral coordinates of the actual neutral-gauge source, no target input.
sordered=np.sort(s)
mt=np.array([sordered[2],sordered[0],sordered[1]])
mean=float(mt.mean()); xs=mt/mean-1; ang=2*np.pi*np.arange(3)/3
r_cos=2*float(np.dot(xs,np.cos(ang)))/3
r_sin=-2*float(np.dot(xs,np.sin(ang)))/3
results['actual_source_generalized_koide_coordinates']={'r':float(np.hypot(r_cos,r_sin)), 'delta_rad':float(np.arctan2(r_sin,r_cos)), 'Q':q(s)}
# Only a perturbative PHYSICAL BENCHMARK, not a derived Cathedral coupling.
alpha_em=1/137.035999178195
ms=s*s; scale=ms.max()
rel=(alpha_em/np.pi)*(1+0.75*np.log(scale**2/ms**2))
s_qed=np.sqrt(ms*(1+rel))
results['conditional_one_loop_QED']={'coupling_assumption':'alpha=1/137.035999178195', 'pole_MS_rel':list(map(float,rel)), 'Q_after_if_singulars_are_sqrt_masses':q(s_qed)}
# Static photon properties from the archive are not a joint photon-matter vertex.
K0=D['sample0_K20']; C0=D['sample0_continuous_link_covariance']
results['source_checks']={
  'Yukawa_singulars':list(map(float,s)),
  'EM_neutral_Higgs_mass_invariant':float(norm(M-Y)),
  'Yukawa_Q_if_sqrt':q(s),
  'H48_charge_commutation_before_neutral_gauge':float(norm(A@D48-D48@A)),
  'H48_charge_commutation_after_neutral_gauge':float(norm(A@D48_neutral-D48_neutral@A)),
  'original_Higgs_doublet':[[float(z.real),float(z.imag)] for z in h],
  'neutralized_Higgs_doublet':[[float(z.real),float(z.imag)] for z in U@h],
  'neutralized_electron_block_Yukawa_residual':float(norm(M-Y)),
  'complete_D48_unitary_spectrum_residual':float(norm(eigvalsh(D48)-eigvalsh(D48_neutral))),
  'Q_L_minus_identity_error':float(norm(Q_L+np.eye(3))),
  'Q_R_minus_identity_error':float(norm(Q_R+np.eye(3))),
  'K20_shape':list(K0.shape),
  'K20_hermiticity_error':float(norm(K0-K0.conj().T)),
  'C20_photon_covariance_shape':list(C0.shape),
  'archive_arrays_sha256_to_be_checked_separately':True,
}
print(json.dumps(results,indent=2))
Path(__file__).with_name('urt_h64_source_level_mass_gate_results.json').write_text(json.dumps(results,indent=2))
