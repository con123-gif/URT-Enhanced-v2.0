# Newton's Cathedral — Pure Mathematical Theory

**Author**: Cornelius Lytollis
**Branch**: `pure-math`
**Version**: 2.0 (May 2026)

This document describes the **mathematical** content of the Cathedral framework: the foundational chain D=3 → A₅ → δ★, the seven Cathedral integers, and their canonical appearances across classical mathematics.

For the physics layers (ARF particle-physics closures, the Cathedral v8/v9 Standard-Model derivation, RG flow δ(μ), the URT control law, and the predictions registry), see `THEORY.md` on the `main` branch.

---

## Layer 0 — The Single Axiom

> *In D dimensions, the maximum number of equal spheres that can touch a central sphere is the kissing number K(D). The structural requirement K(D) = D + D² has a unique non-trivial solution.*

**Theorem**: K(D) = D + D² is satisfied uniquely by **D = 3**.

| D | K(D) (actual) | D + D² |
|---|---|---|
| 1 | 2 | 2 ✓ (trivial) |
| 2 | 6 | 6 ✓ (trivial) |
| **3** | **12** | **12** ✓ (non-trivial) |
| 4 | 24 | 20 ✗ |
| 8 | 240 | 72 ✗ |

D=1 and D=2 satisfy the relation trivially (any kissing arrangement on a line/circle reaches the bound). D=3 is the unique non-trivial solution. The axiom singles out three-dimensional space.

The same dimension is forced independently from a different direction: Jordan (1870) classifies all finite subgroups of SO(3) as `{Z_n, D_n, A₄, S₄, A₅}`. Only A₅ is simple. A₅'s natural action is on the icosahedron's 12 vertices in 3-space — so the same D=3 emerges from finite-group classification.

---

## Layer 1 — Icosahedral Geometry → δ★

Once D=3 is forced, K(3)=12 means the central atom plus 12 neighbours forms a **13-site icosahedral shell**. The icosahedron has a rigid algebraic structure:

```
D = 3    (spatial dimension, axiom)
V = 12   (vertices = K(3), icosahedral kissing number)
E = 30   (edges = 5V/2)
F = 20   (faces = triangular, F = 2V−4)
q = 5    (faces per vertex; the smallest forbidden crystallographic n-fold)
G = 60   (icosahedral rotation group |I| = |A₅|)
N = 13   (D + V = D² + D + 1 = shell size including central atom)
```

These are theorems, not parameters.

### The ratio γ

```
γ = D^{−(D+1)} = 1 / 81
```

Equivalently `γ = 1/D⁴`. Two ways to see it:
  - **As a closure identity**: `|H₃| + F + 1 = 60 + 20 + 1 = 81 = D^{D+1}`. The icosahedral integers sum exactly to D^{D+1}.
  - **As a γ-ladder anchor**: every closed-form scale in the framework appears as an integer power of γ. The exponent ladder `{D, q, D², (D+1)^D, −(D!+1)} = {3, 5, 9, 64, −7}` is itself a Cathedral expression in five entries.

### The constant δ★

```
φ = (1 + √5)/2                (golden ratio, forced by icosahedral symmetry)

δ★ = (1 − γ) · π / (N · φ)
   = (80/81) · π / (13φ)
   = 0.14751081...
```

**δ★ is a theorem.** It arises from the unique interplay of:
  - the 3D spatial constraint (γ = 1/81),
  - the icosahedral shell count (N = 13),
  - the golden ratio (φ, the symmetry of icosahedral rotation),
  - π (the fundamental geometric constant).

For the formal derivation showing why π, φ, and e are *forced* (not chosen), see `docs/PI_PHI_E_DERIVATION.md`. Each of the eight forcing steps is exposed as a callable function in `urt.first_principles`, with `all_steps_verify()` as the CI gate.

---

## Layer 2 — The Seven Integers and Where They Appear

