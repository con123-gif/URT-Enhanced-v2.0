import New.Exchange.EqualRankValue
import Mathlib.Tactic

/-!
# RUN80 — C2 standard-exchange prefix: repair the missing plane-count guard
27 November 2026. Independent caller audit: PARTIAL AGREE with character-box
RUN76 (9d3832217da12c73ccd35e2b582e57c7f7499d54), with a precise correction
to its generic sign premise. Rank-zero determinant caller RUN79 (fab4aba0)
survives. Corrected executable Lean candidate PREPARED, not replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live spine
67e542df1b5557b2e1314643931ef1355bbdc50d, ledger
073d86374ebc415e217a2732814dde7b0f3dfb9d read first. AGENTS, SWARM_PROTOCOL,
HANDOFF_QUEUE and research protocol/state/log openings read. Latest peer
2cb53847 (B2), 78cb4221 (shared B2 replay), fd66e09e (D1/E1),
9d383221 (C2), f8c4e65a (B2), 31f5d332 (C1), f93cf29c (A2)
inspected; no rederivation of their distinct claims.

## 1. Actual caller and exact correction
New/Exchange/RealPair.lean f2a4ed6190f46b592334117dda62a72b3e6d4704,
file header and exists_stdExchange_top: D : X.Splitting W₁ b,
V' : Space E b t', so the upper splitting has |b| planes,
not one plane independent of the size of V'. Its top target is V'.sum W₁.
New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d:
exists_stdExchange_removing_planes has EXACT condition
  negCount t' = card p + negCount t
for the complete splitting, and exchange_of_partners uses the
composition of the top splitting and A. Its original flipSpace U is
important for nonzero complements.
New/Exchange/LowRankIdentity.lean efd396aa9b0681ecba5a2364546a295094866a2c:
StdExchange quantifies all integral standard pairs, with one common C.
New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40:
stdClassSum_det_modKernel_eq is the actual determinant-period consumer.

Let Y=hypSum Unit X, p=number of planes of A:Y→W, b=rank U,
q=negCount X, u=negCount U, t=negCount V. The unflipped top
target U.sum Y has negative count u+1+q. Its descent to V removes
p+b planes: p from A and b from D. Indeed rank difference is
  (b+rank Y)-rank V = b+(rank W+2p)-rank V = 2(b+p),
using rank W=rank V+b from sigma. Consequently the exact guard is

    u + 1 + q = b + p + t.                  (S)

Peer RUN76's generic standard_prefix omitted b on the right. That
guard is sufficient for the actual b=0 determinant caller, but cannot
justify the general descent. Given the peer guard, (S) holds iff b=0.
For a rank-compatible count counterexample set rank W=rank X=2,
p=1, rank Y=4, b=rank V=1 and q=u=t=0. The peer equation is 1=1,
but the top target has 1 negative sign and descent by 2 planes requires
2. This refutes the claimed implication of sign guards, NOT necessarily
the existence theorem by every other possible proof.

For the original flipped route, the negative count of flipSpace U is
b-u, so (S) in that orientation reads (b-u)+1+q=b+p+t, precisely
1+q=p+t+u, the native exchange_of_partners hypothesis. This cross-check
recovers the source sign premise without an extra assumption.

For the actual critical determinant case U=stdSpace Empty,
X=W=V=stdSpace Fin 2, p=Unit, q=u=t=b=0, so (S) is 1=1.
Therefore use the direct unflipped prefix with the corrected generic
guard, or specialize immediately to b=0. No change to the finite cutoff,
rank-zero Haar volume, or RUN79 common normalization. Peer RUN76
independently audited these, and the flip-vacuum via polyVector_one;
do not duplicate their calculations. Preserve original all-partner
exchange for every nonzero-complement caller.

## 2. Equal-rank audit and consequence for next step
In exists_equalRankThetaRatio_value the two nonzero-branch exchanges
have U=Z (rank zero) and U=J (rank 2k), respectively; V=J and V=Z.
With Q=P.comp A, p=1+q. J and Z are positive. The second unflipped
guard would be 1+q = 2k+1+q, impossible for k>0 (in the critical case
k=1). Thus we must NOT transfer the direct prefix into the second
equal-rank exchange. The original flip of J makes the guard correct.
The original pair-kernel descent/lift comparison and the squared
equal-rank identity F must remain. This is a specific rejected
extension of the otherwise valid rank-zero simplification.

