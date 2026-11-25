/-!
RUN33 — same-level Borel counting: diagonal Green interface.
PREPARED / human source-matched, NOT kernel-checked. 25 Nov 2026.
Mission blob cd0a176134d46b5b624896e56843a24915c14477, latest critical-frontier
priority. No independent RH detour. Native pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Latest observed upstream d91ae2678eea19a0c3045ffca37f1da757c2e719 (unchanged
from RUN32); no cross-revision proof mixing.

Human proof block for the living manuscript (same E,a,U,Ξ throughout):
For each distinct cohomological cuspidal representation with U-fixed vector,
choose a nonzero harmonic form ω_i in its irreducible summand (HarmEx).
Fix a degree q and let β=Σ c_i ω_i. This is level-relative, coclosed
and rapidly decreasing by linearity and cuspidal decay. If β=dη is
relative exact, β is bounded (use the N=0 rapid estimate), so the native
Green identity G1 applies even though η itself is not assumed bounded
or square-integrable. In degree zero exact means β=0 by definition.
For positive degree the only required pairing identities are the diagonal
integrability, Green vanishing and positivity:
    ||β||_pair² = pair(β,β) = pair(β,dη) = 0  ==>  β=0.
Here pair is the actual native twisted Hermitian integral with positive
coefficient matrix and frame, NOT an unweighted Euclidean norm.
Finite sums in distinct irreducible summands are independent (native indep),
so c=0. The native de Rham comparison hDR sends this independence modulo
relative exact forms to rank of group cohomology at THE SAME U and Ξ;
summing degree fibres gives |S| <= Σ_q rank H^q.
The RUN30/31 counting estimates then use this at U=KLev E a M, under their
retained conditions. Uniformity comes from the separate native cohomology
dimension estimate, not from uniform decay constants. This argument needs
no bound on the chosen primitive η and no closedness hypothesis in the
diagonal exactness lemma: dη is already exact. Closedness remains required
for deRhamInj. No derivative decay is used directly by Borel after selecting
the empty derivative list; G1's own proof has its own hypotheses.

Actual noncompact Green input: DegreeHermitianFormula.firstGeometricCondition_of_properties
uses Approx to produce compact-supported primitive ζ_R whose differential
agrees with dη at qht<=R and whose error grows at most C qht^N, uniform in R.
Rapid β at exponent N+1 bounds its pointwise pairing with the error by
B C C'/R outside qht<=R. Compact support integration by parts and coclosedness
give pair(β,dζ_R)=0 exactly; subtract before norms and integrate against
the finite quotient volume. Hence |pair(β,dη)|<=B C C' vol/R for every R>0.
Let R→∞. Do not assert this works for arbitrary noncompact primitives without
the actual Approx and finite-volume suppliers. No global PairFacts field
deletion: G1 itself uses other components.

Native source-visible root chain (not an elaborated graph):
Main -> everyCharacter -> vwin_of_row -> automorphic_window_of_inputs ->
v_window_of_literal_automorphy_n -> vwin_of_hypotheses_H_E_alt ->
of_four_alt (CountI,II,III,V; ThmBab at 401, odd-free, CountZ) ->
vwin_of_counts. Actual CountI caller count_i_of_printed_bound_k_kato_automorphy
takes hH from published_hypotheses_from_patching_alt, whose borelC field is
Z.Coh.borelInjC -> Lit.Geo.borelInjC -> noExact', HarmEx, DeRhamInj,
count, indep, harmLin, cuspRapid, qhtFacts, frameEx, oneReal, twEx, admEx.
RUN30/31 cardP/cardK consume borelC. Reduced local interface:
borel_from_four -> [rapid_exact_zero, hPair, hGreen, hHarm, hDR,
count, indep, harmLin, cuspRapid, qhtFacts, frameEx, oneReal, twEx, admEx].
rapid_exact_zero -> [hPair diagonal integrability/definiteness, hGreen,
twEx, admEx]; no harmLin or independent closedness premise there.
Original proof retained; no global edge deleted. Constructor/type/value and
axiom evidence for the original full root and new certificates remains open.
Cache key includes pin/toolchain, declaration, E,a,U,Ξ,r,e,q, exactness and
rapid premises; do not reuse a cohomology bound at a different host/level.
Backtrack to original proof if replacement fails replay.

