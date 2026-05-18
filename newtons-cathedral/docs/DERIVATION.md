# The full derivation chain

This document walks through every closed form in the framework, from
the spatial dimension `D = 3` to the 26 predictions.  Each step is a
single deduction.

## Step 1.  D = 3 forces A_5.

Jordan (1870): the finite subgroups of `SO(3)` are exactly

```
    cyclic Z_n,  dihedral D_n  (any n),
    A_4, S_4, A_5  (the three Platonic solid symmetry groups).
```

Of these, `A_5` is the unique non-cyclic simple subgroup of order at
least 60.  This `A_5` is also the rotation group of the icosahedron /
dodecahedron — the maximally-symmetric 12-vertex configuration on `S²`.

## Step 2.  A_5 forces the seven Cathedral integers.

`|A_5|` = 60 factorises as `(D+1) · D · q` where:

- `D + 1 = 4` is the order of the Klein 4-subgroup `Z_2 × Z_2 ⊂ A_5`
  (the K_4 sector — visible 4D spacetime),
- `D = 3` is the order of the rotation stabiliser of each face,
- `q = D + 2 = 5` is the order of the rotation stabiliser of each
  vertex (the 5-fold axes).

Orbit-stabiliser theorem applied to A_5 acting on the icosahedron gives

    V = |A_5| / q = 60/5 = 12     vertices
    E = |A_5| / 2 = 60/2 = 30     edges
    F = |A_5| / D = 60/3 = 20     faces

The centred-icosahedral closure puts a vertex at the centre, giving

    N = D² + D + 1 = 13           (Heron / centred-icosahedral)

(or equivalently `N = V + 1`).

## Step 3.  D = 3 forces γ and φ.

The icosahedron's vertex stabiliser is `Z_q = Z_5`.  The Z_5 character
table is defined over `Q(√5)`, and the unique irrationality is

    φ = (1 + √5) / 2

The self-referential entropy scaling is

    γ = D^{-(D+1)} = 1/81 = 1/(D^4)

A coincidence: `1/γ = D^{D+1}` is the *fourth* power of D, mirroring
the four-dimensional spacetime emerging from `K_4`.

## Step 4.  The vacuum vertex δ★.

The π-φ-e flow has the equilibrium

    δ★  =  (1 − γ) · π / (N · φ)
         =  (80/81) · π / (13 · φ)
         ≈  0.14751081

This is the unique fixed point at which the parabolic gradient flow on
`G_{13}` is at rest.  See `dynamics.py` for the dynamical derivation.

## Step 5.  The classical rail δ_cl.

The classical rail is

    δ_cl  =  D / F  =  3 / 20  =  0.15

— the ratio of spatial dimension to icosahedral face count, and the
eigenvalue-D mode amplitude on `G_{13}`.

## Step 6.  The gap Δ.

    Δ  =  δ_cl − δ★  ≈  2.489 × 10⁻³

Δ is the only "small non-zero number" in the framework and drives:

- the baryon asymmetry  η_B = γ³ · Δ · δ★ · (8/9)
- the pre-vacuum potential V(δ_cl) = ½·Δ²·(1+δ_cl²)
- the matter-direction inequality margin (D·N·φ − F·(1−γ)·π ≈ π/D)

## Step 7.  The centred icosahedral graph G_{13}.

13 vertices = 1 centre + 12 surface.  Edges:

- centre to each surface vertex,
- surface vertex i to surface vertex i + k (mod 12) for k ∈ {1, 5, 7, 11}
  (the units of Z_12).

The Laplacian spectrum is purely Cathedral:

    L_{G_{13}} eigenvalues  =  { 0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13 }

with multiplicities

    0 (×1)   the trivial constant mode
    3 (×2)   Fiedler doublet (spatial dimension!)
    5 (×6)   degenerate sextet (A_5 exhaust)
    7 (×2)   doublet
    9 (×1)   highest internal mode
    13 (×1)  rank-1 boundary mode (= N)

Trace = D! · V = 72.

## Step 8.  K_4 ⊕ A_5 sector decomposition.

13 modes split into K_4 (4) and A_5 (9):

    K_4 sector eigenvalues: { 0, 3, 3, 5 }              tr = 11
    A_5 sector eigenvalues: { 5, 5, 5, 5, 5, 7, 7, 9, 13 } tr = 61
    total                                                tr = 72 = D!·V

The K_4 sector hosts visible 4D physics; A_5 hosts the 9D dark exhaust.
Sector ratio R(D) = (D+1)/(D!+D) = 4/9 is a D = 3 fingerprint.

## Step 9.  The π-φ-e dynamical flow.

Over-damped Langevin EOM on G_{13}:

    ∂_t δ  =  −η_L · L · δ   −   μ · (δ − δ★) · (1 + δ²)

with coefficients

    η_L  =  1 / (4π)        (spherical surface measure |S²| in D = 3)
    η    =  1 / (8π)        (Euler half-step convention)
    μ    =  φ − 1 = 1/φ     (A_5 character-table irrationality)

URT iteration (forward-Euler):

    δ_{k+1}  =  δ_k  +  η · ( −η_L · L · δ_k  −  μ · (δ_k − δ★) · (1 + δ_k²) )

