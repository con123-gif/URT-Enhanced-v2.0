# The existing Bessel majorant supplies absolute correlation convergence

26 November 2026. Source-level mathematical review and caller integration,
not a new native replay. Result: agree with the normalized majorant and
its composition with weighted frame packing, under the actual peak,
coefficient-decay, Haar and geometric inputs stated below. RH incomplete.

Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src. Read the actual bodies of BesselCut.lean,
BesselExistence.lean (HasPeakAt), BesselSystem.lean (IsCutPair),
TailBounds.lean (integral_tail_le), RegularRepL2.lean
(lintegral_decay_le), AmplitudeSums.lean and its exact callers.
Credit the original formal authors Alpoge, Sernau and collaborators.

This is NOT a rediscovery of the majorant: Landau RUN54 / b18678e2,
COMPACT_RUN54_BESSEL_MAJORANT_CONSTRUCTOR.lean, already derives it.
Landau RUN58 / 133ff5b3 supplies the covering/tail integral input.
The boxed-frame appendix supplies separation by triangular descent;
the lattice-saturation/convergence appendix supplies the global
amplitude composition. Integration RUN61 / 49e4380d preserves this
as a retained prerequisite; the present review joins those existing
derivations and checks their normalization and exponents.

## 1. Same local measure, including the finite comparison

Use the native peak Y,x,P=b^a, H=||Y(x)||>0, d=formalDegree>0.
Let r be the whole-space rank, n the shape parameter, f>=1,
M=8r^2+1, C=16^M, omega(g)=(2/||g||)^M, phi=omega^2,
J=integral_G phi, R=b^(6n+2), and

    Phi(y)=integral_graph phi(x^-1 s y) ds,
    mu=(C P H / volume(B)) omega(g) dg,
    B={g:||g-1||<=1}.

The unitary frame preserves operator norm; all these are the native
Haar and graph measures. The actual guards are b>=2000,
besselSize(x)<=b^(5n), a+99r^2<=r^3, r+L+1<=b^4,
and 3r^3 f<=A, with the stated discrete-series gap hypothesis.

The near-ball decay estimate at M>8r^2 gives
integral omega<=C volume(B), so mu(G)<=C^2 P H<infinity.
For O_y={g:InCut(yg,b)} and t=x^-1s y, t^-1B lies in O_y:
||tg||<=16<=2b and the native Bessel-size product bound gives
besselSize(yg)+1<=R. On that translate omega(g)>=C^-1 omega(t).
Therefore mu(O_y)>=P H omega(t) for every s. Multiply by omega(t)
and integrate over the graph. The PEAK input gives integral omega(t)
<=P H; since mu(O_y) is finite, P H is positive finite, and every
integrand is nonnegative, cancellation yields

    Phi(y)<=mu(O_y)<=mu(G).

This checks the direction of the measure comparison and its finite
denominator. It is not inferred just from L2 closeness or integrability.
Right invariance of the same graph measure makes Phi left-U-invariant.

## 2. Cancel the unknown peak before taking the budget

The reproduction identity at x and weighted Cauchy--Schwarz give

    H^2<=d^2 J integral_G phi(g)||Y(xg)||^2 dg
       =d^2 J integral_quot Phi(y)||Y(y)||^2 dy
       <=d^2 J q C^2 P H,

where q=integral_quot ||Y||^2 is positive finite. Boundedness comes
from Phi<=mu(G), and integrability from the peak coefficient bound
and graph unfolding, so q is finite; the displayed inequality and
H>0 force q>0. Put c=sqrt(card(I)/q), F=cY,
A0=c Phi, m0=c mu. The SAME c normalizes F and both majorants.
Then

    m0(G) integral_quot A0
       <=card(I) (d J C^2 P)^2.

The exact finite tail estimate is
dJ<=8(2000(r+L+1)^6)^(2r^2) 2^(2M).
Using 2000<=b, r+L+1<=b^4, 2<=b and 16<=b gives

    d J C^2<=b^(50r^2+4M+1)<=b^(99r^2).

The last difference is 17r^2-5>=0, since r>=1. Thus the actual
guard a+99r^2<=r^3 proves

    m0(G) integral_quot A0<=card(I) b^(2r^3).           (1)

