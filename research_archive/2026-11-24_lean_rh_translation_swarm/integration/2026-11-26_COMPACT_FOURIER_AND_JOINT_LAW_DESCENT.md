# Local Fourier estimates and the common-law descent

26 November 2026. HUMAN SOURCE-MATCHED DERIVATION, independent audit and native
replay outstanding. Source: Alpöge–Sernau and collaborators,
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, compact source,
Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.

Actual consumer: `New/RealPlace/BandLimits.hasBandLimits_of_isCutBessel` uses
the two local Fourier-modulus bounds, the floor descent and the shell estimate
on ONE Level and its gauges. This note expands those analytic steps;
sections 5–6 construct the source's complex gauge from its actual level.
Its fibre, centering and support estimates retain that same measure.

## 1. Exact complex Fourier normalization

Use Lebesgue area measure on C, the native character psi(z)=exp(z-conj z),
and md(z)=|z|^2. For xi!=0 and h in L1(C^d) intersect L2(C^d), classical
Plancherel gives

    integral_v |integral_w psi(xi sum conj(v_i)w_i)h(w)dw|^2 dv
       = (pi^2/|xi|^2)^d integral_w |h(w)|^2 dw.       (F)

To verify the factor, write xi=a+ib, v=x+iy, w=u+it. The phase is
2i[(bx-ay)u+(ax+by)t]. In the usual exp(2pi i frequency dot w)
normalization the real frequency map is

    (x,y) -> ((bx-ay)/pi, (ax+by)/pi),

whose determinant is (a^2+b^2)/pi^2. Taking its reciprocal proves (F).
In d coordinates take the product Jacobian. If h is only integrable and its
L2 norm is infinite, the corresponding upper bound is automatic; otherwise
it is in L1 intersect L2 and (F) applies. This is the actual
`Place.plancherel_inequality`: c=pi^2 and md(xi)=|xi|^2.
The bound on a modulus, after taking a square root, is (pi/|xi|)^d.
Replacing c by pi in the squared inequality would be a normalization error.

## 2. What the fibre bound says, and why it suffices

Use the actual `FlatCharts.HasFibreBound` on floor b. In the basis of V_b it
provides an S-finite measure zeta, a measure-preserving coordinate map
K((p,w),z), and a density bound mu(p), with

    integral mu(p)dp <= M,
    zeta{z : K((p,w),z) has size j+4} <= mu(p).        (FB)

The map retains p as its fixed coordinates and w as its orthonormal
coordinates. Its pushforward, followed by floorBasis, is the SAME q used
in the integral. If Phi(floorBasis K)<=G(p,w) on size j+4,
G measurable and integral_w G(p,w)<=A for every p, then

    integral_(v of size j) Phi(v)dq(v) <= M A.        (19)

Proof: pull back the nonnegative integral by K; integrate z first. The
integral over the size-restricted z-fibre is at most mu(p)G(p,w).
Integrating w and then p proves (19) by Tonelli. The shift from j to j+4
is the actual inverse-basis bound, not a change in q. No conditional
independence is asserted.

For the floor quadric, the flat chart writes the remaining constrained
coordinates as one hyperbolic cone fibre. The difference of two points of
the same restricted fibre has size j+5; translate by any point of the
nonempty fibre and bound it by that cone's size-j+5 mass. Integrating p
gives exactly the native quadric-fibre bound. The gauge field `fib` bounds
this mass by Lambda^[99n(j+6)]. For floorVolume the same argument uses the
product coordinate box and `volume_le`, with the same sufficient bound.
These are the proofs of `hasFibreBound_floorQuadric` and `_floorVolume`
from the EXACT gauge hypotheses. Sections 5–6 below provide the concrete
inverse-volume and cone-mass fields for the native complex geometry.

For clarity, the floor-amplitude theorem that consumes (19) is as follows.
Let t belong to H_b, t^(-1)q0 belong to N_<b, and q0 x have matrix size J.
For an actual pairing kernel k at floor b put

    a(sigma)=k_(b+1)(sigma x,sigma y).