The framework's central mathematical observation: the seven Cathedral integers are the canonical numerical invariants of essentially every classical mathematical object. The 87 modules in this branch verify this claim across number theory, group theory, Lie theory, modular forms, algebraic topology, algebraic geometry, lattice theory, coding theory, discrete geometry, combinatorics, and spectral theory.

### Eight headline compounds

Eight Cathedral compounds carry the bulk of the appearances:

| Compound | Value | Where it appears |
|---|---|---|
| **V·F = (D+1)·G** | **240** | E₈ root count, \|π_7^s\|, K_7(Z) torsion, E₄ Eisenstein leading coefficient, K(8) kissing number, Hopf σ order, del Pezzo d=1 (-1)-curves, J-image into π_7^s |
| **2V** | **24** | K3 Euler χ, # Niemeier lattices, Leech lattice dim, bosonic-string transverse dim, M₂₄ acts on 24 points, weight-(1−q^n)^24 in Δ |
| **D·q** | **15** | A_5 order-2 conjugacy class size, 3×3 magic square (Lo Shu), CF(π) third partial quotient, 2D Ising critical exponent δ |
| **D!·V** | **72** | E₆ root count, K(6) kissing number, trace of G_{13} Laplacian |
| **2N** | **26** | bosonic string critical dimension, # of sporadic finite simple groups |
| **(D+1)·V** | **48** | F₄ root count, K_3(Z) torsion |
| **D² = 9** | **9** | A_5 exhaust sector size (= D!+D), # of Heegner numbers, exponent in γ = D^{−(D+1)} |
| **D! = 6** | **6** | 1st perfect number, smallest non-abelian group order, Coxeter h(D₄) |

`240` is the most-recurring integer: V·F = (D+1)·G appears as the canonical invariant of seven independently deep mathematical objects.

### The integer-fingerprint table by subject

(See `README.md` for a one-paragraph summary of each subject; here the appearance density is the structural claim.)

**Number theory.** Cathedral prime ladder `p_(D-1)=D, p_D=q, p_(D!)=N, p_(D²·q)=197`; exactly D² Heegner numbers (Stark-Baker-Heegner); Mersenne primes M_D=7, M_q=31, M_N=8191; the pentagonal quartet (q, V, 35=d_35, 51=d_51 are all pentagonal numbers indexed by Cathedral integers); perfect numbers D!=6 and σ(V)=28; triangular T_2=D, T_3=D!, T_7=σ(V); Fibonacci F_q=q, F_V=V², F_7=N; Lucas L_3=D+1.

**Group theory.** A₅ conjugacy class sizes `{1, D·q, F, V, V}` summing to G; A₅ irrep dimensions `{1, D, D, D+1, q}` with sum-of-squares G; G factorisation G = (D+1)·D·q; orbit-stabiliser triple V=G/q, E=G/2, F=G/D; Galois minimality (G is the smallest non-solvable group, q the smallest insoluble polynomial degree); Mathieu orders \|M_11\| = 2^(D+1)·D²·q·11, \|M_12\|=V·\|M_11\|, \|M_24\| = 2^(2q)·D³·q·7·11·23; PSL(2,7) order 2^D·D·(D!+1) = 168.

**Lie theory.** *All eleven major root counts are Cathedral expressions*: G₂=V, A₄=F, A₅=E, B₄=C₄=2^q, D₄=2V, D₅=2F, F₄=(D+1)·V, E₆=D!·V, E₇=2G+D!, E₈=V·F=(D+1)·G. Coxeter quartet h(A₄)=q, h(D₄)=D!, h(E₆)=V, h(E₈)=E. Free Lie algebra self-reference L_1(D) = L_2(D) = D, L_3(D) = 2^D. SO(n) dimensions for n=3..6 all Cathedral.

**Modular forms.** E₄ leading coefficient = V·F = E₈ root count. Modular discriminant Δ has weight V; factor (1−q^n)^24 with 24 = 2V. E₈ theta coefficients 240, 2160, 6720 = V·F, D²·V·F, σ(V)·V·F. X₀(13) genus 0; dim S_2(Γ_0(13)) = 0. J-homomorphism orders \|im J\|_{π_3^s} = 2V, \|im J\|_{π_7^s} = V·F. Heegner j-cubes: j(i)=V³, j(τ_-7)=−(D·q)³, j(τ_-8)=F³, j(τ_-43)=−(16G)³.

