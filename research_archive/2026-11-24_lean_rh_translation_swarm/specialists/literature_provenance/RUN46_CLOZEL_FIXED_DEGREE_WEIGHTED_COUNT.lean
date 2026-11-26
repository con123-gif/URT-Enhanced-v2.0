import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.PublishedHypothesesFromPatching
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN46, literature provenance, 26 Nov 2026. HUMAN LITERATURE DERIVATION / SOURCE-MATCHED CONDITIONAL CERTIFICATE / NOT COMPILED.
Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4, source pin 40e56bab026552e089d7afcfeff08d2defb9c005;
Lean 4.33.1, Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Current upstream de0d3a3f06d2fb093eee6a2a685225895c90c3ac, not migrated.
Read AGENTS, continuity, state, SWARM/HANDOFF/EXPANSION, latest mission and peer commits 5305a18b (Kuga),
65d0f958 (rank3 exponent), ff996d30 (Selmer), 05da337a (gap no-go), and recent lane RUN44/RUN45.
This is a different route from peer Kuga energy reduction. No RH imports or assumed RH.

Primary literature: Laurent Clozel, Motifs et formes automorphes (1990), pp.112-114, Lemma 3.14,
and pp.121-122, Lemma 3.15, https://www.jmilne.org/math/Books/AA1988a.pdf .
Retrieved primary PDF text around lines 3637-3702, 3983-4037. Screenshot requests failed because source
PDF is 21,912,798 bytes. Text evidence only, not a visually authenticated scan.
Clozel explicitly makes the sign twist trivial at a complex place. For a regular algebraic cuspidal pi,
matching irreducible algebraic coefficient dual to its infinitesimal character, the reduced local
relative cohomology at each complex place is an exterior algebra on C^(a-1), shifted by a(a-1)/2.
This identifies a common degree, not merely an unspecified nonzero cochain.
For r2 complex places the Kunneth product has Poincare polynomial
    t^(r2*a*(a-1)/2) (1+t)^(r2*(a-1)).
In particular it contributes at least one class in that fixed degree and total dimension
    2^(r2*(a-1)).
No sign twist is needed in a totally complex field. Equality of the two infinitesimal characters
with the coefficient dual is at BOTH embeddings per place, not just one. A finite-dimensional
irreducible rational coefficient is determined by its dominant highest weights (Harish-Chandra
parameter minus rho, with both Weyl orbits sorted); the dual sends the multiset to its negative.
Thus the coefficient in Lemma 3.14 can be the same Xi as the CardK/P consumer, not a separately
chosen Xi'. No new weight, rank, host, or level parameter. Central scalar on the tensor product
cancels; removing the real split directions at each complex place only removes trivial exterior
factors. Restoring the full Hermitian cochain complex can add exterior factors, not reduce dimension.

Lemma 3.15 and Borel's finite-level cuspidal injection imply that each distinct cuspidal summand
with nonzero U-fixed vector contributes this many independent classes at level U.
Compact-open fixed-vector functor exact over C by averaging; each summand has dimension of fixed
vectors >=1. At the native level, group-cohomology identification via the exact coinduction
map and Shapiro from RUN45 is required, along with K-finite representation identification, rational
coefficient and infinitesimal-character normalization, central action and symmetric-space comparison.
The published lower bound on ordinary cohomology, once these identifications are established, is:
    2^(r2*(a-1)) * |S| <= cohDim(top,U,ratC Xi).
In fact |S| <= dimension in the one common bottom degree if comparing the reduced complex (and
the full complex with trivial central action). We use the conservative total lower bound only.
For native CardK/P rank n and same U=KLev K n (3M), r2=[K:Q]/2,
    2^(r2*(n-1)) * |S| <= c2*M^A2*Xi.d <= c2*c1*M^A2*(H+1)^A1.
This is stronger than the old unweighted bound; no exponent improvement claimed. Native code below
uses the weaker original unweighted conclusion by exact monotonicity. The new matched weighted
interface is an EXPLICIT OPEN premise, not an axiom or a claim of discharged native comparison.

