import New.Filling.FillingData
import Mathlib.Tactic

/-!
# RUN63 — peak, normalized majorant, cut error and derivative Schur at B
2026-11-26. HUMAN SOURCE-MATCHED, independent audit requested, native
certificate prepared not compiled. Compact source
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 and current
HUMAN_PROOF_COMPACT blob 9870fca9396c2306122e15b676aeef4b71233d74.
Peer Landau dec19e20cc253208d9d209bf035a723ae5ce8c6f supplies the
local Fourier kernel and middle Haar normalization; do not repeat it.
RUN53 bottom band estimate fc2783087cd02757163e488c67350549703c4c3f
and RUN55 open-cell derivative consumer already give the downstream use.
This run supplies their upstream IsCutPair and HasSchurBound from the
actual peak and discrete-series hypotheses, not from an assumed tight
frame or the RH theorem.

## 1. The native peak construction (BesselExistence.exists_isBesselFunction)

Write G=real unitary group, S=besselGraph, nu=its right Haar
measure as the product of unipotent Haar and normalized compact H Haar,
Q=besselQuotMeasure. Write s=(g_s,h_s), c(s)=wave(simpleRootSum(g_s)),
R(h)=besselValueRep(rep)(h), unitary. In the native unitary frame,
psi=psiInFrame, d=formalDegree>0 and e=d psi.
Fix x with native IsTwoFactor and let v be the unit vector furnished by
the compact coefficient identity (at the identity its squared norm is 1).
Define
 Y(y)=integral_S psi(x^-1 g_s y) c(s)^-1 R(h_s)^-1 v dnu(s).
Its integrand has norm exactly |psi(x^-1 g_s y)|. Let
 M=8 r^2+1, w_a(g)=(2/||g||)^a, B={g:||g-1||<=1},
 B_S={s:||x^-1 g_s x-1||<=1}. Norms of matrices in the unitary
frame equal the original norms, since the frame is unitary.
The actual lintegral_decay_le gives
 integral_S w_M(x^-1 g_s y) <= 16^M nu(B_S)
uniformly in y, using the proper first homomorphism
s -> frameEquiv(x^-1 g_s x).
Together with |psi|<=w_M this gives absolute convergence and a
uniform bound. Joint measurability supplies measurability of Y.
The integral over S is not a normalized finite-group average.

For a=(g_a,h_a) in S, replace s by t a^-1 in Y(g_a y).
The right invariance of nu and c multiplicativity give
 c(t a^-1)^-1 R(h_t h_a^-1)^-1
 = c(a) R(h_a) c(t)^-1 R(h_t)^-1.
Thus Y(g_a y)=c(a)R(h_a)Y(y), exactly the two Bessel
equivariances; in particular the norm is S invariant.
The native kernel identity is
 integral_G psi(g^-1) psi(u g) dg = psi(u)/d,
with its stated two-sided Haar normalization. Applying it inside the
absolutely integrable iterated integral proves Y*e=Y. Fubini holds
because integral_S |psi(x^-1 g_s y g)| is uniformly bounded and
e in L1. Continuity follows from bounded Y convolved with L1 e.

Using the convention linear in the second slot,
 <v,Y(x)>=integral_S psi(x^-1 g_s x) c(s)^-1
                         conj(u.dsCoeff(h_s)) dnu(s).
This is the exact laplaceIntegrand at the same native IsTwoFactor.
The actual laplace_method gives nu(B_S)<=b^ell |<v,Y(x)>|
for its admitted scale (ell is its native exponent after beta=b^3).
nu(B_S)>0 by the native open-ball Haar positivity. Hence Y(x) !=0.
Also |<v,Y(x)>|<=||Y(x)||, so with P=b^(M+ell) (16<=b),
 integral_S w_M(x^-1 g_s y) <= P ||Y(x)||.
This yields HasPeakAt, with no cancellation estimate assumed beyond
the stated two-factor Laplace and decay suppliers. The quantitative
Gaussian cone lemma, IsTwoFactor construction and degree/decay
theorems remain separate dependencies (see section 5).

## 2. Exact peak-to-majorant normalization (BesselCut.exists_cut_isCutPair)

