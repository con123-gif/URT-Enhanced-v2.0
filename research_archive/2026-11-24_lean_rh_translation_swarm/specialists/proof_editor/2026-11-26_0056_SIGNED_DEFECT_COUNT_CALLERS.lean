import RH42NativeSignedDefectIdentity
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN43, 26 November 2026. SOURCE-MATCHED HUMAN / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (mandatory pipeline), AGENTS,
SWARM, HANDOFF, EXPANSION and living proof consulted; latest peer commits
75e75229 geometry (selected SW mean), cdd5e8d1 theta (one rectangle),
cd8a9fa9 audit, 5de3d09c literature, 49cea008 Galois, ad6e9dab structure,
65a89b19 Landau read. No merging their uncompiled overlays.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
LinkMin.lean b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f.
Prior editor RUN42 c9fdbd7745f4a3200e71baf666cbf704befdda35,
blob 9b90d7940cb6d1d4fb281a5667db30e024cc9aa2.
For native replay stage that exact prior file as RH42NativeSignedDefectIdentity.lean
and compile it first with the existing engine modules. No claimed import of RH.

NEW: actual caller propagation of prior signed defect, not a new equality
or a proved volume interval. Let F=f*k, d=raw log defect, delta=d/F.
Native RowsA gives log(2v_host)<=L directly (r1), so the lower count
does not need a separate estimate of log(2*pi). With m>=44, k>=m,
L>=9, lower identity minus F*lowS after cancelling weights and g:
  volume term >= -F*L, negative log(2v_host) term >= -F*L/2,
  L-values >= -F, split indices >= -F/4,
  Vandermonde minus weights >= -F*(7L+5/4).
Hence F*(X-lowS) >= F*(5L/2-5/2)+d >= F*(L/2-5/2)>=0
if d>=-2FL. Upper: first coefficient <=3Fm/2, g coefficient <=3Fm/2,
log(2v_host)>=0, g<=2CY L, L-values <= F, split indices <=0,
Vandermonde <= F*m*(12+12L). Thus
  X <= (13.5+3CY)mL+12m+1+delta
    <= (15+3CY)mL
if delta<=m, since 1.5*m*L>=13*m+1.
Both use the actual same D, sc and all words, with no new choice.
The lower eventual threshold gains only L>=9, already in upper.
Both modified proof bodies retain native gap, rank, weight, index,
sigma-degree and L-value suppliers; the family wrapper reuses the
same eventual uniform budget at both callers, and calls the existing
part_five_explicit_of_propositions and vandermonde_variation_holds.
The independent exact-mass or mass-error consumers elsewhere remain.
No claim the raw defect interval or any RH-scale estimate is proved.

Original source-visible graph:
division_level_prime_family -> ramified_rank_lines_of_free,
part_five_family_of_mass_volume -> family_of_global_statements ->
MassRatio2, BaseVolumeEqualsMass, other scalar suppliers.
Candidate overlay: rh43_division_level_prime_family -> rh43_lower_eventually,
rh43_upper_eventually -> RH43Budget + rh42_signed_identity +
unchanged native scalar suppliers; retain all type/value/constructor
edges, other exact mass consumers, original fallback and unresolved axioms.
Cache pin,toolchain,Fm,D,sc,k,m,r,f,word,host,volY0,ratioH,consumer.
Backtrack on failed replay. No root retirement, no URT claim.
Baseline CI status JSON 45577239749 and 45576756833 retrieved again
(status pass, returncode 0); not evidence for this file. Local Lean/Lake
not on PATH. Prior axiom evidence propext, Classical.choice, Quot.sound;
324 scan nodes pending. No new kernel axiom claim.
Source guarded replacements executed: 29 assertions, all matched.
These are source-text checks, not kernel checking. Scalar inequalities
derived by exact elementary algebra, no finite-to-infinite inference.

RESUME HERE: stage RUN42 and RUN43 in pinned native environment and
check actual family wrapper, including guards and axiom ledger; prove
RH43FamilyBudget from selected SW mean or one-rectangle Tamagawa or
a direct bounded endpoint estimate. Retain other exact-mass consumers,
uniform CountI/II/Vs, same-host Sha/TopG/J/VWin and prime inequality.
HANDOFF TO integration, geometry, theta, kernel, audit.
-/

noncomputable section
namespace Formalism.MainNotions.StandardLattice
open NumberField Formalism.BasicNotions Finset