Original source-visible graph (RUN44): CardK/P -> Weyl + ClozelCohC -> ClozelCohomological,
Wigner, algIso, cohTransport; BorelInjC -> harmEx -> levelCo -> basicEx; deRhamInj, rapid,
noExact, pairing and other suppliers. Candidate local graph: same native Weyl, same cohBoundFree,
one matched weighted comparison -> card_k_lit46/cardP_lit46 -> countK_alt_lit46/countP_alt_lit46.
Original native callers and graph retained; no global removal of hP. Other countK/P caller
uses of hP (Satake, conjugation, integrality, Frobenius) remain EXACTLY unchanged.
Context key pin, K, n, m, Xi, all embeddings, U=KLev K n (3M), S, pairwise nonisomorphism,
actual countK/P callers. Backtrack to RUN44/45 original suppliers on any failure.
Native source blobs: TCardK c6eb1d67f72c45007e3330ea65b0966f3f27cd96;
BrCardP a2e96d9c993a392281385cc7f723acf78e614b21;
FrobeniusTraceCountBoundOfCmEigensystemCount 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40;
GelfandKazhdanReal 5950874949bd0b4b4f22191c009aff80c520cf5c;
HasCohomology ec55ca626b57c37d58f482abeeb1c7f03bcd377a;
ClozelCohC a9018b183d3e089c17cec8b6a4052aad80f9880e;
RUN44 certificate blob 02513c14c9de16d5833f9ad0012e24836964b0e2; RUN45 retained.
Executed 42 guarded source checks and 192 exact BigInt exterior-polynomial
convolutions (ranks 1..16, r2 1..12). Checks: actual CountK/P blob; both card suppliers; extract helpers plus two card bodies; matched premise 1 unique; matched premise 1 reversible; matched binder 1 unique; matched binder 1 reversible; same level weighted count 1 unique; same level weighted count 1 reversible; exact matching input 1 unique; exact matching input 1 reversible; recover original count 1 unique; recover original count 1 reversible; matched premise 2 unique; matched premise 2 reversible; matched binder 2 unique; matched binder 2 reversible; same level weighted count 2 unique; same level weighted count 2 reversible; exact matching input 2 unique; exact matching input 2 reversible; recover original count 2 unique; recover original count 2 reversible; actual caller sections; both actual consumers; separate count callers; caller rename 0 unique; caller rename 0 reversible; caller hypothesis 0 unique; caller hypothesis 0 reversible; caller binder 0 unique; caller binder 0 reversible; actual caller substitution 0 unique; actual caller substitution 0 reversible; caller rename 1 unique; caller rename 1 reversible; caller hypothesis 1 unique; caller hypothesis 1 reversible; caller binder 1 unique; caller binder 1 reversible; actual caller substitution 1 unique; actual caller substitution 1 reversible.
This is a finite algebra check, not a proof of the automorphic comparison.
Local lean/lake/elan absent. Historical jobs 45577239749 and 45576756833 retrieved today:
pick/run/record completed success, baseline only. No new CI or axiom PASS claimed.
No protected workflow changes. Not queued in this run.

RESUME HERE: authenticate same-host native CuspSub Harish-Chandra factorization and full
Hermitian cochain vs Clozel reduced cochains at fixed U; stage native weighted certificate
and actual countK/P replacement with existing engine batch; inspect all axiom/constructor
dependencies, especially cohBoundFree. Preserve original graph and all unresolved branches.
HANDOFF TO Galois, literature, integration, audit, kernel. RH OPEN.
-/

noncomputable section
open NumberField Matrix GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.AlgRepEndIrreducible UpperTheory.V.Af

namespace UpperTheory.V.Af

