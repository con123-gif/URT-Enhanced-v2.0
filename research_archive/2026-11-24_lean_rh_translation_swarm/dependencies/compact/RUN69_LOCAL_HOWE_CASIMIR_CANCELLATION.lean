import Lib.DiscreteSeries.Theta.LocalThetaCorrespondence
import Lib.Weil.Lift.Edge
import Mathlib.Tactic

/-!
# RUN69 — local Howe generation, exact matched Casimir cancellation
27 Nov 2026. Human source-matched proof, NEW local premise-weakening
candidate for independent audit. Lean certificate prepared, not compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10;
manuscript blob 3b552f2f5c30d874e72f574a479c90037482f96d;
observed branch head a9b37b944f88ed2b96f8c7a3b010722a4d2ddaaf.
Read AGENTS, swarm, handoff, continuity, current mission and recent
peer checkpoints: a9b37b94 (chain budget), 33febdb0 (branching),
b0fe2a3e (integration), 600d03e0 (editor), 19061b0f (odd Sha),
a913c802 (smearing/Casimir Bessel), a824788a (cup caller).
Resume RUN68 dfa8fce297c26b7a2c8bef53a99b33369205fe3b:
prove the actual local bump identity supplying the C period-vanishing
consumer, not the distinct Bessel word bound already treated by peer.

## 1. Exact normal ordering of the two oscillator Casimirs

Source Lib/DiscreteSeries/Theta/OscillatorDefs.lean
(same compact pin; canonical_commutation, oscRows, swap_oscRows_E,
IsMatch, centredParam), and
Lib/DiscreteSeries/FlenstedJensen/RepresentationDefs.lean
(GlModule.casimir, HCParam.casimirValue, lowestKType).
Lib/DiscreteSeries/Theta/LocalThetaCorrespondence.lean
2a5c865a64dcbd1a9c75218fcc4d93ee4b4c6bf8:
integratedRep_fix and exists_bump_integratedRep_eq are the consumers.

Let n=card R, m=card C, both positive; gamma, gamma' are
the ACTUAL T.gamma,T.gamma' (not the untwisted standard constructor
arguments). Write A_rc=raiseOp and B_rc=lowerOp in the native signs,
so [B_rc,A_sd]=delta_rs delta_cd, all A commute and all B commute.
For opposite signs use the native sigma, not a new positive sign
convention. Let s_ab=1 for equal row signs and sigma otherwise,
t_cd=1 for equal column signs and sigma otherwise. Their squares
are 1. The actual operators are
    E_ab=s_ab sum_c A_ac B_bc + gamma delta_ab;
    E'_cd=-t_cd sum_r B_rc A_rd + gamma' delta_cd.
Put N=sum_rc A_rc B_rc (signed occupation with vacuum offset,
not the nonnegative total polynomial degree), and
    Q=sum_abcd A_ac A_bd B_bc B_ad.
