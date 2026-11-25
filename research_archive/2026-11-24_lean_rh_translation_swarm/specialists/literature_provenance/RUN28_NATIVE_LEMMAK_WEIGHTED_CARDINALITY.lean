import Development.AutomorphicArithmetic.AutomorphicVarieties.ModularityArgument.ThresholdArguments.DenseThresholdCases.KFinal
import Development.AutomorphicArithmetic.AutomorphicVarieties.HeightAndVanishing.CountVs
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN28 — literature provenance / exact weighted cohomology length
2026-11-25. Status: source-matched human derivation; native certificate PREPARED, NOT RUN.

Read latest mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc,
SWARM_PROTOCOL 4b77b161d6876915c15cea5a4d4a519beaf5de74,
HANDOFF_QUEUE bbc46df7d7716a6d8863275b5271801eacfaad0d,
EXPANSION_15_LANES c8152d0751072ed693046ada46f8dbcc93d24aab,
AGENTS 8db0201da965541e0487d6dd1271e010bdaa0972, continuity and
research state, current HUMAN_PROOF_ONE_EQUATION f101edec638db5e7d6b3cfbc7907687fc4e15c6e.
Peer checks: Galois faa0d552, dependency 16a43410, integration 77abd181
(CountVs fixed-degree), 309d46a7 (odd budget), theta ab1e07f7. RUN27
fixed-order weight-one K2 alternative retained, not extrapolated.
This task is on the actual native VWin branch, not a new RH criterion.

SOURCE PIN: leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005.
Relative to src/Development/AutomorphicArithmetic/AutomorphicVarieties/:
ModularityArgument/ThresholdArguments/DenseThresholdCases/
  WindowBoundOfLiteratureLevel.lean 01c499108485b16d33791a9e46fbb1e2af865522
  KFinal.lean 9b26f8a76facea83b64788eaabdf30c492023644
  LemmaKOfLitN.lean d9b4b0270de55f739f2d097ffba669478feffcb9
  HVFinalU.lean 03a1a89bfd216d404766ac95c0a6c6e11e307b0c
ModularityArgument/ClassCounting/
  LemmaKOfLitN.lean 2b1e21f70e69ace53b5219e9e0807b6de0d1920e
  LemmaKOfSteps.lean 6202fdeed68f7ca2c64e2f14ddfd416331bf1c10
  BOdd.lean 4a683e6c236327e51ab03bc84da83f6f1f0602cc
LiteratureResults/KTheoryStability/ReductionBoundsTorsion/TorsionIntegers/
  Bridge.lean 7ff84d3d02c1f4cfb386505d590e2eb4e0c96f8c
GeneratorCountTuples/LemmaK.lean 8726ea4259cd1f0fcb350eca97a3be2478261c87
LayeredIsomorphisms/Klen.lean 8d11cf66702190df2c12069a790cd8c29e43a37f
GaloisLibrary/KummerTheory/LenOfCard.lean cd08d24505cd799a476b11a42049ffc0ddc4a10c
HeightAndVanishing/CountVs.lean 3b29717c74e14806d898cbbf9f96417396a2d37d
All above are source-body inspections, not kernel closure.

Upstream observation 251c7b05dd869ceba1aa42c6001c00b4010f23f9:
KFinal b94f7b3f4b20b168973545f4d0c85367f662fae2
DenseThresholdCases/LemmaKOfLitN 1c1f5e011785e4fbe3c1587cce61c6c117359f5a
ClassCounting/LemmaKOfLitN same path returned HTTP 404 (not evidence of deletion of theorem).
Klen 74e40b787a78379075b38e310bc5fd617f6f16b1
CountVs 5999944ec987848c69619e9f262794ab24970fea
Do not mix revisions.

Integration-ready human block:
Let M=H²(G_{L,S}, Z_l(e+1)) in the native LData formulation,
n=[L:Q], D=|disc L|, K=exp((2en)^CK log(2D)).
Under LemmaK CK, e>=1, and HasMuQ l L, M is finite. The latter
roots-of-unity premise forces L totally complex (primitive order l
for odd l, order 4 for l=2). Each simple Z_l-module is F_l;
multiplying cardinalities along a composition series gives exactly
|M|=l^length(M), including length zero. Thus
    log(l) length(M) = log |M| <= K.
