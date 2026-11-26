# A: the Schur operator bound and actual theta-chain height

26 November 2026. HUMAN-DERIVED / SOURCE-MATCHED, independent audit
pending; no new Lean execution. Compact source
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0,
Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.

Actual consumer: `New/Columns/LocalStatement.Data.weylNormSq_Bmu_le`,
then `New/Endgame/ShortAndEnough.Data.short_forms`. Reuse the scalar
Gaussian jet derivation in structure RUN58, its uniform shifted-vacuum
supplier RUN59, the common CM generator/period peers, and the lead's
finite semilinear Weil comparison. This note derives the separate
Schur OPERATOR clause, joint-invariant class expansion, and the
remaining height calculation. Their retained CM inputs still need
their stated audits; no whole A or RH certification follows here.

## 1. Scalar input, precisely in the form needed here

Fix one complex field automorphism sigma. For the actual j-th finite
translated integral vacuum, the existing scalar jet argument gives

    |sigma(jet(Q))| <= A exp(C_j+d_j log(2L+2)+w)                 (1)

whenever L is a nonnegative integer and

    sum_i |sigma(z_i)|^2 <= exp(u)(2L+2)R
       implies |sigma(Q(z))| <= A exp(w+LR),
    C_j=P.c (N1 n_j n_(j+1)+1)^2,
    d_j=f n_j n_(j+1),  u=log(g/Omega).

Here g=gProd, Omega=bigOmega>0, and the input jet scale is the
SAME bar(piG)*jetScale. The equality |sigma(bar(piG))|^2=g proves
this value of u. A single translated vacuum has admissible coefficient
size one. Formula (1) is uniform in both finite unitary arguments and
the translation, by the existing semilinear and shifted-vacuum proofs.
It is not obtained by applying sigma to an analytic integral. The
Schur and coefficient polynomials have their original integer
normalizations, with no divided-derivative substitution.

## 2. Schur singular values give the exact operator constant

For each place tau take singular values of the actual rectangular
matrix z_tau, decreasing in order, and put rho_(tau,i)=s_(tau,i)^2.
They are nonnegative and

    sum_i rho_(tau,i)=sum_(a,b)|z_tau(a,b)|^2.

Unitary invariance of the Weyl Gram norm reduces the Schur operator
to this diagonal matrix. In a semistandard tableau every column has
distinct row indices. Its singular-value monomial is therefore at
most the product of the largest singular values of the same column
heights. Multiplying the columns gives

    ||S_kappa(z) xi||_W^2
       <= product_(tau,i) rho_(tau,i)^lambda_(tau,i) ||xi||_W^2,
    lambda_(tau,i)=sum_(i<h<n_(j+1)) kappa_tau(h).                (2)

The FitsRanks hypothesis excludes intermediate columns; full-height
determinant factors have the same bound, as expressed by the exact
Schur Gram identity. This is `weylNormSq_schur_le`. Zero singular
values are allowed, and zero exponents have their usual value one.

For a nonnegative real rho, an integer l>=0 and a real v, the l-th
term of the exponential series gives

    rho^l <= l! exp(l v+rho exp(-v)).                            (3)

Choose any positive integer L and v=u+1/L. On the ball in (1),
sum rho<=exp(u)(2L+2)R. Apply (3) to (2), and take its square root:

    ||S_kappa(z)xi||_W <= ||xi||_W exp(w_j+LR),
    w_j=(1/2)sum_(tau,i)
              [log(lambda_(tau,i)!)+lambda_(tau,i)u
                                      +lambda_(tau,i)/L].       (4)

Indeed the remaining radial exponent is at most
(L+1)exp(-1/L)R<=LR, using 1+1/L<=exp(1/L). The hypothesis forces
R>=0; the scalar Gaussian proof treats the impossible negative-radius
case separately. This keeps both the square root and the factorials.

Now take any unit dual functional on the output Weyl space. Its
coefficient polynomial is the original `schurCoeffPoly`, whose
evaluation is that functional applied to S_kappa(z)xi. Choose its
coefficients after sigma, pulling them back by sigma^(-1) when
applying (1). Rationality of the Schur matrices gives the same formal
jet identity. Thus (1) and (4), followed by finite-dimensional norm
duality, imply

    ||sigma(schurJet_j * xi)||_W <= R_j ||sigma(xi)||_W,
    log R_j = C_j+d_j log(2L+2)
                +(1/2)sum_(tau,i)
                    [jetSize(lambda_(tau,i))+lambda_(tau,i)/L],
    jetSize(l)=log(l!)+l log(g/Omega).                           (5)

