import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.WindowBoundOfLiteratureLevel
import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.LemmaKOfPublished
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN42 — 26 Nov 2026 — literature lane 9. SOURCE-MATCHED human derivation;
Lean PREPARED, NOT COMPILED. RH OPEN.

New ingredient: apply Mathew to the simply connected cover, not BGL^+
itself. Let A=O_L and K(A) its connective K-theory spectrum. The identity
component X of Omega-infinity K(A) is BGL(A)^+. Its universal cover
Y=Omega-infinity tau_{>=2} K(A) is a 1-connected infinite loop space;
the cover i:Y->X induces isomorphisms on pi_n for n>=2. The determinant
K1(A)=A^times (Bass–Milnor–Serre) and diagonal units section give
s:B(A^times)->X, inducing an isomorphism on pi1. The H-space multiplication
(y,u)->i(y)s(u) is a homotopy equivalence by Whitehead (all homotopy
groups), hence i_* is split injective on integral homology in EVERY
degree. No claim that the section is a map of infinite loop spaces.
This extends RUN41's homology splitting to the full Hurewicz kernel:
the kernel on pi_(2e)(X) equals the kernel for Y via naturality and
split injectivity. Apply Mathew Theorem 6.3 with m=2,n=2e, not m=1.
It is annihilated by the exponent of tau_[1,2e-2] S^0. For e=1 the
interval is empty (ordinary Hurewicz); for odd l>e, 2e-2<2l-3 so
Serre's first torsion theorem gives trivial l-local interval. This
includes the boundary l=e+1 previously charged one unit in RUN38.
For l=2,e>=2 use e+2; for odd l<=e use ceil((2e+1)/(2l-2))+1,
also bounded by e+2 (so the minimum is legitimate). Thus
  log |H2| <= c42(l,e) log |H2/lH2| + log |tors H_{2e}(GL_{4e+4})|.
No generator input for ANY l>e, including all primes at weight one.
Only l<=e requires the Kummer mod-l estimate. The human derivation
uses RUN35/39's exact native GS/etale/QL comparison, localization and
finiteness; van der Kallen stable range as in RUN38. Tensoring the
finite primary K-group and the homology with Z_l is flat; kernel
bound localizes. All same-field and coefficient hypotheses retained.
This does not construct the native comparison in Lean.
Sources: Mathew, arXiv:1501.07561v2, pp4,10 Thms 2.8,6.3, page
images inspected 26 Nov; doi:10.2140/agt.2016.16.1025.
https://arxiv.org/pdf/1501.07561
Serre first torsion, Hatcher Spectral Sequences Thm 1.28 as RUN38;
Weibel, Algebraic K-Theory of Rings of Integers in Local and Global
Fields, pp144-145, as RUN41 (determinant/section).
RUN40 Kummer estimate supplies SmallMod42 on reduced range.
No new conjectural premise; CoverBridge42 and SmallMod42 remain
explicit mathematical interfaces, NOT newly proved Lean facts.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including
mandatory engine. SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
AGENTS 8db0201d, continuity 61459cfd, state/log/protocol/summary consulted.
Peer f304da1a shared CountI/V, ad6e9dab cofinal Sha, 49cea008 restricted
cotangent read. No combining uncompiled peer overlays. Pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1, mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Upstream observed 388ec4364376d78ea8d33c0f9e79a91e8b319f3a (not migrated).
Native Reduction 1cfb92c81ec5c4ed77aac5a7cce457add1e55721; Bridge c995485ab93aa56e1eabbdd1900429075fb4c65b; actual caller WindowBoundOfLiteratureLevel
01c499108485b16d33791a9e46fbb1e2af865522; Assembly 2170a3e28188b4e75f62aade0ae9e7890155076c;
TorsMain b1f243a54bfcf9e7c9f01a6cb6afb726c961a92c.
Original selected graph: VWin -> ZK.lemmaK_litN_alt -> SNum/SFinal,
BOdd and siblings. Alternative K.lemmaK -> reduction -> generators
-> card_mod_le(PT,LF,LT), KBridge, torsMain, numFin. Candidate actual
caller window_cover42 -> lemmaK_of42 -> reduction42 -> CoverBridge42,
torsMain,numFin, and SmallMod42 only if l<=e. Original caller and
all siblings retained; native fallback unchanged. Source edges only;
all unresolved type/value/constructor edges and axiom evidence
preserved; no global deletion. Cache by pin/toolchain,L,Omega,D,l,e,
S,coefficient,rank,exact hypotheses and caller role.
Execution: 16 guarded source/transform checks, 10000 integer
exponent comparisons (all primes <=100, weights 1..400; arithmetic
controls only). Actual CI jobs 45577239749,45576756833,45670987597
pick/run/record completed success; historical engines/conditional
root only. Local lean/lake/elan absent. New file not compiled/queued,
no new axiom audit. Native reduction tools below are replay requests.
RESUME HERE: independently replay this file with pinned engines;
authenticate connective-cover Hurewicz and native comparison, then
check actual caller and axioms. Backtrack to original native
vwin_of_hypotheses_H_E_alt on failure. Do not infer actual full VWin
or weighted prime-window lower bound. HANDOFF TO kernel, integration,
Galois and audit.
-/

