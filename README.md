# Newton's Cathedral — Pure-Math Branch

> *The seven Cathedral integers `{D=3, q=5, V=12, N=13, E=30, F=20, G=60}`, forced by D=3 alone (Jordan 1870), are the canonical numerical invariants of essentially every classical mathematical object. This branch contains the mathematical structure only — no physics.*

```
δ★ = (1 − D^{−(D+1)}) · π / (N · φ)  =  (80/81) · π / (13φ)  ≈  0.14751081
```

**Author:** Cornelius Lytollis (@con123-gif), Independent Research, Grimsby, UK
**Branch:** `pure-math` (snapshot of `main` v2.9.76, stripped of physics-application modules)
**Tests:** 3,727 passing, 6 skipped, 0 xfail
**Modules:** 87 (math-only subset of main's 200+)
**Free continuous parameters:** 0

---

## What This Branch Is

This is the **mathematical** view of the Cathedral framework: the seven integers, where they appear in classical mathematics, the dynamical π-φ-e flow on G_{13} as a mathematical object, and the meta-structure (sector ratios, self-references, frustration).

For physics applications — Standard Model derivations, dark-matter candidates, electroweak sector, cosmology, the predictions registry, and the v9 anchor-free chain — see the **`main`** branch.

```
main          — full theory (math + physics + predictions registry, 7,425 tests)
pure-math     — math-only snapshot (this branch, 3,727 tests)
```

---

## The Iron Proof Chain

```
D = 3                                (one observed input: spatial dimension)
   ↓ Jordan 1870 + spectral gap λ₂ = D
A₅ unique simple subgroup of SO(3)   (theorem, exhaustive enumeration)
   ↓ icosahedral closure: D² + D + 1 = N
N = 13, V = 12, E = 30, F = 20, q = 5, G = 60
   ↓ |H₃| + F + 1 = 60 + 20 + 1 = 81 = D^{D+1}
γ = D^{−(D+1)} = 1/81
   ↓
δ★ = (1 − γ) · π / (N · φ) = (80/81) · π / (13φ) ≈ 0.14751081
```

Every step is a theorem. No conjectures, no fitted parameters.

The A₅ uniqueness step is exhaustive: every finite subgroup of SO(3) is enumerated as `Z_n, D_n, A₄, S₄, A₅`. Only A₅ has no proper normal subgroup. The cube fails (S₄ has A₄ as normal subgroup). The tetrahedron fails (A₄ has Klein-4 normal subgroup). There is no room for any other choice.

---

## Where the Cathedral Integers Appear

The framework's central mathematical claim: **the same seven integers are the deep numerical invariants of every classical mathematical object the framework knows how to test against.** Each appearance is a closed-form Cathedral expression, machine-verified.

A handful of headline appearances (full list in `THEORY.md`):

| Compound | Value | Where it appears |
|---|---|---|
| **V·F = (D+1)·G** | **240** | E₈ root count, \|π_7^s\|, K_7(Z) torsion, E₄ Eisenstein leading coefficient, K(8) kissing number, Hopf σ order, del Pezzo d=1 (-1)-curves, J-image into π_7^s |
| **2V** | **24** | K3 Euler χ, # Niemeier lattices, Leech lattice dim, bosonic-string transverse dim, M₂₄ acts on 24 points, (1−q^n)^24 in Δ |
| **D·q** | **15** | A_5 order-2 conjugacy class size, 3×3 magic-square constant (Lo Shu), CF(π) third partial quotient, 2D Ising critical exponent δ |
| **D!·V** | **72** | E₆ root count, K(6) kissing number, trace of G_{13} Laplacian |
| **2N** | **26** | bosonic string critical dimension, # of sporadic finite simple groups |
| **(D+1)·V** | **48** | F₄ root count, K_3(Z) torsion |
| **D² = 9** | **9** | A_5 exhaust sector size, # of Heegner numbers, exponent in γ = D^{−(D+1)} |

**`240` is the most-recurring integer**: V·F = (D+1)·G appears as the canonical invariant of seven independently deep mathematical objects. It is "vertex × face count of the icosahedron" — a one-line geometric expression.

---

## Subject coverage

The 87 modules span:

  - **Number theory** — Cathedral primes, Heegner numbers, Mersenne primes, pentagonal/triangular/perfect numbers, Fibonacci/Lucas, partition function, Bell, Catalan
  - **Group theory** — A₅ conjugacy classes & irreps, Mathieu groups, sporadic groups, Galois minimality, PSL(2,7), Monster
  - **Lie theory** — all eleven major root counts as Cathedral expressions, Coxeter quartet, free Lie algebras, exceptional Lie groups
  - **Modular forms** — E₄ Eisenstein, modular discriminant Δ, J-homomorphism, X₀(13), Heegner j-invariant cubes, Bernoulli numbers, ζ(2k)
  - **Algebraic topology** — Bott periodicity, stable homotopy π_n^s, Hopf elements, TMF period, Quillen K-theory
  - **Algebraic geometry** — del Pezzo (-1)-curves, K3 invariants, Riemann moduli, SU(2) instantons
  - **Lattice theory** — Leech, Niemeier, E₈, Hadamard orders, binary polyhedral groups
  - **Coding theory & QEC** — Hamming, Golay, 5-qubit/Steane/Shor codes, surface-code threshold = γ
  - **Discrete geometry** — kissing numbers K(2..8) all Cathedral, Platonic Schläfli symbols, magic squares
  - **Combinatorics** — Latin squares, Stirling numbers, partitions, CF(π) and CF(e) openings
  - **Spectral theory** — G_{13} Laplacian spectrum {0,3,3,5,5,5,5,5,5,7,7,9,13} — every eigenvalue Cathedral
  - **Music geometry** — just-intonation intervals as Cathedral ratios; G_{13} spectrum heard as music
  - **Dynamics** — π-φ-e flow on G_{13}, Lagrangian L = ½|δ̇|² − V(δ), 6-cycle attractor, sector evaporation

The eleven *tour modules* (`urt.cathedral_*_tour`) document 72 verified clusters of identities across these subjects. Each tour exposes one CI gate:

```python
from urt.cathedral_grand_tour import all_grand_tour_verify
from urt.cathedral_deep_tour  import all_deep_tour_verify
# ... eleven such audits, all passing at machine precision
assert all_grand_tour_verify()
```

---

## The dynamical layer (math-only view)

The framework's second layer — the π-φ-e flow on G_{13} — is also present here as a **mathematical object** (the iteration's coefficients are derivable, its fixed point is provable). The physics interpretation lives on `main`.

