import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClozelCohomology.ClozelConjC
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.BasicEx
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN45 literature provenance, 26 Nov 2026. SOURCE-MATCHED / PREPARED, NOT COMPILED.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4; SWARM/HANDOFF/EXPANSION/AGENTS,
state and continuity consulted. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Upstream latest observed
2d7383073083bbe017d948ce95c554dc57167075 (module-system merge), not migrated.
Peers 425c27c5 (native CardK/P), 5744b095 (shared rank slices), 086052c6
(rank-three flag), e827b4fe (SelL), 06c6e652 (small-prime budget),
4695f11c (odd rank), d7f428d4 (measure), 27896ee5 (rank-three witness)
consulted; no duplicate CardK/P substitution.

Mathematical reduction on actual Borel supplier:
Let Z=identity Hermitian matrix, fixed under K. For a nonzero equivariant
alternating q-cochain omega, either i_Z omega=0 and omega is basic,
or i_Z omega !=0 and i_Z omega is already basic and equivariant.
Reason: i_Z^2=0 by alternation (two equal entries), not induction.
The degree is exactly q or q-1. No differential, cocycle, closedness,
non-exactness or recursion is required for this local choice.
Native basicEx obtains a nonzero cochain from HasCohomology; levelCo
uses only equivariance, basicness and nonzero. The candidate substitutes
direct contraction at actual LevelCo -> HarmEx -> BorelInjC consumers.
All conditions of PiHarm and OneEig are retained; they still consume
HasCohomology for Casimir and central scalar cancellation. Not a claim
that a basic nonzero cochain alone produces a nonzero cohomology class.

Independent literature bridge (human, not native replacement):
Franke (1998), Theorem 18, p.255, primary scan authenticated:
https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf
The cuspidal summand injects into ordinary cohomology, e.g. Borel 1981
Cor.5.5 cited in Petersen, https://msp.org/pjm/2015/275-1/pjm-v275-n1-p03-s.pdf,
and Grobner section 2.3 https://intlpress.com/site/pub/files/_fulltext/journals/mrl/2015/0022/0001/MRL-2015-0022-0001-a006.pdf.
Franke's coefficient twist and split center must be matched, not omitted.
Native OneEig already proves the diagonal real central action cancels:
if L(Z)=c I with c !=0, d i_Z + i_Z d=c I contracts the complex.
Thus for native cohomological irreducibles c=0. For nonzero Z, choose
K-invariant linear functional z with z(Z)=1 (normalized real trace).
Split Herm=R Z + ker z. Because L(Z)=0 and the projected bracket of
Hermitian inputs vanishes, C^q=C_basic^q + z wedge C_basic^(q-1),
with d acting diagonally up to sign. Hence H^q(full)=H^q(basic) +
H^(q-1)(basic), proving nonvanishing of basic cohomology in one of
two degrees. This concerns the single global split real direction,
not every local central direction. K-equivariance and level fixedness
are preserved. Do not confuse this cohomology splitting with the
weaker native nonzero cochain lemma above.

Native group-cohomology comparison, exact module identity:
Gamma=GL_a(E), X=GL_a(A_f)/U, V=C^Xi.d and xi=ratC Xi.
For each orbit representative x, H=Stab_Gamma(x), the native action
(gamma f)(y)=xi(gamma) f(gamma^-1 y) on Map(Gamma x,V).
The map f -> F, F(g)=xi(g) f(g^-1 x), has F(hg)=xi(h)F(g)
for h in H and F_(gamma f)(g)=F_f(g gamma).
Inverse: f(g^-1 x)=xi(g)^-1 F(g), well-defined by equivariance.
This identifies the orbit module with Coind_H^Gamma V, with right
translation convention. Shapiro and exact products give the sum over
arithmetic double-coset components in finite-class-number case.
Over C, finite stabilizers cause no cohomological torsion obstruction:
use a torsion-free finite-index normal subgroup and exact finite
group invariants. The same U and xi are maintained. Pairwise
nonisomorphic cuspidal summands, each with a nonzero fixed vector
and basic cohomology, contribute >=1 dimension each. Thus the
published route supplies the native inequality |S| <= cohDim,
conditional on remaining native representation comparison
(K-finite smooth vectors, coefficient and central character twist,
adelic cusp decomposition and actual rational action). No assumption
of RH or use of Main. No full formal identification yet.

