import New.Filling.FillingData
import New.DiscreteSeries.RestrictionLemma

/-!
# Compact RUN55 — graph Bessel peak and signed two-factor Laplace cone
26 Nov 2026. HUMAN SOURCE-MATCHED derivation; Lean candidates NOT COMPILED.
Source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript blob
906ceff9f072a53c1966a5b7631676b413bf1bb1; RUN54 f2e9574e782b2797f11f734f2acebb5cc836139f.
Peer 12323721 completed the planned box separation; do NOT duplicate it.
Peers a6e9cc7f, 7ce0b84e advance the thick open-cell estimate, d05b7f48
the thin class kernel. Read latest commit ledger through 15ea3969.
This run instead supplies the missing peak/graph branch used in RUN54.
No URT, no claimed RH root import, no changes to peer manuscript or workflows.

Source anchors:
 New/DiscreteSeries/BesselExistence.lean d24e51a59e3048dfa5279c6e39055f4c2cea38ad:
  Shape.besselGraphChart, besselGraphMeasure, right invariance,
  lintegral_unfold_besselGraphMeasure, HasPeakAt,
  IsSteep.exists_isTwoFactor_besselPairHom, exists_isBesselFunction.
 New/DiscreteSeries/TwoFactorSetup.lean fe2191cfa7eadc8683787a881a5f2fa16a9a0667:
  IsTwoFactor.phase_logOneAdd, exists_near_one, norm_dsCoeff_pow_four_le.
 New/DiscreteSeries/RestrictionLemma.lean 3d34e61d993473d314a9af56d55f0444a874aab6:
  IsTwoFactor.laplace_method lines 134-191.
 New/DiscreteSeries/GaussianShape.lean 37f359a0100b2ed6b67b4256af5e976bbbb19259:
  dsCoeff_gaussian_shape.
 Lib/DiscreteSeries/Bessel/RealMeasures.lean 4978795502441b9137a2caf7234b7b0beef8db34:
  measurePreserving_conj_bessel, free-entry Haar normalization.
 Lib/DiscreteSeries/FlenstedJensen/TailBounds.lean 3c13565c8bfecf91497747b0fe7cd7e39e50369c:
  half_le_norm_dsCoeff.
 New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278:
  Data.exists_besselSystem lines 66-105 (actual shared witness).
 New/RealPlace/BesselCut.lean c9e66fa71ab3aff125e672b9fc93caac9f03fa5d:
  HasPeakAt.exists_cut_isCutPair (RUN54).

## 1. Exact Lagrange flag, not an approximate phase
Use the source IsSteep weights t_i=Lambda_i-a, strictly decreasing negative
integers, i=1,...,M, M=2(varrho+1), together with t_0=0. Define
d_i=prod_(j!=i)(t_i-t_j), c_i=sqrt(|d_i|)>0. Since the nodes are integral
and distinct, c_i>=1. Their signs satisfy sign(d_i)=(-1)^i.
For any polynomial P of degree <=M, comparing highest coefficients in
the Lagrange interpolation formula proves
             sum_(i=0)^M P(t_i)/d_i = [T^M]P(T).              (1)
In the lower block of the source C matrix the v_n column, n=0,...,M-1,
has entries c_0^(0^n) t_i^n/c_i for i>=1 (0^0=1).
The signs of the actual lower block start at +, hence are (-1)^(i-1).
Equation (1) with P=T^(n+k) gives the exact Gram identity for n+k<=M:
 <v_n,v_k>_J = 1 if n=k=0; -1 if n+k=M; 0 otherwise.
The c_0 factors cancel the excluded t_0 term for n=k=0. Other columns
of C are the X identity block and orthogonal to these v_n. This supplies
the hC step of exists_isTwoFactor_besselPairHom without numerical
approximation. Vandermonde invertibility gives independence, and the
selected flag (v_0,v_1,...,v_(varrho+1)) has the required Gram.
Multiplying by the actual unitary sign frame p transports this Gram
unchanged. Witt extension maps that selected flag to the prescribed Y
using the same g, not a new independently chosen phase point.
The diagonal weight acts by
 (diag Lambda)v_0 = a v_0 + c_0 v_1,
 (diag Lambda)v_n = a v_n + v_(n+1) for 1<=n<M-1.
This is the exact shift used in the native column calculation d.
The norm square is <=M b^(5n) for n>=1 since |t_i|^2<=b^5.
Retain the actual besselSize_le_of_dual, trace block-triangular
verification, and diagonal compact embedding of that same g as
source inputs; their complete human derivations are not supplied here.

