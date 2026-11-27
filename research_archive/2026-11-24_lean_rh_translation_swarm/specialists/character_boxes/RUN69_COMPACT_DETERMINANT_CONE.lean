import New.Exchange.DeterminantVectors
import Mathlib.Tactic

/-!
# RUN69 — determinant cone preimage, exact cancellation and positive normalization
27 Nov 2026. Human source-matched derivation; native replay of this file pending.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0; Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10, current manuscript
3b552f2f5c30d874e72f574a479c90037482f96d. AGENTS, continuity, research
state, swarm, handoff and expansion inspected. Previous lane 7d33beab;
latest peers b1451de3 (CM/measure), 47581d42 (Howe), dc4a02df (lattice)
and 41c63681 (Bessel circle projection, a DIFFERENT consumer) inspected
via commit listing and, for the last, patch. No URT assumption.
Completion-first compact migration takes precedence over old window detour.

## 1. Actual caller and exact hypotheses

New/Exchange/EqualRankValue.lean a620150b7c616d614013822be11dbdf74a694f0d,
exists_stdExchange_removing_planes, unit-plane branch invokes
surjOn_cone_integral_detVectors A X beta z h m; this is actually defined
in New/Exchange/DeterminantVectors.lean 400d6e1006faa05d0109d8d67dc4caa8e1c2391f.
A and X are adapted splittings of W' over W and V' over V, each adding
one hyperbolic plane. Write q=negCount(s'), p=posCount(s'), n'=p+q.
Assume n'=2(k+q), z>=1, and m_w natural. Thus p=q+2k.
Both line models beta are required. The original detVectors set consists
of rapid Fock vectors of the form
  v(u)=c vac(u) conjugate(prod_w D_+(M_w(u))^(m_w)
                                         D_-(M_w(u))^(m_w+2k)),
  M_w(u)=posCoordMatrix s t F u w.
Here F is a single adelic matrix, c a complex scalar, and D_sigma is
the principal determinant of the sign-sigma coordinate block. Empty
minors have determinant 1. We prove existence of one rapid determinant
vector upstairs mapping to this given v, not surjectivity on all Fock
vectors. This is the nonzero-reference construction required by
exists_equalRankThetaRatio_value; it is not used to descend an arbitrary
already-given exchange identity.

## 2. Positive-part slice and the explicit preimage

Use Lib/Weil/DualPair/TwoLineTerms.lean 06a335214712d21667b42fb333de2b087a9c3f1d,
tsum_lineTerm, for the exact mixed-model adapted frame D for each beta.
At infinity, for an adapted frame P, P*P=PP*=1 and
  J P = P diag(J_H,J_old),  J_H=[[0,1],[1,0]].
This follows by multiplying the frame Gram identity P*JP=diag(J_H,J_old)
by P on the left. Thus the positive projection (1+J)/2 acts in a
hyperbolic pair by replacing both coordinates by their midpoint.

For mixed coordinates J(a,u,b)=La+Iu+Kb, the projected slice point is
  U=J(-a,u,-a),  P_+ U= -La+I P_+ u-Ka.
Unitarity gives <J(a,u,a),J(c,v,c)>=2<a,c>+<u,v>.
This is the exact calculation in PositivePart.exists_slice_eq.
For coherent vacuum translates supported on the positive coordinates,
the mixed slice law slice_realHeisOp and this pairing give equality
of the evaluation at U and the slice at a evaluated at u. The
Gaussian terms agree by the same pairing. Extracting polynomial
coefficients of the coherent exponentials gives the equality for
every positive-coordinate polynomial times the vacuum (alternatively
use the native hom_ext on coherent vectors). Keep the mixed
Heisenberg slice law and coherent density as the stated model inputs;
the midpoint identity alone is not a proof of that law.

Set the upstairs matrix, with all adelic frames as in source, to
  G=(-(scaleIdele E)_infty^(-1),0) *
       (A.kAdelic X.kAdelic* + A.lAdelic X.lAdelic*)
       + A.iAdelic F X.iAdelic*.
The star on frames is conjugate transpose. The first scalar is zero at
finite places. No integral constraint on this Fock parameter G is
needed. Define R(x) as the polynomial vector of
  x prod_w d_(w,+)^(m_w) d_(w,-)^(m_w+2k),
where d_(w,sigma) is the determinant of the polynomial matrix
  [sum_j conjugate((scaleIdele E G)_(j,l)(w)) X_(w,i,j)]_(l,i)
