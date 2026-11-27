# Stable-range Siegel–Weil on the actual native datum space

27 November 2026. Human derivation; independent mathematical audit and
replacement replay pending. This is a supplier for the human reconstruction,
not a new certification of RH. Credit Levent Alpöge, Luke Sernau,
Anthropic collaborators and Claude. Formal source:
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/`, Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

This joins the rational-phase observation in mission commit `3b218469`
to the shared absolute unfolding of `6c46fb6e`. It also supplies an
alternative to the reduction-theoretic identity-only convergence in
`0dcbf571`: a vacuum peak proves the operator-norm sum, and a positive
classical theta series supplies the integrable majorant. Neither bound
is inferred merely from convergence of a signed series.

## 1. Statement, actual callers and retained background

Let E/F be the actual CM quadratic extension, with the source Weil
data, trace character, rational frames and vacuum. Let S be rational
split Hermitian of rank 2r, with complete rational splitting P=(k,l),
and let T be the actual nonsingular rational Hermitian space of rank
M>2r. Write H=U(T)(A_F), [H]=U(T)(F)\H, with the native quotient
measure and finite positive volume V. Let X be the native reproducing
Banach model on Hom(S,T). Its norm is the L1 norm of its coefficient
function; it is not being identified with a classical Schwartz norm.
To avoid a native notation trap, write c_f(Y) for that underlying
Model coefficient. The source also equips Space data with a DIFFERENT
point evaluation, f(Y)=theta(rho(Y)f). Our L1 norm and reproducing
integrals use c_f; occurrences of e(Y) in the Fourier/projector
calculation mean vacuumFn(Y), the Model coefficient of e. They
do not mean the Space point evaluation of its vacuum.
For every rational maximal isotropic L in S let E_L be the SAME
source zero-term functional, and let theta be the SAME normalized
native theta functional. The conclusion needed at the caller is

\[
 C_E:=\sum_L\|E_L\|<\infty,\qquad
 |\theta(\Omega(1,h)f)|\le N(h)\|f\|_X,
 \quad \int_{[H]}N<\infty,                                  \tag{1}
\]

and, for every f in X,

\[
 \int_{[H]}\theta(\Omega(1,h)f)\,dh
      =V\sum_L E_L(f).                                      \tag{2}
\]

Only the identity value of the normalized torus is asserted. In
`SharpData.inner_product_formula`, S here is the DOUBLED original
space S0 plus negative S0. Thus r=rank(S0), and the hypothesis there
is M>2 rank(S0). The rank in (1) is not doubled again. The other
external caller is `OneVector/OneVector.lean`.

Background used, with existing human derivations rather than a new
assumption of (1) or (2):

* The exact vacuum/convolution model, isometric Heisenberg action,
  reproducing identity, invariant-form lemma and nonzero normalized
  theta functional, in `2026-11-26_COMPACT_GLOBAL_THETA_FUNCTIONAL.md`.
* Mixed-term laws and absolute rational sampling, using the Wiener
  proof in `structure/compact/RUN54_DEFINITE_THETA_CONVERGENCE.md`.
  This includes the adapted-frame/vacuum input used to obtain its
  integrable envelope. It does not use Siegel–Weil convergence.
* The native Weil representation, its exact Heisenberg covariance
  and rational theta invariance. Its real Gaussian and finite group
  law suppliers retain their separate audits. This note does not
  infer these laws from the desired Siegel–Weil identity.
* Ordinary additive Fourier analysis and the classical convergent
  Siegel–Weil theorem stated in section 5, on the actual rational
  Hermitian T. Finite positive covolume of the unitary quotient is
  the usual finite-volume theorem, also retained in the native
  construction. None of these is an RH premise.

The case r=0 is immediate: there is one L, the datum is scalar, and
the H action is trivial. In the rest r>0.

## 2. One mixed-model function, without independent normalizations

In rational coordinates of T put Q=Mat_(M by r)(A_E), and define

\[
 J_P f(X)=\theta_0\bigl(P.\mathrm{sourceTerm}\,T
                                  (T.x^{-1}X)f\bigr).       \tag{3}
\]

Here theta0 is exactly the native rank-zero theta functional. The
complete induced splitting D=P.homSource T has zero residual space.
`sourceTerm_eq_mixedTerm` identifies (3) with its mixed model, with
matToVec only reindexing entries. In particular

\[
 E_{L_0}(f)=J_Pf(0),\qquad
 \theta(f)=\sum_{X\in\operatorname{Mat}_{M,r}(E)}J_Pf(X),
 \quad L_0=\operatorname{span}(k).                           \tag{4}
\]

The sum is absolutely convergent by the already proved Wiener bound.
Both equalities use the same theta0. There is no free scalar in one
of them that can be selected separately from the other.

Bounded evaluation and Heisenberg isometry give
sup_X |J_Pf(X)|<=C_infinity||f||_X. The mixed Wiener estimate, summed
over rational translates and integrated over the compact additive
quotient Q/Mat(E), gives ||J_Pf||_1<=C_1||f||_X. Translation of f is
an isometry, so the rational-sum bound is uniform in that quotient
variable. Its finite Haar mass supplies a fixed factor only. Thus
J_P is bounded to L2(Q), since ||J_Pf||_2^2<=||J_Pf||_infinity
||J_Pf||_1. It is also pointwise continuous.

Use the classical self-dual Haar on Q for the Fourier pairing in
section 3. Changing from the native mixed-coordinate Haar multiplies
it by one fixed positive constant; the bounds just given still hold.
By the invariant-form lemma and the mixed Heisenberg law,

\[
 \int_Q\overline{J_Pf}J_Pg=c_P\langle f,g\rangle_X.           \tag{5}
\]

Here c_P>0. Indeed, J_P cannot be the zero map, because (4) would
make the already nonzero theta functional zero. If c_P=0, (5)
would make every continuous J_Pf zero almost everywhere and hence
everywhere, a contradiction. This avoids a circular appeal to
nonvanishing of a Siegel–Weil value.

The map U_P=c_P^(-1/2)J_P extends isometrically from the Hilbert
completion of the native inner product into L2(Q). It is onto.
Its closed image is nonzero and invariant under all translations
and all character modulations, by the complete mixed law. For
completeness, a nonzero phi in the image has Heisenberg translates
with dense linear span: if F is orthogonal to all of them, then
for each translation a, Fourier uniqueness applied to the L1
function F(X) conjugate(phi(X+a)) makes it zero almost everywhere.
Integrating its nonnegative absolute value in a and X, by Tonelli,
forces F=0. This argument uses the whole adelic dual group, not
only rational characters. The same argument, or the invariant-form
lemma transported through U_P, shows that a bounded operator
commuting with this Heisenberg action is scalar.

## 3. Exact rational polarization, sign and factor of two

Write psi_E for the source stdAddChar E and define psi_F to be its
restriction to A_F. It is a nontrivial character trivial on F.
The ordinary trace character satisfies psi_E(bar z)=psi_E(z), so

\[
 \psi_E(z)=\psi_F\bigl(\operatorname{Tr}_{E/F}(z)/2\bigr).    \tag{6}
\]

This holds at the finite places too: (z+bar z)/2 is an adelic
identity, and 2 is invertible in every local field. No claim that
1/2 is an integral unit is needed.

Let J_T be the rational Gram matrix of T. For a Heisenberg vector Y
in rational Hom coordinates set A=Yk, B=Yl and C=-jB. The exact native
`sourceTerm_varrho` becomes

\[
 J_P(\rho(Y)f)(X)=
 \psi_E\!\left(\tfrac12\operatorname{tr}
                   C^*J_T(2X+A)\right)J_Pf(X+A).             \tag{7}
\]

Indeed C*=j B*, as bar j=-j. In the source formula the standard
target Gram is transported to J_T by the SAME T.x as in (3).
Thus (7) has no remaining frame matrix. Call this operator T(A,C).
Direct multiplication gives the cocycle

\[
 T(A,C)T(A',C')=
 \psi_E\!\left(\tfrac12\operatorname{tr}
                  (C'^*J_T A-C^*J_T A')\right)
                 T(A+A',C+C').                              \tag{8}
\]

This is also the native Hom bicharacter. To check its dual/transpose
orientation, the Gram of S in the (k,l) basis is
H0=[[0,I],[I,0]]. The native `homBicharacter_eq` is
psi_E((j/2)tr(Y* J_T X H0)). Its two terms are
(j/2)tr(A_Y*J_T B_X+B_Y*J_T A_X). Apply conjugation invariance
of psi_E to the first term, using bar j=-j. It becomes the exponent
in (8), with (A,C) belonging to X and (A',C') to Y. Equations
(6)–(8) identify the rational polarized symplectic space and its
central character with the classical model whose Fourier pairing
is psi_F(Tr_E/F h_T/2)=psi_E(h_T).

One may also check all source-group covariance on generators, which
removes an ambiguity about using S or its dual. In the (k,l) frame
put B0=diag(I,-jI). Then

\[
 B0^*(-j^{-1}H0)B0=\begin{pmatrix}0&I\\-I&0\end{pmatrix}.    \tag{9}
\]

The native Siegel radical is [[I,-j^(-1)b],[0,I]], b=b*. Conjugating
by B0 gives the classical n(b)=[[I,b],[0,I]]. The Levi becomes
m(a)=diag(a,a^(-*)). On Heisenberg coordinates its native inverse
right action is, respectively,

\[
 (A,C)\mapsto(A,C-Ab),\qquad
 (A,C)\mapsto(Aa^{-1},Ca^*).                                 \tag{10}
\]

These are precisely conjugation of T(A,C) by classical multiplication
by psi_E(tr(bX*J_TX)/2) and by the classical Levi pullback X->Xa.
For w=[[0,I],[-I,0]], the corresponding native element is
B0 w B0^(-1)=[[0,-j^(-1)I],[jI,0]]. Its inverse right action gives
(A,C)->(C,-A). The positive-sign Fourier transform with kernel
psi_E(tr(X*J_TZ)) has exactly that conjugation action on (7).
Scalar Weil indices do not affect conjugation. These checks cover
the generators of the split unitary group and fix the sign, dual
orientation, target frame and both factors of two. They are algebra
identities, not an assumption that the two Weil actions are equal.

Choose any admissible classical global splitting character chi,
chi|A_F^x=epsilon_(E/F)^M, with target character 1. Such a unitary
character exists: C_F embeds as a closed subgroup of the idele class
group C_E (the norm relation makes the embedding proper), and the
ordinary extension theorem for characters of closed subgroups of
locally compact abelian groups extends epsilon^M. The target choice
1 has the required restriction because rank(S)=2r. No comparison
of chi with native upsilon at nonrational elements will be used.

## 4. A centred vacuum gives a norm bound for EVERY rational L

Let e be the native vacuum, ||e||_Hilbert=1, and phi=U_Pe. Pure
frequency operators T(0,C) are the native rho(Y) with Yk=0. Such Y
are Hermitian-isotropic in Hom(S,T). Their matrix coefficient is

\[
 \int_Q |\phi(X)|^2\psi_E(\operatorname{tr}C^*J_TX)\,dX
       =\langle e,\rho(Y)e\rangle=e(Y).                     \tag{11}
\]

The real restriction of e(Y) is a centred positive Gaussian in C.
Its quadratic form is positive definite because C->Y is injective
and the vacuum uses the positive coordinate norm.

At finite places it is the indicator of a compact open lattice,
with TRIVIAL phase. Here is the necessary dyadic check. The finite
vacuum uses sum_i bar z_i z_i with all positive signs, whereas the
Hermitian form has signs s_i=+1 or -1. On its support write Y=alpha z,
z integral. Isotropy implies sum_i s_i bar z_i z_i=0, and therefore

\[
 \sum_i\bar z_i z_i=2\sum_{s_i=-1}\bar z_i z_i.
\]

The source finite phase becomes
psi_0(c0 sum_(s_i=-1) bar z_i z_i)=1: c0 is integral and psi_0 is
trivial on O-hat. Thus it is not legitimate to identify the positive
and signed quadratic forms; the displayed factor 2 is what cancels
the half in the actual vacuum. This proves triviality also above 2.

The right side of (11) is integrable in C. Fourier inversion of
the L1 function |phi|^2 now gives a positive centred Gaussian at
infinity times a positive constant times the indicator of the
annihilator lattice at finite places. Continuity upgrades the
almost-everywhere identity to a pointwise identity. In particular

\[
 \sup_X|J_Pe(X)|=|J_Pe(0)|>0.                               \tag{12}
\]

We must also know that J_Pe is classical Schwartz–Bruhat, including
its phase, before applying the classical theorem. This follows from
the native vacuum projector, not from an assertion about |J_Pe|.
Transport P_e=integral e(Y)rho(Y)dmu(Y), which equals
f-><e,f>e, through U_P. In (A,C) coordinates its integral kernel is

\[
 K(X,Z)=\kappa\int e\bigl(Y(Z-X,C)\bigr)
         \psi_E\!\left(\operatorname{tr}C^*J_T(X+Z)/2\right)dC,
                                                               \tag{13}
\]

for one positive Haar Jacobian kappa. The phase-space vacuum is
Schwartz–Bruhat: a real Gaussian times a finite compactly supported
locally constant function. The coordinate change is invertible
adelic linear, and partial Fourier transform preserves this class.
Hence K is Schwartz–Bruhat in (X,Z). As an operator it is also the
rank-one projection with kernel phi(X)conjugate(phi(Z)). Equality
of the continuous kernels is pointwise. Since phi(0)!=0 by (12),
setting Z=0 proves phi, and therefore J_Pe, is Schwartz–Bruhat.
No unknown finite characteristic or phase has been suppressed.

Apply the same argument to the complete splitting defining ANY
rational L. Reproduction in the native norm gives, for every f,

\[
 f=\int c_f(Y)\rho(Y)e\,d\mu(Y),\qquad
 |E_L(f)|\le\|f\|_X\sup_Y|E_L\rho(Y)e|
             =\|f\|_X|E_L(e)|.
\]

Consequently

\[
                     \|E_L\|\le |E_L(e)|.                  \tag{14}
\]

There is no extra constant depending on L. Reproduction has the
native coefficient c_f(Y), and its norm is exactly integral |c_f(Y)|.

## 5. Rational theta invariance fixes the only needed phases

Let B_gamma be the classical Weil operator and A_gamma the native
operator transported through U_P, for gamma in U(S)(F), with the
rational group identification (9). By (7)–(10), both implement the
same Heisenberg automorphism. The scalar commutant result following
(5) gives A_gamma=lambda_gamma B_gamma, |lambda_gamma|=1.

Let X0 be the span of rho(Y)e for all adelic Y. It is dense in the
native Banach space by reproduction. Section 4 and (7) show J_P X0
is Schwartz–Bruhat. The operator identity just obtained is an L2
identity, hence pointwise because both mixed functions are
continuous and Haar has full support. It also shows the transformed
native functions in this assertion are Schwartz–Bruhat.

For the classical rational theta distribution D(phi)=sum_(X rational)
phi(X), global rational theta invariance gives D(B_gamma phi)=D(phi).
The native representation has the same rational invariance. Thus,
for every v in X0,

\[
 \theta(v)=D(J_P\Omega(\gamma,1)v)
      =\lambda_\gamma D(B_\gamma J_Pv)
      =\lambda_\gamma\theta(v).                            \tag{15}
\]

Some v in X0 has theta(v)!=0: otherwise boundedness of theta and
density would contradict its nonvanishing. Therefore lambda_gamma=1
for every rational gamma. No nonvanishing L-value, or positivity of
theta(e), is assumed. This also shows why matching all adelic Weil
indices or native upsilon with chi is unnecessary at this caller.

The target action already agrees exactly for EVERY h:

\[
 J_P\Omega(1,h)f(X)=J_Pf(h^{-1}X),                           \tag{16}
\]

where h is in rational target coordinates. The chosen target
character 1 and the source `mixedValue_splitWeil` give this formula.

The external theorem used now is Yifeng Liu, *Arithmetic theta
lifting and L-derivatives for unitary groups, I*, Algebra & Number
Theory 5 (2011), pp.858–859, Theorem 2.1(1), publisher source
<https://msp.org/ant/2011/5-7/ant-v5-n7-p.pdf>. For rational Hermitian
T of dimension M, split skew-Hermitian source of dimension 2r,
M>2r, an admissible chi, and classical Schwartz–Bruhat phi, at
s0=(M-r)/2 its Eisenstein series converges absolutely and equals
the theta integral on [H] with probability Haar. The theta integral
is absolutely convergent for all such phi. Formulae on those pages
use the pairing psi_F(Tr_E/F h_T/2), which is exactly (6).

We use only that convergent case. The coefficient is 1. The
coefficient 2 in the boundary case M=r is inapplicable. Cuspidality,
factorization of an automorphic vector and Liu Proposition 2.3 are
not premises here. Our T is rational, so there is no coherence
assumption to be deduced from an incoherent adelic collection.

The usual all-Schwartz version in that statement is important. If
one formulates the Eisenstein identity first for K-finite vectors,
the extension here is justified as follows. At fixed finite
Schwartz level the infinite Schwartz space is Fréchet. The map to
theta functions in L1([H]) is defined for every Schwartz vector
by absolute theta convergence. It has closed graph: Schwartz
convergence gives pointwise convergence of the rational theta sum
at each h, while L1 convergence has an almost-everywhere convergent
subsequence. The closed graph theorem makes the map continuous.
For the Eisenstein side, compact K acts continuously on Schwartz
space, and its zero evaluation is bounded by a fixed Schwartz
seminorm uniformly on K. Iwasawa decomposition bounds each term
by that seminorm times the positive inducing height of exponent
M/2. Its sum converges since s0>r/2. The Eisenstein functional is
therefore continuous. Compact-group finite-type approximate
identities converge in the Schwartz topology (apply a smooth
approximate identity and then finite matrix-coefficient
approximations, including derivatives). Both functionals hence
extend their equality to all Schwartz vectors. This extension
asserts no equivalence of the Schwartz and native Banach norms.

In the rational parabolic quotient, the left coset P(F)gamma
corresponds to L=gamma^(-1)L0. The source zero-term covariance gives

\[
 E_L(f)=J_P\Omega(\gamma,1)f(0).                             \tag{17}
\]

It is independent of the coset representative: rational change of
isotropic basis has global determinant modulus 1, and its splitting
character is trivial on rational ideles. Equations (15) and (17)
therefore identify each native term with the corresponding classical
term on X0, with no multiplicity and with the essential inverse
in the label. At s0 the extra inducing power is 1.

No separate Haar calibration of theta and zero evaluation is
required. They were fixed together in (3)–(4). The constant c_P
used only to compare Hilbert actions cancels in every intertwining
identity; J_P, not U_P, is used in the sums. The self-dual Haar in
the Fourier operator was chosen once. Its rational-theta-invariant
phase was fixed by (15). The only quotient conversion is the
explicit multiplication by native V.

## 6. The two absolute bounds on the native completion

Apply absolute classical Eisenstein convergence to the SINGLE
Schwartz vector phi=J_Pe. Since rational actions agree by (15),
(17) and (14) give

\[
 C_E\le\sum_L |E_L(e)|
       =\sum_{P(F)\gamma}
              |(B_\gamma J_Pe)(0)|<\infty.                 \tag{18}
\]

This is a true sum of native operator norms. The reason scalar
convergence suffices for this particular vector is the additional
peak inequality (14); scalar convergence on a dense core alone
would not suffice.

For the other bound use the already derived mixed Wiener estimate,
at the identity torus only. It supplies a fixed compact set B in Q
and a constant C such that, simultaneously for all f and all h,

\[
 |\theta(\Omega(1,h)f)|
    \le C\|f\|_X\#\{X\in\operatorname{Mat}_{M,r}(E):h^{-1}X\in B\}.
                                                               \tag{19}
\]

The compact set and C do not depend on h. This is precisely the
mixed-sampling part of `theta_normalisedTorus_le` at x=0. It has
not used the geometric integral of this count.

Choose a nonnegative classical Schwartz–Bruhat Phi>=1_B: cover the
finite projection of B by a compact open box and use its indicator;
at infinity multiply a positive Gaussian by a constant large enough
on the compact projection. The function

\[
 N(h)=C\sum_{X\in\operatorname{Mat}_{M,r}(E)}\Phi(h^{-1}X)     \tag{20}
\]

is nonnegative, measurable and descends to [H]. By (16) it is C
times a classical theta series with g=1. Classical stable-range
absolute theta convergence says integral_[H] N<infinity, since
that series is nonnegative. Equations (19)–(20) prove the second
part of (1) on the ENTIRE native Banach space. There is no exchange
of an unbounded supremum with an integral and no use of the desired
Rallis formula to prove its own integrability.

Finally apply classical Siegel–Weil to J_Pv for v in X0. Equations
(4), (15)–(17) give (2) there, after multiplication by V. Both
sides are bounded native functionals: their norms are at most
integral N and V C_E. Density of X0 extends (2) to every native f.
This proves precisely (1)–(2) from the stated background, without
the normalized-torus rank induction or Hecke maximum principle.

## 7. Substitution into the actual doubled Rallis argument

For the doubled datum d(x,x') on the SAME height-reduced inputs
as `SharpData`, rapidity gives integral_[G]x[G] ||d||<infinity.
The companion doubling note may unit-rescale this auxiliary map
once; that preserves every norm bound and all external input data.
The bounds just proved give

\[
 \int\sum_L|E_Ld|\le C_E\int\|d\|<\infty,\qquad
 \int\!\int_{[H]}|\theta(\Omega(1,h)d)|
       \le\left(\int N\right)\int\|d\|<\infty.              \tag{21}
\]

Use the existing clean graph proof and its exact graph evaluation,
then nonnegative quotient unfolding for the absolute sum before
signed Fubini. The shared unfolding in `6c46fb6e` now yields

\[
 \langle\Theta_{f'}y',\Theta_fy\rangle_{[H]}
   =V\int_G \operatorname{weilMatrixCoeff}(f,f',g)
                  \langle y',R(g)y\rangle_{[G]}\,dg,
\]

with the source character conventions and absolute integrability.
The clean nondefinite graph implication is derived in the graph
audit note. The normalized double product, graph pairing and full
target covariance are derived in the doubling note (D5)–(D9),
using the SAME normalized theta pairing. The graph trace fixes
the full target phase, so no separate sign-change/block Weil
comparison is needed in this human Rallis proof. These additional
arguments are not consequences of (18); their independent audit
and the quotient Haar supplier remain explicit. The finite sharp
factor remains exactly
||F||_data^2/stdLevelIndex(J); the dual finite datum is still needed
for nonvanishing. An arbitrary rapid y is not assumed cuspidal or
Euler-factorizable.

Thus this is an actual candidate supplier at the shared OneVector
and Rallis edge, not a replacement for all native uses of the
stronger uniform-torus theorem. Search found identity-only external
consumers, but no exhaustive elaborated graph retirement is claimed.

## Source and audit receipt

Actual compact sources read: `Construction/AdelicHeisenberg.lean`
(vacuumFn, adelicHeis), `Construction/FiniteHeisenberg.lean`
(semichar, psi_0 self-duality), `Periods/BesselIntegral.lean`
(homBicharacter_eq), `MixedModel/ZeroTerm.lean`,
`MixedModel/MixedModelIntegrable.lean`, `MixedModel/ZeroTermLaw.lean`,
`DualPair/PairSplitting.lean` (homSource, mixed identification,
theta source sum, rho/Levi/radical laws),
`SiegelWeil/Formula/{ZeroTermHeight,SiegelSets,SiegelWeilFormula}.lean`,
and `SiegelWeil/RallisInner/SharpData.lean`.

Audit priorities: equations (8)–(10) against both conventions;
finite signed/positive vacuum cancellation in (11); classical
all-Schwartz extension; nondefinite clean graph and dual finite
cutoff at their actual callers. This note is a human proof under
the explicit background in section 1, pending independent audit.
The nondefinite branch now has the connected one-place averaging
derivation in `2026-11-27_COMPACT_CLEAN_GRAPH_AUDIT.md`; use it at
the same g,w,finite frame rather than reasserting graph support.

Executed local regression: `timeout 60s python
integration/check_siegel_weil_polarization.py --source-root <pinned
checkout> --out integration/2026-11-27_siegel_weil_polarization_results.json`.
It completed normally in the local environment, authenticated six
source blobs, and checked ten exact symbolic identities plus five
negative controls (wrong basis/frequency sign and missing half/factor
two). The free-entry calculation has target and Lagrangian dimension
2; it supports the normalization audit and does not prove the
general-rank convergence or the classical theorem. Source files
and protected workflows were unchanged.

Independent contribution inspected after publication of a99f1fa8:
Landau RUN73, commit 1ae8974afdd61dd33671fbe0fa90d277085010d3,
`specialists/landau_criterion/COMPACT_RUN73_CLEAN_GRAPH_CHARACTER.lean`.
It independently checks the trace character at finite and infinite
places, all three covariance signs, the rational-phase cancellation
and the exact nondefinite graph implication. Its compact-coset
character proof agrees with the uniform-average version in the
companion graph note. This is agreement on those components under
the stated model laws, not an independent audit of the entire
convergence proof or a new native replay. It also gives a fallback
if a classical statement fixes the standard base character: use
the rational target Gram 2J_T with the canonical base trace
character. The unitary group and rational lattice are identical,
and its half-trace Fourier and unipotent pairings become exactly
our psi_E pairings. The theorem in section 2A as inspected already
allows a nontrivial additive character, so this fallback is not
needed to change (3) or rescale its zero term.

No new Lean execution or native root discharge was performed.
Existing primitive replay remains six successful named checks plus
an A-module timeout, `all_requested_checks_ok=false`,
`full_RH_replay=false`. The full human reconstruction is incomplete.

RESUME HERE: independently audit this common supplier, then consume
(21) in the nondefinite clean graph proof and verify the exact
finite dual datum construction. Do not rederive scalar endgame,
uniform torus limits or unrelated A/C estimates.
