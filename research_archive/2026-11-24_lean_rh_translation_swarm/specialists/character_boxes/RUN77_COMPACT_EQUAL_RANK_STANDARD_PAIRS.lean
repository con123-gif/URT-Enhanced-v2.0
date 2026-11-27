import New.Exchange.EqualRankValue
import Mathlib.Tactic

/-!
# RUN77 — remove the arbitrary-partner extension from both equal-rank exchanges
27 November 2026. C2, SOURCE-MATCHED conditional human reduction; native candidate
PREPARED, not elaborated. Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
67e542df1b5557b2e1314643931ef1355bbdc50d, live ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d; AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE, EXPANSION, continuity, research-state/log/protocol and peer
integration RUN79 fab4aba0, active B2 ab9d8047 inspected. RUN76 9d383221
already removes both flips at the final determinant-only Carrier caller.
Do not duplicate that proof. Here the target is the different, upstream
equal-rank common-ratio supplier's TWO calls to exchange_of_partners.

Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin leanprover-community/riemann-hypothesis@40e56bab026552e089d7afcfeff08d2defb9c005
retained separately. Source blobs:
- New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d:
  exchange_of_partners, exists_equalRankThetaRatio_value, slice_zero_comp.
- New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c:
  StdExchange and its actual quantifier over integral z.
- New/Exchange/ExchangeDifference.lean 05f961bbec79dda9700a60484436878c0205ad96:
  thetaSmall, exists_isEquivariantLift.
- Lib/Weil/DualPair/Flip.lean 898bcfb603860846967112bf7e3c87374006ca90:
  flipCoords, exists_pairTheta_flip.
- Lib/Weil/GaussSum/ShearInvariance.lean 1fe3a70f51455d1bfd976a4ad11661810ba91c7a:
  stdRowDatum, stdColDatum, stdColDatum_mem_schwartzBruhat.
- Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1:
  pairChar and rankTwist.
- Lib/Weil/DualPair/ThetaIntegralLaws.lean a3d838ed0696e8fd4f47bd2c97a76c35d05a4246:
  thetaLarge, ReadsAt.isSchwartzBruhat.
- Same-pin readable companion grh/src/New/Determinant/Exchange/TheoremForPartners.lean
  ce25f3cb6ba24e8f34174de581e3a76478b11be8, lines 542-738:
  explicit nonzero-reference and double-exchange statements; explanatory only.

## 1. Actual consumer, not a scalar optimization

In exists_equalRankThetaRatio_value, after the nonzero-reference branch,
the two choose lines obtain full arbitrary-partner exchange (J,J,Z) and
(J,Z,J) for definite J, zero Z. But their only consumers are:
  forward: K 𝔠 (stdColDatum _ 1) _ (.of_discrete _) (isPartner_stdRowDatum_stdColDatum _ (s := 0) nofun)
  reverse: H 𝔠 (fun _ ↦ stdColDatum _ 1 1) _ (stdColDatum_mem_schwartzBruhat _ .one).1
             (isPartner_stdRowDatum_stdColDatum _ IsIntMatrix.one).
Both are literally standard pairs, with z=0 (empty rows) and z=1
(square rows), respectively. Thus the existing StdExchange witness
ALREADY gives the entire theta identity before the arbitrary-partner
extension. No span argument, arbitrary locally constant Ψ, or new
equivariant-difference module is needed at these two final conversions.

Keep the initial rapid flip, opposite slice, top exchange and descent
from exchange_of_partners unchanged (same signs, same A, same y,z).
After choosing rv,C,c,K, K says:
  thetaLarge(W,V,v,Φ_z) = c • thetaSmall(W,flipSpace U,f.realMap y,Ψ_z)
for each integral z, with Φ_z=stdRowDatum σ χ z and Ψ_z=stdColDatum χ z.
Use this identity directly. The source's map_name proof needs only
Schwartz-Bruhat Ψ_z; take stdColDatum_mem_schwartzBruhat χ hz directly.
The source's finite phase calculation needs only P.right_mul; take the
native standard-pair witness isPartner_stdRowDatum_stdColDatum σ hz.
No need to extract Schwartz-Bruhat membership from the extended module.

The source flip converts thetaSmall to the original partner-side
integral with exactly the scalar χ(t)^rank(U) d, where t is the
integral unit normNegOne and |d|=1. Therefore the norm identity and
common C are unchanged:
   c'_χ = c_χ χ(t)^rank(U) d,
   C |c'_χ|² = C |c_χ|² = Π(e) R_χ.
This remains valid when c=0 or R=0, without dividing by either.
Multiplying the standard identity by γ(det g) converts the large side
from (γ,γ) to (γ,1), exactly as the original proof. The fixed standard
pair lemma below preserves the original orientation on the small side.

