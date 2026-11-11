# Koide Q = 2/3 from maximum entropy: derivation, domain, neutrino consequence (18 Oct 2026)

Work session: Con Lytollis with Claude, 18 Oct 2026. Every test list marked *pre-registered* was written and
SHA-256 hashed before its script was run (`preregistrations/`).

## Status

| Item | Status |
|---|---|
| Q = 2/3 (Brannen r = √2) for charged leptons, from maximum entropy over the two basis-free sectors of the √mass operator | CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING |
| Charged-lepton phase β = 3δ* = 0.666666141 rad (equivalent to m_μ/m_e to 8 digits) | OPEN |
| Restored H64 period-action vacuum produces √2, the phase and the masses | RETIRED / SUPERSEDED for √2: no-go under the five readings tested (`gate_output.txt`) |
| Exact phase 2/9 together with exact Q = 2/3 | RETIRED: excluded at 442σ |
| Domain of the rule: physical (pole) spectra of free fermions; quark MS-bar values are not a test of it | OPEN: proposed boundary, supported by T1 |
| Quark Q_u = 0.849, Q_d = 0.731 | OPEN: not derived |
| Neutrino spectrum from the rule: normal ordering, m₁ = 0.364 meV, Σm_ν = 59.16 meV | OPEN: registered prediction |
| δ_ν = δ_e + π/12 (Brannen 2006) | OPEN: consistent at 1.3–1.9σ; JUNO decides |
| Four external proposals in `audited_proposals/` | RETIRED |

No canonical ledger (`docs/CLAIM_LEDGER.md`, `docs/CLOSURE_LEDGER.md`) is edited by this folder.

## Assumptions

1. **Maximum entropy (URT).** One configuration takes the maximum-entropy distribution over its basis-free data.
2. **√m are Dirac eigenvalues (Cathedral K = D²).** The √mass operator X is D, so its eigenvalues are signed.
3. **Three identical generations.** Generation space carries U(3) (S₃ for relabelling).
4. **Domain (proposed here).** The rule acts on the physical spectrum of free particles, i.e. pole masses.

## Defined objects

- X: Hermitian 3×3 √mass operator; X̄ = (Tr X / 3)·I; X̃ = X − X̄.
- Sector powers P₀ = ‖X̄‖² = (Tr X)²/3 and P₁ = ‖X̃‖²; trace fraction p = P₀/(P₀ + P₁).
- Koide ratio Q = Tr X² / (Tr X)² = 1/(3p).
- Phase (basis-free): cos 3δ = √6 · Tr X̃³ / (Tr X̃²)^{3/2}; Brannen form √m_k = μ(1 + √2 cos(δ + 2πk/3)).

## Derivation (exact)

1. Under U(3), Hermitian 3×3 operators split into exactly two irreducible pieces, trace and traceless
   (E|Tr U|⁴ = 2; Monte Carlo 2.0022). Under S₃ relabelling, also two (mean χ² = 2).
2. For one configuration a per-mode split is not basis-free: the power in one traceless mode moves over
   0–0.0865 under flavour rotation, while the trace fraction is invariant. The only basis-free data are P₀ and P₁.
3. Maximum entropy of H(p, 1 − p) over those two numbers gives p = 1/2, so Q = 2/3 and r = √2. No fitted input.
4. A *state* is weighted by sector dimension (4/13 on the 4 + 9 shell); a *configuration* is weighted per
   irreducible sector (1/2 each). The 4:9 split and Koide do not conflict.
5. The phase is flat under any functional of P₀ and P₁. Γ = (κ/2) Tr X² − c₀ ln Tr X − c₁ ln‖X̃‖ is stationary at
   Q = 1/3 + c₁/(3c₀) for every δ. The phase needs further input; it is not derived here.

## Numerical checks

**Charged leptons** (CODATA 2022 m_e, m_μ/m_e; PDG 2026 m_τ = 1776.93 ± 0.09 MeV):
- p = 0.5000017 ± 3.8×10⁻⁶ (+0.43σ from 1/2); Q = 0.66666446 ± 5.1×10⁻⁶.
- Prediction m_τ = 1776.969 MeV, +0.43σ. This is the same value Koide's relation gives.

**T1, domain.** Pole masses give Q at −0.43σ. The same leptons run to M_Z (one-loop QED MS-bar) give
Q = 0.667833. That misses 2/3 by 1.17×10⁻³, which is 230 times the pole error bar. Quark Q values are built from
running masses, and confined quarks have no pole spectrum, so they cannot test the rule.