Source blobs (pinned retrieval):
LiteratureResults/LieGeometryGrowth/BorelInjC.lean 36aac37b6952a97b7b4df8670c15f91f01c14549
PairFactsAlt.lean 2941a68e32eedde4c8cf55bd6434fe792f560260
PairFacts.lean 530339cb0b5bb836c0157be4bd672fbfcfdd9956
G1.lean 8591bf826635eeccb7873d7c9e11434c22e666ab
DegreeHermitianFormula.lean 1e0a769189ad568cec267ebbbe987484132aae23
CuspRapid.lean 76085edb79c4753dc1f16ff9cef3e649c0ba6006
LiteratureResults/DeRham.lean 6316213f7bb9617b300d12c7ed71220ab7b6db03
DeRhamInj.lean 11bd70072f02252c72801b2576409a529b1986ca
BorelHarmonicForms/HarmEx.lean f321194da225f310673b624941ca91b853f34a7c
HarmLin.lean 556f78174a756d41a698b056e4fb3765bce2eede
Imports.lean 3701b4667781e1593c42c5d50054c01343a31468
ImportsVariant.lean 7df28fd810250dde45a7e33d01fe6280748286a1
ModularityArgument/ClozelCohomology/ClozelConjC.lean ee87c465349ad0e87d461ead8aa003dbebc88477
ModularityArgument/ThresholdArguments/DenseThresholdCases/:
PublishedHypothesesFromPatching.lean 8a57b35c343ed717c225b04710c835f102deaa3b
WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
HVCore.lean f4b900eb48df14f16eea03d08b7d9ef077f3d4a1
BrCardP.lean a2e96d9c993a392281385cc7f723acf78e614b21
TCardK.lean c6eb1d67f72c45007e3330ea65b0966f3f27cd96.

Execution: pinned Borel source blob compared, 11 unique exact source
substitutions executed, old private path absent. Local shell has neither Lean
nor Lake; no new kernel/axiom check. Baseline CI status files independently
retrieved: 45577239749 and 45576756833 pass their OWN prior tests only.
Peer commits inspected 2df8b6cc (global determinant), 4e8fb668 (sphere),
8b54a1ab (same-host window), 60892061 (mission); no overlap.
Read protocol, queue, expansion, AGENTS, continuity, research state excerpt,
living manuscript and RUN32; not every peer lane note or full native graph
retrieved. No URT benchmark or acceleration claim. Zero newly kernel-closed
root obligations; new explicit supplier boundary for Borel at actual level.
RESUME HERE: batch native replay RUN30/31/32/33 on pinned Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474, using existing verified
engines. Then audit the precise Approx supplier and group-cohomology
comparison, or use the native Borel supplier unchanged if verified. Trace
CountI uniform bound through actual of_four_alt/vwin_of_counts and same-host
401 specialization, rather than further local rewrites without caller checks.
HANDOFF TO integration/editor, formal audit, kernel, Galois.
-/
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.LieGeometryGrowth.FNonneg
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.LieGeometryGrowth.G1
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.LieGeometryGrowth.CuspRapid
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.LieGeometryGrowth.PairFacts
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.LieGeometryGrowth.QhtFacts
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.DeRhamInj
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.FrameEx
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.OneReal
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.HarmEx
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.HarmLin
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.ImportsVariant
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.Imports
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.SumCoordRe
import Development.AutomorphicArithmetic.AutomorphicVarieties.LiteratureResults.BorelHarmonicForms.AdmEx
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClozelCohomology.ClozelConjC
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

open UpperTheory.V.Lit.Geo

namespace RHGalois33
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

