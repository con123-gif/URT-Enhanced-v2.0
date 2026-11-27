import New.RealPlace.LocalTheorem
import Mathlib.Tactic

/-!
# RUN80 — unequal heads: one Fourier calculation and exact scale product
27 November 2026. B3 source-matched conditional human derivation and
prepared helper certificates, NOT compiled. RH OPEN.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read mission 3adc76221a978016e3505cdf3e36ad688354d7d7, spine
4878ea106b791c42b5f5a45810162de59701c4d9, ledger
01fa22a6b12abad5ccf580d2621f82be3bf70c13, AGENTS, continuity,
swarm protocol, handoff and lane RUN79 (blob 1b7b709e08397f7672dc1367b8e6896f31711c81).
The E1 analytic criterion is already audited; no duplicate Landau proof.
The new B2 shared receipt is separate from the present B3 step.

## Actual caller and exact phase
LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6,
418-end: Gauge.formModulus_sq_le_of_heads, consumed by TopFloor.lean
9762970967aef90b3a4e025b7f2891d892c70111, 364–367.
Keep all native hypotheses: place P, hermitian-unit split Gram, Haar
group measure, F.IsCut W, j<=rho, Gauge.IsHead j p, x in F.positions,
j=i+1, xi a UNIT satisfying xi=g_level^-1 (p_i^-1-q_i^-1).
Neither q a head nor global equality of characters is inserted here.
Let d=w_q^-1 w_p. For s in floorUnipotent i, only the i-th simple
root entry survives (FloorGroups.lean ec03810781f335ba1c19f6b818b015f6d4014bac,
floorUnipotent_superdiag_eq_zero). The row/column diagonal ratio
of d on this entry is p_i/q_i: the next frame coordinate is fixed
because j=i+1. This follows from Size.lean
3b57ba677471f6d26fceca1a7990eaac9bffa3db, 29–34 coe_weylRatio.
With fw=simpleRootSum and epsilon=1, EXACTLY
  g_level^-1 (fw(d s d^-1)-fw(s))
   = g_level^-1 (p_i/q_i-1) fw(s)
   = (-xi*p_i) fw(s).
Thus use alpha=-xi*p_i, u=p_i^-1 in
Gauge.parseval_heisenbergMeasure_of_box (WeightPlancherel.lean
65619443ca5867bf45af038448a16dc1262103fd, 194–220).
Their product is -xi, so md(alpha*u)=md(xi). In the actual
Fourier transform the parameter is -alpha*star(u); its modulus
is likewise md(xi), by the place md invariance under star and neg.
Do NOT use alpha=xi or replace u by 1: that loses the Jacobian.
Equal heads are not covered: xi must be a unit, and that other
branch belongs to RUN79 / formModulus_sq_le_of_char.

