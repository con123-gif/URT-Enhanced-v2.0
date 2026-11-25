import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CountVs
import Development.AutomorphicArithmetic.AutomorphicVarieties.HermiteNormalForms.TorsMain
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN41 — 25 Nov 2026 — lane 9 — source-matched human proof, Lean PREPARED
(uncompiled, no new PASS). Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4;
pin 40e56bab026552e089d7afcfeff08d2defb9c005; mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Actual CountVs consumer 3b29717c74e14806d898cbbf9f96417396a2d37d; Klen 8d11cf66702190df2c12069a790cd8c29e43a37f; Kmono
b4179c5de83455bbea00538fd802d92dd8eb7423; TorsBoundPow 3552e823716da4241d053c2cdfe0a116039e7886;
TorsMain b1f243a54bfcf9e7c9f01a6cb6afb726c961a92c.
Peer 700e3969 qualitative CountV and 619e11df do not replace quantitative
CountVs. RUN25 15f1c9820a7763e3522b8eccb3c6994089ad2f95 is a different
CountI aggregation. RUN35,38,39,40 preserved.

Human proof: let A=O_L, X=BGL(A)^+, and Y its universal cover. The
Bass–Milnor–Serre theorem gives K1(A)=A^× via determinant. The diagonal
unit section induces s:B(A^×)→X, inverse on pi1. The connected H-space
multiplication on X gives (y,u)↦i(y)s(u) from Y×B(A^×) to X. This is
an isomorphism on every homotopy group (on pi1 by s, on higher pi by
the cover); Whitehead therefore gives a homotopy equivalence. Its
restriction to Y is i up to homotopy, so i induces a split injection
on integral homology. Simply connected Hurewicz identifies
K2(A)=pi2(Y) with H2(Y;Z). Plus construction preserves integral
homology; van der Kallen stability identifies H2(GL_infty(A);Z)
with H2(GL_8(A);Z), in stable range. Since K2(A) is finite (Garland),
the resulting injection has image in torsion. Thus for every prime,
under RUN35/39 comparison hypotheses, H2(G_{L,S},Z_l(2)) is the
l-primary subgroup of K2(A), and its order divides |tors H2(GL_8(A);Z)|.
This improves RUN38 at l=2: no generator penalty at weight one.
No assumption about RH, nor bound across different L by one T.
Sources: Weibel, Algebraic K-Theory of Rings of Integers in Local and
Global Fields, pp144–145, equation (5.4), Tate Theorem 4:
https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/weibel-ints.pdf
Both page images inspected. See RUN38 for van der Kallen stability and
RUN35/39 for the comparison, localization and native coefficients.
Classical H-space, cover, Hurewicz, Whitehead and plus-construction
arguments above are human mathematical proof, not Lean declarations.
WeightOneHurewicz41 is explicitly an unformalized bridge, not an axiom
declared in this file. The native torsMain wrapper has not received a
new transitive axiom audit.

Original local graph: CountVs -> Win.klen -> LemmaK(C) (all weights);
dead local hsha -> PropA.shaLeV(PT,LF,LT).
Candidate: CountVs41 -> WeightOneK41 -> weightOneK41 ->
WeightOneHurewicz41 + KT.torsMain + Kum.lenOfCard.
All CountVs quantitative host/character quantifiers and remaining
native estimates copied. Remove hsha and its three explicit premises
only from this body; not from siblings. Original bridge supplied
from native LemmaK using kmono and klen. Neither branch imports the
claimed RH root. Full weighted prime window and full-weight suppliers
remain OPEN. Original/reduced graphs and prior axiom evidence retained.
Cache context: source pin, D,L,Omega,l,weight=1, exact premises.
Executed 8 fail-on-error source checks, not a Lean run.
Baseline CI statuses 45577239749 and 45576756833 retrieved,
returncode 0; no compilation or new axiom result for this file.
RESUME HERE: compile and audit this overlay at actual CountVs;
formalize the comparison/injection bridge; if it fails, backtrack
to original_bridge41 and native supplier. Preserve other consumers
of LemmaK, PT, LF and LT. HANDOFF TO integration, kernel, audit.
-/

