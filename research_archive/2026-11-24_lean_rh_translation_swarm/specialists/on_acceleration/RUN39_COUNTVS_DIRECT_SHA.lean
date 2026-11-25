import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.JointWinOfCounts
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SFinal
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN39 lane14 25 Nov 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
Mission latest f8b4b837301f8cf43d673be4979f04c4e4b415a4 and mandatory
engine, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07, AGENTS
8db0201d read. Peer integration 2785c414, character 2c98bf97,
own de1f67ea read; latest 25 commits surveyed.
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: remove the Sha -> H2 -> Sha detour ALSO at the actual CountVs
consumer of JointWinOfCounts (complementing peer tower anchor).
Chr.upV's actual RHS is Sha length, not VLen:
  V <= shaLen(D,1)*eO + card(T)*h0.
The old proof introduced hsha: shaLen <= VLen, then used klen to bound
VLen via full LemmaK. Instead use shaLen_eq_shaInv and the SAME ShaK
witness at the existing vsField L, D, weight 1. Since log(l)>=1/2,
  shaLen(D,1) = s < infinity,  s <= 2*kBound(ceil CK,1,n,disc).
No PT/LF/LT, VLen or H2 needed at this consumer. The same n0,
polynomial exponent shape, finite-length control, local H0 bound,
hP, character, field and host conditions retained. The degree,
conductor and ramification bounds are unchanged. Only CK (Sha)
need not equal the old CK (LemmaK). No global PT deletion.
In fact CountVs needs only the weight-one restriction of ShaK on
the vsField witnesses; all-weight ShaK is used here to reuse the
existing SNum proof packet, not asserted necessary.

Original selected graph:
 VWin -> vwin_of_counts -> jointWin_of_counts -> thmHV_of_counts
 -> pointHV_of_counts -> countVs -> klen, kmono, shaLeV, upV.
 countVs -> vsField, h0, nrm, lossLe, degree/discriminant.
Candidate:
 vwin_of_counts_sha39 -> vwin_with_vs39 -> pointHV_with_vs39
 -> countVs_of_sha39 -> shaOne39 -> ShaK, shaLen_eq_shaInv.
 Same other count inputs, CountIV, CountZ, ThmBab K 401, ThmBcFree,
 same upV and loss suppliers. No change to CountI/II/III/V proofs.
Together with RUN40 peer shared anchor, both direct LemmaK calls
in HVCore.of_four_alt can be bypassed if native replay succeeds;
hK still required in sibling count builders, not retired globally.
Preserve all earlier native expanded role/type/constructor/axiom
graphs and unresolved nodes. Cache by source+toolchain pin,
exact host, chi, l, N, psi, L,D, weight=1, same Sha witness,
coefficient ring and role; never identify different field contexts.
Backtrack to original countVs and vwin_of_counts on replay failure.

Source ledger relative to AutomorphicVarieties/:
HeightAndVanishing/CountVs.lean 3b29717c74e14806d898cbbf9f96417396a2d37d
HeightAndVanishing/JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1
CharacterLevelBounds/LiftGens.lean 41897884461cf6ab6317ee62923390c28078465f
GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean 19302758658356ff85c5540681e53e79579ab975
LayeredIsomorphisms/Klen.lean 8d11cf66702190df2c12069a790cd8c29e43a37f
ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
Peer shaMono38 copied as local helper from 2c98bf97, blob 2de40ab81f600baab16740f88862f4aaa5a5dc39.
Private helpers below copied from native CountVs and Klen.
Executed 30 fail-on-error connector JS source hash, exact anchor,
unique substitution and preserved-supplier checks. Not Lean execution.
Local lean/lake absent. Actual CI job records for runs 45577239749,
45576756833 and 45670987597 fetched: all completed/success; baseline
only. No new native replay or axiom results; commands below prepared.
No speedup claim. No URT needed. RH OPEN.

RESUME HERE: native replay this overlay, then substitute
vwin_of_counts_sha39 hSha for vwin_of_counts ... hL at the peer
integration core_sha40 (same hSha already supplied for tower anchor).
After actual caller verification, inspect sibling CountI/II/III/V
CohInp consumers for genuinely necessary H2 length. Keep full SNum
uniform bound, BOdd, geometry and all unresolved premises.
HANDOFF TO integration, kernel, audit, Galois, character boxes.
-/

open NumberField IsDedekindDomain Formalism.ConjugateSelfDual Formalism.HC ReciprocityTheory.Gal Formalism.GaloisCohomology UpperTheory.V UpperTheory.V.Base UpperTheory.Top UpperTheory.V.HV

open UpperTheory.V.ZK UpperTheory.V.LDataCardLeFinrank

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

private theorem isTotallyComplex_of_hasMuQ39 (l : ℕ) [Fact l.Prime] (L : Type) [Field L] [NumberField L] (h : HasMuQ l L) :
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

