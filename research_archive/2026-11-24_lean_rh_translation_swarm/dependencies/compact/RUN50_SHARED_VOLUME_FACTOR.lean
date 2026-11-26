import New.Endgame.LongForms

/-!
# RUN50 — compact dependency lane: one chain-volume factorization witness for C
26 November 2026. HUMAN SOURCE-MATCHED / PREPARED, not elaborated.
Mission blob 3731f12ed73e738313fd7f93a30759d9086141e9, migration 24da6755f91e9dfb7fac28f80bca36b255919247.
Latest mission assigns compact dependency lane 13; historical lane 12 remains archived.
Pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Claude and Anthropic collaborators. This is
a source-matched reconstruction and local refactor, not authorship of RH.
Old RUN49 737ff85f596b9b74eb10f610e802dd949278d832 concerns the old mirror
40e56bab026552e089d7afcfeff08d2defb9c005. Its local Artin/CM-lift
replacement is not mapped to this new context and is not imported.

## Read and measured evidence
Fetched actual compact bodies at the pin, not just GUIDE comments:
Main.lean a5d8389131c985a0b54ce5b0e778ee5c8126a997;
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65;
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a;
New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05;
New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14;
New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88;
New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1;
New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518;
New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6.
Read AGENTS, continuity, swarm/handoff, latest mission and peer patches:
284991cd fixed-modulus adapter (N0=18480), 05bb424d missing-rank completion,
7ffc9e07 theorem B, e28fed80 one-sided scalar height, 2b2bf474 manuscript.
No duplication of these algebraic results. One selected C sub-DAG.

Executed V8 line scan on seven fetched modules, word-boundary name matches,
manually confirmed against actual proof bodies. No kernel role inference.
LongForms L22 and L66 each call D.volume_iota_eq_prod_liftVolume.
LongForms L26 calls heightLe_liftVolume_ratio for j in Icc 1 m.
LongForms L66 calls exists_isFitFamily D, L68-69 the two height suppliers.
Main L122 and L134 consume the same selected n,y,i,big,I,short.
FitTwistsExist L57 and LiftVolumeHeight L90 call range_goodLift_le; those
have potentially different twists/targets and are NOT merged here.
RowVolume L75-82 contains the actual packet-spanning proof, not a proof
of any uniform denominator bound.

## Original selected source-application graph (not kernel graph)
root riemannHypothesis -> New.zeta_zeros_on_line / New.grh
  -> eventually_primeError_le_rpow -> star_inequality
star -> exists_family_covolumeSq_le -> short_forms + enough_forms
star -> integral_forms_long [same D,y,i,hn,I,hV]
integral_forms_long -> exists_isFitFamily [D] -> theta,o
integral_forms_long -> volume_iota_eq_prod_liftVolume [D] -> nonzero Z
integral_forms_long -> heightLe_volume_rows [D,y,i,hn,I,hV,theta,o]
integral_forms_long -> heightLe_volume_ratio_sq [D,theta,o]
heightLe_volume_ratio_sq -> volume_iota_eq_prod_liftVolume [D] -> c,const,vol
heightLe_volume_ratio_sq -> heightLe_liftVolume_ratio [D,theta,o,j]
Both occurrences of the factorization have identical explicit D, although
the selected output projections differ. No claim of two kernel executions:
Lean theorem applications can already share proof constants.

## Reduced selected graph, exact same-witness recombination
integral_forms_long_shared -> exists_isFitFamily [D] -> theta,o
integral_forms_long_shared -> volume_ratio_sq_with_nonzero [D,theta,o]
volume_ratio_sq_with_nonzero -> volume_iota_eq_prod_liftVolume [D] ONCE
volume_ratio_sq_with_nonzero -> heightLe_liftVolume_ratio [D,theta,o,j]
integral_forms_long_shared -> heightLe_volume_rows [same D,y,i,hn,I,hV,theta,o]
The paired certificate projects both needed nonzero statements and the
ratio bound from the one native universal factorization witness.
Keep theta/o context keys; do not merge across different D or lift index j.
The same independent family, all conjugate bounds, full twist selection,
all p-adic embeddings, index sums, lift-height, scale bounds, product formula,
and crude-row completion survive. No new premise and no dropped uniform estimate.

Human proof. Write d_R=rowDim, L=logB*budget, H=mainHeight.
The native factorization gives z(v) != 0 and
 z(v)=|c(v)|^d_R product_j lambda_j(v)
for ALL v, with CostsSquares on this one c. Use it at v=1 and v=theta(iota).
The separate lift ratios have total height <= d_R(L-H).
The constant ratio |c(theta(iota))/c(1)|^(-2) has height <= 2L.
Squaring the lift-ratio product and taking the constant ratio to power d_R
therefore bounds z(1)^2/z(theta)^2 by height 2d_R(2L-H).
The other height supplier gives height <= V+2delta+d_R*b for z(theta)/z(1)
on the SAME theta. Multiply its square by the reciprocal squared ratio:
the family is exactly 1, since both volumes are nonzero. Product formula
gives 0 <= 2(V+2delta+d_R*b)+2d_R(2L-H). With b<=L this yields
d_R(H-3L)<=V+2delta, precisely the native C conclusion.
This makes the common factorization explicit in the human argument; it
does not prove the hard lift-height or fit-family theorem independently.

