import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN43 — literature lane 9, 26 Nov 2026. SOURCE-MATCHED / PREPARED NOT COMPILED; RH OPEN.

A strict premise weakening of native CardRed (not merely a smaller Hurewicz
exponent): only the IMAGE p(ker h) must be annihilated by l^c, rather than
ker h itself. Moreover the auxiliary K need not be finite; only X and the
range of h must be finite. For Y=p(ker h), exact cardinality cancellation
|X|=|Y| |X/Y|, and the quotient map K/ker h -> X/Y is surjective.
Since K/ker h is isomorphic to range h, it is finite even if K is infinite.
Native cardKill bounds |Y| by |X/lX|^c. Thus the same native numerical bound
follows with the weaker hypotheses, without additional literature facts.
For c=0 the map p factors through range h and the generator term disappears.
Strict example: K=X⊕Z_l, p=h=first projection, X finite nonzero. The new
condition holds with c=0, while K is infinite and ker h contains Z_l.
Finite strict controls: K=Z/l^a × Z/l^b, p first projection, h reduction of
first projection mod l^d; old kernel exponent max(a-d,b), new a-d.
This permits an auxiliary comparison with an uncontrolled kernel that is
invisible to the cohomology map. It does NOT construct that comparison.
Prior RUN42 can supply the stronger interface by map_smul and map_zero;
new ProjectedBridge43 is strictly weaker abstractly. SmallMod43 remains
explicit and only used on l<=e. Native torsMain, numFin and original caller
retained. No new external conjecture or literature assumption. No claim
that actual K-theory comparison is now authenticated.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory engine);
AGENTS 8db0201d, SWARM, HANDOFF bbc46df7, EXPANSION consulted; peer
24e7f2d1 set-map grade restriction and latest 6e70b2a0 audit inspected.
Native CardRed.lean 687dc64db008616c2c378cf471f7d233db5ff9ec;
Reduction 1cfb92c81ec5c4ed77aac5a7cce457add1e55721;
Bridge c995485ab93aa56e1eabbdd1900429075fb4c65b;
WindowBoundOfLiteratureLevel 01c499108485b16d33791a9e46fbb1e2af865522;
KFinal 9b26f8a76facea83b64788eaabdf30c492023644;
ClassCounting/LemmaKOfLitN 2b1e21f70e69ace53b5219e9e0807b6de0d1920e;
RUN42 blob 024a25d06747c24f8f4c892734d6a0b6edfa45b5. Original native VWin -> ZK.lemmaK_litN_alt ->
BOdd, PT/LF/LT, SChain/SFinal and all siblings unchanged. Alternative
VWin -> lemmaK_of43 -> reduction43 -> projected bridge + SmallMod43
(small primes only) + native torsMain/numFin; cardRedProjected43 uses
finite X/range, quotient identity and cardKill. Preserve original and RUN42
graphs, context/type/value/constructor/axiom evidence, no retirement.
Context key: pin/toolchain/L/Omega/D/l/e/host/coefficients/p/h/c/actual
consumer and hypotheses; do not cache across unrelated hosts.

Execution: 15 guarded source/transform checks; 416 exact finite
cyclic cardinal checks, 116 strict weakening controls. These test
arithmetic, NOT native proof validity. Historical CI runs 45577239749,
45576756833 and 45670987597 completed pick/run/record with success, not
this file. No native compile, no new axiom result, no claim PASS.
RESUME HERE: native replay cardRedProjected43, then reduction43 and actual
window_cover43; check #print axioms and scans, retain original fallback.
Authenticate the projected cohomology comparison on the actual host;
do not treat abstract weakening as a closed RH obligation.
HANDOFF TO kernel, audit, integration and Galois.
-/

