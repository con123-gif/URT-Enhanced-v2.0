import New.Curve.JetDivisibility
import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
# RUN75 — directed null-coupling determinant and marked charge cancellation
27 Nov 2026. Human source-matched derivation; scalar certificates and native
probes PREPARED, not compiled. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10 read first, including
completion-first and mandatory reduction. SWARM_PROTOCOL, HANDOFF_QUEUE,
EXPANSION, AGENTS and continuity records consulted. RUN74 4b2ec292,
RUN73 784d021e; peers 577605fc, 392d881d, 2a198f50, 72775cce
actual commit patches read. No URT or claimed RH theorem import.

Source ledger (grh-compact/src):
New/Curve/JetDivisibility.lean 5f6e6f63dc7bfc35aedc136ae8330510d3493f06
exists_null_coupling_frames 24–53, norm_schurJet_le 65–111.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
couplingCount, with h < N, not h <= N.
New/Core/ModuleIndex.lean 214cc116f97852925f444db42bfa36cf563af508
IndexDvd.of_det_dvd (native Hermite supplier).
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
Data.IsGoodDatum.mem_raises, exists_move_markOperator,
gaugeLe_markOperator_pow, gaugeLe_Bmu_of_isMarked.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
norm_jetSeries_le 55–86, mem_raises_of_jet_bound 121–135.
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
jetExponent, le_jetExponent, sum_lowColumns_le, balance.
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
evenPlaces, markExponent, lowColumns, inducedPlace.

## 1. Direct integral row elimination, including theta=0

Let O=valRingCp(p), a valuation domain, h>=0, and a finite
list of linear congruences on O^h, l_i(x) in c_i O, c_i in O.
Starting with identity rows, impose them one at a time. Given
rows R_j already satisfying the previous congruences, set
a_j=l_i(R_j). If all a_j are divisible by c_i, do nothing.
Otherwise choose k with maximum |a_k|; then a_k!=0, all
a_j/a_k are in O, and c_i/a_k is in O. Replace R_j by
R_j-(a_j/a_k)R_k for j!=k and replace R_k by (c_i/a_k)R_k.
The new rows still satisfy every earlier linear congruence.
The determinant multiplier is c_i/a_k (subtract before scaling),
so the resulting determinant divides the old determinant times
c_i in the following precise sense: each elementary multiplier
d_i divides c_i, hence product d_i divides product c_i.
For h=0 no row exists and the multiplier is 1. For c_i=0
the same operation works, including zero determinant; if all
a_j=0 no operation is needed. No division by c_i is used.
Thus one integral matrix kills the full list and has
  |det M| >= product |c_i|.
This proves the exact finite-row consequence of IndexDvd.of_det_dvd
used in JetDivisibility, without requiring a discrete valuation,
a global basis of an ideal, or a nonzero theta. No full IndexDvd
replacement elsewhere is claimed.

## 2. Exact per-edge allocation, with all height-one exceptions

For a directed edge (e,sigma,tau=pr_e sigma) put q=p^e and
t_sigma=sum_{h<N,h=1,sigma notin ev} kappa(sigma,h),
r_sigma=sum_{h<N,h!=1} kappa(sigma,h),
B_sigma=sum_{h<N,h!=1} h*kappa(sigma,h).
Use T=(t_sigma/q <= r_tau+t_tau) and D=(B_sigma/q <= B_tau).
Choose q-th roots rho_e of all required O-elements, possible
by algebraic closure of C_p and |rho_e(a)|^q=|a|.
For e=0 this is the identity. No additive root map is assumed.

Use the following list of constraints, exactly the source's
b=true/false, o=None/Some predicate A after simplification.
Each is imposed on every row m of the indicated frame block.

Source, h!=1: ALWAYS impose the linear constraint
  L_S(m) = sum_a rho_e(Y_tau(a,0)) (sum_i m_i Y_sigma(a,i))
      in rho_e(theta) O.
This is a single linear form, regardless of h.
Source, h!=1: ALSO every coordinate m_i in rho_e(theta) O
if D. Source, h=1: its coordinate is in rho_e(theta) O if
sigma notin ev and T, and no constraint otherwise.
Target, h!=1: linear form
  L_T(m')=sum_a Y_sigma(a,0)^q (sum_i m'_i Y_tau(a,i))
      in theta O