Normal ordering the full Casimirs (sum E_ab E_ba) gives
    Omega_R=Q+(n+2gamma)N+n gamma^2 I;
    Omega_C=Q+(m-2(gamma'-n))N+m(gamma'-n)^2 I.
For the row expression the contraction B_bc A_bd produces
nN. For columns first rewrite sum_r B_rc A_rd as
sum_r A_rd B_rc+n delta_cd, so the diagonal offset is gamma'-n.
The column quadratic term has contraction mN. Its normal-ordered
quartic is sum_rcsd A_rd A_sc B_rc B_sd, equal to Q by relabeling
and commutation. Signs cancel in paired factors and equal 1 on
the diagonals. Hence the exact identity, BEFORE any norm:
    Omega_R-Omega_C = (2gamma+2gamma'-n-m)N
                        +[n gamma^2-m(gamma'-n)^2] I.       (1)
No commutator of the two different group representations is being
assumed from the formula: their actual commute premise remains.

## 2. Matching parameters pay the entire scalar in (1)

Use doubled parameters l=2lambda, l'=2lambda'. Set
    x_r=l_r-2gamma+m, y_c=l'_c-2gamma'+n, d=n-m.
IsMatch and injectivity imply that matched pairs are one-to-one,
x_r=-y_c, and every index of the smaller side is matched (its
unmatched range is empty). If d>0, exactly d rows are unmatched;
their distinct integer x satisfy |x|<d and parity x=d-1 mod 2
by HasGap.parity. Thus they exhaust {-d+1,-d+3,...,d-1}.
If d<0 interchange sides; if d=0 all matched. Consequently
    sum x + sum y = 0,
    sum x^2 - sum y^2 = d(d^2-1)/3.                       (2)
The latter is the elementary sum of squares of the arithmetic
progression, signed when d<0; no distributional bound or
large-gap approximation. The signs of the matched pairs are
retained for Howe generation below but not needed for (2).

Let Phi be the native joint harmonic. The sum of its row lowest
K weights is sum l/2: the full and compact twoRho sums cancel
pairwise, and parity removes the floors in paramAddRho.
Since sum E_aa=N+n gamma, N Phi = z Phi with
    z=(sum x-nm)/2.
For injective l the full twoRho values are a permutation of
1-n,3-n,...,n-1, hence sum twoRho^2=n(n^2-1)/3; likewise m.
Substitute (2) into the native Casimir difference:
    4(c(l)-c(l')) =
      d(d^2-1)/3
      +2(2gamma-m)(2z+nm)+2(2gamma'-n)(2z+nm)
      +n(2gamma-m)^2-m(2gamma'-n)^2
      -n(n^2-1)/3+m(m^2-1)/3.
Expanding gives precisely four times the scalar in (1):
    c(l)-c(l')=(2gamma+2gamma'-n-m)z
                       +n gamma^2-m(gamma'-n)^2.          (3)
This is a direct alternative to the actual native
integratedRep_fix's comparison via swapped positivity and
eq_casimirValue_of_ge. It does not require either of those two
steps at THIS consumer. It does not remove them globally.

## 3. Exact projected vector and partner convolution

Write E=integratedRep pi l.dsKernel, v=E(polyVector Phi).
Source Lib/DiscreteSeries/Rigidity/KernelFixes.lean
b7c9218680d4848f11347c91dd6a952ee9b1a0ca:
exists_integration_by_parts, integratedRep_dsKernel_casimir,
integratedRep_fix_of_isKHighest, exists_bump_conv_dsKernel.
The native row integration-by-parts supplies E Omega_R Phi
=c(l)v (apply the polynomial embedding before E).
The projected column derivative is iota=E composed with
polyVector, since bounded E commutes with pi'(g). This follows
by bringing pi'(g) through the Bochner integral, using the
original oscillator pair's commutation, growth and integrability.
It also proves iota Omega_C Phi = c(l')v by (1),(3).
The original Phi is column K-highest of weight Lambda', so the
native rigidity theorem integratedRep_fix_of_isKHighest now
applies at EXACT equality of Casimir eigenvalues, even if v=0.
There is no need to divide by v or use positivity of the swapped
projection at this step. Thus for weighted-integrable f with
    integral f(y) e_l'(y^-1 g) dy = e_l'(g)
we obtain pi'(f)v=v. This is the original integratedRep_fix
conclusion with its exact Haar normalization. The rigidity theorem
itself remains an explicit dependency; we have not proved its
analytic-vector part by normal ordering.

For the next caller take f(y)=alpha(y^-1) from the native
exists_bump_conv_dsKernel. The bump is smooth and compactly
supported; inversion preserves compactness. Weighted integrability
holds for its prescribed exponent card I. Therefore v is already
in the algebraic range of G(beta)=integral beta(y^-1) pi'(y)v dy.
Use the exact Banach-valued smearing convention of
exists_bump_integratedRep_eq: derivative of pi'(exp(tY))G(beta)
is G(bumpDeriv(Y,beta)) by left Haar substitution y'=exp(tY)y
and differentiation of the resulting beta(y'^-1 exp(tY)).
For t near 0 the translated supports lie in a fixed compact
set, derivatives are bounded and the orbit is continuous;
dominated differentiation applies in the original Banach norm.
Complexify using the decomposition of every complex matrix
into two real unitary Lie directions. This is range invariance,
not a closure or density claim. Peer a913c802 proved the scalar
smearing for Bessel; here it is used at the distinct C vector
range with the original column orbit and projected iota.

## 4. Howe's polynomial induction at the actual range

Source Lib/DiscreteSeries/Theta/HoweArgument.lean
4a68183128d5be3f39e8a5ed7556bac698b3f4b6;
Lib/DiscreteSeries/Theta/FischerDecomposition.lean
49f936d3c6cd2934066c84faa46f002adcf4f2c8;
Lib/DiscreteSeries/Theta/JointHarmonicUnique.lean
f255a9013e232ab082c4033e07943cdf3d2b967d.
Use H=iota^-1(range G) as a complex polynomial subspace.
Column action preserves H by section 3: no topology on H.
The joint harmonic belongs to H by the normalized bump.
Row compact lowerings and (E_aa-Lambda_a) have images in
ker iota by actual integration by parts against the generator
of -l: its raising order is the reverse and diagonal weight
is -Lambda. For each row K-highest P with weight nu satisfying
nu-Lambda outside rootCone, integratedRep_eq_zero_of_notMem_rootCone
gives E pi(g) polyVector(P)=0 for every g. Differentiate along
the real unitary Lie directions and complexify to conclude
iota(T.oscRows(X)P)=0. These are exactly hG,h0,hc,K,L of Howe.

Here is the native Howe argument with its degree-minimal witness.
If H is proper, let j>=0 be the first degree with a missing
polynomial, and choose a nonzero column K-highest P in
    W_j = (H intersect Poly_<=j)^perp intersect Poly_<=j.
This finite-dimensional space is stable under column compact
operators: H is invariant, degree is preserved, and their
Fischer adjoints are the reversed operators. A highest vector
exists by the commuting diagonal spectral decomposition and
maximizing l' dot weight. The same Fischer adjoint identity
and the row compact-lowering image assumption imply P is
row compact-highest. Similarly, subtract the real scalar
Lambda_a from each selfadjoint diagonal: its image is in H,
and pairing with H intersect Poly_<=j shows
(E_aa-Lambda_a)P is in both H and W_j; hence zero.
This is not an assertion that the quotient has a grading.

All column Laplacians kill P by Fischer.fockLaplacian_eq_zero:
the degree-lowering Laplacian lands in degree <=j-2, hence in
H by minimality, and its opposite-row raising image for the
SWAPPED pair belongs to H by column stability. The Fischer
adjoint calculation then gives squared norm of the Laplacian
zero. This calculation includes the lower-degree term of the
opposite operator, orthogonal to P; keep the native sign.
For row Laplacians Q_ab, use the separate
Fischer.fockLaplacian_eq_zero_of_isKHighest. It reduces to
those Q_ab that are row K-highest with weight
Lambda+e_a-e_b (as in the native signature).
Indeed their commutators with compact raising operators are
other Laplacians with strictly higher l dot weight. Induction
over the finite set of pairs gives this reduction; diagonal
commutators yield the displayed weight. Only opposite signs
are considered.

If l_a>l_b, the gap exceeds 2(m-n) in doubled units; thus
either x_a>m-n or -x_b>m-n. Apply the actual
polarisation_eq_of_isCompactPrimitive and
sign_mul_lowestKType_sub_nonneg with sign + at a or - at b:
the derivatives in Q_ab (variables of sign - at a, + at b)
are zero. These theorems use the column harmonicity already
proved, compact primitivity and matched-parameter sign
condition; do not infer this from compact highest weight alone.
Otherwise l_a<l_b by injectivity. In that case e_a-e_b lies
outside rootCone: take the admissible order o=-l, giving
o dot(e_a-e_b)>0. The h_c premise now supplies the opposite
row operator's image of Q_ab in H. Apply the same Fischer
adjoint norm identity, with Q_ab of degree <=j-2, to get Q_ab=0.
Thus all row Laplacians vanish, too.

Now P is a nonzero pre-joint harmonic with the exact row
weight Lambda and column compact primitivity. The native
IsMatch.unique applies to P and Phi: P is a scalar multiple
of Phi. Therefore P belongs to H, contradictory to P nonzero
in W_j. This completes Howe's induction and H=all polynomials,
conditional on the explicitly named polarisation and
pre-joint-harmonic uniqueness proofs (next section). The
joint harmonic's column weight need not be proved separately
for this step, matching the native IsPreJointHarmonic.

Since every polynomial P belongs to H, iota(P)=G(alpha)
for one compact smooth bump alpha, exactly the conclusion
of OscillatorPair.exists_bump_integratedRep_eq with alpha
composed with inversion. In particular this is NOT just
approximability by finite orbit combinations. Insert it into
RUN68's tensor/convolution derivation at
Lib/Weil/Lift/Edge.lean isHalfEdge_of_oscillatorPair,
then New/Rows/MemberOrthogonality.descentsVanish_hypSum at
the actual highest-vector consumer. The two class-period
branches ComparisonForms and HeckeValueHeight share that
supplier. Original global Fubini and joint-harmonic existence
inputs are unchanged.

## 5. Exact residual frontier, verification and handoff

Original source-visible dependency chain (not elaborated DAG):
C -> ComparisonForms/HeckeValueHeight -> MemberOrthogonality
 -> half edge -> exists_bump_integratedRep_eq
 -> howe_argument [Fischer, polarisation, IsMatch.unique]
 AND integratedRep_fix [row Casimir, swapped positivity,
 eq_casimirValue_of_ge, partner rigidity]
 AND rootCone annihilation, bump convolution, integration by parts.
Proposed local reduction: replace swapped positivity and
eq_casimirValue_of_ge at this one call by (1),(2),(3),
with the same original pin, T, Phi, E, Haar, gap and match.
Do NOT delete the original graph or other callers. The
native source/axiom evidence is unchanged; global root reachability
and deletion remain unverified. No shortcut importing RH.
Retain polarisation, matched parameter sign bound, IsMatch.unique,
root-cone annihilation, exact rigidity including analytic-vector
uniqueness, bump convolution, actual joint harmonic existence.
No URT applied. This is a substantive local algebraic alternative
and source-matched Howe proof, not closure of every primitive.

Actual tests in sandbox: command -v lean / lake produced no
paths. Native rh_scan/prune/reduce/auto/frontier not available.
SymPy exact symbolic expansion of spectral expression in section
2 minus operator scalar (section 1) returned exactly 0:
    n,m,g,h,N=symbols('n m g h N'); d=n-m; S=2*N+n*m
    spectral=(d*(d*d-1)/3+2*(2*g-m)*S+2*(2*h-n)*S
      +n*(2*g-m)**2-m*(2*h-n)**2-n*(n*n-1)/3+m*(m*m-1)/3)/4
    operator=(2*g+2*h-n-m)*N+n*g*g-m*(h-n)**2
    expand(spectral-operator) == 0
This checks the scalar polynomial only, not the operator identity
or native theorem. Lean scalar certificate below is prepared,
not compiled. Independent API read historical run 45799225653
jobs success. Run 45803534769 job wrapper success BUT persisted
status.json reports error, returncode 1, 5147.99s, module 1
timeout 2700.11s; targeted_results.json all_requested_checks_ok
false, six names audited with propext, Classical.choice,
Quot.sound (TiltingLemma and Filling.Moments). No new PASS
or axiom assertion for this replacement. Existing evidence
preserved on its own source pin.

RESUME HERE: inspect the actual IsMatch.unique translation
argument in JointHarmonicUnique (minimum shifted monomial,
polarisation and matched-coordinate uniqueness), then the
sign_mul_lowestKType_sub_nonneg combinatorial premise.
Audit (1) with actual raise/lower conventions, (2) parity and
both rank orders, (3) at integratedRep_fix; native runner
should verify the caller substitution rather than just the
scalar lemma. HANDOFF TO integration/editor, independent audit,
native kernel runner. Complete human RH proof remains unfinished.
-/

namespace RHDependencyRun69

theorem matched_casimir_scalar (n m g h z : ℝ) :
    ((n-m)*((n-m)^2-1)/3
      + 2*(2*g-m)*(2*z+n*m) + 2*(2*h-n)*(2*z+n*m)
      + n*(2*g-m)^2 - m*(2*h-n)^2
      - n*(n^2-1)/3 + m*(m^2-1)/3)/4 =
    (2*g+2*h-n-m)*z + n*g^2 - m*(h-n)^2 := by
  ring

theorem shifted_casimir_difference (n m g h z q : ℝ) :
    (q+(n+2*g)*z+n*g^2) -
      (q+(m-2*(h-n))*z+m*(h-n)^2) =
    (2*g+2*h-n-m)*z+n*g^2-m*(h-n)^2 := by
  ring

end RHDependencyRun69

#check OscillatorPair.integratedRep_fix
#check OscillatorPair.exists_bump_integratedRep_eq
#check IsJointHarmonic.howe_argument
#check IsMatch.unique
#check IsMatch.sign_mul_lowestKType_sub_nonneg
#check integratedRep_fix_of_isKHighest
#check integratedRep_dsKernel_casimir
#check FockDualPair.swap_oscRows_E
#print axioms RHDependencyRun69.matched_casimir_scalar
#print axioms RHDependencyRun69.shifted_casimir_difference
