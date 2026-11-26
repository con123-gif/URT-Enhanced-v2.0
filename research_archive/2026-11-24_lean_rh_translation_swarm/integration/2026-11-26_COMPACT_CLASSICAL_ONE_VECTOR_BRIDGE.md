# B: the exact one-vector supplier from the classical theorem

26 November 2026. HUMAN-DERIVED / SOURCE-MATCHED; independent mathematical
audit pending. Compact pin `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
This continues the existing quantitative Siegel note and positivity RUN57.
It supplies their classical one-vector input, rather than repeating their
Gauss bounds, packet cancellation, or real-place estimates. No new Lean
execution or certification of the complete human proof is claimed.

## 1. The precise established result being applied

Use A. Weil, *Sur la formule de Siegel dans la theorie des groupes classiques*,
Acta Math. 113 (1965), section 52, Theorem 5, pp. 76--77, equation (41),
with the Fourier-density construction in sections 41--43. In unitary type
I2 its parameter epsilon is 1/2. For module rank one and hermitian rank
k>2, normalized Haar averaging of the rational norm-alpha sum equals
the adelic norm-alpha density. Both sides converge absolutely; the
associated global Fourier transform is integrable. The theorem applies
to Schwartz--Bruhat tests, not only a particular vacuum or level.

Primary text actually read:
https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/5988-11511_2006_Article_BF02391774.pdf
Printed pp. 41, 76, 77 were also inspected as images. Retrieved 87-page
PDF SHA256:
`7032fe6053fbd7236c4b2aeb933b5d7f744925b83d5904b92b518e3f68cc0476`.
No AI translation or RH website is used as evidence for this result.

The following is our specialization and normalization calculation.

## 2. Objects and all application hypotheses

Let F=E^+ be the maximal real subfield of the actual CM field E, let
f=[F:Q], and write D_E=|disc E| and D_F=disc F>0. The given WeilData
contains StablyUnram, hence the relative different of E/F is trivial and

    D_E=D_F^2.                                                   (1)

Retain precisely this field hypothesis. The identity does not hold for
an arbitrary CM field. The actual target is V=E^k with
Q(x)=sum_i bar(x_i)x_i, k>=3, and H=U(Q). Thus Q is nondegenerate and
positive definite at every infinite place. In particular it is
anisotropic over F and [H]=H(F)\H(A_F) is compact. The native Haar measure
mu on [H] has positive finite mass; use mu/mu([H]) in the classical
theorem, then multiply back at the end.

For completeness the finite-place hypothesis of Weil's formulation is
also satisfied. Choose a finite place v split in E/F (the existence
follows, for example, from Chebotarev for this quadratic extension;
only existence, with no error term, is used). Then E_v=F_v x F_v and
H(F_v)=GL_k(F_v). A full-rank one-column vector is a pair (u,l) with
u a nonzero column and l a nonzero row; its norm is l u. At norm zero
the pair (e_1,e_2^*) supplies a full-rank point. The pair (e_1,0) would
not supply one. For nonzero norm t choose a basis starting with u and
completed in ker l. At norm zero choose a basis starting with u in
ker l and a vector on which l is one. These basis changes prove
transitivity of GL_k on every full-rank norm fibre. This checks the
null-orbit and transitivity conditions of Theorem 5, including t=0.
Its rank guard is exactly k>2, since the module rank is one and
epsilon=1/2. No higher-rank or regularized formula is being invoked.

Fix the original data of `classSum_norm_eq`: K is an open compact
subgroup of K_0=U(k)(Ohat_E), Phi_0 is a nonnegative, compactly supported,
locally constant function on A_(E,f)^k fixed by K, and alpha=bar alpha
is totally positive. Put alpha_v=Phi_v(alpha)>0. A compact locally
constant function on a finite-adelic vector space is Schwartz--Bruhat.
One may cover its compact support by finitely many product compact-open
boxes and refine that cover to express it as a finite linear combination
of elementary tensors. Factorizability therefore imposes no extra
restriction on this actual Phi_0. The archimedean function

    phi_inf(x)=exp(-sum_v Q_v(x_v))

is Schwartz. Hence phi=phi_inf Phi_0 is an allowed test. There is no
need here to prove that this test belongs to an abstract oscillator
completion, or to assert that an arbitrary squeezed Gaussian is
K-finite. This is the direct Schwartz version of the cited theorem.

For each finite h the norm-alpha sum is in fact finite: the finite
support condition confines rational x to a fractional O_E-lattice,
and Q_v(x_v)=alpha_v confines its archimedean image to a compact set.
The lattice is discrete. This proves the native Summable clause before
using the mean identity.

## 3. Character and scalar-parameter measure

The source character has negative archimedean phase and positive finite
phase. In its notation, for z in the self-adjoint adeles and q in F,

    psi_E(z q/2)=psi_F(z q).                                      (2)

Indeed Tr_(E/F)(zq/2)=zq. The equality at finite places follows from
the same trace construction of the finite additive character; it also
follows by continuity from the dense diagonal F in its finite adeles.
Thus the source's factor 1/2 is essential. It is not discarded and is
not an additional factor 2 in the density.

The source outer finite measure db gives mass one to

    C={z=bar z : psi_(E,f)(z u)=1 for every u in Ohat_E}.

Under selfAdjoint(A_(E,f))=A_(F,f), this C is D_(F/Q)^(-1) Ohat_F.
To see the exact equality, integral traces lie in Ohat_F, and the
integral trace-one element provided by WeilData makes
Tr_(E/F):Ohat_E -> Ohat_F onto, including the places above 2. Consequently
the annihilator condition is exactly the annihilator of Ohat_F for
psi_(F,f), which is its inverse different. This uses no assertion
that 1/2 is integral.

Give F_inf=R^f its ordinary Lebesgue measure. The subgroup
F intersect C is the fractional ideal D_(F/Q)^(-1). Its real lattice
covolume is

    Norm(D_(F/Q)^(-1)) sqrt(D_F)=D_F^(-1/2).

Strong approximation gives A_(F,f)=F+C. A real fundamental domain for
this fractional ideal, times C, is therefore a fundamental domain for
F in A_F. With the native finite measure its mass is

    c=D_F^(-1/2)=D_E^(-1/4).                                    (3)

The global scalar Haar measure of covolume one is consequently
c^(-1) dz_inf db. Equivalently it is the self-dual global measure for
(2). This is the entire source of the fourth root of D_E below.

The source vector measure is compatible with the global algebraic
density: ordinary Lebesgue measure on C^f is used at infinity and
vol(Ohat_E)=2^f/sqrt(D_E) at the finite adeles. The covolume of O_E
in C^f is 2^(-f)sqrt(D_E), so E in A_E has covolume one. For the trace character the usual self-dual local measures instead
give mass 2^f times Lebesgue at infinity and mass 1/sqrt(D_E) to
Ohat_E. Their global product is exactly the same measure: the factors
2^f and 2^(-f) cancel. Thus these are the global trace-self-dual
measures, redistributed between infinity and the finite part. In particular no extra 2^(fk) can be inserted
in the global vector integral. Alternatively this follows by
uniqueness of Haar measure from its stated covolume. All rational
changes between the Gram and trace coordinate conventions have
global modulus one by the product formula.

## 4. Exact Fourier-density evaluation and integrability

Keep the actual finite function

    F_0(b)=integral Phi_0(x) psi_(E,f)(b(Q(x)-alpha)/2) dx.         (4)

With the character signs in (2), the Fourier integral giving the
global norm-alpha density is

    c^(-1) integral_(R^f x selfAdjoint A_(E,f))
             [product_v A_v(t_v)] F_0(b) dt db,
    A_v(t)=exp(2 pi i alpha_v t) [pi/(1+2 pi i t)]^k.              (5)

Here the complex Gaussian integral is evaluated using ordinary
Lebesgue measure, exactly as in `integral_fourierChar_mul_inv_pow`.
It is not evaluated using twice that measure.

The established convergent-range Fourier-density statement makes the
global Fourier integrand absolutely integrable. Its absolute value
factors as product_v |A_v(t_v)| times |F_0(b)|. The first factor has
positive finite integral, since k>=3, it is nonzero at the origin,
and it decays as |t|^(-k) in each coordinate. Tonelli therefore implies

    integral |F_0(b)| db < infinity.                             (6)

This proves the finite outer integrability used later in dominated
convergence. One does not need to infer it from an undefined Bochner
integral or from a positive representation count. Finite linear
combinations in the tensor decomposition above preserve absolute
integrability and the identities.

Now complex Fubini is legitimate in (5). The elementary Laplace
transform of 1_(s>=0) s^(k-1) exp(-s)/(k-1)! and Fourier inversion give

    integral_R A_v(t) dt
       = pi^k alpha_v^(k-1) exp(-alpha_v)/(k-1)!.                 (7)

Both transforms are integrable for k>=2, so this inversion satisfies
its usual hypotheses. At norm alpha the original archimedean test
has the constant value exp(-sum_v alpha_v). Cancelling that positive
number in the averaged identity and using (3) leaves exactly

    average_[H] sum_(Q(x)=alpha) Phi_0(h_f^(-1)x)
      = D_E^(1/4) product_v [pi^k alpha_v^(k-1)/(k-1)!]
          * integral_b F_0(b) db.                               (8)

The orientation [H]=H(F)\H(A) versus Weil's right quotient is changed
by inversion. It preserves normalized quotient Haar measure and
replaces his rho(h)x by the native h^(-1)x. No inverse character,
complex conjugate, or extra quotient volume is introduced.

## 5. Weighted class sum, not an unweighted class number

Let C_K be the finite double-coset set H(F)\H(A_f)/K, and put
a_c=|H(F) intersect c K c^(-1)|. Haar measure at infinity has mass
one and K_0 has finite mass one in the native convention. If
I=[K_0:K], then vol(K)=I^(-1). For a right-K-invariant function L,
unfolding the compact archimedean factor gives

    integral_[H] L(h_f) dmu = I^(-1) sum_(c in C_K) L(c)/a_c,
    mu([H])                 = I^(-1) sum_(c in C_K) 1/a_c.       (9)

The same index I occurs in numerator and denominator, so the
normalized average in (8) is the quotient of these two weighted
class sums. Multiplying (8) by `classSum stdRatPoints K 1` proves
the precise native conclusion

    classSum_K (sum_(Q(x)=alpha) Phi_0(h^(-1)x))
      = classSum_K(1) D_E^(1/4)
          product_v [pi^k alpha_v^(k-1)/(k-1)!]
          * integral_b F_0(b) db.                              (10)

Nonnegativity makes the native real class-sum interpretation valid;
(10) itself is an equality in C. No sign condition on F_0 pointwise
is asserted. Empty representation fibres and zero Phi_0 satisfy the
same argument; the proof makes no division by their count.

## 6. Actual callers, retained edges, and evidence

Equation (10), finiteness of the individual sums, and (6) supply
`Lib/SiegelWeil/OneVector/OneVector.classSum_norm_eq` in the exact
normalization used by the existing human derivations:

* `MassRatio.abs_log_mass_ratio_sub_le`, with Phi_0 the integral-lattice
  indicator and alpha=1; the weighted norm-one count is mass_(k-1),
  not an unweighted count. The existing Gauss/ideal-zeta estimate
  controls its error and positivity permits the real logarithm.
* `New/Filling/FiniteSystem.siegel_sum_le_lintegral_quadric`, with the
  actual step minorant and its tail-vector finite test. Compact support,
  the specified level invariance, alpha=(t bar t-N^2)/N totally positive,
  and the same local/disintegration measures remain required. Its
  dominated convergence now has the integrable majorant (6).

This human route does not require reconstructing the full abstract
`SiegelWeilFormula.siegel_weil` on its completed oscillator space merely
to obtain the one-vector statement. It does not delete that native
theorem or its other callers. The actual Rallis/comparison/theta
construction elsewhere still requires its own theorem bridge and
test-space checks. Local quadric disintegration, step-function support,
finite-level injectivity, and independent audits of the geometry and
the newly composed proof remain explicit. No whole B or RH claim.

Native bodies read at the fixed pin:

| File | Blob | Role |
|---|---|---|
| `Lib/SiegelWeil/OneVector/OneVector.lean` | `d9f90a7b5170a98542f261fa08b05aee695a6bff` | exact input, output and scalar integral |
| `Lib/SiegelWeil/Formula/SiegelWeilFormula.lean` | `4277ff0a84d10e7e1f73516d9ff76505072899ea` | original general supplier, retained |
| `Lib/SiegelWeil/Mass/MassRatio.lean` | `b1ed2f6ce2492042ffecbd0ba80df1614d79be04` | norm-one mass caller |
| `Lib/SiegelWeil/Mass/TorusMajorant.lean` | `9228ab231ce49ed76c8548f2f06c74138e638b15` | native codifferent and its mass |
| `New/Filling/FiniteSystem.lean` | `1c169e04852f767f1d1a0140448d902c16dd04e7` | actual step-test/quadric caller |
| `Lib/Adelic/CuspForms/RealConvolution.lean` | `9019995ecd81bc5009400f2764ad1fa7ecfd8b38` | `integral_quotMeasure_eq_classSum`, index in (9) |
| `Lib/Adelic/Adeles/AdditiveCharDefs.lean` | `728f522d61a606eb68ec5ed337cf1dbc2c515463` | signs and vol(Ohat_E) |
| `Lib/Adelic/Adeles/RationalPoints.lean` | `aebdd974ccdf94b1d9b9ea4ead153261ee1717cd` | relative different and discriminants |
| `Lib/General/NumberTheory/UpsilonValues.lean` | `18542b1f3515424a8b876adaa40571b22f3c7810` | actual integral trace-one element |

Validation actually performed: retrieved and read the primary theorem
and its density/convergence statements; read the named native bodies;
checked the character, covolume and weighted-index calculations above.
This is a mathematical derivation awaiting independent audit. No Lean,
Lake, scalar script, protected workflow, or full source graph was run
or altered for it. The earlier partial native replay does not verify it.

RESUME HERE: audit (2)--(10), especially global versus local self-dual
measures and weighted class indices. Continue the separate Rallis
test-space and common comparison-form caller; do not again leave the
classical one-vector supplier as an unnamed theorem or rederive the
already written packet mass, finite Gauss or amplitude bounds.