Original source-selected graph:
CardK/P -> Z.Coh.borelInjC -> Lit.Geo.borelInjC -> harmEx
-> levelCo -> basicEx -> basic_of_ne_zero (recursive).
Candidate:
borelInjC_lit45 -> harmEx_lit45 -> levelCo_lit45 -> basicEx_lit45
-> basic_direct_degree45 (one contraction). Same original statement.
Keep deRhamInj, noExact', pairFacts, g1, cuspRapid, frameEx, oneReal,
piHarm, oneEig, levelOp, all original fallback and type/value/axiom
obligations. No global retirement or native axiom claim.
Context key pin/toolchain, E,a,U,Xi,pi, S, K-action, cochain degree,
actual Borel and CardK/P consumers; no declaration-only cache.
Backtrack to original native supplier if elaboration or audit fails.

Pinned source blobs relative to AutomorphicVarieties:
LiteratureResults/BorelHarmonicForms/BasicEx.lean a695a927afb4c616b1f1de67d8fddf22446624ba
LiteratureResults/BorelHarmonicForms/LevelCo.lean 8e7d55396edabeee72bb475afaca73875e8e2f26
LiteratureResults/BorelHarmonicForms/HarmEx.lean f321194da225f310673b624941ca91b853f34a7c
LiteratureResults/LieGeometryGrowth/BorelInjC.lean 36aac37b6952a97b7b4df8670c15f91f01c14549
LiteratureResults/BorelHarmonicForms/OneEig.lean 0eb81c84c2dfb1a3327e571eb4b731ab52af0e74
LiteratureResults/BorelHarmonicForms/PiHarm.lean ffeebab8c7d2381679a5a5ead8224f2bb52b2478
AutomorphicForms/HasCohomology.lean ec55ca626b57c37d58f482abeeb1c7f03bcd377a
ModularityArgument/ClozelCohomology/ClozelConjC.lean ee87c465349ad0e87d461ead8aa003dbebc88477
PublishedTheorems/GelfandKazhdanReal.lean 5950874949bd0b4b4f22191c009aff80c520cf5c
Mathlib Alternating/Basic.lean fb400ee7e5888328effef2d282b3dfe18371253a
map_eq_zero_of_eq signature authenticated.
Executed 31 fail-on-error source checks: pin LiteratureResults/BorelHarmonicForms/BasicEx; pin LiteratureResults/BorelHarmonicForms/LevelCo; pin LiteratureResults/BorelHarmonicForms/HarmEx; pin LiteratureResults/LieGeometryGrowth/BorelInjC; pin LiteratureResults/BorelHarmonicForms/OneEig; pin LiteratureResults/BorelHarmonicForms/PiHarm; pin AutomorphicForms/HasCohomology; pin ModularityArgument/ClozelCohomology/ClozelConjC; pin PublishedTheorems/GelfandKazhdanReal; native recursive call; basic wrapper unique; basic wrapper reversible; two branch calls; level wrapper unique; level wrapper reversible; level actual basic consumer unique; level actual basic consumer reversible; harm wrapper unique; harm wrapper reversible; harm actual level consumer unique; harm actual level consumer reversible; Borel wrapper unique; Borel wrapper reversible; Borel actual harmonic consumer unique; Borel actual harmonic consumer reversible; central scalar cancellation; retain Casimir cohomology; native cohomology and action; native Borel wrapper; native Borel conclusion; no inserted holes.
Executed 2036 exact exterior-basis monomial regression cases
(1023 nonzero first contractions), double contraction zero and
selected degree q or q-1; algebra illustration only, not Lean replay.
Local lean/lake/elan absent. GitHub Actions jobs 45577239749,
45576756833,45670987597 retrieved with completed success for pick/run/record;
historical baseline only; no new compilation or #print axioms evidence.
Not queued in this run; no workflow edits.
RESUME HERE: stage RUN45 with pinned native engines and replay the
actual Borel supplier; compare original/reduced scans and axioms.
Check remaining representation/central twist bridge against Franke
and Clozel before replacing harmonic/de Rham branches at peer 425c27c5
actual CountK/CountP consumers. Retain entire original graph.
HANDOFF TO kernel, Galois, literature, integration, audit. RH OPEN.
-/

noncomputable section
open NumberField Matrix GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.Af UpperTheory.V.AlgRepEndIrreducible UpperTheory.V.Lit UpperTheory.V.Lit.Bor
open scoped TensorProduct

