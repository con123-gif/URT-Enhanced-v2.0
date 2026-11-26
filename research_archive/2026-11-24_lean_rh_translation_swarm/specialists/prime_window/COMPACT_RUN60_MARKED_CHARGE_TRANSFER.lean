import New.Columns.LocalStatement
import Mathlib.Tactic

/-!
RUN60 — 26 Nov 2026. Source-matched human reconstruction, prepared
scalar certificates; native replay and independent audit outstanding.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript
2eea9dc47d0e037627e4f4c1894f0bc86426454e, predecessor 747e9219.
Read protocol/queue/expansion/AGENTS/state/continuity/log; inspected
peer 7cc78b2f, fce4be625 (distinct C suppliers), manuscript editor
handoff, and RUN59. Remain on compact A branch, not old Gm or URT.

Source ledger relative to grh-compact/src:
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
  exists_hecke_transfer, mem_raises (95–143),
  exists_move_markOperator, gaugeLe_markOperator_pow, gaugeLe_Bmu_of_isMarked.
New/Curve/JetDivisibility.lean 5f6e6f63dc7bfc35aedc136ae8330510d3493f06
  norm_schurJet_le (65–end), RUN56.
New/Curve/ConjugatesOfJets.lean 8b841d76bb938d8a18fd4341aa832a20b13dd9e0
  norm_jetSeries_le and mem_raises_of_jet_bound (weighted product).
New/Curve/ThetaProducts.lean 044e906a110715710a4a60c0b06d73d70483afda
  thetaProducts_normal_form (86 onward).
Lib/GLn/SchurModule/Hook.lean ab7abf3a41078f15118fab5fc04a07523a0c1c2f
  tableau_col_injective.
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
  sum_inducedPlace_sub_star_eq_zero, sum_lowColumns_le.
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
  IsMarked, evenPlaces, markExponent, lowColumns; liftKernel.
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
  deltaP, kappa, lastEntry.
Lib/Weil/Unramified/SphericalHecke.lean 37493fc793c98f8e31d1d2e101e77a4ac2a4023b
  sum_coeff_invOfUnit_smul_eq; split Hecke operators.

1. Exact sign and charge at the actual mem_raises consumer.
Fix the SAME D,p, marked Lambda, good H, coprime twist, support
element x, stage j and double cosets g_l of ranks i_l<=r=ceilLogM.
The native double-coset decomposition chooses J_l of cardinal i_l
and integral left/right factors; diagonal at l has p on J_l, 1
elsewhere, at conjugate l has p^{-1} on J_l, 1 elsewhere.
This uses the native valuation_p and basicDoubleCoset_eq suppliers,
not an independently chosen diagonal. Crucially the weight embedding
reads the CONJUGATE of inducedPlace(tau) (see mem_raises_of_jet_bound
and source weightEmbedding convention); the exponent of its NORM
is +1_J on even tau, -1_J on conjugate-even tau, 0 elsewhere.
Using the direct embedding instead gives the wrong sign.

Let w=inducedPlace(tau); E=(w in Lambda), O=(star w in Lambda);
these are mutually exclusive. The jet charge in mem_raises is
g(tau,h,b)=1 if (E and h=1 and b notin J_w) or
(O and b in J_star(w)), and 0 otherwise.
For nonempty Lambda, marked implies served, p inert and p!=d.
Every live e is odd, so the partner -p^e tau swaps E/O while
keeping the marked prime and its J. If tau is even, b outside J
charges its height-one box, while b inside J charges the partner
at any height. If the partner is even and both heights are one,
the same dichotomy applies in reverse. This is exactly the hg
predicate in norm_schurJet_le, including all b. For empty Lambda
the exemption antecedent is false (including ramified e=0).
Thus the charge is admissible for every native theta product,
without selecting a new charge for each product.

For a single tableau column of height h, write s for number of
its entries in the relevant J. In the even case the total exponent
from charge + diagonal box norm is EXACTLY
   1_{h=1}(h-s)+s = 1 if h=1, else s.
In the conjugate-even case it is s-s=0. Else it is zero.
The column is injective: a repeated label forces its minor to
have two equal rows, hence zero, hence the chosen basis product
zero, contradicting linear independence over Z (Hook).
Consequently s<=|J|<=r, independently of h. This yields
   total box charge + box norm exponent
   <= sum_{tau even} [kappa(tau,1)+r*lowColumns(j,tau)].
