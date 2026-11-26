import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.IntegralDeterminants.IntPHolds
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN49 lane 5, 26 Nov 2026. SOURCE-MATCHED / PREPARED; NOT ELABORATED.
Latest mission blob 3c16485083ac46320b2510ec5152b33ef87ea6a9, mandatory engine; earlier sprint fb152e2897b4c1c320c43b9f42ae0ec088a7da45.
SWARM, HANDOFF, EXPANSION, AGENTS consulted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474. Upstream observed e4098b46b46c934574c0abba2d107d1fd9c8bfcf, not migrated.
Recent peers: 4d38e39e (CountQ aggregation), 03b9179d (shared replay), c486b17b (combined odd rank), 526075be (integration). RUN30/31/45/48 preserved. No duplicate build.

RESULT: eliminate the separately proved inverse Satake-root bound along the actual uniform CountPAlt integrality supplier. For q>0, m_i+m_rev(i)=wt and pure b with |b|=q^(-wt/2),
  q^a/b = conjugate(q^(a+wt) b).
If -a<=m_i for every i, then m_i<=a+wt for every i by reversal.
The right side is integral by the forward bound and invariance of algebraic integers under conjugation. This proves the full native SlopesIn, not merely a bound on the trace. At the actual rank-two weights (e,-e), wt=0, it is q^e/b=conj(q^e b); no second inverse-operator estimate needed. Negative exponents retained, no assumption q^a integral. No use of RH. The forward bound still uses all primes and all embeddings. In the existing native source coreU the two branches were proved separately; the replacement carries only the forward branch through slopeCsd, good twist cancellation, splitting base change, and global integrality, then recovers both at the CountPAlt consumer via purity and symmetric weights already present. No change to the catalogue cardinality witness, quantifiers, Satake classification, Galois stability, polarization, level, or Frobenius isomorphism. This is not a new uniform cardinality proof; it narrows its integrality supplier. Original bundled eigAll/opBound still have both directions in their types and bodies. Do not claim inverse dependencies globally gone until role-inclusive scans and forward-only supplier reductions. CountK sibling unchanged.

Native blobs relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/IntegralDeterminants/PlaceConjAlt.lean 81fe30bbeb4e5a1996de4de7c4eb607a5893cd49
ModularityArgument/IntegralDeterminants/WeightBounds.lean 46b0c71c1059d189c43d8ff0ac50453af8c76e0d
ModularityArgument/IntegralDeterminants/SlopeGood.lean 3ca5398f391dd8c471acabe14f7bb8a38a20167f
ModularityArgument/IntegralDeterminants/SlopeCsd.lean 3501215e11e5aa90f926ed6316425fc7d88b0c80
ModularityArgument/IntegralDeterminants/SlopeAllOf.lean 8f368bb1a80f33467934d5e9815c0c64a6ca0c20
GaloisLibrary/CrystallineBaseChange/CqStmt.lean 13f9ae82d949d70758bdf3fc7c579eac88d41bbd
ModularityArgument/ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
IntPOfDesc d4e38aa38694912b5aed16b0a0eb77de8bc6f16e; SlopeAll 3b3f42579b04b35ae5fef7c188893c2af4c7d981; IntPHolds 54a30c11ce1eb1a1fd8a29e231f496b29c25e17f; CountSys 93024dc7e7b5e4af5663143e6ae42edf246f05e7.
Original selected source graph: NumberU3U_s -> countQ_alt -> countP_alt -> exists_eigData, intP'_alt -> intP_holds -> intP_of_desc -> intP -> slopeAll -> slopeAllOf, slopeGood, slopeCsd -> coreU -> forward and inverse roots_le, opBound and eigAll; slopeGood also uses both untwist directions. Reduced candidate: countP_native49 -> countP_alt49 -> slopes_of_forward49 (pure, reversal, conjugation) + intP_forward49 -> slopeAllOf49, slopeGood49, slopeCsd49 -> coreU_forward49 (forward roots only), unchanged bundled opBound/eigAll. Same native quadLift and descOffT. All other original edges, pending type/value/constructor obligations and axiom ledgers retained, no global removal. Cache by source/toolchain, K,n,m,wt,M,w,B, actual host, l,iota, split-base-change field, twist, chosen weights, direction and consumer. No cross-context reuse. Backtrack to original countP_alt on failed replay.

