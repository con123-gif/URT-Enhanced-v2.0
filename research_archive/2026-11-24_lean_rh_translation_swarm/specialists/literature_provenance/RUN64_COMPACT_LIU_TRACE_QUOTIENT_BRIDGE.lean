import Lib.PadicHodge.Limit.LocalLimit

/-!
# RUN64 — replace the crystalline trace-limit topology by Liu's torsion theorem
26 November 2026. Human mathematical reduction, awaiting independent audit; native probes below
are prepared, not compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude for upstream.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207;
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, completion-first sprint.
Peer integration f775ec50a2a0cfada97d4eaa5a680a04d7cab862 supplies radius; editor
add4eea2d05130a4babbef1d10ca546b58e6acdf retains trace-limit topology OPEN.
Latest peer commits through fb2fa75c030047f90f06a14b2ce8cf2fe4d2392f inspected by title;
none claims this bridge. Do not redo the radius argument.

Actual source:
* Lib/PadicHodge/Comparison/CrystallineLimit.lean e3cf139874cd85a9e5642c277e8b51b9343add9a:
  exists_finite_groupRing_quotient, isCrystalline_of_trace_limit (full bodies read).
* Lib/PadicHodge/Limit/LocalLimit.lean 0d4b023bd6e5ce03e2bfda58541f207b90c6bba2:
  local_clauses_of_trace_limit, actual consumer; also uses uniform_period_bound separately
  for killing polynomials. Do NOT remove that surviving dependency.
* Lib/PadicHodge/Crystalline/Defs.lean 10e3aee76b3ee7c372209e2d477814754bb09749:
  OverGp has OPEN image only, not injectivity or a topology on the domain; IsCrystalline is
  span of all fixed periods over native Bcris. 
* Lib/PadicHodge/Limit/LimitDefs.lean a7cfbbd596a9e988d35b16ac9ced9167fa0e6e12:
  IsCrystallineUpTo includes all coefficient embeddings.
* Lib/PadicHodge/PeriodRings/AmaxStructure.lean 1be9736d2c48bece6dd038c72d14b6f807cff9df:
  140–151 Amax, BPlus, Bcris (Colmez Bmax, invert mu rather than log).
* Lib/PadicHodge/Crystalline/Jumps.lean 487fb8b09cb5c25aa582ddab7352f90dd6c2e0d1:
  cyclotomic twist shifts jumps by minus its exponent.

## 1. Exact external statement and normalization
Tong Liu, Torsion p-adic Galois representations and a conjecture of Fontaine,
Ann. Sci. ENS 40 (2007), 633–674, Conjecture 1.0.1 as stated and proved by the paper,
https://www.numdam.org/item/ASENS_2007_4_40_4_633_0.pdf p.633 (text and screenshot inspected).
For any finite extension K/Qp, finite free continuous Zp[G_K]-lattice L, fixed integer r>0:
if for every n, L/p^n L is the quotient of two stable Zp-lattices in a crystalline Qp
representation of weights in [0,r], then L[1/p] is crystalline of weights in [0,r].
This is a subquotient theorem, not a theorem requiring fixed rank or a fixed coefficient
field for the approximating representations. For an interval with the opposite Hodge–Tate
sign convention use a common Tate twist before applying Liu and undo it after; choose r=max(1,h).
No claim of a new literature theorem. Berger 2004 is not a substitute for arbitrary ramified K.

Native Bcris is Colmez Bmax. Berger, On p-adic Galois representations, §13 p.11,
https://mahalex.net/teaching/seminars/cristalline/Berger%20On%20p-adic%20Galois%20representations.pdf
(text and screenshot checked) gives phi(Bmax) subset Fontaine Bcris subset Bmax.
Applying phi to an invariant comparison matrix AND its inverse (phi fixes Qp and commutes with G_K)
converts Bmax admissibility into Bcris admissibility; the converse is scalar extension.
For the native localization parameter, Bartlett, On the reductions of some crystalline
representations (2018), Lemma 9.1.2 pp.105–106, gives t/mu a unit in Amax, so the localizations
agree. Parsed statement inspected at
https://kris.kcl.ac.uk/portal/files/106627111/2018_Bartlett_Robin_1418954_ethesis.pdf
(page-image request returned 403; retain normalization audit, not claim screenshot success).
These are standard period-ring facts, not the quantitative native uniform denominator theorem.
Retain the usual p-adic topology on BdR (not the discrete-on-Qp t-adic valuation topology)
and its continuous Galois action for descent below.

