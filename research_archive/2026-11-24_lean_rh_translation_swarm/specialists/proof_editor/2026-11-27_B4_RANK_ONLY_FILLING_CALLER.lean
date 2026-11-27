import New.Filling.FillingTheorem

set_option autoImplicit false
set_option relaxedAutoImplicit false
set_option maxSynthPendingDepth 3
set_option pp.unicode.fun true
set_option maxHeartbeats 4000000

/-!
27 November 2026 — B4 rank-only actual caller replacement, PREPARED / human
source-matched, NOT native-replayed. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

Mission blob 3adc76221a978016e3505cdf3e36ad688354d7d7; live spine
67e542df1b5557b2e1314643931ef1355bbdc50d; ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d. Peers through 5e95a2dd read,
including successful B2 batch and active BlockBound caller replacement.
Prior centered filling note (26 Nov) already derives a stronger greedy
constant conditional on three moment estimates; do not duplicate it.
Here use the ORIGINAL checked Fits result and isolate the rank-only
ramification supplier at its actual caller, without the short-vector
half of the combined theorem. No improvement of constants claimed.

Exact source blobs:
 New/Filling/FillingTheorem.lean 801448ae9b895babd0d69dc4f7967d86eb006e76
 New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444
 New/Filling/RowDimension.lean 5f8292b806de0cc8a11c560b573efb6ec7fe7316
 New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7
 New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6
 New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
 New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05

Human audit: put V=Column, W=rows, v=dim V, d=dim W. For each
w dividing pi, K_w=1-z_w has nullity <=v/(N-1) from the native
finrank_ker_one_sub_centralGen_le (retains the central unit order,
level index, stabilizer and class-count proof). For any subspace U
and linear K, the map K: K^{-1}U -> U has kernel ker K, so
dim K^{-1}U <= dim U+nullity K. Iterate over the actual product E
of K_w. Thus rank loss is bounded by f v/(N-1), independent of all
shortness/norm hypotheses. No injectivity or unitary assumption on E.
Equivalently, for q_F:W->W/F and T_s the unramified projected map,
rank(q_F T_s E) = rank(q_F T_s)
                   - dim(im(q_F T_s)/im(q_F T_s E)).
The loss is <=codim(im E)=nullity E. Source rank result therefore gives
rank(q_F T_s cE) >= v[(1-dim F/d)/2-19/(2b^4)-f/(N-1)]
when d>0. Multiplying E by c in C^x does not change this rank.
Use the source coordinate equivalences, tensor central projector
identification and the original HasLogBound arithmetic, rather than
optimizing scales. They give 19/(2b^4)+f/(N-1)<=b^-2 for actual D.
For example the retained bounds b>=1000, f<=b, N-1>=b^9 imply this:
19/(2b^2)+b^-6<=1. This calculation does not replace the source guards.

