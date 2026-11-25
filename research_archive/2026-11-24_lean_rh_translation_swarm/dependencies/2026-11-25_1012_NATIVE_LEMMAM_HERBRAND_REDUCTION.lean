import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.MainCotSpan
import Development.AutomorphicArithmetic.AutomorphicVarieties.CommutativeAlgebra.GradedModulesLength.Mprime
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN28 — recover both native LemmaM proofs; explain the valuation bridge
25 Nov 2026. Lane 12. SOURCE-MATCHED human reconstruction; native scan/prune
certificate PREPARED, NOT compiled. RH OPEN. This is a proof block for the
one living human-readable reconstruction, not a new RH criterion.

Preflight: latest ONE_EQUATION_MISSION.md blob
4aa9d905f9bae506e13a64e7354a82e46afe2b0d (includes user clarification to
reconstruct pinned proof, not independent RH detours, and mandatory engine);
SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, continuity, research state/log/protocol
excerpts and latest orchestrator summary (45588394626, not RH validation).
Prior lane checkpoint 048163e3aa40f2a1a4171e0d3c9d7b98482107fa.
Reviewed latest integration b7bfd9b2, editor 823d1b3d, literature 2b8a92ce
(fixed-order weight-one alternative only; does not remove whole CountI).
Observed working branch head b7bfd9b2be7ffe230b6a4a3cf109fd454bb92141.
Original graph, unresolved obligations and earlier axiom records retained.

## Actual source recovered, not inferred from filenames
Upstream pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Directory index: exact subtree fc6c945e022b2c46bb86ec55ca509be25ac8e619,
not truncated; path relative to
src/Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/
GradedModulesLength/. Both previous missing suppliers located:
* MainCotSpan.lean 52e45205d53b2e339e7467f91fab3fb015b438da:
  UpperTheory.V.Alg.M.main_holds : LemmaM.
* Mprime.lean 7a0d0423cebb2d4a5b3193d7e58515195ac54421:
  UpperTheory.V.Alg.M.mprime_holds : LemmaM'.
The latter native proof agrees with RUN27: der_satSq, injection on the
saturated cotangent quotient, length_hom_residue_le, length_hom_le, and
finite residue field cardinality comparison. Its native injection does not
even require additivity of the map between the two finite sets for the final
length comparison. Do not delete the original linear/graded prerequisites.

## Human proof block for LemmaM, exact mechanism
Keep the full original statement in OrbitVanishingLocal.lean
5aacd23b05f73bd138d4e9adb04268c61988ae15: complete characteristic-zero DVR O,
algebraically closed K and normalized valuation v, graded augmented O-algebra
A with IsWRing, all M1–M5, Q of the indicated sizes, and weight-zero a.
Let L be the saturated weight -1 cotangent lattice, U the image of F,
and l=length_O(L/U). Let T be any finite two-signed orbit cover.

1. The rank lemma rk_holds makes L finite of rank r. Saturation makes it
torsion-free, so L is free over O. The r+1 equations F span L over the
fraction field (SpansCot). Smith normal form (SmHolds.lean
42702dd85bd19736efb7d6341d2d181d766cb30f) changes the equations by a
span-preserving basis change to F', with F'_i=pi^(c_i)y_i modulo satSq
for i<r, and F'_r in satSq. Thus l=sum c_i is finite. The ideal of
equations is unchanged. cut_holds eliminates the weight-zero coordinates
while keeping chart injectivity; nz_holds replaces a by a' differing by
an element of Q.ideal, with phi(a') nonzero. Consequently xi(a')=xi(a)
on every native solution xi. This is exact cancellation, not an error bound.
The orbit cover exists by fin_holds with hom_holds, M2 and M4. Those suppliers
remain substantive dependencies; no independent reconstruction of them here.

