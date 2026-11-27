import New.Filling.DegreeBounds

/-!
RUN70, 27 Nov 2026 — actual Bessel-system formal degree and band normalization.
Human source-matched derivation; prepared Lean probes and scalar certificates,
NOT compiled. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean 72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Current mission completion-first, not the superseded outer-shell alternative.
Recent peer heads a17effa4, bf38eadc, 2203bfae, a2e4e787, 47581d42,
b0fe2a3e and 600d03e0 inspected for scope. RUN69 word estimates retained.

Actual caller: New/Filling/FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278
Data.exists_besselSystem, lines 55-116: takes both parts of
Orbital.harish_chandra_degree_and_orbital, then uses the degree equality
in hasBandLimits_of_isCutBessel. It does NOT suffice to replace the pair
by the scalar degree bound, since the orbital identity is also retained.

1. Sector determinant bound: a direct positive-matrix proof
Lib/DiscreteSeries/Character/SectorBound.lean  (pinned path),
le_norm_weightMinors_twoPowDiagConj. Let u be ordinary unitary, l,f
integer vectors; f_a+|m|<=f_c if l_c<l_a. Put D=diag(2^f).
For each threshold t between min(l)+1 and max(l), put S={a:l_a>=t}
and T=complement. In the threshold product of weightMinors the common
determinant factor cancels because det(u*Du)=det D. The remaining factors
are det((u*Du)_S)/det(D_S). Each >=1: the Cauchy-Binet sum over row sets
of size |S| has coefficients |det(u_{R,S})|² with sum 1 and every
D_R product >= D_S, since f on S is at most f on T.

Suppose l_i>=l_j and h<=l_i-l_j. For t=l_i-h+1,...,l_i,
i in S and j in T. Let c=min_{a in T} f_a, d=2^c and D'=diag(min(2^f,d)).
Then D'<=D and D'_S=D_S; D'|T=dI. Set A=u*D'u, B=A^-1.
B>=d^-1 I and B_jj>=|u_ij|² 2^-f_i. Jacobi and the spectral theorem give
    det(A_S) = det(A) det(B_T)
             >= det(D_S) d^|T| d^(-|T|+1) B_jj
             >= det(D_S) |u_ij|² 2^(c-f_i).
Indeed all eigenvalues of B_T are >=d^-1 and its maximum is >=B_jj.
Monotonicity of positive principal determinants returns to u*Du.
The f-gap implies c-f_i>=|m|>=m. Multiply the h selected threshold
bounds and the remaining >=1 factors:
    |m_l(D)| (|u_ij|² 2^m)^h <= |m_l(u*Du)|.
For l_i<l_j apply to (-l,-f) and use the exact weight-minor inverse
identity (u*Du)^-1=u*D^-1u; h=0 uses just the baseline. Empty thresholds
and determinant factors are harmless. No assumption about phases of u.
This supplies the precise sector estimate for the off-orbit argument.

2. Off-orbit low coefficient elimination
FormalDegree.lean 99b93259ace473b9d13707a06f4aa28cb050d881,
Orbital.coeff_eq_zero_of_low_level. Let w=paramAddRho l,
o an integer order opposite to l, h the native gap, L=o dot w+h.
On the compact complement of openOrbit, some off-sign entry of u is
nonzero: if all vanish, u commutes with J and belongs to G, hence openOrbit.
The maximum of the finitely many off-sign squared entry norms has a
positive minimum on the complement (empty complement gives zero integral).
The numerator |m_{-Lambda_comp}(u*Ju)| is bounded there: the negative
weight-minor formula here has polynomial numerator on det J fixed,
as in the native offOrbitIntegral. Keep its exact continuous extension
on possible vanishing minors (do not evaluate a reciprocal at a zero).

For any fixed integer vector e take f=-(s o+e), weights -w, s an integer
tending to infinity. For sufficiently large s the ordering hypothesis
of section 1 holds with m=s-C, C=max_{a,b}|e_a-e_b|. The native opposite
gap is at least h. Hence uniformly on the off-orbit complement,
  |m_{-w}(u*diag(2^f)u)|
     >= c_e 2^(s(o dot w+h)) ,