private theorem shaMono39 :
    ∀ C C' : ℝ, C ≤ C' → ShaK C → ShaK C' := by
  intro C C' hCC hK
  unfold ShaK at hK ⊢
  intro l _ L _ _ hL hMu e he
  obtain ⟨s, hs, hb⟩ := hK l L hL hMu e he
  refine ⟨s, hs, hb.trans ?_⟩
  unfold kBound
  apply Real.exp_le_exp.mpr
  apply mul_le_mul_of_nonneg_right
  · apply Real.rpow_le_rpow_of_exponent_le _ hCC
    have hn : 0 < Module.finrank ℚ L := Module.finrank_pos
    have h1 : (1 : ℝ) ≤ (e : ℝ) := by exact_mod_cast he
    have h2 : (1 : ℝ) ≤ (Module.finrank ℚ L : ℝ) := by exact_mod_cast hn
    nlinarith
  · rcases Nat.eq_zero_or_pos (discr L).natAbs with h0 | h0
    · rw [h0]
      simp
    · apply Real.log_nonneg
      have : (1 : ℝ) ≤ ((discr L).natAbs : ℝ) := by exact_mod_cast h0
      linarith

private theorem shaOne39 (CK : ℝ) (hK : ShaK CK) (l : ℕ) [Fact l.Prime]
    (L Ω : Type) [Field L] [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
    (D : LData L Ω l) (hMu : HasMuQ l L) :
    shaLen D ((1 : ℕ) : ℤ) ≠ ⊤ ∧
      ((shaLen D ((1 : ℕ) : ℤ)).toNat : ℝ) ≤ 2 * kBound CK 1 (Module.finrank ℚ L) (discr L).natAbs := by
  obtain ⟨s, hs, hb⟩ := hK l L (isTotallyComplex_of_hasMuQ39 l L hMu) hMu 1 le_rfl
  rw [LDataCardLeFinrank.shaLen_eq_shaInv, hs]
  refine ⟨ENat.coe_ne_top _, ?_⟩
  rw [ENat.toNat_coe]
  have hl2 : (2 : ℝ) ≤ l := by exact_mod_cast (Fact.out : l.Prime).two_le
  have hlogl : (1 / 2 : ℝ) ≤ Real.log l := by
    have h1 : Real.log 2 ≤ Real.log l := Real.log_le_log (by norm_num) hl2
    have h2 := Real.log_two_gt_d9
    linarith
  have hs0 : (0 : ℝ) ≤ s := Nat.cast_nonneg _
  nlinarith [mul_le_mul_of_nonneg_left hlogl hs0]

theorem UpperTheory.V.HV.countVs_of_sha39 :
    ∀ CK : ℝ, ShaK CK → CountVs := by
  intro CK hK χ
  obtain ⟨M, hM⟩ : ∃ M : ℕ, M = (Bchi χ).sup id := ⟨_, rfl⟩
  obtain ⟨n0, hn0⟩ : ∃ n0 : ℕ, n0 = 2 * ordC χ * (16 * ordC χ * (M * χ.N) ^ 2 * M ^ (2 * (4 * ordC χ).totient)) * M :=
    ⟨_, rfl⟩
  have hK' : ShaK (⌈CK⌉₊ : ℝ) := shaMono39 CK _ (Nat.le_ceil CK) hK
  refine ⟨(2 * n0) ^ ⌈CK⌉₊ * (n0 + 1) + n0 + 3, ?_⟩
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
  have hkl := shaOne39 _ hK' l L Ω D hMu
  obtain ⟨m1, hm1⟩ : ∃ m1 : ℕ, shaLen D ((1 : ℕ) : ℤ) = m1 := ⟨_, (ENat.coe_toNat hkl.1).symm⟩
  have hup := Chr.upV ℚ Ω L l c.O D 1 (Chr.dirG ℚ Ω ψ) hgal Finset.univ hT
  have hh0 := (Chr.H0_local_card_bounded_of_cls_ker_le_ker Ω l c.O h.N 1 (Chr.dirG ℚ Ω ψ) one_ne_zero hclsker).2
  have heO : eO l c.O ≠ ⊤ := ne_top_of_le_ne_top (ENat.coe_ne_top _) (dvrFacts l c.O).2.2.2.2.2.2.1
  have hV : Vlen Ω c 1 ψ ≤ ((m1 + (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card *
      LDataCardLeFinrank.nuBound l h.N 1 : ℕ) : ℕ∞) * eO l c.O := by
    calc Vlen Ω c 1 ψ ≤ Chr.V l 1 (Chr.dirG ℚ Ω ψ) := Chr.V'_le_V (k := ℚ) (Ω := Ω) l h.N 1 (Chr.dirG ℚ Ω ψ)
      _ ≤ _ := hup
      _ ≤ shaLen D ((1 : ℕ) : ℤ) * eO l c.O + ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℕ∞) *
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
  have hkb := kBound_le ⌈CK⌉₊ (Module.finrank ℚ L) n0 (discr L).natAbs ((l : ℝ) * h.N) hx2 hdegn hD hlogD
  have hnu : LDataCardLeFinrank.nuBound l h.N 1 ≤ 2 * h.N * 1 := (lossLe l h.N 0 1 hlp hl2 hN2 (Nat.zero_le _) le_rfl).2
  have hv : Vn Ω c 1 ψ ≤ 2 * ((l : ℝ) * h.N) ^ ((2 * n0) ^ ⌈CK⌉₊ * (n0 + 1)) + n0 * (2 * (h.N : ℝ)) := by
    have hc1 : ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℝ) ≤ n0 := by exact_mod_cast hcard
    have hc2 : (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) ≤ 2 * h.N := by
      have : (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) ≤ ((2 * h.N * 1 : ℕ) : ℝ) := by exact_mod_cast hnu
      push_cast at this
      linarith
    have hc3 : (m1 : ℝ) ≤ 2 * kBound (⌈CK⌉₊ : ℝ) 1 (Module.finrank ℚ L) (discr L).natAbs := by
      have := hkl.2
      rw [hm1, ENat.toNat_coe] at this
      exact this
    calc Vn Ω c 1 ψ ≤ ((m1 + (Finset.univ : Finset (L ≃ₐ[ℚ] L)).card *
          LDataCardLeFinrank.nuBound l h.N 1 : ℕ) : ℝ) := hnrm
      _ = (m1 : ℝ) + ((Finset.univ : Finset (L ≃ₐ[ℚ] L)).card : ℝ) *
          (LDataCardLeFinrank.nuBound l h.N 1 : ℝ) := by push_cast; ring
      _ ≤ 2 * kBound (⌈CK⌉₊ : ℝ) 1 (Module.finrank ℚ L) (discr L).natAbs + n0 * (2 * (h.N : ℝ)) := by
          gcongr
      _ ≤ _ := by linarith
  have hl1 : (1 : ℝ) ≤ l := by exact_mod_cast hlp.one_lt.le
  have hy0 : 0 ≤ Real.log (l : ℝ) := Real.log_nonneg hl1
  have hyl : Real.log (l : ℝ) ≤ l := (Real.log_le_sub_one_of_pos (by linarith)).trans (by linarith)
  have hfin := final_le ((2 * n0) ^ ⌈CK⌉₊ * (n0 + 1)) n0 ((l : ℝ) * h.N) (Vn Ω c 1 ψ) (Real.log l) l h.N
    hl1 (by exact_mod_cast hN2) rfl hy0 hyl hv
  simpa using hfin