noncomputable section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win
namespace RHLiterature41

def WeightOneHurewicz41 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [Field Ω]
    [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l),
    IsTotallyComplex L → HasMuQ l L →
      Nonempty (ReciprocityTheory.Gal.H2 (zlTw D (2 : ℤ)) ↪ UpperTheory.V.K.torsHGL L 8 2)

def WeightOneK41 (C : ℝ) : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L] [NumberField L] [Field Ω]
    [Algebra L Ω] [IsAlgClosure L Ω] (D : LData L Ω l), HasMuQ l L →
    VLen D (1 : ℤ) ≠ ⊤ ∧ ((VLen D (1 : ℤ)).toNat : ℝ) ≤
      2 * kBound C 1 (Module.finrank ℚ L) (discr L).natAbs

private theorem isTotallyComplex_of_hasMuQ (l : ℕ) [Fact l.Prime] (L : Type) [Field L] [NumberField L] (h : HasMuQ l L) :
    IsTotallyComplex L := by
  obtain ⟨ζ, hζ⟩ := h
  set n := if l = 2 then 4 else l with hn
  have hn2 : 2 < n := by
    have := (Fact.out : l.Prime).two_le
    rw [hn]; split_ifs with h2
    · norm_num
    · omega
  have : NeZero n := ⟨by omega⟩
  have : IsCyclotomicExtension {n} ℚ (IntermediateField.adjoin ℚ {ζ}) :=
    hζ.intermediateField_adjoin_isCyclotomicExtension ℚ
  have : IsTotallyComplex (IntermediateField.adjoin ℚ {ζ}) :=
    IsCyclotomicExtension.Rat.isTotallyComplex (IntermediateField.adjoin ℚ {ζ}) hn2
  exact isTotallyComplex_of_algebra (IntermediateField.adjoin ℚ {ζ}) L


theorem weightOneK41 (C : ℝ) (hT : UpperTheory.V.K.TorsBoundPow C)
    (hI : WeightOneHurewicz41) : WeightOneK41 C := by
  intro l _ L Ω _ _ _ _ _ D hmu
  have htc := isTotallyComplex_of_hasMuQ l L hmu
  obtain ⟨hf, hb⟩ := hT L htc 1 le_rfl
  letI : Finite (UpperTheory.V.K.torsHGL L 8 2) := hf
  obtain ⟨f⟩ := hI l L Ω D htc hmu
  letI : Finite (ReciprocityTheory.Gal.H2 (zlTw D (2 : ℤ))) := Finite.of_injective f f.injective
  have hc := Nat.card_le_card_of_injective f f.injective
  have hx : (0 : ℝ) < Nat.card (ReciprocityTheory.Gal.H2 (zlTw D (2 : ℤ))) :=
    Nat.cast_pos.2 Nat.card_pos
  have hlog : Real.log (Nat.card (ReciprocityTheory.Gal.H2 (zlTw D (2 : ℤ)))) ≤
      kBound C 1 (Module.finrank ℚ L) (discr L).natAbs :=
    (Real.log_le_log hx (by exact_mod_cast hc)).trans hb
  obtain ⟨k, hlen, hcard⟩ := Kum.lenOfCard l (ReciprocityTheory.Gal.H2 (zlTw D (2 : ℤ)))
  have hV : VLen D (1 : ℤ) = (k : ℕ∞) := hlen
  refine ⟨by rw [hV]; exact ENat.coe_ne_top k, ?_⟩
  rw [hV, ENat.toNat_coe]
  rw [hcard] at hlog
  push_cast at hlog
  rw [Real.log_pow] at hlog
  have hl2 : (2 : ℝ) ≤ l := by exact_mod_cast (Fact.out : l.Prime).two_le
  have hlogl : (1 / 2 : ℝ) ≤ Real.log l := by
    have h1 : Real.log 2 ≤ Real.log l := Real.log_le_log (by norm_num) hl2
    have h2 : (1 / 2 : ℝ) < Real.log 2 := by
      have := Real.log_two_gt_d9
      linarith
    linarith
  have hk0 : (0 : ℝ) ≤ k := Nat.cast_nonneg k
  nlinarith

