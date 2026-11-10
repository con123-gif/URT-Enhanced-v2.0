# Coupled cycle 35 — archive IR massless-photon projection and α_eff

Classification: **PROVED** (H1, H2, H3). The archive states a unique
*continuum* conversion α(0)^{-1} = 4π K_γ, and it does **not**
uniquely specify how to extract that K_γ from the finite-graph
kernel Π_T. No unique κ_IR is defined. α_eff was not compared to
R_α or to 1/137.036. Advances a physical ARF? No.

This cycle performs no new kernel computation. The
`newtons-cathedral` tip was read at `6bad7b3`. Historical ARFs
and the PDG value were not used to select a rule.

## H1. The continuum conversion is unique

Two independent archival statements give the same Thomson rule,
once a continuum infrared Maxwell coefficient is in hand.

`WHY_24_STATE_SYMMETRY_IS_NOT_YET_ALPHA.md`: “In the electron-unit
geometric connection convention, the *renormalized* Maxwell 1PI
action is `Gamma_EM^(2)[A]=(K_gamma/4) int F^2`; the Thomson
inverse fine-structure coupling is `alpha(0)^(-1)=4*pi*K_gamma`.”
The completion test is to “derive the fully infrared 4D
*transverse* q² coefficient in the unit-electron charge chart.
Evaluate alpha^-1=4pi K_gamma … No Maxwell stiffness may be
inserted by postulate or fixed by measured alpha.”

`TWO_INDEPENDENT_GEOMETRIC_ALPHA_EXACT_GATE.md`, constructive
gate: “Derive the transverse q² residue from the same model:
K_EM = lim_{q->0}(1/[d-1] q²) Tr[P_T(q) delta² (-log Z_*[A])/delta A(q)delta A(-q)]
… in the electron Q=-1 chart. Then alpha^-1=4pi*K_EM.”

`CHARGE_TRACE_TO_ALPHA_EXACT_REDUCTION.md` writes the same
Thomson relation after the charge trace:
α(0)^{-1} = 4π (16/3) C_IR, with 1/e² = (16/3) C_IR, hence
K_γ = (16/3) C_IR. The phrase “massless photon projection” in
that note is the electroweak projection onto Q = Y + T_3,
together with running and thresholds, not a graph-Laplacian
eigenspace: “The parent value gives sin²θ_W = 3/8, NOT the
low-energy angle unless running, thresholds and massless photon
projection are derived. The formula for α(0) demands that C_IR
include the full renormalized vacuum polarisation.”

So: **if** one has the 4D infrared transverse q² residue K_γ in
the electron chart, then α_eff^{-1} = 4π K_γ. That conversion,
and only that conversion, is uniquely stated.

## H2. No unique extraction of K_γ from Π_T

The object we actually have is the 19×19 transverse Hessian Π_T
of the one-loop fermion free energy on the icosahedral 1-skeleton.
The archive does not name a unique map from that matrix to K_γ.

1. **The continuum limit q → 0 does not exist on the finite
   shell.** Every physical coexact mode has a positive eigenvalue;
   λ_min(Δ1_T) = 3−√5 > 0. The sourced-Maxwell note of 16 October
   warns explicitly: “The finite shell has **no harmonic edge
   modes** and all physical coexact modes have nonzero finite
   eigenvalues; the gauge null directions must not be mistaken
   for empirically massless photons.” Taking
   κ_REM = λ_min(Π_T)/λ_min(Δ1_T) (the coefficient on the
   3−√5 eigenspace) as “the” IR projection would contradict that
   warning, and no source names that ratio as K_γ.

2. **Maxwell topology plus the Ward identity leave the graph
   coefficient free.** `FIRST_PRINCIPLES_ALPHA_GATE.md`: for
   S_λ[A] = λ A^T K A/2 one has
   “Maxwell topology and the Ward identity alone leave lambda>0
   free.” WHY_24 theorem 2 likewise finds
   d²[−log Z_λ]/dθ²|_0 = λ/24, and “the group does not enforce
   λ = 1.” Our induced Π_T determines a quadratic form, but the
   identification of that form with the continuum (K_γ/4)∫F²
   still requires a matching of metrics, volumes and symbols
   that the archive does not uniquely derive. The 16 October
   continuum symbol (1/16) Σ_{a<b}|F_ab(k)|² = |k|²|A_3|² −
   |k·A_3|² is a kinematic identity, not a rule that sets
   K_γ equal to κ_iso, κ_REM, or the cycle-29 projection
   coefficient.

3. **Several inequivalent discrete avatars exist, and the
   archive names none of them.** From the cycle-32 kernel one
   could form, among others,
   κ_iso, κ_REM, the projection κ, Tr(Π_T)/Tr(Δ1_T), or
   λ_min(Π_T). Cycle 32 already showed these are not equal
   (spread of generalised eigenvalues 0.305; w_β = 0.210).
   Choosing one after seeing the numbers would be a new
   postulate.

4. **Other archived α identifications are different objects,
   and are labelled as such.** The A4 Wilson coefficient
   K4 = 27.6055 is “a derived source-response coefficient,
   **not** α^{-1}(0)” and “cannot be relabelled as alpha”
   (`EXACT_A4_WILSON_CONTINUUM_COEFFICIENT.md`, CHARGE_TRACE).
   Equating C_IR to the BKM curvature C_Berry is “one
   possible—but unproved—identification” and gives
   α^{-1} = 160.73, not the historical scalar. The formula
   α^{-1} = 4π χ_{35} ||J||² is introduced with “If one
   assumes,” and matching the historical polynomial would
   require a diagnostic, not derived, current norm
   ||J||² ≈ 0.2273. Section 41 of the Theory of Nature
   states that Maxwell’s equations, source normalisation and
   a propagating continuum photon are not uniquely derived
   from one action. The electromagnetic-response arithmetic
   of §29 is a “reproducible output of the displayed route,”
   not a kernel-to-α map.

5. **CHARGE_TRACE’s C_IR is not our graph κ.** C_IR is the
   overall factor in a charge-weighted continuum action
   S = (C/4)[(10/3) F_Y² + 2 Σ F_{W_i}² + ⋯], to be fixed by
   “the source-first full H64 selected-history gauge Hessian
   with the hidden-51 determinant and continuum Coulomb
   residue.” That calculation is not the 12-site Nambu
   Hessian of cycles 25–32, and the note says physical alpha
   “remains open” until it is done.

## H3. No comparison

Because H2 holds, no unique κ_IR can be predeclared from Π_T
and the conversion α_eff = 1/(4π κ_IR) is not applied. The
look-elsewhere ensemble recorded in the predeclaration was
not run. No rewriting of κ_iso = 0.002061847, of κ_REM =
0.001556023, of the projection coefficient 0.001684, or of
1/48 was promoted as K_γ or as an electromagnetic coupling.
R_α = 3/(64φ) + 1/(79φ²) and 1/137.036 were not compared.

The cycle-32 kernel remains what it is: a parameter-free,
positive, nearly Maxwell-like quadratic form with a near-zero
London mass. That is a structural prediction of the subcritical
branch. It is not, by any unique archived rule, a value of α.

## Integrity

Predeclaration sha256:
`43466bd21edfba47987cf290b3f0c2ecf86faba689d62026862d99d863a99ce4`.
No ARF target was used to select a rule.
