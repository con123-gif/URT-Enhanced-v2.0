import New.Exchange.StandardCoefficients
import Lib.Adelic.Landherr.Landherr

/-!
# RUN72 — represented-class transport at the actual standard coefficient caller

27 Nov 2026. Human source-matched derivation using a classical theorem with
its exact local hypotheses checked; prepared native certificate, not executed.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 (completion first);
compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Prior RUN71 09c0f4ff; compact manuscript blob 29820c25acc91450aa8ec712774b57b3d0051c41.
Peer latest files located: 08451434 scalar monomial/E descent; 6c46fb6e
Rallis shared unfolding; 968a30c3 null coupling and marked charge;
577605fc central equivariance; afa6e648 Leray disintegration. Assignment
collision check by commit titles; no claim of full peer audit.

## 1. Glue the inverse BEFORE applying the orthonormal-frame theorem

Actual StandardCoefficients.lean blob 85616f797460e30c5134a146bd5220fadc28855c,
apply_stdColDatum_eq_zero lines 52–77. The retained freitag output gives
a parabolic point x=D.radicalElt(l,z) D.levi(q0,g), primitive index at the
selected ramified places, integral comparison matrices y,y' on the
complement, and inverse identity from the lattice comparison.
Write delta=invDifferentIdele, tau=delta^-1 T, T skew-hermitian and
det T nonzero. Since star(delta)=-delta, tau is hermitian.
Let e be the star-fixed complementary-support idempotent. The comparison
Gram matrix Q=e B+(1-e)tau (B=siegelBracket T gamma) has exact inverse
Q'=e B^-1+(1-e)tau^-1 by e²=e and e(1-e)=0. In this expression B^-1
denotes the native inverse comparison matrix, not entrywise inverse.
Both Q and Q' are integral at all finite places: on the complement use
the comparison integral guards, on the selected places use primitiveness,
and on their conjugates use hermitian symmetry (transpose and star
preserve integrality). This is the native local lemma i applied twice.
No assertion of tau being integral everywhere. The parabolic support
identity o gives Q=siegelBracket T q0. Both pieces are hermitian.
Apply exists_orthonormal_Ô (SpaceOperations.lean
42d0ff55145da26c116891f9822c3a3dfddec57a) to obtain one integral
invertible k, k* Q_f k=I. Retain the stably unramified field hypothesis
supplied in the native CM setup and RUN70 integral-frame proof.

Write T=j beta, q0=scaleIdele q. Using exactly
scaleIdele * j * star(scaleIdele)=delta, the inverse-different
factor cancels before any norm, leaving

    (q_f k)* beta_f (q_f k)=I.

Here * on a matrix preceding the expression means conjugate transpose.
beta is rational hermitian and nonsingular (j is nonzero skew).
This is precisely the finite Gram needed in the represented branch,
not just a real-sign test.

## 2. Standard theorem discharge: Space.landherr

Landherr.lean 6cb96add6ffdb98d2f87b994c5960c72fb84b9a4,
Space.landherr and Space.exists_eq_move.
Classical theorem: Markus Kirschmer, Definite quadratic and hermitian
forms with small class number, Theorem 2.4.1, printed p.20,
https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/herm.pdf#page=20
(actual page image inspected). The local-global principle identifies
two nonsingular hermitian spaces over a quadratic extension when they
are isometric over every completion of the fixed field. It is a theorem
about rational spaces, NOT about isometric integral lattices. The
native source credits Landherr 1936 and Kneser 1969, section 5.5.
Use this standard theorem for the human proof in place of the native
internal construction via Hasse norm and rational frame induction.

Exact hypotheses bridge: E is CM, fixed field E+, quadratic extension.
The two objects V,W of Space E b t' have invertible adelic points
X,Z with X* J_V X=Z* J_W Z=D_t' at infinity and identity at finite
places, by Space.gram_point (SpaceDefs.lean
d1a1e309a47cc3184b7a8697544f5ac4b38c50bd). The forms are hermitian
and nonsingular by these Gram identities and injectivity of the rational
embedding. For each completion of E+, including split places where
E tensor E+_v is a product, a_v=X_v Z_v^-1 gives
a_v* J_V a_v=J_W. Thus every local hypothesis is supplied by the SAME
adelic points. Landherr yields c in GL_b(E), c* J_V c=J_W.
No appeal to an integral local-global principle or strong approximation.
This is an exact published theorem substitution at the human caller,
not a claim of native deletion of its Hasse-norm dependencies.

## 3. Actual represented and nonrepresented cases