Executed 63 fail-closed source checks in the generating connector call: 7 pinned blobs, extraction and unique splice anchors, forward branch retained, inverse root/twist/integrality branches absent, same classification/quantifiers and reversible actual CountP caller splice. No fabricated numerical tests; new Lean code not compiled locally (Lean/lake/elan absent). Historical baseline CI 45577239749,45576756833 status retrieved returncode 0 only for baseline. Actual shared run 45773743341 status blob 22989ce418dbfe8731db225af351ca57592ead73 returncode 1 after 133.27s before candidate elaboration: unhandled Unicode import GaloisCohomology₂ due ASCII parser. Kernel lane owns repair/replay; this file not queued. No new Lean PASS, no new root leaf closed, no URT claim.
RESUME HERE: add this single certificate to the repaired shared native replay after current queue. Verify conjugation lemma, exact forward chain and original-interface bridge; compare constructor-inclusive graph/axioms and pending counts. On failure keep original consumer. If accepted, specialize eigAll/opBound forward-only to remove inverse construction at their actual suppliers; preserve independent CountK and cardinality/level suppliers. Prioritize genuine uniform arithmetic and prime-window gap, not more equivalent scalar rewrites.
HANDOFF TO lane 11 kernel, lane 14 acceleration, literature, audit, integration. RH OPEN.
-/
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
noncomputable section
section
open NumberField IsDedekindDomain Matrix Neutral.B1 Formalism.L2.Host Formalism.ConjugateSelfDual Formalism.BasicNotions Formalism.MainNotions.N GlobalTheory.CuspRep GlobalTheory.UnitaryBC GlobalTheory.GalOfCusp UpperTheory.V.Af UpperTheory.V.Br
open scoped Classical WithZero
namespace UpperTheory.V.Z.Int
def ForwardSlopes49 {n : ℕ} (q : ℕ) (m : Fin n → ℤ) (B : Multiset ℂ) : Prop :=
  ∀ b ∈ B, ∀ a : ℤ, (∀ i, m i ≤ a) → IsIntegral ℤ ((q : ℂ) ^ a * b)
section
variable {l : ℕ} [Fact l.Prime] (ι : Qbar l ≃+* ℂ) {E : Type} [Field E] [NumberField E]
def ForwardSlope49 (n : ℕ) (w : HeightOneSpectrum (𝓞 E)) (inf : (E →+* ℂ) → Multiset ℂ) (B : Multiset ℂˣ) : Prop :=
  ∀ lo hi : (E →+* ℂ) → ℤ, (∀ τ, Within n (inf τ) (lo τ) (hi τ)) →
    ∀ b ∈ algSat n (normV w) B, Bnd ι w hi b


end
def ForwardCoreU49 : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (ι : Qbar l ≃+* ℂ) (E : Type) [Field E] [NumberField E] [IsCMField E] (n : ℕ), 1 ≤ n → ∀ σ : Submodule ℂ (UA E n → ℂ), IsAutRepU σ →
    ∀ lam : (E →+* ℂ) → DomWeight n, (∀ τ, HasWeightAt σ τ (lam τ)) → ∀ w : HeightOneSpectrum (𝓞 E), IsSplitAt w →
    ∀ (τ : SmIrr (GL (Fin n) (w.adicCompletion E))) (B : Multiset ℂˣ), IsCompAlong σ (locU n w) ((cLoc w).comp (locU n w).subtype) τ.ρ →
    GlobalTheory.LFun.HasSatGL w τ.ρ B → ForwardSlope49 ι n w (fun φ => infOfWeight (lam φ)) B

