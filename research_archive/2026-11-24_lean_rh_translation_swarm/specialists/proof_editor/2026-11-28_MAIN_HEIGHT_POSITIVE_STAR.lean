import New.Endgame.LongForms
import Lean

/-!
# Editor — native main height is nonnegative: remove the crude height budget

28 November 2026. HUMAN DERIVATION / SOURCE-MATCHED, native candidate PREPARED.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64,579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION, registry and latest peer source read.
Head inspected 1ee12799532d9ac29360af641b1a2057be5398d8 (deterministic
window transport). Previous editor 1c21daa8 removes crude remainder but
retains abs_mainHeight <= b² x^99. This run proves the actual SIGN, rather
than another conditional prime endpoint or another scalar rearrangement.
Search for mainHeight_nonneg, dirCost_nonneg and commit "mainHeight
nonnegative" returned no matching prior supplier. Search is not exhaustive.

## Exact native proof, no RH or asymptotic PNT required

Fix one admissible D and a place sigma. Write B=log b, U=log x1,
y=nominalWeight(sigma), j=w_0(sigma), a=D.a. We have 0<=y<=a,
j>=y, 0<U, 1<=x1 and 6 log U<=log B. Every shifted nominal weight
is >=a/x1. Therefore the summand of primeSum(y,sigma) is ZERO when
nu>x1, since y/nu<=a/x1. This is already used in the native
primeSum_eq_sum_localAsk, but was not used in the crude Main height bound.

The actual lambdaClass definition and vonMangoldt_le_log imply
0<=lambda(nu)<=2 log nu. This is stronger than the crude native <=2 nu.
For 1<=nu<=floor(x1), positive part <= y/nu and log nu<=U.
The elementary harmonic_floor_le_one_add_log lemma (already used
in the actual sum_allowedLoss_mul_log_le) gives
  primeSum(y,sigma)
    <= 2 y U sum_{1<=nu<=floor(x1)} 1/nu
    <= 2 y U (1+U)
    <= y B.
The final scale comparison is in the original HasLogBound calculus:
upper exponent of 2 U (1+U) is <= 2 log U+3 when U>=1;
lower exponent of B is log B>=6 log U. Native c>=64 and scale
clauses give ample strict slack. Equivalently U>=2 and U^6>=
2U(1+U); no number-theoretic estimate beyond the elementary harmonic
bound and the pointwise Mangoldt bound.

The actual native HasLogUpper Omega 0 (IndexTypes) gives 0<Omega<=1,
and gProd>=exp(20 B)=b^20 (Magnitudes). In particular
  log(gProd/Omega)>=B.
The factorial of the nonnegative integer j is >=1. Thus
  jetSize(j)=log(j!)-j log(Omega/gProd) >= j B >= y B.
Subtract the two bounds at EACH SAME place. Sum over all sigma:
  dirCost >= 0, hence mainHeight H=m*k*dirCost >=0.
This is a human proof of a previously unused native supplier, not
an assumption on the sign of H. It neither assumes the signed
remainder positive nor changes the actual data. In particular the
cutoff argument is valid for nominal weights, NOT arbitrary y>a.

## Actual star consequence
Use exactly the A/B family and C witnesses already in LongForms.
Let d=rowDim>0, n<=d, n>=d/2 from the native rank guard,
L=B*budget, S=m*remainder, I=5 log(1+b²)*budget, delta<=d I.
The native two-sided volume bound yields
  d(H-3L)<=n(H-S+L)+2delta.
Cancel before taking any norm:
  n S <= -(d-n)H+(3d+n)L+2delta
      <= d(4L+2I).
Now n>=d/2 yields S<=8L+4I<=B²*budget by the same native
logarithmic scale calculus. There is NO x^99 missing-dimension
term, no abs main height bound, and no abs remainder bound.
The exact C proof still requires its original near-full-rank
hypothesis. Do not replace B by half rank globally: a relaxed-rank C
would still need its actual completion cost. The present improvement
removes the crude height dependency from this actual Main caller;
primeSum remains in the genuine sign proof, A/C and the endpoint.
Neither A/B/C nor the selected arithmetic count criterion is discharged
independently by this proof. No new endpoint reformulation.

## Source evidence
- New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65 star_inequality.
- New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05,
  exists_family_covolumeSq_le, integral_forms_long.
- New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a,
  mainHeight, abs_mainHeight_add_remainder_le.
- New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834,
  nominalWeight, w, primeSum, jetSize, dirCost, scale.
