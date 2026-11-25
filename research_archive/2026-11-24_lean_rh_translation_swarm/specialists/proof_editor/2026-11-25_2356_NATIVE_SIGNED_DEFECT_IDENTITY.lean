import Formalism.SharpRestriction.GlobalSchurBounds.LinkMin
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 15 RUN42 (25 Nov 2026). SOURCE-MATCHED human derivation and
PREPARED Lean certificate, NOT compiled. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first incl
mandatory engine, SWARM/HANDOFF/EXPANSION, AGENTS, living proof and
recent peer commit list. Geometry 706da3bb (single Gram SW),
theta 20450987 (paired covol), integration 700e3969 (qualitative
Sha caller), previous editor efa4abe2 (endpoint lattice) read.
Prior signed scalar budget edbe75f92ac742db0eca3500eef3a978af5586e7,
integration exact endpoint caller 2c8b44fdae4041741b502b52251318afd9167c49
and geometry aggregate b809b11cf249ac5e072ad0ed32c52aba549151b3
read to avoid duplicating the exact endpoint construction.

NEW actual native closed-form adapter (not another exact endpoint
proof): remove BOTH mass normalization assumptions from the
LinkMin.family_of_global_statements algebra by retaining the common
signed defect. Write F=f*k, R=product_{k<M<=r} ratioH(D,M),
T=volY0/(massI(k)*R)>0. In the actual native DstarD/duStarU expression,
cancel the mass factors before logs:
   DstarD/duStarU = T * R * Q * product_rho(dsig/dimV).
All factors positive and defined, same D and word; Q is the native
index ratio. The original log decomposition now gives exactly
   F logXuD(u) = native_closed_form_rhs(u) + log T.
No MassRatio2 or BaseVolumeEqualsMass needed for this identity;
retain positivity of volY0 explicitly rather than claim it proved.
The correction is independent of u, so one signed normalization
budget applies to every word on the same host. The prior scalar
adapter's sufficient interval in normalized units -2L <= delta <= m
is precisely -2L F <= log T <= m F. Do not claim this inequality
or the two full native count caller substitutions already proved.
The existing exact endpoint certificate is the delta=0 fallback.

The prior scalar certificate proved (human, prepared) the two
count inequalities assuming this corrected identity and the
native scalar suppliers. This checkpoint authenticates the
missing algebraic connection to the actual DstarD ratio; it
does not establish the interval from geometry, nor replace the
independent mass-error conjunct. No actual host is invented.
No URT used. No new human manuscript pages.

Original source-visible graph:
LinkMin.division_level_prime_family -> upper_weight_bound_eventually
and part_five_family_of_mass_volume -> family_of_global_statements
-> mass_telescope + BaseVolumeEqualsMass, index and log formulas.
Candidate overlay: both count consumers -> prior signed budget
+ RH42SignedIdentity + native gap/dimension/weight/L-value inputs
-> exact DstarD algebra + positive volY0 and mass/rank factors.
Zero-defect bridge recovers old identity. Original and reduced
graphs, all unexpanded type/value/constructor edges and prior
axiom evidence retained. Root retirement 0. Cache key
pin,D,host,k,m,r,f,volY0,massI,ratioH,scale,word,consumer.
Backtrack to exact endpoint if defect interval or replay fails.

Source pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Native source relative to src/Formalism/SharpRestriction/GlobalSchurBounds/:
LinkMin.lean b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f; TheoremThreeOfExplicitAndCompact.lean 88a7ed3b02e836b2523c15f0ddfdeeec1cc256ec.
Body derived by exact unique text replacements, 15 executed
source hash/anchor/absence checks, all matched. These are not
kernel checks. Local command -v lean/lake returned no path.
Actual earlier CI statuses fetched (45577239749 and 45576756833,
both status pass/returncode 0, blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717). Only baseline engines
and conditional root checked, not this file. Prior root axioms
propext, Classical.choice, Quot.sound; 324 scan nodes pending.
No native PASS for new candidate or claimed RH proof imported.

