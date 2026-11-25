import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.BrCardP
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TCardK
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TWeylC
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN30: collapse the native automorphic cardinality suppliers to two explicit
literature inputs and one maximum exponent. HUMAN SOURCE-MATCHED; native
certificate prepared, NOT compiled. Do not treat as an RH proof.

Proof block: the same native coefficient representation Xi of weight m
satisfies dim Xi <= c1 (H+1)^A1. Borel injection and Clozel cohomology,
at the original compact open KLev(3M), give
  |S| <= c2 M^A2 dim Xi <= c1 c2 M^A2 (H+1)^A1
      <= c1 c2 [M(H+1)]^max(A1,A2).
M>=1, H+1>=1. No loss from multiplying two common-scale estimates:
the original sum A1+A2 needlessly inflated both bases. The native
Weyl theorem ignores its entire Hypotheses' argument, as witnessed by
its intro _ and body; copy that body without the unused argument.
Both card proofs use ONLY P.cohC and P.borelC once this is done.
Retain these two inputs as actual obligations, not assumed literature
verification. All other 8 fields of Hypotheses' are dispensable in
these two local branches, not in countP_alt/countK_alt or RH globally.
Same original S (pairwise nonisomorphic), SigP/SigK conditions, strict
anti m, weight height, M>=1, rank, field and KLev containment. No change
to the coefficient-prime-uniformity quantifiers in downstream classifier.

Source Weyl exponent n^2 * number of complex embeddings; cohomology
proof uses d*n^2, d=[K:Q]. For number fields the number of embeddings
in C is d. Thus the two actual witnesses have equal exponent d*n^2,
and the sum 2*d*n^2 can be replaced by d*n^2: 16 -> 8 at rank 2
over quadratic CM, 36 -> 18 at rank 3 over quadratic CM. The constants
are unchanged; their existence still requires the two literature inputs
and all native cohomological suppliers. These are explicit source-derived
witnesses, not claims of optimal exponent. RUN25/29 aggregation may use
the new witnesses after caller replay; no new closure of CountI/CorG.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Source paths below relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties:
ModularityArgument/ThresholdArguments/DenseThresholdCases/
  BrCardP.lean a2e96d9c993a392281385cc7f723acf78e614b21
  TCardK.lean c6eb1d67f72c45007e3330ea65b0966f3f27cd96
  TWeylC.lean d716d26265f83c1266a7f10f76c3fedc914bfb66
  FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
  KeepNumU.lean a6575d1cde8b7fa3d393f739d9b9f0e3e7b22ba7
  AutomorphicFormHyp.lean 3bc564e5a5ab8c087c50cddef276d9fb799848a3
AutomorphicForms/TemperedLocalComponents/
  CohBoundFree.lean 3eb3da1c74e98bfa35f2b86c0942f380bf4748b0
  WeylC.lean 2644062f3faa61dde7cd54809c08273ff93c6e43
GaloisLibrary/WeylAlgebraQuantumDet/ExistsScalar.lean edfffc45b4d6f670b2fd4760571c79f7234984a8
GaloisLibrary/WeylCharacterRegularity/ExistsTens.lean 66a759fcbc23274989542bff7fcb257deab4c4ef

Original static call graph: Main ... CountI -> NumberU3U_s -> KeepNumU
 -> countQ_alt -> countP_alt -> cardP_of_prints, and countK_alt
 -> card_k_of_printed_results. Each card node calls Weyl(P), cohBoundFree,
 P.cohC, P.borelC, KLev lemmas. Reduced candidate edges: cardP/K_reduced
 -> weyl_unconditional, cohBoundFree, hcoh, hborel, same KLev lemmas,
 shared card_budget. Original bridges repackage P fields. Keep other
 callers, all structural/type/value/package edges and pending native
 root frontier until authenticated; this is source graph only.
Context cache key (pin, cardP vs cardK, field K, degree, rank n, m,H,M,
S, Sig predicate, cohomology and Borel witnesses); share Weyl and scalar
budget but not distinct Sigma predicates. Backtrack to native card
proofs if replacement fails replay. No extra axioms proposed;
actual axiom ledger for new declarations pending.

Continuity: mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM/HANDOFF/EXPANSION, AGENTS/state excerpts, RUN29 and live manuscript.
Root continuity protocol/log files at attempted root paths returned 404;
do not infer them. Peer latest commits 18759700 (signed orbital mass),
bb29422d (anchored prime correction), 90ea4293 (cofinal PairEx),
6044fe17 (centered prime correction), 2fd47915 (Landau mesh),
437f345a (signed Rees lifts), b7b335f6 (sparse window), dd7cd00b
(height guard); no overlapping card supplier reduction found in these.
Upstream latest observed 8e5cefeeaffe7e4c12153385b7bb33fb7223c41a:
BrCardP same-path 404, TCardK blob 6fc9df30205149a6e2029802c1de5ab33fb7b4c4,
TWeylC d182e4238e28feaa3b963b429020d5a31a6cefd9,
CohBoundFree 04a26d8ce84f34361c81345ab0c3c56f35294a18.
Use pin only; cross-version equivalence not established.

