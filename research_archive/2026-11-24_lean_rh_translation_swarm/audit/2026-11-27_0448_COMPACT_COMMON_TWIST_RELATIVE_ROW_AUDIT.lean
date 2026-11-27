import New.Selmer.FitTwistsExist

/-!
# Audit — exact common-twist scalar transport and relative row comparison
27 Nov 2026. Source-matched human derivation, PARTIAL, not a kernel replay.
Credit Alpöge, Sernau, Claude and collaborators. Compact source pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, binding completion-first.
Read mission, SWARM_PROTOCOL, AGENTS, RESEARCH_STATE, handoff and latest
peer results (1cb168a8, c1a9b107, 01809db9, 784d021e, f355e707, 9474467c,
59c0332f, 14196cf5, a5c02498, 0b2ac210, d14639a0, 9fbb841b).
Manuscript 963e42122931b8e534c39765bb2a7422b2c557d7 identifies the common
fit-family relative row comparison as open. Backtracked from period
basis: audit RUN60 and RUN61 already cover that route. Do not duplicate.
Previous odd-Sha triangle audit a17effa4 retained.

Actual source anchors:
 New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d:14–59
 New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754:103–111
 New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c:34–38
 New/Selmer/DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df:
 ZfAt, crysRels, blockLoss, obeying_crysRels
 New/Selmer/RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18:
 obeyingCocycles.mem_selmerModule, sum_blockLoss_le, ribet_columns:143–191
 New/Selmer/BlocksAndCocycles.lean 2bc5a11b2127e4b46eb4f57bfc1bd12f64c1ef55
 New/Selmer/Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c:
 IsNewPlaces.mem_selmerModule_of_tame_eq_zero
 Lib/ClassField/Places/SelmerDefs.lean ce10f7c03f6155db4ccd49bc228eb03bc23e2347
 New/Selmer/DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534:47–75
 New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14:24–65.

## 1. Exact relation transport over the SAME enlarged coefficient ring

Let O be the common ring picked in TwistForRows:22–23 BEFORE twisting.
Let O' be any sufficiently large ring from the eventual conclusion of
exists_anticyclotomic_twist for a permitted d. Write e:O→O' for inclusion,
u_i for the fixed integral row, and T_i=psi' times e(u_i). At the chosen
local decomposition group G_v above ell, the actual auxiliary condition
gives psi'|G_v=1 (not merely triviality on inertia). Thus T_i|G_v=e(u_i)|G_v.

For a finitely supported matrix relation f on G_v annihilating Z_f(u_i),
and an arbitrary integral crystalline cocycle z' for T_i at G_v, consider
any O-linear functional lambda:O'→O. Applying lambda coordinatewise is
an equivariant Z_ell-linear map on the underlying integral lattices,
because the action matrices lie in e(O). It therefore carries z' to
Z_f(u_i): a crystalline period primitive maps to a crystalline period
primitive by tensoring this map with the period ring. This is exactly the
native crysCocycles.map at TwistForRows:56. In particular
  lambda^n(sum_g e(f(g)) z'(g)) = sum_g f(g) lambda^n(z'(g)) = 0.
The sums are finite, and the equality holds for EVERY lambda. Since O'
is finite torsion-free over the DVR O (both coefficient rings inside the
same algebraic closure), it is finite free; the dual of a basis separates
all coordinates. Hence
  sum_g e(f(g)) z'(g) = 0
in O'^n, as required. Thus mapRel(e)(crysRels u_i) is a SUBSET of
crysRels T_i. The support pushforward is along the SAME canonical
decomposition group in both definitions; no arbitrary closure place.
No assertion that mod-ell^M torsion cocycles lift crystallinely, no
need to identify all enlarged relations, and no division by ramification
degree. This proves precisely the direction of inclusion at lines 49–59.

Negative control: over Z, dual functionals into Z do not separate the
nonzero module Z/2. Freeness cannot be replaced by arbitrary finite
generation. Triviality only on inertia is also insufficient: a nontrivial
unramified scalar character changes the Frobenius matrix, so the
coordinate projections need not intertwine its action. These are
mathematical counterexamples to premise deletion, not native defects.

