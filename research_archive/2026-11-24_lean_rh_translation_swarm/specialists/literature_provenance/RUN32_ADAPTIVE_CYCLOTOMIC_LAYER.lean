import Development.EtaleCohomology.CyclotomicDiscriminants.FinSLayer
import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ClassCounting.NumThree
import Development.AutomorphicArithmetic.AutomorphicVarieties.GeneratorCountTuples.PrimeLe
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN32 — adaptive cyclotomic layer; exact obstruction to merging positive-depth layers.
Status: human source-matched reduction, Lean candidate NOT compiled.
Integration block (use only within actual LemmaK/CountVs consumer).

Let L contain the native HasMuQ(l), n=[L:Q], c0=cZero(l,L), E>=1.
The pinned SLayerCut.goal_of chooses m=clog_l(4E+4) and the
cyclotomic layer L_m of relative degree l^m. This is unnecessarily
large whenever the original field already supplies some of the two
size conditions. Define
    A = max(ceil((2E+2)/l^c0), ceil((4E+4)/n)),
    m_* = min { m>=0 : l^m >= A }.
Equivalently require just
    l^(c0+m) >= 2E+2,     n*l^m >= 4E+4.
These are the exact two sufficient numerical inputs to the native
goal_of proof. Both hold at the original depth (n>=1), so m_* is
no larger. All TopRoot, total-complexity, discriminant and Sha
comparisons are unchanged: use the actual layerUniq, muQ,
rootdeg, disc_cyc and sha_le. In particular sha_le is NOT
restriction injectivity: its proof uses quotient by the image of
g^(l^m)-1, contained in the image of g-1 by the geometric sum.
For degree d=l^m and c'=cZero(l,L_m), the remaining native
inequalities are exactly
    d <= (n+1)(4E+4), l^c' <= 2nd,
    D(L_m) <= D(L)^d (l^c')^(nd).
The first follows from m_*<=clog and primeLe, the second and
third are the existing native root-degree and discriminant proof.
No new conjectural premise. No change to the original SLayer
existential. The proposed theorem below accepts any such m, then
returns that same package, also recording the exact degree d=l^m.

For every odd l>=4E+5, n>=l-1 by primeLe and c0>=1 by muQ.
Both conditions already hold at m=0. Thus the same field suffices
and the num_down extension-loss step in NumThree can be skipped
in this context. More generally m=0 whenever the two displayed
conditions hold. At E=1 (the manuscript's actual shallow CountVs
weight), l=7 and n>=8 gives m=0, instead of native m=2; for n=6
the sufficient m is 1. At l=3, n>=4 with c0>=1 gives m<=1 instead
of m=2; if n>=8 and c0>=2 it gives m=0. These are implications
with explicit n,c0 hypotheses, NOT claims that every CountVs
field has those values. The actual input fields and local transfers
still have to be retained. The resulting exponent for s log l
on an already adequate field is the native num_three exponent
max(C0,9)+2 directly, rather than 5*(max(C0,9)+2)+11.
This is a local bound of the form kBound, not a uniform closure
of CountI/II/V/Vs. Do not globalize the exponent.

Common-field audit for RUN31: for a FIXED base L and distinct
primes l,p, if the selected cyclotomic layers are isomorphic as
L-extensions, equality of degrees gives l^m=p^a, hence m=a=0
by unique prime factorization. Therefore the native positive-depth
layers cannot be identified across primes. This is stronger than
the observation that SLayer is existential separately in l.
For several primes all satisfying the zero-depth conditions on
the SAME L and same E, use L itself and the exact RUN31 primary
torsion sum on that subset. For nonzero depths do not merge them;
group only by authenticated equal (L',E,N). Taking their compositum
is not a free replacement: its degree contains the product of
the mutually coprime relative degrees (indeed equals it for
finite Galois layers); a new size/transfer argument would be needed.
Different starting fields (e.g. the distinct vsField choices)
remain a separate obstruction. The primary torsion cancellation
is still contingent on RUN31's caller replay, not assumed here.

Source/assumption ledger (pin 40e56bab026552e089d7afcfeff08d2defb9c005):
src/Development/EtaleCohomology/CyclotomicDiscriminants/
  SLayerCut.lean e96c8477eda108f2a8ace8408738167d1090cd84:
    goal_of, sha_le, disc_cyc (theorem bodies, not external axioms)
  FinSLayer.lean 8175eaa395292dd9d9743bafd9be02ecaf6c374e:
    intersectionNumber_baseChange -> layer_statement_holds -> goal_of
src/Development/AutomorphicArithmetic/AutomorphicVarieties/
  ModularityArgument/ClassCounting/LemmaKOfSteps.lean
    6202fdeed68f7ca2c64e2f14ddfd416331bf1c10: SLayer proposition,
    ShaK, SNum, lemmaK_of_steps (actual wrapper consumer)
  ModularityArgument/ClassCounting/LemmaKOfLitN.lean
    2b1e21f70e69ace53b5219e9e0807b6de0d1920e: lemmaK supplies FinSLayer
  ModularityArgument/ClassCounting/NumThree.lean
    900c8e3fca10cdf9256061213dcc9453bf98f3d2: sNum, num_three, num_down
  GeneratorCountTuples/PrimeLe.lean
    96d3449535b80f2228cd18425386d8ef5a6bfb67: primeLe proof via cyclotomic minpoly
  ModularityArgument/ClassCounting/SFinal.lean
    a960a48653fa69c34f72f5f8ed434135ff1163a6: sFinal, unchanged
  ModularityArgument/ClassCounting/ExponentLe.lean
    2b3e4233ad68b7007573c70feaf4703d85452b47: sTors, unchanged
All previous BOdd, local/global duality, finite-rank, theta, Count
and cohomology inputs remain. No literature result has been asserted
from a name. The transitive axiom status of layerUniq, exists_descends,
muQ, rootdeg and their dependencies is not independently authenticated.
Their existing proof evidence must remain. No invocation of Main/RH.

Original local graph: lemmaK -> lemmaK_of_steps -> sNum -> SLayer;
FinSLayer.intersectionNumber_baseChange -> layer_statement_holds
-> goal_of -> layerUniq, muQ, rootdeg, disc_cyc, sha_le.
Reduced: goal_of -> adaptiveLayer -> same suppliers; the zero-depth
specialization retains L and avoids an extension estimate in sNum
only when its two size inequalities are proved. All other edges
and pending nodes retained. Context cache key includes original L,
l,E,cZero, actual layer, m and both size proofs; not merely SLayer.
Backtrack to original goal_of if any replay fails. The global
root graph is not replaced by this source-visible local overlay.

Execution: mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
and latest manuscript 464e82f81f646d4af85e1f5f70d379026df46261 read.
SWARM/HANDOFF/EXPANSION, AGENTS, state and continuity consulted.
Peer RUN32 Galois 46c378ee, mathematics 1b03d6e3, character boxes
6ea6da30, theta 3c6f175e handoffs/commit summaries read; no duplicate
adaptive-layer proposal found in those. Eight source blobs retrieved
above. Upstream latest listed d91ae2678eea19a0c3045ffca37f1da757c2e719;
old SLayerCut and FinSLayer paths at that revision return 404,
not evidence of mathematical removal; pinned bodies govern this work.
Published prior CI status files for 45577239749 and 45576756833 read:
returncode 0; conditional half-strip and prior engine only. Local
command -v lean/lake/elan returned none. No new CI execution or
native PASS; below is a candidate for replay using the existing engine.
No artificial tests, URT, or claim of RH closure.

RESUME HERE: compile adaptiveLayer and verify its bridge to SLayer,
then specialize the actual CountVs L choice and test the two inequalities.
Propagate the no-extension case to sNum (private num_three proof
must be reproduced or exposed through a checked replacement).
Do not globally delete SLayer or aggregate distinct fields.
HANDOFF TO integration/editor, Galois, formal audit, kernel.
-/

noncomputable section

open NumberField NumberField.InfinitePlace Polynomial UpperTheory.V
  UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Tower

namespace RHAdaptive32

theorem adaptiveLayer (L : Type) [Field L] [NumberField L]
    (l E m : ℕ) [Fact l.Prime] (hμ : HasMuQ l L) (hE : 1 ≤ E)
    (hRoot : 2 * E + 1 < l ^ (cZero l L + m))
    (hRank : 4 * E + 4 ≤ l ^ m * Module.finrank ℚ L)
    (hSmall : l ^ m ≤ (Module.finrank ℚ L + 1) * (4 * E + 4)) :
    ∃ (L' : Type) (_ : Field L') (_ : NumberField L') (c d : ℕ),
      IsTotallyComplex L' ∧ UpperTheory.V.ZK.TopRoot l c L' ∧
      2 * E + 1 < l ^ c ∧ 2 * E + 1 < nrComplexPlaces L' ∧
      Module.finrank ℚ L' = d * Module.finrank ℚ L ∧
      d ≤ (Module.finrank ℚ L + 1) * (4 * E + 4) ∧
      l ^ c ≤ 2 * Module.finrank ℚ L' ∧
      (discr L').natAbs ≤ (discr L).natAbs ^ d * (l ^ c) ^ Module.finrank ℚ L' ∧
      shaInv L l E ≤ shaInv L' l E ∧ d = l ^ m := by
  have hp : l.Prime := Fact.out
  let Ω := AlgebraicClosure L
  have hLay := (layerUniq L Ω l hμ).1 m
  have hcyc := (Kum.fnCyc L Ω l (cZero l L + m)).1
  let L' : Type := layF l L Ω m
  have hμ' : HasMuQ l L' := by
    obtain ⟨ζ, hζ⟩ := hμ
    exact ⟨_, hζ.map_of_injective (algebraMap L L').injective⟩
  obtain ⟨q1, -, q3, q4, -⟩ := muQ L' (AlgebraicClosure L') l
  have htc : IsTotallyComplex L' := (q4 hμ').1
  have hq := q3.1 hμ'
  have hle : cZero l L + m ≤ cZero l L' :=
    (q1 _).1 (hcyc.exists_isPrimitiveRoot (Set.mem_singleton _) (pow_ne_zero _ hp.ne_zero))
  have hdeg : Module.finrank L L' = l ^ m := hLay.2
  have hfin : Module.finrank ℚ L' = l ^ m * Module.finrank ℚ L := by
    rw [← Module.finrank_mul_finrank ℚ L L', hdeg, mul_comm]
  have hpw : l ^ (cZero l L + m) ≤ l ^ cZero l L' :=
    Nat.pow_le_pow_right hp.pos hle
  refine ⟨L', inferInstance, inferInstance, cZero l L', l ^ m, htc,
    ⟨?_, fun h2 => ?_, (q1 _).2 le_rfl, fun h => ?_⟩,
    hRoot.trans_le hpw, ?_, hfin, hSmall,
    Win.rootdeg L' l _ hp ((q1 _).2 le_rfl), ?_,
    LateralTheory.Q.SLayerCut.sha_le L L' l E m hμ hE hLay, rfl⟩
  · unfold Base.qExp at hq
    split_ifs at hq <;> omega
  · unfold Base.qExp at hq
    rwa [if_pos h2] at hq
  · have := (q1 _).1 h
    omega
  · have h1 := IsTotallyComplex.finrank L'
    omega
  · have h1 := LateralTheory.Q.SLayerCut.disc_cyc L L'
      (l ^ (cZero l L + m)) (pow_ne_zero _ hp.ne_zero) (hc := hcyc)
    rw [hdeg] at h1
    exact h1.trans (Nat.mul_le_mul_left _ (Nat.pow_le_pow_left hpw _))

theorem originalLayer : UpperTheory.V.ZK.SLayer := by
  first | rh_reduce 2 using [LateralTheory.Q.SLayerCut.goal_of] |
    exact LateralTheory.Q.SLayerCut.goal_of

end RHAdaptive32

rh_scan LateralTheory.Q.SLayerCut.goal_of limit 2000
rh_scan LateralTheory.Q.SLayerCut.sha_le limit 2000
rh_scan RHAdaptive32.adaptiveLayer limit 2000
rh_prune RHAdaptive32.adaptiveLayer as run32_adaptive_pruned
#print axioms LateralTheory.Fin.SLayer.intersectionNumber_baseChange
#print axioms LateralTheory.Q.SLayerCut.goal_of
#print axioms LateralTheory.Q.SLayerCut.sha_le
#print axioms RHAdaptive32.adaptiveLayer
#print axioms RHAdaptive32.originalLayer
