# Coupled cycle 39 — archive missing inputs for physical α and masses

Classification: **PROVED** (H1, H2, H3). Advances a physical ARF? No.
This cycle performs no new kernel computation. The `newtons-cathedral`
tip was read at `6bad7b3`. Historical ARFs were not inserted.

The archive lists a finite set of missing inputs for physical alpha
and masses. None of them is uniquely fixed by the structure proved
on the coupled line through cycle 38.

## Catalogue (archive’s own wording, with paths and lines)

### 1. M_U (unification / boundary scale)

`research_archive/2026-10-23_chat_recovery/RECOVERED_MISSING_INPUTS.md:22–25`
calls M_U the unification scale, not a mass matrix, and states that
`ln(M_U/M_Z)` “remains a missing top-down physical anchor”; example
values ~10^18 GeV “are not an independently derived M_U.”

`research_archive/2026-10-24_alpha_physical_gate/GRAVITY_GAUGE_FIXED_POINT_INDEPENDENT_TEST.md:19–27`
writes the conditional formula
α_EM^{-1}(M_U) = 41/(15π f_G) and
α_EM^{-1}(M_Z) = 41/(15π f_G) + (11/(6π)) ln(M_U/M_Z),
and lists an “independently derived … boundary M_U” among the
quantities the formula still needs.

`Cathedral_URT_Theory_of_Nature_2026-08-22.md` §33 (from line 1690)
and §46 “Masses and scale” (lines 2186–2188): finite geometry
provides dimensionless ratios; a physical scale, thresholds and RG
evolution remain to be fixed.

**Derived from proved structure?** No. The coupled line has only
dimensionless seed numbers (Δ, η, φ, …). No GeV scale, and no
map from those numbers to ln(M_U/M_Z), has been derived.

### 2. f_G (gravity anomalous dimension)

`GRAVITY_GAUGE_FIXED_POINT_INDEPENDENT_TEST.md:15–27` introduces
f_G as the coefficient in β(g_Y) = (41/6) g_Y³/(16π²) − f_G g_Y
and states that the conditional alpha formula “still needs an
*independently derived* physical gravity anomalous dimension fG.”
Lines 35 and 41 add that ultraviolet completeness does not uniquely
select the interacting root, and that η_Δ/(16π) = 0.1192826109
“is NOT known to equal” f_G; testing that extra identification
does not reproduce physical alpha.

**Derived?** No. The archive itself labels the η/16π identification
as unproved. Cycles 01–38 do not compute a gravitational beta
function.

### 3. Coframe / continuum conversion

`NATIVE_137_COULOMB_CHIRAL_CHARGE_INDEX_THEOREM.md:48` requires
“a first-principles coframe/continuum conversion.”

`RECOVERED_MISSING_INPUTS.md:27–30` records an exact finite spin-2
bridge that “Does *not* derive a 4D diffeomorphism-redundant
coframe link, Einstein equations, physical G or fixed gauge
normalization.” Line 37: the physical rule identifying a spacetime
state or coframe variation with ρ★ “remains unresolved.”

Theory of Nature §15 (lines 774–792): nothing in the finite seed
fixes “the absolute conversion between discrete transfer and
continuum distance.” §41 (lines 1981–1990): Maxwell’s equations,
source normalisation and a propagating continuum photon are not
uniquely derived from one action. §43 (line 2044): M_*, Λ_*, k_a,
μ_*, the continuum measure and the derivative terms “are
placeholders for the missing physical bridge.” §46 “Event gluing
and continuum” (lines 2170–2172): a vierbein, connection, causal
orientation and metric rather than only a local conformal carrier
remain to be constructed.

`2026-10-16_sourced_gauge_hidden_berry/README.md:28`: “The finite
shell has **no harmonic edge modes**.”
`ACTUAL_A4_WILSON_PILOT_RESULT.md:23`: the absence of an independent
q → 0 limit on a fixed 13^4 torus “prohibit[s] equating a single
listed coefficient with the low-energy alpha.”
Cycle 35: no unique map from finite-graph Π_T to continuum K_γ.