where c_e>0 absorbs the minimum off-sign entry and e dot w-C h.
Thus the offOrbitIntegral at A=diag(2^f) is O_e(2^(-s L)).
This is the exact exponent required, independent of s.

If P(x)=Q(x) offOrbitIntegral(Jx) on the accretive torus sector, restrict
to x_i=epsilon_i z^(s o_i+e_i). The equality extends along the positive
real z axis by the identity theorem: all diagonal powers are positive
there, all compressed denominators nonzero, and the compact u integral
is holomorphic locally by uniform domination. Near z=1 the equality
holds on a torus arc. Evaluate at z=1/2. If the least o-level a in
supp(P) satisfies a<L+min_{beta in supp(Q)} o dot beta, then multiply
the equality by 2^(s a) and let s grow. The right side tends to zero.
The left side tends to
    sum_{o dot gamma=a} P_gamma epsilon^gamma 2^(-e dot gamma)=0
for every integer e. Distinct gamma yield distinct multiplicative
characters of Z^n; their finite linear independence follows also by
choosing an integer direction separating the finitely many dot products
and using a Vandermonde matrix along its multiples. Thus every
least-level coefficient is zero, contradiction. Therefore every gamma
with o dot gamma<L+o dot beta for ALL beta in supp(Q) has P_gamma=0.
If Q=0 this follows immediately by torus uniqueness. This proves the
native low-level elimination without a norm on P before cancellation.

3. Laurent polynomial and formal degree uniqueness
FormalDegree.lean, exists_laurent_orbital_integral and
harish_chandra_degree_and_orbital. n>=1; h=500n³+10n⁵, N=4n².
Let Vc=l.rootProd Eq, Vnc=l.rootProd Ne, D=(-l).rootProd Ne,
s0=(-1)^#oppositePairs, so D=s0 Vnc. Put delta=(-l).lowerCount Ne,
o=(-l).compactForm.lowerCount Eq, kappa=w+o, b0=kappa+N delta.
Then 2kappa_i=l_i+n-1. Let A_epsilon be the restricted alternant
and A_all the full alternant, at kappa; E_epsilon=D^N A_epsilon.
The native polynomial P=Vc D^(N+1) d0 integral_G psi(g^-1 x g)
is antisymmetric under W_K and is a cone-series multiple.
Here d0=formalDegree>0, not a freely adjustable Haar constant.

Retain the exact integrability and K-type multiplicity suppliers
in exists_laurent_orbital_integral. Its finite-polynomial mechanism
is as follows: compact Weyl character orthogonality gives the
coefficients of the continuous class integral D times orbital integral
as convolution of integer coefficients of D^(N+1) with signed
integer K-type multiplicities. These are integers (possibly negative).
Bessel's inequality in L²(K) leaves only finitely many nonzero
coefficients, since each nonzero integer has squared absolute value
>=1. Completeness follows from uniform approximation of torus class
functions by Weyl-symmetrized Laurent polynomials; alternants divided
by Vc span these polynomials via the compact Weyl character formula.
Thus multiplication by Vc yields the finite polynomial, with the
native cone support and lowest multiplicity one. The uniform
integrability of D^(N+1) times the conjugated coefficient is a
separate analytic estimate in that theorem; not inferred merely
from Bessel's inequality.

The native cone-series support gives P_b0=1 and, for each exponent
in supp(P), some W_K translate at level <=o dot b0. Here is the
leading-term reason: each D root selects its unique larger o-index
for the leading monomial (coefficient 1); replacing that choice
reduces integer level by >=1. The root cone has nonpositive o-level.
For a nonleading term at b0, permute the cone to its dominant chamber;
rearrangement for the strictly antiordered o,b0 gives
o dot (b0 composed w)>=o dot b0, strict unless w=identity.
Hence no such term survives at b0. The same reasoning gives
(E_epsilon)_b0=1 and the identical orbit support condition.

The open-orbit Haar transfer and compact averaging give
  sigma integral_G psi(g^-1 x g)
       = c0 chi_compact(x)-offOrbitIntegral(Jx),
