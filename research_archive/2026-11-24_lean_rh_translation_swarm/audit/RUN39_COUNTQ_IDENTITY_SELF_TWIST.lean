import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.FrobeniusTraceCountBoundOfCmEigensystemCount
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.LevelAdmissibleRestrictionHolds
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.VWLevel
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN39 formal audit, 25 Nov 2026. SOURCE-MATCHED mathematical improvement;
PREPARED Lean helper and same-module splice; NOT COMPILED. RH OPEN.
Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 (latest including
mandatory unified engine), SWARM 4b77b161, HANDOFF bbc46df7, AGENTS
8db0201d, RESEARCH_STATE opening consulted. Latest peer commits
3843ba68 (rank-one PotCrys), 2c98bf97 (Sha anchor), 1f13cbb4
(alternative Hurewicz), de1f67ea (route correction), b2536f01,
bed688c0, c28ee336, f26f77b4 inspected via latest commit list and
selected source patches. Pin 40e56bab026552e089d7afcfeff08d2defb9c005,
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESULT: the native TwCard bound includes the trivial character, so
  # {nontrivial self-twist characters in a finite set} <= n^2 - 1.
For a family of n^2 distinct nontrivial characters, at least one is
not a self twist. Proof: insert 1 in the finite set. The identity
intertwiner shows RepIso r (tw r 1), the native twCard gives n^2+1
<= n^2, contradiction. SignEx explicitly supplies delta != 1
(previous countQ_alt discarded that field). No new p-adic premise.
After avoiding p, the quadratic field selection now needs n^2
instead of n^2+1; start with n^2+1 rather than n^2+2 fields.
Rank two: 6 initial -> 5 initial, 5 usable -> 4 usable.
Rank four: 18 initial -> 17 initial, 17 usable -> 16 usable.
Only polynomial constants/family sizes improve, no RH exponent gain.

Exact source-level caller audit (AGREE with twist_above locally;
DISAGREE with treating rank-one PotCrys of the auxiliary sign as
a required leaf of the original CountQ construction):
countQ_alt ex uses twCard and resTwo.1 to find irreducible
r.comp(res Q Omega K), then hA applied to the ORIGINAL hr and hirr.
AdmResNAlt has exactly this restriction conclusion. Its original
producer admissible_restriction_level_n_of_printed_results obtains
Lev.LevelF.of_level hr.level then Lev.levelFRes on r (restriction),
hr.aut, polarization, and safeRes'/safeUP'_alt. The two-fibre
consumer resTwo.2 uses the twist only as a RepIso alternative.
There is no explicit KillsMu, PotCrysAt, or twist_above call in
countQ_alt. A separate construction needing admissibility of
tw r delta may legitimately use the peer's rank-one lemma, but it
is not a missing local premise of this native caller. Do not infer
that no transitive proof or other caller needs such twist facts.
Keep all actual hA suppliers, including level restriction, safe
transport, automorphy and polarization. VWinNumN explicitly invokes
countQ_alt at rank 4 with weights (e+1,e,1,0); the rank-two safety-gap
shortcut cannot retire those rank-four safe premises.

Same-module splice (do not edit frozen upstream; use an overlay):
1. Import this helper without creating an import cycle: put helper
   in a module importing only TwCard and the necessary basic
   definitions; or insert helper above countQ_alt in the copy.
2. In countQ_alt ONLY, change quadFam (n ^ 2 + 1 + 1) to
   quadFam (n ^ 2 + 1), ((n ^ 2 + 1) * sum c) to
   ((n ^ 2) * sum c), and Fin (n ^ 2 + 1) to Fin (n ^ 2).