with terms only when s'_j=t'_i=sigma. Rename the positive variables
into the full polynomial ring as in the source. Polynomial vectors
are rapid by weightedNorm_polyVector_ne_top; no arbitrary extension
of an upstairs analytic vector is asserted.

## 3. Compact action cancels exactly, before absolute values

Lib/Weil/DualPair/PairReal.lean b45749d2e304ca38912dba6379ab5284468e8f77,
realPairWeil_polyVector, gives for g block diagonal on t' the scalar
multipliers det(g_+)^(gamma-q) det(g_-)^(gamma-p) and polynomial
substitution. With gamma=n'/2-(k+m_w)=q-m_w these exponents are
  gamma-q=-m_w,   gamma-p=-(m_w+2k).
Under the positive-coordinate substitution the two d determinants
acquire factors det(g_+) and det(g_-), respectively: multiply the
same-sign row matrix by its corresponding g block and use det(AB).
Both factors are nonzero (g is invertible block diagonal).
The powers exactly cancel the two prefactors, including when one
block is empty. Thus for every compact element and x,u,
  realPairWeil(gamma,0)(1,g) R(x)(u)
    = detVectorFn s' t' k m x G u.
In particular R(x) itself has exactly the required determinant
function and is a member of detVectors. This removes any need to
bound the compact action by its norm or average over varying phases.
All places and both signs use the same G. This step is derived from
the actual polynomial Weil law, not from a general invariance claim
for arbitrary Fock vectors.

## 4. New sign minor and scalar cone factor

For the slice at a=(a_w)_w in the multiplicative group, apply the
frame of tsum_lineTerm for the chosen beta. The displayed frame
contains the columns X.l tensor A.kCoord^T and X.k tensor A.lCoord^T;
the final pair is exchanged by beta. Inserting the projected point
from section 2 into posCoordMatrix and G gives, in the X frame at w,
  M'_w = P_w diag(a_w I_2,M_w) P_w* .
Indeed the W,V coordinates multiply to posCoordMatrix s t F u;
mixed terms are zero by the mutually dual frame relations, while
the two new coordinates are -a_w from the slice times the minus
inverse scale in G, hence a_w. The other entries vanish by the
orthogonality of A.i and X.i to their k,l columns. The beta exchange
switches the two hyperbolic coordinates but leaves a_w I_2 unchanged.
The finite part of G does not enter this real identity. This uses
the exact adapted-frame identity l from tsum_lineTerm, not an
arbitrary choice of a positive projection.

To see the sign-minor conclusion without a coordinate determinant
expansion, P_w identifies the two eigenspaces of diag(J_H,J_t)
with the +/- coordinate spaces of J_t'. The two eigenspaces of
J_H are the spans of (1,1) and (1,-1). Since the hyperbolic block is
scalar, M'_w preserves this new line on each side, and compression
to the sign-sigma space is unitarily similar to
  diag(a_w, (M_w)_(sigma,sigma)).