## 2. Finite integral algebra and exact uniform separation
Use the actual native hypotheses: G compact topological group, Delta -> Gp with open image,
w:Delta -> Zp[G] multiplicative, target R continuous with trace-nondegenerate span,
and for each epsilon>0 some finite family X_eta with crystalline viaGroupRing w X_eta of jumps
[0,h], continuous on G, such that ||tr R(y)|| <= epsilon whenever y lies in its joint kernel.
No pointwise-only trace convergence is substituted.

By exists_finite_groupRing_quotient for the single target, take q:Zp[G] -> T (surjective)
and faithful embedding u:T -> Mat(R.Index,Qpbar) identifying its image. T is finite free
over Zp, hence compact, even if the family of all approximants has unbounded coefficients.
For fixed k>=1 put C_k=T minus p^k T. On C_k trace nondegeneracy says each x has a g in G
with tr(u(x)R(g)) nonzero. The sets {|tr(u(x)R(g))|>epsilon_x} are open and cover C_k
with suitable positive epsilon_x. Compactness gives finitely many and a positive minimum
epsilon_k. (If C_k empty, the desired kernel containment is automatic.) This proof only
needs continuity in x of each of the finitely many linear functionals. Consequently
    [forall g, ||tr(u(x)R(g))|| <= epsilon_k] implies x in p^k T.
Choose eta using the native H at this same epsilon_k. Its joint kernel J_eta is a two-sided
ideal. For y in J_eta, y*[g] is again in J_eta for every g. Multiplicativity of the group ring
map now yields the exact simultaneous containment
    J_eta subset ker(Zp[G] -> T/p^k T).                 (Q)
Do not replace uniform separation by a norm estimate with a constant independent of k.
No division by a trace or approximate idempotent.

## 3. The actual torsion-crystalline witness
Apply exists_finite_groupRing_quotient to this finite family: pi_eta:Zp[G] -> T_eta
surjective, kernel exactly J_eta, T_eta finite free, and its left multiplication
Delta-representation via pi_eta(w) is crystalline up to h (actual final clause).
The source proves the final clause by the jointly injective coordinate evaluations into
the component matrix representations and the jump theorem for subrepresentations.
Equation (Q) defines a surjective Zp-linear algebra map
    f_k:T_eta -> T/p^k T,    f_k(pi_eta(y))=q(y) mod p^k.
It intertwines the two left multiplication actions, as does its kernel. Set
    L_k=T_eta,   L'_k=ker f_k.
Then p^k L_k subset L'_k subset L_k, so L'_k is a full stable finite free lattice in
L_k[1/p], and T/p^k T = L_k/L'_k as Delta modules. This is Liu's actual required
subquotient, not a lift of R itself or a semisimplification. No nested families needed.

## 4. Descent and continuity (important: j need not be injective)
Let H=image(j) be open in Gp, hence H=G_K for a finite K/Qp by Galois correspondence.
For the crystalline lattice L_k, over native Bmax the fixed periods span. For a
finite free lattice an element of ker j acts Bmax-linearly and fixes the spanning
periods, so acts identically, and L_k descends to H. For continuity, extend scalars
to BdR and choose a basis of fixed period columns there. If its invertible matrix is
M, the descended action matrix is M h(M^{-1}); its entries are Qp-valued, and it is
continuous in the ordinary p-adic topology (BdR has continuous orbit maps and Qp
with its usual topology as a subspace, equivalently clear a fixed power of t then
apply theta to extract each scalar). Thus L_k is a continuous G_K lattice.
The finite quotients T/p^k T inherit continuous H-actions. For a member of ker j,
its difference from identity on T lies in every p^k T, hence is zero; T descends.
Continuity of T follows because the congruence kernels modulo p^k form a neighborhood
basis in GL(T) and each quotient action is continuous. This verifies the continuity
hypothesis of Liu without assuming it for w or assuming j injective. The Hodge–Tate
jumps for the descended L_k are the same as those computed via Delta, because j maps
onto H and nearOne is the pullback filter. For base ring Zp there is only its usual
coefficient embedding; the signs are handled by the fixed twist in §1.