RESUME HERE: replay signed identity and bridge in pinned Lean;
then substitute corrected identity and earlier normalized scalar
budget into both actual LinkMin count callers, using native
positivity and retaining the independent mass-error conjunct.
Prove the same-host raw defect interval (or exact equality)
via RUN42 single-Gram SW or RUN41 paired Tamagawa; don't repeat
the downstream identities. Keep independent CountI/II/Vs,
same-host Sha/TopG/J/VWin and weighted prime bound unresolved.
HANDOFF TO integration, geometry, kernel and audit.
-/

noncomputable section
namespace Formalism.MainNotions.StandardLattice
open NumberField Formalism.BasicNotions Finset

def RH42MassLogDefect (D : D7) : ℝ :=
  letI := D.host.cmStar
  Real.log (volY0 D / (massI D D.R.k *
    ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M))

def RH42SignedIdentity (D : D7) : Prop :=
  letI := D.host.cmStar
  ∀ u : D.what₂.Word,
    (D.R.f : ℝ) * D.R.k * logXuD D u =
      (D.R.f : ℝ) * (((D.R.m : ℝ) - 1) * D.R.k + (D.R.m : ℝ) * ((D.R.m : ℝ) - 1) / 2) *
          Real.log (D.host.v / Real.pi)
      - (D.R.f : ℝ) * (((D.R.m : ℝ) - 1) / 2) * Real.log (2 * D.host.v)
      + ∑ M ∈ Finset.Ioc D.R.k D.R.r, Real.log (Formalism.HermitianLatticesTheory.lValEta D.host.E M)
      + (D.R.f : ℝ) * ((D.R.m : ℝ) * (2 * D.R.k + D.R.m - 1) / 2) *
          Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ))
      + (D.R.f : ℝ) * ∑ i : Fin 2, ∑ j ∈ Finset.Ioc D.R.k D.R.r,
          Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹)
      + ∑ ρ, Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ))
      + RH42MassLogDefect D

theorem rh42_signed_identity (D : D7) (hvol : 0 < volY0 D) : RH42SignedIdentity D := by
  let _ := D.host.cmStar
  have h43 := index_product_formulas_and_ratio D
  intro u
  have hv := host_v_pos D
  have hk := D.R.k_ge
  have hm := D.R.two_le_m
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have er : D.R.r = D.R.k + D.R.m - 1 := rfl
    omega
  have hf : (0 : ℝ) < D.R.f := by exact_mod_cast degree_pos_alt D
  have hkR : (0 : ℝ) < D.R.k := by exact_mod_cast (by omega : 0 < D.R.k)
  have hg : ∀ i : Fin 2, (2 : ℝ) ≤ (D.host.g i : ℝ) := fun i => by exact_mod_cast (D.host.g_prime i).two_le
  have hfac : ∀ (i : Fin 2) (j : ℕ), 1 ≤ j → 0 < 1 - ((D.host.g i : ℝ) ^ j)⁻¹ := by
    intro i j hj
    have h1 : (2 : ℝ) ≤ (D.host.g i : ℝ) ^ j :=
      le_trans (hg i) (le_self_pow₀ (by linarith [hg i]) (by omega))
    have h2 : ((D.host.g i : ℝ) ^ j)⁻¹ ≤ 2⁻¹ := inv_anti₀ (by norm_num) h1
    norm_num at h2 ⊢
    linarith
  have e1 : (D.R.f : ℝ) * D.R.k * logXuD D u = Real.log (DstarD D / duStarU D u) := by
    unfold logXuD logXu
    field_simp
  set R := ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M with hR
  have hRpos : 0 < R := Finset.prod_pos fun M hM => mass_ratio_pos D hv M (by have := (Finset.mem_Ico.1 hM).1; omega)
  set T := volY0 D / (massI D D.R.k * R) with hT
  have hTpos : 0 < T := div_pos hvol (mul_pos (massI_pos D D.R.k) hRpos)
  have hdef : RH42MassLogDefect D = Real.log T := rfl
  set Q := ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) ^ (D.R.f * (D.R.m * (2 * D.R.k + D.R.m - 1) / 2)) *
      ∏ i : Fin 2, ∏ j ∈ Finset.Ioc D.R.k D.R.r, (1 - ((D.host.g i : ℝ) ^ j)⁻¹) ^ D.R.f with hQ
  have hgg : 0 < (D.host.g 0 : ℝ) * (D.host.g 1 : ℝ) := mul_pos (by linarith [hg 0]) (by linarith [hg 1])
  have hQ2 : 0 < ∏ i : Fin 2, ∏ j ∈ Finset.Ioc D.R.k D.R.r, (1 - ((D.host.g i : ℝ) ^ j)⁻¹) ^ D.R.f :=
    Finset.prod_pos fun i _ => Finset.prod_pos fun j hj =>
      pow_pos (hfac i j (by have := (Finset.mem_Ioc.1 hj).1; omega)) _
  have hQpos : 0 < Q := mul_pos (pow_pos hgg _) hQ2
  have h3 : idxSig D (D.host.g 0) (D.host.g 1) / idxPi D (D.host.g 0) (D.host.g 1) = Q := h43.2.2
  have hidx : idxPi D (D.host.g 0) (D.host.g 1) ≠ 0 := by
    intro h0
    rw [h0, div_zero] at h3
    exact hQpos.ne h3
  have hmk : massI D D.R.k ≠ 0 := (massI_pos D D.R.k).ne'
  have hdim : ∀ ρ, 0 < dimV (uColR D u ρ) := fun ρ => dim_weyl_pos_of_strictAnti _ (column_param_strictAnti D u ρ)
  have hP : 0 < ∏ ρ, (D.dsig ρ / dimV (uColR D u ρ)) :=
    Finset.prod_pos fun ρ _ => div_pos (D.dsig_pos ρ) (hdim ρ)
  have e2 : DstarD D / duStarU D u = T * (R * Q * ∏ ρ, (D.dsig ρ / dimV (uColR D u ρ))) := by
    unfold DstarD DstarP duStarU duStarP
    rw [Finset.prod_div_distrib, ← h3, hT]
    have hd : (∏ ρ, dimV (uColR D u ρ)) ≠ 0 := (Finset.prod_pos fun ρ _ => hdim ρ).ne'
    field_simp [hmk, hidx, hd, hRpos.ne'] <;> ring
  have eR : Real.log R = ∑ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), Real.log (ratioH D M) :=
    Real.log_prod fun M hM => (mass_ratio_pos D hv M (by have := (Finset.mem_Ico.1 hM).1; omega)).ne'
  have eQ : Real.log Q = ((D.R.f * (D.R.m * (2 * D.R.k + D.R.m - 1) / 2) : ℕ) : ℝ) *
        Real.log ((D.host.g 0 : ℝ) * (D.host.g 1 : ℝ)) +
      (D.R.f : ℝ) * ∑ i : Fin 2, ∑ j ∈ Finset.Ioc D.R.k D.R.r, Real.log (1 - ((D.host.g i : ℝ) ^ j)⁻¹) := by
    rw [hQ, Real.log_mul (pow_pos hgg _).ne' hQ2.ne', Real.log_pow, Real.log_prod]
    · congr 1
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [Real.log_prod, Finset.mul_sum]
      · exact Finset.sum_congr rfl fun j _ => Real.log_pow _ _
      · exact fun j hj => (pow_pos (hfac i j (by have := (Finset.mem_Ioc.1 hj).1; omega)) _).ne'
    · exact fun i _ => (Finset.prod_pos fun j hj =>
        pow_pos (hfac i j (by have := (Finset.mem_Ioc.1 hj).1; omega)) _).ne'
  have eP : Real.log (∏ ρ, (D.dsig ρ / dimV (uColR D u ρ))) =
      ∑ ρ, Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) -
        (D.R.f : ℝ) * (Real.log (facProd D.R.r) - Real.log (facProd D.R.k)) := by
    rw [Real.log_prod fun ρ _ => (div_pos (D.dsig_pos ρ) (hdim ρ)).ne']
    have : ∀ ρ, Real.log (D.dsig ρ / dimV (uColR D u ρ)) =
        Real.log (D.dsig ρ * facProd D.R.r / vand (uColR D u ρ)) -
          (Real.log (facProd D.R.r) - Real.log (facProd D.R.k)) := by
      intro ρ
      have hvd : 0 < vand (uColR D u ρ) := by
        have := hdim ρ
        unfold dimV at this
        exact (div_pos_iff_of_pos_right (factorial_product_pos _)).1 this
      unfold dimV
      rw [Real.log_div (D.dsig_pos ρ).ne' (div_pos hvd (factorial_product_pos _)).ne',
        Real.log_div hvd.ne' (factorial_product_pos _).ne',
        Real.log_div (mul_pos (D.dsig_pos ρ) (factorial_product_pos _)).ne' hvd.ne',
        Real.log_mul (D.dsig_pos ρ).ne' (factorial_product_pos _).ne']
      ring
    rw [Finset.sum_congr rfl fun ρ _ => this ρ, Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ,
      D.what₂.card_Tau, nsmul_eq_mul]
  have he : ((D.R.f * (D.R.m * (2 * D.R.k + D.R.m - 1) / 2) : ℕ) : ℝ) =
      (D.R.f : ℝ) * ((D.R.m : ℝ) * (2 * D.R.k + D.R.m - 1) / 2) := by
    obtain ⟨c, hc⟩ := D.R.m_even
    have h1 : D.R.m * (2 * D.R.k + D.R.m - 1) / 2 = c * (2 * D.R.k + D.R.m - 1) := by
      have : D.R.m * (2 * D.R.k + D.R.m - 1) = 2 * (c * (2 * D.R.k + D.R.m - 1)) := by
        generalize 2 * D.R.k + D.R.m - 1 = X
        rw [hc]
        ring
      rw [this, Nat.mul_div_cancel_left _ (by norm_num)]
    have hX : ((2 * D.R.k + D.R.m - 1 : ℕ) : ℝ) = 2 * (D.R.k : ℝ) + D.R.m - 1 := by
      rw [Nat.cast_sub (by omega)]; push_cast; ring
    have hmc : (D.R.m : ℝ) = 2 * c := by rw [hc]; push_cast; ring
    rw [h1, Nat.cast_mul, Nat.cast_mul, hX, hmc]
    ring
  have hn : ((D.R.m - 1 : ℕ) : ℝ) = (D.R.m : ℝ) - 1 := by rw [Nat.cast_sub (by omega)]; simp
  rw [e1, e2, Real.log_mul hTpos.ne' (mul_pos (mul_pos hRpos hQpos) hP).ne',
    Real.log_mul (mul_pos hRpos hQpos).ne' hP.ne', Real.log_mul hRpos.ne' hQpos.ne', hdef, eR, eQ, eP,
    log_mass_ratio_telescoping D D.R.k (by omega) (D.R.m - 1), he, hn, Ico_succ_eq_Ioc, ← hr]
  ring

-- The old exact identity is recovered when the single signed defect vanishes.
theorem rh42_exact_of_zero (D : D7) (hvol : 0 < volY0 D)
    (hz : RH42MassLogDefect D = 0) : LemmaFiveOneIdentity D := by
  letI := D.host.cmStar
  intro u
  have h := rh42_signed_identity D hvol u
  simpa only [hz, add_zero] using h

-- No normalization assumption enters a difference between two words.
-- The two expressions A and B are the respective native closed-form RHSs.
theorem rh42_common_offset (F X Y A B d : ℝ)
    (hx : F * X = A + d) (hy : F * Y = B + d) :
    F * (X - Y) = A - B := by
  linarith

-- The earlier scalar budget is in units fk; do not put the raw log defect
-- into that interval without division by the positive scale.
theorem rh42_normalize_budget (F L m d : ℝ) (hF : 0 < F) :
    (-2 * L ≤ d / F ∧ d / F ≤ m) ↔
    (-2 * L * F ≤ d ∧ d ≤ m * F) := by
  rw [le_div_iff₀ hF, div_le_iff₀ hF]

theorem rh42_exact_auto (D : D7) (hvol : 0 < volY0 D)
    (hz : RH42MassLogDefect D = 0) : LemmaFiveOneIdentity D := by
  first
  | (rh_reduce 2 using [rh42_exact_of_zero]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh42_exact_of_zero D hvol hz

rh_scan family_of_global_statements limit 2000
rh_scan rh42_signed_identity limit 2000
rh_scan rh42_exact_of_zero limit 2000
rh_prune rh42_signed_identity as RH42SignedPruned
#print axioms family_of_global_statements
#print axioms rh42_signed_identity
#print axioms rh42_exact_of_zero
#print axioms rh42_normalize_budget
end Formalism.MainNotions.StandardLattice