|sigma|=1, c0=kTypeNormSq of the compact lowest weight.
Retain the actual normalized open-orbit formula, rather than
assume an unrelated Haar scale. The exact native derivation uses
the triangular factorization k=gB, with positive diagonal B;
its Jacobian in skew lower coordinates has absolute value
prod_i B_ii^(2 r_i), r_i=#lower-#higher for the order.
Indeed the induced map on each lower complex coordinate (i,j)
has diagonal multiplier B_ii/B_jj, with real determinant its
square; the conjugated diagonal sign factors have abs 1.
Ordering by separation makes the map triangular. QR uniqueness
with positive diagonals gives a bijection of the overlapping flag
charts; ordinary compact QR covers every g in G. The covariance
factor for the integrand equals this Jacobian. Both Haar measures
have the SAME compact-dual divisor volU(n); integrating on the
overlap gives the compact integral minus its complement. This
supplies the Jacobian/covariance explanation of the native open
orbit identity, retaining the smooth chart and change-of-variables
inputs and the exact triangular Flensted-Jensen weight covariance.
Compact averaging with the existing projection gives c0 chi.
The Weyl dimension formula in the compact normalization follows
by the confluent alternant/Vandermonde limit at x=1 and Schur
orthogonality of the normalized highest vector:
  c0^-1=prod_{l_j<l_i} ((l_i-l_j)/2)/prod_{i=0}^{n-1}i!.
Here l is the doubled parameter, so the division by 2 is essential.

Now multiply the open-orbit identity by Vc D^(N+1) d0/sigma
(with sigma division applied to the original integral). The Weyl
denominator identity Vc Vnc=V_all gives the EXACT cancellation
    P-c E_all=Q offOrbitIntegral(Jx),
where E_all=D^N A_all, c=d0 c0 s0/sigma,
Q=-(d0 s0/sigma) V_all D^N. No separate bound on P or E_all.
For clarity, the product has at most n² root factors in V_all,
and the o-level spread of D^N is <=N n²(n-1)<=4n⁵.
Since o_i in [0,n-1], sum o_i²<=n³ and every exponent of V_all
has nonnegative o-level. Thus for any beta in supp(Q),
    o dot b0-(o dot w+o dot beta)<=n³+4n⁵<h.
Section 2 kills every coefficient of P-c E_all at levels <=o dot b0.

At those same low levels E_all and E_epsilon coincide.
Indeed every permutation outside W_K is nonidentity. With o the
opposite rank order, rearrangement with gain gives
    o dot (kappa composed w) >= o dot kappa
                                  + |kappa_i-kappa_(w i)|
for any moved i: apply ordinary rearrangement also to o+e_i and
o-e_i, which stay weakly antiordered. The gain is >=h/2,
larger than the spread <=4n⁵ of D^N. Hence no such term can
reach level <=o dot b0. This argument also applies if n=1
(no moved index). Consequently P=c E_epsilon on the low levels.
Antisymmetry and the common W_K orbit support extend equality
to every exponent. Comparing the leading coefficient gives c=1,
not merely |c|<=1. Since |sigma|=1 and d0,c0>0, d0=c0^-1.

For distinct torus entries cancel the nonzero V_all and D^N:
    d0 integral_G psi(g^-1 x g)=s0 A_epsilon(x)/V_all(x).
Sum over all permutations of x. The denominator changes by
the sign of the permutation; every term in the full alternant
occurs |W_K|=p!q! times. With dsKernel the conjugate coefficient
times d0, this is precisely
    s0 sum_sigma integral_G dsKernel(g^-1 (x composed sigma) g)
       = p!q! conjugate(chi_compact(x)).
This recovers BOTH conclusions of harish_chandra_degree_and_orbital,
conditional on the explicit integrability, open-orbit and
K-type multiplicity primitives, not an assumption of RH.

4. Actual band-normalization caller, exact factorial cancellation
New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1c1f2451058
Shape.bandConst and Lib/DiscreteSeries/Haar/CompactDualMeasure.lean
f635acc5ac6f4c029eaa652374087216a1dccb6a, volU.
Set r=k+2rho+1, k<=r, q=r-k; native volU(j)=prod_{i=1}^j
(2 pi^i/(i-1)!). Thus Theta=volU(k)/volU(r) pi^(q k)
=2^-q pi^(-q(q+1)/2) prod_{i=k}^{r-1} i!.
For the native doubled weight l=Data.paramW v, combine with
degree BEFORE bounding:
    d0 Theta = 2^-q pi^(-q(q+1)/2)
      prod_{l_j<l_i} ((l_i-l_j)/2) / prod_{i=0}^{k-1} i!.