Apply Liu to T and the witnesses L_k/L'_k for EVERY k, obtaining T[1/p] crystalline.
Transfer back to the native Bmax via §1. Finally, for each target vector v, the
evaluation map T -> target, x -> u(x)v, is equivariant for left multiplication
by w and sends 1 to v. Tensor with native Bmax, push the invariant spanning
expression for 1⊗1 through this map; this gives 1⊗v in the span of fixed periods.
Thus viaGroupRing w R is crystalline, exactly the conclusion of the native
isCrystalline_of_trace_limit. No appeal to RH or its final theorem.

## 5. Actual LocalLimit consumer and graph consequences
In local_clauses_of_trace_limit the original uniform trace combination error on g
extends to every y in Zp[G] by the ultrametric triangle inequality and |coeff(y)|<=1.
If y is in the joint kernel the approximant sum vanishes exactly; thus the H of
§2 holds, without bounded coefficients a_eta or rank. The native common twist alpha
shifts all weights into [0,2d] and has the same w for every component; apply the
above to that alpha and undo the twist. This supplies the IsGoodAt crystalline
clause. Leave the separate polynomial-killing and jump-multiplicity calculations
intact: in particular uniform_period_bound is explicitly used again for the
Weil-power evaluation in LocalLimit and radius_lemma also has FrameTheorem's safety
consumer. No global deletion justified.

Original local source-visible graph:
  local_clauses_of_trace_limit -> isCrystalline_of_trace_limit ->
    exists_finite_groupRing_quotient, uniform_period_bound, adicBasis,
    coordinate fixed-period reconstruction, trace nondegeneracy, finite free D.
Proposed human replacement graph for this occurrence only:
  local_clauses_of_trace_limit -> finite image quotient -> compact trace separation
    -> (Q) -> full stable lattice quotient -> open-image descent/continuity
    -> Liu 1.0.1 + Bmax/Bcris normalization -> equivariant evaluation.
Unchanged parallel edges: uniform_period_bound -> radius_lemma and other actual
callers, jump projector and polynomial coefficient uniform convergence, all
ring and coefficient hypotheses of finite quotient, remaining A/B/C supplier
frontier, original/reduced native graphs and axiom ledgers. Context key:
compact pin, p,G,Delta,j,w,h,R,epsilon_k,k,family eta. No URT; no claimed global pruning.

## Verification / ledger
Source-matched human proof of the finite quotient bridge and descent; Liu exact
external theorem checked in primary paper; Berger normalization checked; Bartlett
unit parsed statement checked, page image unavailable. Standard topology and
identification of native ring constructions remain explicit foundations for review.
No fresh native execution: lean/lake/elan absent locally. Old-pin engine status files
reread: b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 both status pass for old tasks only.
Compact run 45803534769 jobs pick/run/record success does not imply full proof replay;
previous recorded results six named probes, one timeout. No synthetic tests performed.
The probes below are only executable provenance checks for original declarations,
NOT formal verification of the new literature argument. Existing native engine
rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier not available in this compact runtime.
Do not add a new axiom or import Main/RH as a certificate. No native graph edges retired.

RESUME HERE: independent audit of (Q), H descent and t/mu normalization, then merge
Liu bridge at the IsGoodAt caller; next actual C local safety/normalized RowBalanced
and distinct Weil-power polynomial consumer. Retain all other open obligations.
HANDOFF TO integration, editor, independent audit, Galois, compact runner.
-/

#check exists_finite_groupRing_quotient
#check isCrystalline_of_trace_limit
#check local_clauses_of_trace_limit
#print axioms exists_finite_groupRing_quotient
#print axioms isCrystalline_of_trace_limit
#print axioms local_clauses_of_trace_limit