theorem UpperTheory.V.K.cardRedProjected43 :
    ∀ (l : ℕ) [Fact l.Prime] (K : Type) [AddCommGroup K] [Module ℤ_[l] K] (X : Type) [AddCommGroup X] [Module ℤ_[l] X] [Finite X] (W : Type) [AddCommGroup W] [Module ℤ_[l] W] (p : K →ₗ[ℤ_[l]] X) (h : K →ₗ[ℤ_[l]] W) (c : ℕ), Finite (LinearMap.range h) → Function.Surjective p → (∀ x, h x = 0 → (l : ℤ_[l]) ^ c • p x = 0) → Nat.card X ≤ Nat.card (X ⧸ lpow l X 1) ^ c * Nat.card (LinearMap.range h) := by
  intro l _ K _ _ X _ _ _ W _ _ p h c hr hp hk
  letI : Finite (LinearMap.range h) := hr
  let Y : Submodule ℤ_[l] X := (LinearMap.ker h).map p
  have h1 : Nat.card Y ≤ Nat.card (X ⧸ lpow l X 1) ^ c := by
    refine UpperTheory.V.K.cardKill l X c Y ?_
    rintro y ⟨x, hx, rfl⟩
    exact hk x hx
  have hle : LinearMap.ker h ≤ LinearMap.ker (Y.mkQ ∘ₗ p) := by
    intro x hx
    rw [LinearMap.mem_ker, LinearMap.comp_apply, Submodule.mkQ_apply,
      Submodule.Quotient.mk_eq_zero]
    exact ⟨x, hx, rfl⟩
  haveI : Finite (K ⧸ LinearMap.ker h) := Finite.of_injective _ h.quotKerEquivRange.toEquiv.injective
  have h2 : Nat.card (X ⧸ Y) ≤ Nat.card (K ⧸ LinearMap.ker h) := by
    refine Nat.card_le_card_of_surjective ((LinearMap.ker h).liftQ (Y.mkQ ∘ₗ p) hle) fun z => ?_
    obtain ⟨x, rfl⟩ := (Y.mkQ_surjective.comp hp) z
    exact ⟨Submodule.Quotient.mk x, rfl⟩
  have h4 : Nat.card (K ⧸ LinearMap.ker h) = Nat.card (LinearMap.range h) :=
    Nat.card_congr h.quotKerEquivRange.toEquiv
  rw [Submodule.card_eq_card_quotient_mul_card Y, ← h4]
  exact Nat.mul_le_mul h1 h2


noncomputable section
open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual Formalism.GaloisCohomology GlobalTheory.TateLimit
open scoped TensorProduct
namespace UpperTheory.V.K

def coverExponent43 (l e : ℕ) : ℕ :=
  if e < l then 0 else min (e + 2)
    (if l = 2 then e + 2 else (2 * e + 1 + (2 * l - 2) - 1) / (2 * l - 2) + 1)

theorem coverExponent_le43 (l e : ℕ) : coverExponent43 l e ≤ e + 2 := by
  unfold coverExponent43
  split_ifs
  · omega
  · exact min_le_left _ _
  · exact min_le_left _ _

theorem coverExponent_weight_one43 (l : ℕ) [Fact l.Prime] :
    coverExponent43 l 1 = 0 := by
  simp [coverExponent43, (Fact.out : l.Prime).one_lt]

def ProjectedBridge43 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l), IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
      ∃ (K : Type) (_ : AddCommGroup K) (_ : Module ℤ_[l] K)
        (p : K →ₗ[ℤ_[l]] H2 (zlTw D ((e : ℤ) + 1)))
        (h : K →ₗ[ℤ_[l]] ℤ_[l] ⊗[ℤ] HGL L (4 * e + 4) (2 * e)),
        Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧ Finite (LinearMap.range h) ∧
        Function.Surjective p ∧ ∀ x, h x = 0 → (l : ℤ_[l]) ^ coverExponent43 l e • p x = 0

def SmallMod43 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l),
    IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, l ≤ e →
      Nat.card (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1)
        ≤ classNumber L * l ^ Module.finrank ℚ L

theorem native_mod43 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) : SmallMod43 := by
  intro l _ L Ω _ _ _ _ _ D hL hμ e he
  exact card_mod_le hP hF hT D hL hμ (e : ℤ)

private theorem tensCard' (l : ℕ) [Fact l.Prime] (H : Type) [AddCommGroup H] [inst : Module ℤ H]
    [Finite (AddCommGroup.torsion H)] (Y : Submodule ℤ_[l] (ℤ_[l] ⊗[ℤ] H)) [Finite Y] :
    Nat.card Y ≤ Nat.card (AddCommGroup.torsion H) := by
  obtain rfl : inst = AddCommGroup.toIntModule H := Subsingleton.elim _ _
  exact tensCard l H Y