This supplies the second clause of
`Parameters.norm_jet_le_of_isAdmissibleComb`, not just a coefficient
bound. No assumption that sigma preserves the original Hermitian norm
or is continuous is used.

## 3. The class expansion uses joint invariance before estimates

Write K_j=columnLevel(j), C_j^class=|StdClasses(K_j)|. These levels
have trivial rational stabilizers in the actual ranks. Fix all class
representatives independently of the datum label x. At each stage,
decompose its class integral at this level, averaging the translated
datum over the compact level whenever necessary. Only the full tensor
sum is asserted to be jointly K_j-invariant. The equality allowing
these averages is applied to that sum; individual translated chains
are not asserted to have the level.

Induction on j now gives linear maps beta_c of the m-fold datum
tensor, one for each tuple c of classes, with

    chainComb(Psi)phi(h)
      =sum_c sum_(x in supp Psi) Psi(x) beta_c(pure(Phi_x)),
    ||sigma(beta_c(pure(Phi_x)))||_W
      <= exp(B_in/2) product_(j<m) R_j.                         (6)

To see the induction explicitly, the next kernel is linear in its
datum and the preceding value; compose that bilinear map with each
old beta_c and tensor it with the next factor. Its norm is bounded
by (5), uniformly in the class representative and the compact
variables. Compact probability averaging preserves this bound. Joint
invariance moves the level average through the entire finite x-sum.
The next class decomposition adds exactly C_j^class choices. This
is `exists_chain_eq_sum`, with all witnesses common to x.

For the trivial twist, good datum gives
sum_x |sigma(Psi(x))|<=exp(x^60). Triangle in (6), THEN squaring,
therefore gives

    log bound for squared norm of chainComb
       =B_in+2x^60+2sum_(j<m)log C_j^class+2sum_(j<m)log R_j.    (7)

This is an inequality of positive upper bounds even when the vector
vanishes; no logarithm of a zero vector is being taken.

## 4. An explicit class bound from the same short-basis supplier

The short-basis derivation already integrated in the short spanning
columns note gives Y_c in GL_n(E), A_c=c^(-1)Y_c finite integral, and
all archimedean column lengths at most R=6N_d(fn)^2, where the positive
integer N_d=cycloConductor belongs to the different. An additive
adelic fundamental domain supplies a common function r:A_(E,f)->E
with a-r(a) integral and every |tau r(a)|<=4f^2 N_d<=R.

Set G_c=Y_c^*Y_c and X_c=r(A_c^(-1)) entrywise. Both G_c and
B_c=G_c X_c are matrices of algebraic integers: G_c=A_c^*A_c,
G_c A_c^(-1)=A_c^*, and A_c^(-1)-X_c is integral. Their entries at
every complex embedding have modulus at most M=nR^3.

The pair (G_c,B_c) distinguishes classes. If the two pairs agree,
G is invertible, so X_c=X_(c'). Both inverse matrices differ from
this SAME X by integral matrices. Thus

    A_(c') A_c^(-1)
       =1+A_(c')[(A_c^(-1)-X)-(A_(c')^(-1)-X)]

