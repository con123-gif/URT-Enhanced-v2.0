import New.Filling.CrudeEnergy

/-!
# Compact RUN53 — absolute amplitude convergence, cutoff invariance and cancellation
26 Nov 2026. Human reconstruction of a root-relevant Theorem B primitive,
with prepared scalar certificate, NOT COMPILED.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb (primitive closure directive),
manuscript 60b7d344cd2791eee12edc687692568ebebd989e. Read protocol, queue,
expansion, AGENTS and continuity, and recent peer commits 2a8439aa,5b79a6d9,
c0a35b56,0a45200e,837e9bc7,6bdfdba6,fc278308. No duplicate endpoint redesign.
Primary target B absolute convergence explicitly listed open in manuscript §8.
Source anchors:
New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1
New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058
New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641
New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727
New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea
New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f
New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd
New/Filling/ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5
Lib/General/LinearAlgebra/ExtendColumns.lean 78e4142cc81dbb52e50f39dcb2be4ab1a6c41dc5
New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444.
No import of New.Main or Main.

1. Actual amplitudeAbs_lt_top_and_cut_le: complete analytic aggregation
from the native IsCutPair.exists_majorant and frame-count suppliers.
Fix admissible S,c,s and ANY T, with X_d=T∩termsOver(c,s,d). Write
n=rho+1, k=|kappa|, r=k+2n-1, f=#infinite places, b>=1000, nu>0.
For each v, choose the actual majorant A_v and finite measure mu_v from
IsCutPair.exists_majorant. Put H(y)=prod_v A_v(y_v), mu=prod_v mu_v,
M=mu(univ), D_c=prod_v #I_v=#BesselCoord. All functions nonnegative.
H is left unipotent invariant. Both W sides have product norm <=H.
The local extra multiplier b^(3 r^3 f) where W_full!=W_cut is retained.

Let Q(z)={g: every z_v g_v is InCut}. Product measure yields H(z)<=mu(Q(z)).
For fixed y and g, each nonzero term
 beta_d(gamma^-1 y) 1_{Q(gamma^-1 y)}(g)
has a rational class-unipotent u with u gamma^-1 y g boxed
(exists_classUnip_mul_mem_boxedPoints). Use delta=gamma and representative
gamma'=gamma u^-1, so gamma' is over (c,s,d) and delta^-1 gamma' lies in
classUnip(d). The injective labels are (d,delta), not representatives.
Apply tsum_classCutoff_box_le with y'=y, boxed argument y g, x=1,
and the full real frame space V, dimension 2 f r n. It gives the pointwise
sum <= b^(12 f r n^3), denoted K. Integrating in g by Tonelli gives
 P(y):=sum_{d,gamma∈X_d} beta_d(gamma^-1 y) H(gamma^-1 y) <= K M.
This is a uniform finite bound on each c' sum, on either side, with
no stability assumption on T and no dependence on the number of terms.
The frame-count proof uses the finite separated frame representatives
from the native integral-entry argument and grouping each frame class
by classUnip0. Within each such class the cutoff weights sum at most 1
by the injective map into classUnip and tsum_classCutoff_eq_one.
Retain exact rational frame separation and box covering as native inputs.

Next integrate beta_c(y) H(y) P(y). Unipotent quotient disintegration
(lintegral_classCutoff_mul_prod) gives
 J := sum_{d,gamma} int beta_c(y) beta_d(gamma^-1 y) H(y) H(gamma^-1 y) dy
    <= K M nu prod_v int A_v dq_v
    <= nu D_c b^((12 r n^3+2 r^3) f).
The final inequality is exactly the product of local mass-times-integral
bounds from IsCutPair. ENNReal Tonelli is valid before finiteness. If M=0
the first pointwise bound gives zero and each local majorant is finite
and zero wherever its controlling measure has mass zero, so J=0.
Otherwise use the finite mass products (each positive) to justify the
finite integrals. Since norm of rank-one Bessel kernel is the product
of its two product norms, J bounds the sum of all absolute amplitudes.
Hence summable_amplitude for each d by norm domination. This supplies
the absolute rearrangements needed at BlockBound, CrudeEnergy and Moments.

