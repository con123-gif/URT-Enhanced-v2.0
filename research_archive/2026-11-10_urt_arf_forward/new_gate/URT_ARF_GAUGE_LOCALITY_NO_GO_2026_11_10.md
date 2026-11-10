# An exact limitation of O(N)-URT coupling: local compact-gauge stiffness remains underdetermined

**10 November 2026 — independent theorem and executed original-source test.** This result concerns the specified mathematical assumptions, not a general impossibility theorem for Newton's Cathedral. No observed coupling, historic ARF target or fitted number was used.

## Assumptions retained

1. The primitive complex URT map with golden twist `2π/φ²`, its six-bit chronology `Q`, and the same full original five-Platonic 190-cochain incidence geometry (50 vertices, 90 edges, 50 faces).
2. Spatial gauge variables are compact `U(1)` link angles with unit Wilson holonomy; fixed physical charge labels must not be rescaled.
3. The gauge action must be local, gauge-invariant, nonnegative, and evaluable in O(V+E+F) operations. Its coupling scale must use no externally fitted number.

Let `b1_s : C1 -> C0` and `b2_s : C2 -> C1` be the *original* oriented incidence matrices on solid `s`. They satisfy `b1_s b2_s=0`. The face flux is `F_s(A)=b2_s^T A_s`. Thus under `A_s -> A_s+b1_s^T λ_s`, `F_s` is invariant.

## Two exact, zero-fit admissible actions

For `κ>0`, define the Wilson-plaquette action

`S_κ[A] = κ Σ_{s=1}^5 Σ_{face f in s} [1 - cos((b2_s^T A_s)_f)]`.

Take either one of the two *already present golden quantities*:

`κ_a = φ^{-1}` and `κ_b = φ^{-2}`.

Both give nonnegative, gauge-invariant, local actions. No free empirical parameter has been introduced in either candidate; each takes O(50+90+50) operations for a full update, and leaves the URT history recursion itself unchanged. They differ in their physical quadratic response:

`H_κ(0) = κ diag_s(b2_s b2_s^T)`.

For each Platonic sphere, `rank b2_s = F_s−1`, so over all five solids `rank H_κ(0)=Σ(F_s−1)=50−5=45`. There are 45 zero edge modes (40 exact gradients plus 5 topology/other cohomological modes; on separate spheres H1=0, so these 45 are precisely gradients: `Σ(V_s−1)=50−5=45`). The 45 nonzero transverse eigenvalues scale linearly with `κ`.

Therefore every nonzero stiffness eigenvalue obeys

`λ_a/λ_b = κ_a/κ_b = φ`.

Since unit compact Wilson charge is held fixed, this is a distinct dimensionless gauge response, not merely a change of field coordinates. The source-to-current response (or inverse Maxwell coefficient) cannot be determined uniquely from the three assumptions alone.

## Exact, original-source numerical verification

The executable `URT_NO_FIT_GAUGE_STIFFNESS_UNDERDETERMINATION_2026_11_10.py` loads the unmodified November 7 all-five-solid construction. It verifies `b1 b2=0` for all solids, rank 45 of the actual full edge-to-face Maxwell Hessian, zero gauge variation in every solid, the ratio `φ` on all 45 positive eigenvalues, and the unfitted golden values `0.6180339887...` and `0.3819660112...`. Every assertion passes.

## Scope, and what remains required

This does **not** falsify the hypothesis that a stronger, full URT law may uniquely select one gauge kinetic coefficient. It proves only that **O(N) locality, full Platonic geometry, positive/capped transfers, URT history recursion and gauge invariance do not themselves make that coefficient inevitable**. A selection law for `κ` (or a uniquely specified common charged-matter/history action whose Hessian induces it) is an additional substantive theorem to derive, not a calculation that can be obtained by choosing the historic electromagnetic ARF as a target.

The same distinction appears in hidden KMS weighting: the November original Gaussian energy has hidden values 18 and 16; the frozen density assigns the 3/5 sectors using the complementary cost `18−K`. Choosing the complementary cost is a physical selection, not entailed by the existing `O(N)` shift. Therefore the historical four ARFs remain **candidate algebraic relations**, not unique physical consequences of this presently specified action.

No third-party Yang–Mills derivation was used or uploaded.