**T2/T3, neutrinos** (NuFIT 6.0; JUNO Δm²₂₁; DESI DR2 + CMB):

| Ordering | Signed √m pattern | m₁, m₂, m₃ (meV) | Σm_ν (meV) | m_β (meV) | DESI DR2, ΛCDM (Σ < 64.2) |
|---|---|---|---|---|---|
| Normal | (−, +, +) | 0.364, 8.662, 50.131 | 59.16 | 8.85 | allowed |
| Inverted | (+, +, −) | 49.17, 49.93, 2.917 | 102.0 | 48.85 | excluded |

- No solution has all eigenvalues positive. Q = 2/3 forces one negative Dirac eigenvalue, always on the lightest state.
- Risk: DESI's boundary-corrected limit (53 meV) is below the normal-ordering floor (58.78 meV). The normal-ordering
  solution sits 0.37 meV above that floor, so it stands or falls with minimal-mass normal ordering.

**T4, phase relation** (Brannen 2006): 3δ_ν = 3δ_e + π/4. With Q = 2/3 this fixes Δm²₂₁/Δm²₃₁ = 0.030839.

| Input | Measured ratio | Pull | Δm²₂₁ the relation needs |
|---|---|---|---|
| NuFIT 6.0 (with SK-atm) | 0.029805 ± 0.000792 | +1.30σ | 7.750×10⁻⁵ eV² (measured 7.49 ± 0.19) |
| JUNO Δm²₂₁ + NuFIT Δm²₃₁ | 0.029845 ± 0.000533 | +1.86σ | 7.750×10⁻⁵ eV² (measured 7.50 ± 0.12) |
| NuFIT 6.0 (no SK-atm) | 0.029558 ± 0.000800 | +1.60σ | 7.815×10⁻⁵ eV² (measured 7.49 ± 0.19) |

## What is new

- The route to Q = 2/3: maximum entropy over the only two basis-free sectors. The per-mode alternative does not
  exist for a single configuration.
