import New.Columns.LocalStatement

/-!
# RUN31 — marked-place transfer and exact local loss, independent audit
26 November 2026. Source-matched human derivation; Lean probes PREPARED,
not compiled here. Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Claude and collaborators. Mission blob
3ea3bdf5c928af39e24a6837eafa3dee9bd409bb, manuscript d76b408556ea55ffbd893072a4beac498b8adb2c.
Read mission, AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES.
Peers c22bb6a0 (marked elementary divisors), 36a56d6c (Schur jet),
837dd3d8 (crystalline integration), a6e9cc7f (B contraction),
bb09b6c2 (bounded native frontier), RUN30 f4015a87 (C audit).
This addresses the independent marked *transfer* supplier, not the
elementary-divisor index estimate or the Schur jet proof.

Source ledger (relative to grh-compact/src):
New/Columns/LocalStatement.lean 9d5bd0d698b0db2850cbd306d8d400d7e99a3547
New/Columns/JetExponentBound.lean bedef08c7c1707f74e9afce0c8008b88ba37dc8a
New/Exchange/CrudeModularData.lean 2be49b2690280e070d21691f8a569fc81e113b2b
New/Curve/LiveSum.lean 3efab3907b063bb2c59d182df981ad62862f8a1b
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
Lib/Weil/Unramified/HeckeTransfer.lean 9145e115beff2378fb879e699ce56a40149f62cd
New/Columns/MarkedPrimeType.lean 5433d457d06b8f0e209209be1407fe1971ef86f8

## 1. Two distinct permutations, not an assumed top-preserving p-shift
Fix actual D, small nonsplit p, marked Lambda, and l in Lambda.
Hence p is served, chi_K(p)=-1, o0 odd, p not short. Set
u=placeOfInt(-p), v=u^o0. Multiplication by u on all infinite
places interchanges the prime induced at sigma and its conjugate,
by inducedPlace_neg_pow_mul_of_odd. It need not preserve tops.
If either induced prime belongs to Lambda, neither sigma nor u*sigma
is thick, by IsMarked.notMem_thick and the interchange. Therefore
w_j(sigma)=w_j(u*sigma)=b2+j*h+h2 for every j, on this support.
Reindex the second sum by the permutation sigma -> u*sigma to obtain
  sum_sigma 1_{q(sigma) in Lambda} G(w_j(sigma),q(sigma))
  = sum_sigma 1_{bar q(sigma) in Lambda} G(w_j(sigma),bar q(sigma)).
Outside this support both reindexed terms are zero. This is the
actual IsMarked.sum_inducedPlace_sub_star_eq_zero for arbitrary real G.
It applies separately to each l by G(c,q)=1_{q=l}*(-c), including
the actual unit-norm character calculation in exists_hecke_transfer.
The two local valuation weights have opposite signs; their exponent
sum is ZERO before any bound, not merely nonpositive. The local
valuation normalization and character norm formula remain native
premises (including unramified twist at l).
For a *full* mark use v, not u, on tops: v preserves tops because
o0 is the order of the image of u modulo N0; v still exchanges
conjugate primes since o0 is odd. Full coverage plus disjointness
means the two subsets of tops are complements. Thus
  #even tops = #odd tops, sum_{l in Lambda} A_l = a*#even tops,
  2*#even tops = #tops.
This uses the same full mark as the caller, not a new choice.
For any collision (tau,e) outside evenPlaces, e is odd (native
IsCollision.ne_and_odd_and_dvd also excludes p=d) and the other
top induces the conjugate prime. Exactly one of the two is even:
contradiction. Thus every term of collisionSum is zero and its
entire sum is zero without a tail estimate.

## 2. Integral inverse Hecke polynomial and the exact scaling bound
At stage j+1, set r=ceilLogM(p), n=n_m, k=n_{j+1}-n_0.
Write the residue norm q_l=p^(2h), as in exists_hecke_transfer.
Here 2h=orderOf(u), so h<=f by the finite place-group bound.
The native factorization uses y(e,i) =
  ((p^h)^n_{j+1}/(p^h)^n_e)^i * (p^(2h))^(i choose 2).
