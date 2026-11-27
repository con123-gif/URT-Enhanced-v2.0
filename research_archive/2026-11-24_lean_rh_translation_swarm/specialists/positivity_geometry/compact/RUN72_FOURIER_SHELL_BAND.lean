import New.RealPlace.BandLimits

/-!
# RUN72 — source-matched Fourier phase, shell summation and head-band conversion
27 Nov 2026. Human derivation conditional on retained chart/fibre/measure
suppliers; Lean scalar certificates prepared, NOT executed. Credit Levent
Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission current blob 9f4a2272265e847b3a46422b02d4b37e976bee10; previous lane
9ce5a9fb9fc566336809b2078608d45fdd09fdb5, editor 327ee638c39498d35dd0d8ae790d24c6107426c0.
No duplicate one-vector work (Landau 6526a8e7). The B consumer is
hasBandLimits_of_isCutBessel, not the RH theorem imported as a premise.

1. Equal-head character bound, LocalTheorem.lean 671350f97491467f09b80eafa0df13685dd8ddc6
lines 368–404 (read with definition 49–65), WeightPlancherel.lean
65619443ca5867bf45af038448a16dc1262103fd 141–193.
Fix the actual j,p,q,x, cut W and level; write K(sigma) and L(tau)
for the two upper pairings on floor j+1, with g and w_p^-1 g respectively.
Their product is precisely formIntegrand, after cancelling sigma
against (sigma w_p tau^-1)^-1. Let v_sigma = sigma^-1 f_(j+1).
The phase is exactly h(v_sigma,v_tau), since sigma and tau preserve
the form. On the nonzero product support, choose the SAME t in GT_j
given by exists_hasMatSize_of_isNear; h(t v_sigma,t v_tau)=h(v_sigma,v_tau).
The size support lemma gives both vectors in the prescribed box;
dot-product and Gram size bounds put the phase in the domain of hphi.
Replace eta by xi there only, and factor the double integral as
   I(g) = int K(sigma) conj(A(t v_sigma)) dtheta_j(sigma),
   A(v) = int psi(-xi*h(v,t v_tau)) L(tau) dtheta_j(tau).
This uses add-character inversion and conjugation, not absolute
values inside both phase integrals. Cauchy-Schwarz in sigma, then
push the sigma measure forward by t v_sigma (orbitPoint law).
Apply amplitude_support_and_plancherel at -xi with the SAME gauge
and floor quadric (hasFibreBound_floorQuadric). Its frequency loss is
(c/md xi)^|iota|, because md(-xi)=md(xi). Apply the upper-pairing
square estimates to the resulting two unweighted square integrals;
the floor weights cancel in the denominator after using
sq_lintegral_le_selfNormProduct. The latter comes from CS on stack
measure and the two weighted inverse-floor integrals. This is the
actual formModulus_sq_le_of_char bound, retaining exact kernel laws,
support chart, fibre, weightedSquareSum and weight-integral inputs.
In particular no second Fourier-loss factor is introduced.
The amplitude lemma itself uses the orbit-point pushforward: upper
pairing factors through the orbit point by unitri invariance, restrict
to size j+6, choose the native fibre chart K and disintegrate. In each
chart the Gram matrix in floorBasis makes the pairing with the free
orthogonal variables a Fourier character; the remaining two coordinate
blocks contribute phases of modulus one. Cauchy-Schwarz on the finite
chart fibres, Plancherel in free coordinates, and the supplied density
majorant give the single factor c/md xi per coordinate. Retain
setLIntegral_le_of_hasFibreBound, the exact chart law and density
bound; this is not an independent proof of those geometric suppliers.

2. Unequal-head bound, LocalTheorem 405–443, WeightPlancherel 194–221.
For j=i+1 use d=w_q^-1 w_p. On the radical N_i only its i-th simple
root contributes. Conjugation scales that root, so with
xi=g^-1(p_i^-1-q_i^-1), u=p_i^-1, the twisted upper pairing evaluated
under n in N_i has the frequency -xi*p_i (the native sign). Therefore
the scaled Fourier parameter in parseval_heisenbergMeasure_of_box
is (-xi*p_i)*p_i^-1 = -xi EXACTLY, before estimating any norms.
This leaves (c/md xi)^|iota|, not an extra head-dependent frequency
factor. The remaining modulus fl_i(u) is exactly the one required
in selfNormProduct. Use the native weight ratio
r(g)=floorWeight_j(g,x)*invWeight_i(x,w_i(p)g);
on the support of the second upper pairing use u(g) as in source
(the min with infinity times invWeight_j ensures support).
Split selfNorm_i from selfNorm_0 using its additive successor formula,
CS on the product, move the Weyl element through the lower stack
using stackMeasure_mul_left, and split ascConv at i. The actual
centred-box hypotheses are supplied by exists_hasMatSize_of_isNear,
head_entries_mem_ofSize and the lower-unipotent invariance; these
must be retained, not replaced by global Fourier transform of the
kernel. Apply parseval on N_i with the frequency above and the
weight r(g). Its floorWeight_j cancels the inverse factor in the
first square; apply the two inverse-weight integral bounds and
combine to obtain the same formModulus² <= (c/md xi)^|iota| D_j.
This is the human proof skeleton of the native head caller,
conditional on centred-box verification and the chart/weight
supplier lemmas; not a new independent proof of those suppliers.