Positive row dimension is not a premise for the original IsSpread
statement (Lean's real division is total). If d=0, take F=top:
its preimage is all V and dim F/d=0, hence v <= (1/2+b^-2)v,
contradiction since columnCoords.nontrivial and b>=1000. No circular
use of positive row dimension. With d>0 use the existing greedy
potential and exactly the same translate set, no extra choice.
Range(q*projectedPoincare s)=range(T_s E) for every q!=0:
E is onto its range by definition, c from seesaw is a unit. The
source LongForms uses the same B, t, S for index and Gram bounds.
A retains span_short_ramifiedColumns; its shortness proof is NOT
retired globally. Counterexample to removing the rank-loss premise:
V=W=C, T=id, E=0, F=0 gives unramified rank 1 but ramified rank 0.
The rank-only replacement retains every primitive B1–B3 premise.

Original source-visible edges:
 ramifiedColumns_fill_rows -> Fits.exists_translate_finrank_comap_le,
 finrank_rows_le_mass, ramifyingOp_finrank_comap_and_short,
 Petersson/coordinate/central-projector/scale/measure suppliers.
Candidate replaces only the combined-theorem edge by rank-only lemma
 -> finrank_ker_one_sub_centralGen_le, lift_rank_comap_le,
 product/comap arithmetic. Other edges unchanged. enough_forms and
 exists_family_covolumeSq_le remain original callers. No global
 dependency deletion or constructor-inclusive graph claim.

Actual CI receipts read this run:
 compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json:
 original Fits.exists_translate_finrank_comap_le checked, standard
 propext, Classical.choice, Quot.sound. JetExponentBound build exit 124.
 compute/rh-compact-b2-human-replay-20261127/status.json blob
 d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d; run 45986308748,
 returncode 0. b2_native_results.json: 8 helpers, 6 original caller
 axiom probes, omitted-projector negative control rejected (exit 1).
 caller_replacements_checked=false; human_assembly_verified=false;
 full_RH_replay=false. Active BlockBound replacement already queued
 by peer 5e95a2dd; do not duplicate its build.
 This environment command -v lean/lake found neither. The code below
 is a source-matched candidate, not a compiled certificate. Native
 rh_prune/rh_scan/rh_reduce/rh_auto/frontier unavailable here; old
 4.33 receipts do not certify this compact 4.35 candidate. No URT
 experiment required. No new native axiom or retired root obligation.

RESUME HERE: shared native runner, after current BlockBound caller
 replay, compile this exact file in pinned compact workspace, compare
 the original/candidate theorem types and require the candidate proof
 to consume the rank-only lemma without direct call to the original
 ramifiedColumns_fill_rows or combined ramifying theorem; then test
 the actual enough_forms caller substitution. Keep B1–B3 and A's
 shortness dependencies explicit. HANDOFF TO editor/integration/audit.
-/

open Module Finset Fintype Matrix MvPolynomial NumberField Representation Space Submodule Valued
open Filling

namespace Data

variable {P} (D : Data P)

/-- Rank part only of the original ramification supplier. -/
lemma editor_ramifyingOp_rank_only s p :
    finrank ℂ (Submodule.comap (D.ramifyingOp s) p) ≤
      finrank ℂ p + #s * (D.N - 1 : ℝ)⁻¹ * finrank ℂ D.Column := by
  induction' s using cons_induction with w s _ a generalizing p
  · rw [(by simp [ramifyingOp] : D.ramifyingOp ∅ = 1)]
    simp
  · erw [card_cons, ramifyingOp, prod_cons, map_mul, map_sub, map_one,
      asAlgebraHom_of, p.comap_comp (D.ramifyingOp s)]
    grw [a _, (by simpa [↓← finrank_eq_rank, ← Nat.cast_add] using
      (1 - D.centralRep (D.centralGen w)).lift_rank_comap_le :), Nat.cast_add,
      finrank_ker_one_sub_centralGen_le]
    grind

/-- Original B4 statement, replacing the combined rank/shortness supplier
at the actual source caller, not invoking the original B4 theorem. -/
lemma editor_ramifiedColumns_fill_rows (c : ℂˣ) :
    IsSpread (D.goodProjTranslate · ∘ₗ D.poincare ∘ₗ
      (c.1 • D.ramifyingOp .univ)) (D.b ^ 2)⁻¹ := by
  have := D.hasLogLower_of_le (le_sub_iff_add_le.2 D.le_of_hasLogBound :
    D.b ^ 9 ≤ D.N - 1)
  have h := Fits.exists_translate_finrank_comap_le (ρ :=
    .comp (D.principalRep _) (.mk' _ (by tauto))) (fun _ _ _ ↦ Space.inner_formRep ..) (fun _ ↦
    (D.filling_fits.petersson_poincare · · (@reduceFamily_liftResidue ..))) (fun _ ↦
    isCentralProj_sum_tupleIdem) (fun i ↦ (bad_share_le (M := P.Mω D.s) (q := D.g i) _ (9 * D.logB)
    (card_resField_eq_levelPrime _ i) rfl (card_chosenPlaces _ i) D.nat_lt_of_hasLogBound
    D.nat_lt_of_hasLogBound D.le_of_hasLogBound le_rfl D.le_of_hasLogBound).trans
    (filling.eq_1 D ▸ D.le_of_hasLogBound)) (measureReal_pos_of_isLevel (K := D.chosenLevel))
  erw [(?_ : Representation.asAlgebraHom _ _ = (principalRep ..).asAlgebraHom D.e₀), Shape.r,
    card_rowIndex, ← Nat.card_congr (.piCurry _)] at h
  simp_rw [IsSpread, ← D.columnCoords.finrank_eq, ← (D.columnCoords.ofSubmodule' _).finrank_eq] at h
  refine fun F ↦ (h D.finrank_rows_le_mass F).imp' Sigma.uncurry fun _ h ↦
    .trans (mod_cast finrank_mono fun _ ↦ by simpa using!
    id) (((D.editor_ramifyingOp_rank_only .univ _).trans (add_le_add h le_rfl)).trans ?_)
  simp [← add_mul, add_assoc, card_piPlaces, filling]; gcongr; use D.le_of_hasLogBound
  open Fint in simp_rw [asAlgebraHom_eq_sum, reindex_equiv (Equiv.piCurry _)]
  simp [e₀, goodTupleFamilies, tupleIdem, Finset.prod_univ_sum, Fintype.prod_sigma]; rfl

/-- Reuse the replacement for the nonzero row-dimension caller. -/
lemma editor_finrank_rows_ne_zero : finrank ℂ D.rows ≠ 0 := fun e ↦
  (D.editor_ramifiedColumns_fill_rows 1 ⊤).rec fun _ ↦ by
    erw [finrank_top, e]
    norm_num [finrank_pos_iff.2 D.columnCoords.nontrivial, ← lt_tsub_iff_left]
    use D.lt_of_hasLogBound

end Data

#print axioms Data.editor_ramifyingOp_rank_only
#print axioms Data.editor_ramifiedColumns_fill_rows
#print axioms Data.editor_finrank_rows_ne_zero
