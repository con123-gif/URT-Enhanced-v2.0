import Development.AutomorphicArithmetic.AutomorphicVarieties.LevelCohomology.PropZ
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.JointWinOfCounts
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Lane 11, 25 Nov 2026. SOURCE-MATCHED / PREPARED native replay, not compiled.
One result: recover the actual existing unconditional PropZ supplier and
remove this as a proposed new arithmetic premise at the real window consumer.
This is not discovery of a new upstream theorem, nor a proof of RH.

Mission blob f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first, including
mandatory unified engine. SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION
c8152d07, AGENTS 8db0201d, continuity/state/protocol/log openings read.
Peers 47b619fd (previous kernel), 21574277 (CaseI exception), e9256be1
(singleton trace), a7ba9251 (dyadic aggregate), 2a39654b (K2), 42529776
(dual twist), 678de808 (mean consumer). No overwrite of peer files.
Upstream frozen 40e56bab026552e089d7afcfeff08d2defb9c005;
latest upstream observed 98d36aafeeb30c1f40fdda96c3574faa34dfa413,
dated 25 Nov 18:21:56 UTC, not substituted. Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

SOURCE RECOVERY corrects the missing-source note in peer 1fe24ac8 and
RUN12. Listing the actual LevelCohomology directory found PropZ.lean,
not previously located by code search. Its complete proof has two cases:
  l-1 | e: zOne;
  not l-1 | e: zQuad.
Both are actual theorem declarations, not literature statement predicates.
No need to add ResidualKill or assume PropZ as a new input to CountZ.

Source anchors, relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
LevelCohomology/PropZ.lean 725ebfc6d262f113cb593a8db61c12e7e6b028a3
LevelCohomology/TorsClass.lean abccc2d2c3aadebdafc35fc4297c8a9281447f58
LevelCohomology/ZqField.lean e840b95ef5bf30aec2cd51f52ddf74b4da843f48
LevelCohomology/HQuad.lean a9e92ff928717178ef3277e4cab9999275d037d7
HeightAndVanishing/Counts.lean 0d9f87aacf2d53abe43d894c1d822f071599ee57
HeightAndVanishing/CountZ.lean 5601df23547fac2586abcd3717f6ae7c468e8b03
HeightAndVanishing/SumOut.lean 781726edc101d9f7bfae6b49bf68a1d1f1f67ee5
HeightAndVanishing/JointWinOfCounts.lean 2f86e49421d870aa158af11ad1388da80b5d70d1

Exact source-local cancellation: CountZ chooses C=0, proves even e
using the trivial character, invokes propZ and V'_le_V, obtaining Vlen=0.
Hence the weighted CaseZ summand is literally zero (not merely <=1);
no class-number estimate for the full cyclotomic field is needed.
Native zQuad constructs K=Q(sqrt(l)), with discr K=l, degree 2.
hQuad proves h(K)<=sqrt(l)*(1+log(sqrt(l)))<l. This is a native supplier
for the quadratic class-number input of the peer human argument.
zq_hom factors the restricted cocycle through Kum.pullOnto and kills
its image by coprimality of h(K) and l. Preserve the actual local guards:
Kum.XDual in zq_main requires both inertia and decomposition at l.
The native proof establishes the decomposition condition using a local
unit difference (alpha(t)-1) and l-torsion; do NOT replace it with
mere inertia vanishing without checking that bridge. The RUN12
normalization-before-torsion proof remains a possible shorter human
alternative, but not a needed new input here.

Original source-visible conditional graph:
vwin_of_counts -> jointWin_of_counts -> thmHV_of_counts ->
pointHV_of_counts -> sumOut -> CountZ supplied as a parameter.
Candidate specialized graph:
vwin_noZ -> vwin_of_counts with CountZ := countZ(propZ) ->
zOne/zQuad (hQuad, Kum.pullOnto, local and torsion suppliers).
No dependency is claimed globally deleted: the parameter is supplied,
not erased from the proof graph. Retain all other inputs, including
CountIII in the generic interface. For principal-only CountIII and
CountIV refinements use audited peer work, not a claim of universal
vanishing. No import of Main or the claimed RH theorem.

