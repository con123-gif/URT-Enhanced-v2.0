import New.RealPlace.LocalTheorem
import New.Filling.StandardLevel
import Mathlib.Tactic

/-!
# RUN84 — division-free integral frame and exact selfNorm caller
27 November 2026. HUMAN SOURCE-MATCHED / PREPARED; not Lean replayed.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
24b10d71aff1d6d8075e7629a1710c1b0cc7a969, c40f1debc6872fb9e1f080a90c39d94e0b1caffe.
RUN83 6f6dac944d7184ffcd0efcbf87c2964da2218846; RUN82 825fdbd3a430c06a1253bc29d98ffdaf5e49af2d.
Read protocols and AGENTS, current branch peer commits including
0279853292510b1962819fddc0a7837b22374016 (empty fixing-set B3) and
6246313ab32691e171ccef60168fc734f8e00d74 (prime chord replay).
No overlapping change to those callers. Current ledger B3 remains open.

## 1. Actual integral-frame supplier: proof without division or rank
FrameAction.lean cd3f13d59a5f2351c2fa22267765c723bd3b6001 lines 44–88,
ValuationPair.lean 46f7d3a3fc67d432aa9c6a52997563aff69f4f95 line 382.
The exact primitive IsValuationPair gives for a,b in A an idempotent
e in R and a=d*p,b=d*q with p,q in R, d=(1-e)a+e*b. Do NOT divide by d:
A is a commutative ring, not necessarily a domain. Define

    J = [[1-e,-e],[e,1-e]],   r=(1-e)q-e*p,
    S = [[1,-r],[0,1]],       (a,b) J S = (d,0).

The determinants of J and S are both 1, using e^2=e. Their inverses
are [[1-e,e],[-e,1-e]] and [[1,r],[0,1]], with all entries in R.
No cancellation of a zero divisor or nonzero pivot assumption. This
gives a short independent proof of the unweighted clearing consequence
of the native Hermite argument. Enumerate rows of C (k rows, D columns)
and give each row its designated distinct pivot column via injection i.
At each row apply the two-column operation to its pivot and each
remaining unprocessed column. Previously treated rows vanish on all
unprocessed columns, so their zeros are preserved. The current row
ends zero outside processed pivots and its pivot. Induction, including
empty row/column sets, gives C V zero outside i(k), V and V^-1 integral.
No rank or determinant of C enters. Native hermite supplies stronger
triangular data to other callers; do not remove that theorem globally.

## 2. Actual StandardLevel chart
StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4 lines
148–188; LevelGauge.lean 05b4a710e4192b2f3d289a8e52161a6d12a2866e
lines 72,81,296–301. Let n=rho+1, D=card iota, F has m+1 pairs;
s=D-(3n+1+(m+1)), so d=s+m+5=D-3rho. The native dimension lower
bound ensures nontruncation. C consists of the v rows and exactly
two rho-row blocks from N=(y0*x^-1)O and (u^-1-1)N. Use the SAME
sigma : SplitIndex rho (Fin rho) + Fin d ~= iota. The injection
selects the 3rho designated pivot columns; Y=V restricted to
sigma(inr j). Then CY=0. Its integral left inverse is the matching
rows of V^-1, so Y is a primitive frame, not merely a kernel basis
over A. The full V is integral unimodular, hence also gives the
unit-modulus transformation required by the content integral.
The source uses the same Y and V in both halves of Gauge.com and in
lintegral_contentIndex_pow_le (lines 177–182).

For actual positions y=y0^-1*u*y0*k with u in besselU and k in
congruence group, native apply_inr_of_mem_besselU (inv_mem hu)
(170–174) and the other N-row zeros imply (u^-1-1)N Y=0.
This is not arbitrary unipotent fixedness. With O=orthonormalPart,
B=x^-1 OY, exact cancellation:

    (xy)^-1 OY = k^-1 y0^-1 u^-1 N Y = k^-1 B.

B is integral by the integral box and level data and integral Y.
k^-1 is integral and g^-1*(1-k^-1) is integral by congruence.
Thus B t and g^-1*(B t-k^-1 B t) are integral for every t in R^d.
These are exactly the native closePairs conditions. Since vY=0,
Yt belongs to the SAME W. The frame supplier follows without an
unproved field rank step. RUN83's direct and inverse content-set
arguments use this frame; retain measurable content strata, zeta
estimate, real common kernel and polar integral. Their native
replay remains outstanding.

