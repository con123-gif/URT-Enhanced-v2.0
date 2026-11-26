# Weighted tower energy at the complex shell caller

26 November 2026. HUMAN SOURCE-MATCHED DERIVATION, pending independent
mathematical audit and native replay. Source: Alpöge–Sernau and collaborators,
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src/, Lean 4.35.0, Mathlib
56a005855ea17e0b0958f73ec801ae140b0a1679.

This continues the Haar/shell-support and Fourier/joint-law notes at the
actual LocalTheorem -> ComplexShells caller. It supplies the capped pivot,
weighted selfNorm and position-integral predecessors retained there.
Throughout use the actual complex Level (its unit g=1), ONE gauge Gamma
with constant Lambda, h=varrho, n=h+1, d=card(iota)=k-1, and c=pi^2.
All measures and kernels below are those of that Level. In particular,
M=lambda dy is Haar by the previous note; it is not renormalized here.

## 1. Exact weights and one admissible kernel family

Let theta_l be the floor measure; nu=upperMeasure 0. Set

    P_l(z)=product_(a<l) vol(floorValues(a,z,x))^s,
    k_l(z,y)=integral k(sigma z,sigma y)d upperMeasure l,
    A_l(z)=P_l(z)|k_(l+1)(z,zx)|^2,
    B_l(z)=integral [A_l+B_(l+1)](sigma z)dtheta_l(sigma) (l<=h),
    B_(h+1)=0,
    Z_l(x)=integral B_l(z)d(theta_(l-1)*...*theta_0)(z).

Every P_l is positive and finite: the floorValues set is open, contains
zero and is bounded, by the actual open ball and compact closure of the
Level. Thus all divisions by P_l below are legitimate; no infinite
weight cancellation is used. If sigma belongs to H_l, P_l(sigma z)=P_l(z),
since H_l is contained in Q_l. In particular

    P_(l+1)/P_l = vol(floorValues(l,z,x))^s.          (T1)

Let W be the cut Bessel function, W' a bounded measurable Bessel function
of the same frequency, and t=w_q^-1 w_p for heads of length j. The kernels

    k(z,y)=<W(z),W'(t y)>,   k0(z,y)=<W(z),W(y)>

are the SAME IsPairingKernel objects needed by the caller. Indeed:

* Their measurability and boundedness follow from those of W,W'.
* The first factor forces nearness wherever a kernel is nonzero.
  Quadric fibre mass and the compact last floor give a uniform finite
  bound on the upper-floor measure of that support, by descending
  induction on the number of floors. If each floor has bound V>=1,
  the upper measure at l is at most V^(n-l) on this near support;
  the last compact factor has mass at most one. This proves absolute
  convergence of every upperPairing, without using a shell integral.
