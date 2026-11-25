import Formalism.SharpRestriction.GlobalSchurBounds.JointsL
import Formalism.SharpRestriction.GlobalSchurBounds.GlobalRankLatticeProofs.FamilyPartFiveExplicitHolds

/-!
RUN29 — one anchor determinant, rather than independent absolute bounds at every word
25 Nov 2026. Human source-matched conditional theorem; Lean PREPARED, not executed.
Pin leanprover-community/riemann-hypothesis 40e56bab026552e089d7afcfeff08d2defb9c005.
Upstream current observed 251c7b05dd869ceba1aa42c6001c00b4010f23f9
(10:33:41 UTC, batch 17). In original directory LogFactorialProductDifference
now c7733dc83f0e10f9bb4f49b2c9b3fbf694f79914; other three files below absent at
original paths in that directory. No equivalence asserted; retain pinned versions.

Read latest mission including pyramid/mandatory unified engine, protocol, queue,
expansion, AGENTS, continuity/state/log excerpts and prior RUN27/28. Peer
87f08381 CountV host-number, 604f95bc signed twist audit, ab1e07f7 theta series
bridge; no duplicate. Manuscript §2 retains same-host selected point.
Native previous CI status files retrieved: strip root 45577239749 returncode 0,
98.87s; prune 45576756833 returncode 0, 77.94s. They do NOT check this result.
Local shell command -v lean and lake found neither. No new numerical tests or PASS.

## Corrected frontier
RUN28 removes pointwise upper Count5 ONLY in its replacement ASK-Main proof.
JointsL actually has independent consumers muTu_of_countF, sizeTu_of_countF,
tuSize_of (direct h5c upper and lower); SlopesMFOfCountFam uses upper in
numsL_of_fam_thr and retains CountF in slopesMF_of_count_fam. Do not delete the
family upper globally. Instead one absolute determinant anchor plus relative
variation recovers BOTH original pointwise count sides, with a larger uniform
constant, preserving their shared consumers.

## Exact cancellation in actual determinant formula
In LogWeightMinusLogBBound.part_five_lower_at_scale, use the actual
identity_five_one_of_aux2b_of_aux2v (mass ratio and volume equality), with
F=f, K=k, M=m, X(u)=logXuD D u, V(u,rho)=vand(uColR D u rho).
The displayed identity there reads
 F K X(u) = Q + sum_rho log(dsig(rho)*facProd(r)/V(u,rho)),
where Q is the sum of the common volume, prime, L-value and local-index terms.
dsig and facProd also do not depend on u. Under the native positivity of
these factors and of V, cancel before estimating:
 F K [X(u)-X(u0)] = sum_rho [log V(u0,rho)-log V(u,rho)].
Thus only relative Vandermonde variation remains after one absolute anchor.
A bound |log V(u,rho)-log V(u0,rho)| <= c_v K log K for all rho implies
|X(u)-X(u0)| <= c_v log K by the triangle inequality and card(Tau)=F.
The pairwise version is already supplied by VandermondeVariationBound;
the anchor-relative form suffices for this consumer, with 2*c_v for any
other consumer requiring all pairs, by triangle inequality. No claim that
the native variation supplier is dispensable or that one fixed place suffices.

## Actual lower/upper supplier and propagation
Native part_five_lower_eventually gives X(u0)>=R-11L (lowS), and
logXuD_upper_bound_eventually gives X(u0)<=(15+3CY)mL. Here
 R=sum_j (1/f) sum_rho log(w_jrho*v/pi)+m*sum_i log(g_i).
Both are conditional on the *same* D, sc, DataA, MassRatio2, VolumeEqMass2,
SigmaDegreeTwoSidedBoundOfGap and PartFourSectionBData. The native family
part_five_explicit_eventually composes these with variation. This identifies
the actual stronger supplier of RUN28's lower count, not a new conjecture
about the determinant. We have NOT independently closed those inputs.
RowsA gives log(2k)<=L, hence log k<=L; m>=1, k>0, L>=0.
Choose c>=max(11,15+3CY,0), P=L+m^2 L/k. Then P>=L and mL>=L.
lowB(c)=R-cP, and the native anchor bounds imply
 lowB(c)<=X(u0)<=c*mL.
