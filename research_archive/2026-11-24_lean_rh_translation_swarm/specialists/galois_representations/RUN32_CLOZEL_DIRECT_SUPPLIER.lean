import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TPCohC
import Development.WeilBound.RepresentationTheoryGL.CasimirAlgebra.KugaCoordinates.ClozelCohomological
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.TemperedProductOfSquareIntegrable
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN32 — CountI/CardP/CardK cohomology input: remove entire literature
package from this one supplier, and replace the open-image wrapper
by the actual source theorem. SOURCE-MATCHED, not kernel replayed.

Exact mathematical block for integration:
Let π be a cuspidal representation of GL_a over a totally complex
number field E, a>=1, and Ξ an algebraic coefficient representation
with the negative of π's infinitesimal character at each embedding.
The native dualIff identifies the dual infinitesimal character.
The native exists_dualInfChar supplies a regular algebraic multiset;
equality of its shifted characteristic polynomials (using Ξ.d>0)
identifies it with the given multiset, so π is regular algebraic.
ClozelCohomological then supplies some Ξ' with nonzero relative
cohomology. Wigner vanishing forces the dual character of Ξ' to
match π's character at every embedding. Thus Ξ and Ξ' have the
same infinitesimal characters. Native algIso identifies the
algebraic coefficient representations; tensoring with π and
transporting relative cohomology proves IsCohFor π Ξ.
In particular, at the native count callers:
   hcoh : ClozelCohomological  ==>  ClozelCohC.
The original proof uses lit.aut.coh exactly once; no other fields.
Further, the actual root producer of this field, clozel_cohomological_of_open,
has an unused O binder and returns PositivityTheory.Rg.Cz.clozelCohomological.
That theorem is an actual source declaration, not an assumption named
after a publication. It is supplied by eight native data blocks:
KType, GK data, WhitLie, KugaAbs, KugaGlue, CoefGlue, Cochain, CasBound.
Their bodies and underlying mathematical correctness still require
full audit. No claim they are independently validated or published.

Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Paths under src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/:
TPCohC.lean 7f9fd373e34917fa49051b81aa0202984519afe8
TemperedProductOfSquareIntegrable.lean 7498ed442bf7b99617e420ee6437f8287ca5d09e
PublishedHypothesesFromPatching.lean 8a57b35c343ed717c225b04710c835f102deaa3b
TopMainZj.lean 23b7a05606074da30e6f8eb3b3821e877a968d3e
WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
AutomorphicFormHyp.lean 3bc564e5a5ab8c087c50cddef276d9fb799848a3
BrCardP.lean a2e96d9c993a392281385cc7f723acf78e614b21
TCardK.lean c6eb1d67f72c45007e3330ea65b0966f3f27cd96
Paths under src/Development/WeilBound/RepresentationTheoryGL/CasimirAlgebra/KugaCoordinates/:
ClozelCohomological.lean 081eca8b2cfd6af2227a48c6f6150daadbbea136
ClozelCohomologicalOfThree.lean a85fbc108cf255b44476297ba65b8e9c18f9c3ac
ArchimedeanWhittakerDerivatives/HasDerivAtDpsi.lean 84ff24abfde0cef59d304cf6fc103610f8bfb719
CochainExpansions/CochainHolds.lean 7535825bf7d2df6a3637db4a1709bdf41b7e6f1b
KugaGluing/KugaGlueHolds.lean 18dd01f68af6fcf92e33e098eac1e3c764677c66
Definition src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/ClozelCohomologicalModel.lean aee135858e810bc74eb32ffcb3e527cf77c83ab6.
GaloisLibrary/WignerHighestWeights/ Wigner 867df9438dbe87f0d9a5159f63f918cd4256a6ac, DualIff 5ba1e0316280854717e79a3db84af05baac08c65,
MsetSep bafec976ce95500701b026476c0a45338e3ebe67, AlgIso 93d8e7075e3952d4eb8cf1179f39afc19b0a15fa,
CohTransport f72102ec1566adb9134662d18808a45d49d14ac0.

