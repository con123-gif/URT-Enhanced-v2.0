import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.BOdd
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN29 — replace BOdd geometric rank argument by classical stable homology.
Status: human mathematical derivation from published foundations;
native bridge and exact wrapper pruning PREPARED, NOT EXECUTED.

Mission read first, blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
including mandatory unified reduction engine and shared manuscript
requirement. SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
AGENTS 8db0201d; continuity/state/log/protocol retrieved (excerpts
inspected). Live manuscript 4f571d3bfce24fbaef352cd403666872a8981175.
Recent peer commits inspected: 866504ea (CM selector), d4c1ff4b
(cyclotomic trace orbit), 65c381c4 (inert singleton), recent commit
list through 613a36df. Distinct from those CountV/CountI tasks.
RUN28 weighted LemmaK bridge preserved; no alteration of main manuscript
by this lane; integration-ready block below.

Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005.
Paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/ClassCounting/
  BOdd.lean 4a683e6c236327e51ab03bc84da83f6f1f0602cc
  LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
  HasVal.lean ee8800532f5867e0bee6b50ba85e6e977328dbab
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/
  TorsionIntegers/Bridge.lean 7ff84d3d02c1f4cfb386505d590e2eb4e0c96f8c
  FinalOdd.lean a2c342444c2bf90d11b59deb8f2d3d98aa47e6fa
  SBStarOdd.lean 3d2dd76f9cec2a817ba0788135969b561c1555fc
  OddSpanRank/SBStarOddOf.lean 565b92ed21384bb9eb1352d653a40cef0bd006cd
  OddSpanRank/RankSpanLe.lean 664a1fb578bbfad5948f0fd6cb677532f4535b82
  OddWeightCycles/SWtOddOf.lean 42ffedb89f513924436c76f296101c5bc1476efe
  SurjectivityCase/SSurjOf.lean 391d94a766083f8a66e9e936981f94d6c4
Observed upstream head 251c7b05dd869ceba1aa42c6001c00b4010f23f9,
unchanged from RUN28. HasVal head blob 7d9c75f4137b821889352cfe25f066e0e3b64b6c;
FinalOdd and SWtOddOf same-path lookups 404 (not evidence their theorems
were deleted). No revisions mixed.

INTEGRATION BLOCK (BOdd only, rank over Z, not torsion size):
Let R=O_L, L totally imaginary, r2 its number of complex places.
Put m=k+1 odd, n>=2m+4, l positive integer. Native HasVal defines
psi_l(A)=I_l tensor A (l identical diagonal blocks), lev_t=l^t n,
and z_{t+1}=psi_{l,*}z_t-l^(t+2)stab_*z_t, z_0=x.
Pass to rational stable homology H_m=H_m(GL_infty(R);Q).
Stability applies at every rank lev_t: R has Bass stable range <=2,
and the stated n exceeds max(2m+1,m+2); integral homological
stability and flat rationalization identify the finite target with H_m.
Block sum gives H_* a connected graded commutative and cocommutative
Hopf structure. Stable psi_l is the l-fold power operation:
diagonal into l copies then block sum; permutations are inner
conjugation after stabilization, so ordering has no effect.
Cartan-Serre identifies primitive P_m with K_m(R) tensor Q.
The characteristic-zero connected Hopf structure theorem
(Milnor-Moore plus graded commutativity) identifies H_* with the
graded symmetric algebra on its positive-degree primitives.
Thus the power operation T_l acts by l on each primitive and, as
an algebra homomorphism, by l^j on each product of j primitives.
Only 1<=j<=m can occur in degree m. Exact native recursion gives
    z_k = product_{a=2}^m (T_l-l^a I) x.
Each length j=2,...,m vanishes by its own factor. On P_m the scalar
is product_{a=2}^m(l-l^a), nonzero for l>=2, including the empty
product at m=1. For l=1, m>1 the whole operator is zero; for m=1
it is identity. Consequently the rational image is contained in P_m
(and equals P_m for l>=2); no norm, regulator, Hecke or integration
estimate is needed for this local rank assertion.
Borel gives dim P_m=r2 for m odd >=3 when r1=0; for m=1 the determinant
identifies K1(R) with units (Bass-Milnor-Serre), and Dirichlet gives
rank r2-1. Therefore
    rank_Z span{z_k(x)} <= dim_Q P_m <= r2.
Flatness of Q over Z identifies rationalized integral image with
image of the rationalized map: torsion is not bounded or assumed zero.
This proves the native BOdd inequality in ordinary mathematics,
even without its m<r2 guard (retain guard in caller); no claim about
STors, SNum, SFinal, LemmaK or uniform all-prime cancellation.
Do not identify the native psi with Adams operations on higher K
theory: this is the block-sum power operation on stable homology.

External premise ledger, independent of the source declaration names:
* Suslin homological stability, Weibel K-book IV.1.14 and Cor.1.14.1,
  p.11; stable range <= dim(R)+1 for commutative noetherian R.
  Ring of integers is Dedekind of dimension one. Verified displayed
  theorem and range in actual PDF page 11 (zero-index 10).
* Cartan-Serre primitive identification, same page 11 bottom and
  page 12 top; BGL+ has block-sum H-space structure. Weibel IV.1.17,
  1.18 (p.12) give rank of orders and number fields. Actual PDF pages
  11 and 12 inspected visually. Link:
  https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf
* Milnor-Moore, On the structure of Hopf algebras (1965), Thm 5.18,
  graded connected characteristic-zero structure theorem, with
  finite-type homology here (arithmetic groups have finite-type
  rational homology); reference also https://doi.org/10.1007/s00029-026-01145-x.
  The stable block-sum compatibility and its comparison to native
  grpH are explicit bridge obligations for Lean.
* Degree one: Bass-Milnor-Serre K1 of number-ring equals units;
  Dirichlet unit theorem. No conjectural input, RH, GRH or URT.
* BOdd/BStarOdd/SWtOdd/SBStarOdd are Prop definitions. bOdd,
  bOdd_zk, bStarOdd, sBStarOdd_of, sWtOdd_of, sSurj_of have actual
  source bodies. bOdd_zk transports rank by HEq, not a new axiom.
  sWtOdd_of ignores its SChain and SPsi arguments explicitly
  (fun _ hE _ hS => ...); SChain is separately used by sBStarOdd_of.
  This does not establish that sPsi has no other surviving consumer.
  No imported constant is declared axiom-free here.
* Published Poitou-Tate etc from RUN28 remain distinct. Other
  PublishedTheorems/OpenLiteratureStatements not reclassified today.

Original graph (source call overlay, NOT elaborated):
VWin -> LemmaK -> lemmaK_of_steps -> h13(sChain,bOdd) -> SUpper
bOdd -> bOdd_zk -> bStarOdd -> sBStarOdd_of
 -> sChain,sSep',sBridge,sStab,sSurj_of(...),sWtOdd_of(...)
sWtOdd_of -> swtOdd + explicit invariant suppliers, not its
two discarded parameters.
Reduced human local graph: BOdd -> stable homology comparison
 + block-sum/Hopf primitive filter + Borel/unit rank + flatness.
Other shared consumers and original graph remain. No asserted
global removal of geometric/Hecke/axiom dependencies; root link is
the existing VWin source-call chain, not independently authenticated
constructor-inclusive reachability. Cache key includes pin, R/L,
m,n,l, stable vs finite target, coefficient field and BOdd consumer.
Backtrack to original bOdd_zk if native identification or replay fails.
The conditional rank certificate below checks the scalar vanishing and
the literal wrapper replacement only; it does NOT formalize Borel,
the Hopf algebra comparison or the whole BOdd supplier.

Execution evidence: retrieved ten pinned source bodies and three head
path checks as recorded above; local command -v lean/lake/elan returned
no paths. Re-read published status.json for 45577239749 (98.87 s,
returncode 0, conditional strip root only; axioms propext,
Classical.choice, Quot.sound) and 45576756833 (77.94 s, returncode 0,
bounded rh_of_right scan 2000 visited, 324 pending). These are older
engine results, not this certificate. No new Lean execution or PASS,
no invented finite rank or numerical tests. Source hashes and original
graphs retained. Native engine commands below prepared for pinned
Lean 4.33.1 / Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.

RESUME HERE: independently check the classical stable-homology bridge
against native grpH, then compile this file and replay BOdd at SUpper;
separately audit STors quantitative homological torsion supplier,
which this rational-rank reduction does not touch.
HANDOFF TO: integration/editor, kernel, audit, dependency, Galois.
-/

namespace PositivityTheory.KB
open BlockInvariants BlockEvaluationBounds

-- Exact body of the actual native wrapper with two unused premises gone.
theorem run29_sWtOdd_two : SEv → SStokes → SWtOdd := fun hE hS =>
  swtOdd hE hS (fft_of cplx sw1 sw2) aGood wPad weylTwoBlockMatrix wInv wCyc tStab tBlk pStab blockSum_preserves_cone wOneOdd wRot

theorem run29_sWtOdd_original : SChain → SEv → SPsi → SStokes → SWtOdd :=
  fun _ hE _ hS => run29_sWtOdd_two hE hS
end PositivityTheory.KB

namespace RHLiteratureRun29

-- Scalar factor exactly induced by HasVal.zSeq on a weight-j eigenvector.
theorem filter_kills (l : ℚ) (k j : ℕ) (hlo : 2 ≤ j) (hhi : j ≤ k+1) :
    (∏ t ∈ Finset.range k, (l^j - l^(t+2))) = 0 := by
  apply Finset.prod_eq_zero (i := j-2)
  · rw [Finset.mem_range]
    omega
  · rw [Nat.sub_add_cancel hlo, sub_self]

theorem filter_rule (l : ℚ) (k j : ℕ) (hlo : 2 ≤ j) (hhi : j ≤ k+1) :
    (∏ t ∈ Finset.range k, (l^j - l^(t+2))) = 0 := by
  first | rh_reduce 2 using [filter_kills] | exact filter_kills l k j hlo hhi

theorem filter_frontier (l : ℚ) (k j : ℕ) (hlo : 2 ≤ j) (hhi : j ≤ k+1) :
    (∏ t ∈ Finset.range k, (l^j - l^(t+2))) = 0 := by
  rh_auto_frontier 2
  all_goals first | exact filter_kills l k j hlo hhi | rh_auto 2

end RHLiteratureRun29

rh_scan UpperTheory.V.ZK.bOdd limit 2000
rh_scan PositivityTheory.KB.bStarOdd limit 2000
rh_prune PositivityTheory.KB.sWtOdd_of as run29_sWtOdd_pruned
#print axioms UpperTheory.V.ZK.bOdd
#print axioms PositivityTheory.KB.bStarOdd
#print axioms PositivityTheory.KB.run29_sWtOdd_two
#print axioms run29_sWtOdd_pruned
#print axioms RHLiteratureRun29.filter_kills