3. Shell summation, ComplexShells.lean 351cfdf7fa54238f79b1b950c3532feef1f74f53
formConst_mul_lintegral_le lines 64–124, and LocalTheorem 326–367.
Use n=varrho+1, k=s+3n+2, L>=rho>=4, t>=1,
s>10^9 n^3; RealPlaceSizes in ComplexGauge.lean
86c2d26bfaf34292de7d1e79c1634b020b26c1f3. Let
T_i=t L^(11 n i), L'_i=T_(i+1)^(99 n).
The native position boxes for gauges L'_i cover G (each matrix
entry of x-1 finite, L>1), and successive differences are disjoint.
For i>=1 the support/cap implication in hasMatSize_sub_one_of_floorValues
gives a floor-volume <= vol(ball(0,1/T_i))=pi/T_i^2:
otherwise the point belongs to the previous box, contradiction.
Use formMajorant_sq_le with the quadric floor-mass bound. The native
local consequence on this shell is
   f^2 <= e_i^2 D_j, e_i=(pi rho^24)^k rho^(9999 n)/T_i^s.
For i=0 and t>1 use the hypothesis of formConst_mul_lintegral_le
instead; for i=0,t=1 use uncapped floor mass, exactly as native.
The shell cap and quadric constants are retained geometric inputs.