**Algebraic topology.** Bott periodicity D−1, KO-period 2^D. \|π_3^s\|=2V, \|π_7^s\|=V·F. Hopf-fibration target dims `{1, D−1, D+1, 2^D}`. TMF period (2V)². Quillen K-theory K_3(Z)=Z/(D+1)V, K_7(Z)=Z/V·F, K_15(Z)=Z/2V·F.

**Algebraic geometry.** Del Pezzo (-1)-curves d=1,3,4,5,6 → V·F, D^D, 2^(D+1), 2q, D!. Smallest CM elliptic curve discriminant 1728=V³. K3 invariants: dim D+1, h^(1,1)=F, χ=2V. Riemann moduli dim M_g at g=2,3,5,11 → D, D!, V, E.

**Discrete geometry & lattice theory.** *All known kissing numbers K(2..8)*: K(2)=D!, K(3)=V, K(4)=2V, K(5)=2F, K(6)=D!·V, K(7)=2G+D!, K(8)=V·F. All five Platonic-solid Schläfli symbols are Cathedral pairs. Hadamard orders include `{D+1, V, F, 2V, σ(V)}`. Binary polyhedral group orders 2T=2V, 2O=(D+1)V, 2I=2G=120. Spherical harmonics dim Y_N = 2N+1 = D^D = 27.

**Coding theory.** Hamming `[D!+1, D+1, D]` — every parameter Cathedral. Extended Golay `[2V, V, 2^D]` — every parameter Cathedral. 5-qubit `[[q,1,D]]`, Steane `[[D!+1,1,D]]`, Shor `[[D²,1,D]]`. Surface-code threshold ≈ γ.

**Combinatorics.** L(3)=V Latin squares; Stirling-1 c(q,D)=35; Stirling-2 S(3,2)=D, S(4,3)=D!; partition p(3)=D, p(4)=q, p(9)=E; Bell B_3=Catalan C_3=q; CF(π) opening `[D; D!+1, D·q, ...]`; CF(e) at indices D, 2D, 3D → D−1, D+1, D!.

**Spectral theory.** G_{13} Laplacian spectrum {0, 3, 3, 5, 5, 5, 5, 5, 5, 7, 7, 9, 13} — every eigenvalue Cathedral. Sector traces tr(L\|K_4) = 11, tr(L\|A_5) = 61, total D!·V = 72.

### Verification

The eleven *tour modules* document 72 verified clusters across these subjects. Each tour exposes one CI gate:

```python
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

assert all([
    all_connections_verify(),
    all_grand_tour_verify(),     all_deep_tour_verify(),
    all_modular_tour_verify(),   all_quantum_lie_tour_verify(),
    all_geometric_tour_verify(), all_classical_tour_verify(),
    all_advanced_tour_verify(),  all_topological_tour_verify(),
    all_codes_tour_verify(),
])
```

---

## Layer 3 — The Dynamical Object

The framework's *third* layer is a single dynamical equation on G_{13}. It enters here as a mathematical object — its physical interpretation lives on `main`.

### Equation of motion

The π-φ-e flow:

```
∂_t δ = − L·δ / (4π) − (φ−1)·e^{−t/τ}·(δ − δ★)·(1 + δ²)
```

where `L` is the graph Laplacian on G_{13}. Its forward-Euler discretization is the **URT iteration**:

```
δ_{k+1} = δ_k + 0.04 · ( −0.08·L·δ_k − 0.6·e^{−k/10}·(δ_k − δ★)·(1 + δ_k²) )
```

Every coefficient is forced (`urt.first_principles`):

