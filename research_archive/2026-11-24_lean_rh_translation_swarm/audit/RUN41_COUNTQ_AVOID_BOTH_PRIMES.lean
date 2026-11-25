import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LevelAdmissibleRestrictionHolds
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN41 formal audit — 25 Nov 2026. SOURCE-MATCHED human proof; PREPARED /
NOT COMPILED. One actual CountQ selection improvement: avoid BOTH the
Frobenius prime p and coefficient prime l without increasing the ORIGINAL
auxiliary field family. This is an alternative to RUN39's one-field
saving, not a claim that both gains are simultaneous.

Read current ONE_EQUATION_MISSION blob f8b4b837301f8cf43d673be4979f04c4e4b415a4,
SWARM 4b77b161, HANDOFF bbc46df7, AGENTS 8db0201d, RESEARCH_STATE
1ff2601b, research log/protocol and continuity opening. Latest peer
commits 1c2ef505 (geometry), 2ff2915c (math), c88cc600 (literature),
f1f5fe71 (theta), 51654a1e (Galois); latest math note read in full.
Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Lean 4.33.1 /
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: for any actual r at coefficient prime l, the original CountQ
family of n^2+2 fields contains a field K_i such that
  p does not divide disc K_i, l does not divide disc K_i,
  and IsIrr (r.comp (res Q Omega K_i)).
Proof: choose the n^2+1 p-avoiding fields and ALL their classifiers
before l, exactly as in countQ_alt. Pairwise coprime discriminants
exclude at most one of these at l. Among the remaining at least n^2
distinct nontrivial signs, at most n^2-1 are self twists: insert the
trivial sign and apply twCard to the resulting set, since identity
is an intertwiner. Therefore a remaining non-self-twist sign exists;
resTwo.1 implies irreducibility. No dependence of D' on l, r, or iota.

The native classifier rootSum, Frobenius data, Galois conjugation,
two-fibre Bool, count bound and hA are UNCHANGED. Only choose a
different witness i after l is known. This gives a conditional
restriction supplier needing hA only for l-coprime discriminants
at this caller, instead of all K. In particular rank 2: 6 fields
initially, >=4 survive both exclusions; rank 4: 18, >=16 survive.
Do not combine with RUN39's smaller n^2+1 initial family without a
new stronger self-twist bound. Do not restrict the external
AdmResNAlt theorem or its other callers without independent checks.

Peer audit: 2ff2915c's discriminant-supported KillsMu implication
is compatible with quadMu; this run does not certify its Lean term.
DISAGREE with treating q_i=l and l not dividing M as an unavoidable
leaf of countQ_alt: first, the native hA applies to r restricted,
not to tw r delta (RUN39, independently reread actual hA producer);
second, even if a proposed alternative restriction supplier has
that local obstruction, the original caller can avoid l entirely.
This does NOT establish KillsMu(M,delta) away from l when disc does
not divide M, does NOT prove a twist Level theorem, and does NOT
justify removing polarization or safe transport. No claim of
global proof closure or actual native reduction of hA yet.

Original source:
src/Development/AutomorphicArithmetic/AutomorphicVarieties/
 ModularityArgument/ThresholdArguments/DenseThresholdCases/
  FrobeniusTraceCountBoundOfCmEigensystemCount.lean
    1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
  LevelAdmissibleRestrictionHolds.lean
    f22dc88980db7cea30d6ab4e4380d927a36b94e0
  AutQN.lean d626de1e423ebf58d4b7357f69905fd98829ff51
  VWinNumN.lean 3f28b91605976686fc854f34e16683ef2d700768
 GaloisLibrary/CrystallineBaseChange/
  TwCard.lean b68d8fe98a575e5f111442842e699ecb8bfab638
  ResTwo.lean cbdc8b31415f56ea47e29a317c598534848ce71c
  QuadFam.lean cb75bc09b3065d1f24e341f271a97c38a739114e
 BuildingsResidueChars/ExistsQuadraticSignCharacter.lean
    2f88a58801b17ae7fc3a5c392b624d5a16b960de