This is stronger than the old klen estimate length(M)<=2K,
and requires no new premise or division by log l. Finiteness retained.

In actual CountVs, e=1, x=l*N>=2, field degree bounded by n0
(chosen independently of host for fixed chi), normalized length
v=Vn <= m1 + [L:Q]nuBound, nuBound<=2N.
Using weighted cardinality directly and log(l)<=l yields
    log(l) v <= K + 2 n0 N log(l) <= x^A + 2 n0 x,
    A=(2*n0)^ceil_nonneg(CK)*(n0+1).
The existing discriminant and kBound_le proof is retained. If this
branch has a witness then n0>=1, hence A>=1; for any x>=2,
1+2n0<=2^(n0+1) by induction, so x^A+2n0*x<=x^(A+n0+1).
The original CountVs exponent A+n0+3 is therefore conservative
by two powers in this local branch. For n0=0 no witness is possible
since a number field has positive degree. No global exponent claim:
CountVs only applies under its native CaseV/shallow hypotheses.
The exact weighted form is preferable to the final exponent in
aggregate bounds. Does not establish missing prime cancellation.

Original dependency path (source-level, not a kernel DAG):
vwin_of_hypotheses_H_E_alt -> lemmaK_litN_alt -> lemmaK_of_litN_alt
  -> lemmaK (bOdd, pt_s hN, hN.coh.lfK, hN.coh.ltK)
  -> lemmaK_of_steps -> 21 explicit class-counting premises + BOdd
  -> SNum -> ShaK -> SFinal -> LemmaK.
bOdd -> bOdd_zk -> bStarOdd. Bridge transports ranks by HEq.
VWin downstream also uses CountVs / klen -> LemmaK + lenOfCard.
Reduced candidate: local LemmaK supplier needs only normalized
Poitou-Tate / local finiteness / local Tate duality (or supplied
unnormalized Poitou-Tate), plus the existing 21 internal suppliers
and bOdd, not the full LiteratureRankNHypothesis bundle.
No claims of removing the bundle at other consumers.
Replace klen at this consumer by weighted cardinality and aggregate
after exact log cancellation. Keep original graphs, prior unresolved
nodes and axiom evidence unchanged. Cache key must include source
pin, l, L, Omega, D (LData), e, CK, and consumer/weight convention.
Do not reuse an unweighted bound as a weighted one. Backtrack to
native klen / CountVs if certificate elaboration or caller matching fails.

External-assumption ledger:
* LemmaK, BOdd, SFinal, ShaK, CountVs are Prop definitions.
  lemmaK_litN_alt, lemmaK_of_litN_alt are conditional wrappers
  with bodies; lemmaK composes 21 explicit source suppliers.
  lemmaK_of_steps is an implication composition, NOT an axiom or
  independent proof of those 21 propositions. BOdd wrapper bOdd
  and bOdd_zk have bodies, bStarOdd not independently audited here.
* hN.coh.pt, lfK, ltK are projected assumptions in this lemma;
  pt_s is a conversion theorem, not evidence that hN is inhabited.
  Published.PoitouTateDuality is used as a hypothesis, irrespective
  of its name. No imported leaf claimed axiom-free.
* Kum.lenOfCard is a proved composition-series argument at source
  level; no new literature assumption needed for weighted bridge.
* Published K-theory size estimates with bounded degree or omitted
  small primes (including RUN27) cannot simply substitute for
  unrestricted LemmaK. No RH/GRH, Vandiver, or URT assumption added.
  O'Desky catalogue h2-bound.html and tamnd.com/proof/vwin/
  served as navigation only, not proof evidence.

Execution evidence: retrieved pinned bodies with GitHub blob hashes,
compared five current-head paths; independently retrieved actual CI
status.json for 45577239749 (returncode 0, 98.87s; reduced half-strip
root axioms propext, Classical.choice, Quot.sound) and 45576756833
(returncode 0, 77.94s; bounded rh_of_right scan 2000 visited,
324 pending, three classical axioms). These certify only earlier
engine/conditional-root work. Neither Lean nor Lake available in
this local environment; no native execution of the below, no PASS
for this run, no synthetic cohomology or prime tests.
Original and reduced graphs above are source-call descriptions.
The root link is conditional on the earlier peer reachability audit,
not independently replayed. No claim full RH or URT improvement.

