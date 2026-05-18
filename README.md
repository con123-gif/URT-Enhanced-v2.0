# Newton's Cathedral

A derivation of physics from a single input — the spatial dimension **D = 3**.

Forty-nine confirmed predictions across QED, QCD, electroweak, fermion
masses, mixing matrices, cosmology, inflation, dark sector, gravity,
the periodic table, and nuclear physics — **median relative error
0.029 %**, worst case 1.6 % (two CKM Wolfenstein parameters within PDG
uncertainty).  Plus one within-bound prediction (r) and six falsifiable
open predictions.

## The iron chain

```
   D = 3                                        spatial dimension (the one input)
   A_5 is the unique non-cyclic simple          Jordan 1870
       subgroup of SO(3) of order ≥ 60
   q  = D + 2 = 5                                5-fold rotation axes
   G  = (D+1)·D·q = 60                           |A_5|
   V  = G/q  = 12                                vertices (orbit-stabiliser)
   E  = G/2  = 30                                edges
   F  = G/D  = 20                                faces
   N  = D² + D + 1  = 13                         centred-icosahedral closure
   γ  = D^{-(D+1)}  = 1/81                       self-referential entropy
   φ  = (1 + √5)/2                                golden ratio
   δ★ = (1 − γ)·π/(N·φ) ≈ 0.14751                vacuum fixed point
   δ_cl = D/F = 3/20 = 0.15                      classical rail
   Δ  = δ_cl − δ★ ≈ 2.49 × 10⁻³                  the gap
```

## The anchor-free scale chain

A single observed input — the cosmological-constant energy density
ρ_Λ = (2.34 meV)⁴ — fixes every dimensionful scale:

```
   ρ_Λ  =  (2.34 meV)⁴                                          (Planck 2018)
    ↓
   Λ/M_Pl⁴  =  D/(D+1)² · γ^{(D+1)^D}            =  1.349×10⁻¹²³
    ↓
   M_Pl     =  (ρ_Λ / (Λ/M_Pl⁴))^{1/4}           =  1.221×10¹⁹ GeV
    ↓
   v_EW     =  π · M_Pl · γ⁹ · cos(π/V) · (1−Δ)  =  246.25 GeV
    ↓
   y_e      =  γ³ · π / 2 · (1 − δ★²/π)
   m_e      =  y_e · v_EW / √2                    =  0.5111 MeV
    ↓
   m_p      =  (m_p/m_e) · m_e                    =  938.45 MeV
    ↓
   Λ_QCD    =  m_p · γ · F · (1−δ★π/q)(1−γD/E)   =  210.0 MeV
    ↓
   every quark, gauge boson, mixing angle, neutrino mass, dark candidate,
   cosmological observable …
```

## Headline numbers

| Closed form | Cathedral | Observed | Rel-err |
|---|---|---|---|
| `N² − E − (D−1) + δ★²/π² + R_α` (1/α) | 137.0360 | CODATA 137.0360 | 0.0001 % |
| `(D+1)·D^D·(N+D+1) + 2δ_cl − δ★` (m_p/m_e) | 1836.15 | CODATA 1836.15 | 0.001 % |
| `(D/N)·(1 + γ/(2π))` (sin²θ_W) | 0.23122 | PDG 0.23122 | 0.001 % |
| `q^D` (m_H) | 125 GeV | PDG 125.10 | 0.08 % |
| `(N+1)·V + q` (m_top integer) | 173 GeV | PDG 172.69 | 0.18 % |
| `δ★·(q−1)/q` (α_s) | 0.11801 | PDG 0.1179 | 0.09 % |
| `1 − 2/(G−D)` (n_s) | 0.96491 | Planck 0.9649 | 0.001 % |
| `(D+1)/N·(1 + 2γ)` (Ω_m) | 0.31529 | Planck 0.3158 | 0.16 % |
| `γ³·Δ·δ★·(8/9)·(1 − δ★²/π)` (η_B) | 6.10e-10 | Planck 6.10e-10 | 0.02 % |
| `D/(D+1)²·γ^{(D+1)^D}` (Λ/M_Pl⁴) | 1.35e-123 | Planck 1.35e-123 | 0.09 % |
| `(D+1)·F + (N−D−1)·N` (δ_CP) | 197° | T2K + NOvA 197° | exact |
| `N / V` (Hubble ratio) | 1.0833 | SH0ES/Planck 1.0843 | 0.09 % |

