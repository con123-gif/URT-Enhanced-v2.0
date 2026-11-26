import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.PublishedHypothesesFromPatching
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN44 literature provenance. 2026-11-26.
Status: source-matched candidate, NOT COMPILED, no new kernel or axiom verification.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4; peer Galois RUN44
2b75bc4ab3ae74b3ccb7811d5fe0365e6f7441c1. Prior literature RUN43 retained.
Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head de330e73d828ea08f621cb28395d48480806d00f
bumps Lean 4.37.0-rc1, not migrated. Pinned Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474.

Actual local consumers CardK, CardP of VWin route: same coefficient Xi,
same compact-open level U=KLev(K,n,3M), same pairwise nonisomorphic family S.
|S| <= cohDim(top,U,ratC Xi) <= c2*M^A2*Xi.d <= c1*c2*M^A2*(H+1)^A1.
No exponent/host/uniformity change. Original graph:
Hypotheses' -> WeylC (unused binder), ClozelCohC, BorelInjC -> CardK/CardP
-> countK_alt/countP_alt (remaining hypotheses retained) -> window route.
Candidate: native Weyl body without unused binder, native
Z.Coh.borelInjC (as used by actual package constructor), and only
ClozelCohomological -> ClozelCohC -> CardK/CardP.
No global removal claimed. Native Borel supplier body and transitive
axioms not independently authenticated. Do not infer axiom freedom
from absence of explicit arguments. Original graph/evidence remain.

Ledger (source paths relative to DenseThresholdCases unless noted):
TPCohC 7f9fd373e34917fa49051b81aa0202984519afe8:
  exact sole package projection lit.aut.coh; dualIff, msetSep, Wigner,
  algIso, cohTransport preserved.
TWeylC d716d26265f83c1266a7f10f76c3fedc914bfb66: unused binder.
TCardK c6eb1d67f72c45007e3330ea65b0966f3f27cd96;
BrCardP a2e96d9c993a392281385cc7f723acf78e614b21:
  exact local proof transformations, shared level helper.
PublishedHypothesesFromPatching 8a57b35c343ed717c225b04710c835f102deaa3b:
  cohC := clozelCohC_alt hN; borelC := Z.Coh.borelInjC.
FrobeniusTraceCountBoundOfCmEigensystemCount 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40:
  countK_alt/countP_alt actual upstream call sites.
ClozelCohomologicalModel aee135858e810bc74eb32ffcb3e527cf77c83ab6:
  definitional proposition, not proof: regular algebraic cuspidal pi
  over totally complex field has a cohomological coefficient.
HasCohomology ec55ca626b57c37d58f482abeeb1c7f03bcd377a;
IsTemperedGLOfIsUnitaryLSeg d436a76cea3d5d93e28f64d5d79840743d0c7b72:
  native group cohomology dimension and relative cochains.
GelfandKazhdanReal 5950874949bd0b4b4f22191c009aff80c520cf5c:
  ClozelCohC and BorelInjC are defined propositions, not proofs.

External mathematical provenance:
Clozel, Motifs et formes automorphes (1990), lemmas 3.14 (pp.112-114)
and 3.15 (pp.121-122), https://www.jmilne.org/math/Books/AA1988a.pdf
supports nonzero relative cohomology at complex places for the matching
coefficient and cuspidal injection. Native full Hermitian symmetric
pair has bracket projection zero; restoring split real center acting
trivially adds exterior factor, not loss of nonvanishing. Matching
Harish-Chandra module and central action still to verify.
Grobner, https://homepage.univie.ac.at/harald.grobner/papers/ResidualGLnEmbeds.pdf
p.1 corroborates cuspidal injection. Fixed compact open invariants
are exact by averaging; each disjoint cohomological summand contributes
at least one class. Need native coefficient, Shapiro/double-coset,
center and group-cohomology comparison, not assume them.
No additional external conjecture proposed.