Use the native HasPeakAt with exponent n0 (P=b^n0), ||Y(x)||=p>0,
b>=2000, n=shape.n, r=shape.r, d>0,
besselSize(x)<=b^(5n), n0+99r^2<=r^3,
r+L+1<=b^4, H=3r^3 f<=A, f>=1.
Set M=8r^2+1, C=16^M, R0=b^(6n+2), phi=w_(2M), and
 K=integral_G phi, Phi(y)=integral_S phi(x^-1 g_s y) dnu(s).
The native graph unfolding is
 integral_G a(g) dg=integral_Q integral_S a(x^-1 g_s y) dnu(s) dQ(y)
for nonnegative a. Indeed first unfold along U, then insert the
probability Haar integral over H; conjugation by H preserves U Haar,
and left translation on G preserves Haar. Tonelli justifies this.
In particular integral_Q Phi=K. Since |psi|<=phi, the actual
coefficient decay and graph unfolding also imply Y in L1(Q):
 integral_Q ||Y||<=integral_G |psi|<infinity.
Boundedness gives q=integral_Q ||Y||^2 finite.

Define the positive finite measure
 mu=(C/vol(B)) b^n0 p * w_M dg.
By integral_decay_le on G itself, integral_G w_M <= C vol(B).
Thus mu(G)<=C^2 b^n0 p. Here B is the identity norm-difference
ball; native properness and Haar positivity give 0<vol(B)<infty.