RepresentedBy definition: LineParabolic.lean
f7e1245dc5b04a71bc3f9c0624e5fac2938b4051. For each infinite v,
choose C_v with C_v* signMatrix(t') C_v=beta_v. Nonsingularity
of beta_v implies C_v invertible by determinant multiplication.
Its inverse Z_v satisfies Z_v* beta_v Z_v=signMatrix(t').
At finite places put Z_f=q_f k, already a finite adelic GL point
(not a collection of arbitrary local choices). Assemble Z using
gram_mkAdelicGL, SpaceOperations.lean same blob. Then W=(beta,Z)
is a Space E b t'. In particular the same Z has the finite component
fixed by k, rather than an arbitrary isometric representative.

Apply section 2 with V=V'. Define

    w=X^-1 c Z,       X=V'.x.

The Gram identities give w* D_t' w=D_t' on all adeles; therefore
w is in G E t'. This gives Z=c^-1 X w, precisely exists_eq_move
orientation. For gamma in U(beta), the rational embedding is
Z^-1 gamma Z. Hence X^-1 c gamma c^-1 X = w (Z^-1 gamma Z) w^-1.
This also proves the additional rational-point transport in the native
theorem, although StandardCoefficients does not use that clause.

Set Y=X^-1 c q. Then scaleIdele X Y=scaleIdele c q and, crucially,

    Y_f k = X_f^-1 c_f q_f k = X_f^-1 c_f Z_f = w_f in U(I).

The SAME k from section 1 is in intGL. Rational Levi covariance
(centreCoeff_rat_mul, AdaptedHom.lean
74a1d79ff98c6af2705f957b0f62e3f1b5299fba) gives
C_(j J_V')(levi(c,1) x)=C_(j beta)(x).
Conjugating the radical by levi(c,1) changes its parameters l,z
but preserves the parabolic form; new Levi coordinate is c q0.
The native h0 quantifies over every such radical and Levi point,
so Y,k and J_V' discharge its left disjunct. Thus C_T(x)=0.
If beta is not RepresentedBy t', use h0 right disjunct directly
(IsUnit beta and not represented), with the untransported q0.
No need for Landherr or k in the nonrepresented case. The native
proof uses by_cases R and simp for the second branch. This proves the
exact final callback into freitag subject to its retained comparison
hypotheses, all h0 quantifiers and automorphy.

## 4. Audit the coordinate in RUN71, no pointwise shear claim

Readable companion same pin
grh/src/New/Determinant/Exchange/StableSpacesStandardData.lean
399de69a4e75deb3ad883ce2ce17a3021b894e40, shearInvariant_stdColDatum.
It gives a transparent derivation of the compact k coordinate:
for each selected ramified component, frame stabilizer g fixes
the carried k-frame. Unitarity g* J g=J implies k* J g=k* J
there (multiply (g k)* J g=k* J g); thus lCoord g=lCoord.
By the nested splitting identity lCoord_D=lCoord_B A.iCoord,
and A.iCoord A.k=0, the shear nu=I+A.k c at the selected
component leaves lCoord_D unchanged. The conjugate shear piece
vanishes on that component because S and star S are disjoint.
Consequently lCoord_D(nu g)=lCoord_D at precisely the read-at
places. This is the compact equality k after evaluating w*stdForm*g
with frame stability p and star-idempotent q, not a global frame
identity. The two zero products su=ru=0 follow from the same
orthogonality and c A.k=0. The bordered trace-zero phase and compact
Haar reindexing from RUN71 apply. Keep both shear orientations
and all-A quantifiers; this is a human bridge, not a kernel
crosswalk between the compact and readable proof terms.

## 5. Caller and limitations

The actual source-visible chain is
New/Rows/Carrier.lean f0b7f97f299904aa73a928432147a932cac9be40
stdClassSum_det_modKernel_eq -> explicit_matching ->
exchange_theorem (New/Exchange/ExchangeTheorem.lean
608b4f61af27d780e24f799937a836ecd3c1d50a) -> exchange_of_partners
-> stdExchange_of_periods -> apply_stdColDatum_eq_zero -> freitag /
Space.exists_eq_move / partner generator. The final callback above
together with RUN70/71 gives the standard coefficient vanishing
argument, retaining the actual weak approximation, dual-family
Fourier inversion, equivariant lift, freitag comparison construction
and h0 suppliers. The normalized matching constant and the common
quantifier order from RUN65–69 remain; no inference of a prime
bound from this local statement alone.

Original/reduced dependency and axiom records untouched. Local
human replacement of Space.landherr uses the exact classical
local-global theorem and verified hypothesis bridge; no native
graph removal asserted. Context key includes E, t', beta, j,
delta, scaleIdele, q, k, same finite point Z_f, all real places,
all h0 points and pin. No URT, no RH theorem import.
Actual command -v lean/lake/elan: no executables. Latest native
receipt compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json (088cd2ec0e935ee1a282f10096949bcf671cc804)
reread: six named checks, standard three axioms; one timeout 124,
all_requested_checks_ok=false, full_RH_replay=false. No native
scan/prune/reduce/auto/frontier run or new PASS. The probes and
group certificate below are prepared for the existing shared runner.
No workflow or registry edits; preserve all old files.

RESUME HERE: integrate this h0 discharge with RUN71 standard partner
generation at stdExchange_of_periods, checking the actual real-data
and nonrepresented coefficient suppliers from LowRankIdentity and
NonnegativeVanishing. Then follow explicit_matching and
stdClassSum_det_modKernel_eq into the actual C comparison, rather
than further optimizing Landherr or Gauss support. Independent audit
of freitag comparison guards and compact coordinate substitutions
remains required. HANDOFF TO integration/editor, literature,
formal audit and shared native runner. Human RH proof incomplete.
-/

namespace CompactCharacterBoxes72

theorem transported_frame {G : Type*} [Group G] (X c Z q k : G)
    (h : q * k = Z) :
    (X⁻¹ * c * q) * k = X⁻¹ * c * Z := by
  simp only [mul_assoc, h]

theorem rational_point_transport {G : Type*} [Group G] (X c Z a : G) :
    (X⁻¹ * c * Z) * (Z⁻¹ * a * Z) * (X⁻¹ * c * Z)⁻¹ =
      X⁻¹ * c * a * c⁻¹ * X := by
  simp [mul_assoc]

#check Space.landherr
#check Space.exists_eq_move
#check gram_mkAdelicGL
#check exists_orthonormal_Ô
#check IsEquivariantLift.apply_stdColDatum_eq_zero
#print axioms Space.landherr
#print axioms Space.exists_eq_move
#print axioms IsEquivariantLift.apply_stdColDatum_eq_zero
#print axioms transported_frame
#print axioms rational_point_transport

end CompactCharacterBoxes72