## 3. Actual consumer
LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6 lines
120–175; WeightPlancherel.lean 65619443ca5867bf45af038448a16dc1262103fd
lines 62–65. Actual selfNorm consumes floorWeight exactly once
at lines 144–146, for the current induction floor l. Isolate the
sufficient premise hfloor for all l,g,y with native near condition.
All remaining measure, convolution, kernel, Parseval and Haar
assumptions/steps unchanged. The new caller is the original body
with exactly that call substituted. The bridge uses native floorWeight.
For RUN82, instantiate hfloor with
    fun l hl g y => Gamma.lintegral_floorWeight_le_directChart hcom hl g y
after compiling RUN82, hcom supplied by its directFloorChart_of_com.
This is a prepared source-level connection, not a joint replay.
The actual RUN82 module must be compiled separately by the runner.

Original graph: selfNorm -> floorWeight -> Gauge.com -> real
common kernel / finite valPair clearing and content; selfNorm ->
parseval (retained). Candidate graph: selfNorm_from_floor -> hfloor,
bridge -> native floorWeight or RUN82 direct chart. No removal of
inverse com globally. Preserve all original/reduced graphs and
axiom evidence. Cache by compact pin, place, SAME box/position,
v, sigma, depth, exact measures. Rejected: field rank-nullity over
product ring, division by d, rational basis lacking integral
inverse, arbitrary unipotent fixedness, global deletion of com half.

## Verification
Local lean/lake/elan check found no installation. Native rh_scan,
rh_prune/rh_reduce/rh_auto/rh_auto_frontier not executed.
Actual SymPy: 7 matrix identities verified modulo e^2-e (two J
inverse checks, two JS inverse checks, pivot and residual formulas
and direct row elimination). First assertion compared reduced
expression to unreduced RHS; corrected by reducing their difference.
Connector source SHA guard, exact 56-line caller slice and single
substitution guard executed. Below two scalar lemmas, one caller
and one bridge PREPARED, NOT compiled. Old-pin status JSONs re-read:
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 both pass for 45577239749
and 45576756833, not compact B3. No new kernel PASS.
No URT claim, no RH root import, no protected workflow edits.
Root B3, A/C/star remain open.

RESUME HERE: submit RUN82 direct-chart and RUN84 exact selfNorm
caller in one native replay module, instantiate hfloor with actual
RUN82 replacement, compare complete type to Gauge.lintegral_selfNorm_le,
and check constructor-inclusive reachability and axioms. Preserve
native fallback and failed replay. Then audit the quantitative
chart suppliers at their concrete original declarations.
-/

namespace RHRun84

lemma pair_clear {A : Type*} [CommRing A] (a b d e p q : A)
    (hd : d = (1-e)*a+e*b) (ha : a=d*p) (hb : b=d*q) :
    (1-e)*a+e*b=d ∧
    a*(-e-(1-e)*((1-e)*q-e*p))+
      b*((1-e)-e*((1-e)*q-e*p))=0 := by
  constructor
  · exact hd.symm
  · calc
      _ = (-e*a+(1-e)*b)-((1-e)*q-e*p)*((1-e)*a+e*b) := by ring
      _ = (-e*a+(1-e)*b)-((1-e)*q-e*p)*d := by rw [← hd]
      _ = 0 := by rw [ha,hb]; ring

lemma pair_det {A : Type*} [CommRing A] (e r : A) (he : e*e=e) :
    (1-e)*((1-e)-e*r)-e*(-e-(1-e)*r)=1 := by
  linear_combination 2*he

end RHRun84

noncomputable section


open Matrix MeasureTheory Measure ENNReal Fintype ComplexConjugate InnerProductSpace Level Finset
  Function RCLike Place
attribute [-simp] Subtype.forall Subtype.exists inv_mul_cancel₀
variable {A} [CommRing A] [StarRing A] [TopologicalSpace A] [MeasureSpace A] [P : Place A] {ι}
  [Fintype ι] {m} {𝔰 : Shape} (j : ℕ) {T : 𝔰.Form A} [IsHermUnit T.splitGram] {F :
  Level ι T m} (p q : ℕ → Aˣ)
  {ξ : Aˣ} {I : Type} [Fintype I] (W W' : T.G → EuclideanSpace ℂ I) (x : T.G) (Γ Γ' : Gauge F)