Original graphs and axiom evidence remain in place. This file introduces
no new axiom and contains no sorry/admit; independent axiom replay is still
required. No local Lean or Lake found (command -v returned no paths).
Registry read: old engine jobs exist but no compact job located in that
registry scan. Existing old-toolchain CI cannot certify this file. No new
native PASS, timings, kernel coverage, or root obligation discharge claimed.
Use the single shared compact runner when available, not a competing build.
Test command from pinned compact project: lake env lean <path-to-this-file>.
-/

open Finset LinearMap Real Submodule LevelPlaces.LevelForm

namespace CompactDependencyRun50

variable {P} {D : Data P}

/-- One exact native factorization supplies the nonzero guards and height together. -/
lemma volume_ratio_sq_with_nonzero {θ} (o : D.IsFitFamily θ) :
    D.𝔷 (1 : D.MFoldTwist) ≠ 0 ∧
    (∀ ι : PrimePadicIso, D.𝔷 (θ ι) ≠ 0) ∧
    HeightLe (2 * D.rowDim * (2 * (D.logB * D.budget) - D.mainHeight))
      (fun ι ↦ D.𝔷 (1 : D.MFoldTwist) ^ 2 / D.𝔷 (θ ι) ^ 2) := by
  obtain ⟨c, const, fac⟩ := D.volume_iota_eq_prod_liftVolume
  have vol ϑ := (fac ϑ).2
  refine ⟨(fac 1).1, fun ι ↦ (fac (θ ι)).1, ?_⟩
  have lifts : HeightLe (D.rowDim * (D.logB * D.budget - D.mainHeight))
      (∏ j ∈ Icc 1 D.m, fun ι ↦ D.liftVolume 1 j / D.liftVolume (θ ι) j) := (HeightLe.prod
    fun j h ↦ by exact heightLe_liftVolume_ratio o ⟨j, mem_Icc.1 h⟩).mono
    (by simp [mainHeight]; field_simp [(HasLogBound.pos D).ne']; rfl) fun _ ↦ le_rfl
  have consts : HeightLe (2 * (D.logB * D.budget)) fun ι ↦ (‖c (θ ι) / c 1‖ ^ 2 :)⁻¹ :=
    (const θ o).mono (by simpa using D.le_of_hasLogBound) fun _ ↦ le_rfl
  exact ((lifts.pow 2).mul (consts.pow D.rowDim)).mono (by grind) fun ι ↦
    (congrArg (‖ι.2 ·‖) (by simp [vol, mul_pow, div_pow, ← pow_mul]; ring)).le

variable {n} {y : Fin n → _} {δ V} (i : LinearIndependent ℂ y)
  (hn : (1 - 4 / D.b ^ 2) * D.rowDim ≤ n) (I : D.IndexLe y δ)
  (hV : ∀ σ, covolumeSq (D.Θ 1 ∘ y) σ ≤ exp V)

/-- Replacement at the actual C interface; unchanged premises and conclusion. -/
lemma integral_forms_long_shared : D.rowDim * (D.mainHeight - 3 * (D.logB * D.budget)) ≤
    V + 2 * δ := by
  obtain ⟨θ, o⟩ := exists_isFitFamily D
  obtain ⟨z0, zθ, ratio⟩ := volume_ratio_sq_with_nonzero o
  have formula : 0 ≤ 2 * (V + _ + _) + _ :=
    ((((heightLe_volume_rows i hn I hV o).pow 2).mul ratio).mono le_rfl
      (by simp [field, z0, zθ])).nonneg
  linarith [(by gcongr; exact D.le_of_hasLogBound : D.rowDim * D.b ≤
    D.rowDim * (D.logB * D.budget))]

end CompactDependencyRun50

#print axioms CompactDependencyRun50.volume_ratio_sq_with_nonzero
#print axioms CompactDependencyRun50.integral_forms_long_shared

/-!
## RESUME HERE
Replay the paired factorization and actual C replacement in the compact
shared runner. After successful replay, substitute integral_forms_long_shared
at New/Main.lean L134 and inspect exact type/value/constructor edges and
axioms, then inspect range_goodLift_le at RowVolume L75 in BOTH actual callers
(FitTwistsExist L57, LiftVolumeHeight L90) with context-specific packet spans.
Do not identify the twist or target subspace without elaborated evidence.
HANDOFF TO: integration, kernel extractor, formal audit, human editor.
Source pin and prior peer commit SHAs above; this artifact's commit is
recorded by GitHub, not self-referentially embedded. No protected edits.
-/