Then t orbitPoint_b(sigma) has size J+6 wherever a!=0, and for any xi!=0,
shift y0, and q with HasFibreBound(b,q,i,M),

    integral_(v of size i) |integral_sigma
       psi(xi h(v+y0,t orbitPoint_b(sigma)))a(sigma)dtheta_b|^2 dq(v)
       <= M Lambda^[99n(J+12)] (c/md(xi))^d
                            integral |a|^2 dtheta_b. (20)

Here d=card(iota), the native orthonormal-block rank, not the rank of the
whole space. The support assertion follows by moving a nonzero kernel
value to the near box and applying the bounded matrix to orbitPoint.
The kernel is invariant under the stabilizer of orbitPoint, so it factors
measurably through that point. Pushforward the JOINT pair (orbitPoint,a),
then apply (19) to the target q. In the source flat chart, Cauchy–Schwarz
on the constrained z-fibre costs its mass mu(p); its integral is bounded
by Lambda^[99n(J+12)]. The phase in the remaining w coordinates is exactly
xi conj(v) dot w. Apply (F), and then Cauchy–Schwarz in the remaining fixed
coordinates. The resulting square integral of a is its original theta_b
integral by the joint pushforward law. This proves (20); replacing it by
separate laws of orbitPoint and a would be invalid. All complex changes of
coordinates in this argument are isometries or the explicit Fourier scaling
in (F). This is `Gauge.amplitude_support_and_plancherel`, with unchanged M.

## 3. Heisenberg scaling and the two modulus estimates

The actual Heisenberg floor N_a has vector coordinate in V_(a+1) and one
skew central coordinate. Vector dilation by u contributes md(u)^d_a.
The normalized-column support bound gives at most md(u)^(1/2) times
the gauge bound for the skew central fibre. Their combined multiplier is

    fl_a(u)=md(u)^[d_a+1/2],
    d_a=k+1+2(rho-a-1).                              (21)

At C, (21) is |u|^(2d_a+1): each vector coordinate has two real
dimensions, the central coordinate one. This half exponent must be kept.
For nonreal u, multiplication by u need not preserve the skew line;
the central factor is a fibre-length estimate, not an asserted
Heisenberg group dilation by that complex number.

The Heisenberg Parseval lemma has precise support conditions. Let Phi>=0
vanish outside S and satisfy Phi(n)<=C|k_(a+1)(n^epsilon x,ny)|^2.
Suppose the twist d0 obeys

    [fw(d0 n d0^-1)-fw(n^epsilon)]/g = xi fw(n)

on N_a. For every m in S suppose ONE t in Q_(a+1) intersect H_a and
q0 in N_<(a+1) make t q0 x have size i; for every n in S suppose some
nu in N_<a makes column e*_a of
u^-1[nu t m(t n)^-1-1] have size j. Then

    integral Phi d(Heisenberg_a)
      <= C (c/md(xi u))^d fl_a(u)
           Lambda^[100n(i+j+31)]
           integral |k_(a+2)(sigma x,sigma y)|^2 dtheta_(a+1). (22)

To prove it choose a point of S carrying a nonzero integrand; if none
exists the result is zero. Translate to that point by the invariant
Heisenberg measure and split t into its floor and radical factors.
In the coordinates (v,beta), the stated column condition bounds v/u and
the shifted central coordinate; subtraction of two permissible central
coordinates bounds their skew fibre. Integrate that fibre first, using
the gauge `volume_le`. Its dilation contributes the last half power in
(21). Conjugation covariance of k turns its central character into the
Fourier character of frequency xi; dilation changes this to xi u.
Apply (20) to v/u and the next-floor amplitude. Cauchy–Schwarz and the
two recorded fibre-volume bounds multiply their Lambda powers; their
sum is at most 100n(i+j+31), the original sufficient exponent.
This proves `parseval_heisenbergMeasure_of_box` with its full support
premise, rather than assuming a compact support of unspecified size.

Here is how these estimates supply the two actual local Fourier bounds.
Write P_j(g)=floorWeight(j,g,x), b_j(g)=weightedSquareSum(j,g,x),
Z_j=integral b_j dm_j, G=Lambda^(10^6 n^3), and

    D_j=(prod_(a<j) fl_a(p_a^-1))^2 G^3 Z_0 Z'_j.   (23)

