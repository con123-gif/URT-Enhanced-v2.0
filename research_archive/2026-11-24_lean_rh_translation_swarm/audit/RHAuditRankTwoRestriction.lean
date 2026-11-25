import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LevelAdmissibleRestrictionHolds
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.NewAdmS
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
25 Nov 2026 — AUDIT, source-matched / PREPARED, not kernel checked.
Mission latest blob cd0a176134d46b5b624896e56843a24915c14477.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: AGREE with peer b6601b9c's weight gap proof, but DISAGREE that
this discharges a previously open mathematical premise at NewAdmAlt.
NewAdmS.lean (9ff5274437cee75cdeb73576013adfb16cdd33c7) already fills
safe via safeUGap' hlev and the four weight comparisons; it also
fills dual via the supplied determinant character and dual_two W.
Do not queue a duplicate of that elementary proof as a root closure.

New consequential specialization: at CountQAlt(2,[e,-e],0), the actual
restriction producer admissible_restriction_level_n_of_printed_results
can fill its final SafePA field directly by the SAME weight-only
right disjunct. This deletes the local calls safeUP'_alt and safeRes'
and their dependency on the input global irreducibility and SafeRA
fields; restricted irreducibility, level, automorphy, polarization and
all original host/prime data remain. The generic CountQ selection
still uses global irreducibility in twCard/resTwo; it cannot be deleted
globally. The generic safe transfer invokes potQ/flagLaws/splitIrr on
the other branch. No assumption that these branches are false in general.

Original source-visible graph:
frobenius_trace_count_bound_of_rat_eigensystem_count_alt -> CountQAlt
(rank 2, m=[e,-e], wt=0) -> countQ_alt case ex, hA -> AdmResNAlt
-> admissible_restriction_level_n_of_printed_results -> levelFRes,
aut, polarization_k_of_printed_results, safeUP'_alt -> potQ, safeRes'.
Reduced proposed local graph: same consumer -> rankTwoRestriction ->
levelFRes, aut, polarization, weight gap. The actual full countQ_alt
specialization/caller substitution is still pending; this is a local
original-interface bridge, not integrated or a proven deletion from the
elaborated root. Boolean classifier remains; no new twist uniqueness.

Sources (all under ModularityArgument, exact pinned blobs):
ThresholdArguments/DenseThresholdCases/LevelAdmissibleRestrictionHolds.lean
 f22dc88980db7cea30d6ab4e4380d927a36b94e0
ThresholdArguments/DenseThresholdCases/SafeUP.lean
 da1a97fba20d196755b031f9efdd33e93ef56d9c
AutomorphyLifting/AdmissibleLevelRestriction/UnlAllOf.lean
 125ba13df0fb07890a431dcded6fb91c22f1b1e0
ThresholdArguments/DenseThresholdCases/FrobeniusTraceCountBoundOfCmEigensystemCount.lean
 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
ThresholdArguments/DenseThresholdCases/AutQN.lean
 d626de1e423ebf58d4b7357f69905fd98829ff51

Execution: 18 source blob/anchor assertions on the five files above
including NewAdmS, excluding AutQN from the assertion batch; 40,000
integer gap assertions for e=1..10000, all four ordered pairs. Universal
proof: differences minus 1 are -1, 2e-1, -2e-1, -1, never zero for
e>=1. Finite tests are regression only. Local PATH has neither Lean
nor Lake. Actual published status.json for old CI 45577239749 and
45576756833 retrieved; both pass their old tests only. No new PASS,
no new axiom ledger, no executable full-root replay. Native commands
below are queued instructions, not executed output. Previous candidate
and original graph remain unchanged.

Cache key: pin/toolchain, AdmResNAlt, n=2, m=[e,-e], wt=0, e>=1,
K, Omega, l, M, iota, r and restricted-irreducibility context.
Retain original theorem if replay fails. No URT benchmark.
Read mission, protocol, queue, AGENTS, research state excerpt, living
manuscript and recent peers b6601b9c, 2df8b6cc, 259672cc, 0cf4b3fb,
1b03d6e3. Root closure count: zero. Highest priority remains VWinAt
and the shared same-host geometry/arithmetic frontier.

RESUME HERE: compile this exact local replacement with the existing
native engine modules and check the rank-two countQ_alt caller using
it instead of hA. Audit the surviving polarization and levelFRes
suppliers; retain global irr for twCard/resTwo and all classifier
quantifiers. Do not pursue Boolean factor deletion merely to reduce
a fixed constant in the polynomial estimate.
HANDOFF TO: math, kernel, Galois, integration.
Verdict AGREE / DISAGREE / PARTIAL as above.
-/