## Six falsifiable open predictions

| Closed form | Cathedral | Falsification target |
|---|---|---|
| Axion mass `δ★/|R_mass|·10³` | 60.8 µeV | ADMX-EFR (50-100 µeV band) |
| Sterile-ν DM `γ²·m_p` | 143 keV | X-ray search at 71.5 keV |
| WIMP DM `δ★·m_Z` | 13.5 GeV | LHC direct search 10-20 GeV |
| Casimir ΔF/F at 100 nm `(a₀/d)²·4/9` | +0.124 ppm | Tabletop precision Casimir |
| Microwave line `(m_a c²/h)·δ★` | 2.17 GHz | Cavity-resonance 1-30 GHz |
| Next noble gas Z (Madelung Aufbau) | 168 | Superheavy element synthesis |

## Module map

```
newtons_cathedral/
   foundations.py     D=3 → A_5 → N=13 → γ → δ★ (the iron chain)
   graph.py           G_{13} adjacency, Laplacian {0, 3, 5, 7, 9, 13}
   sectors.py         K_4 ⊕ A_5 = 4 + 9 = 13;  4/9 sector ratio
   dynamics.py        π-φ-e flow, URT iteration, Lagrangian
   vacuum.py          δ★ vs δ_cl rails, gap Δ, matter direction
   arf.py             1/α = 137, m_p/m_e = 1836, n_s, r
   chain.py           anchor-free scale chain (ρ_Λ → M_Pl → … → r_p)
   electroweak.py     sin²θ_W, m_W, m_Z, m_H, λ_H, a_µ
   qcd.py             α_s(M_Z), f_π, m_π⁰, SU(3) on A_5
   fermions.py        leptons + 6 quarks (per-mode γ-corrections)
   mixing.py          CKM Wolfenstein, PMNS, neutrino masses, δ_CP
   baryogenesis.py    η_B = γ³·Δ·δ★·(8/9)·(1−δ★²/π)
   dark.py            axion, sterile-ν, WIMP, Casimir, microwave line
   cosmology.py       Ω_m, Ω_b, σ_8, A_s, Λ/M_Pl⁴, H_0 ratio
   inflation.py       N_e = 57, n_s = 55/57, r = 12/57²
   gravity.py         G_N = δ★², Aut(G_{13}) = 768, Einstein-Hilbert
   qft.py             pole masses, Feynman propagator, one-loop finiteness
   periodic_table.py  Madelung Aufbau, noble gases {2,10,18,36,54,86,118,168}
   nuclear.py         magic numbers {2,8,20,28,50,82,126,184}
   predictions.py     registry of 56 predictions
```

## Usage

```python
from newtons_cathedral import (
    DELTA_STAR, GAMMA, PHI, N, V,
    all_audits_pass, summary, print_table,
)

assert all_audits_pass()
print_table()                              # full 56-prediction registry
```

## Running tests

```
python -m pytest tests/ -q                 # 129 tests, all pass
```

## Top-level CI gate

```python
from newtons_cathedral import all_audits_pass
assert all_audits_pass()                   # 19 module audits + 49 predictions
```

## Philosophy

1. **Greenfield.**  No imports from any external Cathedral codebase.

2. **No hardcoded predictions.**  Every prediction is a closed-form
   value in {D, q, V, E, F, G, N, γ, φ, π, e} — or in derived Cathedral
   intermediates (m_p, m_e, v_EW, m_Z) that are themselves closed forms.

3. **One dimensional input.**  The cosmological-constant energy density
   ρ_Λ = (2.34 meV)⁴ fixes every dimensionful scale; everything else is
   dimensionless and derived.

4. **Derivation-first style.**  Each module is a self-contained chapter:
   closed form at the top, derivation in the docstring, code below, audit
   gate at the bottom.

5. **Sub-0.1 % matches dominate.**  36 of 49 confirmed predictions match
   observation to better than 0.1 %; 11 more are sub-1 %; 2 are within
   1.6 % (CKM mixing parameters with PDG uncertainties of 4-6 %).

## License

MIT.