namespace UpperTheory.V.HV

theorem pointHV_with_vs39 (hVs : CountVs) (h1 : CountI) (h2 : CountII)
    (h3 : CountIII) (h5 : CountV) (hZ : CountZ) : PointHV :=
  point (sumIn h2 h5 hVs countIV) (sumOut h1 hZ h2 h3)

theorem vwin_with_vs39 (hVs : CountVs) {K : BConst} (hB : ThmBab K 401)
    (hc : ThmBcFree) (h1 : CountI) (h2 : CountII) (h3 : CountIII) (h5 : CountV)
    (hZ : CountZ) : VWin :=
  vwin_of_joint (jointWin_of (by norm_num) hB
    (thmHV (pointHV_with_vs39 hVs h1 h2 h3 h5 hZ) K 401 (by norm_num)))
    ((thmBc_iff (by norm_num)).2 hc)

theorem vwin_of_counts_sha39 (hSha : ∃ CK : ℝ, ShaK CK) {K : BConst}
    (hB : ThmBab K 401) (hc : ThmBcFree) (h1 : CountI) (h2 : CountII)
    (h3 : CountIII) (h5 : CountV) (hZ : CountZ) : VWin := by
  obtain ⟨CK, hK⟩ := hSha
  apply vwin_with_vs39 (K := K) _ hB hc h1 h2 h3 h5 hZ
  first
  | (rh_reduce 2 using [countVs_of_sha39]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countVs_of_sha39 CK hK

end UpperTheory.V.HV

rh_prune UpperTheory.V.HV.countVs as UpperTheory.V.HV.CountVsNativePruned39
rh_prune UpperTheory.V.HV.countVs_of_sha39 as UpperTheory.V.HV.CountVsShaPruned39
rh_scan UpperTheory.V.HV.countVs limit 2000
rh_scan UpperTheory.V.HV.countVs_of_sha39 limit 2000
rh_scan UpperTheory.V.HV.vwin_of_counts limit 2000
rh_scan UpperTheory.V.HV.vwin_of_counts_sha39 limit 2000
#print axioms UpperTheory.V.HV.countVs
#print axioms UpperTheory.V.HV.countVs_of_sha39
#print axioms UpperTheory.V.HV.vwin_of_counts_sha39
