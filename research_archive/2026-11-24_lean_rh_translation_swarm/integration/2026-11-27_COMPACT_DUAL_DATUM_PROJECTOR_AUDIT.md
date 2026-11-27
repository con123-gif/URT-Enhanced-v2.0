# The actual finite dual datum: projector normalization and one commutator

27 November 2026. Human derivation/caller audit; independent audit and
native replacement replay pending. Credit Alpöge, Sernau, Anthropic
collaborators and Claude. Compact pin
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`.

This completes the explicit finite cutoff calculation retained by
the common Rallis proof. It reuses the 26-Nov cutoff construction
and finite Weil cocycle, rather than constructing an unrelated
indicator or reproving their full representation theory.

## 1. Exact finite model inputs and projector coefficient

Write H(y) for the ACTUAL normalized finite Heisenberg operator
finHeisOp, with coordinates divided by the same alpha as the
source. Its commutation character is

    H(v)H(eta)=psi_0(star(eta) dot v) H(eta)H(v),             (F1)

where psi_0(t)=psi_f(j alpha bar(alpha)t). Its annihilator of
O-hat is exactly O-hat. On integral vectors the normalized
Heisenberg operators form a genuine additive representation:
their semicharacter removes the half-cocycle, including above 2.
The mean P_A over integral vectors supported on
C=A union bar A is therefore a self-adjoint idempotent. It fixes
H(y) when y is integral and supported on C.

The finite multiplier is Delta(g)=finMultiplier(g), not det(g).
For the finite unitary model, the previously derived saturation
identities give

    |Delta(g)|^2=[Lambda:Lambda intersect g^(-1)Lambda],
    Delta(g^(-1))=conjugate(Delta(g)),  Delta(g)!=0.          (F2)

These have the SAME lattice Lambda and measure vol(Lambda)=1
as the vacuum. Its semicharacter is real with square one on
Lambda; a finite unitary g preserves its defining dot product.
In the vacuum integral defining omega(g), evaluation at zero
therefore gives

    <e,omega(g)e>
       =Delta(g) vol(Lambda intersect g^(-1)Lambda)
       =1/conjugate(Delta(g))=1/Delta(g^(-1)).               (F3)

No inference of this phase from the norm of the coefficient is
made. The integral itself has phase one on the intersection.
The finite fixed line is genuinely one-dimensional: invariance
under the integral Heisenberg operators and self-duality force
its coefficient to vanish off Lambda; on Lambda that same
invariance determines it from its value at zero. Its normalized
generator is the finite vacuum. Thus projection is rank one on
that factor. For g supported on C, projection onto its finite vacuum factor
and the identity action off C consequently give, for P_A f=f,

    P_A omega(g)f=Delta(g^(-1))^(-1) f.                    (F4)

One can first check (F4) on real data tensored with finite
Heisenberg translates off C, then extend using reproduction
or the native finite-factor density. This is exactly the source
projOn_omega law, with the inverse on Delta in the required
place. The original finite cocycle note supplies (F2) and the
normalized vacuum; no new choice of splitting character is made.

## 2. One integral isotropic frame and the actual paired datum

Let n=rank(S), M=rank(T)>2n, A a FINITE set of finite places,
and P_A f=f. The cases n=0 or A empty have trivial cutoff and
can take f'=f. Otherwise use the source integral finite unit
u with bar(u)u=-1 and an M-by-n matrix

    x=(I_n;u I_n;0).

Then x*x=0 and its first n rows are I. Use the actual selected
rows u(i) if the original indices are not ordered this way.
Let eta be the M-by-n matrix supported on C with those selected
rows equal to I and other rows zero. In particular eta*x=I
and x*eta=I on C. This frame is finite-adelic, not a rational
isotropic frame in a positive definite global Hermitian space.

Existence of the norm-negative-one unit is already supplied by
the finite cocycle note §5 at fixed places: the stably-unramified
roots give nontrivial residue conjugation, fixed residue
characteristic odd, and surjective unramified residue norm;
the principal-unit correction uses Hensel with 2 a unit.
At a conjugate pair choose unit components -1 and 1. Assembling
these local units gives one element of O-hat^x with norm -1.
Every component is a unit, so there is no restricted-product
obstruction. The construction works for the SAME chosen native
u because it uses only these defining properties.

Choose a nonzero positive integer N satisfying, for every w in C,

    N varpi_w^(-1) j^(-1) integral at w.

Finiteness of C permits simultaneous denominator clearing. Put
z=idem_C j/N; then bar(z)=-z and |z|_w>1 on C. Set

    k=I_M+z x x*,       k^(-1)=I_M-z x x*.                  (F5)

The norm-one identity k*k=I follows from x*x=0 and bar z=-z.
It is identity off C. Let kappa be its induced target action
on the finite Hom oscillator, and set

    delta=Delta(kappa^(-1)),
    f_A'=H(eta) omega(kappa)(delta f).                      (F6)

This is the actual source witness in exists_dual_datum. Delta
is nonzero by (F2). It is not replaced by a determinant or
assumed to have modulus one.
All choices in (F6) are fixed BEFORE the arbitrary group
argument g; mu and the row index below are used only to prove
the universal coefficient identity, not to choose its datum.

## 3. Integral region: scalar cancellation at vector level

Let p be the finite Hom action of the source group argument.
It acts on matrix coordinates on the right, commuting with
left multiplication by k. If its source argument belongs to
localLevel(n,A), then Z=pairWeil(g,1)f remains P_A-fixed, by
integrality at C and preservation of the vacuum lattice.
H(eta) fixes Z. Since P_A is self-adjoint, (F4) gives

    <f_A',Z>
      =<omega(kappa)(delta f),Z>
      =<P_A omega(kappa)(delta f),Z>
      =<delta Delta(kappa^(-1))^(-1)f,Z>
      =<f,Z>.                                              (F7)

The two scalars cancel BEFORE using the conjugate-linearity of
the first inner argument. Hence there is neither a missing
conjugate nor a residual absolute-value factor in the answer.

## 4. Nonintegral region: the exact matrix entry left by the commutator

Use the inverse-argument convention of the source proof; the
integral subgroup is invariant under inversion. In these
coordinates p acts on Hom matrices by Y->Yg. Suppose the
coefficient <f_A',omega(p)f> is nonzero, and at some w in C
the row g_(i,*) has an entry with |g_il|_w>1. Choose l of
maximal absolute value in that row and choose mu in E_w with

    |mu|_w=max(|z|_w,|g_il|_w),
    sigma=the finite adele supported at w with value mu^(-1).

Such a mu exists by choosing whichever of z_w and g_il has
the larger absolute value. Then sigma, z sigma and all
g_ik sigma are integral. For arbitrary d in O-hat put

    y=E_(u(l),i) d sigma,       v=k y g.                    (F8)

All these parameters are supported on C. The identities

    k^(-1)v=yg integral,
    p^(-1)v=ky integral

are the two vacuum-fixing tests. The first uses maximality of
|g_il|, the second uses integrality of x and z sigma. By exact
Weil–Heisenberg covariance, H(v) fixes BOTH
omega(kappa)(delta f) and omega(p)f. Inserting H(v) on both
sides of their nonzero coefficient with H(eta), then commuting
it past H(eta) with (F1), forces

    psi_0(star(eta) dot v)=1.

The matrix contraction is explicit. On C, eta*y=E_(l,i)d sigma,
eta*x=I and x*y=E_(l,i)d sigma. Hence

    star(eta) dot v
      =trace(eta* (I+zxx*) y g)
      =(1+z) d sigma g_il.

The term d sigma g_il is integral and has trivial psi_0.
Therefore the surviving character is EXACTLY

    psi_0(d sigma z g_il)=1       for every d in O-hat.      (F9)

The inverse or conjugate character in an equivalent coefficient
convention has the same annihilator. Native self-duality now
forces sigma z g_il integral. But

    |sigma z g_il|_w=min(|z|_w,|g_il|_w)>1,

a contradiction. Thus all entries on C are integral. The
unitary relation g^(-1)=g* then supplies integral inverse at A,
so the argument belongs to the exact localLevel(n,A). This
proves the source cutoff, including its converse (F7):

    weilMatrixCoeff_b(f,f_A',g)
       =1_(g_f in localLevel(n,A)) weilMatrixCoeff_b(f,f,g). (F10)

The determinant character b is a nonzero unit factor common
to both sides. No change of f or substitution of a different
Heisenberg conductor occurred.

## 5. Nonvanishing at the actual auxiliary and triangle consumers

Use the absolute Rallis identity already proved for arbitrary
paired datum and the SAME original f. If its theta lift is zero,
the pairing with the lift for each f_A' is zero. By (F10) its
group integral is the integral of the original coefficient
times the finite cutoff. Exhaust the finite places outside
the fixed S0 by finite A. The cutoffs decrease to integrality
off S0, and the integrands are bounded by the absolute value
of ONE original L1 Rallis coefficient. Dominated convergence
therefore gives the sharp partial integral zero.

No uniform norm bound on the varying f_A' is required: for
each A the Rallis identity applies to its actual datum, and
the limiting integrand is dominated after using the exact
coefficient identity (F10). The finite factor is exactly
||F||_data^2/stdLevelIndex(J). The retained real edge pairing
has the same fixed nonzero scalar as in the 26-Nov cutoff
note, so at y'=y positivity forces the original y=0. This
is the nonvanishing implication used by CharacterLiftNorm
and TriangleArrows, on their original form and theta data.

Source inspected: SharpData.lean 236–285; Projections.lean
finHeisOp_projOn, dataInner_projOn, omega_projOn, projOn_omega;
PairSumNegation.lean projOn_pairWeil; FiniteVacuum.lean
semichar_mul_self and star_mulVec_dot_mulVec; SpaceOperations.lean
normNegOne. Reuse finite cocycle note §5 and the 26-Nov cutoff
note, rather than counting their local arguments twice.
Original source and protected workflows unchanged. This
abstract and matrix proof has not been Lean-replayed or
independently audited; the earlier ten-plus-five symbolic
regressions do not certify this new argument or RH.

RESUME HERE: independent audit of (F3)–(F10), especially the
finite projection coefficient and the selected-row contraction.
Then use the SAME two-majorant mechanism at the separate
noncoherent absolute-amplitude consumer with its own guards.
All unresolved A/C primitive suppliers remain retained.
