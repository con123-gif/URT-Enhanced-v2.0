import New.Endgame.LongForms

/-!
# AUDIT lane — compact RUN50 (26 Nov 2026)
Status: human source-matched proof of scalar weakening; Lean certificate PREPARED,
not compiled. No new kernel closure, no axiom result claimed.

Current mission blob 3731f12ed73e738313fd7f93a30759d9086141e9, migration commit
24da6755f91e9dfb7fac28f80bca36b255919247. Compact pin
lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. No import of New.Main
or Main, no old source overlay. Retrieved native modules:
* New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
* New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05
* New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
* New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e
* New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
* New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41
* New/Endgame/OneSidedCriterion.lean 93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3

Original source path (selected explicit value edges, NOT kernel graph):
Main -> New.zeta_zeros_on_line New.grh -> eventually_primeError_le_rpow ->
star_inequality -> {exists_family_covolumeSq_le, integral_forms_long,
abs_mainHeight_add_remainder_le, scale comparison}.
exists_family_covolumeSq_le obtains ONE n,y,i,big,delta,index,I,short from
short_forms and enough_forms; it chooses Y=image2 B t S. S spans ramified
columns, B=q*projectedPoincare, q!=0, so this is the same range sum used
by B, and index and all conjugate bounds hold for this same y.
integral_forms_long consumes i,big,I,short of this same family with V=n*h.
Internally its volume ratios must use one theta from exists_isFitFamily;
the inverse ratios multiply to 1 pointwise. Keep nonvanishing Z and product
formula. It is not valid to use an independently chosen volume from C.

Proposed reduced explicit path:
star_from_mainHeight -> same A+B family and same C application ->
star_scalar_weakened -> scale comparison.
Replace absolute mainHeight PLUS absolute remainder crude estimate by a
one-sided mainHeight estimate only; source-matched supplier proposed below.
All other native obligations unchanged. No global edge deletion until
actual caller and reverse reachability/axioms replay. No imported theorem
asserting RH or GRH.

Human proof: d>0, d/2 <= n <= d, H=mainHeight, R=m*remainder,
L=logB*budget, J=5 log(1+b^2)*budget, X=x^99, B=b^2 X.
C and A+B give d(H-3L)<=n(H-R+L)+2delta<=n(H-R+L)+2dJ.
Cancel H exactly BEFORE estimates:
    n(R-L) <= 3dL + (d-n)(-H) + 2dJ.
Using -H<=B and (d-n)B<=4dX gives n(R-L)<=d(3L+4X+2J).
As n>=d/2 and the latter parenthesis is nonnegative:
    R<=7L+8X+4J.
No absolute bound on R, no sign assumption on R or H.
Native scale slack absorbs constants in 7L+8X+20log(1+b^2)*budget
into logB^2*budget; proposed native comparison below. This weakens the
crude supplier, not A/B/C, fit twists or the prime estimate itself.
The original stronger crude estimate implies -H<=B, so a fallback
replacement has no new mathematical assumptions even if direct supplier
elaboration needs repair.

Independent audit: integer test script executed in JS (small exact integers,
all products far below 2^53), 12480 cases, 306 tight in coarse bound,
11304 cases satisfying weakened inputs but failing original -h<=B guard.
These are abstract scalar controls, not admissible Data simulations.
Reproduce:
let cases=0,tight=0,oldCrudeFails=0;
for(let d=1;d<=12;d++)for(let n=Math.ceil(d/2);n<=d;n++)
for(let H=-6;H<=6;H++)for(let L=0;L<=4;L++)for(let J=0;J<=3;J++){
 let B=Math.max(0,-H),X=Math.ceil((d-n)*B/(4*d));
 let Rnum=n*L+3*d*L+(d-n)*(-H)+2*d*J;
 if(n*(H+L)-Rnum+2*d*J!==d*(H-3*L))throw Error("equality");
 if((d-n)*B>4*d*X||Rnum>n*(7*L+8*X+4*J))throw Error("bound");
 if(Rnum===n*(7*L+8*X+4*J))tight++;
 if(Rnum-n*(H+L)>n*B)oldCrudeFails++;
 cases++;
}
console.log({cases,tight,oldCrudeFails});
Negative controls executed: d=10,n=1,H=0,L=1,B=X=J=0,R=31
violates conclusion without half-dimension; d=2,n=1,H=-1,L=B=X=J=0,R=1
violates conclusion without mainHeight bound. Split-witness control:
d=n=1,H=L=delta=0,R=1; V_A=-1 satisfies A+B, V_C=0 satisfies C,
yet R>0. No coupling of these two arbitrary witnesses is permitted.