- New/Data/Weights.lean 8749d68da003347685ca36817b32cafda51a3a6a,
  nominalWeight_mem_Icc, nominalWeight_le_w_sub, nominalWeight_nonneg.
- New/Data/Magnitudes.lean 306fe7e22378322422d11b1f8415fcdac75ffd6e,
  HasLogBound, gProd and logX1 instances.
- New/Seesaw/IndexTypes.lean 10e0416c5d653fedde38fcd6bf895a2127a3e1a0,
  native upper bound for bigOmega and rootDisc.
- New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473,
  native cutoff proof and harmonic bound.
- New/Endgame/PrimeError.lean 63eb3d79d95ad815878e623b96f237240058c8e2,
  lambdaClass and proof of lambdaClass_nonneg_and_abs_le; same
  simplification, with vonMangoldt_le_log rather than log_le_self.
- New/Data/Different.lean 44f64349db3642e89b752cc92979999edac5c185,
  definition bigOmega (not needed to reconstruct the existing bound).

## Verification boundary
Read the actual source above. Local command -v lean/lake returned no
executable. RUN99 count budget receipt and editor polar mean status on
cathedral-research-state both returned 404 at inspection; no result
inferred. No new native rh_scan/prune/reduce/auto/frontier, CI PASS, graph,
axiom or root retirement. The proof below is executable candidate source,
not a compiler receipt. No synthetic prime experiment used. Negative
controls at the mathematical level: if y>a the cutoff need not hold;
if shifted weights have no lower bound the support may extend to a;
if H<0, dropping -(d-n)H is invalid. All those guards are discharged
or retained above. Original graphs and prior height-only variant
remain archived. No import of New.Main.

RESUME HERE: compile THIS module as EditorMainHeightPositive in the
existing authenticated compact LongForms workspace, requiring the
complete original star type, standard axiom reports, and sign/actual
supplier guards. Inspect the first native diagnostic (especially
harmonic cast or floor coercions) rather than starting a duplicate
cold build. Export constructor-inclusive old/new graphs to distinguish
absence of the crude supplier in this caller from global reachability.
On acceptance select this sign supplier in the already prepared
minimal signed common A/B/C star; do not reopen the selected endpoint.
HANDOFF TO integration / kernel / audit. RH OPEN.
-/

set_option debug.skipKernelTC false
set_option Elab.async false
set_option maxHeartbeats 0

open Nat ArithmeticFunction Finset NeZero NumberField Real Space Subgroup
open vonMangoldt