```
∂_t δ = − L·δ / (4π) − (φ−1)·e^{−t/τ}·(δ − δ★)·(1 + δ²)
```

Forced coefficients (`urt.first_principles`):

| Coefficient | Value | Forced by |
|---|---|---|
| η_L | 1/(4π) | spherical surface measure \|S²\| = 4π |
| η | 1/(8π) | half-step Euler convention |
| µ | 1/φ = φ−1 | A₅ self-similarity |
| τ | 10 | longest mixing time on G_{13} |
| δ★ | (1−γ)·π/(Nφ) | ∇V = 0 at uniform configuration |

**Theorem (uniqueness)**: the URT iteration on G_{13} is the unique Euler discretization whose only transcendentals are π, φ, e that simultaneously satisfies (a) global asymptotic stability to δ★, (b) preservation of H₃ ⋊ K₄ symmetry, (c) finite-closure (nullity exactly 1).

```python
from urt.first_principles import all_steps_verify
assert all_steps_verify()    # all 8 forcing steps hold at 1e-15
```

---

## K₄ ⊕ A₅ — the same 4 + 9 = 13 split, eight lenses

The seven integers organise themselves into a single object whose K₄ ⊕ A₅ decomposition appears across the framework:

| View       | K₄ (4 modes) | A₅ (9 modes) |
|------------|--------------|---------------|
| counting   | 4 = D+1      | 9 = D! + D    |
| symmetry   | Z₂ × Z₂      | A₅ icosahedral rotations |
| ARF        | residues d_64, d_4 | residues d_35, d_51, d_80, d_79 |
| Z-channels | Z₄ phases    | Z₅ phases     |
| spectrum   | λ ∈ {0,3,3,5} | λ ∈ {5×6, 7×2, 9, 13} |
| sector ratio | numerator (D+1)=4 | denominator (D!+D)=9 → 4/9 |