if not T; additionally all coordinates m'_i in theta O
if not D. Target, h=1: L_T(m') in theta O if
tau notin ev and not T. There is no additional coordinate
constraint on height one. For h=0 coordinate lists are empty,
the zero linear form costs nothing in reality but can be budgeted.
If sigma=tau, retain BOTH directed endpoint lists on the same block.
Parallel edges and all e in the finite S retain their own lists.

Count the constraint modulus exponents after weighting by kappa.
Source modulus has norm |theta|^(1/q), target |theta|.
The source singleton costs r_sigma/q regardless of T,D.
The T choice costs t_sigma/q if true, r_tau+t_tau otherwise.
The D choice costs B_sigma/q if true, B_tau otherwise.
Thus the combined allocation has exact exponent
  C_e,sigma = r_sigma/q
             + min(t_sigma/q,r_tau+t_tau)
             + min(B_sigma/q,B_tau).
Apply section 1 once per block to the combined list. For all
0<=h<N, multiply the norms with their kappa exponents:
  product_{sigma,h<N}|det M_sigma,h|^kappa(sigma,h)
       >= |theta|^(sum_{e in S,sigma} C_e,sigma).
For theta=0 the convention 0^0=1 agrees with an empty cost:
if the total cost is zero, every positive-weight block has an
empty constraint list (or vacuous zero-dimensional constraints),
so its determinant is 1. Otherwise the lower bound is 0.
The same proof supplies frames for ALL h, including h outside
the weighted range; such blocks carry no determinant weight.
No assumption that pr is injective, an involution or a free action.
Do not replace the directed sum by an undirected half-sum.

## 3. Why the same frames annihilate every nonexempt pairing

Let g:O -> R, R of characteristic p, with g(theta)=0.
Write v_a=sum_i m_i Y_sigma(a,i),
w_a=sum_i m'_i Y_tau(a,i). The desired pairing is
sum_a g(v_a)^q g(w_a). Frobenius preserves sums and products
in R, even if R has nilpotents. A source coordinate constraint
forces g(m_i)^q=0; a target coordinate constraint forces
g(m'_i)=0. The source singleton L_S yields
  g(L_S)^q = sum_a g(v_a)^q g(Y_tau(a,0)) = 0.
The target singleton L_T yields
  g(L_T) = sum_a g(Y_sigma(a,0))^q g(w_a) = 0.
Consequently:
* h!=1,h'=1: use the ALWAYS source singleton, multiplying
  by the one target coefficient. No exemption needed.
* h!=1,h'!=1: use source coordinates if D, otherwise target
  coordinates.
* h=1,h'!=1 and sigma notin ev: use source coordinates if T,
  otherwise the target singleton multiplied by g(m_0)^q.
* h=h'=1 and both ends outside ev: the same T choice works,
  now the target singleton is available because tau notin ev.
h=0 or h'=0 has no row index. The exact excluded condition is
h=1 AND (sigma in ev OR (h'=1 AND tau in ev)).
This proves the null property at the same determinant budget.
It uses Frobenius only in the quotient, not in C_p.

## 4. Native Schur-jet consumer and the factorial budget

Retain FitsRanks, actual Weyl indices i',i, and the
IsIntegralOnNullCone pr S varpi theta B Theta from RUN73–74
(including the original frame Frobenius and normal form inputs).
Use native sum_schur_smul_nablaBasis and the coefficient
evaluation principle exists_val_coeff_le_val_eval to reduce the
estimate to a tableau product of minors under one integral
evaluation y. These two algebraic representation suppliers
remain explicitly retained. Let N=card n', B=boxes kappa N,
and use g_charge as in norm_schurJet_le. Construct the SAME
frames from y by sections 1–3. In the source z matrix each
block row is multiplied by p^g_charge and is supported on
its own (tau,b). In each nonzero pairing the b labels must
agree; the charge premise hg says at an exempt pair at least
one exponent is positive. Its factor is zero in characteristic
p. All nonexempt pairs vanish by section 3. Therefore the
actual substitution is on the required null cone.

For each tableau column of height h, multilinearity and
det(M^T)=det M give exactly one det M factor and h factors
varpi*p^g_charge. Multiplying over columns yields
  |scale| >= |theta|^C |varpi|^B p^(-m),
where C=sum couplingCount and m is the native box charge sum.
The determinant identity is before norms; there is no h-fold
determinant loss. Both |theta|=p^omega and
|varpi|=p^(-rho) are positive in this caller, so division is
valid even though section 1 allowed theta=0.

Null-cone integrality bounds the resulting Taylor coefficients
through total degree B. For a derivative multiindex d of degree
B, the derivative is multiplied by product_i d_i!.
For B>=1 the base-p digit formula gives
  v_p(d_i!)=(d_i-s_p(d_i))/(p-1)
             >= d_i/(p-1)-(floor(log_p B)+1)
for d_i>0. Sum only over the support; its cardinality is at
most |Phi| N sum_{h<N} h <= |Phi| N^3, precisely the source's
variable set (Sigma h:Fin N,Fin h) x (Phi x n').
For B=0 the derivative is constant and the same weaker error
bound holds with native p.log 0=0. No count of tableau
permutations is needed: the ultrametric norm bounds their sum
by the largest summand. Division by the common scale gives
  |schurJet| <= p^(m - ((1/(p-1)-rho) B + omega C
                           - |Phi| N^3 (p.log B+1))).
This is exactly norm_schurJet_le, retaining the representation
and null-cone hypotheses above; no new analytic estimate.

## 5. Actual marked Hecke gauge consumer: cancellation before the bound

Use LocalStatement.mem_raises with H good, hQ coprime,
hLambda marked, actual support x, and the same j. Native
double-coset factorization chooses J_w with |J_w|<=rbar
where rbar=ceilLogM(p), integral left/right factors and diagonal.
Retain ConjugatesOfJets.norm_jetSeries_le (common integral
vacuum/frame supplier) and mem_raises_of_jet_bound; these
transfer the uniform theta product estimate to every standard
datum and weight the matrix entries by the actual diagonal.

The source's charge on a box labelled b at induced w is
  c(w,h,b)=1_{(w in Lambda,h=1,b notin J_w)
                OR (star w in Lambda,b in J_star w)}.
For nonempty Lambda, p is served and inert. Every e in the
actual finite normal-form list is odd; inducedPlace_neg_pow_mul_of_odd
makes the partner's induced place star w. Marking is star-disjoint.
For a height-one source at w in Lambda, either b notin J_w
and its own charge is one, or b in J_w and the target charge
is one regardless of target height. For a height-one target
in Lambda paired with a height-one source at star w the same
split applies. If Lambda is empty there are no exemptions.
Thus hg is discharged at the actual consumer, not assumed.

For clarity on signs: use the source's weightEmbedding and
placeOfEmb_comp_star reindexing, NOT the unstarred finite
place diagonal. After this reindexing the norm exponent of
the diagonal entry is
  a(w,b)=1_{w in Lambda,b in J_w}
           -1_{star w in Lambda,b in J_star w}.
The sum c+a is exactly 1 on all height-one boxes at marked
w, exactly 1_{b in J_w} on higher boxes at marked w, and
zero at every other w (including star-marked). This is the
source's final simp/weight count in mem_raises. The det-character
exponents cancel in the sum by the native
sum_inducedPlace_sub_star_eq_zero applied to
G(c,w)=|J_w|*(floor(n_j/2)-c), c=w_(j+1)(tau).
Do not assume each individual determinant character is a unit.
For each higher tableau column the number of labels in J_w
is at most |J_w| by tableau_col_injective, hence <=rbar.
The exact remaining scalar count is bounded by
  sum_{w in Lambda} A_w + rbar sum_{tau in evenPlaces Lambda}
                                      lowColumns(j,tau),
where A_w=a * #tops inducing w, from markExponent and kappa_1.
Therefore the weighted Schur bound is the actual
p^(sum A_w + liftLoss Lambda j), liftLoss =
rbar*sum lowColumns - jetExponent. All delta, level and
periodFactor unit hypotheses in norm_jetSeries_le remain.
This is the marked gauge consumer, not the elementary-divisor
theorem for the marked operator.

At the existing next caller, retain exists_hecke_transfer and
exists_move_markOperator. Each marked operator changes the
exponent A_w to deltaP via its scaled Hecke transfer, so
gaugeLe_markOperator_pow has exponent sum_j (|Lambda|deltaP +
liftLoss Lambda j). With the actual full marking, collisionSum=0,
and the two existing JetExponentBound inequalities
  |Lambda|deltaP+rbar sum lowColumns <= loss/m + E,
  gain/m + E - loss/m <= jetExponent,
where E=#even tops*a/x1 (chiK=-1), subtraction cancels E
before summing and gives 2loss-gain. This is exactly
gaugeLe_Bmu_of_isMarked. Retain the proof of these two quantitative
inequalities, Hecke transfer, and marked operator HasType
at exists_indexDvd_Bmu_divisible; do not replace them by this
scalar cancellation.

Original graph preserved: Main -> New.grh -> star_inequality ->
Data.short_forms -> exists_indexDvd_Bmu_divisible ->
gaugeLe_Bmu_of_isMarked -> gaugeLe_markOperator_pow ->
exists_move_markOperator -> mem_raises -> norm_jetSeries_le /
norm_schurJet_le -> exists_null_coupling_frames -> IndexDvd.of_det_dvd.
Reduced human local graph: finite valuation row elimination ->
directed constraint lists -> exact min budget + Frobenius null ->
charge exemption + determinant/factorial -> Schur ->
standard datum bridge -> marked charge cancellation -> gauge.
No globally removed native edge or axiom; original/reduced graphs
and old-pin receipts unchanged. Context key: compact pin, p, e,
pr, S, N, kappa, ev, Y, theta, O, R, g, FitsRanks, i', i,
actual marked set, J and standard datum. Retain all other consumers.

Verification: command -v lean/lake/elan returned no executable.
Actual state receipt compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json reread: 6 named B/C checks with
propext, Classical.choice, Quot.sound; A build returned 124
after 2700.11s; all_requested_checks_ok=false, full_RH_replay=false.
No fresh native execution, rh_prune/scan/reduce/auto/frontier
not run on compact; old-pin engine PASS not transferred.
The source probes below and scalar certificates are uncompiled.
No redundant finite sampling used: all counts are symbolic.
Independent audit still required, particularly the weightEmbedding
sign convention and nonzero weighted determinant case.

RESUME HERE: derive the two actual JetExponentBound suppliers
le_jetExponent and sum_lowColumns_le (pointwise live-sum
comparison, native scale bounds, exact gain/collision cancellation),
then attach to this gauge consumer. Coordinate marked Hecke
transfer and HasType with kernel/URT lane peers; do not redo
null-coupling, CM radius or marked charge count.
HANDOFF TO integration/editor/audit/acceleration/native runner.
Human RH reconstruction remains incomplete.
-/

namespace ThetaRun75

theorem exact_directed_cost (t r b t' r' b' q : ℝ) :
    r/q + (if t/q ≤ r'+t' then t/q else r'+t') +
        (if b/q ≤ b' then b/q else b') =
      r/q + min (t/q) (r'+t') + min (b/q) b' := by
  rw [min_def, min_def]

theorem marked_charge (h : ℕ) (marked partner selected other : Bool)
    (hd : marked = true → partner = false) :
    (if (marked = true ∧ h = 1 ∧ selected = false) ∨
         (partner = true ∧ other = true) then (1:ℤ) else 0) +
       ((if marked = true ∧ selected = true then (1:ℤ) else 0) -
        (if partner = true ∧ other = true then (1:ℤ) else 0)) =
      (if marked = true ∧ (h = 1 ∨ selected = true) then (1:ℤ) else 0) := by
  cases marked <;> cases partner <;> cases selected <;> cases other <;>
    by_cases hh : h = 1 <;> simp_all

theorem marked_gain_cancel (loss gain E k J : ℝ)
    (hk : k ≤ loss + E) (hJ : gain + E - loss ≤ J) :
    k - J ≤ 2*loss - gain := by linarith

#print axioms exact_directed_cost
#print axioms marked_charge
#print axioms marked_gain_cancel
end ThetaRun75

#check exists_null_coupling_frames
#print axioms exists_null_coupling_frames
#check norm_schurJet_le
#print axioms norm_schurJet_le
#check Parameters.norm_jetSeries_le
#check Parameters.mem_raises_of_jet_bound
#check Data.IsGoodDatum.mem_raises
#print axioms Data.IsGoodDatum.mem_raises
#check Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