- The domain argument and its T1 evidence.
- Not new: the neutrino masses and the π/12 offset (Brannen 2006), and m_τ = 1776.969 MeV (Koide's relation).
  What this folder adds there is the reason for the premise (maximum entropy) and for the signed root (K = D²).

## Superseded / retired

- √2 from the restored H64 vacuum: the selected vacuum gives Q = 0.384263 (r = 0.5528, δ = 0.5697,
  m_μ/m_e = 4.06). At Δ → 0 the source spectrum is exact, σ² = {5/3, (13 ± √105)/6}, with Q = 9(13 − √105)/64 =
  0.387148. Superseded for √2 by the maximum-entropy route.
- Spin-½ three-return on an inscribed-cube axis gives Q = 2/3 exactly but forces m_e = 0, δ = π/12 and
  m_μ/m_τ = 7 − 4√3 (+20.7%). Retired as the lepton mechanism. π/12 reappears in T4 as the inter-sector offset.

## Negative results for the phase and audits

| Test set | File | Result |
|---|---|---|
| Cathedral Transform as Koide operator (pre-registered, CT_KOIDE) | `ct_koide_test.py` | 0/5; best joint distance 1.355×10⁴σ; Haar null as close 18% of the time |
| Transform on the generation triangle | `ct_modified_koide.py` | identity p = 1/(3Q); twist tuning hits any target (fit, not derivation) |
| Phase mechanisms P1–P6 (pre-registered, PHASE) | `koide_phase_attempt.py` | 2 of 11 numerical passes, 0 derivations: 3δ = Q (assumed law; Q = 2/3 − 1.12×10⁻⁷, m_τ = 1776.9670 MeV); repository screening formula (3.6 chance hits expected) |
| URT period-3 orbits (pre-registered, URT_PHASE) | `urt_three_return_koide.py` | 0/6; maximum Q anywhere in the window 0.4696 |
| URT edge rules | `urt_principle_phase.py` | all miss (best m_μ/m_e = 210.381) |
| Logistic floor vs u* = 0.15117430586 | `logistic_floor_check.py` | equals the floor only at r = 3.835587771850, not a special point |
| Fisher / Gibbs centres (pre-registered, FISHER) | `fisher_phase_test.py` | 0/3 |
| Golden-ratio hierarchy and phases (pre-registered, GOLDEN) | `golden_hierarchy_test.py` | 0/12; best B4 gives m_τ = 1764.09 MeV |
| Geometric angles for π/4 − 3δ* (pre-registered, GAP) | `gap_pattern_test.py` | nearest of 313 candidates off by 2.89×10⁻³ rad |
| Proposal 1, 13→3 QR/Schur reduction (pre-registered, ATTACHMENT) | `attachment_reduction_test.py` | 0/5; the K₄ × Z₅ phases are a diagonal similarity (spectra change by 10⁻¹²) |
| Proposal 2, δ = 2/9 − Δ²/36 | `attachment2_phase_check.py` | +3.9σ with rounded Δ, +7.7σ with the framework's exact Δ |
| Proposal 3, quark CKM misalignment | `quark_joint_audit.py` | Q is rotation-invariant (max change 5.6×10⁻¹⁶); joint X_u + V X_d V† gives Q = 0.8304 |
| Proposal 4, quark cross-trace midpoint | `quark_midpoint_audit.py` | midpoint is the identity Q_ud = (Q_u + Q_d)/2 − ½‖X̂_u − X̂_d‖²; claimed I_ud = 27,232 MeV exceeds the trace-inequality maximum 27,214.7 MeV |
| Restored H64 gate | `koide_h64_derivation_gate.py` | R1–R3 not derived (see above) |
| Domain and neutrinos (pre-registered, DOMAIN) | `domain_neutrino_build.py` | T1, T3, T4 pass criteria met; T2 is the solution table |

The script logs use upper-case PASS/FAIL tags; the status table above uses the repository's status classes.

## Reproduce

From the repository root:

```
python3 research_archive/2026-10-17_recovery_assets/restore_matrices.py
python3 research_archive/2026-10-18_koide_maxent_domain_neutrino/<script>.py
```

The first command restores `combined_signed_source_operators.npz` (checksum-verified); only the two H64 scripts
(`koide_h64_derivation_gate.py`, `koide_cathedral_attempt.py`) need it. NumPy and SciPy only. All 17 scripts
reproduce their archived `*_output.txt` byte for byte (checked 18 Oct 2026).

| Script | Output |
|---|---|
| `koide_canonical_maxent.py` | `koide_canonical_output.txt` |
| `domain_neutrino_build.py` | `domain_neutrino_output.txt` |
| `ct_modified_koide.py` | `ct_modified_output.txt` |
| `koide_h64_derivation_gate.py` | `gate_output.txt` |
| `koide_cathedral_attempt.py` | `attempt_output.txt` |
| `ct_koide_test.py` | `ct_koide_output.txt` |
| `koide_phase_attempt.py` | `koide_phase_output.txt` |
| `urt_three_return_koide.py` | `urt_three_return_output.txt` |
| `urt_principle_phase.py` | `urt_principle_output.txt` |
| `logistic_floor_check.py` | `logistic_floor_output.txt` |
| `fisher_phase_test.py` | `fisher_phase_output.txt` |
| `golden_hierarchy_test.py` | `golden_hierarchy_output.txt` |
| `gap_pattern_test.py` | `gap_pattern_output.txt` |
| `attachment_reduction_test.py` | `attachment_reduction_output.txt` |
| `attachment2_phase_check.py` | `attachment2_phase_output.txt` |
| `quark_joint_audit.py` | `quark_joint_output.txt` |
| `quark_midpoint_audit.py` | `quark_midpoint_output.txt` |

`audited_proposals/` holds the four AI-generated proposals supplied for audit, kept for provenance.

## Data

- CODATA 2022: m_e = 0.51099895069(16) MeV, m_μ/m_e = 206.7682827(46).
- PDG 2026: m_τ = 1776.93 ± 0.09 MeV.
- NuFIT 6.0, arXiv:2410.05380: Δm²₂₁ = 7.49 ± 0.19 ×10⁻⁵ eV²; Δm²₃₁ = 2.513 (+0.021/−0.019) ×10⁻³ eV² (NO, with SK-atm).
- JUNO first measurement, arXiv:2511.14593: Δm²₂₁ = 7.50 ± 0.12 ×10⁻⁵ eV², sin²θ₁₂ = 0.3092 ± 0.0087.
- DESI DR2 neutrino constraints, arXiv:2503.14744: Σm_ν < 0.0642 eV (ΛCDM, 95%); 0.053 eV (Feldman–Cousins); 0.163 eV (w₀wₐCDM).