theorem weightOneMono41 (C C' : ℝ) (hCC : C ≤ C') (h : WeightOneK41 C) :
    WeightOneK41 C' := by
  intro l _ L Ω _ _ _ _ _ D hmu
  obtain ⟨hf, hb⟩ := h l L Ω D hmu
  refine ⟨hf, hb.trans (mul_le_mul_of_nonneg_left ?_ (by norm_num))⟩
  unfold kBound
  apply Real.exp_le_exp.mpr
  apply mul_le_mul_of_nonneg_right
  · apply Real.rpow_le_rpow_of_exponent_le _ hCC
    have hn : 0 < Module.finrank ℚ L := Module.finrank_pos
    have h2 : (1 : ℝ) ≤ (Module.finrank ℚ L : ℝ) := by exact_mod_cast hn
    push_cast
    nlinarith
  · rcases Nat.eq_zero_or_pos (discr L).natAbs with h0 | h0
    · rw [h0]
      simp
    · apply Real.log_nonneg
      have : (1 : ℝ) ≤ ((discr L).natAbs : ℝ) := by exact_mod_cast h0
      linarith


private theorem kBound_le (K n n0 D : ℕ) (x : ℝ) (hx : 2 ≤ x) (hn : n ≤ n0) (hD : 0 < D)
    (hl : Real.log (D : ℝ) ≤ (n : ℝ) * Real.log x) :
    kBound (K : ℝ) 1 n D ≤ x ^ ((2 * n0) ^ K * (n0 + 1)) := by
  have hx0 : 0 < x := by linarith
  have hn' : (n : ℝ) ≤ n0 := by exact_mod_cast hn
  have hD' : (1 : ℝ) ≤ D := by exact_mod_cast hD
  have h2 : Real.log 2 ≤ Real.log x := Real.log_le_log (by norm_num) hx
  have hx1 : 0 ≤ Real.log x := Real.log_nonneg (by linarith)
  have h3 : Real.log (2 * (D : ℝ)) ≤ ((n0 : ℝ) + 1) * Real.log x := by
    rw [Real.log_mul (by norm_num) (by linarith)]
    nlinarith [mul_le_mul_of_nonneg_right hn' hx1]
  have h4 : 0 ≤ Real.log (2 * (D : ℝ)) := Real.log_nonneg (by linarith)
  unfold kBound
  rw [← Real.exp_log (pow_pos hx0 _), Real.exp_le_exp, Real.log_pow, Real.rpow_natCast]
  push_cast
  rw [mul_assoc ((2 * (n0 : ℝ)) ^ K)]
  refine mul_le_mul ?_ h3 h4 (by positivity)
  rw [mul_one]
  gcongr

private theorem nrm_le (l : ℕ) [Fact l.Prime] (O : Type) [CommRing O] [Algebra ℤ_[l] O] (hT : eO l O ≠ ⊤)
    (a : ℕ∞) (m : ℕ) (h : a ≤ (m : ℕ∞) * eO l O) : a ≠ ⊤ ∧ Chr.nrm l O a ≤ m := by
  obtain ⟨k, hk⟩ := ENat.ne_top_iff_exists.1 hT
  rw [← hk] at h
  have hmk : (m : ℕ∞) * (k : ℕ∞) = ((m * k : ℕ) : ℕ∞) := by push_cast; rfl
  rw [hmk] at h
  have ha : a ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) h
  refine ⟨ha, ?_⟩
  lift a to ℕ using ha
  have h' : a ≤ m * k := by exact_mod_cast h
  unfold Chr.nrm
  rw [← hk]
  simp only [ENat.toNat_coe]
  rcases Nat.eq_zero_or_pos k with hk0 | hk0
  · simp [hk0]
  · rw [div_le_iff₀ (by exact_mod_cast hk0)]
    exact_mod_cast h'

