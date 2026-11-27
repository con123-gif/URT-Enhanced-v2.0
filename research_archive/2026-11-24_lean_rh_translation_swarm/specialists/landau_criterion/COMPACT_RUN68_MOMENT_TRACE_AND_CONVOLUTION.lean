import New.Filling.Moments
import Mathlib.Tactic

/-!
# RUN68: central-projection trace and off-Bessel moment transfer
27 Nov 2026. Human source-matched argument with retained native suppliers;
not a new kernel replay. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, current manuscript,
AGENTS, swarm and handoff reviewed. Latest peers f5180dc9,08696edb,
dfa8fce2,9f17e4416,5ddf30c7,d0a3d115,41c63681. RUN67 bc57e009
supplies the bottom inequality; manuscript explicitly retains lower
trace control. Do not repeat the positive-type determinant lemma.

## 1. Bottom mass to conjugacy-averaged phase
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444,
re_trace_besselS_le; TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111,
floorZeroForm_le_main_term; FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9.
Choose T exactly as the star-stable union of both sets of chosen places.
Use the actual standard-level F provided by exists_isFillingLevel,
K integral unitary, K0=K(g), M the native group Haar, u=M(K)>0,
v=M(K0)>0, n=rho+1. Both masses finite. Write chi=phase F.g.
For each s in the i-th residue factor take a lift sigma_s of its
single-coordinate embedding, using reduction_surjective and
reduction_eq_iff. The right K0 cosets sigma_s K0 are disjoint.
For y in K the level is normalized by y; phase is invariant under
the requisite K0 multiplication. Hence on each coset the inner
integral in floorZeroForm is constant, equal to u*a_s with
a_s=u^-1 int_K chi(y sigma_s y^-1) dM(y). In particular
    v*u^2 sum_s |a_s|^2 <= floorZeroForm(K).
Use RUN66/67 bottom at t=0:
    floorZeroForm(K) <= u*v*(u+w*2^-n),
where w=vol(R minus units)<=1 under normalized additive Haar.
The native inv_two_pow_le_groupMeasure gives 2^-n<=u.
Consequently sum_s |a_s|^2 <= 2. All u,v factors cancel
before Cauchy--Schwarz. No upper bound on u is needed.

## 2. Identify the actual trace and pay only the idempotent mass
AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1,
amplitudeSum_besselU_mul and amplitudeSum_besselS_one.
For the lift l=k sigma_s k^-1 of the conjugated residue
element, the trace of the normalized Bessel amplitude over
inverse reduction is D_c chi(l), as follows from the source
support dichotomy. If l has a Bessel-unipotent representative
mod K0, use psi_simpleRootSum_eq_unipotentChar and
amplitudeSum_besselU_mul on the identity block, which is
nu times the identity by amplitudeSum_besselS_one; dividing
by nu leaves D_c times the phase. If no representative exists,
a hypothetical rational Bessel term on a diagonal class
has decomposition u*toBesselH(delta). The middle part
c.out^-1 stdEmbFin(delta)c.out is integral by the native
mem_unitaryLevel_of_besselU_mul. Reduction is identity at the
OTHER level prime, and eq_one_of_reduceAt_eq_one forces this
middle part to be 1 by the native rigidity hypothesis. Thus the
lift is congruent to a Bessel-unipotent element, contradiction.
This retains the reduction rigidity and lift/support lemmas;
it does not assume all Bessel rational terms are unipotent.
Centrality of x means x(k_i s k_i^-1)=x(s). Reindex the
finite sum for each k and then average over K. The actual
weighted trace is therefore D_c sum_s x(s) a_s, without
assuming the individual phase itself is conjugacy invariant.
Self-adjoint idempotence in the group algebra gives exactly
    sum_s |x(s)|^2 = (x*x)(1) = x(1) in R.
Thus, with Re x(1)<=b^-8/2,
    Re trace <= D_c |sum_s x(s) a_s|
             <= D_c sqrt((b^-8/2)*2) = b^-4 D_c.
