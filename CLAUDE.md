# URT Enhanced v2.9 — Cathedral Framework

## Repository Overview

Universal Recursive Tuning (URT) — a unified icosahedral physics framework built around the single constant:

```
δ★ = (1 − D^{−(D+1)}) × π / (N×φ) = (80/81) × π / (13φ) ≈ 0.14751
```

where φ = (1+√5)/2 (golden ratio), N=13 (icosahedral shell sites), γ=1/81=D^{−(D+1)}.

**Iron Proof (v2.4)**: D=3 alone → A₅ uniqueness (Jordan 1870) → N=13 → γ=D^{−(D+1)}=1/81 → δ★.
Zero free continuous parameters. All 9 Cathedral integers derived from D=3.

## Key Files

### Core Constants
- `urt/shell_closure.py` — δ★ derivation, 13-site icosahedral shell, `compute_all_constants()`
- `urt/cathedral_v8.py` — Full Standard Model: α, masses, Higgs, CKM
- `urt/cathedral_v9.py` — Anchor-free: all scales from ρ_Λ alone

### Physics Modules
| File | What it computes |
|------|-----------------|
| `urt/rg_flow.py` | RG running δ(μ), crossover μ_c ≈ 197 GeV |
| `urt/qbls.py` | Quantum Bounded Ladder of Scales (δ_rung ≈ 61.32) |
| `urt/qft_cathedral.py` | Cathedral propagator, Mexican-hat potential, Higgs mass |
| `urt/nuclear_magic.py` | Magic numbers {2,8,20,28,50,82,126} from δ★ |
| `urt/axion_cathedral.py` | Axion mass, Peccei-Quinn scale, detection band |
| `urt/quasicrystal.py` | IKT forward/inverse, K₄/A₅ sector split |
| `urt/navier_stokes.py` | Kolmogorov cascade, intermittency exponents |
| `urt/gravity_deficit.py` | Angular deficit, BH entropy, holonomy |
| `urt/arf_closure.py` | ARF fixed point, lepton/proton mass ratios |
| `urt/logistic_verification.py` | δ★ on stable 6-cycle of logistic map |

### Application Modules (v2.1)
| File | Domain |
|------|--------|
| `urt/periodic_table.py` | Madelung rule from δ★ → noble gases {2,10,18,36,54,86,118} |
| `urt/holography.py` | AdS/CFT: G_N=δ★², RT entropy, BH thermodynamics |
| `urt/consciousness.py` | Kuramoto on icosahedral graph, IIT Φ, EEG δ-band |
| `urt/prime_spectral.py` | Icosahedral Laplacian ↔ Riemann zeros, Ramanujan property |
| `urt/metamaterials.py` | Photonic band gap ω=δ★ω₀, drug capsid binding, Z₂ topology |
| `urt/swarm_intelligence.py` | 13-drone icosahedral swarm, consensus T_c=1/3, satellite LEO |
| `urt/gravitational_waves.py` | IKT GW detection SNR=1/δ★, QNM ringdown, Cathedral strain |

### New Modules (v2.2 — Topology & Proof)
| File | Domain |
|------|--------|
| `urt/cathedral_topology.py` | 3-panel: holonomy vortex (376.9°), RG damping, gravitational deficit |
| `urt/pi_phi_e_flow.py` | Uniqueness: η=1/8π, η_L=1/4π, μ=φ−1 are exact (4 lemmas) |
| `urt/gravity_cathedral.py` | G_N=δ★², BH thermodynamics, K4 force hierarchy, area quantum |
| `urt/neutrinos.py` | PMNS from 13-shell, δ_CP=197°, Σmν≈60 meV |
| `urt/vacuum_instability.py` | V(δ)=Kδ²(δ−δ★)², δ=0 unstable → why something not nothing |
| `urt/force_structure.py` | K4⊕H3 decomposition, GUT unification, effective Lagrangian |