private theorem final_le (A n0 : ℕ) (x v y l N : ℝ) (hl : 1 ≤ l) (hN : 2 ≤ N) (hx : x = l * N)
    (hy0 : 0 ≤ y) (hy : y ≤ l) (hv : v ≤ 2 * x ^ A + n0 * (2 * N)) :
    v * y ≤ x ^ (A + n0 + 3) := by
  have h2n : ∀ m : ℕ, m + 1 ≤ 2 ^ m := by
    intro m
    induction m with
    | zero => simp
    | succ m ih => rw [pow_succ]; omega
  have hx2 : 2 ≤ x := by rw [hx]; nlinarith
  have hx0 : 0 ≤ x := by linarith
  have hlx : l ≤ x := by rw [hx]; nlinarith
  have hX : x ≤ x ^ (A + 1) := le_self_pow₀ (by linarith) (by omega)
  have hX0 : 0 ≤ x ^ (A + 1) := pow_nonneg hx0 _
  have hn00 : (0 : ℝ) ≤ n0 := Nat.cast_nonneg _
  have hp2 : (1 : ℝ) ≤ 2 ^ n0 := one_le_pow₀ (by norm_num)
  have hn0 : (n0 : ℝ) + 1 ≤ 2 ^ n0 := by exact_mod_cast h2n n0
  have hpow : (2 : ℝ) ^ (n0 + 2) ≤ x ^ (n0 + 2) := pow_le_pow_left₀ (by norm_num) hx2 _
  have hA0 : 0 ≤ x ^ A := pow_nonneg hx0 A
  have hpos : 0 ≤ 2 * x ^ A + n0 * (2 * N) := by nlinarith
  have e1 : x ^ A * l ≤ x ^ (A + 1) := by
    rw [pow_succ]; exact mul_le_mul_of_nonneg_left hlx hA0
  calc v * y ≤ (2 * x ^ A + n0 * (2 * N)) * y := mul_le_mul_of_nonneg_right hv hy0
    _ ≤ (2 * x ^ A + n0 * (2 * N)) * l := mul_le_mul_of_nonneg_left hy hpos
    _ = 2 * (x ^ A * l) + 2 * n0 * x := by rw [hx]; ring
    _ ≤ 2 * x ^ (A + 1) + 2 * n0 * x ^ (A + 1) := by nlinarith
    _ ≤ x ^ (A + 1) * 2 ^ (n0 + 2) := by
      rw [pow_add (2 : ℝ) n0 2]
      nlinarith [mul_le_mul_of_nonneg_left hn0 hX0, mul_le_mul_of_nonneg_left hp2 hX0]
    _ ≤ x ^ (A + 1) * x ^ (n0 + 2) := mul_le_mul_of_nonneg_left hpow hX0
    _ = x ^ (A + n0 + 3) := by rw [← pow_add]; congr 1; omega

