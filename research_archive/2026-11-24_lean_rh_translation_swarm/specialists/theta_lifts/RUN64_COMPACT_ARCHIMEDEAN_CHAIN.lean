import New.Endgame.ShortAndEnough
import Mathlib.Tactic

/-!
# RUN64 — archimedean theta chain at actual Theorem A caller
2026-11-26. Compact source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Status: source-level mathematical reconstruction, conditional on retained native
single-stage Schur/semilinear inputs and size guards; certificate prepared, NOT compiled.

Read latest mission and recent integration/peer handoffs. Avoid duplicating
403556a7 (marked sizes), 57550c80 (single-stage Hecke transfer), 6bae6781 (split chain),
6843df9f (level chain), 8bf73512 (short spanning columns), a599aa5c (marked intertwining).
The present obligation is the distinct archimedean bound at Data.short_forms.

## Actual source edges (all relative to grh-compact/src)
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547:
  Data.weylNormSq_Bmu_le
New/Columns/ChainValuation.lean 19e853dfa8c645bfcdf3b3e21183f9b432620ef7:
  exists_chain_eq_sum, IsGoodDatum
New/Rows/MemberKernels.lean be36c0175fe559376780b105052249fc0c9f1f4f:
  Parameters.norm_jet_le_of_isAdmissibleComb
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0:
  exists_semilinear_isJetConjugate
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b:
  liftKernel, translateDatum, Bmu
New/Columns/SizeEstimates.lean 0b666c5f3cead375b65b97c6af8a25675486b473:
  primeSum_eq_sum_localAsk, diagramWeight_le_by_index, jetSize_le_add,
  norm_map_star_piG_sq, heightPerRow
New/Columns/ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65:
  restrictToY, le_branchExp
New/Seesaw/LiftCharacters.lean db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45:
  Data.weylNormSq_restrictToY_le
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b:
  gain, localAsk
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a:
  Data.short_forms, heightPerRow_le.

## 1. Gaussian stage: exact exponent, not repeated losses
Fix D, the trivial twist, sigma, the actual good datum Psi, and a column with
Weyl squared norm after sigma bounded by exp(B) on every class. Put
L=a+1, v=log b, g=gProd, Omega=P.bigOmega(s), u=log(g/Omega).
The single-stage datum is one translated intVacuum, hence the admissible
combination bound is 1. Its kernel scale c=star piG satisfies
|sigma(c)|^2=g for every sigma. This uses the norm of the algebraic CM element,
not an assumption that an arbitrary automorphism of C commutes with conjugation.

In MemberKernels' polynomial jet bound, write d=f*n_j*n_(j+1),
C=P.c*(P.N1(s)*n_j*n_(j+1)+1)^2. After reducing sigma to a K-fixing
automorphism with the same absolute value, the semilinear conjugacy supplies
t with |t|^2=1/Omega and a permuted variable z with
sum |sigma z_i|^2=exp(u)*sum |y_i|^2.
For R=sum |y_i|^2/(2L+2), the hypothesis on polynomial Q bounds its
evaluation by A exp(w+LR). Multiply by the Gaussian before integrating:
  -sum |y_i|^2/2 + L R = -sum |y_i|^2/(2L+2).
The normalized complex Gaussian integral is (2L+2)^d. The translated
vacuum bound exp(C) therefore gives A exp(C+d log(2L+2)+w).
The exact semilinear, uniform vacuum bound, normalization and integral
representation are retained native inputs. No invented pointwise Schur
estimate: the native Gram-dual argument uses sqrt_weylNormSq_le_of_dual,
dotProduct_schurJet_mulVec, eval_schurCoeffPoly, weylNormSq_schur_le and
pow_le_exp_log_factorial_add. Retaining that bridge, the actual output is
  sqrt(W_jout) <= exp(C+d log(2L+2)
      + (1/2) sum_{tau,i} (r_ji/L+log(r_ji!)+r_ji*u)) sqrt(W_jin),
where r_ji=diagramWeight at (j,tau,i) and i ranges over the source rows.
This is the norm in the native Gram form, not an entrywise norm. No new
claim to have proved the underlying semilinear or Schur theorem.