For any measurable O containing {g:besselSize(y g)<=R0},
fix s and t=x^-1 g_s y. For g in t^-1 B, ||t g||<=16.
Since besselSize is S invariant and satisfies
 besselSize(y')<=||x^-1 y'|| besselSize(x),
one has besselSize(y g)<=16 b^(5n)<=R0. Thus t^-1 B is contained
in O. On that translate,
 ||g||<=16||t^-1||=16||t||,
hence w_M(g)>=C^-1 w_M(t).
Left invariance and integration give
 mu(O)>=b^n0 p w_M(t).
Multiply by w_M(t) and integrate over s. The HasPeakAt estimate
integral_S w_M(t)<=b^n0 p, with p>0, yields exactly
 Phi(y)<=mu(O).
In particular Phi<=mu(G), with no integration of a uniform constant
over the noncompact quotient. This is the native measure domination.

At x, reproduction and weighted Cauchy-Schwarz give
 p^2 <= d^2 K integral_G ||Y(xg)||^2 phi(g) dg
     = d^2 K integral_Q ||Y(y)||^2 Phi(y) dQ(y)
     <= d^2 K q mu(G)
     <= d^2 K q C^2 b^n0 p.
The equality uses graph unfolding and S invariance of ||Y||.
Since p>0, this proves both q>0 and p<=d^2 K q C^2 b^n0.
Now c=sqrt(|I|/q), F=cY and a(y)=c Phi(y), m=c mu. Exact cancellation:
   m(G) integral_Q a
   = (|I|/q) mu(G) K
   <= |I| (d K C^2 b^n0)^2.                     (P)
This is the decisive inequality; the unknown peak p and L2 norm q
have disappeared BEFORE bounding the remaining constants.

The source integral_tail_le at exponent 2M gives
 d K <=8[2000(r+L+1)^6]^(2r^2) 2^(2M).
As b>=2000 and r+L+1<=b^4, this implies
 d K C^2 <= b^(1+50r^2+4M)=b^(82r^2+5)<=b^(99r^2)
for r>=1. Therefore (P) <= |I| b^(2r^3).
This exactly proves the native exists_majorant product requirement.
A is left U invariant by the right-invariance reindexing of S;
a and m measurable, m finite, and a(y)<=m{g:InCut(y g)b}.
All of this uses the actual peak, not merely a pointwise tail bound.

## 3. The native cut and its precise L2 error

Take chi(t)=max(0,min(1,R0-t)), V(y)=chi(besselSize(y))F(y).
The native size comparison in FrameNorm proves continuity and
S invariance, so F,V are continuous and share Bessel equivariance.
Also ||F||_Q^2=|I|, ||V||_Q^2<=|I| and V!=0 implies InCut.
F*e=F by linearity. If F!=V at y, then besselSize(y)+1>R0.
For every s, t=x^-1 g_s y must have ||t||>2b: otherwise
besselSize(y)+1 <=2b*b^(5n)+1<=R0 (n>=1, b>=2000).
The native large-gap coefficient inequality at exponent 2M+H
then gives |psi(t)|<=w_(2M)(t) b^-H.
Thus both full and cut have norm <=a(y), and on the region where
they differ their norms are <=b^-H a(y). Moreover
||V-F||<=||F|| since 0<=chi<=1. The actual tail estimate follows:
 integral_Q ||V-F||^2 <= b^(-2H) integral_Q a^2
     <= b^(-2H) m(G) integral_Q a
     <= |I| b^(2r^3-6r^3 f)
     <= |I| b^(-10r^2).
Last inequality uses r>=3, f>=1 (the actual Filling rank is much
larger), hence 6r^3 f-2r^3>=4r^3>=10r^2.
This closes the cut normalization and tail derivation conditional
on the exact peak/degree/decay suppliers. It supplies IsCutPair,
including the often omitted weighted majorant field, not just
a compactly supported approximation. RUN53 uses precisely this
tail to compare the bottom energy of the cut and reproduced function.

## 4. Independent Schur/derivative bridge at the same caller

Use the kernel e=d psi, e*=e for convolution involution, e*e=e,
and its rank-one sandwich identity e*w*e=(e*w)(1)e/d
for integrable scalar w, a direct Fubini consequence of the actual
IsIdempotentKernel identity. If e*x=x, then
 x*x^* = e*(x*x^*)*e = (||x||_2^2/d)e.
Here star on x denotes conjugate-inverse, not pointwise conjugation.
The convolution operators on L2(Q) are a star action on the
right (order of products reversed as operators); this follows by
right invariance of Q integrals of left-character-invariant
pairings, with unitary left transformation and the native Haar
normalization. Consequently for F*e=F,
 ||F*x||_2^2 = (||x||_2^2/d)||F||_2^2.
For another scalar z in L1 cap L2, left convolution L_x on L2(G)
satisfies L_x L_x^*=(||x||_2^2/d)L_e, an orthogonal projection
times a nonnegative constant. Therefore
 ||(F*x)*z||_2^2 <= (||x||_2^2/d^2)||F||_2^2 ||z||_2^2.
All scalar x here are bounded integrable (since e*x=x with e
bounded); right convolution preserves the requisite quotient L2
space by the L1 bound. For z with infinite L2 norm the estimate
is automatic in extended nonnegative form (zero x or F treated
separately). This is the actual double-convolution Schur bound
without assuming a second independent orthogonality identity.

In BesselCut.hasSchurBound_of_convolve_eq take x=X_w, the smeared
derivative matrix coefficient, with e*X_w=X_w; the source
filtration/smearing construction gives
 ||X_w||_2^2/d <= [(r+1)^4(L+r+1+|w|)]^(2|w|).
For |w|<=2n^2 and B>=(r+1)^4(L+r+1+2n^2), the double
convolution bound with ||F||_Q^2=|I| gives
 SchurLe(V_w, B^(2|w|)|I|/d).
The actual derivative identity comes from differentiating the
smear, not differentiating an unverified cutoff. This supplies the
Schur estimate on FULL F at Data.exists_besselSystem conditional
on the native filtration and derivative coefficient identity.
RUN55's open-cell consumer may use this exact coefficient bound;
the cut function does not inherit Schur merely by multiplication.

## 5. Provenance, frontier and verification

Actual retrieved source bodies (compact pin):
 New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278
 New/RealPlace/BesselCut.lean c9e66fa71ab3aff125e672b9fc93caac9f03fa5d
 New/DiscreteSeries/BesselExistence.lean d24e51a59e3048dfa5279c6e39055f4c2cea38ad
 New/DiscreteSeries/RestrictionLemma.lean 3d34e61d993473d314a9af56d55f0444a874aab6
 New/DiscreteSeries/TwoFactorSetup.lean fe2191cfa7eadc8683787a881a5f2fa16a9a0667
 Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean 3c13565c8bfecf91497747b0fe7cd7e39e50369c
 Lib/DiscreteSeries/CuspKernel/BesselSchurBound.lean b952a0f44ada9a6691c1a98b8fe0ba1544615d26
 New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058
 New/RealPlace/FrameNorm.lean 06a65cfd754f2688b899d08320f627fdea415db0
 New/RealPlace/OpenCellBound.lean 054e3375d3ef6c96633ab3c2e44b38df52a94755
 New/RealPlace/BandLimits.lean 20ff4e65c2599fc8b752dbb93673ed65053e2216.
Original source branch:
 IsSteep.exists_isTwoFactor_besselPairHom + IsTwoFactor.laplace_method
 + coefficient decay + graph Haar -> exists_isBesselFunction
 -> HasPeakAt.exists_cut_isCutPair -> Data.exists_besselSystem
 -> FillingData -> BandLimits and OpenCell -> Moments -> Theorem B.
Same branch for derivative Schur via BesselSchurBound.
Reduced human proof uses the exact peak cancellation (P) and projector
identity, not any root theorem. No globally deleted edges or changed
native hypotheses. Retain IsSteep/Witt/Lagrange phase construction,
Gaussian cone bound, quantitative covering/decay, degree formula,
Haar/quotient normalization, Lie filtration and actual scale guards.
The one-vector Siegel-Weil classical normalization remains separately
open. Context cache: source pin, shape, frame p, weight l, actual
compact rep and x, b/f, Haar measures and actual degree; no merging
with arbitrary Haar or different parameter.

Local command -v lean/lake/elan produced no paths. Older native
rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier not executed;
different toolchain. Prepared scalar and declaration probes below.
Actual CI 45799225653 job conclusions success independently fetched.
Actual partial replay 45803534769 state output
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json
blob 088cd2ec0e935ee1a282f10096949bcf671cc804 independently retrieved:
six native named checks on TiltingLemma and Moments, each only
propext, Classical.choice, Quot.sound; module_1_build timed out 124;
all_requested_checks_ok=false, full_RH_replay=false.
No fresh PASS; no graph or axiom evidence overwritten.

RESUME HERE: derive the native two-factor Laplace Gaussian cone,
including the near-unitary-block reduction and exact covering
budget, at RestrictionLemma.IsTwoFactor.laplace_method, then derive
IsSteep.exists_isTwoFactor_besselPairHom using the native Lagrange
weights and dual-frame size lemma. The normalized cut and peak
transfer above need integration and audit, not more optimization.
HANDOFF TO integration/editor, positivity, independent audit and
compact replay. Human RH reconstruction incomplete.
-/

namespace CompactGeometryRun63

theorem peak_budget_exponent (r : ℕ) (hr : 1 ≤ r) :
    1 + 50 * r^2 + 4 * (8 * r^2 + 1) ≤ 99 * r^2 := by
  have h : 1 ≤ r^2 := by simpa using Nat.pow_le_pow_left hr 2
  omega

theorem cut_budget_exponent (r f : ℕ) (hr : 3 ≤ r) (hf : 1 ≤ f) :
    2 * r^3 + 10 * r^2 ≤ 6 * r^3 * f := by
  have h₂ : 2 * r^3 + 10 * r^2 ≤ 6 * r^3 := by
    have h : 10 * r^2 ≤ 4 * r^3 := by
      calc
        10 * r^2 ≤ 12 * r^2 := by omega
        _ ≤ (4*r) * r^2 := Nat.mul_le_mul_right _ (by omega)
        _ = 4 * r^3 := by ring
    omega
  exact h₂.trans (by simpa using Nat.mul_le_mul_left (6*r^3) hf)

theorem peak_cancellation (p q d K C B i : ℝ)
    (hq : 0 < q) (hK : 0 ≤ K) (hC : 0 ≤ C) (hB : 0 ≤ B)
    (hi : 0 ≤ i)
    (hp : p ≤ d^2*K*q*C^2*B) :
    (i/q)*(C^2*B*p)*K ≤ i*(d*K*C^2*B)^2 := by
  have hn : 0 ≤ (i/q)*(C^2*B)*K := by positivity
  calc
    _ = ((i/q)*(C^2*B)*K)*p := by ring
    _ ≤ ((i/q)*(C^2*B)*K)*(d^2*K*q*C^2*B) :=
      mul_le_mul_of_nonneg_left hp hn
    _ = _ := by field_simp <;> ring

#print axioms peak_budget_exponent
#print axioms cut_budget_exponent
#print axioms peak_cancellation
#check exists_isBesselFunction
#check HasPeakAt.exists_cut_isCutPair
#check IsBesselFunction.hasSchurBound_of_convolve_eq
#check Data.exists_besselSystem
#print axioms HasPeakAt.exists_cut_isCutPair
#print axioms Data.exists_besselSystem

end CompactGeometryRun63