theorem countVs41 : ∀ C : ℕ, WeightOneK41 (C : ℝ) → CountVs := by
  intro C hK χ
  obtain ⟨M, hM⟩ : ∃ M : ℕ, M = (Bchi χ).sup id := ⟨_, rfl⟩
  obtain ⟨n0, hn0⟩ : ∃ n0 : ℕ, n0 = 2 * ordC χ * (16 * ordC χ * (M * χ.N) ^ 2 * M ^ (2 * (4 * ordC χ).totient)) * M :=
    ⟨_, rfl⟩
  refine ⟨(2 * n0) ^ C * (n0 + 1) + n0 + 3, ?_⟩
  intro h hχ t hbig Ω _ _ _ l _ c e hl2 he0 het ψ hψX hP
  obtain ⟨⟨hlB, he1⟩, hR⟩ := hP
  subst he1
  subst hχ
  haveI := c.dvr
  haveI := c.fin
  have hlp : l.Prime := Fact.out
  have hl2' : 2 ≤ l := hlp.two_le
  obtain ⟨hIs, -⟩ := (Host.mem_X h).1 hψX
  have hNpos : 0 < h.N := Host.N_pos h
  have hN2 : 2 ≤ h.N := le_trans (by norm_num) (Nat.le_of_dvd hNpos (hostIndex h).2.2.1)
  have hlM : l ≤ M := by rw [hM]; exact Finset.le_sup (f := id) hlB
  have hord := vsOrd h c.O ψ hIs l hlp hl2 hR
  have hordM : orderOf ψ * l ≤ n0 := by
    rw [hn0]
    refine Nat.mul_le_mul (le_trans hord ?_) hlM
    show 2 * ordC h.chi * (16 * ordC h.chi * (l * h.chi.N) ^ 2 * l ^ (2 * (4 * ordC h.chi).totient)) ≤ _
    gcongr
  obtain ⟨L, _, _, _, _, _, hMu, hdeg, hcyc, hgal⟩ := vsField Ω l hl2 c.O h.N ψ
  obtain ⟨D⟩ := ldata_nonempty (F := L) (Ω := Ω) l
  have hdegn : Module.finrank ℚ L ≤ n0 := le_trans hdeg hordM
  have hT : Subgroup.closure ((Finset.univ : Finset (L ≃ₐ[ℚ] L)) : Set (L ≃ₐ[ℚ] L)) = ⊤ := by simp
  have hcard : (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card ≤ n0 := by
    rw [Finset.card_univ, ← Nat.card_eq_fintype_card, IsGalois.card_aut_eq_finrank]
    exact hdegn
  have hclsker : (Chr.cls ℚ Ω h.N).ker ≤ (Chr.dirG ℚ Ω ψ).ker := by
    intro σ hσ
    rw [MonoidHom.mem_ker] at hσ ⊢
    simp [Chr.dirG, hσ]
  have hkl := hK l L Ω D hMu
  obtain ⟨m1, hm1⟩ : ∃ m1 : ℕ, VLen D ((1 : ℕ) : ℤ) = m1 := ⟨_, (ENat.coe_toNat hkl.1).symm⟩
  have hup := Chr.upV ℚ Ω L l c.O D 1 (Chr.dirG ℚ Ω ψ) hgal Finset.univ hT
  have hh0 := (Chr.H0_local_card_bounded_of_cls_ker_le_ker Ω l c.O h.N 1 (Chr.dirG ℚ Ω ψ) one_ne_zero hclsker).2
  have heO : eO l c.O ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) (dvrFacts l c.O).2.2.2.2.2.2.1
  have hV : Vlen Ω c 1 ψ ≤ ((m1 + (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card *
      LDataCardLeFinrank.nuBound l h.N 1 : ℕ) : ℕ∞) * eO l c.O := by
    calc Vlen Ω c 1 ψ ≤ Chr.V l 1 (Chr.dirG ℚ Ω ψ) := Chr.V'_le_V (k := ℚ) (Ω := Ω) l h.N 1 (Chr.dirG ℚ Ω ψ)
      _ ≤ _ := hup
      _ ≤ VLen D ((1 : ℕ) : ℤ) * eO l c.O + ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℕ∞) *
            ((LDataCardLeFinrank.nuBound l h.N 1 : ℕ∞) * eO l c.O) := by gcongr
      _ = _ := by rw [hm1]; push_cast; ring
  obtain ⟨hne, hnrm⟩ := nrm_le l c.O heO _ _ hV
  refine ⟨hne, ?_⟩
  have hD : 0 < (discr L).natAbs := Int.natAbs_pos.2 (discr_ne_zero L)
  have hx2 : (2 : ℝ) ≤ (l : ℝ) * h.N := by
    have : (2 : ℝ) ≤ l := by exact_mod_cast hl2'
    have : (2 : ℝ) ≤ h.N := by exact_mod_cast hN2
    nlinarith
  have hlogD : Real.log ((discr L).natAbs : ℝ) ≤ (Module.finrank ℚ L : ℝ) * Real.log ((l : ℝ) * h.N) := by
    have := Win.disc L (l * h.N) (Nat.mul_pos (by omega) hNpos) hcyc
    push_cast at this
    exact this
  have hkb := kBound_le C (Module.finrank ℚ L) n0 (discr L).natAbs ((l : ℝ) * h.N) hx2 hdegn hD hlogD
  have hnu : LDataCardLeFinrank.nuBound l h.N 1 ≤ 2 * h.N * 1 := (lossLe l h.N 0 1 hlp hl2 hN2 (Nat.zero_le _) le_rfl).2
  have hv : Vn Ω c 1 ψ ≤ 2 * ((l : ℝ) * h.N) ^ ((2 * n0) ^ C * (n0 + 1)) + n0 * (2 * (h.N : ℝ)) := by
    have hc1 : ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℝ) ≤ n0 := by exact_mod_cast hcard
    have hc2 : (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) ≤ 2 * h.N := by
      have : (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) ≤ ((2 * h.N * 1 : ℕ) : ℝ) := by exact_mod_cast hnu
      push_cast at this
      linarith
    have hc3 : (m1 : ℝ) ≤ 2 * kBound (C : ℝ) 1 (Module.finrank ℚ L) (discr L).natAbs := by
      have := hkl.2
      rw [hm1, ENat.toNat_coe] at this
      exact this
    calc Vn Ω c 1 ψ ≤ ((m1 + (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card *
          LDataCardLeFinrank.nuBound l h.N 1 : ℕ) : ℝ) := hnrm
      _ = (m1 : ℝ) + ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℝ) *
          (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) := by push_cast; ring
      _ ≤ 2 * kBound (C : ℝ) 1 (Module.finrank ℚ L) (discr L).natAbs + n0 * (2 * (h.N : ℝ)) := by
          gcongr
      _ ≤ _ := by linarith
  have hl1 : (1 : ℝ) ≤ l := by exact_mod_cast hlp.one_lt.le
  have hy0 : 0 ≤ Real.log (l : ℝ) := Real.log_nonneg hl1
  have hyl : Real.log (l : ℝ) ≤ l := (Real.log_le_sub_one_of_pos (by linarith)).trans (by linarith)
  have hfin := final_le ((2 * n0) ^ C * (n0 + 1)) n0 ((l : ℝ) * h.N) (Vn Ω c 1 ψ) (Real.log l) l h.N
    hl1 (by exact_mod_cast hN2) rfl hy0 hyl hv
  simpa using hfin