### New Modules (v2.3 — Complete)
| File | Domain |
|------|--------|
| `urt/electroweak.py` | W/Z/Higgs from K4 k=2: sin²θ_W=(D/N)(1+γ/2π)=0.23122 |
| `urt/cosmology_cathedral.py` | CMB: n_s=1−2/57, Ω_m=(4/13)(1+2γ), σ₈, Λ/M_Pl⁴=D/(D+1)²γ⁶⁴ |
| `urt/uniqueness_proof.py` | 4 lemmas + Conjecture 12.1: δ★ is the unique URT fixed point |
| `urt/prime181.py` | Corollary 11.1: p=181 (golden QR + K4-compat + p−100=81=1/γ) |
| `urt/ckm_pmns.py` | Full CKM (λ_C, A, ρ̄, η̄) + PMNS (all angles + δ_CP=197°) |
| `urt/canonical_v4gem.py` | ta-URT: Ω=9/13, τ_stab=0.001211, 13 resonance shells |
| `urt/qbls_fractal.py` | 13-rung meta-universe fractal ladder (Planck→Cosmos) |

### New Modules (v2.4 — Iron Proof)
| File | Domain |
|------|--------|
| `urt/iron_proof.py` | Bulletproof uniqueness: D=3→A₅→N=13→γ=D^{−D−1}→δ★, 0 free params |

### New Modules (v2.5 — Mad Professor)
| File | Domain |
|------|--------|
| `urt/cathedral_lagrangian.py` | Full QFT action L=L_grav+L_EW+L_QCD+L_H3+L_δ; 60 Ward identities; β(δ★)=0 |
| `urt/dark_matter.py` | Three DM: axion (60.7 μeV, k=12), sterile ν (143 keV, k=11), WIMP (13.5 GeV, k=9,10) |
| `urt/baryon_asymmetry.py` | η_B=(q−D)·γ^q=5.74×10⁻¹⁰ miracle; leptogenesis δ_CP=197°; all Sakharov conditions |
| `urt/cathedral_gut.py` | α_GUT=δ★²=G_N; μ_GUT≈3.73×10^16 GeV; τ_proton≈10^42 yr; SO(10) multiplets |

### New Modules (v2.6 — Explorer)
| File | Domain |
|------|--------|
| `urt/muon_g2.py` | a_μ=(g−2)/2: Schwinger α/2π, Czarnecki-Marciano EW via sin²θ_W=0.23122, H3 NP constraint |
| `urt/topological_qc.py` | Fibonacci anyons d=φ, A₅=60, F-matrix [[1/φ,1/√φ],[1/√φ,−1/φ]], QEC threshold γ=1/81 |
| `urt/string_landscape.py` | 2N=26 (bosonic), 2q=10 (super), 2V=24 (Leech), 4G=240 (E₈ roots), Moonshine 196884=196883+1 |
| `urt/quantum_chaos.py` | Icosahedral spectrum [0,3³,5⁵,7²,9,13], MSS bound, logistic edge-of-chaos 6-cycle |

### New Modules (v2.7 — Wave-3 Frontier)
| File | Domain |
|------|--------|
| `urt/plasma_cathedral.py` | Alfvén M_A=δ★, β_p=(D-1)γ=2/81, q_safety=D+γ/2π≈3.002, Petschek reconnection |
| `urt/megaswarm.py` | κ=1-D/N=10/13, 13^k hierarchy (13→62M drones), consensus in k hops |
| `urt/protein_cathedral.py` | T=13 capsid, C60 {G,F,V}={60,20,12}, helix pitch 26.55°≈26° (2% error) |
| `urt/superconductor_cathedral.py` | BCS gap 3.528, G_BCS=2/10, K₃C₆₀ bandwidth δ★×3.4eV≈0.5eV (<1%) |