Executed: fetched three exact pinned blobs again, all hashes matched;
checked arithmetic tail equality in both native card proofs; exact
unique-occurrence source substitutions generated below (fail closed
on mismatch). No local lean/lake executable. Re-read actual baseline
status.json for 45577239749 and 45576756833 (both pass); no native
execution of RUN30. No URT benefit or synthetic test asserted.
Run in pinned built Lean environment with existing engine modules on
LEAN_PATH: lake env lean RUN30_AUTOMORPHIC_CARD_BUDGET.lean.
Inspect actual diagnostics, #print axioms, rh_scan pending nodes.
No claim of new CI registration, execution or PASS.

RESUME HERE: replay this file in pinned native CI, audit two-premise
bridges; replace countP_alt/countK_alt card supplier at caller level
with explicit witness exponents, then trace P.borelC/P.cohC to actual
root suppliers, checking quantitative uniformity. Keep old graph and
all unresolved CountI, CountII/V/Vs, TopG, geometry/window premises.
HANDOFF TO integration/editor, audit, kernel, dependency, Galois.
-/
open UpperTheory.V.Published
namespace RHGalois30
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000

theorem card_budget (c₁ c₂ M H A₁ A₂ d : ℕ) (hM : 1 ≤ M)
    (hd : d ≤ c₁ * (H + 1) ^ A₁) :
    c₂ * M ^ A₂ * d ≤ c₂ * c₁ * (M * (H + 1)) ^ max A₁ A₂ := by
  have h2 : M ^ A₂ ≤ M ^ max A₁ A₂ :=
    Nat.pow_le_pow_right hM (le_max_right _ _)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ max A₁ A₂ :=
    Nat.pow_le_pow_right (by omega) (le_max_left _ _)
  calc c₂ * M ^ A₂ * d ≤
      c₂ * M ^ max A₁ A₂ * (c₁ * (H + 1) ^ max A₁ A₂) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2)
          (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = _ := by rw [mul_pow]; ring

theorem card_budget_replay (c₁ c₂ M H A₁ A₂ d : ℕ) (hM : 1 ≤ M)
    (hd : d ≤ c₁ * (H + 1) ^ A₁) :
    c₂ * M ^ A₂ * d ≤ c₂ * c₁ * (M * (H + 1)) ^ max A₁ A₂ := by
  first | (rh_reduce 2 using [card_budget]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 2; done)
        | exact card_budget c₁ c₂ M H A₁ A₂ d hM hd

open NumberField GlobalTheory.CuspRep GlobalTheory.GKCoh
theorem weyl_unconditional : UpperTheory.V.Af.WeylC := by
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
end

private theorem klev_three (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e
theorem cardP_reduced : ClozelCohC → BorelInjC → UpperTheory.V.Br.CardP := by
  intro hcoh hborel K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := weyl_unconditional K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, max A₁ A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := hborel K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨hcoh K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  exact h1.trans (card_budget c₁ c₂ M H A₁ A₂ Ξ.d hM hd)

theorem cardK_reduced : ClozelCohC → BorelInjC → UpperTheory.V.Af.CardK := by
  intro hcoh hborel K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := weyl_unconditional K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, max A₁ A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hB := hborel K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨hcoh K n (by omega) π Ξ fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three K n M hu)⟩⟩
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  exact h1.trans (card_budget c₁ c₂ M H A₁ A₂ Ξ.d hM hd)

theorem cardP_original (P : UpperTheory.V.Af.Hypotheses') : UpperTheory.V.Br.CardP :=
  cardP_reduced P.cohC P.borelC
theorem cardK_original (P : UpperTheory.V.Af.Hypotheses') : UpperTheory.V.Af.CardK :=
  cardK_reduced P.cohC P.borelC
end RHGalois30

rh_scan UpperTheory.V.Br.cardP_of_prints limit 2000
rh_scan UpperTheory.V.Af.card_k_of_printed_results limit 2000
rh_scan RHGalois30.cardP_reduced limit 2000
rh_scan RHGalois30.cardK_reduced limit 2000
rh_prune UpperTheory.V.Af.weyl_complex_of_printed_results as RHWeylPruned30
#print axioms RHGalois30.weyl_unconditional
#print axioms RHGalois30.card_budget
#print axioms RHGalois30.cardP_reduced
#print axioms RHGalois30.cardK_reduced
#print axioms RHGalois30.cardP_original
#print axioms RHGalois30.cardK_original