and its inverse are integral. The rational matrix Y_(c')Y_c^(-1)
is unitary because their Gram matrices agree, so the original finite
points are in the same rational-unitary/K_0 double coset.

Distinct tuples of algebraic integers are separated by at least one
in the maximum complex-embedding norm: otherwise every conjugate of
a nonzero integral difference has modulus less than one, contradicting
its nonzero integer norm. Disjoint balls of radius 1/2 in the product
complex norm give at most (1+2M)^(4fn^2) possible pairs. This proves a
coarse version of ClassCountBound sufficient here. At a finer level
containing K(gN), multiply by at most (gN)^(2fn^2), the count of all
residue matrices. Since K(gN)<=K_j, the SAME bound applies to K_j.

The original data give n<=n_m<=x^6, f<=x^12, N_d<=x^14 and R<=x^51,
as detailed in section 7. Also log N<=30m log b and log g<=22 log b.
Consequently the logarithm of this class bound is at most x^30.
This is the original sufficient `card_stdClasses_le_exp` allowance,
using a slightly larger intermediate label radius than the source.
The SAME label proof covers ranks n<=2n_m and levels containing K(g^2),
as used by comparison RUN61: take n<=x^7, R<=x^53, M<=x^166. The
label logarithm is <=x^28, and the level logarithm is <=x^29, hence
their sum is <=x^30. For this level use G=g^2 rather than gN;
log G<=44B<=52mB. No inclusion K(gN)<=K(g^2) is asserted.

## 5. The restriction factor and its actual branching matrix

Let br be the chosen INTEGER branching matrix from X_m to Y_m,
and b_tau=branchExp(tau). Its scalar normalization is

    lambda=product_tau Phi_tau(bar pi)^(-b_tau),  pi bar pi=N.

Every sigma Phi_tau is again a CM embedding, so
|sigma Phi_tau(bar pi)|^2=N. Hence exactly

    |sigma lambda|^2=N^(-sum_tau b_tau).                         (8)

The branching norm bound uses only the high-column weight, not a
bound by a for every row. Put

    L_br=sum_tau sum_(k<=h<n_m-1) h columnsY_tau(h).

The standard integral construction starts with the product of the
two permuted highest kernels and clears its Fischer/Weyl denominator
by the hook number of the high-column part. Its homogeneous degree
is at most L_br. The elementary determinant coefficient bound and
Fischer identity give a clearing integer c<=L_br^(3L_br). Each
permuted evaluation vector has unit Weyl norm; Cartan multiplication
is contractive in that norm. Thus the resulting branch vector has
norm at most c. Multiplicity one, or equivalently Schur's lemma for
the lower unitary group, identifies this as the norm of br. It follows
that the squared operator norm is at most L_br^(6L_br), with degree
zero interpreted by c=1. These are the construction and normalization
of `exists_branching_matrix`, not arbitrary rescaling of its map.

For h>=k the explicit columnsY formula gives columnsY_tau(h)<=h_gap,
where h_gap=2 r^8. Therefore L_br<=f n_m^2 h_gap<=x^66 and
6 L_br log L_br<=x^70 (use a positive upper degree if necessary).
The matrix is integer, so the same Gram norm bound holds after every
sigma, including the required permutation of places. Combining with
(8) gives precisely the source restriction allowance

    ||sigma(restrictToY(F)(h))||_W^2
       <= exp(x^70-(sum_tau b_tau)log N)
             ||sigma(F(borderU(h)))||_W^2.                      (9)

No p-adic restriction lemma is used for this archimedean estimate.
Also b_tau>=kappa_tau(1)-2b, so
sum_tau b_tau>=|tops|a-2fb.

## 6. The prime sum cancels exactly once

Use the original finite von Mangoldt expansion, with the ramified
prime included. For 0<=y<=a it gives

    primeSum(y,tau)=2sum_(p in nonsplitPrimes)
                                 localAsk_p(y,tau) log p.       (10)

For an inert prime only odd powers survive; for the ramified prime
all powers survive with its original half-weight in localAsk.
The positive part vanishes when p^e>=x1 because every nominal weight
is at least a/x1. All relevant sums are finite, so there is no
limiting interchange. The localAsk definition also makes split-prime
terms zero.

Define

    J0=m[|tops| jetSize(a)+k sum_tau jetSize(w_0(tau))].

Expanding `heightPerRow`, `dirCost` and `gain` and applying (10) gives
the EXACT identity

    heightPerRow+2sum_p gain(p)log p=J0-|tops|a log N.            (11)

Thus this step adds no independent prime estimate and no extra gain.

## 7. Every remaining size cost fits the original budget

Write X=log x and B=log b. The Data.scale inequalities, rounding
definitions and explicit ranks imply the following coarse bounds:

    x>=10^6, B>=10^6, B<=x^(1/100), b>=x^100,
    m<=x, xb<=a<=2xb, n_m<=x^6,
    f<=x^12, N1<=x^13, P.c<=x,
    h2=r^8<=x^41, h_gap=2h2<=x^42,
    b1+b2<=4b, x^(-13)<=Omega<=x^13,
    20B<=log g<=22B, log N<=30mB.                              (12)

For clarity, m<=2sqrt(x), r<=3x^5 and n_m=k+m(5r+1) give the
rank bound. N1=N0 towerDeg(s), towerDeg<=x^11 B^(1/5), and
N0<=P.c<=X give N1<=x^13 and f<=x^12; the scale has
log B<=X/100 and P.c<=X/10^14. The rounding error is at most N1,
negligible against b. The root-discriminant bounds x^10<=rd<=x^12,
|chowlaSelbergConst|<=P.c and Omega=rd/(2pi exp(ell)) give the
Omega bounds. These justify (12) within the original scale, not
new assumptions on the data.

Choose L=a+1 in (5), and put c0=log(g/Omega)>=0. For the j-th row
weights use the exact native profile

    r_(tau,i)= a 1_(tau in tops) if i=0;
                w_0(tau)       if 0<i<k;
                0              otherwise,
    lambda_(j,tau,i)<=r_(tau,i)+e_i,
    e_i=(b1+b2)1_(i=0)+h2^2.                                   (13)

In particular sum_(i<n_j)e_i<=4b+n_m h2^2<=5b and
r_(tau,i)+e_i+1<=2a+1. Since factorial(l)/factorial(r) is bounded
by (r+e+1)^e when l<=r+e, and c0>=0,

    jetSize(lambda)<=jetSize(r)+e[log(r+e+1)+c0]
                     <=jetSize(r)+25B e.                       (14)

Here log(2a+1)<=2B and c0<=23B follow from (12). The large b1+b2
term is charged ONLY to i=0. Charging it to each of n_j rows would
be an invalid budget argument. Summing (14) gives

    sum_(j,tau,i)jetSize(lambda_(j,tau,i))
       <=J0+125mfbB.                                          (15)

There are k-1, rather than k, ordinary reference rows in (13).
Their jetSize is nonnegative, so the extra reference copy in J0
is a valid upper bound.

The remaining terms in (7), (5) and (9) satisfy

    E_poly=x^70+2x^60+2m x^30
              +2sum_j C_j+2sum_j d_j log(2a+4)
              +sum_(j,tau,i)lambda_(j,tau,i)/(a+1)
          <=x^80<=b.                                         (16)

Indeed C_j<=x^52, d_j<=x^24, log(2a+4)<=2B, and the last
summand is at most 2mfn_m<=2x^19. Summing the displayed terms
gives the stated loose polynomial bound. The class bound in
section 4 follows with the same exponents: its logarithm is at
most 4x^24 log(1+2x^159)+2x^24(22B+30mB)<=x^30.

The branch-exponent discrepancy costs at most

    (|tops|a-sum b_tau)log N<=60mfbB.                           (17)

Combining (15)--(17) leaves at most b+185mfbB. Since m<=x,
a>=xb and B>=10^6,

    b+185mfbB <= faB^3/4+faB^3/4 <= faB^3=budget.               (18)

The first inequality uses xB^3>=4 and B^2>=740. Both follow
from (12). No asymptotic or unquantified sufficiently-large step
has been introduced.

Substitute (11) and (18) into (7) and (9). For EVERY sigma, EVERY
output point and EVERY column with pointwise squared norm at most
exp(B_in), this proves the native conclusion

    ||sigma(B_mu phi(h))||_W^2
      <=exp(B_in+heightPerRow+2sum_p gain(p)log p+budget).        (19)

In `short_forms`, use B_in=2log(q)+budget for the SAME positive
rational q that clears the allowed local gains. The identity
2log(q)=2sum_p floor(allowedLoss(p)-gain(p))log p cancels the
prime gain in (19), with the level-prime term retained separately.
The existing allowed-loss sum and heightPerRow bound then supply
the original short_forms exponent. The short spanning columns,
index/divisibility and seesaw witnesses are those already constructed;
none is replaced by a new independent existential choice.

## 8. Evidence and surviving dependencies

Source bodies read: MemberKernels (be36c0175fe559376780b105052249fc0c9f1f4f),
LocalStatement (9d5bd0d698b0db2850cbd306d8d400d7e99a3547),
ChainValuation, NamesAtSplitLevel, CrudeModularData, SizeEstimates
(0b666c5f3cead375b65b97c6af8a25675486b473), LiftCharacters
(db457ba5fb4c37feeb4c22c6b3f47fa9e5a8eb45), ClassCountBound,
DeltaForms (b3c533af615370f34f2303823732b8935c6bfbef),
Branching (669d2de08c3fa16386120153629ca6cde94e5dde),
BranchingVector (aafa94d0795e07118c3133817e4afa4ec795c93b),
HuaIntegral, LiveSum, Weights, Magnitudes, AdmissibleData,
IndexTypes and ShortAndEnough at the fixed pin.

This is a new human derivation from the identified prior scalar
jet/CM supplier, with the operator, class expansion and budget made
explicit. It awaits independent audit and caller replay. The original
native graph and axioms are unchanged. Source reads and `git diff
--check` are the only executed validation for this note; no scalar
diagnostic, Lean/Lake run or whole-proof verification is claimed.

RESUME HERE: audit (2)--(5), the shared class expansion, branch
denominator normalization and (11)--(19). Integrate kernel RUN37's
single-stage Hecke transfer and its retained local multiplier/adjoint
inputs at the same A caller. Continue the actual shared CM/level
suppliers and independent audits; do not leave the lifted-chain height
as an unattempted black box or repeat short-spanning construction.