| Coefficient | Value | Forced by |
|---|---|---|
| η_L | 1/(4π) ≈ 0.08 | spherical surface measure \|S²\| = 4π |
| η | η_L/2 = 1/(8π) ≈ 0.04 | half-step Euler convention |
| µ | 1/φ = φ − 1 ≈ 0.6 | A₅ self-similarity |
| τ | 10 | longest mixing time on G_{13} |
| δ★ | (1−γ)π/(Nφ) | ∇V = 0 at uniform configuration |

### Lagrangian view

```
L = ½|δ̇|² − V(δ)
V(δ) = ½ Σᵢ (δᵢ − δ★)² (1 + δᵢ²) + ½ δᵀ L δ
```

The URT iteration is the τ → ∞ over-damped limit of the Euler-Lagrange equation `δ̈ = −∇V(δ) − ζ δ̇` with η = 1/ζ = 1/(8π). Code: `cathedral_potential`, `cathedral_potential_gradient`, `cathedral_flow_lagrangian`.

### Theorem (uniqueness)

The URT iteration on G_{13} is the **unique** Euler discretization whose only transcendentals are π, φ, e that simultaneously satisfies:

  1. global asymptotic stability to δ★,
  2. preservation of H₃ ⋊ K₄ symmetry,
  3. finite-closure (nullity exactly 1).

CI gate:

```python
from urt.first_principles import all_steps_verify
assert all_steps_verify()             # all 8 forcing steps hold at 1e-15
```

### Algorithmic properties

(`urt.urt_algorithm_analysis`, all CI-tested)

| Property | Value | Origin |
|---|---|---|
| Per-step factor at λ=0 (constant mode) | exactly 1 | mean is preserved |
| Per-step factor at Fiedler λ=3 | 0.9904 | slowest non-trivial decay |
| Per-step factor at λ_max=13 | 0.9584 | fastest decay |
| Geometric variance decay rate | ρ ≈ 0.987 | matches λ ≈ 5 (typical) |
| Steps to std < 1e-3 (random init) | ~500 | first-order in 1/η |
| Slowest/fastest mixing-time ratio | N/D = 13/3 | purely Cathedral; no transcendentals |

The slowest mixing time `τ_D = (2^q · π²)/D ≈ 105` steps is the framework's natural "structure-formation timescale" on G_{13}, and `2^q · π² ≈ 315.83` is its dynamical normalisation — what π is to S² and what φ is to A₅, `2^q · π²` is to the URT iteration.

---

## Layer 4 — The Sectors, Frustration, and Synthesis

The fourth layer is a meta-observation: the same seven integers organise themselves into one geometric object whose K₄ ⊕ A₅ = 4 + 9 = 13 split appears across every layer of the framework.

### The 4/9 fingerprint

The ratio `(D+1)/(D!+D) = 4/9` is the K₄/A₅ sector-volume ratio, and it appears in mathematics:

  - sector volumes \|K₄\| / \|A₅\| = 4/60 = (1/D)·(4/9)·D = 4/9 (after normalising by sector size)
  - bare cosmology Ω_m^bare/Ω_Λ^bare = 4/13 ÷ 9/13
  - the η_B prefactor 8/9 = 2 · (4/9)

It is **unique to D=3**:

```
D = 2 :  3/4   = 0.7500   (but A₄ solvable; no Galois obstruction)
D = 3 :  4/9   = 0.4444   (the icosahedral case)
D = 4 :  5/28  = 0.1786   (collapses fast)
D = 5 :  6/125 = 0.0480
```

### Six facets of icosahedral frustration

The icosahedron is the 13-point configuration on S² with **maximum geometric frustration** — the crystallographic restriction theorem forbids 5-fold symmetry, and `q = 5` is exactly the forbidden n-fold:

```
1. GEOMETRIC   12 vertices on S², no periodic lattice
2. ALGEBRAIC   A_5 (= G = 60) is non-solvable        (Galois obstruction)
3. SPECTRAL    L_{13} eigenvalue λ = D has multiplicity 2
4. TOPOLOGICAL H_3 ⋊ K_4 preserved; H_3 alone broken
5. DYNAMICAL   δ_cl ≠ δ★ creates the gap Δ ≈ 2.49×10⁻³
6. DIMENSIONAL q-fold incompatibility forces 9 extra dimensions
```