## 2. Why not remove the flip in the reverse exchange?

RUN76's unflipped prefix suffices for the final Carrier zero-complement
call, and also for the forward zero-complement exchange. But in the
reverse (J,Z,J) direction U is nonzero. The unflipped thetaSmall uses
rankTwist ν n, upsilonU1^rank U, conjugate-place reads, and transpose,
whereas the common kernel for the forward exchange uses rankTwist ν⁻¹ n
in BOTH slots and the original reads. These are not identical by
rank arithmetic. Dropping that conversion would invalidate the Fubini
step. Keep the native phase/flip for reverse; use the same general
standard-only lemma for both calls to avoid a separate proof.

## 3. Exact consumer edit (after helper replay)

In the nonzero-reference branch of compact exists_equalRankThetaRatio_value,
replace both occurrences of exchange_of_partners in its two choose lines
by RHCharacterBoxes77.exchange_of_standard_pairs. Same arguments, same
witness order C,v,rapid, per-character c,norm,identity. Replace the
forward specialize by K 𝔠 0 (by simp [IsIntMatrix]) and use the reverse
identity H 𝔠 1 IsIntMatrix.one g. The first row function is
stdRowDatum (emptySum Empty _) χ 0 = stdColDatum χ 1, by empty reindex
and fromRows; second row datum on the empty matrix evaluates to 1.
Retain exactly the source simplification, Fubini, volumes, signed Π
and isometry. The earlier RUN67 algebra is not re-proved. Its
nonzero-reference fallback uses THREE plane removals for k=1,q=0:
the readable companion explicitly has top source H^(2k)+Y (rank 8)
and target J.neg+Y (rank 6), not merely H+Y. Retain the determinant
surjectivity, nonzero rank-zero volume, weight μ>=1 and period primitives.

Local original graph (each of two equal-rank calls):
  equalRank -> exchange_of_partners -> top/descent + flip
    + exists_isEquivariantLift + arbitrary partner generation.
Proposed:
  equalRank -> exchange_of_standard_pairs -> SAME top/descent + SAME flip
    + native standard-pair and Schwartz-Bruhat facts.
  Equal-rank nonzero reference, Fubini and both signed L budgets unchanged.
The deleted extension is still used in other callers and INSIDE
top/period construction; no global pruning/axiom retirement.
Original/reduced graphs and prior evidence retained. Context cache key:
pin, actual standard pair, integral z, same χ, A, rapid y,z_ref,
orientation and sign count; no conflation with general partner theorem.
No URT comparison needed for exact caller premise restriction.

## 4. Verification and handoff

Local command -v lean, lake and search of ~/.elan/toolchains gave no
executable/toolchain here. Prepared candidate below is not compiled;
rh_scan/prune/reduce/auto/frontier cannot execute on these proof bodies
in this environment. No new kernel, CI, scalar or synthetic test claimed.
Actual compact CI receipt 088cd2ec0e935ee1a282f10096949bcf671cc804
still shows six original named theorem checks, standard three axioms,
JetExponentBound timeout 124, all_requested_checks_ok=false,
full_RH_replay=false. New shared B2 receipt d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d
run 45986308748, returncode 0, eight helper proofs and six separate
original caller axiom probes, omitted-guard negative control rejected;
caller_replacements_checked=false and human_assembly_verified=false.
That is not C2 verification. Latest orchestrator summary a3336edc
run 45989338731 is also not verification of this declaration.
No extra conjectural assumption, no root obligation closed.

RESUME HERE: shared native runner: compile the standard-pair-only
replacement below on compact pin alongside RUN76; then replay the exact
two choose substitutions in exists_equalRankThetaRatio_value (do not
use that theorem as proof of its replacement). Inspect actual axiom
and constructor-inclusive dependency graph for the two new callers,
retaining the nonzero-reference branch and all errors. Integration/editor:
use this smaller path only after replay; do not reopen the already
recorded scalar cancellation or conflate its result with signed C2
height closure. HANDOFF TO integration, editor, formal audit, native runner.
RH remains OPEN.
-/

open Matrix MeasureTheory Fintype Std Weil ExistsContDiffBumpBase

namespace RHCharacterBoxes77

/-- Only the standard pairs consumed by the double equal-rank exchange.
    Direct specialization of the source proof before extension. -/