## 2. One class-chain expansion
Apply exists_chain_eq_sum to the same jointly invariant Psi and same
chosen levels at each j<m. For each class tuple and support element the
stage bound multiplies. The class tuple count is the product of the
actual class counts (freeness as in the native caller); each count is
<=exp(x^30). Sum over Psi only ONCE using IsGoodDatum.size_le at twist 1,
sum |sigma Psi| <= exp(x^60). The triangle inequality on the square root
Gram norm then squaring gives
 log-bound = B+2*x^60+2*m*x^30+
  2*sum_j(C_j+d_j log(2L+2))+
  sum_{j,tau,i}(J(r_ji)+r_ji/L),
with J(t)=log(t!)-t log(Omega/g).
This is an exponential bound even when the output is zero; no logarithm
of the output is taken. The finite sums, uniformity in sigma and all
adelic arguments are exactly those of the caller.

## 3. Aggregate row budget
Use the source diagramWeight_le_by_index:
r_ji <= base_tau_i + e_tau_i,
base_tau_0=kappa_tau(1), base_tau_i=w_0(tau) for 0<i<k, otherwise 0;
e_tau_i=h2^2 plus b1+b2 for i=0.
kappa_tau(1)=a for tops, 0 otherwise. Since Omega/g<=1,
J is nonnegative on natural arguments and J(0)=0. Thus the sum of
baseline J per stage is <= S = sum_tops J(a)+k sum_tau J(w_0(tau)).
By jetSize_le_add the excess is bounded by
e_tau_i*(log(base_tau_i+e_tau_i+1)-log(Omega/g)).
Retain the precise source scale guards used here: base+e<=2a and the
parenthetical expression <=m. These are explicit numerical premises,
not an additional analytic conjecture; their native HasLogBound
discharge has not been independently replayed here.

For clarity a deliberately loose aggregate payment suffices under the
source scale guards: n_m<=x^6, f<=x^12, m<=2 sqrt(x)<=x, h2<=x^41,
b1,b2<=8b, a>=xb, a<=e*xb, log N<=30*m*v,
N1<=x^35, P.c<=x, v<=x^.01, v>=10^12 log x, x sufficiently large
as in Data.scale. These bounds are used only with their source hypotheses.
The per-stage sum of e is <=f(16b+x^88)<=17fb.
Over m stages the total row error is <=17fb*m^2<=68fa.
The remaining polynomial overhead, including r_ji/L<=2 for each row,
is at most x^100: C_j<=x^96, d_j<=x^24, log(2L+2)<=2v;
therefore 2sum C_j<=2x^97 and all other polynomial terms
(2m x^30, 2x^60, 2sum d_j log(2L+2), sum r_ji/L, and x^70
for branching below) fit inside the unused slack for x sufficiently large.
x^100<=fa since b>=x^(10^12), a>=xb, f>=1.
These loose constants are a human bound conditional on the listed guards;
native proof uses its own tighter HasLogBound estimates.

## 4. Branching and the exact global gain cancellation
For restrictToY the branching matrix is fixed; its native Gram operator
estimate gives squared norm inflation <=exp(x^70), already budgeted.
Since pi*star(pi)=N, the restriction scalar contributes precisely
N^(-sum_tau branchExp_tau) to squared norm, uniformly in sigma.
le_branchExp gives sum branchExp >= #tops*a-2fb.
Thus residual branching loss <=2fb log N<=60fa*v. Keep the native
branching matrix and its norm bound as prerequisites.
Together the overhead is <=fa(69+60v)<=fa*v^3=budget for v>=100.

The decisive exact identity precedes any norm bound on prime sums:
  2 sum_(p nonsplit) gain(p) log p
    = m [sum_tops primeSum(a,tau)+k sum_tau primeSum(w_nom(tau),tau)].
Indeed primeSum_eq_sum_localAsk applies at y=a and y=w_nom(tau)<=a;
localAsk at a split prime vanishes by its factor (1-chiK(p))/2.
The finite range and nonsplit filter are exactly those in SizeEstimates.
By the definitions of dirCost and heightPerRow this yields
  heightPerRow + 2 sum_(p nonsplit) gain(p) log p
    = m S - #tops*a log N.
No estimate for an individual prime is used in this equality.
Substituting the exact equality in sections 2–3 and branching proves
the archimedean exponent of Data.weylNormSq_Bmu_le, conditional on the
native inputs explicitly retained above:
  W(Bmu phi) <= exp(B + heightPerRow + 2 sum gain log p + budget).