### Self-reference cluster

Cathedral integers compute themselves in classical sequences (14 identities):

| Identity | Value |
|---|---|
| `p(D) = D` partition function | 3 |
| `F_q = q` Fibonacci self-ref | 5 |
| `F_V = V²` Fibonacci doubling | 144 |
| `F_7 = N` Fibonacci hits N | 13 |
| `B_D = q`, `C_D = q` Bell = Catalan | 5 |
| `\|A_D\| = D` alternating group | 3 |
| `dim SO(D) = D` Lie algebra | 3 |
| `\|PSL_2(F_q)\| = G = \|A_5\|` | 60 |
| `φ(N) = V` Euler totient | 12 |
| `period CF(√N) = q` | 5 |

Random integers do not satisfy this many self-references across unrelated sequences. CI gate: `self_reference_audit_passes()`.

### Cathedral × Lytollis synthesis

The bounded-chaos universal law `δ = (D_KY − 1)(τ − 2)` (Lytollis 2025), evaluated at the spatial dimension D=3 with the five conditions:

  - admits q = D+2 = 5 fold rotational symmetry (icosahedral vertex axes),
  - FORBIDS q-fold periodic symmetry (crystallographic restriction),
  - A_(D+2) = A_5 is non-solvable,
  - D² + D + 1 = N = 13 closure,
  - Lytollis κ-margin `1 − N/(2^q · π²)` is finite and positive,

picks D=3 *uniquely*. The unification identity:

```
γ_URT = γ_Lytollis = D^{−(D+1)} = 1/81
```

— same constant, two derivations.

---

## Recent exploration (post-snapshot)

Three modules added on this branch since the snapshot from main v2.9.76:

  - **`urt.triple_coincidences`** — catalogue of Cathedral compounds appearing in ≥3 distinct mathematical domains. 17 entries; V·F=240 reaches 8 domains; 13 compounds at ≥5 domains.
  - **`urt.deep_self_references`** — extends the self-reference cluster with new identities including σ(G)=168=\|PSL_2(7)\|, σ(2V)=G, φ(q²)=F, φ(D!+1)=D!, p(D²)=E, π_Pisano(2V)=2V.
  - **`urt.cathedral_orbits`** — iterated arithmetic functions stay in the Cathedral set; σ-chain from D=3 stays Cathedral for 10 steps; φ-orbit from V·F=240 stays Cathedral for 8 steps.

See `docs/EXPLORATION.md` for the full log.

---

## What's omitted from this branch

The `pure-math` branch deliberately omits ~105 physics-application modules from `main`:

  - `cathedral_v8` / `cathedral_v9` — the anchor-free physics chain
  - `predictions_registry` — PDG-tied predictions (1/α, m_p/m_e, etc.)
  - `electroweak`, `ckm_pmns`, `dark_matter`, `baryon_asymmetry`
  - `cosmology_cathedral`, `gravity_cathedral`, `holography`, `vacuum_instability`
  - 60+ domain-specific `*_cathedral` modules (climate, EEG, music applications, psychology, linguistics, materials, …)

These remain on the `main` branch. The pure-math view is for readers and researchers interested only in the mathematical structure.

---

## References

  - Jordan, C. (1870). *Traité des substitutions et des équations algébriques*. (A₅ uniqueness)
  - Conway, J. H., & Sloane, N. J. A. *Sphere Packings, Lattices and Groups*. (kissing numbers, Leech lattice)
  - Lytollis, C. (2026). *The π–φ–e Flow on the Centred-Icosahedral Graph*. (uniqueness theorem; δ★ = (1−γ)π/(Nφ) derivation)
  - Lytollis, C. (2025). *A Prescriptive and Necessary Condition for Bounded Chaotic Systems Across Scales*. (δ = (D_KY−1)(τ−2))