The height-one identity is exact, not r times the number of boxes.
For determinant norm, the contribution is
  sum_tau (1_E |J_w| - 1_O |J_star(w)|) lastEntry(j+1,tau).
It is exactly zero by the native marked symmetry at j+1 with
G(c,w)=|J_w|(floor(n(j)/2)-c), using lastEntry and RUN59.
Also sum_even kappa(tau,1) = sum_{l in Lambda} markExponent(l)
by partitioning the tops under inducedPlace.
Combine norm_schurJet_le with thetaProducts_normal_form (r_scale<=1
from period and piG norm) and norm_jetSeries_le, BEFORE bounding.
The resulting weighted jet exponent is <=
  sum_{l in Lambda} markExponent(l)
    + r*sum_even lowColumns(j,tau) - jetExponent(p,j,evenPlaces).
By mem_raises_of_jet_bound this is exactly mem_raises with
liftLoss as defined in LocalStatement. Keep the integral standard
datum, theta normal form, null-cone bound and diagonal decomposition
as explicit source suppliers; no claim they are proved by the
scalar argument. This fills the outstanding charge-transfer step
between RUN56 and RUN59.

2. Hecke coefficient extraction and denominator budget.
At a marked l let q_l=p^{2H}, H its native residue-degree parameter,
and n_e=rank X_e. With j fixed put
  y_e(i)=p^{H(n_{j+1}-n_e)i} q_l^{i(i-1)/2}.
The source single-stage hecke_transfer_of_pairing gives, by
induction through the actual first e lifts, a polynomial operator
identity B_e(U)=Q_e(U) A_e(U), where the coefficient vectors are
y_e(i)T_i C_e(phi) and y_0(i)C_e(T_i phi), respectively. The
choice of -U*y_e(1) in heckePolyOp cancels the alternating sign.
Q_e is the product in exists_hecke_transfer, with constant 1.
Its coefficients lie in the valuation ring by the native
unramified-character norm estimate I(a) and marked symmetry.
This is conditional on the actual single-stage pairing theorem,
which is not reconstructed here.
Write Q^{-1}=sum b_s U^s; b_0=1 and
  b_s=-sum_{k=1}^s Q_k b_{s-k}.
Thus every b_s is integral, without analytic convergence.
Taking coefficient r in Q^{-1} B_{j+1}=A_{j+1} gives
  sum_{i<=r} c_i T_i C(phi)=p^delta C(T_r phi),
  c_i=p^delta b_{r-i} y_{j+1}(i)/y_0(r).
These coefficients depend on the chain characters and ranks,
not x in Psi.support or the spherical input phi.
For j<m, H<=f via the actual order bound, n_{j+1}<=n_m.
The only denominator has valuation
  v_p(y_0(r))=H*r*(n_{j+1}-n_0+r-1)
             <=r*f*(n_m+r)=deltaP.
This also holds at r=0. Since v_p(y_{j+1}(i))>=0,
c_i integral. The native polynomial identity and the integrality
supplier now have an explicit elementary coefficient extraction.