Actual checks executed in connector V8: 24 exact source-string presence
assertions across six pinned files, for named declarations, direct calls,
class-field and local guards. No native compilation. Local container
command -v lean / lake both returned no path. Previous CI status.json
records fetched directly: strip root b1c96f58 and prune 7da35494 pass;
diagonal root abs fix 0669c532 status pass returncode 0 wall 277.66s
(verified published record, peer run 45670987597). These are NOT
verification of PropZ or this new overlay. Do not infer a clean
transitive axiom ledger for this file until actual replay.

Cache only by pin + toolchain + declaration + exact context; no merge
of distinct host, l, e, coefficient ring or local conditions. Original
and candidate scans below are bounded; discovered pending nodes remain
open. Backtrack to original native consumer if overlay fails.
-/

open Formalism.GaloisCohomology UpperTheory.Top
open UpperTheory.V.HV

namespace RHKernel13

theorem countZ_native : CountZ :=
  UpperTheory.V.HV.countZ UpperTheory.V.X.propZ

/-- Same actual obligation, bounded reduction engine with exact fallback. -/
theorem countZ_reduced : CountZ := by
  first
  | rh_reduce 2 using [UpperTheory.V.HV.countZ, UpperTheory.V.X.propZ]
  | exact countZ_native

theorem sumOut_noZ (h1 : CountI) (h2 : CountII) (h3 : CountIII) : SumOut := by
  have hz : CountZ := by
    first
    | rh_auto 1
    | exact countZ_native
  exact sumOut h1 hz h2 h3

theorem pointHV_noZ (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) {CK : ℝ}
    (hK : LemmaK CK) (h1 : CountI) (h2 : CountII) (h3 : CountIII)
    (h5 : CountV) : PointHV :=
  pointHV_of_counts hP hF hT hK h1 h2 h3 h5 countZ_native

theorem vwin_noZ (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) {CK : ℝ}
    (hK : LemmaK CK) {K : BConst} (hB : ThmBab K 401)
    (hc : ThmBcFree) (h1 : CountI) (h2 : CountII) (h3 : CountIII)
    (h5 : CountV) : VWin := by
  have hz : CountZ := by
    first
    | (rh_auto_frontier 1; done)
    | exact countZ_native
  exact vwin_of_counts hP hF hT hK hB hc h1 h2 h3 h5 hz

end RHKernel13

rh_prune RHKernel13.countZ_native as RHKernel13.CountZPruned
rh_scan UpperTheory.V.X.propZ limit 2000
rh_scan UpperTheory.V.HV.sumOut limit 2000
rh_scan UpperTheory.V.HV.vwin_of_counts limit 2000
rh_scan RHKernel13.vwin_noZ limit 2000
#print axioms UpperTheory.V.X.zOne
#print axioms UpperTheory.V.X.zQuad
#print axioms UpperTheory.V.X.propZ
#print axioms RHKernel13.countZ_native
#print axioms RHKernel13.countZ_reduced
#print axioms RHKernel13.sumOut_noZ
#print axioms RHKernel13.pointHV_noZ
#print axioms RHKernel13.vwin_noZ

/-!
RESUME HERE: submit the exact overlay to the existing pinned Lean runner
for bounded role export and axiom replay; compare original and candidate
graphs. In the meantime integration should cite the recovered PropZ,
zQuad and hQuad rather than list CountZ as a missing source supplier.
Prioritize CountI/II/V/Vs, dyadic/minus and joint same-host geometry;
those are not established by this result. Do not duplicate the already
present native PropZ proof. Original RUN12 certificate remains intact.
HANDOFF TO: integration, Galois, audit, editor and dependency lanes.
New kernel-validated obligations in this run: zero. RH OPEN.
-/