Executed 56 source SHA / exact reversible transformation /
binder checks in JS. Initial reversible deletion test repaired; shadowing
of hC avoided by distinct hClozel binder. No Lean locally.
Historical CI 45577239749,45576756833,45670987597 checked via jobs API:
completed success, NOT evidence for this file.
Checks: pinned TPCohC; pinned TWeylC; pinned TCardK; pinned BrCardP; pinned PublishedHypothesesFromPatching; actual package supplies both; extract theorem UpperTheory.V.Af.clozelCohC_alt; Clozel name unique; Clozel name reversible; Clozel premise unique; Clozel premise reversible; Clozel binder unique; Clozel binder reversible; Clozel sole projection unique; Clozel sole projection reversible; extract theorem UpperTheory.V.Af.weyl_complex_of_printed_results; Weyl name unique; Weyl name reversible; Weyl premise unique; Weyl premise reversible; Weyl binder unique; Weyl binder reversible; same level helper; extract theorem UpperTheory.V.Af.card_k_of_printed_results; name UpperTheory.V.Af.card_k_of_printed_results unique; name UpperTheory.V.Af.card_k_of_printed_results reversible; premise UpperTheory.V.Af.card_k_of_printed_results unique; premise UpperTheory.V.Af.card_k_of_printed_results reversible; binder UpperTheory.V.Af.card_k_of_printed_results unique; binder UpperTheory.V.Af.card_k_of_printed_results reversible; Weyl UpperTheory.V.Af.card_k_of_printed_results unique; Weyl UpperTheory.V.Af.card_k_of_printed_results reversible; Borel UpperTheory.V.Af.card_k_of_printed_results unique; Borel UpperTheory.V.Af.card_k_of_printed_results reversible; Clozel UpperTheory.V.Af.card_k_of_printed_results unique; Clozel UpperTheory.V.Af.card_k_of_printed_results reversible; level UpperTheory.V.Af.card_k_of_printed_results unique; level UpperTheory.V.Af.card_k_of_printed_results reversible; distinct hypothesis and bound binder; extract theorem UpperTheory.V.Br.cardP_of_prints; name UpperTheory.V.Br.cardP_of_prints unique; name UpperTheory.V.Br.cardP_of_prints reversible; premise UpperTheory.V.Br.cardP_of_prints unique; premise UpperTheory.V.Br.cardP_of_prints reversible; binder UpperTheory.V.Br.cardP_of_prints unique; binder UpperTheory.V.Br.cardP_of_prints reversible; Weyl UpperTheory.V.Br.cardP_of_prints unique; Weyl UpperTheory.V.Br.cardP_of_prints reversible; Borel UpperTheory.V.Br.cardP_of_prints unique; Borel UpperTheory.V.Br.cardP_of_prints reversible; Clozel UpperTheory.V.Br.cardP_of_prints unique; Clozel UpperTheory.V.Br.cardP_of_prints reversible; level UpperTheory.V.Br.cardP_of_prints unique; level UpperTheory.V.Br.cardP_of_prints reversible; distinct hypothesis and bound binder; no added proof holes.

RESUME HERE: replay candidate with pinned native imports and engine; inspect
all #print axioms output, especially Z.Coh.borelInjC. Locate its defining
body and compare native cohomology with Clozel 3.14/3.15. Only then
substitute in countK_alt/countP_alt at actual call sites, retain all
unrelated hypotheses and original graph. No RH conclusion.
-/

noncomputable section
open NumberField Matrix GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.AlgRepEndIrreducible

theorem UpperTheory.V.Af.clozelCohC_of_cohomological44 :
    GlobalTheory.Published.ClozelCohomological → UpperTheory.V.Published.ClozelCohC := by
  intro hC E _ _ _ a ha π Ξ h
  choose m h1 h2 using h
  have hd : ∀ τ, GlobalTheory.WignerGL.HasDualInfChar Ξ τ (m τ) := fun τ => (dualIff E a Ξ τ _).1 (h2 τ)
  have hreg : (CG.mk π).IsRegAlg := (GlobalTheory.CuspRep.CG.isRegAlg_iff _).2 fun τ => by
    obtain ⟨m', e1, e2, e3⟩ := GlobalTheory.AlgInfChar.exists_dualInfChar E a Ξ τ
    have e : m τ = m' := msetSep _ _ fun u => by
      haveI : Nonempty (Fin Ξ.d) := ⟨⟨0, Ξ.pos⟩⟩
      exact smul_left_injective ℂ one_ne_zero (((hd τ).2 u).symm.trans (e1.2 u))
    have h3 : (CG.mk π).HasInfChar τ (m τ) := h1 τ
    rw [h3.infChar_eq, e]
    exact ⟨e2, e3⟩
  obtain ⟨Ξ', hΞ'⟩ := hC E a ha π hreg
  choose m' g1 g2 g3 using GlobalTheory.AlgInfChar.exists_dualInfChar E a Ξ'
  have e : m = m' := by
    by_contra hne
    exact wigner E a π Ξ' m m' h1 g1 hne hΞ'
  subst e
  obtain ⟨T, hT⟩ := algIso E a Ξ' Ξ (fun τ => (m τ).map Neg.neg) (fun τ => (dualIff E a Ξ' τ _).2 (g1 τ)) h2
  exact cohTransport E a π Ξ' Ξ T hT hΞ'