noncomputable section
open NumberField IsDedekindDomain ReciprocityTheory.Gal Formalism.ConjugateSelfDual Formalism.GaloisCohomology GlobalTheory.TateLimit
open scoped TensorProduct
namespace UpperTheory.V.K

def coverExponent42 (l e : ℕ) : ℕ :=
  if e < l then 0 else min (e + 2)
    (if l = 2 then e + 2 else (2 * e + 1 + (2 * l - 2) - 1) / (2 * l - 2) + 1)

theorem coverExponent_le42 (l e : ℕ) : coverExponent42 l e ≤ e + 2 := by
  unfold coverExponent42
  split_ifs
  · omega
  · exact min_le_left _ _
  · exact min_le_left _ _

theorem coverExponent_weight_one42 (l : ℕ) [Fact l.Prime] :
    coverExponent42 l 1 = 0 := by
  simp [coverExponent42, (Fact.out : l.Prime).one_lt]

def CoverBridge42 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l), IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
      ∃ (K : Type) (_ : AddCommGroup K) (_ : Module ℤ_[l] K) (_ : Finite K)
        (p : K →ₗ[ℤ_[l]] H2 (zlTw D ((e : ℤ) + 1)))
        (h : K →ₗ[ℤ_[l]] ℤ_[l] ⊗[ℤ] HGL L (4 * e + 4) (2 * e)),
        Function.Surjective p ∧ ∀ x, h x = 0 → (l : ℤ_[l]) ^ coverExponent42 l e • x = 0

def SmallMod42 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L]
    [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l),
    IsTotallyComplex L → HasMuQ l L → ∀ e : ℕ, l ≤ e →
      Nat.card (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1)
        ≤ classNumber L * l ^ Module.finrank ℚ L

theorem native_mod42 (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) : SmallMod42 := by
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