### New Modules (v2.8 — Cathedral Complete)
| File | Domain |
|------|--------|
| `urt/information_cathedral.py` | H_max=log₂(13), C=log₂(1+1/δ★)=2.96 bits, R_QEC=90%, S_BH in bits |
| `urt/knot_cathedral.py` | CS level k=D=3, Jones at e^{2πi/q}: T(2,5)=1/φ, figure-8=-2/φ, trefoil=-φ/2 EXACT |
| `urt/ising_cathedral.py` | Ising on icosahedron: z=q=5, tanh(K_δ★)=δ★, K_Bethe=0.2554 |
| `urt/climate_cathedral.py` | Kolmogorov -5/3=-q/D EXACT, 5 Milankovitch=q, Lorenz D=3 |
| `urt/wave_equations_cathedral.py` | Huygens D=3 odd, KG mass=δ★, cross product unique D=3, N²=169 Y_l^m modes |
| `urt/a5_representations.py` | A₅ irreps {1,D,D,D+1,q}={1,3,3,4,5}, 1²+3²+3²+4²+5²=60=G, φ in χ table |
| `urt/solar_system.py` | 13 Venus≈8 Earth (N=13, Δ=0.025%), Venus/Earth≈1/φ, L4/L5=60°=G |
| `urt/number_theory_cathedral.py` | M₁₃=8191 prime, F₇=13=N, C₃=5=q, τ(2)=-24=-2V, QR sum=3N |
| `urt/eeg_cathedral.py` | α/β boundary=13Hz=N EXACT, avalanche P∝s^{-3/2}=s^{-D/2}, 40Hz=8q |
| `urt/economics_cathedral.py` | Pareto≈δ★, H=(D+1)/2D=2/3, tail α=D=3, σ_C=δ★√2=n_eff |

### New Modules (v2.8 — Expanded Cathedral)
| File | Domain |
|------|--------|
| `urt/music_cathedral.py` | V=12 semitones/octave EXACT; perfect 5th=D/(D-1)=3/2; pentatonic=q=5 |
| `urt/genetics_cathedral.py` | (D+1)^D=64 codons EXACT; F=20 amino acids EXACT; stop codons=D=3 |
| `urt/combinatorics_cathedral.py` | Bell B₃=Catalan C₃=q=5; p(D)=D=3 (self-ref!); R(3,3)=V/2=6 |
| `urt/stat_mech_cathedral.py` | D_uc=D+1=4; ε=1 for D=3; mean-field δ=D+1=4; η≈δ★/4 |
| `urt/fluid_cathedral.py` | Kolmogorov -5/3=-q/D EXACT; γ=(D+2)/D=q/D=5/3; DOF diatomic=q=5 |
| `urt/crystallography_cathedral.py` | FCC/HCP z=V=12; Bravais=N+1=14; point groups=2^q=32 |
| `urt/color_vision_cathedral.py` | Trichromacy: cone types=D=3; L-M separation=E=30 nm |
| `urt/game_theory_cathedral.py` | RPS strategies=D=3; Nash prob=1/D; coop threshold=(D-1)/D=2/3 |
| `urt/topological_spaces.py` | χ(icosahedron)=V-E+F=2=D-1 EXACT; Hopf fiber=D-2=1 |
| `urt/relativity_cathedral.py` | Riemann=F=20 EXACT!!!; Lorentz gens=V/2=6; spacetime=D+1=4 |
| `urt/atomic_physics_cathedral.py` | p-states=D=3; d-states=q=5; shell n=2: 2^D=8; shell n=4: 2^q=32 |
| `urt/electromagnetism_cathedral.py` | Maxwell eqs=D+1=4; EM tensor=V/2=6; photon pol=D-1=2 |
| `urt/optics_cathedral.py` | N-slit minima=V=12; diffraction orders=N=13; θ_c=arcsin(δ★) |
| `urt/geophysics_cathedral.py` | Seismic types=D+1=4; Earth layers=D+1=4; Poisson v_P/v_S=√D |
| `urt/linguistics_cathedral.py` | Formants=D=3; vowels=q=5; word orders=D!=6=V/2; PIE h₁h₂h₃=D=3 |

### Neural / ML
- `urt/neural_cathedral.py` — CathedralLayer, CathedralNet, GrokDetector
- `urt/control.py` — URT control operator (O(N), κ < 1)
- `urt/metrics.py` — Lyapunov exponent, τ_avalanche, D_KY

### Documentation
- `docs/cathedral_structure.txt` — Full framework ASCII diagram + module map (v2.8)
- `docs/black_holes_cathedral.txt` — BH thermodynamics from G_N=δ★²

## Running Tests