attribute [local simp] mul_assoc div_eq_mul_inv formIntegrand formIntegrandOne
  Fin.prod_univ_castSucc floorModulus floorForm lintegral_prod lintegral_mconv_symm
  ENNReal.inv_mul_cancel_left ENNReal.mul_inv_cancel prod_range coe_weylRatio weylRatio_inv
variable {j p q W W' x}

lemma Gauge.lintegral_selfNorm_le_from_floor [F.groupMeasure.IsHaarMeasure] {k d c} (hfloor : ∀ (l : ℕ), l ≤ 𝔰.ϱ → ∀ (g y : T.G), F.IsNear l g → ∫⁻ ν,
    Γ.positionsOfSize.indicator (F.floorWeight l g) (g⁻¹ * (ν * y))
    ∂ascConv heisenbergMeasure l ≤ ∏ a ∈ .range l, Γ.floorConst a) (hK :
  F.IsPairingKernel j k d) (hj : j ≤ 𝔰.ϱ) (e : (∏ l ∈
  .range 𝔰.ϱ, Γ.floorConst l) * ∫⁻ g, ∫⁻ y, ‖k g y‖ₑ ^ 2 ∂F.upperMeasure 0 ∂F.upperMeasure 0 =
  c) : ∫⁻ x in Γ.positionsOfSize, F.selfNorm j k x ∂F.groupMeasure ≤ 𝔰.n * c := by
  obtain ⟨hB, I⟩ := Γ.measurableSet_positionsOfSize, fun {l n} ↦ by simpa using @hK.law l 1 n
  let W l g y := ∫⁻ ν, Γ.positionsOfSize.indicator 1 (g⁻¹ * (ν * y)) ∂ascConv heisenbergMeasure l
  let Φ l g y := ∞ * W l g y ⊓ ‖F.upperPairing (l + 1) k g y‖ₑ ^ 2
  have V {l g y σ t} h : W l g y = W l (σ * g) (t * y) :=
    (lintegral_eq_of_dirac_mconv_eq (s := σ) (t := t) h).trans (by simp [W])
  apply le_add_self.trans (Nat.decreasingInduction' (P := fun l ↦ ∃ ρ, SFinite ρ ∧ l * c + ∫⁻ x in
    Γ.positionsOfSize, F.selfNorm l k x ∂F.groupMeasure ≤ 𝔰.n * c ∧ F.groupMeasure = ascConv
    heisenbergMeasure l ∗ₘ ρ ∧ (∏ a ∈ range l, if a < 𝔰.ϱ then Γ.floorConst a else 1) * ∫⁻ g, ∫⁻ y,
    Φ l g y ∂ρ ∂descConv F.floorMeasure 0 (l + 1) ≤ c) (fun l h _ ⟨ρ, _, z, e, i⟩ ↦ (fun a ↦ ⟨_,
    inferInstance, .trans ?_ z, a⟩) ⟨e ▸ mconv_assoc .., .trans ?_ i⟩) hj.step ⟨F.upperMeasure 0,
    inferInstance, by simp [selfNorm, weightedSquareSum], by simp [stackMeasure_zero_eq, ascConv],
    e ▸ by gcongr ?_ * ∫⁻ g, ∫⁻ y, ?_ ∂_ ∂_ <;> simp [Φ, upperPairing, descConv]⟩).choose_spec.2.1
  · simp [hK.selfNorm_eq_add_succ h.le_pred, weightedSquare, add_one_mul, add_assoc]
    grw [lintegral_add_left, ← add_le_add_left a.2, lintegral_lintegral_swap, ← lintegral_const_mul]
    gcongr with g
    grw [← lintegral_indicator hB, ← lintegral_mul_left_eq_self _ g⁻¹, a.1, lintegral_mconv_symm,
      ← lintegral_const_mul]
    any_goals fun_prop
    exact lintegral_mono fun y ↦ not_lt.1 fun n ↦ n.not_ge ((lintegral_le_of_ae_imp
      ae_ascConv_mem_unipotentBelow fun ν h ↦ by simp [I h, Set.indicator, ← ofReal_norm]).trans
      ((lintegral_mul_const _ (by fun_prop)).trans_le (mul_le_mul' ((hfloor l (by lia) g y ((exists_ne_zero_of_ae ae_ascConv_mem_unipotentBelow n.ne_bot).elim
      (by simp; grind [→ IsPairingKernel.isNear_of_upperPairing_ne_zero, IsNear]))).trans
      (by gcongr; grind)) (le_min ((top_mul fun z ↦ (exists_ne_zero_of_ae ((lintegral_eq_zero_iff
      (by fun_prop)).1 z) n.ne_bot).elim (by simp_all)).ge.trans' le_top) le_rfl))))
  grw [prod_range_succ, mul_assoc, descConv_succ (l + 1), lintegral_mconv_symm,
    ← lintegral_const_mul (ite ..)]
  gcongr with g
  grw [← lintegral_floorMeasure_congr rfl fun σ a ↦ lintegral_mul_left_eq_of_factor e
    ae_ascConv_mem_unipotentBelow (by grind [ascConv_heisenbergMeasure_invariant])
    (ascConv_heisenbergMeasure_dirac_comm _ a) _ fun s o y ↦ by simp [Φ,
    @V (l + 1) _ y 1 s (by simp [ascConv_heisenbergMeasure_invariant o]), I o, ← ofReal_norm],
    lintegral_lintegral_swap, ← lintegral_const_mul, lintegral_mconv_symm, lintegral_mono fun y ↦
    if z : W (l + 1) g y = 0 then ((lintegral_mono fun n ↦ inf_le_left).trans_eq (by simpa (disch :=
    with_unfolding_all fun_prop) [W, ascConv] using z)).trans zero_le else ?_]
  any_goals fun_prop
  simp +contextual only [Φ, ← V (ascConv_heisenbergMeasure_dirac_comm _ _), top_mul z]; split
  grw [Γ.parseval_heisenbergMeasure_of_box ⟨l, ‹_›⟩ F.g⁻¹ F.g 0 1 (hK.mono (by lia)) g y
    (fun s c ↦ by simp [hK.3 _ (floorGroup_anti ‹_› c.1), simpleRootSum_eq_zero_of_mem_besselH])
    (fun n a H ↦ ⟨And.intro a (by simp at H; simpa using And.imp (exists_ne_zero_of_ae
    ae_ascConv_mem_unipotentBelow) hK.isNear_of_upperPairing_ne_zero H), by simp⟩) (by
    rintro _ ⟨u, ⟨_, h₁, e₀⟩, _, o, k⟩
    obtain ⟨t, ht, ν, hν, rfl⟩ :=
      exists_floorGroup_mul_unipotentBelow (unitriGroup_anti l.le_succ o)
    exact ⟨t, ⟨(mul_mem_cancel_right (unipotentBelow_le_unitriGroup hν)).1 o, ht⟩, _, by grind,
      Γ.hasMatSize_box k, fun n ⟨hn, ⟨μ, hμ, e⟩, _⟩ ↦ ⟨_, conj_mem_unipotentBelow ht
      (mul_mem (mul_mem hν h₁) (conj_mem_unipotentBelow (mul_mem u (inv_mem
      hn)).1 (inv_mem (mul_mem hν hμ)))), (conj_mul_inv_close_to_one k e₀ e (by group) · _)⟩⟩)]
  simp; ring_nf; rfl
  grw [heisenbergMeasure_eq_dirac_one (by lia), ← hK.pivotModulus_sq_le (u := 1)
    (by simp [FloorMassLe, IsNear, measureH_spec, (by lia : l = 𝔰.ϱ)]),
    ← hK.enorm_upperPairing_le]; simp

lemma Gauge.lintegral_selfNorm_le_from_floor_bridge [F.groupMeasure.IsHaarMeasure] {k d c} (hK :
  F.IsPairingKernel j k d) (hj : j ≤ 𝔰.ϱ) (e : (∏ l ∈
  .range 𝔰.ϱ, Γ.floorConst l) * ∫⁻ g, ∫⁻ y, ‖k g y‖ₑ ^ 2 ∂F.upperMeasure 0 ∂F.upperMeasure 0 =
  c) : ∫⁻ x in Γ.positionsOfSize, F.selfNorm j k x ∂F.groupMeasure ≤ 𝔰.n * c :=
  Γ.lintegral_selfNorm_le_from_floor (fun l hl g y ↦ Γ.lintegral_floorWeight_le hl g y) hK hj e


#check IsValuationPair.hermite
#check IsValuationPair.exists_mul_clear_cols
#check IntegralPlace.IsStdLevel.gauge
#check Gauge.lintegral_floorWeight_le
#print axioms RHRun84.pair_clear
#print axioms RHRun84.pair_det
#print axioms Gauge.lintegral_selfNorm_le_from_floor
#print axioms Gauge.lintegral_selfNorm_le_from_floor_bridge
#print axioms Gauge.lintegral_selfNorm_le

end