**Derived?** No. This is the deep blocker cycle 35 named, and it
is listed as missing by the archive itself.

### 4. Electron-unit charge chart

`WHY_24_STATE_SYMMETRY_IS_NOT_YET_ALPHA.md:4,32` and
`TWO_INDEPENDENT_GEOMETRIC_ALPHA_EXACT_GATE.md:55` specify that
K_γ / K_EM is to be evaluated “in the electron-unit geometric
connection convention” / “in the electron Q=−1 chart.”
`CHARGE_TRACE_TO_ALPHA_EXACT_REDUCTION.md:8` states that Q_e = −1
“fixes the physical relative-charge convention.”
`FIRST_PRINCIPLES_ALPHA_GATE.md:40–41`: Q = 2C/√15 is “a candidate
charge-sector splitter, NOT an established electromagnetic
generator.”
Cycle 31: the Cathedral does not uniquely define U(1)_EM as Q_geo.

**Derived?** The *convention* Q_e = −1 is stated. Which microscopic
generator occupies that chart is not uniquely derived (cycle 31;
FIRST_PRINCIPLES candidate status). The chart is a matching
condition, not a derived map.

### 5. C_IR (infrared charge-weighted Maxwell coefficient)

`CHARGE_TRACE_TO_ALPHA_EXACT_REDUCTION.md:10–19,33`: if and only if
a common bosonic coefficient C appears in the displayed trace
convention, then α(0)^{-1} = 4π (16/3) C_IR. “Physical alpha
remains open until the source-first full H64 selected-history
gauge Hessian with the hidden-51 determinant and continuum
Coulomb residue fixes C_IR.” Lines 26–29 label C_IR = C_Berry as
“one possible—but unproved—identification.”

**Derived?** No. Cycle 35 already recorded that C_IR is not the
12-site graph κ of cycles 25–32.

### 6. Hidden-51 determinant of the H64 photon Hessian

Required by `FIRST_PRINCIPLES_ALPHA_GATE.md:32–38`,
`WHY_24_STATE_SYMMETRY_IS_NOT_YET_ALPHA.md:32`,
`TWO_INDEPENDENT_GEOMETRIC_ALPHA_EXACT_GATE.md:54`,
`CHARGE_TRACE_TO_ALPHA_EXACT_REDUCTION.md:33` and
`ACTUAL_A4_WILSON_PILOT_RESULT.md:41`. Both the hidden-51
determinant and the dressed-13 Schur complement must be kept.

**Derived?** No. The coupled line evaluates a 12-site (or H13)
Nambu/Peierls Hessian, not det(D_64[A]) with the hidden-51 block.

### 7. Physical clock and Gauss projection

`WHY_24_STATE_SYMMETRY_IS_NOT_YET_ALPHA.md:32` includes “physical
clock and Gauss projection” in the completion test.
`EXACT_A4_WILSON_CONTINUUM_COEFFICIENT.md:44`: “The physical clock
beta, full interacting selected H64 source-first operator, Gauss
projection, native photon kinetic action and 4D continuum Coulomb
pole are not all fixed.”
`NATIVE_PEIERLS_PHOTON_EXACT_TWO_SECTOR_RESPONSE.md:52` and
`ACTUAL_A4_WILSON_PILOT_RESULT.md:41` repeat the same open list.

**Derived?** Partially adjacent, not derived. η = −ln Δ is the
hidden-sector KMS temperature (proved structure). The 24-point
orbit X = F_5² \ {0} is proved (WHY_24 theorem 1, line 7). Neither
object is identified by the archive with the photon’s Euclidean
period or with a Gauss projector. The archive lists the physical
clock as missing.

### 8. Maxwell stiffness λ