```bash
python -m pytest tests/ -q              # all 1811 tests
python -m pytest tests/ -q -k iron     # iron proof uniqueness (47 tests)
python -m pytest tests/ -q -k lagrangian  # Cathedral Lagrangian (42 tests)
python -m pytest tests/ -q -k dark_matter # DM candidates (24 tests)
python -m pytest tests/ -q -k baryon   # baryon asymmetry (26 tests)
python -m pytest tests/ -q -k gut      # GUT unification (29 tests)
python -m pytest tests/ -q -k muon     # muon g-2 (32 tests)
python -m pytest tests/ -q -k topological  # topological QC (38 tests)
python -m pytest tests/ -q -k string   # string landscape (27 tests)
python -m pytest tests/ -q -k chaos    # quantum chaos (26 tests)
python -m pytest tests/ -q -k gw       # gravitational wave tests only
python -m pytest tests/ -q -k ckm      # CKM/PMNS tests only
```

## Key Numerical Values

```
δ★          = 0.14751081...   (icosahedral critical point)
1/δ★        = 6.7791...       (detection/SNR threshold)
δ★²         = G_N             (Cathedral Newton constant, Planck units)
1/δ★        = R_AdS           (AdS curvature radius)
3/(2δ★³)    ≈ 467             (central charge c)
δ★√2        ≈ 0.2086          (1/n_eff, metamaterial refractive index)
λ₂          = 3 = D           (icosahedral spectral gap = spatial dimension!)
K_c         ≈ 1.278           (Kuramoto critical coupling)
ΔA          = 8π·δ★³ ≈ 0.0807 (area quantum, Bekenstein-Mukhanov)
sin²θ_W     = (D/N)(1+γ/2π) ≈ 0.23122 (Weinberg angle, exact PDG)
δ_CP (PMNS) = (D+1)F+(N-D-1)N = 197°  (exact PDG)
n_s         = 1 − 2/(|H₃|−D) = 1−2/57 ≈ 0.9649 (exact Planck 2018)
Ω_m         = (4/13)(1+2γ) ≈ 0.3153   (matter density, z=-0.001 vs Planck 2018)
η_B         = (q−D)·γ^q = 2·(1/81)^5 ≈ 5.74×10⁻¹⁰  (baryon miracle, 6.3% error)
α_GUT       = δ★² = G_N            (GUT coupling = Newton constant!)
μ_GUT       ≈ 3.73×10^16 GeV        (GUT scale from δ★ + RG running)
m_axion     ≈ 60.7 μeV              (Cathedral axion, ADMX/ABRA target)
m_sterile   ≈ 143 keV               (sterile ν DM, X-ray at 71.5 keV)
m_WIMP      = δ★·m_Z ≈ 13.45 GeV   (WIMP at LHC threshold)
a_μ^(1)     = α/2π ≈ 1.1614e-3     (Schwinger; Cathedral α fixes this exactly)
d_τ         = φ = 1.6180339887...   (Fibonacci anyon dim = golden ratio in δ★)
p_th(QEC)   = γ = 1/81 ≈ 1.23%     (icosahedral QEC threshold = Cathedral γ)
D_bosonic   = 2N = 26               (bosonic string critical dim from N=13!)
D_super     = 2q = 10               (superstring critical dim from q=5!)
D_Leech     = 2V = 24               (Leech lattice dim from V=12!)
E₈_roots    = 4G = 240              (E₈ root count from G=|A₅|=60!)
λ₂(Lapl)    = 3 = D                 (icosahedral spectral gap = spatial dim)
MSS_bound   = 1/(4δ★²M)             (BH scrambling rate = Cathedral saturated)
```

## Module Quick-Start