Consequently y(0,r)=p^[h*r*(k+r-1)] and
y(j+1,i)=p^[h*i*(i-1)]. These are exact identities, including r=0.
The Hecke transfer identity of polynomials has coefficient-ring
factor Q(U), a product of linear factors with constant term one,
with coefficients in the valuation ring by section 1 and the
explicit nonnegative p-powers in LocalStatement.
For Q=1+sum_{s>=1}q_s U^s, inverse coefficients c_0=1,
c_t=-sum_{s=1}^t q_s*c_{t-s} are integral by induction. No division
by a possibly nonunit Hecke eigenvalue is used. Coefficient
comparison at degree r after multiplying by Q^-1, in the module
of forms, is valid for the polynomial identity for all complex U
(infinite base field); only i<=r occurs. This is the actual
sum_coeff_invOfUnit_smul_eq call.
The scaled output coefficient for i<=r has scalar factor (up to
the sign convention for the Hecke polynomial)
  p^delta * y(j+1,i)/y(0,r),
where delta=r*f*(n+r) by LiveSum. Its exponent is exactly
  E=r*f*(n+r)-h*r*(k+r-1)+h*i*(i-1)
   =r*(f-h)*(n+r)+h*r*(n-k+1)+h*i*(i-1)>=0.
Indeed k<=n by j<m and monotone ranks, h<=f, i natural so
i*(i-1)>=0. The scaling is therefore integral even if the inverse
coefficient vanishes (no taking log of zero). The coefficient
family is independent of x in Psi.support: Q uses only the
common chain characters, ranks, fixed l and j. Preserve all
native spherical and datum support guards and actual Hecke
transfer of pairing; this argument supplies its inversion and
integrality step, not the theta correspondence itself.

## 3. Actual moved mark product and exact stage-loss cancellation
At fixed stage and l, multiply the transfer by p^(A_l-delta).
The resulting operator on the datum has gauge factor at most
p^(delta-A_l) because all its transfer coefficients are integral.
For a list of distinct l, commute operators at different places;
at the active l the relevant double coset index is <=r. The
induction in exists_move_markOperator replaces one mark operator
on the column by one such translated-datum operator and adds
delta-A_l to its gauge exponent. Start with native mem_raises
gauge exponent sum A_l+liftLoss. After the complete list the
sum A_l cancels exactly, leaving #Lambda*delta+liftLoss.
For the chain of m lifts use the SAME ordered product Y every
time, hence Y^m on the input, not independent images per stage.
The translated datum for each stage is common over support of
Psi, and good-datum invariance is preserved by the native
commutation identities. This is the actual gaugeLe_markOperator_pow
caller; it does not require Y to be invertible or commuting across
stages. The local gauge adds exponents, with the finite sum of
integral coefficients bounded nonarchimedeanly.
Write L=loss(p), G=gain(p), T=#(tops intersect evenPlaces)*a/x1.
Native sum_lowColumns_le and le_jetExponent give, at each j<m,
  #Lambda*delta + r sum_even lowColumns_j <= L/m+T,
  J_j >= G/m + T - L/m.
For the latter use chi=-1, collisionSum=0 from section 1 and
le_loss (f logB^2 a/p <= L). Thus
  #Lambda*delta+liftLoss_j <= 2L/m-G/m.
Sum over the same m stages to get exponent <=2L-G, exactly the
actual gaugeLe_Bmu_of_isMarked. This cancels the positive top
term T before bounding and needs no independent #tops estimate.
The native index supplier MarkedPrimeType.hasType_markOperator
and the p^jetCeil branch remain separate premises. At the final
exists_indexDvd_Bmu_divisible consumer the same Y^m image plus
p^jetCeil M has both the index bound and gauge bound uniformly
in twists and good data (p prime to twist level).
No claim that these local calculations discharge Schur jet,
Hecke-transfer representation identities, marked index,
archimedean estimates, or global A.