`FIRST_PRINCIPLES_ALPHA_GATE.md:22–24`: for S_λ[A] = λ A^T K A/2,
“Maxwell topology and the Ward identity alone leave lambda>0 free.”
`WHY_24_STATE_SYMMETRY_IS_NOT_YET_ALPHA.md:11–16` (theorem 2): the
group does not enforce λ = 1; lines 18–23 (theorem 3): the frozen
ρ★ does not fix the source photon response.
`F5_BINARY_ICOSAHEDRAL_EXACT_13CELL_AND_ALPHA_CANDIDATE.md:31`:
“volume alone does NOT create Maxwell stiffness. … physical alpha
remains open until the selected gauge-covariant Cathedral history
explicitly fixes the electron-unit infrared transverse
photon-current q² coefficient.”

**Derived?** No unique value. Cycles 32 and 36 produce a
parameter-free subcritical quadratic form, but it is not a unique
κ (generalised-eigenvalue spreads 0.305 and 0.215) and cycle 35
gives no unique map from that form to K_γ.

### 9. Running, thresholds, and electroweak massless-photon projection

`CHARGE_TRACE_TO_ALPHA_EXACT_REDUCTION.md:19`: the parent value
gives sin²θ_W = 3/8, “NOT the low-energy angle unless running,
thresholds and massless photon projection are derived.”
`GRAVITY_GAUGE_FIXED_POINT_INDEPENDENT_TEST.md:27` requires a
selected interacting trajectory and full thresholds.
Theory of Nature §33 and §46 “Masses and scale.”

**Derived?** No. “Massless photon projection” in that note is the
electroweak Q = Y+T_3 projection plus running (cycle 35), not a
graph eigenspace.

### 10. Newton’s constant, area–entropy bridge, M_*

Theory of Nature §15 (lines 774–802): the missing statement that
would identify 2 k_B η_Δ δp_ex with an area law is not supplied;
the seed does not fix G. §43 (line 2044) and §46 “Physical entropy
and gravity” (lines 2174–2176): Einstein dynamics and the value
or independent origin of Newton’s constant remain obligations.
`RECOVERED_MISSING_INPUTS.md:30`: no physical G.

**Derived?** No.

### 11. Lepton / Higgs poles and a physical GeV scale

`RECOVERED_MISSING_INPUTS.md:45`: derive “a gauge-covariant
charged-lepton inverse propagator and physical pole/current
normalization, then compare with masses only after freezing the
prediction.” Theory of Nature §24 (Higgs normalisation) and
§46 “Masses and scale” (lines 2186–2188).

**Derived?** No. Cycle 22: y_even is FREE. Without a Yukawa and a
GeV scale there are no physical mass poles.

### 12. Selected-history transfer T_*[A]

The completion tests of WHY_24 (line 32) and TWO_INDEPENDENT
(lines 53–57) require a unique source-covariant H64 selected
transfer T_*[A] with the face/twist source inserted everywhere
(Hamiltonian, positive transfer, support/face weight, Gauss
projector, 51-hidden Schur determinant).

**Derived?** No. Cycle 18 selected a Nambu/BdG pairing measure for
the *coupled line*; that is a working definition, not the
archive’s unique T_*[A].

## What *is* derived (H3), and why it does not close α or masses

- Δ = 3/20 − 80π/(1053 φ), η = −ln Δ, ρ★, p_5 = Δ²/(1+Δ²).
- χ_35 = 8 η (1+Δ²)/(1−Δ²) (FIRST_PRINCIPLES lines 12–13), a BKM
  inner product, not identified with 1/e² or with f_G.
- Finite Maxwell topology: rank D = 19, K = D D^T
  (FIRST_PRINCIPLES lines 19–24), and GI/WI on the coupled line.
- Pairing susceptibility χ(T) and y_c(T) = √(c_even/χ(T)) as
  functions of the still-free y_even (cycles 18, 33, 41).
- Subcritical Π_T at T = η: positive, nearly Maxwell-like,
  near-zero London mass, not a unique κ (cycles 32, 36).

The archive already states that these objects do not fix K_γ
(WHY_24 theorems 2–3; FIRST_PRINCIPLES λ free; CHARGE_TRACE
C_IR open), G (§15), or a GeV scale (§33). That assessment
stands.

## Integrity

Predeclaration sha256:
`8521acc04d01c61bc51e45122a00a62de7bf0a86dba27a36162514f14d124418`.
No ARF target was used.