theorem UpperTheory.V.Lit.Bor.basic_direct_degree45
    {E : Type} [Field E] {a : ℕ} {M : Type} [AddCommGroup M] [Module ℂ M] [Module ℝ M]
    (κ : Kinf E a → Module.End ℂ M) (q : ℕ)
    (ω : Herm E a [⋀^Fin q]→ₗ[ℝ] M) (h0 : ω ≠ 0) (h1 : IsCochain κ ω) :
    ∃ (j : ℕ) (η : Herm E a [⋀^Fin j]→ₗ[ℝ] M),
      η ≠ 0 ∧ IsCochain κ η ∧ IsBasic η ∧ (j = q ∨ j + 1 = q) := by
  let Z : Herm E a := ⟨1, IsSelfAdjoint.one _⟩
  have hZ : ∀ k, adHerm k Z = Z := fun k => Subtype.ext (by
    change k.1 * 1 * star k.1 = 1
    rw [mul_one]; exact k.2.2)
  cases q with
  | zero => exact ⟨0, ω, h0, h1, fun _ i => i.elim0, Or.inl rfl⟩
  | succ q =>
    by_cases hc : ω.curryLeft Z = 0
    · refine ⟨q + 1, ω, h0, h1, ?_, Or.inl rfl⟩
      intro X i hi
      have hi' : X i = Z := Subtype.ext hi
      have key : ∀ Y : Fin (q + 1) → Herm E a, Y 0 = Z → ω Y = 0 := fun Y hY => by
        have h := DFunLike.congr_fun hc (Fin.tail Y)
        have e : Matrix.vecCons Z (Fin.tail Y) = Y := by rw [← hY]; exact Fin.cons_self_tail Y
        rw [← e]
        exact h
      by_cases hi0 : (0 : Fin (q + 1)) = i
      · exact key X (hi0 ▸ hi')
      · have h := ω.map_swap X hi0
        rw [key _ (by simpa using hi')] at h
        exact neg_eq_zero.1 h.symm
    · refine ⟨q, ω.curryLeft Z, hc, ?_, ?_, Or.inr rfl⟩
      · intro k X
        change ω (Matrix.vecCons Z _) = κ k (ω (Matrix.vecCons Z X))
        rw [← h1]
        congr 1
        funext j
        refine Fin.cases ?_ (fun j => ?_) j <;> simp [hZ]
      · intro X i hi
        change ω (Matrix.vecCons Z X) = 0
        have hi' : X i = Z := Subtype.ext hi
        exact ω.map_eq_zero_of_eq (Matrix.vecCons Z X) (i := 0) (j := i.succ)
          (by simpa [Matrix.vecCons] using hi'.symm) (Ne.symm (Fin.succ_ne_zero i))

private theorem basic_of_ne_zero45 {E : Type} [Field E] {a : ℕ} {M : Type} [AddCommGroup M] [Module ℂ M] [Module ℝ M]
    (κ : Kinf E a → Module.End ℂ M) (q : ℕ) (ω : Herm E a [⋀^Fin q]→ₗ[ℝ] M)
    (h0 : ω ≠ 0) (h1 : IsCochain κ ω) :
    ∃ (j : ℕ) (η : Herm E a [⋀^Fin j]→ₗ[ℝ] M), η ≠ 0 ∧ IsCochain κ η ∧ IsBasic η := by
  obtain ⟨j, η, hη, hK, hB, -⟩ := UpperTheory.V.Lit.Bor.basic_direct_degree45 κ q ω h0 h1
  exact ⟨j, η, hη, hK, hB⟩

theorem UpperTheory.V.Lit.Bor.basicEx_lit45 :
    UpperTheory.V.Lit.Bor.BasicEx := by
  intro E _ _ _ a M _ _ _ _ κ L h
  rcases h with ⟨ω, h1, -, h0⟩ | ⟨q, ω, h1, -, h2⟩
  · exact basic_of_ne_zero45 κ 0 ω h0 h1
  · refine basic_of_ne_zero45 κ _ ω (fun h => h2 0 (fun k X => by simp) ?_) h1
    rw [h]
    exact AlternatingMap.ext fun X => by simp [dCo_apply]

private theorem cmp_rT {W : Type} [AddCommGroup W] [Module ℂ W] {d : ℕ} (T : W →ₗ[ℂ] W) (i : Fin d)
    (m : W ⊗[ℂ] (Fin d → ℂ)) : cmp i (T.rTensor _ m) = T (cmp i m) := by
  induction m using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy => simp only [map_add, hx, hy]
  | tmul φ v => simp only [LinearMap.rTensor_tmul, cmp_tmul, map_smul]

private theorem ex_cmp {W : Type} [AddCommGroup W] [Module ℂ W] {d : ℕ} {m : W ⊗[ℂ] (Fin d → ℂ)} (h : m ≠ 0) :
    ∃ i, cmp i m ≠ 0 := by
  by_contra hc
  push Not at hc
  apply h
  rw [← sum_cmp m]
  simp [hc]

private theorem rT_map {W : Type} [AddCommGroup W] [Module ℂ W] {d : ℕ} (T A : Module.End ℂ W)
    (B : Module.End ℂ (Fin d → ℂ)) (h : Commute T A) (m : W ⊗[ℂ] (Fin d → ℂ)) :
    T.rTensor _ (TensorProduct.map A B m) = TensorProduct.map A B (T.rTensor _ m) := by
  induction m using TensorProduct.induction_on with
  | zero => simp
  | add x y hx hy => simp only [map_add, hx, hy]
  | tmul φ v =>
    simp only [LinearMap.rTensor_tmul, TensorProduct.map_tmul]
    congr 1
    exact LinearMap.congr_fun h.eq φ

theorem UpperTheory.V.Lit.Bor.levelCo_lit45 :
    UpperTheory.V.Lit.Bor.LevelCo := by
  intro E _ _ _ a U hU π Ξ hC hF
  obtain ⟨q, ω, h0, hK, hB⟩  := UpperTheory.V.Lit.Bor.basicEx_lit45 E a _ (tensorK π Ξ) (tensorLie π Ξ) hC
  obtain ⟨X, hX⟩ : ∃ X, ω X ≠ 0 := by
    by_contra hc
    push Not at hc
    exact h0 (AlternatingMap.ext hc)
  obtain ⟨i, hi⟩ := ex_cmp hX
  obtain ⟨T, hT, hTK, hTU⟩ := levelOp E a U hU π hF _ hi
  refine ⟨q, ((T.rTensor (Fin Ξ.d → ℂ)).restrictScalars ℝ).compAlternatingMap ω, fun h => hT ?_, fun k Y => ?_,
    fun Y j hj => ?_, fun Y j u hu => ?_⟩
  · have h1 : T.rTensor (Fin Ξ.d → ℂ) (ω X) = 0 := DFunLike.congr_fun h X
    rw [← cmp_rT, h1, map_zero]
  · change T.rTensor (Fin Ξ.d → ℂ) (ω _) = tensorK π Ξ k (T.rTensor (Fin Ξ.d → ℂ) (ω Y))
    rw [hK k Y]
    exact rT_map T _ _ (hTK k) _
  · change T.rTensor (Fin Ξ.d → ℂ) (ω Y) = 0
    rw [hB Y j hj, map_zero]
  · change π.op (.fin u) (cmp j (T.rTensor (Fin Ξ.d → ℂ) (ω Y))) = cmp j (T.rTensor (Fin Ξ.d → ℂ) (ω Y))
    rw [cmp_rT]
    exact hTU _ u hu

theorem UpperTheory.V.Lit.Bor.harmEx_lit45 :
    UpperTheory.V.Lit.Bor.HarmEx := by
  intro E _ _ _ a ha n e he U hU π Ξ r hr hC hF
  obtain ⟨q, ω, h0, hK, hB, hL⟩ := UpperTheory.V.Lit.Bor.levelCo_lit45 E a U hU π Ξ hC hF
  obtain ⟨hd, hδ⟩ := piHarm E a ha n e he π Ξ r hr hC q ω hK
  obtain ⟨hinj, hcmp, hIK, hIL, hIA⟩ := inclFacts E a π Ξ r
  have hE := oneEig E a π Ξ r hr hC
  have hS := cuspSq E a ha π r hE
  refine ⟨q, inclCo π Ξ ω, fun h => h0 (AlternatingMap.ext fun X => hinj ?_),
    ⟨⟨fun k X => ?_, fun X i hi => ?_, fun X => mem_span_of_cmp fun i => ?_⟩, AlternatingMap.ext fun X => ?_, ?_⟩,
    fun X => mem_tens.2 fun i => ?_⟩
  · have h1 : incl π Ξ (ω X) = 0 := DFunLike.congr_fun h X
    rw [h1, AlternatingMap.zero_apply, map_zero]
  · rw [inclCo_apply, inclCo_apply, hK k X, hIK]
  · rw [inclCo_apply, hB X i hi, map_zero]
  · rw [inclCo_apply, hcmp]
    have hm := (cmp i (ω X)).2
    refine ⟨⟨(hS _ hm).left, fun u hu => congrArg Subtype.val (hL X i u hu), fun m hm' => ?_⟩,
      (π.cusp _ hm).2, (hS _ hm).sq⟩
    have h1 : (r : ℂ) • (1 : Matrix (Fin Ξ.d) (Fin Ξ.d) ℂ) = m • 1 := hr.symm.trans hm'
    have h2 : (r : ℂ) = m := by simpa using congrFun (congrFun h1 i) i
    rw [← h2]
    exact hE _ hm
  · have h1 := congrArg (incl π Ξ) (DFunLike.congr_fun hd X)
    rw [dCo_apply, AlternatingMap.zero_apply, map_zero, map_sum] at h1
    rw [dCo_apply, AlternatingMap.zero_apply, ← h1]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [inclCo_apply, ← hIL]
    simp only [map_zsmul, LinearMap.map_smul_of_tower]
  · cases q with
    | zero => trivial
    | succ q =>
      refine AlternatingMap.ext fun X => ?_
      have h1 := congrArg (incl π Ξ) (DFunLike.congr_fun (show del _ e ω = 0 from hδ) X)
      rw [del_apply, AlternatingMap.zero_apply, map_zero, map_sum] at h1
      rw [del_apply, AlternatingMap.zero_apply, ← h1]
      exact Finset.sum_congr rfl fun j _ => (hIA _ _).symm
  · rw [inclCo_apply, hcmp]
    exact (cmp i (ω X)).2

section
open NumberField Matrix MeasureTheory Formalism.L2.Host GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.Af GlobalTheory.UnitaryBC
open UpperTheory.V.Lit UpperTheory.V.Lit.Dr UpperTheory.V.Lit.Bor
open scoped TensorProduct GlobalTheory.CuspRep.CuspidalL2GL

variable {E : Type} [Field E] [NumberField E] [IsTotallyComplex E] {a : ℕ} {Ξ : AlgRep E a}

private theorem rapid_of_rapidD {q : ℕ} {ω : Co Ξ q} (h : RapidD ω) : Rapid ω := fun X N => h [] X N

private theorem ev_add' (x y : Sm E a ⊗[ℂ] (Fin Ξ.d → ℂ)) (g : GA E a) : ev (x + y) g = ev x g + ev y g := by
  ext i; simp [ev]

private theorem ev_smul' (c : ℂ) (x : Sm E a ⊗[ℂ] (Fin Ξ.d → ℂ)) (g : GA E a) : ev (c • x) g = c • ev x g := by
  ext i; simp [ev]

private theorem rapid_sum {q s : ℕ} (ω : Fin s → Co Ξ q) (c : Fin s → ℂ) (h : ∀ i, Rapid (ω i)) :
    Rapid (∑ i, c i • ω i) := by
  have hq : ∀ g : GA E a, 0 ≤ qht g := fun g => zero_le_one.trans ((qhtFacts E a).1 g)
  refine Finset.sum_induction _ (fun ω : Co Ξ q => Rapid ω) ?_ ?_ ?_
  · intro α β hα hβ X N
    obtain ⟨C, hC⟩ := hα X N
    obtain ⟨D, hD⟩ := hβ X N
    refine ⟨C + D, fun g => ?_⟩
    rw [AlternatingMap.add_apply, ev_add']
    refine (mul_le_mul_of_nonneg_right (norm_add_le _ _) (pow_nonneg (hq _) N)).trans ?_
    rw [add_mul]
    exact add_le_add (hC g) (hD g)
  · intro X N
    refine ⟨0, fun g => ?_⟩
    have : ev ((0 : Co Ξ q) X) g.1 = 0 := by
      have := ev_smul' (Ξ := Ξ) 0 0 g.1
      simpa using this
    rw [this]; simp
  · intro i _ X N
    obtain ⟨C, hC⟩ := h i X N
    refine ⟨‖c i‖ * C, fun g => ?_⟩
    rw [AlternatingMap.smul_apply, ev_smul', norm_smul, mul_assoc]
    exact mul_le_mul_of_nonneg_left (hC g) (norm_nonneg _)

private theorem noExact' (ha : 1 ≤ a) {n : ℕ} {e : Fin n → Herm E a} (he : IsFrame e) {U : Subgroup (GL (Fin a) (Af E))}
    (hUo : IsOpen (U : Set (GL (Fin a) (Af E)))) (hUc : IsCompact (U : Set (GL (Fin a) (Af E)))) {r : ℝ} (hr : HasOne Ξ r)
    {q : ℕ} (ω : Co Ξ q) (hω : IsHarm U Ξ r e ω) (hR : Rapid ω) (hex : IsRelExact U Ξ ω) : ω = 0 := by
  cases q with
  | zero => exact hex
  | succ q =>
    obtain ⟨η, hη, rfl⟩ := hex
    obtain ⟨χ, hχ⟩ := twEx E a ha r
    obtain ⟨G, hG⟩ := admEx E a Ξ
    have hd : IsData Ξ r χ G e := ⟨hr, hχ, hG, he⟩
    have hL : IsLev U Ξ (dCo (smLie Ξ) η) := ((harmLin E a n e U Ξ r (q + 1)).2 _).1 hω
    have hM : Moderate (dCo (smLie Ξ) η) := ⟨0, fun X => by
      obtain ⟨C, hC⟩ := hR X 0
      exact ⟨C, fun g => by simpa using hC g⟩⟩
    have hP := pairFacts E a ha Measure.haar U hUo Ξ r χ G n e hd (q + 1)
    exact hP.2.2.1 _ hL (hP.1 _ _ hL hL hR hM)
      (g1 E a ha Measure.haar U hUo hUc Ξ r χ G n e hd q _ η hL hη hR hω.coclosed hM)

theorem UpperTheory.V.Lit.Geo.borelInjC_lit45 :
    UpperTheory.V.Published.BorelInjC := by
  intro E _ _ _ a ha U hUo hUc Ξ S hS hC
  classical
  obtain ⟨n, e, he⟩ := frameEx E a
  obtain ⟨r, hr⟩ := oneReal E a Ξ
  have hex : ∀ π : CuspSub E a, ∃ (q : ℕ) (ω : Co Ξ q),
      π ∈ S → ω ≠ 0 ∧ IsHarm U Ξ r e ω ∧ ∀ X, ω X ∈ tens Ξ.d π.V := fun π => by
    by_cases h : π ∈ S
    · obtain ⟨q, ω, hω⟩ := UpperTheory.V.Lit.Bor.harmEx_lit45 E a ha n e he U hUc π Ξ r hr (hC π h).1 (hC π h).2
      exact ⟨q, ω, fun _ => hω⟩
    · exact ⟨0, 0, fun h' => absurd h' h⟩
  choose deg w hw using hex
  refine UpperTheory.V.Lit.Bor.count _ S deg _ fun q s f hf hq => ?_
  have hex2 : ∀ i, ∃ ω : Co Ξ q, ω ≠ 0 ∧ IsHarm U Ξ r e ω ∧ ∀ X, ω X ∈ tens Ξ.d (f i).V := fun i => by
    obtain ⟨hi, rfl⟩ := hq i
    exact ⟨w _, hw _ hi⟩
  choose ω h0 hH hV using hex2
  refine deRhamInj E a ha U hUo hUc Ξ q s ω
    (fun i => ⟨((harmLin E a n e U Ξ r q).2 _).1 (hH i), (hH i).closed⟩) fun c hc => ?_
  exact indep E a Ξ.d q s f (fun i j h => hf (hS _ (hq i).1 _ (hq j).1 h)) ω h0 hV c
    (noExact' ha he hUo hUc hr _ ((harmLin E a n e U Ξ r q).1 s ω c hH)
      (rapid_sum ω c fun i => rapid_of_rapidD (cuspRapid E a (f i) Ξ q (ω i) (hV i))) hc)

end


theorem UpperTheory.V.Lit.Geo.borel_replay_lit45 : UpperTheory.V.Published.BorelInjC := by
  first
  | (rh_reduce 2 using [UpperTheory.V.Lit.Geo.borelInjC_lit45]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact UpperTheory.V.Lit.Geo.borelInjC_lit45

rh_scan UpperTheory.V.Z.Coh.borelInjC limit 2000
rh_scan UpperTheory.V.Lit.Bor.basicEx limit 2000
rh_scan UpperTheory.V.Lit.Bor.basic_direct_degree45 limit 2000
rh_scan UpperTheory.V.Lit.Geo.borelInjC_lit45 limit 2000
rh_prune UpperTheory.V.Lit.Bor.basic_direct_degree45 as RH45LitBasicPruned
#print axioms UpperTheory.V.Lit.Bor.basic_direct_degree45
#print axioms UpperTheory.V.Lit.Bor.levelCo_lit45
#print axioms UpperTheory.V.Lit.Geo.borelInjC_lit45
#print axioms UpperTheory.V.Z.Coh.borelInjC
#print axioms UpperTheory.V.Z.Coh.clozelCohC