2. Actual full-minus-cut error. The difference of kernels vanishes unless
at least one local W differs from its cut, on at least one side of the
rank-one product. In that case BOTH full and cut kernel norms have the
factor b^(-3 r^3 f) from that same local majorant; do not multiply by the
number of places or use a union bound. Triangle gives
 ||K_full-K_cut|| <= 2 b^(-3 r^3 f) H(y)H(gamma^-1 y).
Thus its total cutoff integral <= 2 nu b^((12 r n^3-r^3+2k)f)
using D_c<=b^(2kf) (IsAdmissible.card_besselCoord_le).
Here k>=1000(2n)^9 implies k>=16n^2 and k>=2n-1, so r<=2k,
r>=k+n. For n>=1,
 r^3-k^3 >= 3 k^2 n,
 12 r n^3 <=24 k n^3 <=2 k^2 n,
 2k+2 <= k^2 n (k>=16).
Therefore r^3-k^3-12 r n^3-2k>=2. With f>=1 and b>=1000,
 2 b^((12 r n^3-r^3+2k)f) <= 2 b^(-(k^3+2)f)
 <= b^(-k^3 f)/2.
This is precisely the native cut budget at amplitudeAbs_lt_top_and_cut_le,
not a new weaker hypothesis. This is the source's crude dimension bound
with slack, not an independent analytic RH argument.

3. Actual hasSum_amplitudeSum_change_of_weight: invariant integration.
On count(X_d)×Haar(Y), Delta=classUnip(c)×classUnip(d) acts by
 (u,v)(gamma,y)=(u gamma v^-1, u y). Stability and termsOver transport
give a measure-preserving permutation/action. K is invariant because the
class-unipotent characters are trivial, separately on each W side.
Let beta=beta_c(y)beta_d(gamma^-1 y), and phi any native measurable
nonnegative cutoff with sum over Delta equal to 1. Beta is also a cutoff
by the two partition identities. For invariant measurable F>=0,
 int phi F = sum_g int phi(x) beta(g x) F(x)
           = sum_g int phi(g^-1 x) beta(x) F(x)
           = int beta F.
All swaps here are Tonelli, including nonfree actions; no quotient
cardinality or hidden stabilizer factor. Apply to ||K|| and the norm
of the full-cut difference using (1)-(2). Integrability now permits
the same calculation for K (Bochner Fubini) and yields the exact HasSum
and unchanged cut-error bound for phi. This proves the actual weight
change from its cutoff premise and supplies the caller's rearrangements.

4. Character selection and exact degenerate-level aggregation.
At a fixed finite s, amplitudeSum_besselU_mul transports A to
chi(u)^-1 chi(v) A under s->red(u)s red(v)^-1; when these coincide and
the characters disagree, A=lambda A with lambda!=1, hence A=0.
For rational gamma, CrudeEnergy uses the stabilizer of its double
coset in the product of class groups, and an orbit cutoff from (3).
On the remaining real quotient, the native kernel covariance is
chi_f(u)^-1 chi_f(v) for u gamma v^-1=gamma. Haar invariance forces
the corresponding quotient integral to be zero if this character is
nontrivial (the actual integral_quotMeasure_eq_zero_of_twist). Summing
the absolutely convergent orbit terms proves
amplitudeSum_eq_zero_of_not_charsAgree, retaining the native
stabilizer cutoff construction and rational/real quotient disintegration.
This is cancellation BEFORE norms, not an estimate of individual terms.
For levels, let L_j=C b^-30 4^(-j.rev). At the first level no agreed term
can occur, so the amplitude is zero. For a successor n of j, split a
stable T into the level j.castSucc part and its complement; lower part
energy<=L_j by induction, new part<=L_j by energy_le_of_level_pairs
with empty coherent link set and all its stated guards. The inequality
||A+B||^2<=2||A||^2+2||B||^2 gives <=4L_j=L_n, exactly the native
energy_le_of_level_lt. No count of levels introduced. The classification
CharsAgree.exists_hasLevel and the local class-size/pair estimates remain
necessary, not proved by this recurrence.