Source comparison: older 40e56... principal G window and CountP work
remain separate; compact normalized weighted primeError, auxiliary twist
and second scale are not the old G. No old proof-term or axiom cache reused.
Local command -v lean/lake returned absent. Shared repository summary
2026-11-26 07:48:15 UTC run 45775351208 at c486b17 is orchestrator PASS,
not compact replay. No new rh_prune/rh_scan or rh_auto results; use compact
toolchain with shared kernel lane, not old 4.33.1 results as evidence.
No URT benchmark required for exact cancellation.

RESUME HERE: kernel lane compile this certificate with compact 4.35.0 pin
in existing shared native batch; first scalar lemma then direct crude
supplier and caller. If typeclass scale comparison fails, normalize the
new coefficients and inspect actual HasLogBound exponents. Re-export
original/reduced caller value/type/constructor graph and #print axioms;
only after proof of direct supplier and caller can the old crude edge
be removed locally. Do not delete it from other consumers.
HANDOFF TO: lane 9 kernel, lane 14 integration, lane 15 human editor.
-/

open Real Finset Module Data

namespace CompactAudit50

theorem star_scalar_weakened {d n H R L B X J : ℝ}
    (hd : 0 < d) (hn : d / 2 ≤ n) (hnd : n ≤ d)
    (hX : 0 ≤ X) (hL : 0 ≤ L) (hJ : 0 ≤ J)
    (hmiss : (d - n) * B ≤ 4 * d * X)
    (hH : -H ≤ B)
    (hAC : d * (H - 3 * L) ≤ n * (H - R + L) + 2 * d * J) :
    R ≤ 7 * L + 8 * X + 4 * J := by
  have hm := mul_le_mul_of_nonneg_left hH (sub_nonneg.mpr hnd)
  have he : n * (R - L) ≤ 3 * d * L + (d - n) * (-H) + 2 * d * J := by
    nlinarith only [hAC]
  have hb : n * (R - L) ≤ d * (3 * L + 4 * X + 2 * J) := by
    nlinarith only [he, hm, hmiss]
  have hp : 0 ≤ 3 * L + 4 * X + 2 * J := by positivity
  have hh := mul_le_mul_of_nonneg_right hn hp
  have hz : n * (R - (7 * L + 8 * X + 4 * J)) ≤ 0 := by
    nlinarith only [hb, hh]
  have hn0 : 0 < n := by linarith
  by_contra! h
  have hpos := mul_pos hn0 (sub_pos.mpr h)
  linarith only [hz, hpos]