def MatchedBorelWeighted46 : Prop :=
  ∀ (E : Type) [Field E] [NumberField E] [IsTotallyComplex E] (a : ℕ), 1 ≤ a →
    ∀ (U : Subgroup (GL (Fin a) (Af E))), IsOpen (U : Set (GL (Fin a) (Af E))) →
      IsCompact (U : Set (GL (Fin a) (Af E))) →
    ∀ (Ξ : GlobalTheory.GKCoh.AlgRep E a) (S : Finset (CuspSub E a)),
      (∀ π ∈ S, ∀ π' ∈ S, π.Iso π' → π = π') →
      (∀ π ∈ S, (∀ τ, ∃ m, π.HasInfChar τ m ∧ AlgInfChar Ξ τ (m.map Neg.neg)) ∧ HasFixed π.finPart U) →
      ((S.card * 2 ^ (Fintype.card (E →+* ℂ) / 2 * (a - 1)) : ℕ) : Cardinal) ≤ cohDim ⊤ U (ratC Ξ)

theorem forget_weight46 (m f : ℕ) (c : Cardinal) (hf : 1 ≤ f)
    (h : ((m * f : ℕ) : Cardinal) ≤ c) : (m : Cardinal) ≤ c := by
  have hm : m ≤ m * f := by
    simpa using Nat.mul_le_mul_left m hf
  exact (Nat.cast_le.2 hm).trans h

end UpperTheory.V.Af

theorem UpperTheory.V.Af.weyl_complex_lit46 :
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

private theorem klev_three_lit46 (K : Type) [Field K] [NumberField K] (n M : ℕ) :
    UpperTheory.V.Af.KLev K n (3 * M) ≤ UpperTheory.V.Af.KLev K n M := by
  refine Subgroup.map_mono fun k hk => ?_
  have hle : Ideal.span {((3 * M : ℕ) : ↥(UpperTheory.V.Af.Ohat K))} ≤ Ideal.span {(M : ↥(UpperTheory.V.Af.Ohat K))} :=
    Ideal.span_singleton_le_span_singleton.2 (Nat.cast_dvd_cast (Dvd.intro_left 3 rfl))
  have e := congrArg (Matrix.GeneralLinearGroup.map (n := Fin n) (Ideal.Quotient.factor hle)) (MonoidHom.mem_ker.1 hk)
  rw [map_one] at e
  exact e


theorem UpperTheory.V.Af.card_k_lit46 :
    UpperTheory.V.Af.MatchedBorelWeighted46 → UpperTheory.V.Af.CardK := by
  intro hMatched K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_lit46 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hWgt := hMatched K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three_lit46 K n M hu)⟩⟩
  have hB := UpperTheory.V.Af.forget_weight46 S.card (2 ^ (Fintype.card (K →+* ℂ) / 2 * (n - 1))) _
    (Nat.succ_le_of_lt (pow_pos (by decide : 0 < (2 : ℕ)) _)) hWgt
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring

theorem UpperTheory.V.Br.cardP_lit46 :
    UpperTheory.V.Af.MatchedBorelWeighted46 → UpperTheory.V.Br.CardP := by
  intro hMatched K _ _ _ n hn
  obtain ⟨c₁, A₁, hW⟩ := _root_.UpperTheory.V.Af.weyl_complex_lit46 K n
  obtain ⟨c₂, A₂, hC⟩ := UpperTheory.V.Af.cohBoundFree K (Or.inl inferInstance) n ⊤ inferInstance
  refine ⟨c₂ * c₁, A₁ + A₂, fun m hm H hH M hM S hS hiso => ?_⟩
  obtain ⟨Ξ, hΞ, hd⟩ := hW m hm H hH
  have h3 : 1 ≤ 3 * M := by omega
  have hWgt := hMatched K n (by omega) (UpperTheory.V.Af.KLev K n (3 * M)) (by apply UpperTheory.V.Af.isOpen_KLev; exact h3)
    (by apply UpperTheory.V.Af.isCompact_KLev; exact h3) Ξ S hiso fun π hπ =>
      ⟨fun τ => ⟨_, (hS π hπ).1 τ, hΞ τ⟩,
        (hS π hπ).2.2.imp fun _ hv => ⟨hv.1, fun u hu => hv.2 u (klev_three_lit46 K n M hu)⟩⟩
  have hB := UpperTheory.V.Af.forget_weight46 S.card (2 ^ (Fintype.card (K →+* ℂ) / 2 * (n - 1))) _
    (Nat.succ_le_of_lt (pow_pos (by decide : 0 < (2 : ℕ)) _)) hWgt
  have h1 : S.card ≤ c₂ * M ^ A₂ * Ξ.d := Nat.cast_le.1 (hB.trans (hC M hM _ _))
  have h2 : M ^ A₂ ≤ M ^ (A₁ + A₂) := Nat.pow_le_pow_right hM (by omega)
  have h4 : (H + 1) ^ A₁ ≤ (H + 1) ^ (A₁ + A₂) := Nat.pow_le_pow_right (by omega) (by omega)
  calc S.card ≤ c₂ * M ^ A₂ * Ξ.d := h1
    _ ≤ c₂ * M ^ (A₁ + A₂) * (c₁ * (H + 1) ^ (A₁ + A₂)) :=
        Nat.mul_le_mul (Nat.mul_le_mul_left _ h2) (hd.trans (Nat.mul_le_mul_left _ h4))
    _ = c₂ * c₁ * (M * (H + 1)) ^ (A₁ + A₂) := by rw [mul_pow]; ring