Original source-level graph (retained):
B -> Moments -> CrudeEnergy -> {BlockBound, amplitude absolute
convergence, weight-change, character cancellation, flag/level classification}.
Amplitude absolute convergence -> {IsCutPair.exists_majorant,
tsum_classCutoff_box_le, quotient normalization, source shape bounds}.
Human expanded graph: majorant + box count -> uniform P -> J finite
-> summability; same J + exact local mismatch -> native cut budget;
summability + cutoff partition + invariant action -> weight change;
covariance + quotient stabilizer -> cancellation; stable level split +
native class/pair estimate -> degenerate recurrence.
No global deletion from elaborated graph. Remaining B primitives:
construction of the native majorant (not just its IsCutPair field), frame
separation/box count, quotient/stabilizer measure and flag propagation,
classSize and pairInvariant bounds, both local Fourier inequalities and
shell cap. A/C unaffected. No proof of RH or new kernel result.
Native Lean/lake unavailable locally. Historical CI jobs for 45577239749,
45576756833 and compact 45799225653 all three jobs each verified success
via GitHub jobs API this run; none runs this new certificate. Old engine
not substituted for compact toolchain; no new axiom evidence, preserve
existing ledger. JS exact scalar regression actually executed for n=1..50,
k=16n^2+q, q=0..100, r=k+2n-1: 5050 cases, min gap 581, no violations.
Regression tests only exponent arithmetic, not B or its geometric premises.

RESUME HERE: hand the analytic convergence, exact cut exponent and
weight-change derivations to integration/editor for manuscript §8.
Next prove the native IsCutPair majorant constructor and the actual
frame-count separation (not a new analytic endpoint). Coordinate with
B workers to avoid duplicating their real bands and pair-invariant chain.
HANDOFF TO: positivity geometry, integration, editor, audit, kernel.
-/

namespace CompactRun53

-- Exact scalar certificate for the source's exponent comparison.
-- Prepared, not compiled. No use of the claimed root theorem.
theorem tail_exponent (k n r : ℝ) (hn : 1 ≤ n)
    (hk : 16 * n^2 ≤ k) (hlo : k+n ≤ r) (hhi : r ≤ 2*k) :
    k^3 + 12*r*n^3 + 2*k + 2 ≤ r^3 := by
  have hn0 : 0 ≤ n := by linarith
  have hn2 : 1 ≤ n^2 := by nlinarith
  have hk16 : 16 ≤ k := by nlinarith
  have hk0 : 0 ≤ k := by linarith
  have hr0 : 0 ≤ r := by linarith
  have hcube : (k+n)^3 ≤ r^3 := by
    have hprod := mul_nonneg (sub_nonneg.mpr hlo)
      (show 0 ≤ r^2 + r*(k+n) + (k+n)^2 by positivity)
    nlinarith
  have hsmall : 12*r*n^3 ≤ 24*k*n^3 := by
    have h := mul_nonneg (sub_nonneg.mpr hhi) (show 0 ≤ n^3 by positivity)
    nlinarith
  have hmid : 24*k*n^3 ≤ 2*k^2*n := by
    have h0 : 0 ≤ k-12*n^2 := by nlinarith
    have h := mul_nonneg h0 (mul_nonneg hk0 hn0)
    nlinarith
  have hlast : 2*k+2 ≤ k^2*n := by
    have h := mul_nonneg (sub_nonneg.mpr hn) (sq_nonneg k)
    have h' := mul_nonneg (show 0 ≤ k-16 by linarith) hk0
    nlinarith
  have hcross : 0 ≤ 3*k*n^2+n^3 := by positivity
  nlinarith

-- Exact cancellation at the finite character consumer.
theorem phase_annihilates (z a : ℂ) (hz : z ≠ 1) (h : a = z*a) : a = 0 := by
  have he : (z-1)*a = 0 := by linear_combination -h
  exact (mul_eq_zero.mp he).resolve_left (sub_ne_zero.mpr hz)

#print axioms tail_exponent
#print axioms phase_annihilates
#check Filling.amplitudeAbs_lt_top_and_cut_le
#check Filling.summable_amplitude
#check Filling.hasSum_amplitudeSum_change_of_weight
#check Filling.amplitudeSum_eq_zero_of_not_charsAgree
#check Filling.energy_le_of_level_lt

end CompactRun53
