import New.Exchange.EqualRankValue
import New.Exchange.ExchangeTheorem
import Mathlib.Tactic

/-!
# RUN76 — extract the actual standard exchange supplier, without either flip
27 November 2026. C2 ledger. SOURCE-MATCHED human caller reduction and
PREPARED native replacement; not elaborated or replayed. Credit Alpöge,
Sernau, Anthropic collaborators and Claude.

Mission blob 4aed2e68e6bd724826bc1e669c07a48e0b95eddd (including mandatory
engine), LIVE_PROOF_SPINE 45686f0e, LIVE_OBLIGATIONS ca6d4c0e, AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION, continuity, research-state/log
openings and registry inspected. Peer integration RUN79 fab4aba0 is the
actual consumer; RUN75 788d56c5 remains unchanged. Recent peers 31f5d332
and f93cf29c concern C1 and A2 respectively, not this replacement.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207
(observed current default head), grh-compact/src, Lean 4.35.0 /
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Old pin leanprover-community/riemann-hypothesis@
40e56bab026552e089d7afcfeff08d2defb9c005 remains separate.

Source anchors relative to grh-compact/src:
 New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d
   lines 35-87, 97-119 and 146-149; slice_zero_comp,
   exists_stdExchange_removing_planes, exchange_of_partners.
 New/Exchange/RealPair.lean f2a4ed6190f46b592334117dda62a72b3e6d4704
   exists_rapid_with_realSlice, exists_stdExchange_top.
 New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c
   StdExchange, equalRankThetaRatio.
 New/Exchange/ExchangeTheorem.lean 608b4f61af27d780e24f799937a836ecd3c1d50a
   local pi, e, d in exchange_theorem.
 New/Exchange/ExchangeDifference.lean 05f961bbec79dda9700a60484436878c0205ad96
   thetaSmall.
 Lib/Weil/DualPair/Flip.lean 898bcfb603860846967112bf7e3c87374006ca90
   realMap_flipCoords_polyVector.
 Lib/Weil/Fock/FockTensor.lean 120f531824514a1f9b1352cb7110312cffd5642b
   polyVector_one.
 Lib/Weil/GaussSum/ShearInvariance.lean 1fe3a70f51455d1bfd976a4ad11661810ba91c7a
   stdRowDatum, stdColDatum.
 Lib/Weil/DualPair/ThetaIntegralLaws.lean a3d838ed0696e8fd4f47bd2c97a76c35d05a4246
   thetaLarge, realSlice.
 Lib/Weil/Construction/PairDefs.lean 8a5eaed1249fcc1c482e3af4f15373682fa34af1
   pairChar, rankTwist.
 Lib/ClassField/HeckeCharacter/LevelModulus.lean e5cbce2a0dbeea2d08ed0a5b596b973c3f3fcc52
   IsTameFor.inv, IsTameFor.mul.
 New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40
   explicit_matching, stdClassSum_det_modKernel_eq (159-170).
 Additional exact source excerpts: Lib/ClassField/HeckeCharacter/LineParabolic
   isUnit_iff_residueAt_ne_zero; Lib/General/Topology/LocalDefs invOnUnits;
   Lib/General/LinearAlgebra/ColumnLattices liftIntegralFn;
   Lib/Adelic/CuspForms/RealConvolution Space.integral_quotMeasure_eq_classSum.

## 1. Direct caller replacement (not another scalar check)
RUN79 stopped before the final arbitrary partner and flip step, but retained
the initial flip of y. At the standard-only interface this initial flip is
also unnecessary. Work directly with the desired rapid datum y on Hom(W,U),
not a datum on Hom(U,W). Let Y=hypSum Unit X, let A:Y split over W by p
planes, and let Yplus=hypSum Unit Y. Keep the adapted splitting and even
rank of W and the same sigma: b+r=n. In this orientation the sign premise
is negCount(U)+1+negCount(X)=|p|+negCount(V): this is exactly the
descent sign condition for U.sum Y, not the original premise for flipSpace U.
It is automatic for the actual positive rank-two case U=stdSpace Empty,
X=W=V=stdSpace Fin 2, p=Unit. No change of signs for the genuine general
partner theorem is proposed.