Original local source-visible graph:
Main -> everyCharacter_of_row -> vwin_of_row -> automorphic_window_of_inputs
-> v_window_of_literal_automorphy_n -> v_window_of_automorphy_csd_ss_mono_odd
-> published_hypotheses_from_patching_alt -> clozelCohC_alt
-> lit.aut.coh -> clozel_cohomological_of_open O -> clozelCohomological
-> clozelCohomological_of_three -> clozelCohomological_of_rest.
The constructed HypothesesH' is consumed by CountI (cardP/cardK,
see RUN30/31); its Borel field is separately Z.Coh.borelInjC.
Reduced local graph: from_coh -> direct_cohC -> native clozelCohomological
(in dependency direction direct_cohC calls from_coh and clozelCohomological);
from_coh retains dualIff/msetSep/regularity/wigner/algIso/cohTransport.
No global edge deletion yet, including all type/constructor/value and
axiom edges: native graph scans below are pending. Preserve original
fallback and package for other callers. Cache key pin + E,a,π,Ξ,
character matches and specific field producer. Backtrack to original
if replay fails. No URT benefit asserted.

Execution: retrieved pinned source, performed 8 unique source anchor
assertions and 4 exact source substitutions in JS; no Lean/Lake in
local container. Existing engine CI status files both returned pass
(45577239749 and 45576756833); they do NOT check this file.
Upstream latest observed d91ae2678eea19a0c3045ffca37f1da757c2e719,
same as RUN31, not used for proof. No new CI result, no new axiom audit.
Peer handoffs inspected: c8e071b1 (weighted global energy),
141537e1 (singleton pole), b158e108 (exceptional kernel), 46b28d29
(principal page). Distinct branch. Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc;
protocol/queue/expansion, AGENTS, continuity, live manuscript and prior
RUN31 read. Full graph and other peer notes not all retrieved.

RESUME HERE: native replay this file together with RUN30/31 on pinned
toolchain, then locate and reconstruct actual Z.Coh.borelInjC theorem
body; independently audit clozelCohomological_of_rest and eight blocks.
If accepted, substitute direct_cohC at actual cardP/cardK callers, leaving
Borel and arithmetic uniform-norm, CountII/V/Vs, geometry and TopG
obligations open. Not RH or full proof validation.
HANDOFF TO integration/editor, formal audit, kernel, Galois.
-/

set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 200000
namespace RHGalois32
open NumberField Matrix GlobalTheory.CuspRep GlobalTheory.GKCoh UpperTheory.V.AlgRepEndIrreducible

theorem from_coh :
    GlobalTheory.Published.ClozelCohomological → UpperTheory.V.Published.ClozelCohC := by
  intro hcoh E _ _ _ a ha π Ξ h
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
  obtain ⟨Ξ', hΞ'⟩ := hcoh E a ha π hreg
  choose m' g1 g2 g3 using GlobalTheory.AlgInfChar.exists_dualInfChar E a Ξ'
  have e : m = m' := by
    by_contra hne
    exact wigner E a π Ξ' m m' h1 g1 hne hΞ'
  subst e
  obtain ⟨T, hT⟩ := algIso E a Ξ' Ξ (fun τ => (m τ).map Neg.neg) (fun τ => (dualIff E a Ξ' τ _).2 (g1 τ)) h2
  exact cohTransport E a π Ξ' Ξ T hT hΞ'

theorem direct_cohC : UpperTheory.V.Published.ClozelCohC :=
  from_coh PositivityTheory.Rg.Cz.clozelCohomological

theorem original_bridge :
    GlobalTheory.Mem.LiteralAutomorphy.LiteratureRankNHypothesis →
    UpperTheory.V.Published.ClozelCohC := by
  intro _
  first
  | (rh_reduce 2 using [direct_cohC]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact direct_cohC

end RHGalois32

rh_scan UpperTheory.V.Af.clozelCohC_alt limit 2000
rh_scan PositivityTheory.Rg.Cz.clozelCohomological limit 2000
rh_scan RHGalois32.direct_cohC limit 2000
rh_prune UpperTheory.LiteratureTheorems.clozel_cohomological_of_open as RH32OpenClozelPruned
rh_prune RHGalois32.original_bridge as RH32ClozelPackagePruned
#print axioms UpperTheory.V.Af.clozelCohC_alt
#print axioms PositivityTheory.Rg.Cz.clozelCohomological
#print axioms RHGalois32.from_coh
#print axioms RHGalois32.direct_cohC
#print axioms RHGalois32.original_bridge