## 5. Actual short_forms caller
Use the same rational normalization q as the local/index branch.
The exact product formula and allowed loss budget give
log q <= budget - sum gain log p. The input short column has squared
norm <=exp(budget), hence after scaling the input exponent is
2log q+budget. Then heightPerRow <= mainHeight-m*remainder+budget.
Exact cancellation of 2sum gain log p yields the upper exponent
mainHeight-m*remainder+5*budget <= mainHeight-m*remainder+v*budget.
This applies at the same sigma and all required points, and does not
alter the separately established local integrality or index conditions.

## Graph / evidence / resume
Original selected caller graph: short_forms -> weylNormSq_Bmu_le ->
{weylNormSq_restrictToY_le, exists_chain_eq_sum, norm_jet_le_of_isAdmissibleComb,
size_le, class counts, diagramWeight_le_by_index, jetSize_le_add,
le_branchExp, primeSum_eq_sum_localAsk}.
Reduced human argument: exact Gaussian exponent + stage norm bridge ->
one finite chain -> row/branch error budget -> exact gain cancellation ->
same short_forms caller. All original edges survive as evidence; no
kernel dependencies deleted. Context key: compact pin, D, trivial twist,
sigma, Psi, fixed class levels, stage j, L=a+1, actual weight and branching.
Other twists/local branches, B and C remain untouched.

No local Lean/lake/elan available. Native rh_scan/prune/reduce/auto/frontier
not executed on this compact context. Old native results on distinct pin
are not evidence for this certificate. Actual run 45803534769 state
compute/rh-compact-primitives-replay-20261126/status.json and
outputs/targeted_results.json: six B/C native checks with standard
axioms, A module_1_build exit 124 at 2700.11s, all_requested_checks_ok=false.
Green outer workflow not a successful A replay. Prepared scalar
certificates below; compile using lake env lean on this file in the
compact project. No new PASS or claim of kernel validation.

RESUME HERE: independently audit the HasLogBound guard
log(base+e+1)-log(Omega/g)<=m and the explicit Schur-dual polynomial
bridge at MemberKernels; use same D and stage context. Integrate the
exact gain identity and one-chain bound into the A ledger. Retain all
native prerequisites and request a compact A-targeted replay without
duplicating the existing timed-out whole module.
-/

namespace ThetaRun64

theorem gaussian_exponent (s L : ℝ) (h : L + 1 ≠ 0) :
    -s / 2 + L * (s / (2 * L + 2)) = -s / (2 * L + 2) := by
  have h' : 2 * L + 2 ≠ 0 := by
    intro hz
    apply h
    linarith
  field_simp
  <;> ring

theorem exact_gain_cancel (m k T J K A F a l G H : ℝ)
    (hG : 2 * G = m * (A + k * F))
    (hH : H = m * (J - A + k * (K - F)) - T * a * l) :
    H + 2 * G = m * (J + k * K) - T * a * l := by
  rw [hH, hG]
  ring

theorem pay_arch_error (v : ℝ) (hv : 100 ≤ v) :
    69 + 60 * v ≤ v^3 := by
  have hv0 : 0 ≤ v := by linarith
  have h1 : 100 * v ≤ v^2 := by
    nlinarith [mul_nonneg hv0 (sub_nonneg.mpr hv)]
  have h2 : 100 * v^2 ≤ v^3 := by
    nlinarith [mul_nonneg (sq_nonneg v) (sub_nonneg.mpr hv)]
  nlinarith

theorem final_norm_budget (H R B L q G height : ℝ)
    (hB : 0 ≤ B) (hL : 5 ≤ L)
    (hq : q ≤ B-G) (hh : height ≤ H-R+B) :
    2*q+B+height+2*G+B ≤ H-R+L*B := by
  have h : 5*B ≤ L*B := by
    nlinarith [mul_nonneg hB (sub_nonneg.mpr hL)]
  linarith

end ThetaRun64

#check Data.weylNormSq_Bmu_le
#print axioms ThetaRun64.gaussian_exponent
#print axioms ThetaRun64.exact_gain_cancel
#print axioms ThetaRun64.pay_arch_error
#print axioms ThetaRun64.final_norm_budget