theorem UpperTheory.V.Af.weyl_complex_lit44 :
    UpperTheory.V.Af.WeylC := by
  intro E _ _ _ n
  refine ⟨((n + 1) ^ 2) ^ (n * n * Fintype.card (E →+* ℂ)), n * n * Fintype.card (E →+* ℂ), fun m hm H hH => ?_⟩
  have hb := fun i => abs_le.1 (hH i)
  let ν : Fin n → ℕ := fun k => ((k : ℕ) + 1 + H - m k.rev : ℤ).toNat
  have hν : ∀ k, (ν k : ℤ) = (k : ℕ) + 1 + H - m k.rev := fun k => Int.toNat_of_nonneg (by have := hb k.rev; omega)
  have hanti : Antitone ν := by
    cases n with
    | zero => exact fun i => i.elim0
    | succ n =>
      refine Fin.antitone_iff_succ_le.2 fun i => ?_
      have h1 := hν i.succ
      have h2 := hν i.castSucc
      have h3 : m i.castSucc.rev < m i.succ.rev := hm (Fin.rev_lt_rev.2 Fin.castSucc_lt_succ)
      simp only [Fin.val_succ, Fin.val_castSucc] at h1 h2
      omega
  have hle : ∀ k, ν k ≤ n + 2 * H := fun k => by
    have h1 := hν k
    have h2 := hb k.rev
    have h3 := k.2
    omega
  obtain ⟨P, hP, hd, hw⟩ := UpperTheory.V.Weyl.existsScalar n ν hanti _ hle
  obtain ⟨Ξ, h1, h2⟩ := UpperTheory.V.WeylC.exists_tens (E := E) P hP _ hw (n + H)
  refine ⟨Ξ, fun τ => (UpperTheory.V.WeylC.algInfChar_iff _ _ _).2 ⟨by simp [UpperTheory.V.Af.infOf], fun u => ?_⟩, ?_⟩
  · rw [h2, UpperTheory.V.Af.infOf, Multiset.map_map, Multiset.map_map]
    congr 1
    refine (Fintype.prod_equiv Fin.revPerm _ _ fun k => ?_)
    have h3 : ((ν k : ℕ) : ℂ) = (k : ℕ) + 1 + H - m k.rev := by exact_mod_cast congrArg (Int.cast : ℤ → ℂ) (hν k)
    simp only [Function.comp_apply, Fin.revPerm_apply, h3]
    push_cast
    ring
  · refine h1.trans ((Nat.pow_le_pow_left hd _).trans ?_)
    rw [← pow_mul, ← mul_pow]
    exact Nat.pow_le_pow_left (by nlinarith [Nat.zero_le (n * n * H), Nat.zero_le H, Nat.zero_le n]) _

private theorem klev_three_lit44 (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e


theorem UpperTheory.V.Af.card_k_lit44 :
    GlobalTheory.Published.ClozelCohomological → UpperTheory.V.Af.CardK := by
  intro hClozel K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_lit44 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := UpperTheory.V.Z.Coh.borelInjC K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨(UpperTheory.V.Af.clozelCohC_of_cohomological44 hClozel) K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three_lit44 K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring

theorem UpperTheory.V.Br.cardP_lit44 :
    GlobalTheory.Published.ClozelCohomological → UpperTheory.V.Br.CardP := by
  intro hClozel K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_lit44 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := UpperTheory.V.Z.Coh.borelInjC K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨(UpperTheory.V.Af.clozelCohC_of_cohomological44 hClozel) K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three_lit44 K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring

theorem UpperTheory.V.Af.replay_card_k_lit44
    (hC : GlobalTheory.Published.ClozelCohomological) : UpperTheory.V.Af.CardK := by
  first
  | (rh_reduce 2 using [UpperTheory.V.Af.card_k_lit44]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact UpperTheory.V.Af.card_k_lit44 hC

rh_scan UpperTheory.V.Af.card_k_of_printed_results limit 2000
rh_scan UpperTheory.V.Af.card_k_lit44 limit 2000
rh_scan UpperTheory.V.Z.Coh.borelInjC limit 2000
rh_scan UpperTheory.V.Br.cardP_lit44 limit 2000
rh_prune UpperTheory.V.Af.replay_card_k_lit44 as RH44LitCardKPruned
#print axioms UpperTheory.V.Z.Coh.borelInjC
#print axioms UpperTheory.V.Af.clozelCohC_alt
#print axioms UpperTheory.V.Af.clozelCohC_of_cohomological44
#print axioms UpperTheory.V.Af.card_k_lit44
#print axioms UpperTheory.V.Br.cardP_lit44