def ForwardSlopeOn49 (s : GlobalTheory.GalCut.Level) : Prop :=
  ∀ (l : ℕ) [Fact l.Prime] (ι : Qbar l ≃+* ℂ) (E : Type) [Field E] [NumberField E] [IsCMField E] (l' n : ℕ), l'.Prime → 1 ≤ n →
    ∀ (π : CuspSub E n) (χ : HChar (maximalRealSubfield E)), GlobalTheory.GalCut.InScope s l' π χ → ∀ w : HeightOneSpectrum (𝓞 E), IsSplitAt w →
    ∀ B, (CG.mk π).HasSat w B → ForwardSlope49 ι n w (CG.mk π).infChar B

def ForwardSlopeAll49 : Prop :=
  ∀ (E : Type) [Field E] [NumberField E] [IsCMField E] (n : ℕ), 1 ≤ n → ∀ (m : Fin n → ℤ), StrictAnti m → ∀ π : CuspSub E n, (∀ τ, π.HasInfChar τ (infOf m)) →
    (∃ χ, GlobalTheory.ContraPair.PolarizedPair π χ) → ∀ (w : HeightOneSpectrum (𝓞 E)) B, (CG.mk π).HasSat w B → ForwardSlopes49 (normV w) m (algSat n (normV w) B)


def ForwardIntP49 : Prop :=
  ∀ (K : Type) [Field K] [NumberField K] [IsCMField K] (n : ℕ), 2 ≤ n → ∀ (m : Fin n → ℤ), StrictAnti m → ∀ M : ℕ, 1 ≤ M →
    ∀ π ∈ SigP K m M, ∀ (p : ℕ) (w : HeightOneSpectrum (𝓞 K)), p.Prime → (p : 𝓞 K) ∈ w.asIdeal → ¬ p ∣ M →
      ¬ (p : ℤ) ∣ discr K → ∀ B, (CG.mk π).HasSat w B → ForwardSlopes49 (normV w) m (algSat n (normV w) B)


section Nu

variable {l : ℕ} [Fact l.Prime] (ι : Qbar l ≃+* ℂ)

private theorem nu_mul' (x y : ℂ) : nu ι (x * y) = nu ι x * nu ι y := by
  simp [nu, map_mul, norm_mul]

private theorem nu_pow' (x : ℂ) (k : ℕ) : nu ι (x ^ k) = nu ι x ^ k := by
  simp [nu, map_pow, norm_pow]

private theorem nu_zero' : nu ι 0 = 0 := by
  simp [nu]

private theorem nu_nonneg' (x : ℂ) : 0 ≤ nu ι x := norm_nonneg _

private theorem roots_le49 {q : ℂ} (hq : nu ι q ≤ 1) {c : ℝ} (hc : 0 ≤ c) (S : Multiset ℂ)
    (h : ∀ j, 1 ≤ j → j ≤ S.card → ∃ a : ℂ, q ^ j.choose 2 * a = S.esymm j ∧ nu ι a ≤ c ^ j) :
    ∀ b ∈ S, nu ι b ≤ c := by
  refine rootBound l ι S c hc fun j h1 h2 => ?_
  obtain ⟨a, ha, hb⟩ := h j h1 h2
  rw [← ha, nu_mul', nu_pow']
  calc nu ι q ^ j.choose 2 * nu ι a ≤ 1 * nu ι a :=
        mul_le_mul_of_nonneg_right (pow_le_one₀ (nu_nonneg' ι q) hq) (nu_nonneg' ι a)
    _ ≤ c ^ j := by rwa [one_mul]

end Nu

private theorem weight_bounds49 {n : ℕ} (hn : 1 ≤ n) (lam : DomWeight n) {lo hi : ℤ}
    (h : Within n (infOfWeight lam) lo hi) (i : Fin n) :
    lo + ((n : ℤ) - 1) ≤ lam.w i ∧ lam.w i ≤ hi := by
  have key : ∀ k : Fin n, lo + ((k : ℕ) : ℤ) ≤ lam.w k ∧ lam.w k ≤ hi + ((k : ℕ) : ℤ) := by
    intro k
    obtain ⟨m, hm, h1, h2⟩ := h ((lam.w k : ℂ) + (((n : ℂ) - 1) / 2 - (k : ℕ)))
      (Multiset.mem_map.2 ⟨k, Finset.mem_univ_val k, rfl⟩)
    have e1 : ((lam.w k - ((k : ℕ) : ℤ) : ℤ) : ℂ) = (m : ℂ) := by
      push_cast
      linear_combination hm
    have e2 : lam.w k - ((k : ℕ) : ℤ) = m := by exact_mod_cast e1
    omega
  have h0 := (key ⟨0, by omega⟩).2
  have h1 := (key ⟨n - 1, by omega⟩).1
  have a0 : lam.w i ≤ lam.w ⟨0, by omega⟩ := lam.anti (Fin.mk_le_of_le_val (Nat.zero_le _))
  have a1 : lam.w ⟨n - 1, by omega⟩ ≤ lam.w i := lam.anti (Fin.le_def.2 (by simp; omega))
  simp only at h0 h1
  omega

theorem coreU_forward49 : ForwardCoreU49 := by
  intro l _ ι E _ _ _ n hn σ hσ lam hlam w hw τ B hc hB lo hi hW b hb
  obtain ⟨hun, hcard, hE⟩ := eigAll E n σ hσ w hw τ B hc hB
  obtain ⟨hv, hprod⟩ := prodNorm l ι E w
  have hvne : ∀ t ∈ Ov ι w, nu ι (t (unif w : E)) ≠ 0 := fun t ht => (hv t ht).1.ne'
  have hq1 : nu ι (normV w : ℂ) ≤ 1 := by
    rw [← hprod]
    exact Finset.prod_le_one (fun t ht => (hv t ht).1.le) fun t ht => (hv t ht).2.le
  have hq0 : 0 < nu ι (normV w : ℂ) := by
    rw [← hprod]
    exact Finset.prod_pos fun t ht => (hv t ht).1
  have hqne : (normV w : ℂ) ≠ 0 := by
    intro h0
    rw [h0, nu_zero'] at hq0
    exact lt_irrefl _ hq0
  have hlh : ∀ t i, lo t + ((n : ℤ) - 1) ≤ (lam t).w i ∧ (lam t).w i ≤ hi t :=
    fun t i => weight_bounds49 hn (lam t) (hW t) i
  have hop := opBound l ι E n hn σ hσ lam hlam w hw hun (fun t => lo t + ((n : ℤ) - 1)) hi hlh
  have hPhi : 0 ≤ ∏ t ∈ Ov ι w, nu ι (t (unif w : E)) ^ (-hi t) :=
    Finset.prod_nonneg fun t ht => zpow_nonneg (hv t ht).1.le _
  have hroot : ∀ x ∈ algSat n (normV w) B, nu ι x ≤ ∏ t ∈ Ov ι w, nu ι (t (unif w : E)) ^ (-hi t) := by
    refine roots_le49 ι hq1 hPhi _ fun j _ hj => ?_
    have hjn : j ≤ n := by simpa [algSat, hcard] using hj
    obtain ⟨s, s', hs, hs', he⟩ := hE j hjn
    refine ⟨((normV w : ℂ) ^ j.choose 2)⁻¹ * (algSat n (normV w) B).esymm j,
      mul_inv_cancel_left₀ (pow_ne_zero _ hqne) _, ?_⟩
    refine (hop j s _ fun f hf hsph => ?_).1 hs
    rw [mul_smul, ← (he f hf hsph).1, inv_smul_smul₀ (pow_ne_zero _ hqne)]

  have h1 := hroot b hb
  have h2 : (∏ t ∈ Ov ι w, nu ι (t (unif w : E)) ^ (-hi t)) *
      ∏ t ∈ Ov ι w, nu ι (t (unif w : E)) ^ hi t = 1 := by
    rw [← Finset.prod_mul_distrib]
    refine Finset.prod_eq_one fun t ht => ?_
    rw [_root_.zpow_neg, inv_mul_cancel₀ (zpow_ne_zero _ (hvne t ht))]
  have h3 : 0 ≤ ∏ t ∈ Ov ι w, nu ι (t (unif w : E)) ^ hi t :=
    Finset.prod_nonneg fun t ht => zpow_nonneg (hv t ht).1.le _
  show nu ι b * ∏ t ∈ Ov ι w, nu ι (t (unif w : E)) ^ hi t ≤ 1
  rw [← h2]
  exact mul_le_mul_of_nonneg_right h1 h3

private theorem nu_mul49 {l : ℕ} [Fact l.Prime] (ι : Qbar l ≃+* ℂ) (x y : ℂ) :
    nu ι (x * y) = nu ι x * nu ι y := by
  simp [nu, map_mul, norm_mul]

private theorem algSat_map49 (n q : ℕ) (B : Multiset ℂˣ) :
    algSat n q B = B.map fun α : ℂˣ => (((q : ℝ) ^ (((n : ℝ) - 1) / 2) : ℝ) : ℂ) * (α : ℂ) := by
  simp [algSat, Multiset.bind_singleton, Multiset.map_map]

private theorem prod_zpow_add49 {α : Type} (s : Finset α) (p : α → ℝ) (hp : ∀ t ∈ s, 0 < p t) (a c : α → ℤ) :
    ∏ t ∈ s, p t ^ (a t + c t) = (∏ t ∈ s, p t ^ a t) * ∏ t ∈ s, p t ^ c t := by
  rw [← Finset.prod_mul_distrib]
  exact Finset.prod_congr rfl fun t ht => zpow_add₀ (hp t ht).ne' _ _

private theorem bnd_untwist49 {l : ℕ} [Fact l.Prime] (ι : Qbar l ≃+* ℂ) {E : Type} [Field E] [NumberField E]
    (w : HeightOneSpectrum (𝓞 E)) (hp : ∀ τ ∈ Ov ι w, 0 < nu ι (τ (unif w : E)))
    (m hi : (E →+* ℂ) → ℤ) (e b : ℂ)
    (he : nu ι e * ∏ τ ∈ Ov ι w, nu ι (τ (unif w : E)) ^ m τ = 1)
    (h1 : Bnd ι w (fun τ => hi τ + m τ) (b * e)) :
    Bnd ι w hi b := by
  unfold Bnd at *
  set p : (E →+* ℂ) → ℝ := fun τ => nu ι (τ (unif w : E)) with hpdef
  set M := ∏ τ ∈ Ov ι w, p τ ^ m τ with hM
  rw [prod_zpow_add49 _ p hp hi m, nu_mul49] at h1
  calc _ = nu ι b * (∏ τ ∈ Ov ι w, p τ ^ hi τ) * (nu ι e * M) := by rw [he, mul_one]
      _ = _ := by ring
      _ ≤ 1 := h1

theorem slopeGood49 :
    ForwardSlopeOn49 .csd → ForwardSlopeOn49 .good := by
  intro hC l _ ι E _ _ _ l' n hl' hn π χ hS w hw B hB lo hi hW b hb
  obtain ⟨κ, m, hκ, hu, hS'⟩ := GlobalTheory.T.exists_good_conjSelfDual_twist_split_unramified GlobalTheory.automorphicFormsFiniteGL E l' n hn π χ hS w hw
  have hB' : (CG.mk (π.twist κ)).HasSat w (B.map (· * κ.val w)) := by
    rw [CG.hasSat_mk] at hB ⊢
    exact GlobalTheory.SphGal.hasSatGL_twist E n π κ w B hu hB
  have hinf : ∀ τ, (CG.mk (π.twist κ)).infChar τ = ((CG.mk π).infChar τ).map (· + (m τ : ℂ)) := by
    intro τ
    rw [← (GlobalTheory.CuspRep.InfType.expo_of_infType E κ).1 m hκ τ]
    exact ((GlobalTheory.CuspRep.ParLaws.hasInfChar_infChar (CG.mk π) _).twist κ).infChar_eq
  have hW' : ∀ τ, Within n ((CG.mk (π.twist κ)).infChar τ) (lo τ + m τ) (hi τ + m τ) := by
    intro τ z hz
    rw [hinf, Multiset.mem_map] at hz
    obtain ⟨y, hy, rfl⟩ := hz
    obtain ⟨k, rfl, h1, h2⟩ := hW τ y hy
    exact ⟨k + m τ, by push_cast; ring, by omega, by omega⟩
  have hb' : b * (κ.val w : ℂ) ∈ algSat n (normV w) (B.map (· * κ.val w)) := by
    rw [algSat_map49] at hb ⊢
    rw [Multiset.mem_map] at hb
    obtain ⟨α, hα, rfl⟩ := hb
    rw [Multiset.map_map, Multiset.mem_map]
    exact ⟨α, hα, by simp [mul_assoc]⟩
  have h1 := hC l ι E l' n hl' hn (π.twist κ) _ hS' w hw _ hB' _ _ hW' _ hb'
  exact bnd_untwist49 ι w (fun τ hτ => ((prodNorm l ι E w).1 τ hτ).1) m hi _ b
    (charVal l ι E κ m hκ w hu) h1

theorem slopeCsd49 :
    GlobalTheory.Cong.DescOffT → ForwardSlopeOn49 .csd := by
  intro hD l _ ι E _ _ _ l' n hl' hn π χ hs w hw B hB
  obtain ⟨h1, h2, h3, rfl⟩ := hs
  obtain ⟨T, -, -, U, hU⟩ := hD E l' n hl' hn π ⟨h1, h2, h3, rfl⟩ ∅
  choose lam hlam using GlobalTheory.CompanionTheory.WeightExist.weightEx E n U hU.aut
  obtain ⟨σ, hσ, -⟩ := GlobalTheory.CuspRep.LocEx.exists_isLocComp GlobalTheory.automorphicFormsFiniteGL E n π w
  have hS := coreU_forward49 l ι E n hn U hU.aut lam hlam w hw σ B (hU.split w hw σ hσ)
    ((GlobalTheory.CompanionTheory.OnePart.hasSat_iff hσ B).1 hB)
  have e : (CG.mk π).infChar = fun φ => infOfWeight (lam φ) := funext fun φ => hU.inf φ _ (hlam φ)
  rw [e]
  exact hS

private theorem pow_tendsto49 {A : Type} [Field A] [Valued A ℤᵐ⁰] {x : A} (h : Valued.v x < 1) :
    Filter.Tendsto (fun k : ℕ => x ^ k) Filter.atTop (nhds 0) := by
  rw [(Valued.hasBasis_nhds_zero A ℤᵐ⁰).tendsto_right_iff]
  intro γ _
  have h0 : MonoidWithZeroHom.ValueGroup₀.embedding γ.1 ≠ 0 := by simp
  obtain ⟨N, hN⟩ := exists_pow_lt₀ h (Units.mk0 _ h0)
  filter_upwards [Filter.eventually_ge_atTop N] with k hk
  rw [Valuation.restrict_lt_iff_lt_embedding, map_pow]
  exact (pow_le_pow_right_of_le_one' h.le hk).trans_lt hN

private theorem map_lt_one49 {A C : Type} [Field A] [Field C] [Valued A ℤᵐ⁰] [Valued C ℤᵐ⁰] (i : A ≃+* C)
    (hi : Continuous i) {x : A} (h : Valued.v x < 1) : Valued.v (i x) < 1 := by
  have h1 : Filter.Tendsto (fun k : ℕ => (i x) ^ k) Filter.atTop (nhds 0) := by
    have h2 := (hi.tendsto 0).comp (pow_tendsto49 h)
    simpa [Function.comp_def] using h2
  have h3 := (Valued.hasBasis_nhds_zero C ℤᵐ⁰).mem_of_mem (i := 1) trivial
  obtain ⟨k, hk⟩ := (h1.eventually h3).exists
  by_contra hc
  have h4 : Valued.v ((i x) ^ k) < 1 := by
    have h5 := hk
    rw [Valuation.restrict_lt_iff_lt_embedding] at h5
    simpa using h5
  rw [map_pow] at h4
  exact absurd h4 (not_lt.2 (one_le_pow₀ (not_lt.1 hc)))

private theorem le_one_of_map49 {A C : Type} [Field A] [Field C] [Valued A ℤᵐ⁰] [Valued C ℤᵐ⁰] (i : A ≃+* C)
    (hi : Continuous i) {x : A} (h : Valued.v (i x) ≤ 1) : Valued.v x ≤ 1 := by
  by_contra hc
  have hc' := not_le.1 hc
  have h0 : x ≠ 0 := fun e => by simp [e] at hc'
  have h1 : Valued.v x⁻¹ < 1 := by
    rw [map_inv₀]
    exact inv_lt_one_of_one_lt₀ hc'
  have h2 := map_lt_one49 i hi h1
  rw [map_inv₀, map_inv₀] at h2
  have h3 : Valued.v (i x) ≠ 0 := by simpa using h0
  exact absurd h2 (not_lt.2 ((one_le_inv₀ (zero_lt_iff.2 h3)).2 h))

private theorem lt_one_of_map49 {A C : Type} [Field A] [Field C] [Valued A ℤᵐ⁰] [Valued C ℤᵐ⁰] (i : A ≃+* C)
    (hi : Continuous i) {p : A} (hp0 : p ≠ 0) (hp : Valued.v p < 1) {x : A} (h : Valued.v (i x) < 1) :
    Valued.v x < 1 := by
  have hx := le_one_of_map49 i hi h.le
  refine lt_of_le_of_ne hx fun e => ?_
  have hip : Valued.v (i p) ≠ 0 := by simpa using hp0
  obtain ⟨k, hk⟩ := exists_pow_lt₀ h (Units.mk0 _ hip)
  have h1 : Valued.v (i (x ^ k / p)) ≤ 1 := by
    rw [map_div₀, map_div₀, map_pow, map_pow]
    exact div_le_one_of_le₀ hk.le zero_le'
  have h2 := le_one_of_map49 i hi h1
  rw [map_div₀, map_pow, e, one_pow] at h2
  have h3 : Valued.v p ≠ 0 := by simpa using hp0
  rw [one_div] at h2
  exact absurd hp (not_lt.2 ((inv_le_one₀ (zero_lt_iff.2 h3)).1 h2))

private theorem map_le_one49 {A C : Type} [Field A] [Field C] [Valued A ℤᵐ⁰] [Valued C ℤᵐ⁰] (i : A ≃+* C)
    (hi : Continuous i) {p : A} (hp0 : p ≠ 0) (hp : Valued.v p < 1) {x : A} (h : Valued.v x ≤ 1) :
    Valued.v (i x) ≤ 1 := by
  by_contra hc
  have hc' := not_le.1 hc
  have h0 : x ≠ 0 := fun e => by simp [e] at hc'
  have h1 : Valued.v (i x⁻¹) < 1 := by
    rw [map_inv₀, map_inv₀]
    exact inv_lt_one_of_one_lt₀ hc'
  have h2 := lt_one_of_map49 i hi hp0 hp h1
  rw [map_inv₀] at h2
  have h3 : Valued.v x ≠ 0 := by simpa using h0
  exact absurd h (not_le.2 ((inv_lt_one₀ (zero_lt_iff.2 h3)).1 h2))

private theorem normV_eq_of_iso49 {F K : Type} [Field F] [NumberField F] [Field K] [NumberField K] [Algebra F K]
    (v : HeightOneSpectrum (𝓞 F)) (w : HeightOneSpectrum (𝓞 K)) [hl : w.asIdeal.LiesOver v.asIdeal]
    (i : v.adicCompletion F ≃+* w.adicCompletion K) (hi : Continuous i)
    (hloc : ∀ x : F, i (algebraMap F _ x) = algebraMap K _ (algebraMap F K x)) : normV w = normV v := by
  open GroundTheory.Global.SemiLocal in
  obtain ⟨a, ha, ha0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot v.ne_bot
  have hp0 : algebraMap (𝓞 F) (v.adicCompletion F) a ≠ 0 := by
    rw [IsScalarTower.algebraMap_apply (𝓞 F) F (v.adicCompletion F)]
    simpa using ha0
  have hp := (valued_algebraMap_int_lt_one_iff v a).2 ha
  have hle : v.asIdeal ≤ w.asIdeal.comap (algebraMap (𝓞 F) (𝓞 K)) := by
    rw [hl.over]
  let g := Ideal.quotientMap w.asIdeal (algebraMap (𝓞 F) (𝓞 K)) hle
  letI := Ideal.Quotient.field v.asIdeal
  have hinj : Function.Injective g := g.injective
  have hsurj : Function.Surjective g := by
    intro y
    obtain ⟨y, rfl⟩ := Ideal.Quotient.mk_surjective y
    have e1 : Valued.v (i (i.symm (algebraMap (𝓞 K) (w.adicCompletion K) y))) ≤ 1 := by
      simpa using valued_algebraMap_int_le_one w y
    obtain ⟨r, hr⟩ := exists_int_valued_sub_lt_one v _ (le_one_of_map49 i hi e1)
    refine ⟨Ideal.Quotient.mk _ r, ?_⟩
    have e2 := map_lt_one49 i hi hr
    rw [map_sub, RingEquiv.apply_symm_apply, IsScalarTower.algebraMap_apply (𝓞 F) F (v.adicCompletion F), hloc] at e2
    have e3 : algebraMap K (w.adicCompletion K) (algebraMap F K (r : F)) =
        algebraMap (𝓞 K) (w.adicCompletion K) (algebraMap (𝓞 F) (𝓞 K) r) := by
      rw [IsScalarTower.algebraMap_apply (𝓞 K) K (w.adicCompletion K)]
      rfl
    rw [e3, ← map_sub, valued_algebraMap_int_lt_one_iff] at e2
    rw [Ideal.quotientMap_mk]
    exact (Ideal.Quotient.eq.2 e2).symm
  exact (Nat.card_eq_of_bijective g ⟨hinj, hsurj⟩).symm

private theorem slopesIn_of_slope49 {K : Type} [Field K] [NumberField K] {n : ℕ} (m : Fin n → ℤ)
    (u : HeightOneSpectrum (𝓞 K)) (inf : (K →+* ℂ) → Multiset ℂ) (hinf : ∀ τ, inf τ = infOf m)
    (B : Multiset ℂˣ) (h : ∀ (l : ℕ) [Fact l.Prime] (ι : Qbar l ≃+* ℂ), ForwardSlope49 ι n u inf B) :
    ForwardSlopes49 (normV u) m (algSat n (normV u) B) := by
  have hW : ∀ lo hi : ℤ, (∀ i, lo ≤ m i ∧ m i ≤ hi) → ∀ τ, Within n (inf τ) lo hi := by
    intro lo hi hb τ z hz
    rw [hinf] at hz
    obtain ⟨i, -, rfl⟩ := Multiset.mem_map.1 hz
    exact ⟨m i, rfl, (hb i).1, (hb i).2⟩
  obtain ⟨c, hc⟩ := (Set.finite_range m).bddBelow
  have hp : ∀ (l : ℕ) [Fact l.Prime] (ι : Qbar l ≃+* ℂ) (a : ℤ),
      ∏ τ ∈ Ov ι u, nu ι (τ (unif u : K)) ^ a = nu ι (normV u : ℂ) ^ a := by
    intro l _ ι a
    rw [Finset.prod_zpow, (prodNorm l ι K u).2]
  intro b hb a ha
  apply UpperTheory.V.Lib.isIntegral_of_norm_le
  intro l _ ι
  have h1 := h l ι (fun _ => c) (fun _ => a)
    (fun τ => hW c a (fun i => ⟨hc ⟨i, rfl⟩, ha i⟩) τ) b hb
  unfold Bnd at h1
  rw [hp] at h1
  simpa [nu, mul_comm] using h1


theorem slopeAllOf49 :
    GlobalTheory.GalCut.QuadLift → ForwardSlopeOn49 .good → ForwardSlopeAll49 := by
  intro hQL hS E _ _ _ n hn m hm π hinf ⟨χ, hpol⟩ w B hB
  have hAF := GlobalTheory.automorphicFormsFiniteGL
  have hJS := GlobalTheory.JSW.jacquetShalikaRigidity_holds
  have hGK := GlobalTheory.GelfandKazhdanTop.gelfandKazhdanDual_of_jacquetShalika (PositivityTheory.JacquetShalikaLocal.jacquetShalika_of hJS) hAF
  have hic : ∀ τ, (CG.mk π).infChar τ = infOf m := fun τ => CG.HasInfChar.infChar_eq (hinf τ)
  have hreg : (CG.mk π).IsRegAlg := (GlobalTheory.CuspRep.CG.isRegAlg_iff _).2 fun τ => by
    rw [hic]
    refine ⟨Finset.univ.nodup.map fun i j e => hm.injective ?_, fun z hz => ?_⟩
    · exact_mod_cast add_left_cancel e
    · obtain ⟨i, -, rfl⟩ := Multiset.mem_map.1 hz
      exact ⟨m i, add_comm _ _⟩
  obtain ⟨Q, hQ1, hQ2, hQ3, hQ4⟩ := (GlobalTheory.T.infinite_quadraticCM_goodBaseChange_split hAF E (AlgebraicClosure E) 2 n π w).nonempty
  obtain ⟨P, hP⟩ := hQL E Q.K Q.two n hn π hQ3
  obtain ⟨⟨χ', hχ'⟩, -⟩ := GlobalTheory.T.polarizedPair_baseChange_polarized_same_weight hAF hJS hGK E Q.K 2 n hn π χ P hP ⟨hreg, hpol, trivial⟩
  have hin : GlobalTheory.GalCut.InScope .good 2 P χ' := ⟨hχ'.1, hχ'.2.1, hQ4 P hP⟩
  have hA := ReciprocityTheory.Gal.isPlaceOver_placeOf (AlgebraicClosure E) w
  obtain ⟨w', h', i, hi⟩ := GlobalTheory.T.exists_place_completion_iso E (AlgebraicClosure E) Q.K w _ hA (hQ1 _ hA)
  have hund : w'.under (𝓞 E) = w := by
    have := GlobalTheory.PlaceIsoDec.liesOver_of_isPlaceOver hA h'
    ext1
    exact this.over.symm
  have hlo := GlobalTheory.PlaceIsoDec.liesOver_of_isPlaceOver hA h'
  have hq := normV_eq_of_iso49 w w' i hi.cont hi.loc
  have hsat : (CG.mk P).HasSat w' B := by
    have h1 := hP.sat w' 1 B (by rw [hund, pow_one, hq]) (by rw [hund]; exact hB)
    simpa using h1
  have hinf' : ∀ τ, (CG.mk P).infChar τ = infOf m := fun τ => by rw [hP.inf, hic]
  have hfin := slopesIn_of_slope49 m w' _ hinf' B fun l _ ι =>
    hS l ι Q.K 2 n Nat.prime_two hn P χ' hin w' (hQ2 w' hund) B hsat
  rwa [hq] at hfin

theorem intP_forward49 : ForwardIntP49 := by
  intro K _ _ _ n hn m hm M hM π hπ p w hp hw hpM hpd B hB
  exact slopeAllOf49 UpperTheory.ConvolutionTheory.Sph.quadLift
    (slopeGood49 (slopeCsd49 UpperTheory.Gal.Desc.descOffT))
    K n (by omega) m hm π hπ.1 hπ.2.1 w B hB


theorem slopes_of_forward49 {n q : ℕ} {m : Fin n → ℤ} {wt : ℤ}
    (hq : 0 < q) (hwt : ∀ i, m i + m i.rev = wt) (B : Multiset ℂ)
    (hpure : ∀ b ∈ B, ‖b‖ = (q : ℝ) ^ (-(wt : ℝ) / 2))
    (hF : ForwardSlopes49 q m B) : SlopesIn q m B := by
  have hqR : (0 : ℝ) < q := by exact_mod_cast hq
  have hqC : (q : ℂ) ≠ 0 := by exact_mod_cast (ne_of_gt hq)
  intro b hb
  refine ⟨fun a ha => ?_, hF b hb⟩
  have hupper : ∀ i, m i ≤ a + wt := by
    intro i
    have h := ha i.rev
    have h' := hwt i
    omega
  have hI := hF b hb (a + wt) hupper
  have hC := hI.map Complex.conjAe
  change IsIntegral ℤ (starRingEnd ℂ (((q : ℂ) ^ (a + wt)) * b)) at hC
  rw [map_mul, map_zpow₀, map_natCast] at hC
  have hpow : ‖b‖ ^ 2 = (q : ℝ) ^ (-wt) := by
    rw [hpure b hb, pow_two, ← Real.rpow_add hqR, ← Real.rpow_intCast]
    congr 1
    push_cast
    ring
  have hmul : b * starRingEnd ℂ b = (q : ℂ) ^ (-wt) := by
    rw [Complex.mul_conj', ← Complex.ofReal_pow, hpow, Complex.ofReal_zpow]
    norm_num
  have hb0 : b ≠ 0 := by
    intro e
    rw [e, zero_mul] at hmul
    exact (zpow_ne_zero _ hqC) hmul.symm
  have he : (q : ℂ) ^ (a + wt) * starRingEnd ℂ b = (q : ℂ) ^ a * b⁻¹ := by
    apply mul_right_cancel₀ hb0
    calc
      ((q : ℂ) ^ (a + wt) * starRingEnd ℂ b) * b =
          (q : ℂ) ^ (a + wt) * (b * starRingEnd ℂ b) := by ring
      _ = (q : ℂ) ^ a := by rw [hmul, ← zpow_add₀ hqC]; congr 1 <;> omega
      _ = ((q : ℂ) ^ a * b⁻¹) * b := by rw [mul_assoc, inv_mul_cancel₀ hb0, mul_one]
  rwa [he] at hC

end UpperTheory.V.Z.Int
end
section
open UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
open Neutral.B1 hiding G IsPlaceOver
open NumberField IsDedekindDomain Formalism.ConjugateSelfDual ReciprocityTheory.Gal Formalism.BasicNotions Formalism.BasicNotions.Loc Formalism.MainNotions.N GlobalTheory.CuspRep
namespace UpperTheory.GalN.V.Win.N
theorem countP_alt49 (hI : UpperTheory.V.Z.Int.ForwardIntP49) :
    _root_.UpperTheory.V.Af.Hypotheses' → _root_.UpperTheory.GalN.V.LevelPNAlt → _root_.UpperTheory.GalN.V.Win.N.CountPAlt := by
  intro hP hL K _ _ _ hK n hn
  classical
  obtain ⟨c, A, hcard⟩ := _root_.UpperTheory.V.Br.cardP_of_prints hP K n hn
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
      exact UpperTheory.V.Z.Int.slopes_of_forward49 (zero_lt_one.trans (NumberField.HeightOneSpectrum.one_lt_absNorm w)) hwt _
        (win_algSat (by omega) π m _ hwt hπ.1 hB)
        (hI K n hn m hm M hM π hπ p w hp hw hpM hpd B hB))
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
theorem countP_native49 (hP : UpperTheory.V.Af.Hypotheses') (hL : UpperTheory.GalN.V.LevelPNAlt) : CountPAlt := by
  first
  | (rh_reduce 2 using [countP_alt49, UpperTheory.V.Z.Int.intP_forward49]; done)
  | exact countP_alt49 UpperTheory.V.Z.Int.intP_forward49 hP hL

example (hP : UpperTheory.V.Af.Hypotheses') (hL : UpperTheory.GalN.V.LevelPNAlt) : CountPAlt := by
  first
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact countP_native49 hP hL
end UpperTheory.GalN.V.Win.N
end
end
rh_scan UpperTheory.V.Z.Int.coreU limit 2000
rh_scan UpperTheory.V.Z.Int.coreU_forward49 limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_alt limit 2000
rh_scan UpperTheory.GalN.V.Win.N.countP_native49 limit 2000
rh_prune UpperTheory.V.Z.Int.intP'_alt as RH49IntPPruned
#print axioms UpperTheory.V.Z.Int.slopes_of_forward49
#print axioms UpperTheory.V.Z.Int.intP_forward49
#print axioms UpperTheory.GalN.V.Win.N.countP_native49