2. AlgMemCoef.lean 9e04a261be7daddc895cbff009d6264a953fa8af,
core_holds: form the native 3-graded Rees algebra R=mR(Q'), coefficient
ideal J from ker(phi), list ts of homogeneous equations (including squared
weight +/-1 equations), and a' as degree-zero scalar. Define
X_d=chi(ts, ((R/J)/a'), d),
Y_d=chi([(0,a')], R/(J+secs(ts)), d).
Here chi is the native Euler characteristic of the specified graded
quotient operations; d is a large multi-degree, not the RH window parameter.
For sufficiently large d the actual three inequalities are
  2^(r+r') l <= X_d <= Y_d <= 2^(r+1+r') sum_{xi in T} v(xi(a')).
The same d is chosen from the intersection of the three eventual filters.
No uniform-in-host degree threshold is needed for this integral statement.
The middle inequality is the private chain: a' is a non-zero-divisor on
R/J (coefficientwise, since phi(a')!=0 in a domain); ruleNzd identifies
the first quotient Euler characteristic, Euler independence of order
moves a' past ts, ruleUB and qi_holds bound the resulting Euler number
by Y_d. Admissibility of the joint list is essential and obtained from
admissibility_holds using the native premises. This is not an unproved
replacement of an equality by an inequality.

3. Lower bound source: AdmissibleMonoIdeal.lean
80e31b9fb109fd0b2456e96d2ed5b2e370d40461, low_holds. It chooses a homogeneous
ideal q using lk_holds, preserving leading terms and regularity of pi,
and uses exact congruences for the squared equations
  F_i'^2 = pi^(2c_i) y_i^2 (in the appropriate Rees quotient).
Admissibility + quotient monotonicity and the native Hilbert coefficient
calculation give sum(2c_i)*2^(r-1+r') as the lower bound. Since r>=1,
this equals l*2^(r+r'). The lower bound is thus integral, not deduced
from the generic solution set. lk_holds, la_holds, hf_holds, num_holds
and monotonicity are the next human proof obligations.

4. Upper bound source: TwoSigned.lean
c2460a5a728ec42562e60d678237aa4f8051ec53, up_holds.
At a large degree d, M=(mQ Q' (J+secs ts)).gr d is finite over B=A_0
and B/ann(M) finite over O by eventually_mQ_gr_finite_annihilator.
Its generic support lies in S=image(T,res0), the DISTINCT restrictions
of two-signed points to B. By M4 and locLen_quotientWeightPiece_le_one,
the unsquared graded pieces have local lengths <=1 on that support.
Squaring r+1+r' equations gives the upper multiplicity
C=2^(r+1+r') by locLen_aPiece_ideal2_le_two_pow, transferred to M.
M2/M5 and valuation_nonneg_apply_degreeZero_of_onS ensure each
sigma(a') is nonzero with nonnegative v. These exact hypotheses are
essential. In particular no independent multiplicity-one claim for
the squared scheme is made.

## The Herbrand identity: why generic valuations can control this Euler number
HerbrandFinLen.lean aa40d31af98fd039f3c33a5c8de7fc064100c82f,
th_holds, contains an EXACT equality in its local key, before applying C.
Write invLen=length_B ker(a':M->M), coinvLen=length_B coker(a':M->M),
and m_sigma=locLen(sigma,M) (length after localization at ker sigma).
For the exact hypotheses above:
  theta(a',M)=coinvLen-invLen=sum_{sigma in S} m_sigma v(sigma(a')).
All terms on the left are finite. Human derivation:
* Since B is a complete noetherian local O-algebra with the same residue
  field (IsCO), finite length over B equals finite length over O for
  the modules at issue. Use a finite prime filtration of the finite
  B-module M; each factor is B/P and is finite over O, since ann(M)
  annihilates it. For any short exact sequence the snake lemma makes
  coker length MINUS kernel length additive, as are localized lengths.
* A vertical prime (P meets O nontrivially) gives a finite-length factor:
  multiplication has equal kernel and cokernel lengths. No O-algebra
  map to K can have kernel containing this P. Both contributions are zero.
  Thus vertical torsion cancels EXACTLY in the Euler difference, rather
  than being thrown away or bounded by a generic determinant.
* For a horizontal prime, D=B/P is a finite torsion-free domain over O,
  therefore finite free. The fraction field of D is a finite separable
  extension of Frac(O) (char zero). Every embedding sigma:D->K
  corresponds to a point of S, with localized length one in this prime
  factor. Since sigma(a')!=0, multiplication by a' on D is injective.
  Smith normal form gives
    length_O(D/a'D)=v(det(multiplication by a'))=sum_sigma v(sigma(a')).
  The determinant equals the field norm, which factors over all embeddings.
  This is exactly LengthQuotientSpanEqFinsumValuation.lean
  59fde834c95822a756f52a6cc1533bd87530d4d0. Add all filtration factors.
  Finiteness of the kernel/cokernel for M follows inductively from
  the snake sequence and the corresponding finiteness for its factors.
  No unsigned estimate is taken before this cancellation.
* Since the native degree-zero chi equals theta, the exact weighted
  budget suffices for the upper estimate. Using 0<=m_sigma<=C and
  v>=0 yields Y_d<=C sum_{sigma in S} v(sigma(a')).
  The map T->S is surjective, and a' has weight zero, so repeating an
  orbit restriction can only increase the sum. The native up_holds
  proves this via sum_image_le_of_nonneg. Hence the slightly sharper
  local statement l<=2 sum_{sigma in S} v(sigma(a')) already follows
  from the native proof, and implies its T-indexed statement. S retains
  every distinct restriction, not just every distinct numerical value.

Cancel the common positive factor 2^(r+r') in step 2, and replace
xi(a') by xi(a), to obtain the actual LemmaM upper bound:
  length_O(L/U) <= 2 sum_{xi in T} v(xi(a)).
This explains the factor 2 and why the weak-premise counterexample in
RUN27 does not defeat the native statement. It is a source-matched
reconstruction of the determinant/Euler interface and final assembly,
NOT an independent derivation of the lower/upper Hilbert suppliers.
The weighted localized-length equation is a local proof intermediate,
not another conjecture or the global RH equation.

## Ledger and verification
Original source-role route: CountI -> corGK -> oneChar_unramU -> model_upper
and vlen_le/model_lower, with LemmaM and LemmaM' supplied through LinkedUnlE.
New exact local source edges main_holds -> rk_holds, sm_holds, cut_holds,
nz_holds, fin_holds, core_holds; core_holds -> admissibility_holds,
low_holds, chain, up_holds; up_holds -> th_holds, support and local
multiplicity suppliers. These are source body references, not newly
authenticated kernel edges. Reduced mathematical view keeps those leaves
and replaces only the explanatory assembly by the above signed Euler
budget. No global graph deletion or missing axiom evidence inferred.

43 literal source/blob assertions executed across 7 pinned files
(MainCotSpan, Mprime, AlgMemCoef, AdmissibleMonoIdeal, TwoSigned,
HerbrandFinLen, LengthQuotientSpanEqFinsumValuation): exact hashes plus
declaration and key proof-call strings checked. No new synthetic tests.
Native Lean/Lake absent locally; direct git network resolution failed.
Re-read published prior native status.json: strip-root 45577239749
pass 98.87s, pruning 45576756833 pass 77.94s. Prior conditional root
axioms propext, Classical.choice, Quot.sound; prior scan pending 324.
Those verdicts do not certify this file. Current actual native batch
below is PREPARED only. No new native CI verdict or O(N)/URT result.

RESUME HERE: follow low_holds -> lk_holds and hf_holds/num_holds, derive
the precise leading-coefficient/Hilbert finite-difference identity from
their bodies, especially the non-zero-divisor and regular integral model.
Audit up_holds support and multiplicity-one before attempting any further
premise removal. Kernel lane: compile this in pinned environment, capture
all scan/prune outputs, axiom lists, conditional bridge checks; if a prune
finds no unused binder preserve the original. Cache per source pin, exact
declaration and instantiated model/chart/ideal and caller context. Do not
import Main or use claimed RH. No closure of CountI, the native G-window,
or RH is asserted.
HANDOFF TO kernel, Galois, literature, integration, human editor, audit.
-/

-- Scalar bridge on the actual final core_holds inequality.
theorem RHNativeCotangentCancel (n : Nat) (l v : Real)
    (h : l * 2 ^ n <= 2 ^ (n + 1) * v) : l <= 2 * v := by
  have hp : (0 : Real) < 2 ^ n := by positivity
  apply le_of_mul_le_mul_right ?_ hp
  calc
    l * 2 ^ n <= 2 ^ (n + 1) * v := h
    _ = (2 * v) * 2 ^ n := by rw [pow_succ]; ring

#print axioms RHNativeCotangentCancel
#print axioms UpperTheory.V.Alg.M.main_holds
#print axioms UpperTheory.V.Alg.M.mprime_holds
#print axioms UpperTheory.V.Alg.M.core_holds
#print axioms UpperTheory.V.Alg.M.th_holds
rh_scan UpperTheory.V.Alg.M.main_holds limit 2000
rh_scan UpperTheory.V.Alg.M.mprime_holds limit 2000
rh_scan UpperTheory.V.Alg.M.core_holds limit 2000
rh_scan UpperTheory.V.Alg.M.th_holds limit 2000
rh_prune UpperTheory.V.Alg.M.main_holds as RHNativeLemmaMReduced
rh_prune UpperTheory.V.Alg.M.mprime_holds as RHNativeLemmaMprimeReduced
rh_prune UpperTheory.V.Alg.M.core_holds as RHNativeCoreReduced
rh_prune UpperTheory.V.Alg.M.th_holds as RHNativeHerbrandReduced