Consequently, for every actual word u in the same selected host,
 R-(c+c_v)P <= X(u) <= (c+c_v)mL.
One anchor plus relative spread implies the entire absolute Conclusion5
at enlarged constant c+c_v (provided every admissible DataB choice has an
anchor and the uniform bounds). This is a strict weakening of the absolute
pointwise premises; it does not assert those new premises are free.
The anchor may depend on D,sc,Delta,w; c,c_v must be uniform in the family.
No change in family, window or epsilon quantifiers.

The actual T window gives log T(u)=X(u)-2 log Gamma/(fk)+r_u, where
0<=r_u<=log(1+1/(fk))<=1 and 0<=log Gamma/(fk)<=1 by logGam_le.
So log T(u)>=lowB(c+c_v)-2 and log T(u)<=(c+c_v)mL+1.
If L>=1, m>=1 these imply both Count_at sides with c+c_v+2
(and original La>=L). Pairwise spread <=2*c_v log k+1 using common Gamma;
use constant max(c+c_v+2,2*c_v+1) when log k>=1.
The first mass-error conjunct of TorusPairsWithVariant is separate and
must be retained, as must the independent all-place and all-family data.
No unsupported reduction of TuSize's lower clause to a mean. Instead this
anchor route allows its original pointwise lower proof to remain valid.

## Graph and audit
Original (source-visible): FamilyPartFiveExplicitHolds.part_five_explicit_eventually
 -> part_five_lower_eventually, logXuD_upper_bound_eventually, vandermonde_variation_holds
 -> part_five_explicit_of_propositions -> corollary_five_four_of_explicit
 -> count_at_of -> CountF -> muTu_of_countF, sizeTu_of_countF, SlopesMF,
 plus tuSize_of uses h5c directly. The Count5 branch feeds each_unit_bound_statement,
 ch_top, core_gm. Full root path and other leaves retained as RUN27/28.
Candidate: one absolute logXuD anchor per admissible data + anchored relative
variation -> Conclusion5 via below bridge -> original pointwise T-window
and Count_at/TuSize consumers, preserving independent mass-error conditions.
No global deletion/typed edge claim. Prior original graphs and axiom evidence
unchanged. Context cache key=(pin,D,sc,Delta,w,anchor,c,c_v,actual word fibre).
Backtrack to original full bounds if another consumer demands a different
constant or first mass-error conjunct. This shortens the mathematical
supplier, not necessarily Lean compilation time or final proof length.

Pinned sources under Formalism/SharpRestriction/GlobalSchurBounds:
 JointsL 057913eaf7d7d88fda208e16cd84e910ebdd4227
 StandardLattice cb758a6c5f78e610b8f946d4b733d07902b15f5d
 GlobalRankLatticeProofs/LogWeightMinusLogBBound 8d9b1ee9cc0e41975f2b5339b1ec183dd35bb626
 GlobalRankLatticeProofs/LogFactorialProductDifference e988f8ce6dc77be5b01c8135c619ec5935b6b15f
 GlobalRankLatticeProofs/LogVandermondeVariationGeneric 88add153513f5cc61075fd89b8a06ed86fe2adaa
 GlobalRankLatticeProofs/FamilyPartFiveExplicitHolds 3b9aaefa0ef116caa1448e7ac9782475e7cd1bcc
 GlobalRankLatticeProofs/PartFiveExplicitOfPropositions 2b94505b7a3cedf501929bc5bfccc948fe21c776
 GlobalRankLatticeProofs/SlopesMFOfCountFam 8d08ad9ebf242b3ca9c16dadab716e5fda455a13
 GlobalRankLatticeProofs/FamilyPartFiveOfExplicitConstants ae8c04cc5602ad9dd22aae088c2c1bb0bf6d4872.
All retrieved by pinned blob or directory. No new kernel graph/axiom result.
No artificial host data or URT speed claim.