theorem rapid_exact_zero (hPair : PairFacts) (hGreen : G1) (ha : 1 ≤ a) {n : ℕ} {e : Fin n → Herm E a} (he : IsFrame e) {U : Subgroup (GL (Fin a) (Af E))}
    (hUo : IsOpen (U : Set (GL (Fin a) (Af E)))) (hUc : IsCompact (U : Set (GL (Fin a) (Af E)))) {r : ℝ} (hr : HasOne Ξ r)
    {q : ℕ} (ω : Co Ξ q) (hL : IsLev U Ξ ω) (hδ : Coclosed (smAdj Ξ r) e ω) (hR : Rapid ω) (hex : IsRelExact U Ξ ω) : ω = 0 := by
  cases q with
  | zero => exact hex
  | succ q =>
    obtain ⟨η, hη, rfl⟩ := hex
    obtain ⟨χ, hχ⟩ := twEx E a ha r
    obtain ⟨G, hG⟩ := admEx E a Ξ
    have hd : IsData Ξ r χ G e := ⟨hr, hχ, hG, he⟩
    have hM : Moderate (dCo (smLie Ξ) η) := ⟨0, fun X => by
      obtain ⟨C, hC⟩ := hR X 0
      exact ⟨C, fun g => by simpa using hC g⟩⟩
    have hP := hPair E a ha Measure.haar U hUo Ξ r χ G n e hd (q + 1)
    exact hP.2.2.1 _ hL (hP.1 _ _ hL hL hR hM)
      (hGreen E a ha Measure.haar U hUo hUc Ξ r χ G n e hd q _ η hL hη hR hδ hM)

theorem borel_from_four (hPair : PairFacts) (hGreen : G1) (hHarm : HarmEx) (hDR : DeRhamInj) :
    UpperTheory.V.Published.BorelInjC := by
  intro E _ _ _ a ha U hUo hUc Ξ S hS hC
  classical
  obtain ⟨n, e, he⟩ := frameEx E a
  obtain ⟨r, hr⟩ := oneReal E a Ξ
  have hex : ∀ π : CuspSub E a, ∃ (q : ℕ) (ω : Co Ξ q),
      π ∈ S → ω ≠ 0 ∧ IsHarm U Ξ r e ω ∧ ∀ X, ω X ∈ tens Ξ.d π.V := fun π => by
    by_cases h : π ∈ S
    · obtain ⟨q, ω, hω⟩ := hHarm E a ha n e he U hUc π Ξ r hr (hC π h).1 (hC π h).2
      exact ⟨q, ω, fun _ => hω⟩
    · exact ⟨0, 0, fun h' => absurd h' h⟩
  choose deg w hw using hex
  refine UpperTheory.V.Lit.Bor.count _ S deg _ fun q s f hf hq => ?_
  have hex2 : ∀ i, ∃ ω : Co Ξ q, ω ≠ 0 ∧ IsHarm U Ξ r e ω ∧ ∀ X, ω X ∈ tens Ξ.d (f i).V := fun i => by
    obtain ⟨hi, rfl⟩ := hq i
    exact ⟨w _, hw _ hi⟩
  choose ω h0 hH hV using hex2
  refine hDR E a ha U hUo hUc Ξ q s ω
    (fun i => ⟨((harmLin E a n e U Ξ r q).2 _).1 (hH i), (hH i).closed⟩) fun c hc => ?_
  have hs := (harmLin E a n e U Ξ r q).1 s ω c hH
  exact indep E a Ξ.d q s f (fun i j h => hf (hS _ (hq i).1 _ (hq j).1 h)) ω h0 hV c
    (rapid_exact_zero hPair hGreen ha he hUo hUc hr _
      (((harmLin E a n e U Ξ r q).2 _).1 hs) hs.coclosed
      (rapid_sum ω c fun i => rapid_of_rapidD (cuspRapid E a (f i) Ξ q (ω i) (hV i))) hc)

end

theorem direct_borel : UpperTheory.V.Published.BorelInjC := by
  first
  | (rh_reduce 2 using [borel_from_four, pairFacts, g1, harmEx, deRhamInj]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact borel_from_four pairFacts g1 harmEx deRhamInj

end RHGalois33

rh_scan UpperTheory.V.Z.Coh.borelInjC limit 2000
rh_scan UpperTheory.V.Lit.Geo.borelInjC limit 2000
rh_scan RHGalois33.rapid_exact_zero limit 2000
rh_scan RHGalois33.direct_borel limit 2000
rh_prune RHGalois33.rapid_exact_zero as RH33RapidExactPruned
#print axioms UpperTheory.V.Z.Coh.borelInjC
#print axioms RHGalois33.rapid_exact_zero
#print axioms RHGalois33.borel_from_four
#print axioms RHGalois33.direct_borel