3. Change choose delta _ _ hdelta _ to choose delta _ hdeltaNe hdelta _.
4. Replace the obtain i,hi by_contra/twCard block by
   obtain ⟨i, hi⟩ := RHAuditCountQ.nonSelfTwist r hr.irr δ hδi hδne
   (use hδne as exact binder name). Keep everything from
   have hirr := (resTwo ... onwards byte-for-byte unchanged.
5. Compile the actual copied theorem including private helpers;
   check rank2 and rank4 consumers, exact original statement
   bridge and axiom ledger. No new kernel claims in this file.

Original graph: countQ_alt -> quadFam(n^2+2), exists_avoid,
twCard(nontrivial family), resTwo, hA (levelFRes, aut, polarization,
safeUP/safeRes), countP and rootSum, two-fibre classification.
Reduced candidate graph: same edges, quadFam(n^2+1),
twCard(insert 1 nontrivial family), identity intertwiner; same
hA, same field and prime witnesses, countP/rootSum/sibling branches.
No global retirement or conflation of rank2/rank4. Alternative
twist-admissibility supplier preserved, not added to native route.
Cache pin/toolchain, n, r, hIrr, family delta, hdeltaNe, hdeltaInject,
actual prime, field, hA, weights and modulus, type/constructor roles.
Backtrack to original n^2+2 family if overlay fails. No URT used.

Source ledger (relative src/Development/AutomorphicArithmetic/AutomorphicVarieties/):
ModularityArgument/ThresholdArguments/DenseThresholdCases/
 FrobeniusTraceCountBoundOfCmEigensystemCount.lean 1d11880bc0e56eae0a673f4ddc6a7da9a05a7f40
 AutQN.lean d626de1e423ebf58d4b7357f69905fd98829ff51
 LevelAdmissibleRestrictionHolds.lean f22dc88980db7cea30d6ab4e4380d927a36b94e0
 VWinNumN.lean 3f28b91605976686fc854f34e16683ef2d700768
 VWLevel.lean 6e8dfa077c8599bb6f3707c5d656b885f34a60c7
GaloisLibrary/CrystallineBaseChange/TwCard.lean b68d8fe98a575e5f111442842e699ecb8bfab638
GaloisLibrary/CrystallineBaseChange/CqStmt.lean 13f9ae82d949d70758bdf3fc7c579eac88d41bbd
GaloisLibrary/CrystallineBaseChange/ResTwo.lean cbdc8b31415f56ea47e29a317c598534848ce71c
AutomorphicForms/BcDefs.lean 8d993474a875273ff2d79bbbc2dbf0fff11bae57
BuildingsResidueChars/ExistsQuadraticSignCharacter.lean 2f88a58801b17ae7fc3a5c392b624d5a16b960de

Executed connector JS: 30 fail-on-error source pin, literal caller and
splice checks, including exact equality of original/revised tail.
707390 integer boundary configurations for n=2..128 and k=0..n^2;
127 negative controls at k=n^2 distinguish including identity.
These are regressions, not number-field arithmetic or kernel checks.
Reproduce loop: for n=2..128, for k=0..n^2, assert k<=n^2 and
(k+1<=n^2)==(k<n^2). Sharpness control rank2: X=[[0,1],[1,0]],
Z=[[1,0],[0,-1]], XZ=-ZX. The group generated is dihedral order 8,
irreducible over C (Z eigenlines interchanged by X). Intertwiners
g=X^a Z^b give the sign on X as (-1)^b and Z as (-1)^a;
8 exact generator matrix identities checked in connector JS:
for a,b in {0,1}, assert gX=(-1)^b Xg and gZ=(-1)^a Zg.
All 3 nontrivial sign self twists exist, so generic rank2 bound
cannot improve below 3. No claim these finite examples are native
automorphic representations.

Failed attempts: code search returned zero paths for IsPotCrysAt;
used actual pinned consumer/import chain instead. Two peer math
branch file lookups returned 404; exact commit patch was available.
Local lean/lake absent (command -v checked). Existing CI status JSON
blobs b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 fetched, returncode 0,
runs 45577239749 and 45576756833. Axiom evidence for those conditional
root/engine baselines only: propext, Classical.choice, Quot.sound.
New file not compiled or queued; scans and axiom commands are requests.
No original graph, unresolved axiom or branch deleted.

RESUME HERE: replay nonSelfTwist, splice into actual CountQ copy
with private helpers preserved, check both rank2/4 consumers.
Focus further native hA work on levelFRes/polarization and actual
safety cases, not an additional sign-twist admissibility premise.
Keep uniform CountI/II/V/Vs and geometric/prime-window bounds open.
HANDOFF TO math, integration, kernel, Galois, editor.
VERDICT AGREE (local twist theorem), DISAGREE (its necessity at
native CountQ), PARTIAL (new finite family reduction, no RH closure).
-/

noncomputable section
open UpperTheory.V.Af UpperTheory.V.Br
namespace RHAuditCountQ

theorem nonSelfTwist {Γ k : Type} [Group Γ] [Field k] {n : ℕ}
    (r : Γ →* GL (Fin n) k) (hirr : IsIrr r)
    (δ : Fin (n ^ 2) → (Γ →* kˣ)) (hinj : Function.Injective δ)
    (hnon : ∀ i, δ i ≠ 1) : ∃ i, ¬ RepIso r (tw r (δ i)) := by
  classical
  by_contra hall
  let S : Finset (Γ →* kˣ) := Finset.univ.image δ
  have hnot : (1 : Γ →* kˣ) ∉ S := by
    intro h
    obtain ⟨i, _, hi⟩ := Finset.mem_image.mp h
    exact hnon i hi
  have hcard := UpperTheory.V.Br.twCard Γ k n r hirr (insert 1 S) (by
    intro d hd
    rcases Finset.mem_insert.mp hd with hd | hd
    · subst d
      refine ⟨1, fun s => ?_⟩
      apply Units.ext
      simp [tw_val]
    · obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp hd
      by_contra hi
      exact hall ⟨i, hi⟩)
  change (insert 1 (Finset.univ.image δ)).card ≤ n ^ 2 at hcard
  rw [Finset.card_insert_of_notMem hnot, Finset.card_image_of_injective _ hinj,
    Finset.card_univ, Fintype.card_fin] at hcard
  omega

theorem replay {Γ k : Type} [Group Γ] [Field k] {n : ℕ}
    (r : Γ →* GL (Fin n) k) (hirr : IsIrr r)
    (δ : Fin (n ^ 2) → (Γ →* kˣ)) (hinj : Function.Injective δ)
    (hnon : ∀ i, δ i ≠ 1) : ∃ i, ¬ RepIso r (tw r (δ i)) := by
  first
  | (rh_reduce 2 using [nonSelfTwist r hirr δ hinj hnon]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact nonSelfTwist r hirr δ hinj hnon

end RHAuditCountQ

rh_prune UpperTheory.GalN.V.Win.N.countQ_alt as RHAuditCountQ.CountQPruned39
rh_scan UpperTheory.GalN.V.Win.N.countQ_alt limit 2000
rh_scan UpperTheory.V.Z.Win.A4.admissible_restriction_level_n_of_printed_results limit 2000
rh_scan RHAuditCountQ.nonSelfTwist limit 2000
#print axioms UpperTheory.GalN.V.Win.N.countQ_alt
#print axioms RHAuditCountQ.nonSelfTwist
#print axioms RHAuditCountQ.replay