noncomputable section
open NumberField IsDedekindDomain IsLocalRing Formalism.ConjugateSelfDual
  ReciprocityTheory.Gal Formalism.BasicNotions Formalism.MainNotions.N
  Polynomial GlobalTheory.CuspRep GlobalTheory.GalOfCusp UpperTheory.V
  UpperTheory.V.Af UpperTheory.V.HV UpperTheory.V.U3 UpperTheory.V.Aut
  UpperTheory.V.Pr UpperTheory.GalN.V

namespace RHAuditRankTwoRestriction

theorem rankTwoRestriction
    (hP : _root_.UpperTheory.V.Af.Hypotheses')
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank ℚ K = 2) (e M : ℕ) (he : 1 ≤ e)
    (l : ℕ) [Fact l.Prime]
    (Ω : Type) [Field Ω] [Algebra ℚ Ω] [Algebra K Ω]
    [IsScalarTower ℚ K Ω] [IsAlgClosure ℚ Ω] [IsAlgClosure K Ω]
    (ι : Qbar l ≃+* ℂ) (r : G ℚ Ω →* GL (Fin 2) (Qbar l))
    (hlevel : Level l M ![(e : ℤ), -(e : ℤ)] r)
    (haut : _root_.UpperTheory.V.Z.Win.IsAutQA ι r)
    (hdual : ∃ θ, IsCycWt l 0 θ ∧ DualTw r θ)
    (hirr : IsIrr (r.comp (res ℚ Ω K))) :
    _root_.UpperTheory.GalN.V.AdmPNAlt ι M ![(e : ℤ), -(e : ℤ)]
      (r.comp (res ℚ Ω K)) := by
  have hC := Lev.LevelF.of_level hlevel
  have hF := Lev.levelFRes ℚ K Ω l 2 M ![(e : ℤ), -(e : ℤ)] r hC
  obtain ⟨⟨P, hreg, hA⟩, hW⟩ := haut hC.cont K hK hirr
  obtain ⟨θ, hθ, hd⟩ := hdual
  obtain ⟨χ, μ, hpol, -, -⟩ :=
    _root_.UpperTheory.V.Z.Bc.polarization_k_of_printed_results
      hP K hK 2 (by norm_num) l Ω ι r 0 θ P hθ hd hA
  refine ⟨hirr, ⟨P, hreg, ⟨χ, hpol⟩, hA⟩, hW, hF, ?_⟩
  apply Or.inr
  intro i j
  fin_cases i <;> fin_cases j <;> simp <;> omega

theorem rankTwoRestriction_original_bridge
    (hP : _root_.UpperTheory.V.Af.Hypotheses')
    (K : Type) [Field K] [NumberField K] [IsCMField K]
    (hK : Module.finrank ℚ K = 2) (e M : ℕ) (he : 1 ≤ e)
    (l : ℕ) [Fact l.Prime]
    (Ω : Type) [Field Ω] [Algebra ℚ Ω] [Algebra K Ω]
    [IsScalarTower ℚ K Ω] [IsAlgClosure ℚ Ω] [IsAlgClosure K Ω]
    (ι : Qbar l ≃+* ℂ) (r : G ℚ Ω →* GL (Fin 2) (Qbar l))
    (hr : _root_.UpperTheory.GalN.V.AdmRNAlt ι M ![(e : ℤ), -(e : ℤ)] 0 r)
    (hirr : IsIrr (r.comp (res ℚ Ω K))) :
    _root_.UpperTheory.GalN.V.AdmPNAlt ι M ![(e : ℤ), -(e : ℤ)]
      (r.comp (res ℚ Ω K)) := by
  have hlevel := hr.level
  have haut := hr.aut
  have hdual := hr.dual
  first
  | (rh_reduce 2 using [rankTwoRestriction]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact rankTwoRestriction hP K hK e M he l Ω ι r hlevel haut hdual hirr

end RHAuditRankTwoRestriction

rh_scan UpperTheory.V.Z.Win.A4.newAdmS_alt limit 2000
rh_scan UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results limit 2000
rh_scan RHAuditRankTwoRestriction.rankTwoRestriction limit 2000
rh_prune RHAuditRankTwoRestriction.rankTwoRestriction as RHAuditRankTwoRestrictionPruned
#print axioms UpperTheory.V.Z.Win.A4.newAdmS_alt
#print axioms RHAuditRankTwoRestriction.rankTwoRestriction
#print axioms RHAuditRankTwoRestriction.rankTwoRestriction_original_bridge