The source fallback h₀ (all rapid equal-rank periods vanish) uses
stdExchange_of_periods at zero normalization, the sign alternative
and determinant-vector surjectivity of the actual descent. Choosing
the rank-zero large-side vacuum in the target of that map forces,
for any tame character, a nonzero empty-Hom integral equal to the
zero small-side datum. This is the contradiction in its final
(K c).choose_spec.2 _ .one simplification. It does not require dividing
by the vanishing ratio or assuming the exchange coefficient nonzero.
Do not substitute the rank-zero determinant caller for this fallback:
it still needs surjectivity, actual period factorization and the
native sign alternative. On an empty tame-character family the
uniform conclusion is vacuous and any nonzero common constant works.
This identifies the correct frontier for the next detailed equal-rank
audit, not a proof of those primitive inputs.

Original graph preserved: exchange_of_partners→flip/top/composite
descent/extension; equalRankThetaRatio_value→fallback and both
exchanges; Carrier→explicit_matching→exchange_theorem.
Reduced candidate graph: Carrier rank zero complement→corrected
standard_prefix→rapid lift/top/composite descent/zero slice, then
RUN79/RUN76 determinant datum and fixed line; no deletion of shared
nodes. Context key includes pin, complement rank, signs of U/V/X,
p+b, same adapted splittings and same finite data. No global pruning.

Verification: authenticated pinned file reads and independent
rank/sign derivation above. Local command -v lean and command -v lake
returned no paths; no native engine run and no new PASS. Actual
compact receipt 088cd2ec0e935ee1a282f10096949bcf671cc804 records six
original named axiom checks (standard three axioms), module_1_build
timeout 124, all_requested_checks_ok=false, full_RH_replay=false.
B2 shared replay status.json returned 404 at this read, not a failed
test and not evidence of success. No new parallel job. No repeated
scalar regressions or URT advantage claims. The two old-pin native
engine runs are separate from compact replay. All original axiom and
frontier evidence retained. No root obligation retired.

RESUME HERE: audit the actual zero-ratio fallback in
exists_equalRankThetaRatio_value at stdExchange_of_periods and
(detVectors k j).SurjOn, deriving its period factorization with
constant 0 and exact nonzero vacuum conclusion. Replay this corrected
prefix and the rank-zero caller bridge via the existing shared native
runner; do not use the uncorrected generic RUN76 statement. The
weighted prime bound and RH remain OPEN.
HANDOFF TO character boxes, proof editor, formal audit, native runner.
-/

open Matrix MeasureTheory Fintype Std Weil ExistsContDiffBumpBase

namespace RHIntegration80

/-- Corrected direct standard-pair prefix. The composite descent removes
card b + card p planes, not merely card p. Prepared, not elaborated. -/
lemma standard_prefix_corrected {E} [Field E] [CMType E] [WeilData E]
    {n m r p b} [Fintype n] [Fintype m] [Fintype r] [Fintype p] [Fintype b]
    {s s' t u} {W : Space E n s} {X : Space E m s'} (U : Space E b u)
    μ [Nonempty p] (A : (hypSum Unit X).Splitting W p) [IsBaseAdapted A]
    (V : Space E r t) (σ : b ⊕ r ≃ n) {z y}
    (r₁ : IsRapidDatum z) (hy : IsRapidDatum y)
    (hs : negCount u + (1 + negCount s') = card b + card p + negCount t)
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

/-- The precise guard difference, including the rank-zero special case. -/
lemma omitted_plane_count_iff (b p q u t : ℕ)
    (h : u + (1 + q) = p + t) :
    (u + (1 + q) = b + p + t) ↔ b = 0 := by omega

end RHIntegration80

#check RHIntegration80.standard_prefix_corrected
#check exists_stdExchange_top
#check exists_stdExchange_removing_planes
#print axioms RHIntegration80.standard_prefix_corrected
#print axioms RHIntegration80.omitted_plane_count_iff