3. Same-stage transport: exact exponent cancellation.
For one l multiply the above transferred operator by p^(A_l-delta).
Its lifted effect is p^A_l T_r on the input. Its norm factor
is p^(delta-A_l). Operators supported on distinct marked pairs
commute with translations at the other pairs, as used in
exists_move_markOperator. Induct over the SAME nodup list L:
the translated datum exponent adds sum_{l in L}(delta-A_l)
to sum_all A_l+liftLoss; the lift equals the original lift applied
to the ordered product of marked operators. The nonarchimedean
sum bound introduces no coefficient-count factor. For the full
list the A_l cancel exactly, leaving #Lambda*delta+liftLoss.
Induct on j: moving the SAME ordered product Y through j stages
gives C_j(Y^j v); hence at j=m the gauge bound is
  p^(sum_{j<m} (#Lambda*delta+liftLoss_j)).
RUN59 and native le_jetExponent give the RUN55 full-mark budget
p^(2 loss-gain) once all their premises are met. This uses the
same Y, no eigenvector-by-eigenvector or twist-dependent choices.
The index/type bound and level Fourier branch remain separate;
the single-stage pairing identity and its character integrality
premises still need independent human audit.

4. Executed local exact regression (Python 3, finite combinatorial
identities only, not native D or Lean kernel):
from itertools import combinations
from collections import Counter
c=Counter()
for n in range(1,8):
 for r in range(n+1):
  for jj in combinations(range(n),r):
   J=set(jj)
   for h in range(n+1):
    for bb in combinations(range(n),h):
     s=len(J.intersection(bb)); a=h-s if h==1 else 0
     assert a+s==(1 if h==1 else s); c['even_exact']+=1
     assert s-s==0; c['odd_exact']+=1
     assert a+s <= (1 if h==1 else r); c['bound']+=1
   for b in range(n):
    assert (b not in J) or (b in J); c['coverage']+=1
for f in range(1,10):
 for H in range(1,f+1):
  for N in range(2,15):
   for n0 in range(1,N+1):
    for r in range(0,min(n0,5)+1):
     delta=r*f*(N+r)
     v=H*((N-n0)*r+r*(r-1))
     assert delta>=v; c['hecke_scale']+=1
print(dict(c),sum(c.values()))
Observed: even_exact 21844, odd_exact 21844, bound 21844,
coverage 1538 (elementary excluded-middle check only),
hecke_scale 22410, total 89480; no failures.
Lean/Lake absent (command -v checked). Old-pin rh_scan/prune/
reduce/auto/frontier not executed against compact. Original
and reduced graphs/axiom archives untouched. Static contextual
chain: thetaProducts_normal_form + norm_schurJet_le +
tableau_col_injective + marked symmetry -> mem_raises ->
exists_move_markOperator + exists_hecke_transfer ->
gaugeLe_markOperator_pow -> gaugeLe_Bmu_of_isMarked ->
exists_indexDvd_Bmu_divisible -> short_forms -> star_inequality.
No global dependency deletion. Actual CI run 45803534769 re-read
status a56e2d3a and targeted_results 088cd2ec: six named B/C probes
report propext, Classical.choice, Quot.sound; A build timed out
2700.11s, all_requested_checks_ok=false even though wrapper job
success. No new native PASS. Native certificates below are prepared,
not replacements already compiled at the caller.

RESUME HERE: integration combine RUN55/56/59/60 into one exact
marked-gauge proof; audit the conjugate embedding sign and the
single-stage hecke_transfer_of_pairing at its actual caller.
Next prime lane: check actual aggregate hasType_prod_markOperator_pow
and its full-mark uniform IndexDvd consumer, cross-reference
RUN57/58 and theta peer work; do not repeat settled scale estimates.
Kernel lane use approved shared A replay only; retain all axioms
and unresolved standard-data, local pairing, Hecke type and Fourier
suppliers until audited. HANDOFF TO integration, editor, theta,
formal audit, kernel. Human proof remains incomplete.
-/

namespace CompactPrimeRun60

theorem even_height_one (s : ℤ) : (1-s)+s=1 := by ring
theorem odd_charge_cancel (s : ℤ) : s-s=0 := by ring
theorem even_column_bound (h s r : ℕ) (hs : s ≤ h) (hr : s ≤ r) :
    (if h = 1 then h-s else 0) + s ≤ (if h = 1 then 1 else r) := by
  split_ifs with hh <;> omega

theorem hecke_scale_bound (H f r N n0 : ℕ) (hf : H ≤ f) (hn : n0 ≤ N) :
    H * ((N-n0)*r + r*(r-1)) ≤ r*f*(N+r) := by
  calc
    H * ((N-n0)*r + r*(r-1)) ≤ f * ((N-n0)*r + r*(r-1)) :=
      Nat.mul_le_mul_right _ hf
    _ ≤ f * (N*r + r*r) := by
      apply Nat.mul_le_mul_left
      exact Nat.add_le_add (Nat.mul_le_mul_right _ (Nat.sub_le _ _))
        (Nat.mul_le_mul_left _ (Nat.sub_le _ _))
    _ = r*f*(N+r) := by ring

theorem marked_exponent_cancel (A delta loss : ℝ) :
    (delta-A)+A+loss=delta+loss := by ring

end CompactPrimeRun60

#check Data.IsGoodDatum.mem_raises
#check Data.IsGoodDatum.exists_hecke_transfer
#check Data.IsGoodDatum.exists_move_markOperator
#check Data.IsGoodDatum.gaugeLe_markOperator_pow
#print axioms Data.IsGoodDatum.mem_raises
#print axioms CompactPrimeRun60.even_column_bound
#print axioms CompactPrimeRun60.hecke_scale_bound