def RH43Budget (D : D7) (sc : Scale) : Prop :=
  0 < volY0 D ∧
  -2 * sc.L * ((D.R.f : ℝ) * D.R.k) ≤ RH42MassLogDefect D ∧
  RH42MassLogDefect D ≤ (D.R.m : ℝ) * ((D.R.f : ℝ) * D.R.k)

def RH43FamilyBudget {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps) : Prop :=
  ∃ x0 : ℝ, ∀ x, x0 ≤ x → Fm.x1 < x → ∀ i : Fm.Ix x,
    RH43Budget (Fm.D x i) (Fm.L x i).sc

theorem rh43_lower (D : D7) (sc : Scale) (C0 CY : ℝ)
    (hx : 2 * (Real.log 8 + 1 + Real.log sc.x) ≤ sc.L)
    (hL9 : 9 ≤ sc.L) (hbudget : RH43Budget D sc) (h3 : SigmaDegreeTwoSidedBoundOfGap D) (hgap : ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
      ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3)))
    (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ) (hA : DataA D sc C0 CY Δ w) (u : D.what₂.Word) :
    lowS D sc w ≤ logXuD D u := by
  let _ := D.host.cmStar
  obtain ⟨hB, r1, r2, r3, r4, r5, r6, -, -⟩ := hA
  have hk := D.R.k_ge
  have hm := D.R.two_le_m
  have hL := scale_one_le_L sc
  have hx0 : 0 < sc.x := lt_trans one_pos sc.one_lt_alt
  have hpi : Real.pi ≤ D.host.v := hB.1
  have hv0 : 0 < D.host.v := lt_of_lt_of_le Real.pi_pos hpi
  have er : D.R.r = D.R.k + (D.R.m - 1) := by have := D.R.r_eq; omega
  have hF : (1 : ℝ) ≤ D.R.f := by exact_mod_cast (degree_pos_alt D)
  have hM : (44 : ℝ) ≤ D.R.m := by exact_mod_cast r3
  have hMK : (D.R.m : ℝ) ≤ D.R.k := by exact_mod_cast r4
  have hK0 : (0 : ℝ) ≤ D.R.k := Nat.cast_nonneg _

  have he : Real.exp (-(D.R.r : ℝ)) ≤ 1 / 3 := by
    have hr : (2 : ℝ) ≤ D.R.r := by exact_mod_cast (by omega : 2 ≤ D.R.r)
    have h1 : (D.R.r : ℝ) + 1 ≤ Real.exp (D.R.r : ℝ) := Real.add_one_le_exp _
    rw [Real.exp_neg, one_div]
    exact inv_anti₀ (by norm_num) (by linarith)
  have hd : ∀ ρ, (2 / 3 : ℝ) * dimV (rowLam D ρ) ≤ D.dsig ρ := by
    intro ρ
    have := (h3 (1 / 3) he (by norm_num) ρ
      (fun a b hab => le_trans (explicit_gap_le_general_gap D 8192 (1 / 3) le_rfl) (hgap Δ w hB ρ a b hab))).1
    have e : (1 - 1 / 3 : ℝ) = 2 / 3 := by norm_num
    rwa [e] at this

  have hSL : -((D.R.f : ℝ) * ((D.R.m : ℝ) - 1)) ≤
      ∑ M ∈ Ioc D.R.k D.R.r, Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) := by
    have e1 : ∀ M ∈ Ioc D.R.k D.R.r, -(D.R.f : ℝ) ≤ Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) := by
      intro M hM
      have hM2 : 2 ≤ M := by have := (Finset.mem_Ioc.1 hM).1; omega
      have a := massIdentity_holds D M hM2
      have b := Formalism.LogVandermondeBounds.StandardLattice.log_zetaR_le_one M hM2
      rw [← zetaR_eq] at b
      have c : (D.R.f : ℝ) * Real.log (zetaR M) ≤ D.R.f * 1 := mul_le_mul_of_nonneg_left b (by linarith)
      have := (abs_le.1 a).1
      linarith
    have e2 := Finset.card_nsmul_le_sum _ _ _ e1
    rw [Nat.card_Ioc, nsmul_eq_mul] at e2
    have e3 : ((D.R.r - D.R.k : ℕ) : ℝ) = (D.R.m : ℝ) - 1 := by
      rw [er, Nat.add_sub_cancel_left, Nat.cast_sub (by omega : 1 ≤ D.R.m)]
      simp
    rw [e3] at e2
    linarith

  have hSG : -2 ≤ ∑ i : Fin 2, ∑ j ∈ Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
    have e1 : ∀ i : Fin 2, -1 ≤ ∑ j ∈ Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
      intro i
      have hg2 : 2 ≤ D.host.g i := (D.host.g_prime i).two_le
      rw [← Real.log_prod (fun j hj => (one_sub_inv_pow_pos _ hg2 j (by have := (Finset.mem_Ioc.1 hj).1; omega)).ne')]
      have hs := piN_split D.R.k (D.R.m - 1) (D.host.g i)
      rw [← er] at hs
      have hp := piN_pos D.R.k (D.host.g i) hg2
      have hq := ((local_index_formulas_and_bounds D).1 i).2.2.1
      rw [hs, mul_div_cancel_left₀ _ hp.ne'] at hq
      have hg4 : (4 : ℝ) ≤ (D.host.g i : ℝ) ^ (D.R.k + 1) := by
        have h2 : (2 : ℝ) ≤ D.host.g i := by exact_mod_cast hg2
        calc (4 : ℝ) = 2 ^ 2 := by norm_num
          _ ≤ 2 ^ (D.R.k + 1) := pow_le_pow_right₀ (by norm_num) (by omega)
          _ ≤ _ := pow_le_pow_left₀ (by norm_num) h2 _
      have hinv : ((D.host.g i : ℝ) ^ (D.R.k + 1))⁻¹ ≤ (4 : ℝ)⁻¹ := inv_anti₀ (by norm_num) hg4
      have hhalf : (1 / 2 : ℝ) ≤ ∏ j ∈ Ioc D.R.k D.R.r, (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
        norm_num at hinv ⊢
        linarith
      have h5 := Real.log_le_log (by norm_num) hhalf
      have l3 : -1 ≤ Real.log (1 / 2 : ℝ) := by
        rw [one_div, Real.log_inv]
        have := Real.log_two_lt_d9
        linarith
      linarith
    rw [Fin.sum_univ_two]
    linarith [e1 0, e1 1]

  have l23 : -1 ≤ Real.log (2 / 3 : ℝ) := by
    rw [Real.le_log_iff_exp_le (by norm_num), Real.exp_neg]
    have h1 : (1 : ℝ) + 1 ≤ Real.exp 1 := Real.add_one_le_exp _
    have : (Real.exp 1)⁻¹ ≤ (2 : ℝ)⁻¹ := inv_anti₀ (by norm_num) (by linarith)
    norm_num at this ⊢
    linarith
  have hSPW : (D.R.f : ℝ) * (-1 - 5 * D.R.k * sc.L - ((D.R.k : ℝ) + 2 * D.R.k * sc.L)) ≤
      (∑ ρ, Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ))) -
        (D.R.k : ℝ) * ∑ ρ, ∑ j ∈ range D.R.m, Real.log (w j ρ) := by
    have e1 : ∀ ρ ∈ (Finset.univ : Finset D.what₂.Tau),
        (-1 - 5 * D.R.k * sc.L - ((D.R.k : ℝ) + 2 * D.R.k * sc.L)) ≤
        Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) -
          (D.R.k : ℝ) * ∑ j ∈ range D.R.m, Real.log (w j ρ) := by
      intro ρ _
      have a := place_dimension_lower_bound D sc C0 Δ w hB r6 hx u ρ (hd ρ)
      have b : (D.R.k : ℝ) * ∑ j ∈ range D.R.m, Real.log (w j ρ) -
          ((D.R.k : ℝ) - 1) * ∑ j ∈ range D.R.m, Real.log (bN D ρ j) ≤
          (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x + 2 * sc.L) := by
        rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
        have := Finset.sum_le_card_nsmul (range D.R.m) _ _
          (fun j hj => log_weight_minus_log_b_bound D sc C0 Δ w hB ρ j (Finset.mem_range.1 hj))
        rwa [Finset.card_range, nsmul_eq_mul] at this
      have c : (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x + 2 * sc.L) ≤ (D.R.k : ℝ) + 2 * D.R.k * sc.L := by
        have c0 : (D.R.m : ℝ) / sc.x ≤ 1 := (div_le_one hx0).2 r5
        have c1 : (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x) ≤ D.R.k := by
          calc (D.R.m : ℝ) * ((D.R.k : ℝ) / sc.x) = (D.R.k : ℝ) * ((D.R.m : ℝ) / sc.x) := by ring
            _ ≤ (D.R.k : ℝ) * 1 := mul_le_mul_of_nonneg_left c0 hK0
            _ = D.R.k := mul_one _
        have c2 : (D.R.m : ℝ) * (2 * sc.L) ≤ (D.R.k : ℝ) * (2 * sc.L) :=
          mul_le_mul_of_nonneg_right hMK (by linarith)
        linarith
      linarith
    have e2 := Finset.card_nsmul_le_sum _ _ _ e1
    rw [Finset.card_univ, D.what₂.card_Tau, nsmul_eq_mul, Finset.sum_sub_distrib, ← Finset.mul_sum] at e2
    exact e2

  have hg0 : ∀ i, (0 : ℝ) < (D.host.g i : ℝ) := fun i => by exact_mod_cast (D.host.g_prime i).pos
  have eG : Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) = ∑ i : Fin 2, Real.log (D.host.g i : ℝ) := by
    rw [Fin.sum_univ_two, Real.log_mul (hg0 0).ne' (hg0 1).ne']
  have hid := rh42_signed_identity D hbudget.1 u
  have hraw := hbudget.2.1
  rw [eG] at hid

  have hFne : (D.R.f : ℝ) ≠ 0 := by linarith
  have hlo : (D.R.f : ℝ) * D.R.k * lowS D sc w =
      (D.R.k : ℝ) * (∑ ρ, ∑ j ∈ range D.R.m, Real.log (w j ρ)) +
        (D.R.f : ℝ) * D.R.k * D.R.m * Real.log (D.host.v / Real.pi) +
        (D.R.f : ℝ) * D.R.k * D.R.m * (∑ i : Fin 2, Real.log (D.host.g i : ℝ)) -
        11 * (D.R.f : ℝ) * D.R.k * sc.L := by
    have e1 : ∀ j ∈ range D.R.m, (1 / (D.R.f : ℝ)) * ∑ ρ, Real.log (w j ρ * D.host.v / Real.pi) =
        (1 / (D.R.f : ℝ)) * (∑ ρ, Real.log (w j ρ)) + Real.log (D.host.v / Real.pi) := by
      intro j hj
      have hj' := Finset.mem_range.1 hj
      have e0 : ∀ ρ ∈ (Finset.univ : Finset D.what₂.Tau), Real.log (w j ρ * D.host.v / Real.pi) =
          Real.log (w j ρ) + Real.log (D.host.v / Real.pi) := by
        intro ρ _
        have hw : 0 < w j ρ := lt_of_lt_of_le one_pos (weights_ge_one_section_B D sc C0 Δ w hB ρ j hj')
        rw [mul_div_assoc, Real.log_mul hw.ne' (div_pos hv0 Real.pi_pos).ne']
      rw [Finset.sum_congr rfl e0, Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
        D.what₂.card_Tau, nsmul_eq_mul]
      field_simp
    unfold lowS
    rw [Finset.sum_congr rfl e1, Finset.sum_add_distrib, Finset.sum_const, Finset.card_range, nsmul_eq_mul,
      ← Finset.mul_sum, Finset.sum_comm]
    field_simp
  have hlv0 : 0 ≤ Real.log (D.host.v / Real.pi) :=
    Real.log_nonneg ((one_le_div Real.pi_pos).2 hpi)
  have hlv : Real.log (D.host.v / Real.pi) ≤ sc.L := by
    rw [Real.log_div hv0.ne' Real.pi_pos.ne']
    have : 0 ≤ Real.log Real.pi := Real.log_nonneg (by have := Real.pi_gt_three; linarith)
    linarith [hB.2.1]
  have hG : 0 ≤ ∑ i : Fin 2, Real.log (D.host.g i : ℝ) :=
    Finset.sum_nonneg fun i _ => Real.log_nonneg (by exact_mod_cast (D.host.g_prime i).one_lt.le)
  -- The same native r1 gives log(2v) <= L, so no extra log(2*pi) estimate.
  have hf0 : (0 : ℝ) ≤ D.R.f := by linarith
  have hm0 : (0 : ℝ) ≤ (D.R.m : ℝ) - 1 := by linarith
  have hk0 : (0 : ℝ) < D.R.k := by linarith
  have hF0 : 0 < (D.R.f : ℝ) * D.R.k := mul_pos (by linarith) hk0
  have hkM : (D.R.m : ℝ) - 1 ≤ D.R.k := by linarith
  have hA0 : 0 ≤ (D.R.f : ℝ) * ((D.R.m : ℝ) * ((D.R.m : ℝ) - 1) / 2) :=
    mul_nonneg hf0 (div_nonneg (mul_nonneg (by linarith) hm0) (by norm_num))
  have hV := mul_le_mul_of_nonneg_left hlv hF0.le
  have hVextra := mul_nonneg hA0 hlv0
  have hB0 : 0 ≤ (D.R.f : ℝ) * (((D.R.m : ℝ) - 1) / 2) :=
    mul_nonneg hf0 (div_nonneg hm0 (by norm_num))
  have hB1 : (D.R.f : ℝ) * (((D.R.m : ℝ) - 1) / 2) ≤ (D.R.f : ℝ) * D.R.k / 2 := by
    nlinarith only [mul_le_mul_of_nonneg_left hkM hf0]
  have hB2 := mul_le_mul_of_nonneg_left r1 hB0
  have hB3 := mul_le_mul_of_nonneg_right hB1 (show 0 ≤ sc.L by linarith)
  have hGextra := mul_nonneg hA0 hG
  have hLextra := mul_le_mul_of_nonneg_left hkM hf0
  have hS1 := mul_le_mul_of_nonneg_left hSG hf0
  have hS2 := mul_nonneg hf0 (show 0 ≤ (D.R.k : ℝ) / 4 - 2 by linarith)
  have hPextra := mul_nonneg hf0 (show 0 ≤ (D.R.k : ℝ) / 4 - 1 by linarith)
  have hslack := mul_nonneg hF0.le (show 0 ≤ sc.L / 2 - 5 / 2 by linarith)
  apply (mul_le_mul_left hF0).mp
  nlinarith only [hid, hlo, hV, hVextra, hB2, hB3, hGextra, hLextra, hSL,
    hS1, hS2, hSPW, hPextra, hslack, hraw]

theorem rh43_lower_eventually (eps C0 CY : ℝ) (heps : 0 < eps) :
    ∃ x0 : ℝ, ∀ (D : D7) (sc : Scale), sc.eps = eps → x0 ≤ sc.x → RH43Budget D sc → SigmaDegreeTwoSidedBoundOfGap D →
      (∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
        ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3))) → ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataA D sc C0 CY Δ w → ∀ u : D.what₂.Word,
        lowS D sc w ≤ logXuD D u := by
  have h1 := (isLittleO_log_rpow_atTop heps).bound (show (0 : ℝ) < 1 / 4 by norm_num)
  have h2 := (tendsto_rpow_atTop heps).eventually_ge_atTop (max 9 (4 * (Real.log 8 + 1)))
  obtain ⟨x0, hx0⟩ := Filter.eventually_atTop.1 (h1.and h2)
  refine ⟨x0, fun D sc he hx hbudget h3 h4B Δ w hA u => ?_⟩
  obtain ⟨a, b⟩ := hx0 sc.x hx
  have hL : sc.L = sc.x ^ eps := by unfold Scale.L; rw [he]
  have hpos : 0 ≤ sc.x ^ eps := Real.rpow_nonneg (lt_trans one_pos sc.one_lt_alt).le _
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg hpos] at a
  have a' := le_trans (le_abs_self _) a
  have b1 := le_of_max_le_left b
  have b2 := le_of_max_le_right b
  exact rh43_lower D sc C0 CY (by rw [hL]; linarith) (by rw [hL]; exact b1) hbudget h3 h4B Δ w hA u