This removes H and q before the final bound, retaining the exact
normalization used by IsCutPair. No extra factor of f is introduced.

Let V(y)=max(0,min(1,R-besselSize(y)))F(y). On a mismatch F!=V,
every t=x^-1s y has ||t||>2b. The stronger coefficient decay and
3r^3 f<=A give b^(3r^3 f)||F(y)||<=A0(y), and the same for V.
If F=V the multiplier is one. Also integral A0^2<=m0(G)integral A0.
Hence

    integral ||F-V||^2<=card(I)b^(2r^3-6r^3 f)
                       <=card(I)b^(-10r^2).

Here r>=99 follows from a>=0 and a+99r^2<=r^3. The full/cut
covariance, reproduction, support and L2 fields follow with this
same F,V. This verifies the actual exists_majorant and cut budget
from the retained HasPeakAt and decay/Haar inputs.

## 3. Weighted packing to the absolute sum and exact cut error

Use the earlier BOXED-FRAME proof, with actual level and rational
frame-product integrality, to count distinct frames. Equal-frame
fibres are summed by the cutoff partition of unity; their unweighted
cardinality is never charged. The result is B_box=b^(12frn^3).
Integrate this count with product m0_v. Tonelli and A0_v<=m0_v(O_y)
give a uniform bound for the sum of beta_d(gamma^-1y)A(gamma^-1y),
where A=product_v A0_v. Multiply by beta_c(y)A(y) and use the
EXACT quotient disintegration with unipCovolume nu. By (1),

    sum_(d,gamma) integral beta_c(y)beta_d(gamma^-1y)
                                      A(y)A(gamma^-1y)
       <=nu b^(12frn^3+2fr^3) product_v card(I_v)<infinity.       (2)

If a local mass is zero, its pointwise measure bound makes its A0
identically zero, so the kernel and the relevant integrals are zero.
Otherwise every local mass is positive finite and (1) makes its L1
integral finite. Thus (2) never cancels 0 times infinity.

The norm of the tensor kernel is the product of its local vector
norms. It is dominated by (2). If full and cut tensor kernels differ,
at least one factor at one argument differs; BOTH full and cut
norms at that factor gain b^(-3r^3 f). The triangle inequality costs
only 2, so the total full-to-cut error is at most

    2nu b^[f(12rn^3-r^3+2k)] <=(nu/2)b^(-k^3 f).       (3)

We used the actual product-coordinate bound product card(I_v)<=b^(2kf),
r=k+2n-1, and k>=512000n^9. To check the last exponent without
a finite diagnostic: these guards imply r<=2k, k>=16n^3 and k>=3.
Thus r^3-k^3>=3k^2 and 12rn^3<=24kn^3<=3k^2/2, so
r^3-k^3-12rn^3-2k>=3k^2/2-2k>=1. Since b>=4 and f>=1,
the remaining factor 2b^(-f) is at most 1/2, giving exactly (3).

All series are on the actual countable rational-label sets. The
vector kernels are measurable in finite dimension. Thus (2) proves
Bochner integrability and absolute summability BEFORE the complex
sum/integral exchanges in GlobalToLocal and TopFloor. This supplies
amplitudeAbs_lt_top_and_cut_le and its error allowance at the same
correlation caller; it is not a new assumed amplitude theorem.

Remaining upstream: construction of the actual peak with the stated
guards, discrete-series coefficient/derivative identities and Haar
tail input, actual frame-box separation/level hypotheses and group
approximation/intersections, plus the distinct one-vector Siegel--Weil
input. Existing peer derivations retain their own audit status.
No full B or full RH certification is asserted by this composition.

Verification: source-matched mathematical review, no Lean/lake or
new numerical certificate. Existing native primitive receipt has
its A-module timeout and is not a full-human-proof check.
RESUME HERE: use (1)--(3) in the now written sharp correlation
unfolding; audit the retained actual peak/decay and geometric inputs.
Continue pointwise classSize/pairInvariant, one-vector Siegel--Weil,
A lifted-chain height and C safety/arithmetic comparison suppliers.