lemma Data.editor_primeSum_harmonic_le {P} (D : Data P) (σ : D.Φ)
    {y : ℝ} (hy0 : 0 ≤ y) (hy : y ≤ D.a) :
    D.primeSum y σ ≤ y * D.logB := by
  have hx0 : 0 < D.x₁ := HasLogBound.pos D
  have hx1 : 1 ≤ D.x₁ := D.le_of_hasLogBound
  have hU : 0 ≤ D.logX₁ := (HasLogBound.pos D).le
  have hcut : ⌊D.x₁⌋₊ ≤ D.a := by
    exact Nat.floor_le_of_le (D.le_of_hasLogBound : D.x₁ ≤ D.a)
  have hs : Icc 1 ⌊D.x₁⌋₊ ⊆ Icc 1 D.a :=
    fun k hk ↦ mem_Icc.mpr ⟨(mem_Icc.mp hk).1,(mem_Icc.mp hk).2.trans hcut⟩
  have hrestrict : D.primeSum y σ = ∑ ν ∈ Icc 1 ⌊D.x₁⌋₊,
      lambdaClass P.d 1 ν *
        (y / ν - D.nominalWeight (D.placeOfInt (-ν) * σ))⁺ := by
    rw [Data.primeSum]
    symm
    apply Finset.sum_subset hs
    intro ν hv hnot
    have hv1 := (mem_Icc.mp hv).1
    have hvx : D.x₁ < (ν : ℝ) := lt_of_not_ge fun h ↦
      hnot (mem_Icc.mpr ⟨hv1,(Nat.le_floor_iff hx0.le).2 h⟩)
    have hdiv : y / ν ≤ D.a / D.x₁ := calc
      _ ≤ y / D.x₁ := div_le_div_of_nonneg_left hy0 hx0 hvx.le
      _ ≤ _ := div_le_div_of_nonneg_right hy hx0.le
    have hz : y / ν - D.nominalWeight (D.placeOfInt (-ν) * σ) ≤ 0 :=
      sub_nonpos.mpr (hdiv.trans (D.nominalWeight_mem_Icc _).1)
    rw [posPart_of_nonpos hz,mul_zero]
  have hλ (ν : ℕ) : lambdaClass P.d 1 ν ≤ 2 * Real.log ν := by
    simp [lambdaClass, chiK, Set.indicator, quadraticCharFun, sub_ite]
    grind [vonMangoldt_nonneg, vonMangoldt_le_log]
  have hh : ∑ ν ∈ Icc 1 ⌊D.x₁⌋₊, (ν : ℝ)⁻¹ ≤ 1 + D.logX₁ := by
    simpa [harmonic_eq_sum_Icc] using harmonic_floor_le_one_add_log D.x₁ hx1
  have hscale : 2 * D.logX₁ * (1 + D.logX₁) ≤ D.logB :=
    D.le_of_hasLogBound
  calc
    D.primeSum y σ = _ := hrestrict
    _ ≤ ∑ ν ∈ Icc 1 ⌊D.x₁⌋₊, (2 * y * D.logX₁) * (ν : ℝ)⁻¹ := by
      apply Finset.sum_le_sum
      intro ν hv
      have hv0 : (0 : ℝ) < ν := by exact_mod_cast (mem_Icc.mp hv).1
      have hvx : (ν : ℝ) ≤ D.x₁ := (Nat.le_floor_iff hx0.le).1 (mem_Icc.mp hv).2
      have hl : Real.log (ν : ℝ) ≤ D.logX₁ := by
        simpa using Real.log_le_log hv0 hvx
      have hpos : (y / ν - D.nominalWeight (D.placeOfInt (-ν) * σ))⁺ ≤ y / ν := by
        rw [posPart_def]
        exact max_le (sub_le_self _ (D.nominalWeight_nonneg _)) (div_nonneg hy0 hv0.le)
      calc
        _ ≤ lambdaClass P.d 1 ν * (y / ν) :=
          mul_le_mul_of_nonneg_left hpos (lambdaClass_nonneg_and_abs_le P.d 1 ν).1
        _ ≤ (2 * D.logX₁) * (y / ν) :=
          mul_le_mul_of_nonneg_right ((hλ ν).trans (by linarith)) (div_nonneg hy0 hv0.le)
        _ = _ := by ring
    _ = (2 * y * D.logX₁) * ∑ ν ∈ Icc 1 ⌊D.x₁⌋₊, (ν : ℝ)⁻¹ := by rw [Finset.mul_sum]
    _ ≤ (2 * y * D.logX₁) * (1 + D.logX₁) :=
      mul_le_mul_of_nonneg_left hh (by positivity)
    _ = y * (2 * D.logX₁ * (1 + D.logX₁)) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hscale hy0

lemma Data.editor_mainHeight_nonneg {P} (D : Data P) : 0 ≤ D.mainHeight := by
  have hOmega : 0 < P.bigOmega D.s := HasLogBound.pos D
  have hg : (0 : ℝ) < D.gProd := HasLogBound.pos D
  have hB : 0 ≤ D.logB := (HasLogBound.pos D).le
  have hb : D.b ≤ (D.gProd : ℝ) / P.bigOmega D.s := D.le_of_hasLogBound
  have hlog : D.logB ≤ Real.log ((D.gProd : ℝ) / P.bigOmega D.s) :=
    (Real.le_log_iff_exp_le (div_pos hg hOmega)).2 hb
  have hnegative : Real.log (P.bigOmega D.s / (D.gProd : ℝ)) ≤ -D.logB := by
    rw [Real.log_div hg.ne' hOmega.ne'] at hlog
    rw [Real.log_div hOmega.ne' hg.ne']
    linarith
  have hcost : 0 ≤ D.dirCost := by
    unfold Data.dirCost
    apply Finset.sum_nonneg
    intro σ _
    have hy0 := D.nominalWeight_nonneg σ
    have hy : D.nominalWeight σ ≤ D.a := D.le_of_hasLogBound
    have hw := D.nominalWeight_le_w_sub 0 σ
    have hw' : D.nominalWeight σ ≤ D.w 0 σ := by
      linarith [show (0 : ℝ) ≤ D.h₂ by positivity]
    have hf : 0 ≤ Real.log (Nat.factorial (D.w 0 σ) : ℝ) :=
      Real.log_nonneg (by exact_mod_cast Nat.factorial_pos (D.w 0 σ))
    have hjet : D.nominalWeight σ * D.logB ≤ D.jetSize (D.w 0 σ) := by
      unfold Data.jetSize
      have h1 := mul_le_mul_of_nonneg_left hnegative (show (0 : ℝ) ≤ D.w 0 σ by positivity)
      have h2 := mul_le_mul_of_nonneg_right hw' hB
      linarith only [hf,h1,h2]
    exact sub_nonneg.mpr ((D.editor_primeSum_harmonic_le σ hy0 hy).trans hjet)
  unfold Data.mainHeight
  exact mul_nonneg (by positivity) hcost