set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
namespace UpperTheory.GalN.V.Win.N
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N GlobalTheory.CuspRep UpperTheory.V.Af in
theorem countK_alt_lit46 :
    _root_.UpperTheory.V.Af.MatchedBorelWeighted46 → _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelKNAlt → _root_.UpperTheory.GalN.V.Win.N.CountKAlt := by
  intro hMatched hP hL K _ _ _ n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Af.card_k_lit46 hMatched K n hn
  refine ⟨c, A, fun m hm hwt H hH M hM p w hp hw hpM hpd => ?_⟩
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigK K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigK K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard m hm H hH M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.V.Af.conjK_alt hP K n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := 1 - n)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB, algSat, Multiset.card_map, ← hB.card]
      simp)
    (by exact zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w))
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact win_algSat (by omega) π m _ hwt hπ.1 hB)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact _root_.UpperTheory.V.Z.Int.intK_of_prints hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmKNAlt ι M m r}, ∃ π : ↥(SigK K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, h1, h2, h3⟩ := r.2.aut.1
    obtain ⟨hπ, hF⟩ := hL K n hn m hm M hM l hl2 Ω ι r.1 π r.2.level r.2.odd (r.2.aut.2 r.2.level.cont) h1 h2 h3
    refine ⟨⟨π, hπ⟩, h3.1, fun v hv => ?_⟩
    obtain ⟨B, hB⟩ := hsat π hπ v
    rw [hsys π v B hB]
    exact hF v.1 hv B hB
  choose f hss hf using hform
  refine ⟨fun r => cl (f r), fun r r' h => ?_, fun r => ?_⟩
  · refine _root_.UpperTheory.V.Af.iso_of_frobenius_of_printed_results hP K Ω l ι n r.1 r'.1 r.2.level.cont r'.2.level.cont (hss r) (hss r') ?_
    filter_upwards [eventually_natCast_notMem (F := K) (M := M) (by omega),
      eventually_natCast_notMem (F := K) hl.out.ne_zero] with v hvM hvl
    refine ⟨sys (f r) ⟨v, hvM⟩, hf r ⟨v, hvM⟩ hvl, ?_⟩
    rw [hcl _ _ h]
    exact hf r' ⟨v, hvM⟩ hvl
  · rw [hβ]
    refine hf r ⟨w, hwM⟩ (natCast_notMem_of_not_dvd hp hw fun h => hlp ?_)
    exact ((Nat.prime_dvd_prime_iff_eq hp hl.out).1 h).symm
end
section
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N GlobalTheory.CuspRep UpperTheory.V.Af in
theorem countP_alt_lit46 :
    _root_.UpperTheory.V.Af.MatchedBorelWeighted46 → _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.Win.N.CountPAlt := by
  intro hMatched hP hL K _ _ _ hK n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Br.cardP_lit46 hMatched K n hn
  refine ⟨c, A, fun m wt hm hwt H hH M hM p w hp hw hpM hpd => ?_⟩
  have hwM : (M : 𝓞 K) ∉ w.asIdeal := natCast_notMem_of_not_dvd hp hw hpM
  let Wd := {v : HeightOneSpectrum (𝓞 K) // (M : 𝓞 K) ∉ v.asIdeal}
  let sys : CuspSub K n → Wd → Multiset ℂ := fun π v =>
    if h : ∃ B, (CG.mk π).HasSat v.1 B then algSat n (normV v.1) h.choose else 0
  have hsys : ∀ π (v : Wd) B, (CG.mk π).HasSat v.1 B → sys π v = algSat n (normV v.1) B := by
    intro π v B hB
    have h : ∃ B, (CG.mk π).HasSat v.1 B := ⟨B, hB⟩
    simp only [sys, dif_pos h]
    rw [h.choose_spec.unique hB]
  have hsat : ∀ π ∈ SigP K m M, ∀ v : Wd, ∃ B, (CG.mk π).HasSat v.1 B := fun π hπ v =>
    _root_.UpperTheory.V.Af.satake_k_of_printed_results hP K n M π hπ.2.2 v.1 v.2
  obtain ⟨D, hD, cl, hcl, hβ⟩ := exists_eigData (SigP K m M) (fun π π' => π.Iso π') sys
    (fun π hπ π' _ h => funext fun v => by
      obtain ⟨B, hB⟩ := hsat π hπ v
      rw [hsys π v B hB, hsys π' v B (CuspSub.Iso.hasSatGL h hB)])
    (c * (M * (H + 1)) ^ A) (hcard m hm H hH M hM)
    (fun σ π hπ => by
      obtain ⟨π', hπ', h⟩ := _root_.UpperTheory.GalN.V.conjP_alt hP K hK n hn m hm M hM σ π hπ
      refine ⟨π', hπ', fun v => ?_⟩
      obtain ⟨B, hB⟩ := hsat π hπ v
      obtain ⟨B', hB', e⟩ := h v.1 B hB
      rw [hsys π v B hB, hsys π' v B' hB', e])
    ⟨w, hwM⟩ (n := n) (q := normV w) (m := m) (wt := wt)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB, algSat, Multiset.card_map, ← hB.card]
      simp)
    (by exact zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w))
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact win_algSat (by omega) π m _ hwt hπ.1 hB)
    (fun π hπ => by
      obtain ⟨B, hB⟩ := hsat π hπ ⟨w, hwM⟩
      rw [hsys π _ B hB]
      exact _root_.UpperTheory.V.Z.Int.intP'_alt hP K n hn m hm M hM π hπ p w hp hw hpM hpd B hB)
  refine ⟨D, hD, fun l hl hl2 hlp Ω _ _ _ ι => ?_⟩
  have hform : ∀ r : {r : G K Ω →* GL (Fin n) (Qbar l) // _root_.UpperTheory.GalN.V.AdmPNAlt ι M m r}, ∃ π : ↥(SigP K m M), IsSSRep r.1 ∧
      ∀ v : Wd, (l : 𝓞 K) ∉ v.1.asIdeal → FrobEig ι r.1 v.1 (sys π v) := by
    intro r
    obtain ⟨π, h1, h2, h3⟩ := r.2.aut
    obtain ⟨hπ, hF⟩ := hL K hK n hn m hm M hM l hl2 Ω ι r.1 π r.2.level r.2.safe r.2.unl h1 h2 h3
    refine ⟨⟨π, hπ⟩, h3.1, fun v hv => ?_⟩
    obtain ⟨B, hB⟩ := hsat π hπ v
    rw [hsys π v B hB]
    exact hF v.1 hv B hB
  choose f hss hf using hform
  refine ⟨fun r => cl (f r), fun r r' h => ?_, fun r => ?_⟩
  · refine _root_.UpperTheory.V.Af.iso_of_frobenius_of_printed_results hP K Ω l ι n r.1 r'.1 r.2.level.cont r'.2.level.cont (hss r) (hss r') ?_
    filter_upwards [eventually_natCast_notMem (F := K) (M := M) (by omega),
      eventually_natCast_notMem (F := K) hl.out.ne_zero] with v hvM hvl
    refine ⟨sys (f r) ⟨v, hvM⟩, hf r ⟨v, hvM⟩ hvl, ?_⟩
    rw [hcl _ _ h]
    exact hf r' ⟨v, hvM⟩ hvl
  · rw [hβ]
    refine hf r ⟨w, hwM⟩ (natCast_notMem_of_not_dvd hp hw fun h => hlp ?_)
    exact ((Nat.prime_dvd_prime_iff_eq hp hl.out).1 h).symm
end

end UpperTheory.GalN.V.Win.N

theorem UpperTheory.V.Af.replay_card_k_lit46
    (h : UpperTheory.V.Af.MatchedBorelWeighted46) : UpperTheory.V.Af.CardK := by
  first
  | (rh_reduce 2 using [UpperTheory.V.Af.card_k_lit46]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact UpperTheory.V.Af.card_k_lit46 h

rh_scan UpperTheory.V.Af.card_k_of_printed_results limit 2000
rh_scan UpperTheory.V.Af.card_k_lit46 limit 2000
rh_scan UpperTheory.V.Br.cardP_lit46 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countK_alt_lit46 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_alt_lit46 limit 2000
rh_prune UpperTheory.V.Af.replay_card_k_lit46 as RH46LitCardKPruned
#print axioms UpperTheory.V.Af.forget_weight46
#print axioms UpperTheory.V.Af.card_k_lit46
#print axioms UpperTheory.V.Br.cardP_lit46
#print axioms UpperTheory.GalN.V.Win.N.countK_alt_lit46
#print axioms UpperTheory.GalN.V.Win.N.countP_alt_lit46