theorem countVs_of_hurewicz41 (h : WeightOneHurewicz41) : CountVs := by
  obtain ⟨C,hC⟩ := UpperTheory.V.KT.torsMain
  exact countVs41 ⌈C⌉₊ (weightOneMono41 C _ (Nat.le_ceil C) (weightOneK41 C hC h))

theorem original_bridge41 (CK : ℝ) (hK : LemmaK CK) : CountVs := by
  apply countVs41 ⌈CK⌉₊
  intro l _ L Ω _ _ _ _ _ D hmu
  exact Win.klen _ (Win.kmono CK _ (Nat.le_ceil CK) hK) l L Ω D hmu 1 le_rfl

theorem replay41 (h : WeightOneHurewicz41) : CountVs := by
  first
  | (rh_reduce 2 using [countVs_of_hurewicz41]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countVs_of_hurewicz41 h

end RHLiterature41

rh_scan UpperTheory.V.HV.countVs limit 2000
rh_scan RHLiterature41.countVs41 limit 2000
rh_scan RHLiterature41.countVs_of_hurewicz41 limit 2000
rh_prune UpperTheory.V.HV.countVs as RHLiterature41.NativePruned41
rh_prune RHLiterature41.replay41 as RHLiterature41.ReplayPruned41
#print axioms UpperTheory.V.HV.countVs
#print axioms UpperTheory.V.KT.torsMain
#print axioms RHLiterature41.countVs41
#print axioms RHLiterature41.countVs_of_hurewicz41
#print axioms RHLiterature41.original_bridge41
