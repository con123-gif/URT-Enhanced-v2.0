# Coupled cycle 43 — unique GI EM current and Hodge Gauss/IR projection

Classification: **PROVED** (H1 as conditional on the working Q_geo
identification; H2; H3 as a computation; H4). The uniqueness clause
of the conversion gate is **FALSIFIED**: the projected subcritical
kernel is Maxwell-like and positive, but not a unique q² coefficient.
No unique K_γ is identified. α_eff was not compared to R_α or to
1/137.036. Advances a physical ARF? No.

The `newtons-cathedral` tip remains read-only at `6bad7b3`. Historical
ARFs were not used to select a current, a projector, or a residue.

## H1. Current (conditional)

At r = 0 the action is the fermion free energy of the magnetic
hopping Laplacian K[A] only. The charge-+2 pairing currents of
cycle 10 are off. The unique Hodge hopping ray of alt cycle 02
has a unique charge-0 Noether current j_K (cycle 10), and that is
the current already coupled by the working Q_geo Peierls map.
Cycle 31 is not reopened: this uniqueness is conditional on that
working identification, which the Cathedral does not uniquely
select as U(1)_EM.

## H2. The Gauss-law projector is unique

The icosahedral 2-complex is a sphere: (b₀, b₁, b₂) = (1, 0, 1),
χ = 2. There are no harmonic 1-forms (λ_min(Δ1_T) = 3−√5, in
agreement with the 16 October finite-shell warning). ker Δ0 is
the one-dimensional space of constants; Δ0⁺ is the unique
pseudoinverse that annihilates them. The Hodge decomposition
C¹ = im d0 ⊕ im δ1 is unique and orthogonal (dim 11 + 19), and
d1 d0 = 0 to numerical zero. The Gauss-law projector is therefore
the unique coexact projector

    P_T = I − d0 Δ0⁺ δ0

onto the 19-dimensional cycle space already used in cycles 23–40,
now obtained from the Hodge Gauss law rather than chosen as a
discrete avatar of K_γ. P_T is idempotent and symmetric to
10^{-15}; its image is orthonormal and coclosed to 10^{-14}.
No further IR truncation (the 3 with λ = 3−√5, κ_REM, a mode
cutoff) is admitted as the Gauss projector.

## H3. Projected kernel: Maxwell-like, not unique

Gauge transversality holds: the Hessian annihilates exact 1-forms
to 4×10^{-17}. Two evaluations of Π_T were compared, as
predeclared. The exact trace-derivative formula and the
finite-difference scheme of cycle 32 (ε = 0.02) agree on κ_iso
to relative 4.7×10^{-5}. Their spreads differ by relative
9.07×10^{-4} (absolute 2.77×10^{-4}), which is finite-difference
truncation and exceeds the predeclared 10^{-4} / 10^{-8} floor.
Per the predeclaration the cycle-32 finite-difference kernel is
therefore the comparison standard. Both kernels give the same
classification. Official numbers (finite-difference):

    κ_iso     = 0.002061846996
    spread    = 0.305459
    resid_M   = 0.060123          (Maxwell-like: resid_M < 0.10)
    κ ∈ [0.001556023, 0.002135981]
    λ(Π_T) ∈ [0.00118870, 0.01118414]
    m²        = −1.70886×10^{-4}  (w_m = 0.0233)
    w_κ       = 0.8155
    w_β       = 0.2096
    κ_REM     = 0.001556023       (diagnostic only; not used)

Π_T is positive definite and Maxwell-like, with a near-zero
London piece, in agreement with cycle 32. It is not unique
(spread 0.305 ≱ 0.05; w_β = 0.210). The exact formula gives
κ_iso = 0.002061944, spread 0.305737, resid_M 0.060157, and
does not change the gate.

## H4. No comparison

The conversion gate required a unique GI current, the unique
Hodge P_T, and a unique positive q² coefficient. The second
holds; the first holds only conditionally; the third fails.
No K_γ is identified, and α_eff was not compared to
R_α = 3/(64φ) + 1/(79φ²) or to 1/137.036. Look-elsewhere was
not run. None of κ_iso, κ_REM, m², 1/48, or the cycle-29
(κ, β) pair was rewritten as an electromagnetic coupling.

Why, exactly: the derived Hodge structure does uniquely fix the
Gauss-law / transverse projector, and on the subcritical branch
the working charge-0 current is unique, but the projected kernel
is a family of generalised Maxwell coefficients with 30% relative
width, not a single positive q² residue. That is the same
obstruction cycle 32 named, now re-tested with the projector
derived from the Hodge Gauss law.

## Integrity

Predeclaration sha256:
`5ead2de0c68984e6dea1118f91029d2fa7d4dd815a429bc06f67d9fbdfcea147`.
No ARF target was used to select a current, a projector, or a
residue.