## 2. Common twist and exact Selmer-length comparison

Let S=placesDividing(E,ell) union placesAboveG(D), fixed BEFORE d, and
Q the common auxiliary set from TwistTheorem. Its unionWithConj is
exactly S union conjClosure Q. For each i, the native theorem supplies
a bound for the locally constant cocycles for T_i with this support,
obeying mapRel(e)(crysRels u_i union {delta_gamma I}).
Every element of the desired Selmer module with the new crystalline
relations and value zero at gamma_i belongs to that bounded module:
the cocycle, local constancy and support conditions are identical;
section 1 supplies all transported local relations, and evaluation
zero supplies the mapped singleton. Consequently length decreases
under inclusion, then O'.normLength preserves the inequality.
The scalar witness y_i in O maps to e(y_i), a unit-minus-one witness,
because gamma_i is inertial in S away from Q and psi' there equals 1.
Its cyclotomic value is one by the native inertia lemma at the same
place. The SAME transported lattice e(u_i) is a lattice in R_i.
These are all fields of SelmerLengthLe in AptTupleDefs. No choosing a
different twist or ring for individual powers to evade the common bound.
The norm-length bound is precisely (10 f rank_i + 1) crudeUnit, from
B_i=10 f rank_i crudeUnit and eta=crudeUnit; retain all existence and
simultaneous value-family hypotheses of exists_anticyclotomic_twist.
This discharges the larger-ring comparison at TwistForRows:44–59.

## 3. Relative row loss at the actual first-order Ribet consumer

Fix the SAME selected lift pi, actual common O', actual row lattice
T=T_pi, all actual column lattices u_x, and modulus ell^m0. Let
A=obeyingCocycles(u,T,ell^m0), C=obeying(crysRels T,ell^m0 quotient),
Z=A intersect ker(eval all withConjInv tau) intersect ker(eval gamma_pi).
The strict first-order input b0 is length Z, not H^1, not the length
of the unrestricted Selmer module at the new triangle primes.
For any modules Z⊆A, quotient by C means Z/(Z∩C), and
  length Z = length(Z/(Z∩C)) + length(Z∩C)
           ≤ blockLoss(T,u,m0) + length(Sel_short(T)).
Indeed the first term injects into A/(A∩C). For the second, use
obeyingCocycles.mem_selmerModule with the actual graph and continuity
suppliers, giving a cocycle unramified outside S union conjClosure Q
union conjClosure range(w). By definition of Z, both tame-generator
values at every triangle prime vanish. Apply precisely
IsNewPlaces.mem_selmerModule_of_tame_eq_zero, whose separate premise
is T(g)=1 on inertia outside S union conjClosure Q WHEN cyc(g)=1.
For this row, psi(g)=1 there by IsAuxTwist and R_pi(g)=1 by IsRow
outside S; hence T(g)=1 (in fact without the cyclotomic guard).
This proves the subset of Sel_short, retaining evaluation zero at
gamma_pi. No inference from just one of the two tame-generator values.
For the rank-one blocks keep the earlier TateTwistSteps odd-Sha
quotient; this argument does NOT equate those with the distinguished row.

After normalization, the first term is bounded by the total block
loss, since every summand is nonnegative; the second by the short
row bound from section 2. Use the actual summed loss lemma, which
costs at most 4 r f loss(D,ell). Let r=card(row indices), c=crudeUnit,
H=D.h2, a=v_ell(X_odd). Thus
  normLength(length Z) ≤ (10 f r+1)c + 4 r f loss
                     ≤ r[H^27(c+a)+4 f loss] = r rowBudget
                     ≤ D.r rowBudget < m0.