RESUME HERE: reconstruct identity_five_one_of_aux2b_of_aux2v in
LemmaFiveOneOfTheoremTwo (2b7d6755659146ca64a2aad8f1a426b6f196bd87)
and trace its actual mass/volume suppliers; use the anchor transfer to avoid
reproving absolute bounds across all words. Native replay of this file and
RUN28 is still pending. In built pinned environment import existing engines
and run rh_scan on StandardLattice.part_five_lower_at_scale and
GlobalTheoryTheory.count_at_of; rh_prune these with fresh names; use
rh_reduce/rh_auto/rh_auto_frontier on the actual Conclusion5 bridge with
anchor_to_conclusion5 as rule. Inspect axiom outputs and preserve open nodes.
HANDOFF TO integration, audit, kernel, editor and theta: retain the independent
upper consumer and use anchor bridge only after checking exact uniform constants.
RH remains OPEN; no claimed theorem imported.
-/

noncomputable section
namespace RHGeometry

open Formalism.BasicNotions Formalism.MainNotions
open Formalism.MainNotions.StandardLattice

theorem anchor_scalar_bounds (R c cv P M x0 x V : ℝ)
    (hcv : 0 ≤ cv) (hlo : R-c*P ≤ x0) (hhi : x0 ≤ c*M)
    (hspread : |x-x0| ≤ V) (hP : V ≤ cv*P) (hM : V ≤ cv*M) :
    R-(c+cv)*P ≤ x ∧ x ≤ (c+cv)*M := by
  obtain ⟨ha,hb⟩ := abs_le.mp hspread
  constructor <;> nlinarith only [hlo,hhi,ha,hb,hP,hM]

theorem anchor_pair_spread {W : Type} (X : W → ℝ) (u0 : W) (V : ℝ)
    (h : ∀ u, |X u-X u0| ≤ V) (u v : W) :
    |X u-X v| ≤ 2*V := by
  obtain ⟨hu1,hu2⟩ := abs_le.mp (h u)
  obtain ⟨hv1,hv2⟩ := abs_le.mp (h v)
  exact abs_le.mpr ⟨by linarith,by linarith⟩

-- Native definition, exact original conclusion with enlarged constant.
theorem anchor_to_conclusion5 (D : D7) (sc : Scale) (C0 c cv : ℝ)
    (hcv : 0 ≤ cv) (hL : 0 ≤ sc.L)
    (hm : (1 : ℝ) ≤ D.R.m) (hk : (0 : ℝ) < D.R.k)
    (hlog : Real.log D.R.k ≤ sc.L)
    (hanchor : ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ),
      DataB D sc C0 Δ w → ∃ u0 : D.what₂.Word,
        lowB D sc c w ≤ logXuD D u0 ∧
        logXuD D u0 ≤ c * D.R.m * sc.L ∧
        ∀ u, |logXuD D u - logXuD D u0| ≤ cv * Real.log D.R.k) :
    Conclusion5 D sc C0 (c+cv) := by
  intro Δ w hB u
  obtain ⟨u0,hlo,hhi,hspread⟩ := hanchor Δ w hB
  have hp : 0 ≤ (D.R.m : ℝ)^2 * sc.L / D.R.k :=
    div_nonneg (mul_nonneg (sq_nonneg _) hL) hk.le
  have hP : cv*Real.log D.R.k ≤ cv*(sc.L+(D.R.m : ℝ)^2*sc.L/D.R.k) :=
    mul_le_mul_of_nonneg_left (by linarith) hcv
  have hmL : sc.L ≤ (D.R.m : ℝ)*sc.L := by
    simpa using mul_le_mul_of_nonneg_right hm hL
  have hM : cv*Real.log D.R.k ≤ cv*((D.R.m : ℝ)*sc.L) :=
    mul_le_mul_of_nonneg_left (hlog.trans hmL) hcv
  unfold lowB at hlo ⊢
  have hs := abs_le.mp (hspread u)
  constructor <;> nlinarith only [hlo,hhi,hs.1,hs.2,hP,hM]

#print axioms anchor_scalar_bounds
#print axioms anchor_pair_spread
#print axioms anchor_to_conclusion5

end RHGeometry