Exact same-module splice in an OVERLAY, not frozen upstream:
1. Start with ORIGINAL countQ_alt, retaining quadFam(n^2+2),
   exists_avoid p, Fin(n^2+1), c,A,D, rootSum.
2. choose δ _ _ hδ _ -> choose δ _ hδne hδ _
3. Replace the case ex obtain i,hi / by_contra / twCard block by:
    obtain ⟨i, hi, hild⟩ := RHAudit41.nonSelfTwistAvoid r hr.irr δ hδi hδne
      (fun i => discr (K₀ (u i)))
      (fun i j hij => hKc _ _ (fun hh => hij (hu hh))) (Fact.out : l.Prime)
4. Retain everything from have hirr onward. If supplying a weakened hA,
   explicitly pass hild to that new supplier; preserve original fallback.
   Put helper above copied caller or import a helper module with only
   TwCard dependencies, avoiding cycles. The file below imports original
   caller for scan/prune only; not a compiled replacement of caller.

Executed connector JS: 11 source/quantifier/splice anchor checks, actual
unchanged consumer tail checked byte-for-byte, 2,370,271 finite cardinal
configurations (n=2,3,4; all eligible self-twist masks and zero/one bad
index), 29 negative controls for the shorter family. Reproduce:
  for n in [2,3,4]:
    m=n*n+1; full=(1<<m)-1
    for mask in 0..full with popcount(mask)<=n*n-1:
      for bad in -1..m-1:
        assert full & ~mask & ~(0 if bad==-1 else 1<<bad) != 0
    m=n*n; full=(1<<m)-1
    for bad in 0..m-1:
      self=full & ~(1<<bad)
      assert full & ~self & ~(1<<bad) == 0
These are abstract cardinality controls, not actual Galois representations
or proof that the shorter family fails for native hosts. The human proof
uses the actual twCard bound, not these enumerations.
Failed attempt: default-branch code search AdmResNAlt returned no matches;
followed pinned actual caller/imports instead. Local command -v lean and
lake empty. Baseline CI statuses fetched again: returncode 0, blobs
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
7da354941e402b6f8b364ed03d8c5c82d27b7717
(runs 45577239749,45576756833). These are prior native engine/root only;
propext/Classical.choice/Quot.sound baseline, not this new certificate.
No new native or CI verification, no newly checked caller or axiom ledger.

Original graph: countQ_alt -> quadFam, p-avoid, all D, rootSum,
twCard, resTwo, hA (levelFRes, hr.aut, polarization, safeUP/safeRes),
two-fibre branch. Reduced candidate: same plus l-avoid (local finite
selection), twCard with identity; hA may be restricted only at this
caller. Preserve original graph, all type/value/constructor dependencies,
open uniform arithmetic and geometric obligations. Context key pin,
toolchain,n,p,l,r,field family,discriminants,sign map,hA,M,m,wt,iota.
No URT or speed claim. Backtrack to original if any replay fails.

RESUME HERE: kernel-check helper and actual overlay at CountQ, then use
l-coprime discriminant restriction to simplify Lev.levelFRes/safeRes
if the actual definitions permit. Do not spend time on the irrelevant
twist-admissibility exception. Retain all genuine hA, CountI/II/V/Vs,
VWinAt, geometry and prime-window obligations.
HANDOFF TO: math, kernel, Galois, integration.
VERDICT AGREE (local conductor-supported implication), DISAGREE (necessity
of exceptional at-l twist at native CountQ), PARTIAL (human selection
strengthening, not RH).
-/

noncomputable section
open NumberField UpperTheory.V UpperTheory.V.Af UpperTheory.V.Br
namespace RHAudit41