This supplies re_trace_besselS_le under its original native
hypotheses, including both level primes; no independent proof
of the lower rigidity supplier is asserted.
Readable companion grh/src/New/Spanning/Unfolding/Moments.lean
05ebe97ed1068478917a25ae4afd41be63b839a4,
re_sum_coeff_mul_trace_besselTranslate_le, checked as clarification.

## 3. Off-Bessel row norm: exact unitary convolution
Lib/General/Groups/CentralConvolution.lean
8947c355031e81aa27d174cc6d4fb0a97d5267ef, IsCentralProj.sum_norm_conv_le.
Let H=S.GRes, J=reducedImage besselS, phi=single_i.
On ell^2(H,V) put L_t f(s)=f(phi(t)^-1 s).
L_t is unitary by reindexing; C_x=sum_t x(t)L_t has
C_x^2=C_x and C_x*=C_x (substitute t^-1).
Therefore ||f||^2=||C_x f||^2+||(1-C_x)f||^2.
This proves the actual contraction for arbitrary V, also
when phi is not injective. It is NOT an l1 bound on x.

For the SAME S and i use the unnormalized complement
amplitude A(s) as the matrix over all class/coordinate pairs.
Set Omega={s: s_(i+1) equals j_(i+1) for some j in J}.
It is invariant under left phi(t); hence for s in J we
may replace A by its restriction f=1_Omega A inside C_x.
Let Y(s)=||C_x A(s)||_HS^2/nu^2.
For each sigma in J, choose for every class d a Bessel
term eta_d over (d,sigma,p(d)), by exists_besselS_mem_termsOver.
The class map p is injective: two coincident target classes
give eta_c eta_d^-1 over (c,1,d), and the identity-block
lemma forces c=d. It is a permutation by finiteness.
Use amplitudeSum_move with identity on the left and eta_d
on the right to transport the block over phi(t)^-1 to
phi(t)^-1 sigma (or reverse the transport by eta_d^-1).
The local Bessel covariance is multiplication by the
tensor product of the unitary rep matrices, times the
unit-modulus unipotent character; it is independent of t.
The complement is stable under these Bessel moves. Hence
the same unitary block transport commutes with the sum over
t, and permuting p gives Y(sigma)=Y(1). This is the actual
class reindexing in sum_norm_amplitudeSum_le; retain the
native choice, covariance and absolute-convergence inputs.
No equivariance of arbitrary truncated amplitude is assumed.
Combining this with the contraction above gives
    |J| Y(1) = sum_(sigma in J) Y(sigma)
      <= sum_(s in H) ||C_x f(s)||_HS^2/nu^2
      <= sum_(s in Omega) ||A(s)||_HS^2/nu^2.
Apply the native energy_compl_besselS_le at i+1, whose
right side is b^-12 besselEnergy = b^-12 |J| D_c.
Since 1 in J, cancel |J| and obtain Y(1)<=b^-12 D_c.
If r_a is the l2 norm of row a of C_x A(1)/nu, then
    (sum_a r_a)^2 <= D_c sum_a r_a^2
      = D_c Y(1) <= b^-12 D_c^2.
Therefore sum_a r_a<=b^-6 D_c<=b^-4 D_c (b>=1000).
This proves the source's weaker row bound. The off-Bessel
energy estimate itself remains an essential retained supplier.

## 4. Actual spread consumer
Normalize P=(c nu)^(-1/2) Q using the exact Petersson
amplitude identity. For each bad central projection E_i
the loss is ||E_i P||_HS^2=Re tr(P* E_i P). The Bessel
part is at most b^-4 D_c by section 2; the complement
trace is bounded by the sum of row norms in section 3.
Thus each loss is <=2 b^-4 D_c. Since the two projections
commute, R=(1-E_0)(1-E_1) and
    1-R=E_0+E_1-E_0 E_1.