RESUME HERE: native compile and audit this exact bridge, integrate
weighted inequality into CountVs without changing quantifiers;
then audit bStarOdd and SNum/SFinal supplier premises rather than
assuming a K-theory citation closes LemmaK. Track each of the 21
class-counting inputs until independently justified.
HANDOFF TO: integration, Galois, dependency, kernel, audit.
-/

open NumberField Formalism.GaloisCohomology UpperTheory.Top UpperTheory.V UpperTheory.V.LDataCardLeFinrank UpperTheory.V.Win

namespace RHLiteratureRun28

private theorem tc_of_mu (l : ℕ) [Fact l.Prime] (L : Type) [Field L] [NumberField L]
    (h : HasMuQ l L) : IsTotallyComplex L := by
  obtain ⟨ζ, hζ⟩ := h
  set n := if l = 2 then 4 else l with hn
  have hn2 : 2 < n := by
    have := (Fact.out : l.Prime).two_le
    rw [hn]; split_ifs with h2
    · norm_num
    · omega
  have : NeZero n := ⟨by omega⟩
  have : IsCyclotomicExtension {n} ℚ (IntermediateField.adjoin ℚ {ζ}) :=
    hζ.intermediateField_adjoin_isCyclotomicExtension ℚ
  have : IsTotallyComplex (IntermediateField.adjoin ℚ {ζ}) :=
    IsCyclotomicExtension.Rat.isTotallyComplex (IntermediateField.adjoin ℚ {ζ}) hn2
  exact isTotallyComplex_of_algebra (IntermediateField.adjoin ℚ {ζ}) L

theorem weighted_klen :
    ∀ CK : ℝ, LemmaK CK → ∀ (l : ℕ) [Fact l.Prime] (L Ω : Type) [Field L]
      [NumberField L] [Field Ω] [Algebra L Ω] [IsAlgClosure L Ω]
      (D : LData L Ω l), HasMuQ l L → ∀ e : ℕ, 1 ≤ e →
      VLen D e ≠ ⊤ ∧ ((VLen D e).toNat : ℝ) * Real.log l ≤
        kBound CK e (Module.finrank ℚ L) (discr L).natAbs := by
  intro CK hK l _ L Ω _ _ _ _ _ D hmu e he
  obtain ⟨hfin, hlog⟩ := hK l L Ω D (tc_of_mu l L hmu) hmu e he
  obtain ⟨k, hlen, hcard⟩ := Kum.lenOfCard l (ReciprocityTheory.Gal.H2 (zlTw D ((e : ℤ) + 1)))
  have hV : VLen D e = (k : ℕ∞) := hlen
  refine ⟨by rw [hV]; exact ENat.coe_ne_top k, ?_⟩
  rw [hV, ENat.toNat_coe]
  rw [hcard] at hlog
  push_cast at hlog
  rw [Real.log_pow] at hlog
  simpa [mul_comm] using hlog

theorem three_input_supplier (hP : GlobalTheory.Published.PoitouTateDuality)
    (hF : LocalFinitenessK) (hT : LocalTateDualityK) : ∃ CK, LemmaK CK :=
  UpperTheory.V.ZK.lemmaK UpperTheory.V.ZK.bOdd hP hF hT

theorem weighted_count_bridge (v m n u y K : ℝ)
    (hy : 0 ≤ y) (hv : v ≤ m + n*u) (hm : m*y ≤ K) :
    v*y ≤ K+n*u*y := by
  calc
    v*y ≤ (m+n*u)*y := mul_le_mul_of_nonneg_right hv hy
    _ = m*y+n*u*y := by ring
    _ ≤ K+n*u*y := add_le_add_right hm _

theorem original_klen_bridge (m y K : ℝ) (hm : 0 ≤ m)
    (hy : 1/2 ≤ y) (h : m*y ≤ K) : m ≤ 2*K := by
  nlinarith [mul_le_mul_of_nonneg_left hy hm]

end RHLiteratureRun28

#print axioms UpperTheory.V.ZK.lemmaK_litN_alt
#print axioms UpperTheory.V.ZK.lemmaK_of_steps
#print axioms RHLiteratureRun28.three_input_supplier
#print axioms RHLiteratureRun28.weighted_klen
#print axioms RHLiteratureRun28.weighted_count_bridge

-- Run the shared native engine's scan/prune on original and candidate.
-- Exact tactic invocation syntax to be matched against pinned engine before CI.