section
variable {l : ℕ} [Fact l.Prime] {L Ω : Type} [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
  (D : LData L Ω l) (hL : IsTotallyComplex L) (hμ : HasMuQ l L)
include hL hμ

theorem reduction43 (hM : SmallMod43) (hK : ProjectedBridge43) (e : ℕ) (he : 1 ≤ e) [Finite (torsHGL L (4 * e + 4) (2 * e))] :
    Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧
      Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤
        4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) * ((2 * (e : ℝ)) * (2 * (e : ℝ) + 3)) *
          Real.log ((Module.finrank ℚ L : ℝ) + 1) + Real.log (Nat.card (torsHGL L (4 * e + 4) (2 * e))) := by
  obtain ⟨K, _, _, p, h, hfin, hr, hp, hh⟩ := hK l L Ω D hL hμ e he
  letI : Finite (H2 (zlTw D ((e : ℤ) + 1))) := hfin
  letI : Finite (LinearMap.range h) := hr
  refine ⟨hfin, ?_⟩
  have h1 := (cardRedProjected43 l K _ _ p h _ hr hp hh).trans
    (Nat.mul_le_mul_left _ (tensCard' l (HGL L (4 * e + 4) (2 * e)) (LinearMap.range h)))
  have hq : Finite (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1) :=
    Finite.of_surjective _ (Submodule.mkQ_surjective _)
  set a := Nat.card (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1) with ha
  set b := Nat.card (torsHGL L (4 * e + 4) (2 * e)) with hb
  have ha0 : (0 : ℝ) < a := by exact_mod_cast (Nat.card_pos : 0 < a)
  have hb0 : (0 : ℝ) < b := by exact_mod_cast (Nat.card_pos : 0 < b)
  have hx0 : (0 : ℝ) < Nat.card (H2 (zlTw D ((e : ℤ) + 1))) := Nat.cast_pos.2 Nat.card_pos
  have h2 : Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤ coverExponent43 l e * Real.log a + Real.log b := by
    rw [← Real.log_pow, ← Real.log_mul (by positivity) hb0.ne']
    exact Real.log_le_log hx0 (by exact_mod_cast h1)
  have hc0 : (coverExponent43 l e : ℝ) ≤ (e : ℝ) + 2 := by
    exact_mod_cast coverExponent_le43 l e
  have he' : (1 : ℝ) ≤ e := by exact_mod_cast he
  have hc : (coverExponent43 l e : ℝ) ≤ (2 * (e : ℝ)) * (2 * (e : ℝ) + 3) := by
    nlinarith [sq_nonneg (e : ℝ)]
  have hl : Real.log l ≤ Real.log ((Module.finrank ℚ L : ℝ) + 1) :=
    Real.log_le_log (by exact_mod_cast (Fact.out : l.Prime).pos) (by exact_mod_cast primeLe l L hμ)
  have hD : (1 : ℝ) ≤ ((discr L).natAbs : ℝ) := by exact_mod_cast Int.natAbs_pos.2 (discr_ne_zero L)
  have hlog : 0 ≤ Real.log (2 * ((discr L).natAbs : ℝ)) := Real.log_nonneg (by linarith)
  have hn : 0 ≤ Real.log ((Module.finrank ℚ L : ℝ) + 1) :=
    Real.log_nonneg (le_add_of_nonneg_left (Nat.cast_nonneg _))
  by_cases hlarge : e < l
  · have ht : Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤ Real.log b := by
      simpa [coverExponent43, hlarge] using h2
    have hnonneg : 0 ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) *
        ((2 * (e : ℝ)) * (2 * (e : ℝ) + 3)) * Real.log ((Module.finrank ℚ L : ℝ) + 1) := by positivity
    linarith
  · have hg := numGens l L _ (hM l L Ω D hL hμ e (Nat.le_of_not_gt hlarge))
    have h3 : Real.log a ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) *
        Real.log ((Module.finrank ℚ L : ℝ) + 1) := hg.trans (mul_le_mul_of_nonneg_left hl (by positivity))
    have h4 := mul_le_mul hc h3 (Real.log_natCast_nonneg a) (by positivity)
    linarith

end

theorem lemmaK_of43 (hM : SmallMod43) (hK : ProjectedBridge43)
    (h : ∃ C, TorsBoundPow C) : ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  obtain ⟨C, h⟩ := h
  obtain ⟨CK, h0, H⟩ := numFin C
  refine ⟨CK, h0, fun l _ L Ω _ _ _ _ _ D hL hμ e he => ?_⟩
  obtain ⟨hf, hb⟩ := h L hL e he
  obtain ⟨h1, h2⟩ := reduction43 D hL hμ hM hK e he
  refine ⟨h1, h2.trans (le_trans ?_ (H e _ _ he Module.finrank_pos (Int.natAbs_pos.2 (discr_ne_zero L))))⟩
  gcongr

end UpperTheory.V.K

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
open UpperTheory.Top
namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_cover43 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hM : UpperTheory.V.K.SmallMod43) (hB : UpperTheory.V.K.ProjectedBridge43) : VWin :=
  have hK : ∃ CK : ℝ, UpperTheory.V.LemmaK CK := by
    obtain ⟨CK, _, hK⟩ := UpperTheory.V.K.lemmaK_of43 hM hB UpperTheory.V.KT.torsMain
    exact ⟨CK, hK⟩
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.of_four_alt hH.litN hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

theorem replay_cover43 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hM : UpperTheory.V.K.SmallMod43) (hB : UpperTheory.V.K.ProjectedBridge43) : VWin := by
  first
  | (rh_reduce 2 using [window_cover43]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact window_cover43 hH hM hB
end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_cover43 limit 2000
rh_scan UpperTheory.V.K.reduction43 limit 2000
rh_prune UpperTheory.V.HV.DescentVanishingReductions.replay_cover43 as RH43CoverWindowPruned
#print axioms UpperTheory.V.K.cardRedProjected43
#print axioms UpperTheory.V.KT.torsMain
#print axioms UpperTheory.V.K.reduction43
#print axioms UpperTheory.V.K.lemmaK_of43
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_cover43
#print axioms UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt
