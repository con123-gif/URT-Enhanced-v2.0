import Formalism.SharpRestriction.GlobalSchurBounds.LinkMin
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN30 — collapse the actual LinkMin mass-volume supplier to one endpoint identity.
25 Nov 2026. SOURCE-MATCHED, conditional; native replay PREPARED, not compiled.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; LinkMin blob b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f.
Current upstream 251c7b05dd869ceba1aa42c6001c00b4010f23f9, LinkMin blob f544543662a6438e557c49816c7da48950555166; named declaration
presence (not equivalence): [{"name":"family_of_global_statements","present":true},{"name":"upper_weight_bound_eventually","present":true},{"name":"ramified_rank_lines_of_free","present":true},{"name":"part_five_family_of_mass_volume","present":true},{"name":"division_level_prime_family","present":true}].
Current mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc.
Read mission incl mandatory engines, protocol, handoff queue, expansion, AGENTS,
continuity, state/log/protocol, current CI summary and shared human manuscript.
Peer editor 109c156c determinant moment, audit db618414 normalized height,
theta 6c4bfc68 signed count, dependency 75a05320 Hilbert cancellation:
no duplicate; RUN30 works on absolute scale normalization, not their bounds.

CORRECTION to RUN29: actual LinkMin.division_level_prime_family uses
family_of_global_statements, not only the general FamilyPartFiveExplicitHolds
route; it uses MassRatio₂ and BaseVolumeEqualsMass (not all VolumeEqMass₂).
Both native absolute estimates call this same identity ONCE; they do not use
either premise elsewhere. Relative variation is already mass-independent in
native LogVandermondeVariationGeneric.vandermonde_variation_holds; do not claim
that cancellation as new.

Define k=D.R.k, m=D.R.m, r=k+m-1, f=D.R.f, R=prod_{k<M<=r} ratioH(D,M).
For the native ratio of star volumes the only mass-volume input is
                  volY0(D) = massI(D,k) * R.                       (A)
Original MassRatio₂ and BaseVolumeEqualsMass imply (A) by telescoping.
The separate equalities at every rank and at rank r are not needed by
this consumer. Indeed DstarD/duStarU =
[volY0/massI(k)] * [idxSig/idxPi] * prod_rho [dsig_rho/dimV(u,rho)].
Under (A), substitute R and the existing exact index formula, then take
logs. Weyl dimV=Vandermonde/facProd(k) cancels the factorial difference in
log_mass_ratio_telescoping, giving exactly LemmaFiveOneIdentity with no
other change. Keep positivity, even m, k>=5, actual host and rank data.
The original native body is reproduced below with ONLY the mass/volume
substitution changed; lower and upper bodies consume the identity directly.

Human pyramid block: define v=volY0, a_j=massI(j)>0, q_j=ratioH(j)>0.
For arbitrary positive values the exact combined normalization defect is
 log(v/(a_k*prod q_j)) =
 log(v/a_r)+sum_{j=k+1}^r log(a_j/(a_{j-1}*q_j)).
Thus errors can cancel BEFORE norms. The actual X differs from the model
closed-form X by this single signed defect divided by f*k. Exact zero
recovers the native constants, without controlling any individual term.
If a future approximate estimate |defect|<=c*f*k*L is established uniformly,
both absolute count bounds enlarge by c*L (upper by <=c*m*L);
caller adapters for approximate variant remain open. No claim (A) follows
without native arithmetic geometry. Abstract weaker premise does not assert
existence of a native host violating the stronger one.

Pinned provenance:
 LinkMin b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f lines 48-455,
 StandardLattice cb758a6c5f78e610b8f946d4b733d07902b15f5d,
 TheoremThreeOfExplicitAndCompact 88a7ed3b02e836b2523c15f0ddfdeeec1cc256ec,
 LemmaFiveOneOfTheoremTwo 2b7d6755659146ca64a2aad8f1a426b6f196bd87,
 MassRatioUnfoldedOfTheoremTwo 1c676e46fcda50cdbc82597cacbf8ea526c6871a,
 LogVandermondeVariationGeneric 88add153513f5cc61075fd89b8a06ed86fe2adaa.
MassRatioUnfoldedOfTheoremTwo.mass_ratio_of_true_volume_ratio uses VolRatioTrue
and VolTie (actual Haar measures and fundamental domains). GenusMassStd
and DefClassDecomp supply definite mass through mass_volume_identity_of_class_decomp.
Do not discard those suppliers globally. Next seek a direct same-host chain
from volY0 to rank-k definite mass; only one terminal definite mass
normalization would then be needed, but existence of that chain remains open.

Graph overlay (source visible, not kernel graph):
family_of_global_sources -> linkGLOBAL7_min -> division_level_prime_family
 -> ramified_rank_lines_of_free -> upper_weight_bound_eventually
 -> family_of_global_statements; upper part_five_family_of_mass_volume
 -> same identity; division_level_prime_family also uses gapB_ev,
 vandermonde_variation_holds and part_five_explicit_of_propositions.
Candidate: aggregate A -> LemmaFiveOneIdentity -> same lower and upper
bounds -> FamilyVandermondeCountExplicit -> existing caller; original typed
graph, axiom evidence, shared other consumers and all pending leaves retained.
Cache key pin,D,host,k,m,r,f,volY0,massI,ratioH,scale,word,actual consumer.
Backtrack to original if identity replay or another consumer requires all-rank.
No change to same-host uniform family quantifier, epsilon or windows.

Executed source transformation in JS: 14 unique exact replacement
assertions, checked no residual h2b/h2v/h41 in the four modified bodies.
No synthetic numerical host or URT experiment. Local command -v lean/lake
returned nothing. Earlier CI statuses independently retrieved:
45577239749 return 0 98.87s (b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc),
45576756833 return 0 77.94s (7da354941e402b6f8b364ed03d8c5c82d27b7717).
Only prior engines and conditional strip root checked. New certificate NOT
compiled, no new axiom result or PASS. No claimed RH theorem imported as shortcut.
RESUME HERE: native replay this replacement and trace VolRatioTrue and
DefClassDecomp to a same-host descending signature chain terminating in
rank k. Prove (A), or derive quantitative signed defect, not more restatements.
HANDOFF TO integration, kernel, audit, editor: use actual LinkMin producer,
retain independent upper consumers. RH OPEN.
-/

noncomputable section
namespace Formalism.MainNotions.StandardLattice
open NumberField Formalism.BasicNotions Finset

def RH30AggregateMassVolume (D : D7) : Prop :=
  letI := D.host.cmStar
  volY0 D = massI D D.R.k *
    ∏ M ∈ Ico (D.R.k + 1) (D.R.k + (D.R.m - 1) + 1), ratioH D M

theorem rh30_aggregate_of_original (D : D7) (h2b : MassRatio₂ D)
    (h41 : BaseVolumeEqualsMass D) : RH30AggregateMassVolume D := by
  letI := D.host.cmStar
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have er : D.R.r = D.R.k + D.R.m - 1 := rfl
    have hm := D.R.two_le_m
    omega
  change volY0 D = massI D D.R.r at h41
  unfold RH30AggregateMassVolume
  rw [h41, hr]
  exact mass_telescope D h2b (host_v_pos D) D.R.k (by have := D.R.k_ge; omega) (D.R.m - 1)

theorem rh30_identity_of_aggregate (D : D7) (hagg : RH30AggregateMassVolume D) : LemmaFiveOneIdentity D := by
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
  have e2 : DstarD D / duStarU D u = R * Q * ∏ ρ, (D.dsig ρ / dimV (uColR D u ρ)) := by
    unfold DstarD DstarP duStarU duStarP
    rw [show volY0 D = massI D D.R.k * R from hagg, Finset.prod_div_distrib, ← h3]
    have hd : (∏ ρ, dimV (uColR D u ρ)) ≠ 0 := (Finset.prod_pos fun ρ _ => hdim ρ).ne'
    field_simp
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
  rw [e1, e2, Real.log_mul (mul_pos hRpos hQpos).ne' hP.ne', Real.log_mul hRpos.ne' hQpos.ne', eR, eQ, eP,
    log_mass_ratio_telescoping D D.R.k (by omega) (D.R.m - 1), he, hn, Ico_succ_eq_Ioc, ← hr]
  ring

theorem rh30_lower_of_identity (D : D7) (sc : Scale) (C0 CY : ℝ)
    (hx : 2 * (Real.log 8 + 1 + Real.log sc.x) ≤ sc.L)
    (hI : LemmaFiveOneIdentity D) (h3 : SigmaDegreeTwoSidedBoundOfGap D) (hgap : ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
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
  have hid := hI u
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
  exact log_X_lower_arithmetic _ _ _ _ _ _ _ _ _ _ _ _ _ hF hM hMK hL hlv0 hlv r1 hG hSL hSG hSPW hid hlo

theorem rh30_lower_eventually_of_identity (eps C0 CY : ℝ) (heps : 0 < eps) :
    ∃ x0 : ℝ, ∀ (D : D7) (sc : Scale), sc.eps = eps → x0 ≤ sc.x → LemmaFiveOneIdentity D → SigmaDegreeTwoSidedBoundOfGap D →
      (∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
        ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3))) → ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataA D sc C0 CY Δ w → ∀ u : D.what₂.Word,
        lowS D sc w ≤ logXuD D u := by
  have h1 := (isLittleO_log_rpow_atTop heps).bound (show (0 : ℝ) < 1 / 4 by norm_num)
  have h2 := (tendsto_rpow_atTop heps).eventually_ge_atTop (4 * (Real.log 8 + 1))
  obtain ⟨x0, hx0⟩ := Filter.eventually_atTop.1 (h1.and h2)
  refine ⟨x0, fun D sc he hx hI h3 h4B Δ w hA u => ?_⟩
  obtain ⟨a, b⟩ := hx0 sc.x hx
  have hL : sc.L = sc.x ^ eps := by unfold Scale.L; rw [he]
  have hpos : 0 ≤ sc.x ^ eps := Real.rpow_nonneg (lt_trans one_pos sc.one_lt_alt).le _
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg hpos] at a
  have a' := le_trans (le_abs_self _) a
  exact rh30_lower_of_identity D sc C0 CY (by rw [hL]; linarith) hI h3 h4B Δ w hA u

theorem rh30_upper_eventually_of_identity (eps C0 CY : ℝ) (heps : 0 < eps) :
    ∃ x0 : ℝ, ∀ (D : D7) (sc : Scale), sc.eps = eps → x0 ≤ sc.x → LemmaFiveOneIdentity D → SigmaDegreeTwoSidedBoundOfGap D →
      (∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataB D sc C0 Δ w →
        ∀ ρ, GapAtLeast (rowSgn D) (rowLam D ρ) (gap3 D 8192 (1 / 3))) → ∀ (Δ : ℝ) (w : ℕ → D.what₂.Tau → ℝ), DataA D sc C0 CY Δ w → ∀ u : D.what₂.Word,
        logXuD D u ≤ (15 + 3 * CY) * D.R.m * sc.L := by
  obtain ⟨x0, hx0⟩ := Filter.eventually_atTop.1 ((tendsto_rpow_atTop heps).eventually_ge_atTop 9)
  refine ⟨x0, fun D sc he hx hI h3 h4B Δ w hA u => ?_⟩
  let _ := D.host.cmStar
  have hL9 : 9 ≤ sc.L := by unfold Scale.L; rw [he]; exact hx0 sc.x hx
  obtain ⟨hB, r1, r2, r3, r4, r5, r6, -, -⟩ := hA
  have hgap := h4B Δ w hB
  have id := hI u
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
  exact log_X_upper_arithmetic (D.R.f : ℝ) D.R.k D.R.m sc.L CY _ _ _ _ _ _ _ hf hk5 hm44 hmk hL9 hlv0 hlv h2v0 hSL hlg0 hlg hS5
    hS6 id


theorem rh30_division_level_prime_family {eps : ℝ}
    (Fm : Formalism.MainNotions.FamP eps)
    (hI : flipTwoThree.fam0 Fm LemmaFiveOneIdentity)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) :
    FamilyVandermondeCountExplicit Fm := by
  intro C0 CY
  have heps : 0 < eps := by
    obtain ⟨i⟩ := Fm.Ix_zero
    rw [← Fm.L_eps 0 i]; exact (Fm.L 0 i).sc.eps_pos
  obtain ⟨xa, ha⟩ := rh30_lower_eventually_of_identity eps C0 CY heps
  obtain ⟨xb, hb⟩ := rh30_upper_eventually_of_identity eps C0 CY heps
  obtain ⟨xg, hg⟩ := gapB_ev eps 8192 C0 heps
  obtain ⟨xi, hi⟩ := hI
  obtain ⟨xs, hs⟩ := h3
  refine ⟨max (max xa xb) (max xg (max xi xs)), fun x hx hxx i => ?_⟩
  have eab : max xa xb ≤ x := (le_max_left _ _).trans hx
  have er : max xg (max xi xs) ≤ x := (le_max_right _ _).trans hx
  have exi : max xi xs ≤ x := (le_max_right _ _).trans er
  have hsx : (Fm.L x i).sc.x = x := Fm.L_x x i hxx
  have gap := hg (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i)
    (by rw [hsx]; exact (le_max_left _ _).trans er)
  have id := hi x ((le_max_left _ _).trans exi) hxx i
  have sig := hs x ((le_max_right _ _).trans exi) hxx i
  have h5 : Conclusion5Sharp (Fm.D x i) (Fm.L x i).sc C0 CY := fun Δ w hA u =>
    ⟨ha (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i)
        (by rw [hsx]; exact (le_max_left _ _).trans eab) id sig gap Δ w hA u,
      hb (Fm.D x i) (Fm.L x i).sc (Fm.L_eps x i)
        (by rw [hsx]; exact (le_max_right _ _).trans eab) id sig gap Δ w hA u⟩
  exact part_five_explicit_of_propositions _ _ C0 CY h5 (vandermonde_variation_holds _ _ C0 CY)

theorem rh30_native_replay (D : D7) (h : RH30AggregateMassVolume D) :
    LemmaFiveOneIdentity D := by
  first
  | (rh_reduce 2 using [rh30_identity_of_aggregate]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rh30_identity_of_aggregate D h

theorem rh30_family_of_aggregate {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)
    (hA : flipTwoThree.fam0 Fm RH30AggregateMassVolume)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) :
    FamilyVandermondeCountExplicit Fm := by
  apply rh30_division_level_prime_family Fm _ h3
  obtain ⟨x0, h0⟩ := hA
  exact ⟨x0, fun x hx hxx i => rh30_native_replay _ (h0 x hx hxx i)⟩

theorem rh30_original_family_bridge {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)
    (h2b : flipTwoThree.fam0 Fm MassRatio₂)
    (h2v : flipTwoThree.fam0 Fm BaseVolumeEqualsMass)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) :
    FamilyVandermondeCountExplicit Fm := by
  apply rh30_family_of_aggregate Fm _ h3
  obtain ⟨a, ha⟩ := h2b
  obtain ⟨b, hb⟩ := h2v
  exact ⟨max a b, fun x hx hxx i =>
    rh30_aggregate_of_original _ (ha x ((le_max_left _ _).trans hx) hxx i)
      (hb x ((le_max_right _ _).trans hx) hxx i)⟩

rh_scan family_of_global_statements limit 2000
rh_scan division_level_prime_family limit 2000
rh_scan rh30_family_of_aggregate limit 2000
rh_prune family_of_global_statements as RH30OriginalIdentityPruned
rh_prune rh30_identity_of_aggregate as RH30AggregateIdentityPruned
rh_prune rh30_lower_of_identity as RH30LowerPruned
#print axioms family_of_global_statements
#print axioms rh30_aggregate_of_original
#print axioms rh30_identity_of_aggregate
#print axioms rh30_lower_of_identity
#print axioms rh30_upper_eventually_of_identity
#print axioms rh30_original_family_bridge
#print axioms rh30_family_of_aggregate
end Formalism.MainNotions.StandardLattice