## 2. Logarithmic phase cancellation on the actual two-factor group
Write X(s)=j(s)-1 as a PAIR of matrices, and let L be the difference
of the two weighted traces in HCParam.phase. IsTwoFactor gives
L(X(s))=phi(s), phi(st)=phi(s)+phi(t), Re phi=0.
For every integer k>=0,
 L((1+X(s))^k-1)=k phi(s).
Taking finite differences, or triangular binomial induction, gives
 L(X(s)^1)=phi(s), L(X(s)^n)=0 for all integers n>=2.
Therefore whenever both matrix norms of X(s) are <=1/2, the
absolutely convergent matrix logarithm series gives
             L(log(1+X(s))) = phi(s).                       (2)
No norm of the separate traces is taken before this cancellation.
This is a human derivation of the native phase_logOneAdd; the
homomorphism, common point and additive phase are necessary.

## 3. The signed Laplace inequality and its actual near/far guards
Use precisely IsTwoFactor.laplace_method. Put D=card n+card m,
N=D^2, T=N log(beta), eta=exp(-100 T)=beta^(-100N),
e=10^(-13)/T, g(s)=2/||j_1(s)||, and theta=laplaceIntegrand.
Here beta>=10^12, D+L<=beta, both gaps h>=10^30 T^3, B>=1,
and the proper-map, continuous second factor and lip guards remain.
N>=1, T>=1. The native decay p gives |theta|<=g^c for c<=18N.

Let a0,b0 be the squared Frobenius norms of the off-diagonal blocks.
If a0+b0>e^2, the native fourth-power coefficient estimates imply
 |theta|^4 <= ((1+a0)(1+b0))^(-h) <= (1+e^2)^(-h).
Use log(1+e^2)>=e^2/2 (e<=1), hence
 |theta| <= exp(-h e^2/8) <= exp(-1250 T) <= eta.
Interpolating with c=16N by the geometric mean gives
 |theta| <= beta^(-50N) g^(8N). Since Re theta>=-|theta| this implies
 4|theta| <= 8(Re theta+16 beta^(-50N) g^(8N)).