-- Exact caller substitution; the weakened one-sided supplier is explicit.
theorem star_from_mainHeight {P : Parameters} (D : Data P)
    (hH : -D.mainHeight ≤ D.b ^ 2 * D.x ^ 99) :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget := by
  obtain ⟨n, y, i, big, ⟨δ, idx, I⟩, short⟩ := D.exists_family_covolumeSq_le
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  let d : ℝ := D.rowDim
  let L := D.logB * D.budget
  let J := 5 * log (1 + D.b ^ 2) * D.budget
  have hd : 0 < d := d0
  have hnd : (n : ℝ) ≤ d := by
    change (n : ℝ) ≤ D.rowDim
    exact_mod_cast (Fintype.card_fin n ▸ i.fintype_card_le_finrank)
  change (1 - 4 / D.b ^ 2) * d ≤ (n : ℝ) at big
  have hb8 : (8 : ℝ) ≤ D.b ^ 2 := D.le_of_hasLogBound
  have hfrac : 4 / D.b ^ 2 ≤ (1 : ℝ) / 2 := by
    apply (div_le_iff₀ (by positivity)).2
    linarith only [hb8]
  have hn : d / 2 ≤ (n : ℝ) := by
    have hh := mul_le_mul_of_nonneg_right hfrac hd.le
    nlinarith only [big, hh]
  have hmissing : d - (n : ℝ) ≤ 4 / D.b ^ 2 * d := by
    nlinarith only [big]
  have hmiss : (d - (n : ℝ)) * (D.b ^ 2 * D.x ^ 99) ≤ 4 * d * D.x ^ 99 :=
    (mul_le_mul_of_nonneg_right hmissing (by positivity)).trans_eq
      (by field_simp [exp_ne_zero] <;> ring)
  have hL : 0 ≤ L := (HasLogBound.pos D : 0 < D.logB * D.budget).le
  have hbudget : 0 ≤ D.budget := (HasLogBound.pos D : 0 < D.budget).le
  have hlog : 0 ≤ log (1 + D.b ^ 2) := log_nonneg (by nlinarith [sq_nonneg D.b])
  have hJ : 0 ≤ J := by dsimp [J]; positivity
  have hidx : δ ≤ d * J := by
    dsimp [d, J]
    nlinarith only [idx]
  have hAC : d * (D.mainHeight - 3 * L) ≤
      (n : ℝ) * (D.mainHeight - D.m * D.remainder + L) + 2 * d * J := by
    have hC := integral_forms_long i big I short
    change d * (D.mainHeight - 3 * L) ≤
      (n : ℝ) * (D.mainHeight - D.m * D.remainder + L) + 2 * δ at hC
    linarith only [hC, hidx]
  calc
    D.m * D.remainder ≤ 7 * L + 8 * D.x ^ 99 + 4 * J :=
      star_scalar_weakened hd hn hnd (by positivity) hL hJ hmiss hH hAC
    _ = 7 * (D.logB * D.budget) + 8 * D.x ^ 99 +
        20 * log (1 + D.b ^ 2) * D.budget := by dsimp [L, J]; ring
    _ ≤ _ := D.le_of_hasLogBound

-- Direct crude supplier: same primeSum upper instance as the pinned
-- native crude lemma, but it need not unfold remainder or mainAsk.
theorem mainHeight_oneSided {P : Parameters} (D : Data P) :
    -D.mainHeight ≤ D.b ^ 2 * D.x ^ 99 := by
  have := D.hasLogUpper_of_abs_le
    (by grind [c, sum_nonneg] : |chowlaSelbergConst P.d| ≤ P.c)
  have {σ y l} [h : D.HasLogUpper (D.a * (2 * y)) l] :
      D.HasLogUpper (D.primeSum y σ) l := ⟨h.1.trans' (by
    grw [primeSum, abs_sum_le_sum_abs, sum_le_card_nsmul _ _ |2 * y|] <;>
      simp [posPart, abs_of_nonneg]
    grw [(lambdaClass_nonneg_and_abs_le ..).2, ← nominalWeight_nonneg,
      le_abs_self y]
    simp_all [field])⟩
  have H : |D.mainHeight| ≤ D.b ^ 2 * D.x ^ 99 := by
    unfold Data.mainHeight Data.dirCost Data.jetSize
    exact D.le_of_hasLogBound
  exact (neg_le_abs _).trans H

theorem star_weakened {P : Parameters} (D : Data P) :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  star_from_mainHeight D (mainHeight_oneSided D)

end CompactAudit50

#print axioms CompactAudit50.star_scalar_weakened
#print axioms CompactAudit50.star_from_mainHeight
#print axioms CompactAudit50.star_weakened