theorem rh43_upper_eventually (eps C0 CY : ℝ) (heps : 0 < eps) :
    ∃ x0 : ℝ, ∀ (D : D7) (sc : Scale), sc.eps = eps → x0 ≤ sc.x → RH43Budget D sc → SigmaDegreeTwoSidedBoundOfGap D →
      (∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
        ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3))) → ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataA D sc C0 CY Δ w → ∀ u : D.what₂.Word,
        logXuD D u ≤ (15 + 3 * CY) * D.R.m * sc.L := by
  obtain ⟨x0, hx0⟩ := Filter.eventually_atTop.1 ((tendsto_rpow_atTop heps).eventually_ge_atTop 9)
  refine ⟨x0, fun D sc he hx hbudget h3 h4B Δ w hA u => ?_⟩
  let _ := D.host.cmStar
  have hL9 : 9 ≤ sc.L := by unfold Scale.L; rw [he]; exact hx0 sc.x hx
  obtain ⟨hB, r1, r2, r3, r4, r5, r6, -, -⟩ := hA
  have hgap := h4B Δ w hB
  have id := rh42_signed_identity D hbudget.1 u
  have hraw := hbudget.2.2
  have hkN := D.R.k_ge
  have hmN := D.R.two_le_m
  have er : D.R.r = D.R.k + D.R.m - 1 := rfl
  have hk5 : (5 : ℝ) ≤ D.R.k := by exact_mod_cast hkN
  have hm44 : (44 : ℝ) ≤ D.R.m := by exact_mod_cast r3
  have hmk : (D.R.m : ℝ) ≤ D.R.k := by exact_mod_cast r4
  have hf : (0 : ℝ) < D.R.f := by exact_mod_cast degree_pos_alt D
  have hv := host_v_pos D
  have hpi := hB.1
  have hpi3 : (3 : ℝ) < Real.pi := Real.pi_gt_three

  have hlv0 : 0 ≤ Real.log (D.host.v / Real.pi) := Real.log_nonneg ((one_le_div Real.pi_pos).2 hpi)
  have hlv : Real.log (D.host.v / Real.pi) ≤ sc.L := by
    refine le_trans (Real.log_le_log (div_pos hv Real.pi_pos) ?_) hB.2.1
    rw [div_le_iff₀ Real.pi_pos]; nlinarith
  have h2v0 : 0 ≤ Real.log (2 * D.host.v) := Real.log_nonneg (by linarith)

  have hcard : ((Finset.Ioc D.R.k D.R.r).card : ℝ) ≤ D.R.m := by
    rw [Nat.card_Ioc]; exact_mod_cast (by omega : D.R.r - D.R.k ≤ D.R.m)
  have hSL : ∑ M ∈ Finset.Ioc D.R.k D.R.r, Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) ≤ (D.R.f : ℝ) * D.R.m := by
    have h1 : ∀ M ∈ Finset.Ioc D.R.k D.R.r, Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M) ≤ (D.R.f : ℝ) := by
      intro M hM
      have hM2 : 2 ≤ M := by have := (Finset.mem_Ioc.1 hM).1; omega
      have a := massIdentity_holds D M hM2
      have b := Formalism.LogVandermondeBounds.StandardLattice.log_zetaR_le_one M hM2
      rw [← zetaR_eq] at b
      have c := mul_le_mul_of_nonneg_left b hf.le
      linarith [le_abs_self (Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M))]
    have h2 := Finset.sum_le_card_nsmul _ _ _ h1
    rw [nsmul_eq_mul] at h2
    have h3 := mul_le_mul_of_nonneg_right hcard hf.le
    linarith

  have hg1 : ∀ i, (1 : ℝ) ≤ (D.host.g i : ℝ) := fun i => by exact_mod_cast (D.host.g_prime i).one_lt.le
  have elg : Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) =
      Real.log (D.host.g 0 : ℝ) + Real.log (D.host.g 1 : ℝ) :=
    Real.log_mul (by linarith [hg1 0]) (by linarith [hg1 1])
  have hlg0 : 0 ≤ Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) := by
    rw [elg]; linarith [Real.log_nonneg (hg1 0), Real.log_nonneg (hg1 1)]
  have hlg : Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) ≤ 2 * CY * sc.L := by
    rw [elg]; linarith [r2 0, r2 1]
  have hS5 : ∑ i : Fin 2, ∑ j ∈ Finset.Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) ≤ 0 := by
    refine Finset.sum_nonpos fun i _ => Finset.sum_nonpos fun j hj => ?_
    have hj1 : 1 ≤ j := by have := (Finset.mem_Ioc.1 hj).1; omega
    have p := one_sub_inv_pow_pos (D.host.g i) (D.host.g_prime i).two_le j hj1
    refine Real.log_nonpos p.le ?_
    have : 0 ≤ ((D.host.g i : ℝ) ^ j)⁻¹ := by positivity
    linarith

  have hl3 : Real.log 3 ≤ 2 := by
    have := Real.log_le_sub_one_of_pos (show (0 : ℝ) < 3 by norm_num); linarith
  have hrR : (D.R.r : ℝ) ≤ 2 * D.R.k := by
    have : D.R.r ≤ 2 * D.R.k := by omega
    exact_mod_cast this
  have hr1 : (1 : ℝ) ≤ D.R.r := by exact_mod_cast (by omega : 1 ≤ D.R.r)
  have hlr : Real.log (D.R.r : ℝ) ≤ sc.L := le_trans (Real.log_le_log (by linarith) hrR) r6
  have hlr0 : 0 ≤ Real.log (D.R.r : ℝ) := Real.log_nonneg hr1
  have hrlr : (D.R.r : ℝ) * Real.log (D.R.r : ℝ) ≤ 2 * D.R.k * sc.L :=
    mul_le_mul hrR hlr hlr0 (by linarith)
  have hrk : ((D.R.r - D.R.k : ℕ) : ℝ) ≤ D.R.m := by exact_mod_cast (by omega : D.R.r - D.R.k ≤ D.R.m)
  have hS6 : ∑ ρ, Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) ≤
      (D.R.f : ℝ) * ((D.R.k : ℝ) * D.R.m * (2 + 5 * sc.L + 5 * sc.L + 10) + D.R.m * (2 * D.R.k * sc.L)) := by
    have h1 : ∀ ρ ∈ (Finset.univ : Finset D.what₂.Tau),
        Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) ≤
          (D.R.k : ℝ) * D.R.m * (2 + 5 * sc.L + 5 * sc.L + 10) + D.R.m * (2 * D.R.k * sc.L) := by
      intro ρ _
      have hdim := dim_weyl_pos_of_strictAnti _ (column_param_strictAnti D u ρ)
      have hV : 0 < vand (uColR D u ρ) := by
        unfold dimV at hdim
        exact (div_pos_iff_of_pos_right (facProd_pos' _)).1 hdim
      have e1 : Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) =
          (Real.log (D.dsig ρ) - Real.log (dimV (uColR D u ρ))) +
            (Real.log (facProd D.R.r) - Real.log (facProd D.R.k)) := by
        unfold dimV
        rw [Real.log_div (mul_pos (D.dsig_pos ρ) (facProd_pos' _)).ne' hV.ne',
          Real.log_mul (D.dsig_pos ρ).ne' (facProd_pos' _).ne',
          Real.log_div hV.ne' (facProd_pos' _).ne']
        ring
      rw [e1]
      have a := place_dimension_upper_bound D sc C0 Δ w hB h3 hgap u ρ
      have b := log_factorial_product_difference D.R.k D.R.r (by omega) (by omega)
      have hkm : 0 ≤ (D.R.k : ℝ) * D.R.m := by positivity
      have a' : (D.R.k : ℝ) * D.R.m * (Real.log 3 + 5 * Real.log (2 * D.R.k) + 5 * sc.L + 10) ≤
          (D.R.k : ℝ) * D.R.m * (2 + 5 * sc.L + 5 * sc.L + 10) :=
        mul_le_mul_of_nonneg_left (by linarith) hkm
      have b' : ((D.R.r - D.R.k : ℕ) : ℝ) * ((D.R.r : ℝ) * Real.log (D.R.r : ℝ)) ≤
          D.R.m * (2 * D.R.k * sc.L) :=
        mul_le_mul hrk hrlr (mul_nonneg (by linarith) hlr0) (by linarith)
      linarith
    have h2 := Finset.sum_le_card_nsmul _ _ _ h1
    rw [Finset.card_univ, D.what₂.card_Tau, nsmul_eq_mul] at h2
    exact h2
  have hF0 : 0 < (D.R.f : ℝ) * D.R.k := mul_pos hf (by linarith)
  have hm0 : 0 ≤ (D.R.m : ℝ) := by linarith
  have hm1 : 0 ≤ (D.R.m : ℝ) - 1 := by linarith
  have hk0 : 0 ≤ (D.R.k : ℝ) := by linarith
  have hC1 : 0 ≤ ((D.R.m : ℝ) - 1) * D.R.k + (D.R.m : ℝ) * ((D.R.m : ℝ) - 1) / 2 := by positivity
  have hC2 : ((D.R.m : ℝ) - 1) * D.R.k + (D.R.m : ℝ) * ((D.R.m : ℝ) - 1) / 2 ≤
      3 / 2 * (D.R.k : ℝ) * D.R.m := by
    nlinarith only [mul_nonneg hk0 (show (0 : ℝ) ≤ 1 by norm_num),
      mul_le_mul_of_nonneg_left (show (D.R.m : ℝ) - 1 ≤ D.R.k by linarith) hm0]
  have hC3 := mul_le_mul_of_nonneg_left hC2 hf.le
  have hV1 := mul_le_mul_of_nonneg_left hlv (mul_nonneg hf.le hC1)
  have hV2 := mul_le_mul_of_nonneg_right hC3 (show 0 ≤ sc.L by linarith)
  have hVneg := mul_nonneg (mul_nonneg hf.le (div_nonneg hm1 (by norm_num))) h2v0
  have hGC0 : 0 ≤ (D.R.f : ℝ) * ((D.R.m : ℝ) * (2 * D.R.k + D.R.m - 1) / 2) :=
    mul_nonneg hf.le (div_nonneg (mul_nonneg hm0 (by linarith)) (by norm_num))
  have hGC1 : (D.R.m : ℝ) * (2 * D.R.k + D.R.m - 1) / 2 ≤ 3 / 2 * (D.R.k : ℝ) * D.R.m := by
    nlinarith only [mul_le_mul_of_nonneg_left (show 2 * (D.R.k : ℝ) + D.R.m - 1 ≤ 3 * D.R.k by linarith) hm0]
  have hGC2 := mul_le_mul_of_nonneg_left hGC1 hf.le
  have hG1 := mul_le_mul_of_nonneg_left hlg hGC0
  have hG2 := mul_le_mul_of_nonneg_right hGC2 (show 0 ≤ 2 * CY * sc.L by linarith)
  have hSL2 := mul_le_mul_of_nonneg_left hmk hf.le
  have hS5' := mul_nonpos_of_nonneg_of_nonpos hf.le hS5
  have hslack := mul_nonneg hF0.le (show 0 ≤ 3 / 2 * (D.R.m : ℝ) * sc.L - 13 * D.R.m - 1 by
    nlinarith only [hm44, mul_nonneg hm0 (show 0 ≤ sc.L - 9 by linarith)])
  apply (mul_le_mul_left hF0).mp
  nlinarith only [id, hV1, hV2, hVneg, hG1, hG2, hSL, hSL2, hS5', hS6, hslack, hraw]

theorem rh43_division_level_prime_family {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps) (hbudget : RH43FamilyBudget Fm)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) : FamilyVandermondeCountExplicit Fm := by
  intro C0 CY
  have heps : 0 < eps := by
    obtain ⟨i⟩ := Fm.Ix_zero
    rw [← Fm.L_eps 0 i]; exact (Fm.L 0 i).sc.eps_pos
  obtain ⟨xa, ha⟩ := rh43_lower_eventually eps C0 CY heps
  obtain ⟨xb, hb⟩ := rh43_upper_eventually eps C0 CY heps
  obtain ⟨xg, hg⟩ := gapB_ev eps 8192 C0 heps
  obtain ⟨x1, hbudget⟩ := hbudget
  obtain ⟨x3, h3⟩ := h3
  refine ⟨max (max xa xb) (max xg (max x1 x3)), fun x hx hxx i => ?_⟩
  have ea : xa ≤ x := le_trans (le_trans (le_max_left _ _) (le_max_left _ _)) hx
  have eb : xb ≤ x := le_trans (le_trans (le_max_right _ _) (le_max_left _ _)) hx
  have eg : xg ≤ x := le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) hx
  have e1 : x1 ≤ x := le_trans (le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) (le_max_right _ _)) hx
  have e3 : x3 ≤ x :=
    le_trans (le_trans (le_trans (le_max_right _ _) (le_max_right _ _)) (le_max_right _ _)) hx
  have hsx : (Fm.L x i).sc.x = x := Fm.L_x x i hxx
  have gap := hg (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i) (by rw [hsx]; exact eg)
  have h5 : Conclusion5Sharp (Fm.D x i) (Fm.L x i).sc C0 CY := fun Δ w hA u =>
    ⟨ha (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i) (by rw [hsx]; exact ea) (hbudget x e1 hxx i) (h3 x e3 hxx i)
        gap Δ w hA u,
      hb (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i) (by rw [hsx]; exact eb) (hbudget x e1 hxx i) (h3 x e3 hxx i)
        gap Δ w hA u⟩
  exact part_five_explicit_of_propositions _ _ C0 CY h5 (vandermonde_variation_holds _ _ C0 CY)

theorem rh43_family_replay {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)
    (hbudget : RH43FamilyBudget Fm)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) :
    FamilyVandermondeCountExplicit Fm := by
  first
  | (rh_reduce 2 using [rh43_division_level_prime_family]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh43_division_level_prime_family Fm hbudget h3

rh_scan division_level_prime_family limit 2000
rh_scan rh43_division_level_prime_family limit 2000
rh_prune rh43_division_level_prime_family as RH43FamilyPruned
#print axioms division_level_prime_family
#print axioms rh43_lower
#print axioms rh43_upper_eventually
#print axioms rh43_division_level_prime_family
end Formalism.MainNotions.StandardLattice