Apply lintegral_positions_le with this e_i on each difference;
it follows by taking square roots, then Cauchy-Schwarz in x and
the two lintegral_selfNorm_le bounds with the Weyl-ratio transport.
The input pairingNorm product is <= (epsilon*(lambda*|I|)^2)^2
by pointwise inner-product CS, quotient Haar law, and
||F||_2^2<=|I|, ||W'||_2^2<=epsilon² |I|.
Thus formConst cancels (lambda*|I|)^2 EXACTLY. The place has
c=pi², md(z)=|z|² (ComplexPlace.lean
74d2fd4581e30ba76a2c6dbd7604848bf7e6f3d0); floorModulus at g=1
is 1. Its c^(|iota| varrho) factor times pi^k is <=
pi^((2varrho+1)k), since |iota|=k-1. This gives Theta=bandConst
without an extra factorial or Haar loss.
With Lambda=L², Lambda'_i=(L'_i)², the shell-dependent power
(Lambda'_i)^(50000 n²)=T_(i+1)^A, A=9900000 n³.
Consequently the shell sum before uniform simplification is <=
   Theta rho^(24k) epsilon *
   L^(3000000 n³+2+9999n+11n A) * t^(A-s)
   * sum_(i>=0) (L^(11n(A-s)))^i.
Here rho^(9999n)<=L^(9999n). Since s-A>=1 and L>=2,
the ratio is <=1/2, so the series <=2<=L.
The exponent 3000000 n³+3+9999n+108900000 n⁴
is <=10^9 n⁴ already for n>=1. This proves the stated shell
majorant using the native local shell bound, including absolute
integrability at t=1,epsilon=1; both formConst and headDensity
are positive finite for all unit heads. No assumption of prior
global integrability. This isolates the exact cap supplier rather
than silently dropping it.

4. Frequency and head damping, ComplexShells norm_floorForm_le.
EichlerFlag.lean definitions 68–72: D_K(r)=r^K min(1,r^6),
H_K(p)=product over a<j of D_K(|prod_(l<=a) p_l|^-1).
Choose K=n^6 and gauge from exists_gauge_isHead. Its elementary
max recursion can be seen as follows. If each prefix norm z<=R,
z^-1>=R^-1, R>=1, then R^(K+6) D_K(z^-1)>=1 AND
>=z^-K. Hence adding max(L_old,z^-1) at each step preserves
the product bound
 L^K <= R^((K+6)(2j+1)) H_K(p)H_K(q).
Initial L=rho<=R. If a prefix norm exceeds rho^(9n), the
native minors_mem_ofSize gives empty nonzero integrand support
via formMajorant_sq_le sigma=0; this exact large-head support
supplier is retained. Otherwise R=rho^(9n).
The local Fourier estimate for y!=0 at C gives frequency
(pi/|y|)^(2(k-1)) for the square. Take t=max(1,rho^24*|y|).
When t>1,
  (pi/|y|)^(k-1) <= (pi rho^24)^k / t^s
since t>=1 and k-1>=s; the shell lemma applies.
With u=k-n^7>=0 and A=9900000n³, s-A>=u+6, since
n>=10^8 and k=s+3n+2. Therefore
 rho^(24k)*t^(A-s)
 <= rho^(24*n^7) * (rho^24/t)^u * t^(-6)
 <= rho^(24*n^7) * D_u(|y|^-1).
This is valid also for t=1 (both comparisons remain valid).
Here rho^24/t<=|y|^-1 and 1/t<=min(1,|y|^-1).
The gauge exponent 10^9 n⁴<=n^6. After substituting
rho=b^(6n+2), the total b exponent is bounded by
 (6n+2)*(9n*(n^6+6)*(2j+1)+24*n^7) <= 2000*n^9
using j<=n-1, n>=10^8 (indeed n>=2 suffices for this last
polynomial bound). Hence
   |formConst * floorForm_j| <=
    Theta b^(2000 n^9) D_(k-n^7)(|y|^-1) H_(n^6)(p)H_(n^6)(q).
This is exactly the band field at the actual HasBandLimits caller;
use y=xi from the appropriate character/unequal-head case, and
combine with RUN71's bottom energy, recursion and top Gram.
The band estimate is conditional on the explicitly named
geometric/weight/chart suppliers, not a complete human proof of B.

Original and reduced global graphs, pending nodes and axiom records
preserved. Local source chain: enough_forms -> filling ->
exists_besselSystem -> hasBandLimits -> {norm_floorForm_le,
formModulus_sq_le_of_char, formModulus_sq_le_of_heads} ->
{formConst_mul_lintegral_le, amplitude_support_and_plancherel,
parseval_heisenbergMeasure_of_box, floor weights and cap suppliers}.
Cache context: pin, same level, W, gauge, j,p,q,x and actual xi;
no global native node deleted. Native lean/lake/elan absent locally;
native engines not run. Fresh CI state branch blob
088cd2ec0e935ee1a282f10096949bcf671cc804 reports six named checks,
standard axioms propext/Classical.choice/Quot.sound, one module
timeout exit 124, all_requested_checks_ok=false, full_RH_replay=false.
No new CI PASS. Scalar checks below prepared only.

RESUME HERE: independent audit of the two phase laws and exact
weight/fibre bridges (WeightPlancherel 20–221, ComplexGauge 126–end),
especially centred-box hypothesis and shell cap. Then the actual
B noncoherent pair and sharp absolute-unfolding consumer, keeping
Landau RUN71 one-vector normalization separate and C Rallis distinct.
HANDOFF TO integration/editor, audit and native runner. Human RH
reconstruction incomplete.
-/

namespace RHPositivityRun72

theorem shell_exponent_budget (n : ℕ)
    (h1 : n ≤ n^4) (h3 : n^3 ≤ n^4) (h4 : 1 ≤ n^4) :
    3000000*n^3+3+9999*n+108900000*n^4 ≤ 10^9*n^4 := by
  omega

theorem phase_scale_cancel (p xi : ℂ) (hp : p ≠ 0) :
    (-xi*p)*p⁻¹ = -xi := by
  rw [mul_assoc, mul_inv_cancel₀ hp, mul_one]

theorem frequency_slack (k s n : ℕ) (hk : k = s+3*n+2)
    (hs : 9900000*n^3 + (k-n^7) + 6 ≤ s) :
    (k-n^7)+6 ≤ s-9900000*n^3 := by omega

end RHPositivityRun72

#check Gauge.formModulus_sq_le_of_char
#check Gauge.formModulus_sq_le_of_heads
#check Gauge.amplitude_support_and_plancherel
#check Gauge.parseval_heisenbergMeasure_of_box
#check IsCutBessel.formConst_mul_lintegral_le
#check IsCutBessel.norm_floorForm_le
#check hasBandLimits_of_isCutBessel
#print axioms RHPositivityRun72.phase_scale_cancel
#print axioms RHPositivityRun72.frequency_slack
#print axioms RHPositivityRun72.shell_exponent_budget
#print axioms IsCutBessel.norm_floorForm_le