All factors positive. Actual |l_i|<=3a and 3a<=b³ by Data's
HasLogBound, b>=1. Hence each half-difference <=3a<=b³;
the prefactor and reciprocal factorial product <=1. With
r(r-1)/2 pairs, d0 Theta <=b^(3r(r-1)/2)<=b^(4r²).
This supplies the exact hD premise to
New/RealPlace/BandLimits.lean 20ff4e65c2599fc8b752dbb93673ed65053e2216
hasBandLimits_of_isCutBessel at FillingData line 101, with same
d0, Haar, cut/full functions, actual derivative Schur constant
d0^-1 card I (RUN69), positive degree and nonempty I. It does
NOT prove the separate floor-form recursion, top Gram identity,
or the quotient cut error transfer in that theorem. Those
remain visible, as do Siegel-Weil/Rallis and exchange.

Evidence: actual compact source paths read for FormalDegree,
SectorBound, KTypeMultiplicity (9420484a98e71e4bdf9d482a5ea7d92cf39a81e9),
LaurentAlternants (612a274a0589a536330770f7b83638257e405153),
FillingData, BesselSystem, BandLimits, CompactDualMeasure, HaarMass,
SphereFibreIntegral, DegreeBounds and Rallis/SharpData. Native
source-visible graph: enough_forms -> filling -> exists_besselSystem
-> formalDegree/Orbital + hasBandLimits -> cut/Schur/floor forms.
Local replacement: threshold determinant, low-level elimination,
leading-coefficient comparison, factorial cancellation. Context key:
pin, same l/signature/order, Haar d0, actual shape and cut pair.
Original/reduced global typed graphs and axiom ledger untouched;
no global node pruned. No URT or imported RH theorem. Local lean/lake
not found. No native rh_scan/rh_prune/rh_reduce/rh_auto/frontier run.
Fresh GitHub run API: 45799225653,45577239749,45576756833 and
45803534769 completed success at historical heads, not this file.
45803534769 wrapper success is not full module proof completion.
The following certificates/probes are PREPARED, not executed.

RESUME HERE: exact hasBandLimits_of_isCutBessel floor recursion/top
Gram and quantitative energy at actual Data.exists_besselSystem;
then distinct SharpData doubling/SiegelWeil and Rallis caller hypotheses.
Independent audit weight-minor sign convention, analytic continuation,
open-orbit covariance and low-level spread, and same Haar normalization.
HANDOFF TO integration/editor, independent audit, native runner.
Human RH reconstruction incomplete.
-/

namespace RHPositivityRun70

theorem level_gap (w b beta n3 n5 h : ℝ)
    (hspread : b - (w + beta) ≤ n3 + 4*n5)
    (hgap : h = 500*n3 + 10*n5)
    (hn3 : 0 < n3) (hn5 : 0 ≤ n5) :
    b < w + beta + h := by linarith

theorem permutation_exclusion (base gain spread level : ℝ)
    (h₁ : base + gain - spread ≤ level)
    (h₂ : spread < gain) : base < level := by linarith

theorem band_exponent (r : ℝ) (hr : 0 ≤ r) :
    3*r*(r-1)/2 ≤ 4*r^2 := by nlinarith [sq_nonneg r]

end RHPositivityRun70

#check le_norm_weightMinors_twoPowDiagConj
#check integral_haar_eq_integral_openOrbit
#check weyl_dimension_formula
#check Orbital.exists_laurent_orbital_integral
#check Orbital.coeff_eq_zero_of_low_level
#check Orbital.harish_chandra_degree_and_orbital
#check Data.exists_besselSystem
#check hasBandLimits_of_isCutBessel
#print axioms RHPositivityRun70.level_gap
#print axioms RHPositivityRun70.permutation_exclusion
#print axioms RHPositivityRun70.band_exponent
#print axioms Orbital.harish_chandra_degree_and_orbital
#print axioms Data.exists_besselSystem