## Verification and frontier
Executed local SymPy exact identities (not Lean): expand(E-
[r*(f-h)*(n+r)+h*r*(n-k+1)+h*i*(i-1)])=0; simplify
m*((L/m+T)-(G/m+T-L/m))-(2L-G)=0. Both assertions executed
successfully. No local lean/lake executable. No new shared job
launched; protected workflow/registry untouched. Re-read
RUN29 status a56e2d3a and targeted_results 088cd2ec on state
branch: six B/C native probes passed, A JetExponentBound timed
out at 2700.11s; all_requested_checks_ok=false. These are old
partial native results, not verification of this file.
No rh_scan/prune on compact native values here, no global
dependency dropped, no new axiom assumption or RH root imported.
Original and reduced graph ledgers remain untouched. Static
role path: IsMarked.sum_inducedPlace_sub_star_eq_zero ->
exists_hecke_transfer -> exists_move_markOperator ->
gaugeLe_markOperator_pow -> gaugeLe_Bmu_of_isMarked ->
exists_indexDvd_Bmu_divisible -> A; parallel surviving edges:
mem_raises, le_jetExponent, sum_lowColumns_le, full mark,
HasType mark operator, jetCeil, and archimedean height supplier.
Prepared module-local probes below; actual axiom sets unknown
until replay. Native engine checks on old pin do not transfer.

RESUME HERE: integrate sections 1–3 at the actual marked gauge
supplier in A, with the separate u and u^o0 permutations.
Next kernel batch prioritize the smaller JetExponentBound
dependency closure and then LocalStatement, with existing
bounded shared runner; no competing job or guard override.
Retain native mem_raises and marked index proof obligations,
including peer c22bb6a0's Frobenius factors/RootLemma and
interlacing cone. The global star inequality is not newly closed.
HANDOFF TO theta, prime-window, editor, integration, audit, kernel.
-/

namespace CompactKernelRun31

theorem transfer_exponent_identity (r f n h k i : ℝ) :
    r*f*(n+r)-h*r*(k+r-1)+h*i*(i-1) =
      r*(f-h)*(n+r)+h*r*(n-k+1)+h*i*(i-1) := by ring

theorem transfer_exponent_nonneg (r f n h k i : ℝ)
    (hr : 0 ≤ r) (hh : 0 ≤ h) (hf : h ≤ f)
    (hn : 0 ≤ n) (hk : k ≤ n) (hi : 0 ≤ i*(i-1)) :
    0 ≤ r*f*(n+r)-h*r*(k+r-1)+h*i*(i-1) := by
  rw [transfer_exponent_identity]
  exact add_nonneg
    (add_nonneg (mul_nonneg (mul_nonneg hr (sub_nonneg.mpr hf)) (add_nonneg hn hr))
      (mul_nonneg (mul_nonneg hh hr) (by linarith)))
    (mul_nonneg hh hi)

theorem exact_stage_budget (m L G T X J : ℝ) (hm : 0 < m)
    (hX : X ≤ L/m+T) (hJ : G/m+T-L/m ≤ J) :
    m*(X-J) ≤ 2*L-G := by
  have h : X-J ≤ (2*L-G)/m := by
    rw [sub_div, mul_div_assoc]
    linarith
  calc
    m*(X-J) ≤ m*((2*L-G)/m) := mul_le_mul_of_nonneg_left h hm.le
    _ = 2*L-G := by field_simp

end CompactKernelRun31

#print axioms CompactKernelRun31.transfer_exponent_nonneg
#print axioms CompactKernelRun31.exact_stage_budget
#print axioms Data.IsMarked.sum_inducedPlace_sub_star_eq_zero
#print axioms Data.IsFullMark.collisionSum_evenPlaces_eq_zero
#print axioms Data.IsGoodDatum.exists_hecke_transfer
#print axioms Data.IsGoodDatum.exists_move_markOperator
#print axioms Data.IsGoodDatum.gaugeLe_Bmu_of_isMarked
#print axioms Data.exists_indexDvd_Bmu_divisible
