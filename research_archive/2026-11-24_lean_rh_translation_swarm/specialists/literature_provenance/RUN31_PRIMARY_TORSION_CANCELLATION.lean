import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.SUpperOf
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.NumThree
import Development.EtaleCohomology.CyclotomicDiscriminants.SFewOfCut
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN31 — prime-primary torsion only, in the actual SUpper -> SFew -> sNum path.
STATUS: human source-matched proof of strengthened quantitative bound; partial
Lean replay candidate (Bockstein and fiber restriction), NOT compiled.

INTEGRATION BLOCK:
Let q=l^nu, l prime, k even as in native SUpper, r=r2(L),
N=2(k+1)+4. Write T_i=tors H_i(GL_N(O_L),Z), finite by tors_le.
For any finite abelian T, T[q]=ker(q:T->T), T(l) its l-primary part.
The stronger SUpper bound in the EXACT same context is
  |S| <= q^r |T_(k+1)[q]| |T_k[q]|
      <= q^r |T_(k+1)(l)| |T_k(l)|.
Proof:
(1) In native SUpperOf, beta is the Bockstein on cycles with Z/q
coefficients. Its target is tors H_k, but q kills every input, so
q beta(y)=beta(q y)=0. The fiber-count argument in FibCount therefore
uses only T_k[q]. This does not require surjectivity of beta.
(2) In native RankCountAlt, J' is the finite Z-span of chosen lifts in
J, with rank s<=r. J' is finitely generated, so J'/tors J' is free of
rank s. The map f:J'->B factors through J'/qJ' because qB=0.
Thus |f(J')|<=q^s |tors(J')/q tors(J')| = q^s |tors(J')[q]|.
The equality follows from the kernel/image count of multiplication by
q on the finite torsion group (not an assertion of canonical isomorphism).
tors(J')[q] injects into tors(H)[q]. This replaces the rankCount bound,
including the scalar u in rankCount_mod: u*x still belongs to the span.
No finite-generation assumption on all of H or J is needed.
(3) The actual TorsStab proof constructs an additive equivalence between
homologies in the stable range, not merely an equality of total orders.
It restricts to q-torsion because e(q*x)=q*e(x); its inverse does too.
Hence the two factors at n and lev l n k become the displayed factors at N.
(4) SFewOfCut.sFewOf builds an injection f from S into a finite set of
scaled primitive-family evaluations, then invokes SUpper once, at
k=2e+2. The improved bound therefore propagates without changing any
separation, residue, cyclotomic, or theta hypotheses.
(5) In sNum take E=e+1, k=2E, N=4E+6, and the SAME SLayer field L'.
Put a_i(l)=v_l(|T_i|), X=(b+v_l(E))*gens(L')+c+v_l(E), with
b=2E+(2E+1)*(c+2E+1). Replacing each q-torsion cardinal by the
larger l-primary cardinal l^a_i makes the bound independent of nu,
as required by SSha. SCount cancels the exact common q^r factor before
taking logarithms. SSha gives l^s<=l^(a_(2E+1)+a_(2E)+X).
Monotonicity (l>=2) now gives the entirely integral result
  s <= a_(2E+1)(l) + a_(2E)(l) + X.
The original transfer shaInv(L)<=shaInv(L') remains.
For fixed L',E,N the torsion contribution aggregates EXACTLY:
  sum_(l prime) (a_(2E+1)(l)+a_(2E)(l))*log(l)
    = log(|T_(2E+1)|*|T_(2E)|).
This is just finite integer factorization, so it never charges a
prime-to-l part to l. For a restricted prime set use <=.
CRITICAL LIMIT: the actual SLayer field may change with l and E.
Do not apply that fixed-field aggregate identity to different fields.
No uniform polynomial CountI/II/V/Vs estimate or RH closure follows.
No identification of K-groups and integral homology is invoked.

SOURCE LEDGER (pin 40e56bab026552e089d7afcfeff08d2defb9c005).
Paths relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties:
 ModularityArgument/ClassCounting/SUpperOf.lean 8cccf88aa58f6e2bd69f080e46f4f10b4248d559
 ModularityArgument/ClassCounting/TorsionRankCounts/RankCount.lean 86433021ed2fcc3b36779bb539973123997b1021
 ModularityArgument/ClassCounting/TorsionRankCounts/RankCountAlt.lean 28a67533865647e2e00f1726ebec376f3e34136d
 ModularityArgument/ClassCounting/TorsionRankCounts/BockAbs.lean b52c8a47f9b451519312f6a854281bc807254a56
 ModularityArgument/ClassCounting/TorsionRankCounts/FibCount.lean ec22835beda82515f5689cb161abe44e3d023682
 ModularityArgument/ClassCounting/TorsionRankCounts/TorsStab.lean 75aec7ac2e31d217179077cc1febeb2f7c612d42
 ModularityArgument/ClassCounting/NumThree.lean 900c8e3fca10cdf9256061213dcc9453bf98f3d2
 ModularityArgument/ClassCounting/LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
 ModularityArgument/ClassCounting/LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
 LiteratureResults/KTheoryStability/HomologicalStability/KStability.lean 1a6ea833aef345f39c560139521bf9637ba86aa6
 LiteratureResults/KTheoryStability/HomologicalStability/LinkExactnessStability/HomologicalStabilityTheorem.lean d67fc3fe13759707c6e76b6ba8ddcf5659081164
 src/Development/EtaleCohomology/CyclotomicDiscriminants/SFewOfCut.lean 1c294cd3b56d004fc313c2e2febb40cf637e0b52
 src/Development/EtaleCohomology/CyclotomicDiscriminants/FinSFewOf.lean 4e084643259aca0182891bb055cc8ebd2f375b1a

PROVENANCE / EXTERNAL ASSUMPTION LEDGER:
RankCount, Bock, FibCount, TorsStab, SUpper, SFew are proposition
definitions; rankCount, bock, fibCount, torsStab, sUpperOf, sFewOf,
sNum are theorem-producing bodies. KStability.kStability is a
theorem wrapper of GlobalTheory.HomStab.kStability_main, NOT
evidence of a new axiom merely by naming. That supplier has an
actual strong-induction body using two stable-range induction
theorems; full transitive axiom audit still outstanding.
FinSFewOf.intersectionNumber_baseChange wraps few_of_statement_holds,
which calls SFewOfCut.sFewOf; name has no independent citation force.
The original external BOdd/rank premise, PoitouTateDuality,
LocalFinitenessK, LocalTateDualityK and all other original SLayer,
SFew/SClass/STheta/SDetect/SSha premises remain. No new literature
axiom. The Bockstein argument is elementary homological algebra;
we use the native source proof, not an unverified citation.

Original local graph (source-value/type overlay, not complete root DAG):
lemmaK -> lemmaK_of_steps -> sNum -> SFewOfCut.sFewOf -> sUpperOf
-> rankCount, bock, fibCount, torsStab, descend, zVal, BOdd;
sNum -> hCount, hSha, hLayer, STors. Reduced graph retains all,
but rankCount/fibCount consume only q-torsion factors, and STors can
be replaced locally by the paired prime-primary order estimate.
The original graph and previously recorded axiom evidence remain
unchanged until full caller replay. Cache key: source pin, exact
SUpper context (L, l, nu, k, N, actual Phi, B, q annihilation,
stable-range proof), SLayer field and E. Never conflate different L'.
Fallback on replay failure: original SUpper and RUN30's full budget.

EXECUTION: actual pinned source retrieval for all 13 ledger paths;
latest peer commits 0e5b40dc, 5d85634d, a987e3f9, 6821df81,
0b0399c1 and others reviewed by commit summaries / handoff patches.
Read latest ONE_EQUATION_MISSION blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM/HANDOFF/EXPANSION, AGENTS, state and continuity, prior RUN30.
Upstream head d91ae2678eea19a0c3045ffca37f1da757c2e719; SUpperOf
head blob b63b5bd50187b49d7b63f70494bf0239d71f370c, imports/body reorganized.
Old separate BockAbs, RankCountAlt, TorsStab paths returned 404;
not evidence of theorem removal. All reasoning uses frozen pin.
CI published status files for 45577239749 and 45576756833 read,
returncode 0, earlier conditional root and bounded scans only.
Local command -v lean/lake/elan found none. No new Lean execution,
no queue dispatch, no claim of PASS. No synthetic tests or URT.
Below prepares the actual Bock q-restriction and its fiber consumer;
the strengthened rankCount and downstream SFew/SNum caller remain
human-derived only.

RESUME HERE: compile this Bockstein restriction; implement rankCount
with torsion quotient and TorsStab restricted equivalence, then replace
the actual sUpperOf and SFewOfCut caller. Audit same-host quantifiers
before attempting all-prime aggregation. Alternatively use the
source's existing full torsion budget for a conservative fallback.
HANDOFF TO integration/editor, audit, kernel and Galois.
-/

open NumberField UpperTheory.V.KL UpperTheory.V.ZK.Up

namespace RHPrimary31

def qTors (T : Type) [AddCommGroup T] (q : ℕ) : AddSubgroup T :=
  (nsmulAddMonoidHom q : T →+ T).ker

def restrictQ {Y T : Type} [AddCommGroup Y] [AddCommGroup T]
    (q : ℕ) (β : Y →+ T) (hY : ∀ y : Y, q • y = 0) :
    Y →+ qTors T q where
  toFun y := ⟨β y, by
    change q • β y = 0
    rw [← map_nsmul, hY, map_zero]⟩
  map_zero' := Subtype.ext (map_zero β)
  map_add' x y := Subtype.ext (map_add β x y)

theorem restrictQ_zero {Y T : Type} [AddCommGroup Y] [AddCommGroup T]
    (q : ℕ) (β : Y →+ T) (hY : ∀ y : Y, q • y = 0) (y : Y) :
    restrictQ q β hY y = 0 ↔ β y = 0 := by
  constructor
  · intro h
    exact congrArg Subtype.val h
  · intro h
    exact Subtype.ext h

theorem actual_bock_q (q : ℕ) (hq : 0 < q) (G : Type) [Group G] (k : ℕ) :
    ∃ β : LinearMap.ker (bd (ZMod q) G k) →+
      qTors (AddCommGroup.torsion (grpH G k)) q,
      ∀ y, β y = 0 → ∃ z : Ch ℤ G (k+1), Cyc z ∧ rq q G (k+1) z = y.1 := by
  obtain ⟨β,hβ⟩ := bock q hq G k
  have hY : ∀ y : LinearMap.ker (bd (ZMod q) G k), q • y = 0 := by
    intro y
    rw [← Nat.cast_smul_eq_nsmul (ZMod q), ZMod.natCast_self, zero_smul]
  refine ⟨restrictQ q β hY, ?_⟩
  intro y hy
  exact hβ y ((restrictQ_zero q β hY y).mp hy)

theorem fiber_q {Y T B : Type} [AddCommGroup Y] [AddCommGroup T]
    [AddCommGroup B] [Finite T] (q : ℕ) (β : Y →+ T)
    (hY : ∀ y : Y, q • y = 0) (g : Y →+ B) (c : ℕ)
    (hc : ∀ S : Finset B, (∀ s ∈ S, ∃ y, β y = 0 ∧ s = g y) → S.card ≤ c)
    (S : Finset B) (hS : ∀ s ∈ S, ∃ y, s = g y) :
    S.card ≤ c * Nat.card (qTors T q) := by
  letI : Finite (qTors T q) := Finite.of_injective (fun x => (x : T)) Subtype.val_injective
  refine fibCount Y (qTors T q) B (restrictQ q β hY) g c ?_ S hS
  intro U hU
  apply hc U
  intro u hu
  obtain ⟨y,hy,he⟩ := hU u hu
  exact ⟨y,(restrictQ_zero q β hY y).mp hy,he⟩

theorem originalBock : Bock := by
  first | rh_reduce 2 using [bock] | exact bock

theorem originalFibCount : FibCount := by
  rh_auto_frontier 2
  all_goals first | exact fibCount | rh_auto 2

end RHPrimary31

rh_scan UpperTheory.V.ZK.sUpperOf limit 2000
rh_scan UpperTheory.V.ZK.Up.bock limit 2000
rh_scan RHPrimary31.actual_bock_q limit 2000
rh_prune RHPrimary31.restrictQ_zero as run31_restrict_zero_pruned
#print axioms UpperTheory.V.ZK.sUpperOf
#print axioms UpperTheory.V.ZK.Up.bock
#print axioms UpperTheory.V.ZK.Up.torsStab
#print axioms RHPrimary31.actual_bock_q
#print axioms RHPrimary31.fiber_q