open DirichletCharacter Filter Data Parameters ZMod Module

lemma editor_positive_height_star {P} {D : Data P} :
    D.m * D.remainder ≤ D.logB ^ 2 * D.budget :=
  D.exists_family_covolumeSq_le.elim fun n ⟨y,i,big,⟨δ,index,I⟩,short⟩ ↦ by
  have d0 : (0 : ℝ) < D.rowDim := mod_cast D.finrank_rows_ne_zero.pos
  set d := (D.rowDim : ℝ)
  set L := D.logB * D.budget
  have hn : (n : ℝ) ≤ d := mod_cast Fintype.card_fin n ▸ i.fintype_card_le_finrank
  have hb2 : 0 < D.b ^ 2 := HasLogBound.pos D
  have half : d/2 ≤ (n : ℝ) := by
    have q : 4 / D.b ^ 2 ≤ (1/2 : ℝ) := (div_le_iff₀ hb2).2 (by
      linarith [show (8 : ℝ) ≤ D.b ^ 2 from D.le_of_hasLogBound])
    linarith [mul_le_mul_of_nonneg_right q d0.le]
  have n0 : (0 : ℝ) < n := by linarith
  have hH := D.editor_mainHeight_nonneg
  have hgap := mul_nonneg (sub_nonneg.mpr hn) hH
  have L0 : 0 ≤ L := (HasLogBound.pos D).le
  have hnL := mul_le_mul_of_nonneg_right hn L0
  have hlong : d * (D.mainHeight - 3 * L) ≤
      (n : ℝ) * (D.mainHeight - D.m * D.remainder + L) + 2 * δ :=
    integral_forms_long i big I short
  have hbound : (n : ℝ) * (D.m * D.remainder) ≤
      d * (4 * L + 10 * log (1 + D.b ^ 2) * D.budget) := by
    nlinarith only [hlong,hgap,hnL,index]
  have hscale : 8 * L + 20 * log (1 + D.b ^ 2) * D.budget ≤
      D.logB ^ 2 * D.budget := D.le_of_hasLogBound
  have K0 : 0 ≤ D.logB ^ 2 * D.budget := (HasLogBound.pos D).le
  apply le_of_mul_le_mul_left _ n0
  calc (n : ℝ) * (D.m * D.remainder) ≤ _ := hbound
    _ ≤ d * (D.logB ^ 2 * D.budget / 2) :=
      mul_le_mul_of_nonneg_left (by linarith only [hscale]) d0.le
    _ = (d/2) * (D.logB ^ 2 * D.budget) := by ring
    _ ≤ (n : ℝ) * (D.logB ^ 2 * D.budget) := mul_le_mul_of_nonneg_right half K0

#print axioms Data.editor_primeSum_harmonic_le
#print axioms Data.editor_mainHeight_nonneg
#print axioms editor_positive_height_star

open Lean in
run_cmd do
  for (n, req) in #[
    (
      ``Data.editor_primeSum_harmonic_le,
      #[``harmonic_floor_le_one_add_log, ``Data.nominalWeight_mem_Icc]),
    (``Data.editor_mainHeight_nonneg, #[``Data.editor_primeSum_harmonic_le]),
    (``editor_positive_height_star,
      #[``Data.editor_mainHeight_nonneg, ``Data.integral_forms_long,
        ``Data.exists_family_covolumeSq_le, ``Data.finrank_rows_ne_zero])] do
    let axs ← collectAxioms n
    unless axs.all (fun a => #[``propext, ``Classical.choice, ``Quot.sound].contains a) do
      throwError "EDITOR_HEIGHT_SIGN unexpected axiom {n}: {axs}"
    let i ← getConstInfo n
    let some v := i.value? (allowOpaque := true) | throwError "missing proof {n}"
    unless req.all (fun k => v.getUsedConstants.contains k) do
      throwError "EDITOR_HEIGHT_SIGN missing direct supplier {n}"
    if v.getUsedConstants.contains ``Data.abs_mainHeight_add_remainder_le then
      throwError "EDITOR_HEIGHT_SIGN retained crude direct supplier {n}"
  logInfo "EDITOR_HEIGHT_SIGN_GUARDS_OK"