lemma exchange_of_standard_pairs {E} [Field E] [CMType E] [WeilData E]
    {n m r p b} [Fintype n] [Fintype m] [Fintype r] [Fintype p] [Fintype b]
    {s s' t u} {W : Space E n s} {X : Space E m s'} (U : Space E b u)
    μ [Nonempty p] (A : (hypSum Unit X).Splitting W p) [IsBaseAdapted A]
    (V : Space E r t) (σ : b ⊕ r ≃ n) {z y}
    (r₁ : IsRapidDatum z) (hy : IsRapidDatum y)
    (hs : 1 + negCount s' = card p + negCount t + negCount u := by simp)
    (hn : 2 ∣ card n := by simp) :
    ∃ C v, IsRapidDatum v ∧ ∀ 𝔠 : SplitTameChar E μ,
      let γ := rankTwist 𝔠.ν⁻¹ n
      ∃ c, C * ‖c‖ ^ 2 = lValueProdInt 𝔠 (card r - card n / 2) *
        equalRankThetaRatio (hypSum Unit X) 𝔠 z ∧
        ∀ a, IsIntMatrix SemilocalField.O a → ∀ g,
          thetaIntegral W V γ 1
            (localDatum W V v (stdRowDatum σ 𝔠.χ a) 𝔠.readsAt) g =
          c * ∫ h, pairTheta U W γ γ
            (localDatum U W y (stdColDatum 𝔠.χ a) 𝔠.readsAt) (h, g) ∂U.quotMeasure := by
  let f := flipCoords (E := E) (s := s) star_normNegOne_mul_self (t := u) rfl
  have : IsRapidDatum (f.realMap y) := by
    simpa [IsRapidDatum, weightedNorm, enorm, fun x ↦ (eq_of_forall_ge_iff (by
      simp [f, flipCoords, starCoordEquiv, ↓pi_nnnorm_le_iff, nnnorm]; tauto) :
      ‖f.realEquiv x‖₊ = ‖x‖₊), ← (Heisenberg.IsVacuum.measurePreserving_equiv
      (realHeis 1) (realHeis 1) f.vac_realEquiv).lintegral_comp_emb
      f.realEquiv.measurableEmbedding] using! hy
  obtain ⟨_, w, a, e, -⟩ := exists_rapid_with_realSlice A.symm _ _ (u_smooth _) this
    (u_compact_support _) u_nonneg 0 ((u_support _).ge (by simp))
  obtain ⟨⟨x, u, rfl, H⟩, _, k⟩ := exists_stdExchange_top (removePlanes ..)
    (removePlanes _ X) (flipSpace U) (.symm (.sumAssoc ..)) (by grind [A.card_eq]) μ a r₁, id hn
  choose rv _ C c _ K using e ▸ slice_zero_comp _ _ (removePlanes ..).symm A u ▸
    (exists_stdExchange_removing_planes _ _ _ μ 0 0 V σ _
      (by simp; grind [negCount_neg_add]) hn).choose_spec.1 _ _ H
  refine ⟨C, _, rv, fun 𝔠 ↦ ?_⟩
  let t := normNegOne.map ((evalPlaces 𝔠.S).restrict _ _ evalPlaces_mem_O).1
  obtain ⟨d, hd, H⟩ := exists_pairTheta_flip star_normNegOne_mul_self rfl U W
    (flipSpace U) 1 (by simp [flipSpace, ← ext_iff]) _
  let r := 𝔠.readsAt
  use c 𝔠 * 𝔠.χ t ^ card b * d, by simp [*, TameLocalChar.norm_eq_one, isIntegralUnit_iff_isUnit.2],
    fun a ha g ↦ ?_
  let Ψ := stdColDatum 𝔠.χ a
  have P := isPartner_stdRowDatum_stdColDatum σ ha
  have hΨ := stdColDatum_mem_schwartzBruhat 𝔠.χ ha
  rw [mul_assoc, ← integral_const_mul, ← funext fun l ↦ H _ _ l _ l.neg (by simp)]
  have : localDatum W (flipSpace U) (f.realMap y) (Ψ ·ᵀ) r.star =
      𝔠.χ t ^ card b • f.map (localDatum U W y Ψ r) := by
    rw [map_integrated, map_name _ _ _ r.1 r.star.1 (hΨ := r.isSchwartzBruhat hΨ),
      ← map_smul, Space.smul_name]
    congr!; dsimp; rw [← P.right_mul _ ⟨.scalar _ t, rfl⟩, mul_comm]; congr
    all_goals (try unfold f flipCoords starCoordEquiv); simp [vecToMat, funext_iff,
      mul_left_comm, star_idem, starRingEnd_apply, Set.conjClosure, ← ext_iff, field, t]
  convert congr((rankTwist 𝔠.ν⁻¹ n).1 g.det * $(K 𝔠 a ha) g) using 1 <;>
    simp [thetaIntegral, isForm_neg_iff_and_integral_neg U (flipSpace U), pairTheta,
      pairWeil, rankTwist, ↓this, *, ← integral_const_mul, Ψ, r]
  repeat congr with <;> field

end RHCharacterBoxes77

#check RHCharacterBoxes77.exchange_of_standard_pairs
#print axioms RHCharacterBoxes77.exchange_of_standard_pairs