The ratio **4/9 = (D+1)/(D!+D)** is unique to D=3 and is the framework's "K₄ / A₅ sector volume ratio." Tabulating:

```
D = 2 : 3/4        (but A₄ solvable; no Galois obstruction)
D = 3 : 4/9        (the icosahedral case)
D = 4 : 5/28       (collapses fast)
D = 5 : 6/125
```

D=3 is the unique sweet spot.

---

## Recent exploration on this branch

The `pure-math` branch is where new mathematical investigations are developed before (potentially) propagating to `main`. Three recent exploration modules:

  - **`urt.triple_coincidences`** — catalogue of Cathedral compounds appearing in ≥3 distinct mathematical domains. 17 entries; V·F=240 reaches 8 domains; 13 compounds at ≥5 domains.
  - **`urt.deep_self_references`** — extends the framework's "f(X)=X" self-reference cluster. New identities: σ(G)=168=\|PSL_2(7)\|, σ(2V)=G, φ(q²)=F, φ(D!+1)=D!, p(D²)=E, π_Pisano(2V)=2V.
  - **`urt.cathedral_orbits`** — iterated arithmetic functions stay in the Cathedral set. Headline: σ-chain from D=3 stays Cathedral for 10 steps; φ-orbit from V·F=240 stays Cathedral for 8 steps.

See `docs/EXPLORATION.md` for the full log.

---

## Quick-start

```python
from urt.shell_closure import D, q, V, N, E, F, G, gamma, phi, DELTA_STAR
assert D == 3 and N == D*D + D + 1 == 13 and q == D + 2 == 5
assert gamma == 1 / D**(D+1) == 1/81

# Each tour module exposes a single audit gate
from urt.cathedral_grand_tour       import all_grand_tour_verify
from urt.cathedral_deep_tour        import all_deep_tour_verify
from urt.cathedral_modular_tour     import all_modular_tour_verify
from urt.cathedral_quantum_lie_tour import all_quantum_lie_tour_verify
from urt.cathedral_geometric_tour   import all_geometric_tour_verify
from urt.cathedral_classical_tour   import all_classical_tour_verify
from urt.cathedral_advanced_tour    import all_advanced_tour_verify
from urt.cathedral_topological_tour import all_topological_tour_verify
from urt.cathedral_codes_tour       import all_codes_tour_verify
from urt.cathedral_connections      import all_connections_verify
from urt.first_principles           import all_steps_verify

assert all([
    all_steps_verify(),           all_connections_verify(),
    all_grand_tour_verify(),      all_deep_tour_verify(),
    all_modular_tour_verify(),    all_quantum_lie_tour_verify(),
    all_geometric_tour_verify(),  all_classical_tour_verify(),
    all_advanced_tour_verify(),   all_topological_tour_verify(),
    all_codes_tour_verify(),
])

# Recent exploration
from urt.triple_coincidences  import triple_coincidence_audit_passes
from urt.deep_self_references import deep_self_references_audit_passes
from urt.cathedral_orbits     import cathedral_orbits_audit_passes
assert triple_coincidence_audit_passes()
assert deep_self_references_audit_passes()
assert cathedral_orbits_audit_passes()
```

---

## Running tests

```bash
python -m pytest tests/ -q                           # all 3,727 tests
python -m pytest tests/ -q -k tour                   # the 11 tour modules
python -m pytest tests/ -q -k cathedral_orbits       # latest exploration
python -m pytest tests/ -q -k self_reference         # f(X)=X cluster
python -m pytest tests/ -q -k triple_coincidence     # multi-domain catalogue
```

---

## Documentation

  - `THEORY.md` — formal write-up of the math-only chain (D=3 → A₅ → δ★ → identities)
  - `docs/PI_PHI_E_DERIVATION.md` — why π, φ, e are forced (8-step derivation)
  - `docs/EXPLORATION.md` — log of investigations on this branch since the snapshot
  - `docs/cathedral_structure.txt` — ASCII map of the 87 math modules
  - `docs/BREAKTHROUGH_NOTES.md` — discovery log (pure-math findings only)

---

## License

MIT. See `LICENSE`. Independent research; please cite if you use the framework.
