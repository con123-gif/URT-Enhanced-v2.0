import New.Endgame.LongForms

/-!
# Editor compact RUN51 — the completion cost belongs to the missing rank
26 Nov 2026. HUMAN SOURCE-MATCHED / PREPARED, not compiled.
Mission blob 3731f12ed73e738313fd7f93a30759d9086141e9, migration commit
24da6755f91e9dfb7fac28f80bca36b255919247. Compact source lsernau/grh-lean
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Credit the original
and compact proof authors. Existing HUMAN_PROOF_COMPACT.md at 2b2bf474
is preserved. Peer audit e28fed80 (one-sided H), geometry 7ffc9e07
(frame/spread) read; no duplication of their scalar or greedy lemma.

Actual source bodies read:
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6
New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518
New/Exchange/CrudeRows.lean e84f4b0e67ed7dbfd727f8ec2dbf05a8d1e5440c
New/Exchange/CostOfSquares.lean 3842be43cd82966d3398d9929f72dd7667a62f4d
New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e.

## Human C chapter insertion: one determinant, with the correct two embeddings

Let D=rowDim>0, n=number of independent rows, kappa=D-n (NOT column rank
Data.k). Use the actual completion by kappa elements of the spanning set
in crude_rows, projected by goodProjTranslate 1. The quotient basis
construction in exists_extend_basis_of_span_eq_top proves exactly
D=n+kappa: take a basis of W/span(y) from the image of the spanning
set, lift it, and join to y. Independence follows by first passing
a vanishing linear combination to the quotient.