## One support chart per centred comparison
Put n=rho+1, P_l=F.floorWeight l, I_l=F.invWeight l,
K_l=F.upperPairing l k, K'_l for the actual translated kernel k'.
Use Level.formIntegrandOne_eq for weight 1.
For fixed g define the source's
  r(g)=P_j(g,x) I_i(x,w_p(i) g),
  U(g)= (infinity * I_j(x,w_p(j)g))
         min (r(g) |K'_j(g,gx)|^2).
On U(sg)!=0 with s in floorUnipotent i, both w_p(j)sg and sg
are near at j (second from k'.isNear_of_upperPairing_ne_zero).
The common-chart theorem supplies t_s in GT j, with
t_s w_p(j)sg of matrix size 60n^2 and t_s sg of size 99n^2.
Also p_i has size 10n from Size.head_entries_mem_ofSize using
the native near witness. Retain its head and box premises.
These are exactly the three components of the support set in the
native invocation of parseval_heisenbergMeasure_of_box.

For centre m in that support use t=t_m in Q_j intersect GT i,
q=m in unipotentBelow j. For another s in the support, the
required output column of (t m (t s)^-1 - 1) at eStar i equals
the column of H_m H_s^-1 - 1 where H_a=t_a a g.
Indeed t_m,t_s in GT j fix this column (and so do their inverses).
Take the auxiliary nu=1. Native proof is the simp of mul_apply
with mem_floorGroup for the two charts. The factor u^-1=p_i
is exactly the size-10n multiplier. The elementary size rules
HasMatSize.inv (+4), mul (+1), sub (+1) give the conservative
sizes I=99n^2, J=198n^2+10n+6 for the input and output of Parseval.
Their exponent is <=34400 n^3 <= 10^6 n^3 for n>=1.
This uses the SAME centre m for all s; choosing a separate
centre for each s would not prove the fibre bound.
The r-weight is invariant on the required Heisenberg translates:
P_j by Q_j invariance and I_i by the w_p(i) commutation and
GT i near invariance. Thus U(sg)<=r(g)|K'_j(sg,sgx)|^2.
Apply the existing sliced Plancherel supplier via the actual
parseval theorem, not a second proof of Fourier analysis:
  int U(sg) d eta_i(s)
   <= r(g) (c/md xi)^card(iota) fl_i(p_i^-1)
      globalConst int |K'_(j+1)(sigma g,sigma gx)|^2 d theta_j.
The last energy is <= weightedSquareSum(k',j,g)/P_j(g,x)
by FloorKernels.lean 594b1553ed02ba5c074180fb32d0f5215918ad52,
23–26. Cancel the positive finite P_j with r exactly, leaving
  int U(sg) <= (c/md xi)^card(iota) fl_i(p_i^-1)
     globalConst I_i(x,w_p(i)g) weightedSquareSum(k',j,g).
No new factor involving md(p_i) in the Fourier frequency.

## One Cauchy–Schwarz and the stack product
Set C_l=prod_{a<l} fl_a(p_a^-1), G=globalConst,
Z_l=selfNorm(l,k), Z'_l=selfNorm(l,k'), K=(c/md xi)^card(iota).
On the nonzero support of the weight-1 form at y=w_p(j)g,
P_i(y,x)=P_i(w_p(i)g,x) because floorWeyl i lies in GT i
and hence Q_i; both inverse weights agree with actual reciprocal
weights on their near sets. On that support
 |formIntegrandOne(y)|^2
  = U(g) * weightedSquare(k,i,y) * I_j(x,g).
The zero branch requires only <=, not equality; retain the
infinity-times-indicator cutoff (no arbitrary infinity cancellation).
Integrate by Cauchy–Schwarz in stack measure 0 j. First factor:
 int weightedSquare(k,i,y) I_j(x,w_p(j)^-1 y)
 <= C_j G int weightedSquare(k,i,y) d theta_[0,j-1]
 <= C_j G Z_0.
Use lintegral_mul_invWeight_le with star_head, Q_j invariance,
near support and selfNorm_eq_add_succ at i.
Second factor: translate U(w_p(j)^-1 y) to U(g) using
lintegral_stackMeasure_mul_left (LevelGauge.lean
05b4a710e4192b2f3d289a8e52161a6d12a2866e, 226–232).
Its invariance under GT j follows from upperPairing invariance,
commutation and the weight/near invariance, not Haar invariance
of an arbitrary stack. Split the ascConv at i; apply the last-floor
bound above, then lintegral_mul_invWeight_le at i with b=j to
weightedSquareSum(k',j). This gives
 int U <= K fl_i(p_i^-1) G C_i G Z'_j.
The decisive exact factor identity is
  C_j*C_i*fl_i(p_i^-1) = C_j^2       (C_j=C_i*fl_i).
The product of the two Cauchy–Schwarz factors is precisely
  K C_j^2 G^3 Z_0 Z'_j = K selfNormProduct(j,p,q,W,W,x).
No extra floorModulus factor, no extra geometric exponent
at each previous floor. The weight-1 form identity gives
  formModulus(j,p,q,W,x,1)^2 <= K selfNormProduct.
All equalities/cancellations are on nonzero supports with finite
positive individual weights; ENNReal general cases and measurability
are retained from the source. This is the human conditional assembly
of the actual unequal-head caller, not a compiled replacement.

## Dependency and verification ledger
Original source-visible edges:
B3/TopFloor.enorm_floorForm_le -> Gauge.formModulus_sq_le_of_heads
 -> {formIntegrandOne_eq, isPairingKernel_self, isPairingKernel_translatePairing,
 selfNorm_le_selfNorm_zero, selfNorm_eq_add_succ, sq_lintegral_le,
 lintegral_stackMeasure_mul_left, stackMeasure_zero_eq,
 lintegral_mul_invWeight_le, ascConv_heisenbergMeasure_succ,
 parseval_heisenbergMeasure_of_box, exists_hasMatSize_of_isNear,
 head_entries_mem_ofSize, lintegral_upperPairing_sq_le}.
Parseval -> {amplitude_support_and_plancherel,
 lintegral_heisenbergMeasure_le, hasFibreBound_floorVolume,
 conjugation and measure transport}; see RUN79 for sliced supplier.
Reduced exposition: exact root character -> common centred support
-> scaled Parseval -> two stack factors -> exact product.
No global node retired; graph here source-visible only, not kernel
export. Context cache key pin,F,T,Gamma,j,i,p,q,W,x,g,xi,
same support/centre/measure and kernel; never share between equal
and unequal head case without checking frequency and chart.
Backtracking rejected replacing u by 1, independently recentering
each output, and applying RUN79 directly to weight 1.
Local PATH and ~/.elan/toolchains inspected: Lean/lake unavailable.
Native rh_scan/prune/reduce/auto/frontier not executed. Helper
certificates below PREPARED, not compiled; exact source theorem
probes and axioms included for existing shared replay, not new axioms.
Historical statuses actually re-read on cathedral-research-state:
45577239749 PASS blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc,
45576756833 PASS blob 7da354941e402b6f8b364ed03d8c5c82d27b7717
(old-pin engine/conditional root only). Shared 46006832164
status blob 9459c0acbb3e68b78e7f46ebb36a45a25ee7647d:
seven energy declarations exit 0, original probes exit 0,
negative control rejected, overall ERROR (recursive graph).
Separate repaired count success per shared receipt
3e895c6d07f50b3b18e3591d288de51c896deef7; no fused B2 proof.
No fresh B3 PASS, no RH theorem shortcut, no URT speed claim.

RESUME HERE: carry both now source-matched real/finite local
Fourier cases into Gauge.lintegral_positions_le and the actual
TopFloor.enorm_floorForm_le shell integral. Check exact headDensity
and reciprocal floorModulus cancellation and retain shell suppliers.
HANDOFF TO integration/editor/positivity/audit and shared native
runner; preserve A/C, B1/B2/B4, D1/E1 and star obligations.
-/

namespace CompactRun80

theorem root_coefficient {A : Type*} [CommRing A]
    (g p pi qi : A) (hp : pi * p = 1) :
    g * (p * qi - 1) = -(g * (pi - qi) * p) := by
  calc
    g * (p * qi - 1) = g * (p * qi - pi * p) := by rw [hp]
    _ = _ := by ring

theorem scaled_frequency {A : Type*} [CommRing A]
    (xi p pi : A) (hp : p * pi = 1) :
    (-xi * p) * pi = -xi := by rw [mul_assoc, hp, mul_one]

theorem floor_product {A : Type*} [CommSemiring A]
    (C f : A) : (C*f)*C*f = (C*f)^2 := by ring

theorem centred_budget (n : ℕ) (hn : 1 ≤ n) :
    100*n*(99*n^2+(198*n^2+10*n+6)+31) ≤ 1000000*n^3 := by
  have h1 : n ≤ n^2 := by nlinarith
  have h2 : 1 ≤ n^2 := by nlinarith
  have h : 100*(297*n^2+10*n+37) ≤ 1000000*n^2 := by omega
  calc
    _ = n*(100*(297*n^2+10*n+37)) := by ring
    _ ≤ n*(1000000*n^2) := Nat.mul_le_mul_left n h
    _ = 1000000*n^3 := by ring

#print axioms root_coefficient
#print axioms scaled_frequency
#print axioms floor_product
#print axioms centred_budget
#check Gauge.formModulus_sq_le_of_heads
#check Gauge.parseval_heisenbergMeasure_of_box
#check Gauge.lintegral_mul_invWeight_le
#print axioms Gauge.formModulus_sq_le_of_heads
#print axioms Gauge.parseval_heisenbergMeasure_of_box

end CompactRun80