* Conjugating the two unipotent arguments past the upper floors and
  applying the actual Bessel laws gives

      k_(l+1)(u z,u' y)
         =psi(simpleRootSum(tu't^-1)-simpleRootSum(u))
                                                     k_(l+1)(z,y).

  The inner product is conjugate-linear in its first entry. This fixes
  the sign of the phase. The diagonal t normalizes these radicals and
  commutes with H_j. The common phase has modulus one.

The required floor bound V is available before this argument:
the source fibre bound at size seven costs Lambda^(1287n), and the
orthonormal box of size eleven costs at most Lambda^(12d). Thus one
may use V=Lambda^(1287n+12d). The near-box orbitPoint has size seven;
its pushforward law is the actual floor quadric, so this bound applies
uniformly in the untranslated point. This proves the kernel-admissibility
and finite-integral fields used below, not just a covariance identity.

## 2. The three weight integrals

Write C=Lambda^(10000n), G=Lambda^(1000000n^3), and
K_a=c^d Lambda^(4600n). In the complex Level the source
floorModulus at its unit is one. Its value at p_a^-1 is retained below.

First,

    integral_(sigma z near l+1) P_l/P_(l+1)(sigma z)dtheta_l
         <= C                         (l<h).        (T2)

To prove it, move a near point into the SAME box and push its orbitPoint
to the floor quadric. The first part of Gauge.com bounds the inverse
volume of its floorValues by phi of the orthonormal projection, with
the SAME phi as in the gauge construction. The quadric fibre bound
at size seven is Lambda^(1287n). The projection has size eleven,
whose phi^s moment is at most Lambda^(1188n). Their product is at
most C. The indicator of nearness ensures the coordinate bound;
the stabilizer invariance permits the move into the box. This is
WeightPlancherel.floorMassLe_floorWeight_div.

Second, put N_<l=eta_0*...*eta_(l-1). For a near point z,

    integral_N_<l 1_positions(z^-1 u y)P_l(z,z^-1 u y)du
         <= product_(a<l)K_a,                       (T3)

where positions means Gamma.positionsOfSize. No finite Haar mass of
that set is presumed. Induct on l. Fix one nonzero point of the
integrand and translate it to the origin of the current Heisenberg
floor. Two positions at that fixed box point differ, after conjugation,
by a matrix of size fourteen (FlatCharts.conj_mul_inv_close_to_one).
That bound follows by multiplying the box, the difference of the two
size-one position matrices, and the inverse of their box product.
Thus the normalized Heisenberg column is of size fourteen.

The new floorValues volume is bounded by the SECOND part of Gauge.com.
In fact for any of its values c0 and every w in that field's W, expansion
of the hermitian pairing of the two close pairs gives

    star(c0 u0) dot w = h(z1,z1')-h(z2,z2'),          (T4)

where u0 is the orthonormal Heisenberg vector. All four vectors are
the close-pair witnesses for the same position pair. Thus c0 belongs
to the scalar set whose volume is bounded by phi(u0). Apply the
induction hypothesis to the lower floors, then integrate phi(u0)^s.
The Heisenberg column estimate gives the central-fibre factor
Lambda^16; the floor-volume fibre and phi moment cost respectively
Lambda^(1980n) and Lambda^(1881n). Their product is at most
Lambda^(4600n). The extra c^d in K_a is allowed since c>=1.
This proves (T3). In particular one must use the second Gauge.com
inequality here; the inverse-image inequality alone is insufficient.

Third, for ANY S-finite rho, any measurable nonnegative Q_b-invariant
Phi vanishing off points near at b, and b>=j,

    integral Phi(z) invWeight_j(x,w_p z)d(N_<j*rho)(z)
      <= G product_(a<j)floorModulus_a(p_a^-1)
                                             integral Phi drho. (T5)

Here invWeight is 1/P_j on points near at j and zero elsewhere.
Use its indicator, then choose a box representative for each near
rho-point. Invariance of Phi removes the N_<j variable. At the
next floor use the FIRST Gauge.com inequality, with row constraints
(nu orthonormalPart)'s first h rows. These constraints retain precisely
the lower-floor coordinates already fixed. The image constructed by

    w -> w_(p through a+1) (Heisenberg_a * nu) orthonormalPart w

lies in the actual floorValues set: its first a dual coordinates vanish,
by those row constraints, and its two inverse translates are the same
close pair. Hence inverse volume is bounded by the corresponding
phi. The head-minor estimate in the Haar/support note bounds the
normalized column by size 20n+1, which can be enlarged to 40n.
The Heisenberg vector scaling is (-star p_a)^-1; its module is exactly
floorModulus_a(p_a^-1). The fibre and moment estimates at size 40n
cost no more than

    Lambda^[99n(40n+6)+99n(40n+5)+40n+2]
       <= Lambda^(1000000n^2).

Multiply these estimates on j floors, with j<=n. Their product is
bounded by G and gives (T5). This proof uses the first Gauge.com
bound on the SAME constrained W, not a freely chosen marginal fibre.
All three arguments concern nonnegative integrals and use Tonelli.

## 3. Capped pivot induction

Suppose that whenever the original kernel k(sigma z,sigma zx) is
nonzero, sigma in H_l, SOME floor a>=l has volume at most epsilon,
where 0<epsilon<infinity. Then

    pivot_l(z)^2
      <= epsilon^s C^(h-l) B_l(z)/P_l(z).            (T6)

At l=h no such floor remains, so the nonzero-kernel set is empty and
the pivot is zero. Descend on l. Weighted Cauchy–Schwarz with
u=P_l/P_(l+1) and (T2) gives the factor C. For each sigma in its
integral, distinguish whether the current floor is capped.
If it is, P_(l+1)<=epsilon^s P_l, so its contribution is bounded
by epsilon^s |k_(l+1)|^2. If it is not, every subsequent nonzero
kernel must have a cap on a later floor: multiplication by H_(l+1)
preserves the present floorValues, by its Q_(l+1) invariance.
Apply the induction hypothesis to its next pivot, using
|k_(l+1)|<=pivot_(l+1). The factor P_(l+1) from Cauchy–Schwarz
cancels its positive denominator. Both cases are bounded by

    epsilon^s C^(h-l-1) [A_l+B_(l+1)]/P_l.

Integrate theta_l and multiply by C to obtain (T6). The cap may
depend on sigma; no single floor is selected for the whole integral.
This is the actual pivotModulus_sq_le_of_capped, on the positive
finite epsilon domain needed by ComplexShells.

## 4. Weighted energy: an explicit descending invariant

Set

    N(k)=integral_nu integral_nu |k(z,y)|^2 dz dy,
    D=product_(a<h)K_a,     E=D N(k).

The required inequality is

    integral_positions Z_j(x)dM(x) <= n E.           (T7)

It is automatic if E=infinity; otherwise the following nonnegative
induction proves it without assuming integrability beforehand.
Factor M=N_<l*rho_l, starting at l=n with rho_n=nu. At each downward
step set rho_l=eta_l*rho_(l+1). Define

    W_l(z,y)=integral_N_<l 1_positions(z^-1 u y)du,
    Phi_l(z,y)=1_{W_l(z,y)>0}|k_(l+1)(z,y)|^2,
    Q_l=integral_(theta_l*...*theta_0) integral_rho_l Phi_l,
    D_l=product_(a<l, a<h)K_a.

The indicator definition is the source's min(infinity W_l,|k|^2);
in particular it gives zero when W_l=0, even if |k| is unbounded.
Maintain the two inequalities

    D_l Q_l <= E,
    l E+integral_positions Z_l dM <= n E.            (T8)

At l=n, Q_n<=N(k), since theta_n*...*theta_0=nu and
k_(n+1)=k. Also Z_n=0, so (T8) holds.

For l<h the specialized one-sided Heisenberg Plancherel estimate gives

    Q_l <= K_l Q_(l+1).                             (T9)

Its source parameters are epsilon=0, xi=u=1, i=1 and size j0=14.
The multiplier is therefore c^d Lambda^[100n(1+14+31)]=K_l,
with no scalar missing. The hypotheses follow as follows. A nonzero
Phi gives a positive-measure overlap in W_(l+1); choose one point
of it. Nearness supplies a box representative of z. Factor that
representative's Q_(l+1) element into H_l and N_<l+1. This gives
the t,q of the Plancherel centering condition, with t q z in the
box (size one). For every second overlap point the SAME box
representative and the two size-one position matrices give its
normalized difference column of size fourteen. This is precisely
the conjugation estimate used in (T3). The kernel's twisting element
d0 commutes with H_l: its original kernel context has j<=l.
Thus simpleRootSum(d0 s d0^-1)=simpleRootSum(s) on the current
floor radical; the first argument does not move (epsilon=0).
Consequently xi=1. This uses the twist's commutation hypothesis,
not a condition on an arbitrarily selected centering element.
The floor-amplitude Plancherel and Heisenberg fibre bound in the
Fourier note prove (T9). Invariance of W under these common changes
is invariance of its joint indicator integral; separate marginal
distributions would not suffice.

At l=h the Heisenberg measure is delta_1, and theta_(h+1) is compact
probability. Jensen gives Q_h<=Q_(h+1); there is no extra K_h.
Hence (T9) preserves the first inequality of (T8) at every step.

For the second inequality, expand the definition of B_l and apply
Tonelli:

    Z_l = integral_(theta_l*...*theta_0) A_l + Z_(l+1). (T10)

Change x to z^-1 u y in the contribution from A_l, using Haar M
and M=N_<l*rho_l. The modulus of k_(l+1)(z,u y) equals that of
k_(l+1)(z,y) by its unipotent phase law. Its remaining inner integral
is the left side of (T3). If W_l=0 it is zero. Otherwise (T3)
bounds it by D_l, and a nonzero kernel ensures the needed nearness.
Consequently the integrated A_l contribution is <=D_l Q_l<=E.
Together with (T10) this proves the second part of (T8) from its
value at l+1. Dropping the nonnegative term jE proves (T7).
This is LocalTheorem.lintegral_selfNorm_le, with the source's n
floor count and exact pairing norm.

## 5. Product energy and integration over positions

For the two actual kernels put

    D_j(x)=G^3 product_(a<j)floorModulus_a(p_a^-1)^2
                                    Z_0(k0,x) Z_j(k,x).

A pointwise inequality

    f(z)^2 <= K G [B_j(k0,z)/P_j(z)]
                         [B_j(k,w_p^-1 z)/P_j(w_p^-1 z)]

implies

    (integral f d stackMeasure(0,j))^2 <= K D_j(x).  (T11)

Apply Cauchy–Schwarz. The B_j functions are Q_j-invariant and
vanish off the near set, from their kernel laws and recurrence.
Decompose stackMeasure=N_<j*(theta_(j-1)*...*theta_0) and use
(T5) in each factor, with heads p and star p after the Weyl
change of variables. Their modules agree. These are the two
factors G, in addition to the G in the displayed premise; the
remaining factors are precisely Z_0 and Z_j. Monotonicity
Z_j<=Z_0 follows from (T10). This proves (T11), including the
otherwise easy-to-miss cube G^3.

Now let S be contained in the position set for a SECOND gauge Gamma'
of the SAME Level. Suppose f(x)^2<=e^2 D_j(x) on S and
pairingNorm(W,W)pairingNorm(W,W')<=Theta^2. Applying (T7) for
Gamma' and Cauchy–Schwarz in x gives the source's position estimate

    kappa_j integral_S f dM
       <= e Theta c^(d h)
          Lambda^(1500000n^3+1) Lambda'^(50000n^2).  (T12)

Here the change of twist in the second pairing norm must be included.
If d_a=k-1+2(h-a), the actual upper-measure covariance is

    A_t=product_(a<j)md(p_a/q_a)^(d_a+1).

Before any estimate its contribution cancels as

    kappa_j product floorModulus_a(p_a^-1) sqrt(A_t)
         = md((product_(a<j)q_a)^-1)^(1/2)
         <= Lambda.                               (T13)

The last step is the head condition, enlarged from size one to size
two as in the source. Thus no uncontrolled p,q factor survives.
The remaining n product K_a(Gamma') is bounded by
c^(d h)Lambda'^(50000n^2), since n<=2^n<=Lambda'^n and
4600nh+n<=50000n^2. This proves (T12) at exactly the two-gauge
interface used by ComplexShells. It does not substitute a growing
shell gauge into the head's inverse moment.

## 6. The actual majorant and caller

Suppose W' vanishes off points near at j, floor j has mass <=V
with V>=1, and whenever the two shifted kernels can be nonzero
some floor a>=j has volume <=sigma (when sigma<1). The product
of the two pivots has squared bound

    <= sigma^s V^2 G [B_j(k0,z)/P_j(z)]
                               [B_j(k,w_p^-1z)/P_j(w_p^-1z)].

For sigma>=1 use ordinary floor Cauchy–Schwarz on both pivots.
For sigma<1 use (T6) on the first and ordinary floor
Cauchy–Schwarz on the second; C^(h-j)<=G and V<=V^2.
A nonzero second pivot supplies one actual floor-group witness
for its two near conditions. Transport those conditions to every
nonzero first-kernel witness by their common H_j action, which
commutes with both heads. Thus the shell cap applies at all points
required by (T6), not just one summand.

Applying (T11) yields

    formMajorant_j(x)^2 <= sigma^s V^2 D_j(x).       (T14)

This supplies LocalTheorem.formMajorant_sq_le. With the cap in
the Haar/support note and the fixed-rho V, (T12) gives the precise
premise of peer RUN54's shell summation. That summation proves
finite majorant integral, which justifies the complex Fubini
interchanges of the full joint-law descent. The construction is
ordered so that no shell integrability is used in (T2)-(T14).

## Verification and remaining dependencies

This note expands the capped pivot, three weight integrals,
weighted selfNorm, product energy and two-gauge position estimate
at their actual complex callers. Its analytic inputs are the
explicit Gauge.com/fib construction, floor orbit law and
complex Plancherel/Heisenberg estimates reconstructed in the two
companion notes. Source files LevelGauge, FlatCharts, FloorKernels,
WeightPlancherel and LocalTheorem are byte-authenticated by the
existing exact certificate. These human calculations still require
independent audit and a native replay of their replacement lemmas.
No such replay is reported.

The primitive link-lift/pairInvariant chain is now expanded in
2026-11-26_COMPACT_LINK_DISCRIMINANT_PRIMITIVES.md, and boxed-frame
separation in 2026-11-26_COMPACT_BOXED_FRAME_SEPARATION.md. The
remaining B frontier includes pointwise classSize, peak/graph and
open-cell/volume-kernel suppliers, plus independent audit of the
retained band and orbital consumers. A and C retain their separate arithmetic and
theta obligations. This is not an RH completion claim.

RESUME HERE: audit the shift covariance cancellation (T13) and
descending residual-measure invariant (T8) at the native
lintegral_positions_le caller; then advance the actual classSize
open-cell/volume-kernel suppliers, not this shell sum again.