This is true for a compression even if M_w has off-diagonal
sign blocks: conjugation by the sign-intertwining unitary commutes
with the relevant projections. Hence for both signs
  D_sigma(M'_w)=a_w D_sigma(M_w).
There is no square root, sign ambiguity, or separate orientation
constant. The new Gaussian factor from the slice in the native
normalization is exp(-sum_w |a_w|^2); this is the vacuum evaluation
of PositivePart.exists_slice_eq with polynomial 1, as used in
DeterminantVectors.lean. Preserve this model normalization.

Writing mu_w=k+m_w, multiplication of the two conjugate new minors
contributes conjugate(a_w)^(2mu_w).
Lib/Weil/MixedModel/EquivariantCoefficients.lean
9b779698c36ab64b5a1964a948cb7089587a3fce, coneIntegrand, supplies
the angular multiplier (a_w/|a_w|)^(2mu_w). They cancel BEFORE
taking norms:
  (a_w/|a_w|)^(2mu_w) conjugate(a_w)^(2mu_w)
      = |a_w|^(2mu_w).
Every a_w is nonzero. The idele module of the real idele is
prod_w |a_w|^2. Thus, for every real d and every integration point
(kappa,a), the actual cone integrand at R(d c) is
  coneIntegrand A X mu beta z R(d c)(kappa,a)
       = d H(a) v,
  H(a)=exp(-sum_w |a_w|^2) * prod_w |a_w|^(2(z+mu_w)).
This is the source's exp(phi) formula, not merely a modulus bound.
All character and compact phases have cancelled.

## 5. One strictly positive normalization and the native consumer

Let I=integral H(a) d(kappa,a) for the exact product Haar measure
in coneIntegrand. H is strictly positive everywhere; z>=1 and
mu_w>=0. Multiplicative Haar on C* is a positive constant times
dr/r dtheta; compact Haar is finite positive. Each radial integral
is (up to a positive constant)
  integral_0^infty e^(-r^2) r^(2(z+mu_w)-1) dr
      = (1/2) Gamma(z+mu_w).
It is finite and positive, by the power test at 0 and the Gaussian
at infinity. No Gamma identity needed as an extra number-theoretic
input. Fubini over finitely many places applies to this nonnegative
integrand. Equivalently the source derives integrability from
integrable_coneIntegrand using a nonzero v and the positive formula.
With v=0 take R(0)=0. Otherwise choose the SINGLE upstairs vector
  v'=R(c/I).
It is rapid and a determinant vector, and the Bochner integral
equals I^(-1) I v=v. In particular the nonzero target in the rank-zero
reference branch has a preimage, and no choice of I depends on the
tame character. Composition of these one-plane preimages in the
strong induction of exists_stdExchange_removing_planes gives the
required multi-plane surjectivity, since each stage preserves the
rank/weight condition (p and q both decrease by 1). This integrates
RUN67/68 with the actual nonzero-reference consumer. No claim of
surjectivity onto arbitrary rapid data; no assumption of nonzero
L-values introduced.

## Evidence and retained frontier

Original source-visible graph:
exists_equalRankThetaRatio_value -> exists_stdExchange_removing_planes
 -> surjOn_cone_integral_detVectors -> PositivePart.exists_slice_eq,
 realPairWeil_polyVector, tsum_lineTerm frame, integrable_coneIntegrand.
Reduced human proof retains the frame and mixed/Weil model laws,
expands the polynomial cancellation, sign-compression determinant,
angular cancellation and positive integral normalization. The
original and reduced native graphs are unchanged; no global
dependency deletion or new axiom verdict. Exact context key:
compact pin, A,X adapted, beta, z>=1, n'=2(k+negCount s'), m_w>=0,
given c,F,v, exact Haar. The independent model-law derivations,
staged unfolding, integral Witt and Freitag/unimodular Fourier
criterion remain visible. Prior CI receipt
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e was fetched again:
all_requested_checks_ok=true, full_RH_replay=false; 10 named and
4 scalar checks, none of these new certificates. No local Lean,
Lake or elan (command -v); no new rh_scan/prune/reduce/auto/frontier
execution. Native caller #check and #print axioms plus scalar
certificates below prepared for later targeted CI, not compiled.
No protected workflow or prior file modified.

RESUME HERE: StandardCoefficients.apply_stdColDatum_eq_zero, the
actual Freitag bridge. Read freitag definition/body and
partner_mem_of_unimodular_vanishing before replacing the premise.
Separate local patching, rational approximation, singular Fourier
uniqueness and represented-class transport. Keep the actual
integral orthonormal completion and sign exclusion until proved.
Integrate the determinant cone proof into RUN67/68 nonzero
reference; do not redo its scalar normalization.
HANDOFF TO integration/editor, geometry, kernel and audit.
Human compact RH proof remains incomplete.
-/

namespace CompactCharacterBoxes69

theorem compact_exponents (q k m : ℤ) :
    (q-m)-q = -m ∧ (q-m)-(q+2*k) = -(m+2*k) := by
  constructor <;> ring

theorem angular_cancel (a b r : ℂ) (n : ℕ) (hr : r ≠ 0)
    (hab : a*b = r^2) :
    (a/r)^(2*n) * b^(2*n) = r^(2*n) := by
  rw [← mul_pow]
  have hh : a/r*b = r := by
    calc
      a/r*b = (a*b)/r := by ring
      _ = r^2/r := by rw [hab]
      _ = r := by field_simp
  rw [hh]

theorem normalize_cone {V : Type*} [AddCommGroup V] [Module ℝ V]
    (I : ℝ) (hI : I ≠ 0) (v : V) : I • (I⁻¹ • v) = v := by
  rw [smul_smul, mul_inv_cancel₀ hI, one_smul]

#check surjOn_cone_integral_detVectors
#print axioms surjOn_cone_integral_detVectors
#print axioms compact_exponents
#print axioms angular_cancel
#print axioms normalize_cone
end CompactCharacterBoxes69