If a0+b0<=e^2, use the actual construction in exists_near_one:
t=s0*s where j(s0) is the diagonal unitary zero-weight block;
theta(t)=theta(s), both norms of j(t)-1 are <=10e.
In particular the first operator norm of j(s) equals that of j(t)
and is <=1+10e<2; thus g(s)>=1. The GaussianShape hypotheses hold
because (10e)T=10^(-12), D+L<=beta and both ranks are nonempty.
Apply dsCoeff_gaussian_shape to the two factors, with the second
conjugated (native hg'.neg), then use (2). The SAME theta(s) is
 (a+u)(c+v), 0<=a,c<=1, |u|<=a/10+eta, |v|<=c/10+eta.
This product differs from ac by E with
 |E| <= .21 ac + 1.1 eta(a+c) + eta^2.
Thus |theta|-2 Re theta <= -ac+3|E| <= 10 eta,
using eta<=1 and a,c<=1. In particular
 4|theta| <= 8 Re theta +40 eta
            <=8(Re theta+16 beta^(-50N) g^(8N)).
This proves the actual source's A inequality on both branches
from the retained Gaussian and near-one suppliers, with no separate
absolute-value main term and no loss in the native exponent.

For clarity the last scalar absorption in laplace_method works as
follows. Let m be the real Haar mass of ||j_1-1||<=1. It is finite
by properness. The joint-block covering bound hb and lip put that
ball inside a cover with factor K<=beta^(20N)/16 times the small
joint ball; both coefficient magnitudes on the small ball are >=1/2
by half_le_norm_dsCoeff. Thus integrate A there, extending the
nonnegative dominating integrand over the whole group:
 m <= 8K Re int(theta)+128K beta^(-50N) int(g^(8N)).
The native integral_decay_le bounds the last integral by
16^(8N)*m. The arithmetic 16^(8N+1)<=beta^(30N) (N>=1)
makes the error <=m/2. Replace Re int(theta) by its absolute value
BEFORE bounding K, which avoids a sign reversal if that real part
were negative. This gives
             m <= beta^(20N) |int(theta)|.                  (3)
This is precisely the native Laplace conclusion, not an assumed
nonvanishing. It still depends on the original covering, Gaussian
and near-one geometric suppliers; no fake proof of these is asserted.

## 4. The Bessel graph and the same nonzero function
Use H=U(kappa), U=besselU and S=Shape.besselGraph, with elements
s=(hu,h). In chart coordinates the product (u,h)(v,k) has
coordinates (k^-1 u k v,hk). Right translation preserves the
actual product Haar: conjugation by k preserves the U Haar
(measurePreserving_conj_bessel), U right translation preserves it,
and H right translation preserves the native compact Haar.
No independent rescaling of the graph measure is allowed.
The native graph chart is a homeomorphism, so the product measure
is open positive and finite on compacts. Properness of j_1 follows
from the closed graph in G x compact H and conjugation/frame
homeomorphisms. Its identity ball therefore has positive finite
mass m. For any measurable nonnegative f, quotient disintegration
of the actual U Haar and compact averaging give
 int_G f(g) dg = int_(U\G) int_S f(x s_1 y) ds d y.          (4)
Indeed integrate f(x h u y) first in u and y, yielding int_G
f(x h g)dg=int_G f(g)dg for each h, then integrate the compact
probability Haar used in the source. This explains the normalization
in lintegral_unfold_besselGraphMeasure, not an arbitrary Haar identity.

For the actual chosen rep and highest vector v, the compact
coefficient hypothesis in exists_isBesselFunction gives ||v||=1
(at identity). Let R=besselValueRep rep, chi(s)=wave(simpleRootSum
s_1) (unit modulus character), psi=l.psiInFrame. Define
 W(y)=int_S psi(x^-1 s_1 y) chi(s)^-1 R(s_2^-1)v ds.
The norm of the integrand is exactly |psi(x^-1 s_1 y)|. The
native uniform graph decay bound at M0=8*r^2+1 gives
 int_S (2/||frameEquiv(x^-1 s_1 y)||)^M0 ds <=16^M0 m.
It gives integrability, the source boundedness/measurability, and
the asserted absolute coefficient majorant for W. For t in S,
substitute s'=s t (right Haar), using the character and rep
homomorphisms:
 W(t_1 y)=chi(t) R(t_2) W(y).
In particular this gives exactly the U character covariance and
compact covariance in IsBesselFunction. The norm is invariant
under their combined group, not assumed invariant under G.
To obtain reproduction use the native idempotent coefficient
kernel for convolution by d psi, d=formalDegree. Fubini is
legitimate since the absolute inner graph integral is uniformly
bounded and the outside coefficient is L1. Apply the coefficient
reproduction to each translated psi inside the graph integral;
this gives convolve(W,d psi)=W.
At the SAME x, take the compact vector coefficient:
 <v,W(x)>=int_S l.laplaceIntegrand u j phi(s) ds.
The conjugation of the second coefficient comes from R(s_2^-1),
and the phase from chi^-1. The vector is unit norm. Thus (3) and
Cauchy-Schwarz give 0<m<=beta^(20N)||W(x)||, so W(x)!=0.
Finally 16<=beta implies for every y
 int_S (2/||frameEquiv(x^-1 s_1 y)||)^M0 ds
 <= beta^(M0+20N)||W(x)||.
All the fields of the source HasPeakAt, including its nonzero
witness and uniform normalization, follow with the original
Laplace/decay/representation suppliers.

## 5. Direct transfer to RUN54, no independent peak
Data.exists_besselSystem uses beta=b^3, r=card n (native full
Bessel index rank), kappa0=card m<=r and N=(r+kappa0)^2.
Thus the exponent in HasPeakAt after the source pow_mul is
 a_peak=3*(8r^2+1+20(r+kappa0)^2).
For r>=364 and 0<=kappa0<=r,
 a_peak+99r^2<=363r^2+3<=r^3.
The native data scale guards supply this comparison; no new
restriction on D is imposed. This is the hM input of BesselCut,
with the SAME W and x as above. RUN54 normalizes and cuts this W,
then RUN53 and peer 12323721 provide the absolute convergence
and weighted box count. No second normalization is introduced.
The independent Schur and local band outputs at the B caller
remain required.

## Dependency and execution ledger
Original source-level graph:
 B -> Data.filling -> Data.exists_besselSystem ->
 {IsSteep.exists_isTwoFactor_besselPairHom, IsTwoFactor.laplace_method,
 exists_isBesselFunction, exists_cut_isCutPair, Schur bound, bands};
 laplace_method -> {phase_logOneAdd, exists_near_one,
 gaussian_shape, fourth-power decay, covering, integral_decay};
 exists_isBesselFunction -> {graph right Haar, properness, Laplace,
 coefficient kernel, compact coefficient, graph decay}.
Expanded graph:
 Lagrange exact moments -> Gram + weight shift -> same Witt flag;
 additive phase -> exact log cancellation -> two-branch signed
 Laplace inequality -> integrated absorption -> positive peak;
 chart invariance -> graph unfolding and W covariance;
 positive peak + reproduction + decay -> HasPeakAt -> RUN54.
Retain full original graph, including outstanding near-one Cayley
normalization, GaussianShape primitive minor expansions, exact
trace/diagonal embedding of the flag, proper quotient/Haar input,
Schur and local band suppliers; no global dependency removal,
no claim of elaborated graph or audit of all deep input theorems.
The original 40e56bab proof and older engine evidence stay separate.

Actual local JS BigInt regression in this run: 3600 exact Lagrange
moment assertions, 22860 raw Gram assertions (without floating square
roots), 9261 scalar cone inequalities on a,c,eta in {0,1/20,...,1},
6548 peak exponent cases (r=364..2000, kappa0 in {0,1,floor(r/2),r}).
Zero violations. These check algebra only, not the native geometry,
Haar measures or analytic proof. Full-domain derivations above.
Reproducible JS:
 for m even 2..16, step=1..9, skew=0..4:
   t[i]=-BigInt(step*i+skew*i*i), i=0..m;
   d[i]=product_(j!=i)(t[i]-t[j]); Q=product_i d[i];
   assert sum_i t[i]^k*(Q/d[i])==(k==m?Q:0), k=0..m;
   assert -sum_(i>=1)t[i]^(a+b)*(Q/d[i])
      == (a+b==0?Q/d[0]:a+b==m?-Q:0), 0<=a,b<m,a+b<=m.
 For integers a,c,e=0..20 let err=21*a*c+110*e*(a+c)+100*e*e;
   assert 3*err-100*a*c<=20000*e.
 For r=364..2000 and k in [0,1,floor(r/2),r],
   assert 3*(8*r*r+1+20*(r+k)^2)+99*r*r<=r^3.
Local lean/lake absent (command -v both empty). Native scan/prune/
reduce/auto/auto_frontier not executed on compact source. New Lean
lemmas below are prepared, not compiled; no new axiom evidence.
Actual state records re-read: original runs 45577239749 pass
(b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc), 45576756833 pass
(7da354941e402b6f8b364ed03d8c5c82d27b7717);
compact run 45799225653 pass (77cc3483ee5f43ab83ffdaf4bd1f31cecdccef35),
45803534769 error (a56e2d3afb99ed8275e81fd63c8494306e57c43f).
GitHub workflow wrapper success does not override that internal error.
No PASS claimed for this file.

RESUME HERE: integrate sections 1-5 immediately before RUN54 peak
normalization, with the stated remaining near-one Cayley step and
GaussianShape primitive principal-minor expansion. Next derive the
actual exists_near_one correction using the common compact diagonal
unitary and both norm bounds (not a generic Gaussian asymptotic);
then prove the specific GaussianShape minor-error supplier. Do not
repeat boxed-frame, classSize, cutoff or analytical endpoint work.
HANDOFF TO: integration/editor, positivity geometry, audit, kernel.
-/

namespace CompactRun55

-- Scalar part of the actual signed near-cone estimate.
theorem cone_scalar (a c e : ℝ)
    (ha : 0 ≤ a) (hc : 0 ≤ c) (he : 0 ≤ e)
    (ha1 : a ≤ 1) (hc1 : c ≤ 1) (he1 : e ≤ 1) :
    3 * ((21/100 : ℝ)*a*c + (11/10 : ℝ)*e*(a+c) + e^2) - a*c ≤ 10*e := by
  have h1 := mul_nonneg ha hc
  have h2 := mul_nonneg he (show 0 ≤ 2-a-c by linarith)
  have h3 := mul_nonneg he (sub_nonneg.mpr he1)
  nlinarith only [h1, h2, h3, he]

theorem peak_exponent (r k : ℝ) (hr : 364 ≤ r)
    (hk : 0 ≤ k) (hk' : k ≤ r) :
    3*(8*r^2+1+20*(r+k)^2)+99*r^2 ≤ r^3 := by
  have h1 := mul_nonneg (sub_nonneg.mpr hk') (show 0 ≤ 3*r+k by linarith)
  have h2 := mul_nonneg (sub_nonneg.mpr hr) (sq_nonneg r)
  have h3 := mul_nonneg (show 0 ≤ r-364 by linarith) (show 0 ≤ r+364 by linarith)
  nlinarith only [h1,h2,h3]

theorem absorb_laplace (m C I : ℝ)
    (h : m ≤ C*I/2 + m/2) : m ≤ C*I := by linarith

#print axioms cone_scalar
#print axioms peak_exponent
#print axioms absorb_laplace
#check IsSteep.exists_isTwoFactor_besselPairHom
#check IsTwoFactor.phase_logOneAdd
#check IsTwoFactor.laplace_method
#check lintegral_unfold_besselGraphMeasure
#check exists_isBesselFunction
#check Data.exists_besselSystem
end CompactRun55