theorem reduction42 (hM : SmallMod42) (hK : CoverBridge42) (e : ℕ) (he : 1 ≤ e) [Finite (torsHGL L (4 * e + 4) (2 * e))] :
    Finite (H2 (zlTw D ((e : ℤ) + 1))) ∧
      Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤
        4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) * ((2 * (e : ℝ)) * (2 * (e : ℝ) + 3)) *
          Real.log ((Module.finrank ℚ L : ℝ) + 1) + Real.log (Nat.card (torsHGL L (4 * e + 4) (2 * e))) := by
  obtain ⟨K, _, _, _, p, h, hp, hh⟩ := hK l L Ω D hL hμ e he
  have hfin : Finite (H2 (zlTw D ((e : ℤ) + 1))) := Finite.of_surjective p hp
  refine ⟨hfin, ?_⟩
  have hr : Finite (LinearMap.range h) := Finite.of_surjective h.rangeRestrict h.surjective_rangeRestrict
  have h1 := (cardRed l K _ _ p h _ hp hh).trans
    (Nat.mul_le_mul_left _ (tensCard' l (HGL L (4 * e + 4) (2 * e)) (LinearMap.range h)))
  have hq : Finite (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1) :=
    Finite.of_surjective _ (Submodule.mkQ_surjective _)
  set a := Nat.card (H2 (zlTw D ((e : ℤ) + 1)) ⧸ lpow l (H2 (zlTw D ((e : ℤ) + 1))) 1) with ha
  set b := Nat.card (torsHGL L (4 * e + 4) (2 * e)) with hb
  have ha0 : (0 : ℝ) < a := by exact_mod_cast (Nat.card_pos : 0 < a)
  have hb0 : (0 : ℝ) < b := by exact_mod_cast (Nat.card_pos : 0 < b)
  have hx0 : (0 : ℝ) < Nat.card (H2 (zlTw D ((e : ℤ) + 1))) := Nat.cast_pos.2 Nat.card_pos
  have h2 : Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤ coverExponent42 l e * Real.log a + Real.log b := by
    rw [← Real.log_pow, ← Real.log_mul (by positivity) hb0.ne']
    exact Real.log_le_log hx0 (by exact_mod_cast h1)
  have hc0 : (coverExponent42 l e : ℝ) ≤ (e : ℝ) + 2 := by
    exact_mod_cast coverExponent_le42 l e
  have he' : (1 : ℝ) ≤ e := by exact_mod_cast he
  have hc : (coverExponent42 l e : ℝ) ≤ (2 * (e : ℝ)) * (2 * (e : ℝ) + 3) := by
    nlinarith [sq_nonneg (e : ℝ)]
  have hl : Real.log l ≤ Real.log ((Module.finrank ℚ L : ℝ) + 1) :=
    Real.log_le_log (by exact_mod_cast (Fact.out : l.Prime).pos) (by exact_mod_cast primeLe l L hμ)
  have hD : (1 : ℝ) ≤ ((discr L).natAbs : ℝ) := by exact_mod_cast Int.natAbs_pos.2 (discr_ne_zero L)
  have hlog : 0 ≤ Real.log (2 * ((discr L).natAbs : ℝ)) := Real.log_nonneg (by linarith)
  have hn : 0 ≤ Real.log ((Module.finrank ℚ L : ℝ) + 1) :=
    Real.log_nonneg (le_add_of_nonneg_left (Nat.cast_nonneg _))
  by_cases hlarge : e < l
  · have ht : Real.log (Nat.card (H2 (zlTw D ((e : ℤ) + 1)))) ≤ Real.log b := by
      simpa [coverExponent42, hlarge] using h2
    have hnonneg : 0 ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) *
        ((2 * (e : ℝ)) * (2 * (e : ℝ) + 3)) * Real.log ((Module.finrank ℚ L : ℝ) + 1) := by positivity
    linarith
  · have hg := numGens l L _ (hM l L Ω D hL hμ e (Nat.le_of_not_gt hlarge))
    have h3 : Real.log a ≤ 4 * (Module.finrank ℚ L : ℝ) * Real.log (2 * ((discr L).natAbs : ℝ)) *
        Real.log ((Module.finrank ℚ L : ℝ) + 1) := hg.trans (mul_le_mul_of_nonneg_left hl (by positivity))
    have h4 := mul_le_mul hc h3 (Real.log_natCast_nonneg a) (by positivity)
    linarith

end

theorem lemmaK_of42 (hM : SmallMod42) (hK : CoverBridge42)
    (h : ∃ C, TorsBoundPow C) : ∃ CK : ℝ, 0 < CK ∧ LemmaK CK := by
  obtain ⟨C, h⟩ := h
  obtain ⟨CK, h0, H⟩ := numFin C
  refine ⟨CK, h0, fun l _ L Ω _ _ _ _ _ D hL hμ e he => ?_⟩
  obtain ⟨hf, hb⟩ := h L hL e he
  obtain ⟨h1, h2⟩ := reduction42 D hL hμ hM hK e he
  refine ⟨h1, h2.trans (le_trans ?_ (H e _ _ he Module.finrank_pos (Int.natAbs_pos.2 (discr_ne_zero L))))⟩
  gcongr

end UpperTheory.V.K

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
open UpperTheory.Top
namespace UpperTheory.V.HV.DescentVanishingReductions
theorem window_cover42 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hM : UpperTheory.V.K.SmallMod42) (hB : UpperTheory.V.K.CoverBridge42) : VWin :=
  have hK : ∃ CK : ℝ, UpperTheory.V.LemmaK CK := by
    obtain ⟨CK, _, hK⟩ := UpperTheory.V.K.lemmaK_of42 hM hB UpperTheory.V.KT.torsMain
    exact ⟨CK, hK⟩
  have hE := _root_.UpperTheory.V.Z.Win.Dn.ends0_alt hH
  have h4 := _root_.UpperTheory.V.HV.DescentVanishingReductions.countII_and_countIII_of_printsH_of_sp4In hH hK (_root_.UpperTheory.V.HV.DescentVanishingReductions.sp4In0_alt hH)
  _root_.UpperTheory.V.HV.Core.of_four_alt hH.litN hK (_root_.UpperTheory.V.Z.J.count_i_of_printed_bound_k_kato_automorphy hH hK (_root_.UpperTheory.V.Z.Kato.WeilSphericalRecords.katoTwoW_of_printsH hH) (_root_.UpperTheory.V.HV.Core0.automorphyUnramified_of_litN_of_gdEnd hH.litN hE.1)) h4.1 h4.2 (_root_.UpperTheory.V.Z.J.count_v_of_printed_bound_k_reduced_unitary_lift hH hK hE.2)

theorem replay_cover42 (hH : _root_.UpperTheory.V.Af.HypothesesH')
    (hM : UpperTheory.V.K.SmallMod42) (hB : UpperTheory.V.K.CoverBridge42) : VWin := by
  first
  | (rh_reduce 2 using [window_cover42]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact window_cover42 hH hM hB
end UpperTheory.V.HV.DescentVanishingReductions

rh_scan UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt limit 2000
rh_scan UpperTheory.V.HV.DescentVanishingReductions.window_cover42 limit 2000
rh_scan UpperTheory.V.K.reduction42 limit 2000
rh_prune UpperTheory.V.HV.DescentVanishingReductions.replay_cover42 as RH42CoverWindowPruned
#print axioms UpperTheory.V.KT.torsMain
#print axioms UpperTheory.V.K.reduction42
#print axioms UpperTheory.V.K.lemmaK_of42
#print axioms UpperTheory.V.HV.DescentVanishingReductions.window_cover42
#print axioms UpperTheory.V.HV.DescentVanishingReductions.vwin_of_hypotheses_H_E_alt