Here the middle payment follows from native scale bounds H^27≥10 f+1
and r≥1; these are the same data inequalities in the original final
budget, retained, not derived from bare positivity. The final strict
comparison uses exactly m0>floor(D.r rowBudget) and finite rowBudget.
By normalized valuation of ell^m0 this is the hlt at RibetFirstOrder.
The actual normalizer uses ell^(m0+H h); monotonicity only strengthens
this strictness. The final selector and coefficient budget is already
in integration 452515bd, not recomputed here.

The actual FitTwistsExist chooses R,F for all good-eigenform pairs and
R',F' for the rank-one pairs, forms the finite disjoint sum, and chooses
one tau,H for each PrimePadicIso, before using a permitted power j in
both denominatorLe_rowBudget calls. Section 2 gives the required
SelmerLengthLe on those SAME row witnesses, and section 3 gives its
first-order consumer. Do not exchange existential row choices across
embeddings or across the good-lift/rank-one families. No new prime
window proof claimed. The unresolved native cup exponent, twisting
polynomial and representation/lattice existence inputs remain exactly
as in the original graph.

## 4. Evidence, reduction and handoff
Read exact pinned source bodies (not only declaration names), in
particular TwistForRows, TwistTheorem, RibetElement, Corepresentable,
DeterminantBound, AptTupleDefs, FitTwistsExist, DenominatorBound and
BlocksAndCocycles. No finite simulation offered as proof. New human
subgraph: coefficient dual separation -> mapped crystalline relation
inclusion -> same-ring Selmer length -> relative quotient injection
plus exact tame removal -> strict first-order row bound. All global
original/reduced graphs and existing axiom records preserved; the
native graph was not changed. Context key: compact pin, D, i, ell,
v, O,O', same row, Q,d, m0, same local chart; no cross-context caching.
Native Lean/lake/elan absent (actual command -v checks). Native
rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier not executed.
Old-pin receipts do not certify compact results. Actual compact CI
output reread: cathedral-research-state/compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json blob 088cd2ec0e935ee1a282f10096949bcf671cc804.
Six named checks list propext, Classical.choice, Quot.sound; module_1
timed out 124; all_requested_checks_ok=false, full_RH_replay=false.
No new kernel PASS. Prepared executable probes below. No import Main
or claimed RH theorem, no URT claims.

RESUME HERE: integrate the three exact bridges above into C; retain
exists_anticyclotomic_twist and its two-stage common-root fitting
polynomial inputs, then independently audit its actual exists_isPencil
minimality and scalar-root loss callers, without repeating prior odd-Sha
and local defect budgets. Shared runner: replay the named probes, not
the RH theorem. HANDOFF TO editor/integration/Galois/kernel.
AGREE/PARTIAL: human comparison established with stated suppliers,
not the complete RH proof.
-/

namespace AuditCommonTwist
-- Prepared exact scalar-separation certificate, independent of period theory.
theorem separates_matrix_relation {R S : Type*} [CommRing R] [CommRing S]
    [Algebra R S] {I : Type*} (a : I → S)
    (hsep : ∀ x : S, (∀ l : S →ₗ[R] R, l x = 0) → x = 0)
    (h : ∀ l : S →ₗ[R] R, ∀ i, l (a i) = 0) : a = 0 := by
  funext i
  exact hsep (a i) (fun l => h l i)

-- Strictness abstraction retaining the original rank ceiling.
theorem strict_row (z r R B m : ℝ) (hB : 0 ≤ B)
    (h₁ : z ≤ r*B) (h₂ : r ≤ R) (h₃ : R*B < m) : z < m :=
  lt_of_le_of_lt (h₁.trans (mul_le_mul_of_nonneg_right h₂ hB)) h₃
end AuditCommonTwist

#check exists_mFoldTwist_selmerLengthLe
#check exists_anticyclotomic_twist
#check obeying_crysRels
#check IsNewPlaces.mem_selmerModule_of_tame_eq_zero
#check ribet_columns
#check exists_isFitFamily
#print axioms AuditCommonTwist.separates_matrix_relation
#print axioms AuditCommonTwist.strict_row
#print axioms exists_mFoldTwist_selmerLengthLe
#print axioms ribet_columns