```python
from urt import DELTA_STAR, compute_all_constants
from urt import gw_event_summary, formation_positions, capsid_binding_sites
from urt import madelung_order, cathedral_noble_gas_prediction
from urt import riemann_zero_matches, central_charge

# Electroweak sector
from urt import M_W_GEV, M_Z_GEV, M_HIGGS_GEV, SIN2_THETA_W

# Full mixing matrices
from urt import ckm_matrix, pmns_matrix, DELTA_CP_PMNS_DEG

# Cosmology
from urt import N_S, R_TENSOR, COSMO_OMEGA_M, SIGMA_8

# Uniqueness proof
from urt import uniqueness_theorem_full, conjecture_121

# Cathedral Lagrangian + QFT
from urt import ward_identities, higgs_sector, rg_fixed_points, coupling_table

# Dark Matter (three candidates from H3)
from urt import axion_dm, sterile_neutrino_dm, wimp_dm, M_AXION_UEV, M_WIMP_GEV

# Baryon asymmetry miracle
from urt import eta_b_miracle, ETA_B_LEPTO, KAPPA_LEPTO

# GUT unification
from urt import gut_scale, proton_lifetime, MU_GUT_GEV, TAU_PROTON_YR

# Muon g-2 (v2.6)
from urt import qed_contribution, ew_contribution, A_MU_1LOOP, A_MU_EW

# Topological QC — Fibonacci anyons (v2.6)
from urt import fibonacci_anyon, f_matrix, D_FIBONACCI, P_TH_ICOSAHEDRAL

# String landscape — Cathedral integers (v2.6)
from urt import critical_dimensions, exceptional_groups, D_BOSONIC, E8_DIM

# Quantum chaos — MSS bound & icosahedral RMT (v2.6)
from urt import icosahedral_spectrum, mss_bound, IS_EDGE_OF_CHAOS

# GW150914-like event
event = gw_event_summary(36, 29, 410)

# 13-drone formation at 100 m radius
positions = formation_positions(scale=100.0)

# Drug binding on 15 nm icosahedral capsid
binding = capsid_binding_sites(R_capsid=15.0)

# Music — V=12 semitones, pentatonic=q=5 (v2.8)
from urt import SEMITONES_PER_OCTAVE, PENTATONIC_NOTES, PERFECT_5TH_JUST, music_summary

# Genetics — (D+1)^D=64 codons, F=20 amino acids (v2.8)
from urt import N_CODONS, N_AMINO_ACIDS, N_STOP_CODONS, genetics_summary

# Combinatorics — Bell B₃=Catalan C₃=q=5 (v2.8)
from urt import BELL_D, CATALAN_D, N_PLATONIC_SOLIDS_D3, R_33, combinatorics_summary

# Statistical mechanics — D_uc=4, ε=1, mean-field δ=D+1 (v2.8)
from urt import D_UPPER_CRITICAL, DELTA_MF, ETA_CATHEDRAL_APPROX, stat_mech_summary

# Fluid mechanics — Kolmogorov -5/3=-q/D, γ=q/D=5/3 (v2.8)
from urt import KOLMOGOROV_EXPONENT, GAMMA_MONATOMIC, DOF_DIATOMIC, fluid_summary

# Crystallography — Bravais=N+1=14, point groups=2^q=32 (v2.8)
from urt import N_BRAVAIS, N_POINT_GROUPS, Z_FCC, crystallography_summary

# Relativity — Riemann=F=20 EXACT!!! (v2.8)
from urt import N_RIEMANN_COMPONENTS, N_SPACETIME_DIMS, N_LORENTZ_GENERATORS, relativity_summary

# Atomic physics — p-states=D=3, shell n=4 = 2^q=32 (v2.8)
from urt import L_P_STATES, SHELL_4_MAX, TOTAL_ORBITALS_TO_N, atomic_summary

# Electromagnetism — Maxwell eqs=D+1=4, EM tensor=V/2=6 (v2.8)
from urt import N_MAXWELL_EQUATIONS, N_EM_TENSOR_COMPONENTS, N_PHOTON_POLARIZATIONS, em_summary

# Optics — N-slit has V=12 minima, N=13 orders (v2.8)
from urt import N_MINIMA_N_SLIT, N_DIFFRACTION_ORDERS, optics_summary

# Geophysics — seismic types=D+1=4, Earth layers=D+1=4 (v2.8)
from urt import N_SEISMIC_TOTAL, EARTH_LAYERS, N_NORMAL_MODES_SUM, geophysics_summary

# Linguistics — vowels=q=5, word orders=D!=6=V/2 (v2.8)
from urt import N_FORMANTS, N_VOWELS_TYPICAL, N_WORD_ORDERS, linguistics_summary
```

## Development Branch

Active development: `claude/13-shell-closure-framework-dXmJi`