-- Exact local copy of the original private finite avoidance lemma.
private theorem avoidOne {N : ℕ} (d : Fin (N + 1) → ℤ)
    (hd : ∀ i j, i ≠ j → IsCoprime (d i) (d j))
    {p : ℕ} (hp : p.Prime) :
    ∃ u : Fin N → Fin (N + 1), Function.Injective u ∧ ∀ i, ¬ (p : ℤ) ∣ d (u i) := by
  by_cases h : ∃ j, (p : ℤ) ∣ d j
  · obtain ⟨j, hj⟩ := h
    refine ⟨j.succAbove, Fin.succAbove_right_injective, fun i hi => ?_⟩
    have := (hd _ _ (Fin.succAbove_ne j i)).isUnit_of_dvd' hi hj
    exact (Nat.prime_iff_prime_int.1 hp).not_unit this
  · exact ⟨Fin.succ, Fin.succ_injective _, fun i hi => h ⟨_, hi⟩⟩

theorem nonSelfTwistAvoid {Γ k : Type} [Group Γ] [Field k] {n : ℕ}
    (r : Γ →* GL (Fin n) k) (hirr : IsIrr r)
    (δ : Fin (n ^ 2 + 1) → (Γ →* kˣ)) (hinj : Function.Injective δ)
    (hnon : ∀ i, δ i ≠ 1)
    (d : Fin (n ^ 2 + 1) → ℤ)
    (hd : ∀ i j, i ≠ j → IsCoprime (d i) (d j))
    {l : ℕ} (hl : l.Prime) :
    ∃ i, ¬ RepIso r (tw r (δ i)) ∧ ¬ (l : ℤ) ∣ d i := by
  classical
  obtain ⟨u, hu, huv⟩ := avoidOne d hd hl
  by_contra hall
  let δ' : Fin (n ^ 2) → (Γ →* kˣ) := fun i => δ (u i)
  have hinj' : Function.Injective δ' := hinj.comp hu
  let S : Finset (Γ →* kˣ) := Finset.univ.image δ'
  have hnot : (1 : Γ →* kˣ) ∉ S := by
    intro h
    obtain ⟨i, _, hi⟩ := Finset.mem_image.mp h
    exact hnon (u i) hi
  have hcard := UpperTheory.V.Br.twCard Γ k n r hirr (insert 1 S) (by
    intro x hx
    rcases Finset.mem_insert.mp hx with hx | hx
    · subst x
      refine ⟨1, fun s => ?_⟩
      apply Units.ext
      simp [tw_val]
    · obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp hx
      by_contra hi
      exact hall ⟨u i, hi, huv i⟩)
  change (insert 1 (Finset.univ.image δ')).card ≤ n ^ 2 at hcard
  rw [Finset.card_insert_of_notMem hnot, Finset.card_image_of_injective _ hinj',
    Finset.card_univ, Fintype.card_fin] at hcard
  omega

theorem replay {Γ k : Type} [Group Γ] [Field k] {n : ℕ}
    (r : Γ →* GL (Fin n) k) (hirr : IsIrr r)
    (δ : Fin (n ^ 2 + 1) → (Γ →* kˣ)) (hinj : Function.Injective δ)
    (hnon : ∀ i, δ i ≠ 1)
    (d : Fin (n ^ 2 + 1) → ℤ)
    (hd : ∀ i j, i ≠ j → IsCoprime (d i) (d j))
    {l : ℕ} (hl : l.Prime) :
    ∃ i, ¬ RepIso r (tw r (δ i)) ∧ ¬ (l : ℤ) ∣ d i := by
  first
  | (rh_reduce 2 using [nonSelfTwistAvoid r hirr δ hinj hnon d hd hl]; done)
  | (rh_auto 2; done)
  | (rh_auto_frontier 2; done)
  | exact nonSelfTwistAvoid r hirr δ hinj hnon d hd hl

end RHAudit41
end

rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results limit 2000
rh_scan RHAudit41.nonSelfTwistAvoid limit 2000
rh_prune RHAudit41.nonSelfTwistAvoid as RHAudit41SelectionPruned
#print axioms RHAudit41.nonSelfTwistAvoid
#print axioms RHAudit41.replay