The last product is an orthogonal projection; its trace
against PP* is nonnegative. Thus ||(1-R)P||_HS^2
<=4 b^-4 D_c. For x=1 the same row estimate at identity
bounds the Gram defect in finrank_sub_le_re_inner_dyadSum,
because the normalized Bessel contribution is exactly I.
Total nonvariance payment <=5 b^-4 D_c. The existing
positive-type second moment and rank estimate give the
native remaining half(1+phi+9 b^-4)D_c, so the sum is
half(1+phi+19 b^-4)D_c as required by
Fits.exists_translate_finrank_comap_le. This last step
reuses the manuscript's prior variance proof, not a new
proof of energy_fixingSet_le or bad_share_le.

## Local dependency and verification ledger
Original visible graph: B -> FillingTheorem -> Moments.Fits
-> {re_trace_besselS_le -> bottom + lift/rigidity + character,
sum_norm_amplitudeSum_le -> covariance + CentralConvolution +
energy_compl_besselS_le, sum_le_of_positive_type, variance}.
Reduced human graph: same leaves; exact Haar and |J| factors
cancel and the two bad projections combine into one trace loss.
No global elaborated edge retired. Keep all previously open
A/C, exact finite frequency and energy_fixingSet, complement
energy, group rigidity, absolute unfolding and Rallis inputs.
Context cache key: compact pin, SAME S,F,T,K,K0,i,x,nu,J,
class representatives and Haar; no mixing of distinct witnesses.
No graph/axiom archive overwritten. No URT premise.
Local command -v lean/lake/elan returned none. Historical
CI status files b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
and 7da354941e402b6f8b364ed03d8c5c82d27b7717 actually re-read:
old-pin passes 45577239749 and 45576756833. Not verification of
this compact result. No new native scan/prune/reduce/auto/frontier
execution or numerical test. Prepared scalar certificates below;
independent audit and shared compact replay required.

RESUME HERE: integration merge these two moment suppliers
into the existing variance/positive-type chapter. Audit the
lift rigidity and unitary right-transport orientation. Continue
the actual energy_compl_besselS_le and energy_fixingSet_le
caller, especially the noncoherent link and arithmetic support
estimates; preserve all open primitive suppliers.
HANDOFF TO integration, positivity geometry, audit and kernel.
-/

namespace CompactRun68

theorem bottom_cancel (u v w a Z : ℝ)
    (hu : 0 < u) (hv : 0 < v) (hw : 0 ≤ w) (hw1 : w ≤ 1)
    (ha : 0 ≤ a) (hau : a ≤ u)
    (h : v*u^2*Z ≤ u*v*(u+w*a)) : Z ≤ 2 := by
  have hwa : w*a ≤ u := (mul_le_mul_of_nonneg_right hw1 ha).trans (by simpa using hau)
  have h' : v*u^2*Z ≤ v*u^2*2 := by
    calc
      _ ≤ u*v*(u+w*a) := h
      _ ≤ u*v*(u+u) := mul_le_mul_of_nonneg_left (by linarith) (by positivity)
      _ = _ := by ring
  exact (mul_le_mul_left₀ (by positivity : 0 < v*u^2)).mp h'

theorem row_budget (d y R a : ℝ)
    (hd : 0 ≤ d) (hR : 0 ≤ R) (ha : 0 ≤ a)
    (hy : y ≤ a^2*d) (h : R^2 ≤ d*y) : R ≤ a*d := by
  have hs : R^2 ≤ (a*d)^2 := by
    calc
      _ ≤ d*y := h
      _ ≤ d*(a^2*d) := mul_le_mul_of_nonneg_left hy hd
      _ = _ := by ring
  nlinarith [mul_nonneg ha hd]

theorem two_bad_budget (a d e0 e1 e01 : ℝ)
    (h0 : e0 ≤ 2*a*d) (h1 : e1 ≤ 2*a*d) (h01 : 0 ≤ e01) :
    e0+e1-e01 ≤ 4*a*d := by linarith

#print axioms bottom_cancel
#print axioms row_budget
#print axioms two_bad_budget
#check Filling.re_trace_besselS_le
#check Filling.sum_norm_amplitudeSum_le
#check Filling.energy_compl_besselS_le
#check Filling.Fits.exists_translate_finrank_comap_le
#print axioms Filling.re_trace_besselS_le
#print axioms Filling.sum_norm_amplitudeSum_le
end CompactRun68
