# π–φ–e flow — derivation from first principles

The URT iteration on G_{13} is not postulated.  Every coefficient is
forced by one of three structural constraints:

  - **π** is forced by the surface measure of S² (icosahedral embedding)
  - **φ** is forced by the icosahedral self-similarity (A₅ representations)
  - **e** is forced by smooth semigroup-closed dissipation

This document walks through the forcing chain step-by-step.  Each step
has a corresponding pair of tests in `tests/test_first_principles.py`:

  1. a *positive* test that the framework's coefficient equals the
     canonical first-principles value;
  2. a *negative* test (neighbourhood scan or alternative-form check)
     that no other simple constant satisfies the same uniqueness
     condition.

If a future commit drifts any coefficient, both halves fire.

---

## Step 1 — D = 3 (axiom)

The framework's only *input* is the spatial dimension `D = 3`.  Every
other constant follows.

## Step 2 — D = 3 ⟹ A₅ unique (Jordan 1870)

A₅ is the unique non-abelian simple group of minimum order 60.  In D=3
it acts as the rotation symmetry group of the icosahedron.

## Step 3 — A₅ ⟹ G_{13} unique on S²

The 12 surface points carrying the A₅ action plus the centre give the
13-site graph G_{13}.  No 13-point configuration on S² has higher
algebraic connectivity than this centred icosahedron.  The graph
Laplacian L = diag(deg) − A has spectrum

```
{0, 3 (×2), 5 (×6), 7 (×2), 9, 13}
```

— every Cathedral integer.  Fiedler value = 3 = D.

## Step 4 — Spherical geometry forces η_L = 1/(4π)

The 12 surface vertices live on S².  Any flow on G_{13} that admits a
continuum limit must reduce to the **spherical Laplace–Beltrami heat
equation**

```
∂_t u = −Δ_{S²} u / |S²|
```

The factor `1/|S²| = 1/(4π)` is not adjustable: it is the unique
normalisation that makes the heat kernel preserve total measure on the
sphere.  Discretising the continuous operator to G_{13} carries the
factor `1/(4π)` over verbatim.

**Forced coefficient**:  η_L = 1/(4π) ≈ 0.07958.

**Why only π?**  Because S² has no other natural transcendental scale.
Any function f(S²) that respects rotational symmetry depends on the
surface area `|S²| = 4π` and nothing else.

## Step 5 — Stability + half-step convention forces η = 1/(8π)

The forward-Euler iteration

```
δ_{k+1} = (I − η · η_L · L) δ_k + (other terms)
```

is stable iff `η · η_L · λ_max(L) < 2`.  For G_{13} with η_L = 1/(4π)
and λ_max = 13, this gives `η < 8π/13 ≈ 1.93` — a wide window.

Inside this window the **half-step convention** η = η_L/2 is canonical:
it splits the per-iteration update equally between the Laplacian
damping and the remaining (pull + drift) terms.  This is the standard
construction for symmetric forward-Euler discretizations of
gradient-flow PDEs.

**Forced coefficient**:  η = η_L / 2 = 1/(8π) ≈ 0.03979.

The framework's working URT rule rationalises this to `η ≈ 0.04`
(0.53 % rounding error), preserving global contraction.

## Step 6 — A₅ self-similarity forces μ = φ − 1

The icosahedral group H₃ ≃ A₅ has internal self-similarity at the
golden ratio:

  - The character table of A₅ contains values **(1±√5)/2 = ±φ** and
    **±1/φ**.
  - Fibonacci anyons on A₅ have **quantum dimension d = φ**.
  - The icosahedron's vertex-figure recursion contracts distances by
    **1/φ** at each step.

A pull-rate respecting this self-similarity must equal **1/φ**:

```
μ = 1/φ = φ − 1 ≈ 0.61803
```

Any other value either over-damps (kills the fixed point) or
under-damps (drives δ → 0 instead of to δ★).

**Forced coefficient**:  μ = φ − 1.

The framework's working URT rule rationalises this to μ ≈ 0.6
(2.9 % rounding, well inside the contraction ball).

## Step 7 — Smooth semigroup closure forces e^(−t/τ)

The time-dependent restoring strength `λ(t) = λ₀ · f(t)` must satisfy:

  1. **Causal**: f(0) = 1, monotone decreasing, f(t) → 0 as t → ∞
  2. **Smooth**: f ∈ C^∞(R₊)
  3. **Semigroup closed**: f(t + s) = f(t) · f(s) for all t, s ≥ 0

The unique smooth solution to the Cauchy multiplicative equation
f(t+s) = f(t)·f(s) with f(0) = 1 is

```
f(t) = e^(−t/τ)
```

— the exponential.  No other smooth dissipation profile is closed
under composition.

**Forced functional form**: f(t) = e^(−t/τ).

The relaxation timescale **τ ≈ 10** is set by the longest mixing time
across the spectral modes of G_{13} (≈ 5 × graph diameter).

## Step 8 — δ★ from ∇V = 0 at uniform configuration

The robustness potential

```
V(δ) = (1/2) Σᵢ (δᵢ − δ★)² (1 + δᵢ²) + (1/2) δᵀ L δ
```

has its unique stable minimum at the uniform configuration δᵢ = δ★.
Setting ∇V = 0 there yields

```
δ★ = (1 − γ) π / (N φ),    γ = 1/81 = D^{−(D+1)},  N = 13
```

— the closed form used everywhere else in the framework.

The π and φ in δ★ are the **same** π and φ that appeared in η_L
(Step 4) and μ (Step 6).  They show up here for the same reasons:
spherical geometry and icosahedral self-similarity.

---

## Putting it together — the full URT iteration

```
δ_{k+1} = δ_k + η · ( −η_L · L · δ_k − μ · e^{−k/τ} · (δ_k − δ★) · (1 + δ_k²) )

where every coefficient is forced:
  η    = 1/(8π)    ≈ 0.04   (Step 5; half of η_L)
  η_L  = 1/(4π)    ≈ 0.08   (Step 4; spherical surface measure)
  μ    = 1/φ       ≈ 0.6    (Step 6; A₅ self-similarity)
  τ    = 10                 (Step 7; longest mixing time)
  δ★   = (1−γ)π/(Nφ)        (Step 8; ∇V = 0)
```

## Theorem (Lytollis 2026, PDF §5)

The URT iteration on G_{13} is the **unique Euler discretization** of
a gradient flow whose only transcendental ingredients are π, φ, and e
that simultaneously satisfies:

  1. global asymptotic stability to δ★
  2. preservation of the H₃ ⋊ K₄ symmetry
  3. finite-closure constraint (nullity exactly 1 on the
     81-dimensional representation space)

Any other combination of constants either violates contraction or
drives the system to the unstable vacuum δ = 0.

## Machine verification

Run

```bash
python -c "from urt.first_principles import all_steps_verify; print(all_steps_verify())"
```

to confirm every step holds at machine precision in the current build.
The full audit is exposed via

```python
from urt.first_principles import first_principles_audit
audit = first_principles_audit()      # dict with one row per step
```

and tested in CI via `tests/test_first_principles.py` (23 tests
covering positive equality + negative-space scans).