The prime denotes the actual translated kernel with w_q^-1 w_p. The
weighted inverse-floor integrations each cost one G and the appropriate
product of fl_a. Weighted Cauchy–Schwarz therefore gives

    f(g)^2 <= A G [b_j(g)/P_j(g)]
                       [b'_j(w_p^-1g)/P_j(w_p^-1g)]
      implies (integral f dm_j)^2 <= A D_j.          (24)

Proof: multiply the two square-root factors, apply Cauchy–Schwarz, and
integrate the reciprocal weights using `lintegral_mul_invWeight_le` once
for p and once for its conjugate head. The selfNorm recurrence makes
Z_j<=Z_0. There are THREE G factors, the one in the hypothesis and the
two inverse-weight integrations; they explain G^3 in (23).

For `formModulus_sq_le_of_char`, W is the actual cut Bessel function,
j<=rho, p is a head, x a position, xi a unit, and eta obeys
psi(eta z)=psi(xi z) for all z in the gauge's size-200n^2 set. At fixed
g with nonzero integrand the common centering theorem makes the two
relevant matrices have sizes 60n^2 and 99n^2. Equation (20) places both
orbit points in the stated bounded supports. Their Gram pairing lies
in the size-200n^2 set by the gauge multiplication and addition rules,
so replace eta by xi ON THAT SUPPORT. Cauchy–Schwarz on one floor and
(20) on the other bound the resulting double integral squared by

    (c/md(xi))^d G [b_j/P_j](g)[b'_j/P_j](w_p^-1g).

The two fibre exponents are
99n(60n^2+12)+99n(99n^2+12)<=10^6n^3 for n>=1.
Now (24) proves the native conclusion

    formModulus_j(psi(eta Z_jj))^2 <= (c/md(xi))^d D_j. (25)

For `formModulus_sq_le_of_heads`, let j=i+1 and
xi=g^-1(p_i^-1-q_i^-1) be a UNIT. The actual conjugation of N_i by
w_q^-1 w_p changes the simple-root coefficient to -xi p_i. Apply
(22) with this frequency and u=p_i^-1; their product is -xi, so
md((-xi p_i)p_i^-1)=md(xi). Use the common near-frame centering and
head-entry bound (entries and inverse entries have size 10n) to obtain
the support premise of (22). Integrate the same floor weights as in
(24). The fl_i(p_i^-1) from (22) is absorbed into the product in (23),
and the two mixed self norms are the ones already appearing there.
This gives the actual second conclusion

    formModulus_j(1)^2 <= (c/md(xi))^d D_j.          (26)

The centering/support bounds, gauge inverse-weight theorem and their
original generous Lambda budget are retained source dependencies of
(25)-(26). They are not removed by calling Plancherel a standard theorem.
In particular (26) does not assert decay at xi=0. The equal-head case is
handled by the positive Gram kernel elsewhere in the native construction.

## 4. Tower Fubini and the common-law descent identity

For the SAME floor measures theta_l define the averaged kernel

    k_l(g,y)=integral k(sg,sy)d(theta_n*...*theta_l)(s).

The pairing-kernel hypotheses include a uniform finite absolute-integral
bound and measurability. Convolution Fubini then proves

    k_l(g,y)=integral k_(l+1)(sigma g,sigma y)dtheta_l(sigma). (27)

There is no limit in (27). The measures are S-finite and the displayed
kernel is integrable, exactly the hypotheses of Bochner Fubini. The norm
inequality gives pivotModulus. For nonnegative weighted squares,
Tonelli gives

    Z_l=integral weightedSquare_l dm_(l+1)+Z_(l+1),
    Z_(l+1)<=Z_l.                                   (28)

These are `FloorKernels.upperPairing_eq_integral_succ` and
`selfNorm_eq_add_succ`. The same measures must be used in both equations.

For descent write K_l(w;x,y)=k_l(y,yx)conj(k'_l(w^-1y,w^-1yx)) with
the actual self and translated kernels, and let kappa_b=headDensity(b,p,q).
Suppose the next-floor parameterization has the EXACT law

    theta_b = ((rho(c)dc).map(v(c)^-1))*zeta,          (29)

where zeta is S-finite and carried by Q_(b+1) intersect H_b, rho is
measurable and finite almost everywhere. The source descent supplier
defines Psi(c), almost everywhere, by

    t kappa_b rho(c) psi(eta Z_bb(v(c)))
      integral K_(b+1)(w_p v(c);x,y)
                   dM(x)d[(zeta*theta_b)*m_b](y).    (30)

Let the integral of formMajorant_b over M be finite. Then Psi is
integrable and

    integral Psi(c)dc = t floorForm_b(p,q;psi(eta Z_bb)). (31)

Proof, including the joint law: expand (29) in the left side of (30).
Use the right-floor invariance for functions fixed on Q_(b+1) intersect
H_b, the simultaneous invariance of the two averaged kernels, and
Haar invariance of M. These changes carry the joint integrand to

    psi(eta Z_bb(sigma tau^-1))
        K_(b+1)(sigma w_p tau^-1;x,sigma g)

under M(x) times m_b(g) times theta_b(sigma) times theta_b(tau).
The equality of the Z_bb phase follows from
Z_bb(uy)=Z_bb(yu)=Z_bb(y) for u in Q_(b+1) intersect H_b:
such u fixes the appropriate orbit vector and its adjoint. This proves
equality of the PUSHFORWARD LAWS OF THE ENTIRE DISPLAYED INTEGRANDS,
not merely their individual coordinate marginals. The right side is
the defining double integral of formIntegrand_b. The norm of that
integrand is bounded by the product of the two pivotModuli, hence by
formMajorant_b after integrating g. The assumed finite integral
therefore proves integrability before any complex Fubini swap. Applying
the joint-law identity to the norm first, and to the complex integrand
second, proves (31) and its absolute-integrability assertion. This is
`Level.integral_succ_floor_eq`; no probabilistic independence or
independently chosen theta_b is used.

At an ordinary floor a<rho take zeta=Heisenberg_a,
v(c)=floorWeyl_a(c), rho(c)=md(c)^d_a. This is precisely the definition
of weylLaw and floorMeasure, so (29) holds. For c!=0, the Weyl and
Heisenberg multiplication laws and kappa_(a+1)/kappa_a=md(c)^d_a
identify (30) with

    psi(eta c) t floorForm_(a+1)((p,c),(q,c);1).

The set c=0 has Lebesgue measure zero; the source's unitOrOne
convention there changes no integral. Thus

    integral_c psi(eta c)t I_(a+1)((p,c),(q,c);1)dc
       = t I_a(p,q;psi(eta Z_aa)),                   (32)

with an integrable left side. Equation (32), with the SAME appended c
in both heads, is the actual `Gauge.integral_floorForm_succ` used by
the sieve. Independent appended parameters would not give this identity.

## Inputs retained in sections 1–4

The source-specific local Fourier deductions (25)-(26) still depend on
the exact centering/support and inverse-weight geometry of a gauge.
The joint-law descent (31)-(32) depends on finite integral of the actual
formMajorant; ComplexShells supplies this through its shell theorem,
not from boundedness of W alone. These boundaries remain explicit.
The existing real-band peer fc278308 supplies the downstream Schur
energy and exponent assembly; do not rederive them.

## 5. The complex gauge's inverse-volume supplier has a direct proof

This supplies the actual `Gauge.com` field in `RealPlaceSizes.gauge`,
including its singular integral. It is more specific than an arbitrary
assumption of finite inverse moments. Fix the native complex level g=1,
ball of radius 1/4, and orthonormal-part matrix e. Put d=card(iota)=
s+1+3n, L>=rho>=8r, Lambda=L^2. Let x,y be the actual unitary elements,
and v any rho-row constraint matrix. The source W is

    {w : v w=0 and (x^-1 e w,(xy)^-1 e w) in closePairs},
    closePairs={(a,b): ||a||<1/4, ||a-b||<1/4}.

Let N be a row matrix whose kernel is the +1 eigenspace of J1; its
rank is n, since J1 has negative index rho+1=n. Stack the three matrices

    C=(v ; N x^-1 e ; N (xy)^-1 e).

Its rank is at most rho+2n<=3n. Therefore ker C contains an
(s+1)-dimensional subspace. Choose ONCE an orthonormal column matrix O
for such a subspace, before choosing u or integrating. Thus CO=0,
O*O=1. If w is in its range, the two images x^-1 e w and (xy)^-1 e w
lie in the positive J1 eigenspace. Unitarity and e*J1e=1 imply that
both have Euclidean norm ||w||. In particular ||w||<=1/9 implies
w in W, since 1/9<1/4 and 2/9<1/4.

For u in C^d put R(u)=||O*u||^2 and phi(u)=36/R(u), with phi=infinity
when R=0. For R>0 and |t|<=sqrt(R)/9 choose

    w=O[(t/R)O*u].

Then ||w||<=1/9 and star(u) dot w=t. Thus the image of W under this
functional contains the closed disc of radius sqrt(R)/9. Its inverse
area is at most 81/(pi R)<=36/R=phi(u).

The SECOND inequality in `Gauge.com` uses the SAME phi. Choose w above
with t=sqrt(R)/9. If a complex c belongs to the source's allowed set,
there are z,z' in closePairs with

    star(c u) dot w = h(z1,z1')-h(z2,z2').

Since ||J1||=1, the right side is at most
||z1-z2|| ||z1'|| + ||z2|| ||z1'-z2'|| < 3/16.
Hence |c|<27/(16sqrt(R))<=3/sqrt(R). The allowed c-set has area at
most 9pi/R<=36/R=phi(u). When R=0 both required inequalities have
infinite right side and are automatic. Phi is measurable, including
this specified value on its zero set. No new phi is chosen for either
inequality.

It remains to prove the exact integrability requirement, for every j>=0:

    integral_(|u_i|<=L^j) phi(u)^s du
                  <= Lambda^[99n(j+1)].             (33)

Extend O to a unitary basis and rotate. Lebesgue measure is unchanged;
the first s+1 coordinates are O*u. The original polydisc is contained
in ||u||<=sqrt(d)L^j. Since d<=L, in the rotated coordinates its
projected squared radius is <=L^(2j+3), and each of the other 3n
coordinates has modulus <=L^(j+1). Consequently polar integration in
C^(s+1) bounds the left side by

    [36^s pi^(s+1)/s!] L^(2j+3)
                               [pi L^(2j+2)]^(3n). (34)

This is finite: the radial density is pi^(s+1)t^s/s! dt, cancelling
the singular power t^(-s). The choice s+1 rather than s is essential.
At s=0 the same formula is the ordinary volume bound; the zero set
is null and poses no limiting problem. Since

    36^s pi^(s+1)/s! <= pi exp(36pi) <=4*3^144,

and L>=4, (34) is at most L^[148+2j+9n+6nj]. Finally

    198n(j+1)-(148+2j+9n+6nj)
       =192nj+189n-2j-148 >=0

for n>=1,j>=0. This proves (33), because Lambda=L^2.
It reconstructs `exists_orthonormal_ker_lintegral_le` and the `com`
constructor with their exact source constants. No new asymptotic
estimate or fitted parameter is used.

This supplies that inverse-volume field at its native interface as a
human derivation, pending independent audit/replay. Section 6 supplies
the other numerical gauge fields. The shell cap, Haar normalization and
complete pointwise geometric estimates remain separate dependencies.
In particular the proof of
(33) does not by itself establish finite integral of formMajorant
required by (31); that still uses the shell argument.

## 6. Cone mass from the actual flat chart; all complex gauge fields

The remaining substantive field of the complex gauge is its hyperbolic
cone bound `fib`. It can be proved directly with the exact source measure,
without guessing a coarea normalization. In `Place.lean`, quadricMeasure(T,0)
is the image of dt dw d(beta) under the chart of ONE EXTRA hyperbolic
plane together with T. Thus when T is t hyperbolic planes, w has 2t
complex coordinates. This extra plane is essential to the dimension count.

At C, tau=1/2 and the skew measure is the image of ordinary real
Lebesgue measure under a->ia. For t0!=0 the chart is

    ((t0,w),a) -> (t0[-h(w,w)/(2|t0|^2)+ia], t0, w),
                     dt0 dw da.                     (34a)

Here h(w,w) is real. If all image coordinates have modulus <=R, then
|t0|<=R and |a| |t0|<=R. Consequently

    |t0| <= 2R/sqrt(1+a^2),  |w_i|<=R.

The exceptional set t0=0 is null for dt0. For each a the source
parameter set is therefore contained in the displayed complex discs.
Tonelli, their ordinary areas, and integral_R da/(1+a^2)=pi give

    quadricMeasure(T,0){all coordinates <=R}
       <= integral_R [4pi R^2/(1+a^2)](pi R^2)^(2t)da
       =4pi^(2t+2) R^(4t+2).                        (35)

This uses the chart's dt0 dw da itself; no unstated hypersurface
density or extra factor of 2 enters.

For the complex gauge m=0, the native `fib` quantifier is 0<=t<=rho=n-1.
Put R=L^j. Since L>=4, (35) is at most

    L^[2n+1+(4n-2)j] <= L^[198n(j+1)]
                       =Lambda^[99n(j+1)].          (36)

The exponent difference is (194n+2)j+196n-1>=0 for n>=1,j>=0.
This proves exactly the required field, including t=0.

The remaining fields of `RealPlaceSizes.gauge` are elementary for
B_j={z:|z|<=L^j}, Lambda=L^2:

- Products have size i+j. A sum of at most r+1 terms has size i+1,
  since r+1<=L. Negation and conjugation preserve size; 0 and 1 have
  every nonnegative size. The Gram matrix and inverse have size 1.
- B_j is compact, Lambda>=2 and finite, c=pi^2>=1, and the complex level has m=0.
  The explicit complex hyperbolic basis has entries of norm <=1;
  g=1 and tau/skewUnit=-i also have size 1.
- The box has operator norm <=rho<=L, hence entries of size 1; the
  level's radius-1/4 ball lies in the coordinate size-1 box.
- md(u)=|u|^2<=Lambda^j for u in B_j. The area of B_j is
  pi L^(2j)<=Lambda^(j+1).
- The cone field is (36), and the inverse-volume field is the SAME
  phi and integral (33) of section 5.

These verify all fields of the native Gauge record on the given complex
level for EVERY L>=rho. The choices O and phi are made for each fixed
triple (x,y,v) in the order required by the record; no dependence on the
subsequent test variable u is introduced. This gives a human construction
of `RealPlaceSizes.gauge`, subject to independent audit/replay.

The separate Haar ratio and head/back-substitution shell support are now
expanded in 2026-11-26_COMPACT_COMPLEX_HAAR_AND_SHELL_SUPPORT.md, and peer
2e075352 supplies the shell sum. These results supply finite majorant
integral at the joint-law caller, subject to their retained capped-pivot
and weighted selfNorm predecessors. Bessel majorant construction and the
pointwise classSize/pairInvariant bounds still require their actual
source witnesses and normalization requirements.

No native Lean execution of this note has been performed. The scalar
fibre, inverse-moment and cone exponent comparisons and source hashes can be checked by
`verify_compact_lattice_convergence.py`; its scope is arithmetic and
source bytes only. The authenticated historical RUN28 receipt (nineteen
files, six negative controls) is separate evidence, not a replay here.

RESUME HERE: independently audit the common pushforward law (29)-(31)
against the actual LocalTheorem.integral_succ_floor_eq body and the
two uses of the SAME phi in section 5 against ComplexGauge.gauge.com.
Audit the flat-chart cone normalization (34a)–(36) and the companion Haar
and shell-support derivations; then complete the capped pivot/selfNorm
predecessors and actual pointwise classSize/pairInvariant estimates. Preserve c=pi^2,
the half power in floorModulus, all support guards and common measures.