Apply exists_rapid_with_realSlice to A.symm, U and y directly: obtain
rapid w with the required zero slice y (same native nonnegative compact
bump). Apply exists_stdExchange_top to the added hyperbolic plane of Y,
with U and w, obtaining x,x' with zero slice w and StdExchange at the
top. Apply exists_stdExchange_removing_planes to the composite of that
plane's reverse splitting and A. Its fixed output map sends x to v.
By slice_zero_comp the small datum is exactly y, no phase or scalar:
    slice_A(slice_top(x')) = slice_A(w) = y.
The normalization function remains equalRankThetaRatio Y c z, with the
same z chosen before c. The actual standard-only conclusion is
    exists v, StdExchange W V U mu sigma v y (equalRankThetaRatio Y · z).
This exposes the common normalization and every tied character at once.
The executable candidate below copies the actual supplier prefix and
drops the initial coordinate change plus final arbitrary-partner
extension. It is not a new proof of the underlying top/descent suppliers.
No calling exchange_of_partners, exchange_theorem, Carrier or RH.

In particular the original flip vacuum claim is independently justified:
realMap_flipCoords_polyVector at P=1, flipPoly(1)=1, polyVector_one.
Thus even if integration elects the original prefix, the vacuum has no
unknown scalar. The proposed direct prefix needs no such identity.

## 2. Audit exact finite and rank-zero consumer (RUN79)
For sigma=emptySum Empty n, z the sole Empty-by-n matrix, integrality
vacuous, stdRowDatum definition gives
    stdRowDatum sigma c.chi z (M) =
        1_{M integral} invOnUnits c.chi(det M).
The row reindex is identity on the nonempty block (not a row swap).
stdColDatum c.chi z on n-by-Empty is 1: determinant of Empty-by-Empty
product is 1 and integrality holds. This is also the zero-column case of
the local simp proof in exists_equalRankThetaRatio_value.
The direct proof takes the standard pair only, never invokes IsPartner
for arbitrary partners.

Under IsTameFor modulus alpha (-c ·) chi, the original hα.inv.mul
(hasWeight_upsilonU1_pow 1) supplies nu=alpha^-1 upsilonU1, weight
c+1, residue character chi^-1. Keep precisely the same tame datum and
local reduction pi from ExchangeTheorem: residue_i(pi u)=residueAt_i u.
For integral u, IsUnit(pi u) implies every local residue nonzero and
hence IsUnit(u) by isUnit_iff_residueAt_ne_zero; the forward direction
is functoriality of units. Consequently for integral matrices M,
det(pi M)=pi(det M), and
    invOnUnits c.chi(det M) = chi(det(pi M)).
Proof: on units c.chi is the product of the original inverse residue
characters, by the actual a3 and localChar_apply_of_isUnit calculation
in ExchangeTheorem. Invert once, not twice. On nonunits the left
cutoff and the right MulChar.map_nonunit both vanish, using unit
reflection, NOT merely the statement det M ≠ 0. Off the integral
matrix locus both lifts vanish by liftFn_apply/mk'_apply (identity d).
Thus the determinant-only modDatum is exactly the standard datum,
with neither star conversion nor arbitrary-partner lift required.
The two directions of the guard and exact character agreement remain
explicit; the helper below packages these in the scalar determinant
component for a native caller proof.

At rank zero the small theta has character on det(h)=1 and second
character upsilon^0=1, Hom is the zero space and its vacuum/finite datum
evaluate to 1 (the native empty-name lemma and empty product of
lineTheta). Integrate 1: V0=∫1 dquotMeasure, the same positive factor
kept by Carrier line 166. Do not set V0=1. The large side is already
thetaLarge with both characters alpha by rankTwist. Hence for every g
    thetaIntegral(W,V,alpha,alpha,v,chi∘det)(g)=b_chi V0
    T |b_chi|²=P_chi(1) R0 .
The compact fixed-line argument of RUN66/RUN79 and class-integral
normalization remain required. Specifically use the exact
Space.integral_quotMeasure_eq_classSum at Kf, index 1, with left rational
invariance, compact real invariance and finite right invariance (the
character of h cancels the inverse determinant of h in the row datum).
Do not identify arbitrary real datum v with determinant v_D; the
common nonzero proportionality is a separate existing derivation.

## 3. Graph and audit boundary
Original local path: Carrier -> explicit_matching -> exchange_theorem
 -> exchange_of_partners -> initial flip rapid, top, descent, final
 flip, arbitrary partner extension; plus modulus, fixed-line and measure.
RUN79 local candidate retained initial flip, top, descent, standard pair.
New local candidate: Carrier -> standard_prefix -> direct rapid lift,
 top, descent, slice composition; then standard pair -> determinant lift
 equality -> zero-side volume -> compact fixed line -> class integral.
All original edges preserved here, including original flip and
all-partners extension for equal-rank supplier and other consumers.
No global removal, no root retirement, no weakening of the required
prime error bound. Context key: compact pin, standard pair only, fixed
field/weights, zero complement, canonical reindex, exact local reduction,
same y,z,mu. Generic prefix has the stated opposite orientation and
sign premise; do not apply to general nonzero-complement partners.

Actual execution: command -v lean and lake returned no paths in local
container. No local native engines, no scalar simulation repeated.
Fetched actual CI results: compact targeted_results 088cd2ec0e935ee1a282f10096949bcf671cc804
has six original named declarations, standard three axioms; module_1_build
exit 124; all_requested_checks_ok=false and full_RH_replay=false.
Old-pin strip-root b1c96f58 and prune-native 7da35494 returncode 0;
not compact evidence. Orchestrator summary d37f1d69 run 45977324146
is not a caller replay. New code PREPARED only. Axiom and graph scan
for this exact new declaration still needed. Use shared runner rather
than parallel build or protected workflow edits.

RESUME HERE: integration/editor and native runner: replay
RHCharacterBoxes76.standard_prefix directly on compact pin (imports
only needed suppliers; no RH theorem), then specialize to p=Unit,
U=stdSpace E Empty, W=X=V=stdSpace E (Fin 2), y=vacVector. Use
rh_scan/rh_prune and caller original-statement bridge; verify exact
finite datum using same pi/e/d in ExchangeTheorem and actual local
character law; integrate with RUN79's fixed-line and volume argument.
Do not repeat scalar normalizations. Still required: independently
audit equal-rank nonvanishing (its original exchanges remain necessary),
and C2 reciprocal heights/crude-row completion. RH OPEN.
-/

open Matrix MeasureTheory Fintype Std Weil ExistsContDiffBumpBase

namespace RHCharacterBoxes76

/-- Extract only the standard-pair prefix of exchange_of_partners,
using the desired small-side real datum directly. -/
lemma standard_prefix {E} [Field E] [CMType E] [WeilData E]
    {n m r p b} [Fintype n] [Fintype m] [Fintype r] [Fintype p] [Fintype b]
    {s s' t u} {W : Space E n s} {X : Space E m s'} (U : Space E b u)
    μ [Nonempty p] (A : (hypSum Unit X).Splitting W p) [IsBaseAdapted A]
    (V : Space E r t) (σ : b ⊕ r ≃ n) {z y}
    (r₁ : IsRapidDatum z) (hy : IsRapidDatum y)
    (hs : negCount u + (1 + negCount s') = card p + negCount t)
    (hn : 2 ∣ card n) :
    ∃ v, StdExchange W V U μ σ v y
      (equalRankThetaRatio (hypSum Unit X) · z) := by
  obtain ⟨_, w, a, e, -⟩ := exists_rapid_with_realSlice A.symm _ _
    (u_smooth _) hy (u_compact_support _) u_nonneg 0 ((u_support _).ge (by simp))
  obtain ⟨⟨x, u₀, rfl, H⟩, _, k⟩ := exists_stdExchange_top (removePlanes ..)
    (removePlanes _ X) U (.symm (.sumAssoc ..)) (by grind [A.card_eq]) μ a r₁, id hn
  refine ⟨_, ?_⟩
  exact e ▸ slice_zero_comp _ _ (removePlanes ..).symm A u₀ ▸
    (exists_stdExchange_removing_planes _ _ _ μ 0 0 V σ _
      (by simp <;> omega) hn).choose_spec.1 _ _ H

/-- Cutoff bridge for the determinant of an integral matrix. The actual
modulus reduction supplies hreflect and hagree as described above. -/
lemma det_cutoff {F R : Type} [SemilocalField F] [CommRing R]
    (π : SemilocalField.O →+* R) (χ : MulChar F ℂ) (η : MulChar R ℂ)
    (hreflect : ∀ u, IsUnit (π u) → IsUnit u)
    (hagree : ∀ u : SemilocalField.O, IsUnit u → (χ (u : F))⁻¹ = η (π u))
    (u : SemilocalField.O) :
    invOnUnits χ (u : F) = η (π u) := by
  classical
  by_cases hu : IsUnit u
  · have h : IsIntegralUnit (u : F) := isIntegralUnit_iff_isUnit.2 hu
    rw [invOnUnits, if_pos h]
    exact hagree u hu
  · have h : ¬ IsIntegralUnit (u : F) := fun a => hu (isIntegralUnit_iff_isUnit.1 a)
    rw [invOnUnits, if_neg h, η.map_nonunit (fun a => hu (hreflect u a))]

end RHCharacterBoxes76

#check RHCharacterBoxes76.standard_prefix
#check realMap_flipCoords_polyVector
#check polyVector_one
#check exists_stdExchange_removing_planes
#check isUnit_iff_residueAt_ne_zero
#print axioms RHCharacterBoxes76.standard_prefix
#print axioms RHCharacterBoxes76.det_cutoff