Strict contraction on every non-constant Laplacian mode →
universe-from-chaos arc:

    1. random initial condition δ_0 ~ U[0, 0.5]
    2. URT iteration drives variance to zero
    3. field settles on δ★·𝟙 to machine precision
    4. rails split: δ★ vacuum vs δ_cl classical
    5. gap Δ ≈ 2.49 × 10⁻³ forms
    6. η_B = γ³ · Δ · δ★ · (8/9) ≈ 6.14 × 10⁻¹⁰  matter wins.

## Step 10.  The 26 predictions.

Every entry in `predictions.all_predictions()` is a closed-form
function of the above quantities.

### Fine structure: 1/α

    Bare:   N² − E − (D−1)  =  169 − 30 − 2  =  137
    Full:   137  +  δ★²/π²  +  3/((D+1)^D · φ)  +  1/((4F−1) · φ²)
            ≈  137.0360100481    (CODATA: 137.0359990)

### Proton-to-electron mass ratio

    Bare:   (D+1)·D^D·(N+D+1)  =  4·27·17  =  1836
    Full:   1836  +  2·δ_cl  −  δ★
            ≈  1836.15249       (CODATA: 1836.15267)

### Weinberg angle

    sin²θ_W  =  (D/N) · (1 + γ/(2π))
             =  (3/13) · (1 + 1/(81·2π))
             ≈  0.23122       (PDG: 0.23122)

### Strong coupling

    α_s(M_Z)  =  δ★ · (q − 1) / q  =  δ★ · 4/5  ≈  0.11801   (PDG: 0.1179)

### Higgs and top masses

    m_H    =  q^D  =  5³  =  125 GeV    (PDG: 125.10 ± 0.14)
    m_top  =  (N + 1) · V + q  =  14·12 + 5  =  173 GeV    (PDG: 172.69 ± 0.30)

### Spectral index, e-folds, tensor-to-scalar

    N_e  =  G − D  =  57    (the Tesla bilinear D + D!·D² = 3 + 6·9)
    n_s  =  1 − 2/N_e  =  55/57  =  0.96491   (Planck: 0.9649)
    r    =  12 / N_e²  =  12/57²  ≈  0.00369   (BICEP/Keck bound: r < 0.036)

### Cosmological constant

    Λ/M_Pl⁴  =  D / (D+1)² · γ^{(D+1)^D}
              =  (3/16) · γ^64
              ≈  1.35 × 10⁻¹²³    (Planck 2018: 1.35 × 10⁻¹²³)

The exponent `(D+1)^D = 64 = 2^(2D)` is the K_4-cube vertex count —
the framework's K_4-cube vacuum-bubble derivation of the cosmological
constant.

### Matter density

    Ω_m  =  (4/N) · (1 + 2γ)  =  (4/13) · (83/81)  ≈  0.31529   (Planck: 0.3158)

### CMB scalar amplitude

    A_s  =  N_e² · (D+1)³ · q · (32/9) · π⁴ · γ⁹ · cos⁴(π/V)
         ≈  2.088 × 10⁻⁹    (Planck: 2.10 × 10⁻⁹)

### CP-violating phase

    δ_CP  =  (D+1) · F  +  (N − D − 1) · N
          =  80  +  117
          =  197°   (T2K + NOvA: ≈ 197°)

Note the Cathedral bridge `1/α + |A_5| = 137 + 60 = 197 = δ_CP`.

### Baryon asymmetry

    η_B  =  γ³ · Δ · δ★ · (8/9)
         ≈  6.14 × 10⁻¹⁰   (Planck: 6.12 × 10⁻¹⁰)

8/9 = `2 · (D+1) / (D! + D) = 2 · 4/9`  = doubled sector ratio.

### Hubble tension ratio

    H_0(local) / H_0(CMB)  =  1 + 2D/(F·π)  =  1 + 3/(10π)  ≈  1.0955

— a non-trivial cosmology prediction that matches the SH0ES vs Planck
tension to ~1 %.

### Newton's constant + Einstein-Hilbert action

    G_N  =  δ★²

Einstein-Hilbert action with zero free parameters:

    S  =  ∫ d⁴x √(−g) · [ (R − 2Λ) / (16π · δ★²)  +  L_δ ]

    L_δ  =  (1/2)·(∂δ)²  −  V(δ)
    Λ    =  (D/(D+1)²) · γ^{(D+1)^D} · M_Pl⁴

Variation:  G_μν + Λ·g_μν = 8π · δ★² · T_μν.

### Dark sector

    m_axion         =  δ★ / |R_mass| · 10³ µeV    R_mass = A_5 mass residue
    m_sterile_ν     =  γ² · m_p
    m_WIMP          =  δ★ · m_Z
    Casimir ΔF/F   =  (a₀/d)² · 4/9               at separation d (= 4/9 fingerprint)
    spectral line   =  (m_axion·c²/h) · δ★

## Step 11.  Audit gates.

Every closed form above is verified at machine precision in
`tests/test_*.py`.  The top-level CI gate is

```python
from urt import all_audits_pass
assert all_audits_pass()       # 16 module audits + 26 predictions
```

`pytest tests/` runs all 96 unit tests; all pass.