Let x denote this one full basis, u_v=Theta(v), G_v its image Gram
matrix and A=det G_1 != 0 (injectivity of u_1). The same basis change
factor cancels from det G_v/det G_1, which equals the native ratio of
squared norm determinants. Do not assume every embedding commutes with
complex conjugation. For each iota over l, use j=complexToCp iota.2 AND
j'=j composed with complex conjugation. The index hypothesis supplies
separate recombination matrices M_j and M_j' in these two contexts
for the SAME completed family and twist. The pairing-integrality
hypothesis w in one_determinant implies
  j(conj(M_j')) j(G_v) j(M_j)^T
has integral entries (with Gram convention conjugate-linear first slot).
Thus its determinant has l-adic norm <=1. The determinant lower bounds
are |j(det M_j)| >= exp(-e_l)|j(gamma)|^kappa and
|j'(det M_j')| >= exp(-e_l)|j'(gamma)|^kappa. They give
  |j(det G_v * (gamma*conj gamma)^kappa)| <= exp(2 e_l).
The two determinants are multiplied BEFORE applying valuation bounds.
In particular this does NOT require j(star z)=star(j z), a potentially
invalid shortcut in a human translation.

Use A as the nonzero auxiliary number of HeightLe for the family
r_iota |gamma_iota|^(2 kappa), r_iota=det G_theta/det G_1.
The archimedean bound on A is exp(alpha), the finite-place bounds above
are exp(2e_l), and every finite sum of e_l is <=delta. The definition
gives HeightLe(alpha+2delta, r|gamma|^(2 kappa)).
Multiply by the reciprocal family from hgamma.pow kappa to obtain
HeightLe(alpha+2delta+kappa*g,r), where
HeightLe(g, |gamma|^(-2)) holds. This is precisely the native
one_determinant mechanism, including the conjugate embedding guard.

## Keep the exact completion cost until the final common-witness cancellation

From crude_rows: the completion forms' squared norm bound at every
conjugate is exp(x1^2 b^2), and c costs 2 m^2 squares. CostsSquares says
one square contributes 2 t x^999. Thus put
  U = x1^2 b^2 + 4 m^2 t x^999.
The native heightLe_volume_rows proof uses covolumeSq_elim_le on the
joined basis (Gram/Hadamard bound), so alpha<=V+kappa*x1^2*b^2.
The index matrix is block diagonal: M_j on the original rows and
gamma*I_kappa on the added rows, gamma=c(theta)/c(1), with
g=4 m^2 t x^999. Its determinant has precisely kappa powers of gamma.
Consequently the pre-rounding output of one_determinant is
  HeightLe(V+2delta+kappa*U, z(theta)/z(1)).
This is the mathematical intermediate in the native caller before
its final mono / scale comparison; a new exact caller replay is pending.
Native scale bounds give U<=b^3/4, kappa<=4D/b^2, hence kappa U<=Db.
The old heightLe_volume_rows conclusion follows by rounding; this
rounding is unnecessary if the original rank defect is kept.

Let H=mainHeight, L=logB*budget, R=m*remainder. The SAME fit family
supplies HeightLe(2D(2L-H), z(1)^2/z(theta)^2), and all volumes are
nonzero. Multiply the square of the unrounded first bound by this
second bound, so the family is exactly 1. The native HeightLe.nonneg
(product formula) yields
  D(H-2L) <= V+2delta+kappa U.
At the actual A+B output V=n(H-R+L). Substituting and cancelling H
BEFORE any bounds gives the joint, rank-sensitive budget
  n R <= (n+2D)L + (D-n)(U-H) + 2delta.
This is stronger than rounding the completion cost to D L and bounding
the short-height deficit independently. If H>=U the entire signed
defect is nonpositive. No claim that H>=U holds for admissible Data.
For n>0 the exact RHS divided by n is sufficient; no bound on |R|
is used. In particular the already native guards U<=b^3/4 and
-H<=b^2*x^99 can be applied only at the end. This recovers the audit
lane's safe coarse conclusion (with U cost <=D L) without requiring
a crude bound on the remainder. No new prime asymptotic follows.

## Why crude_rows is not an unexplained axiom
Its actual proof chooses one grid period route and a surjection r
from grid forms onto principal forms. Each grid square step j costs
4j+2, and summing over j=0,...,m-1 gives 2m^2, not 2m or 4m^2 squares.
exists_mul_endPeriod_mem_embValRing supplies ONE integer denominator
N<=exp(x^99 b^2) for the admissible twists/prime guards. endPeriod_le
gives the untwisted all-conjugate norm estimate via the Weyl norm and
end-level integrals. A dual pairing and delta forms recover each
coordinate of the scaled row from the end periods. This explains why
the same spanning family has simultaneous integrality and size.
The deep existence of the tidy surjection, each grid move/seesaw,
uniform N, dual pairing, and scale comparison remain explicit
source obligations; they are not established by the determinant identity.

## Graph and verification boundary
Original selected source edges:
star_inequality -> integral_forms_long -> heightLe_volume_rows ->
{crude_rows, exists_extend_basis_of_span_eq_top, one_determinant,
 norm_inner_le_one, covolumeSq_elim_le, goodProjTranslate_mem_integralForms}.
Also integral_forms_long -> {exists_isFitFamily,
heightLe_volume_ratio_sq, volume_iota_eq_prod_liftVolume, HeightLe.nonneg}.
Reduced candidate keeps all these leaves, with pre-mono row height,
same-family reciprocal cancellation, and joint rank-defect budget
replacing the two coarse scalar roundings. No kernel edge deletions.
Local lean/lake absent. No compact engine run or compact CI result
for this certificate. Older 4.33.1 native engines and status summary
45775351208 (old orchestrator, 07:48 UTC) are NOT verification here.
No new #print axioms output, no claimed root closure. The generic
certificate below uses actual native HeightLe and is prepared for
the shared compact runner; no imports of Main or New.Main, no sorry.
No artificial matrix/numerical simulations or URT speed claims.

RESUME HERE: merge this exact determinant/embedding explanation into
section 4 of HUMAN_PROOF_COMPACT.md, retaining the old native rounded
bound as fallback. Kernel lane replay pre-mono variant of the actual
Data.heightLe_volume_rows (inspect the final .mono before rounding),
then substitute at integral_forms_long and star without mixing pins.
Editor next reconstruct the actual grid route step and uniform
denominator N, or, if theta lane has done so, translate the matching
Selmer fit-family supplier. Keep unresolved leaves and source/axiom graph.
HANDOFF TO: integration, kernel extractor, formal audit, theta and editor.
-/

namespace CompactEditor51

/-- Product formula for the actual reciprocal height families. -/
theorem reciprocal_budget {r : PrimePadicIso → ℂ}
    {A B : ℝ} (hr : ∀ i, r i ≠ 0)
    (hA : HeightLe A r)
    (hB : HeightLe B (fun i => (r i)⁻¹ ^ 2)) :
    0 ≤ 2 * A + B := by
  have hh : HeightLe (2 * A + B) (1 : PrimePadicIso → ℂ) :=
    ((hA.pow 2).mul hB).mono (by norm_num) (fun i => by
      change ‖i.2 1‖ ≤ ‖i.2 (r i ^ 2 * (r i)⁻¹ ^ 2)‖
      rw [← mul_pow]
      simp [hr i])
  exact hh.nonneg

/-- Keep completion cost and missing dimension coupled before rounding. -/
theorem joint_completion_budget {d n H R L U V δ : ℝ}
    {r : PrimePadicIso → ℂ} (hr : ∀ i, r i ≠ 0)
    (hA : HeightLe (V + 2 * δ + (d - n) * U) r)
    (hB : HeightLe (2 * d * (2 * L - H)) (fun i => (r i)⁻¹ ^ 2))
    (hV : V ≤ n * (H - R + L)) :
    n * R ≤ (n + 2 * d) * L + (d - n) * (U - H) + 2 * δ := by
  have hh := reciprocal_budget hr hA hB
  nlinarith only [hh, hV]

end CompactEditor51

#print axioms CompactEditor51.reciprocal_budget
#print axioms CompactEditor51.joint_completion_budget
#print axioms one_determinant
#print axioms Data.crude_rows
#print axioms Data.heightLe_volume_rows
