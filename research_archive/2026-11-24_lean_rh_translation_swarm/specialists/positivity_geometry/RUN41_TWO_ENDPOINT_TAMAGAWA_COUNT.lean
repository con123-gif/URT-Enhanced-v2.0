import RUN30_NATIVE_AGGREGATE_MASS_VOLUME
import Formalism.LocalToGlobal.GlobalTheory.GL5.PacketStatementOfIndependence
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN41 — two endpoint Tamagawa calibration feeds the actual LinkMin count,
without adjacent geometric spaces or any intermediate mass computation.
25 Nov 2026. SOURCE-MATCHED human derivation, conditional on native transport;
Lean adapter PREPARED, not compiled. RH OPEN.

Mission f8b4b837301f8cf43d673be4979f04c4e4b415a4 read first including unified
engine; AGENTS 8db0201d, SWARM 4b77b161, HANDOFF bbc46df7, EXPANSION c8152d07,
continuity/state/log/protocol, summary and living proof fd2d51ae41d5a18a548f009918f298f1bf0e222c
inspected (long files in part). Latest 15 lane commits surveyed. RUN40
9530ff09, theta f1f5fe71, editor a5db7249, integration a5f9e0570, RUN30
aggregate file b809b11cf249ac5e072ad0ed32c52aba549151b3, RUN31 188850b1
and integration's selected standard mass file 0272379c535e254ac0d3c1f257e25fea82b3037e
read. Pin 40e56bab026552e089d7afcfeff08d2defb9c005, Lean 4.33.1, Mathlib
0df444a360eaa60ab8c11dca51a86af692955474. Observed upstream main
686902ae1da717a63faf52d2dc6a50e5722942cd, 22:28:51Z, cache layout
commit; no changes incorporated or semantic equivalence claimed.

NEW: combine the theta gauge-volume rank formula with the geometry CD
scale, then compare ONLY the two actual count endpoints. This is not
another derivation of same-rank normalization. No rank-one mass evaluation
and no descending sequence of signature witnesses required in this route.

Fix the actual D and its F,E, f=[F:Q], d=abs disc F, v=D.host.v,
k=D.R.k>=5, r=D.R.r=k+m-1. Finite-unramified CM gives |disc E|=d^2
and 2v=d^(1/f) in the native host normalization. Let chi be its
quadratic character and L_j=L(j,chi^j), j>=2. The actual endpoints
are Y=D.sp.Y 0 of rank r and P=stdPos D k, NOT an arbitrarily
chosen independent host. The latter's standard form and lattice
are exactly those defining massI D k. For Y use its native SigOK
and finite self-dual model, and the actual same-host CM-place indexing.

Theta RUN40's gauge quotient formula is
  C_n = B*d^(n^2/2)*prod_{j=2}^n L_j,
where B=tau(U_1)*L(1,chi) is independent of n and signature.
The rational determinant section exists by diagonalization of each
nondegenerate Hermitian form over E (not a rational isometry between
different signatures); SU is simply connected. The measure comparison
uses Kottwitz's Tamagawa theorem, rational invariant densities, local
perfect lattice model including split/dyadic places, and absolute
convergence after the degree-one factor is cancelled. See theta RUN40
and geometry RUN40 for the detailed mathematical suppliers. Retain the
classical Tamagawa theorem and quotient disintegration as external
foundations; no RH theorem is used. This audit does not independently
establish the native global transport of either endpoint.

Crucial normalization: C_n is NOT D.vol. StandardLattice.IsVolMeas
requires finite stabilizer mass 1 and at each real place the CDHaar
measure, not gauge trace Haar. RUN40 gives a_n=prod_{j=1}^n
((j-1)!/(2*pi)^j) for this compact-dual scale. Thus on the SAME
native coordinate rectangle, CD measure is a_n^f times trace
measure with finite stabilizer mass one. Haar uniqueness on the
positive finite rectangle and VolTie give, once the transports are
established, the actual volume
  V_n = B*a_n^f*d^(n^2/2)*prod_{j=2}^n L_j.
The archimedean factor MUST depend on n, even though it cancels
between different signatures at fixed rank. Likewise the discriminant
exponent is n^2/2, not a common prefactor across ranks.

Now factor at the two endpoints BEFORE logs:
  V_r / V_k =
      (a_r/a_k)^f * d^((r^2-k^2)/2) * prod_{k<j<=r} L_j
    = prod_{k<j<=r} [((j-1)!/(2*pi)^j)^f*d^(j-1/2)*L_j]
    = prod_{k<j<=r} ratioH(D,j).
Indeed d^(j-1/2)=((2v)^f)^(j-1/2), so the bracket is exactly
  [ (j-1)! * (v/pi)^j ]^f / sqrt((2v)^f) * lValEta(E,j).
The local grouping of conjugate primes gives L_j=lValEta(E,j)
as in theta RUN40; no unknown degree-one factor survives. This
is the exact formula in native log_mass_ratio_formula (all factors
strictly positive). Only finite products at ranks >=2 occur.
This proves the endpoint relation from the two normalized volume
formulas, not by presuming the separate native mass recurrence.

At P=stdPos D k the selected standard form/lattice identity and
definite_class_decomposition give D.vol P=massI D k (integration
selected-standard certificate, use n=k rather than n=r). This needs
only the chosen class decomposition and its upstream hypotheses.
Thus the decisive identity at the actual native count is
  volY0 D = massI D k * prod_{k<j<=r} ratioH(D,j).
The two measures use the SAME B and F,E; no separate existential
normalization is chosen for each endpoint. This proves RUN30's
aggregate premise conditional on the two actual transports and
selected rank-k mass normalization. Use rh30_family_of_aggregate
to pass the exact result to the original lower/upper count and
variation consumers, rather than reconstructing the all-rank
MassRatio2 or BaseVolumeEqualsMass packages. Keep the source's
SigmaDegreeTwoSidedBoundOfGap and gap/scale/family hypotheses.
The native uniform threshold still requires the two endpoint
calibrations for every admissible D in the same family.

A convenient direct packet uses a common scalar
  C=B*a_1^f*d^(1/2)
and rankTail(n)=prod_{2<=j<=n} ratioH(D,j).
No evaluation or geometric realization of rank-one mass is necessary:
C is merely an algebraic factor of the formula. The two actual endpoint
calibrations are volY0=C*rankTail(r), massI(k)=C*rankTail(k).
Split the finite product at k and eliminate C by multiplication, with
no division, even in Lean. The scalar certificate below proves this
exact native aggregate implication and connects it to the actual
RUN30 count family. It does NOT establish the two endpoint
calibrations from the underlying native measure model.

If the calibrations instead have different positive residual factors
C_r and C_k, the previous signed defect is exactly log(C_r/C_k)/(fk).
This shows precisely why the same scalar is indispensable; independent
rankwise constants do not suffice. Preserve the signed interval
[-2L,m] fallback. Do not change the exact sharp count or the remaining
ASK-MAIN loss/entropy and arithmetic witnesses.

Original source-visible graph:
family_of_global_statements <- MassRatio2 + BaseVolumeEqualsMass;
division_level_prime_family <- lower/upper family bounds + identity
 + variation + gap; LinkGLOBAL7 and downstream count/ASK-MAIN consumers.
RUN31 alternative: selected descending signatures + terminal mass.
New candidate overlay: endpoint trace/Tamagawa + CD scale + native
VolTie transport at Y and P + selected P class mass -> common packet
-> aggregate -> LemmaFiveOneIdentity -> existing RUN30 count family.
No global dependency deletion, no retirement of original theorem-two,
class mass, VolRatioTrue, canonical rank-gauge or other shared consumers.
Keep all original/reduced graphs, axiom evidence and unresolved edges;
actual constructor-inclusive root coverage remains pending.
Cache context by pin/toolchain, D, F,E, rank, exact W/frames/lattice,
measure convention, endpoint, family/scale/host and consumer. Backtrack
to RUN31/native if either measure comparison fails. No URT ranking needed.

Pinned source evidence: 20 connector checks actually executed, including
five exact blob hashes and 15 source anchor checks:
 StandardLattice.lean cb758a6c5f78e610b8f946d4b733d07902b15f5d
 GlobalRankLatticeProofs/LemmaFiveOneOfTheoremTwo.lean 2b7d6755659146ca64a2aad8f1a426b6f196bd87
 LinkMin.lean b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f
 ThickPlacesCorollaryOfAnyTranslate.lean a91264c8b21d7263cd4bddaee24ef428b141d869
 (above relative to Formalism/SharpRestriction/GlobalSchurBounds)
 Formalism/LocalToGlobal/GlobalTheory/GL5/PacketStatementOfIndependence.lean
 1cebe7595e0dc808d6d38fb6d359edf122148c9f.
Read IsVolMeasF too (CdScaleTieIff 471f92ee9723578af84524a4af40b68f4c16137c).
Kottwitz, Tamagawa numbers, Ann. Math. 127 (1988) 629-646:
https://annals.math.princeton.edu/1988/127-3/p05 ; source attribution
in peer RUN40, primary article not independently reread.

Executed Python Fraction regression on rational specializations of the
formal endpoint identity (not actual number fields, not a proof of RH):
 for b in (4,9,25), f in (1,2,3), p in (3,7/2):
   dh=sqrt(b)^f, a(n)=prod((j-1)!/p^j,j=1..n),
   L(j)=(j+2)/(j+1),
   V(n)=(7/3)*a(n)^f*dh^(n*n)*prod(L(j),j=2..n),
   q(j)=((j-1)!*(b/p)^j)^f/dh*L(j).
   for k=5..9, r=k..k+6: assert V(r)==V(k)*prod(q(j),j=k+1..r).
   assert V(6)/V(5)!=dh^11*L(6)  # omission of compact scale
   assert V(6)/V(5)!=a(6)^f/a(5)^f*L(6) # omission of discriminant
Output 630 endpoint algebra checks, 36 negative controls; all assertions
succeeded. These are only arithmetic regression checks of the identity.
No synthetic native host data or extrapolation.

Local lean/lake and elan toolchains absent. Actual Actions jobs for
45577239749, 45576756833 and 45670987597 retrieved, all completed/success
(baseline engines, strip root, analytic diagonal endpoint only).
No new compiler/axiom result for RUN41, no new PASS or registry edits.
To replay copy RUN30_NATIVE_AGGREGATE_MASS_VOLUME.lean and this file
into the existing pinned overlay import path with the engine modules.

RESUME HERE: batch replay RUN30 and RUN41 plus selected-standard mass
certificate at rank k; verify original/candidate actual caller and axiom
ledger. Independent audit should check exact IsVolMeas transport of Y0,
not just canonical diagonal gauge; same endpoint transports are the
remaining geometric premise. In particular use the native coordinate
frames and local lattice model, then use the joint ASK-MAIN budget
with the resulting count. Do not invent a new intermediate normalization.
HANDOFF TO integration, kernel, theta, editor, audit. PARTIAL.
-/

noncomputable section
namespace Formalism.MainNotions.StandardLattice
open Formalism.BasicNotions NumberField Finset

def rankTail41 (D : D7) (n : ℕ) : ℝ :=
  letI := D.host.cmStar
  ∏ M ∈ Ico 2 (n + 1), ratioH D M

theorem rankTail_split41 (D : D7) (k r : ℕ) (hk : 1 ≤ k) (hkr : k ≤ r) :
    letI := D.host.cmStar
    rankTail41 D r = rankTail41 D k *
      ∏ M ∈ Ico (k + 1) (r + 1), ratioH D M := by
  letI := D.host.cmStar
  have hdis : Disjoint (Ico 2 (k + 1)) (Ico (k + 1) (r + 1)) := by
    refine Finset.disjoint_left.mpr ?_
    intro j hj hj'
    have h1 := Finset.mem_Ico.mp hj
    have h2 := Finset.mem_Ico.mp hj'
    omega
  have hu : Ico 2 (k + 1) ∪ Ico (k + 1) (r + 1) = Ico 2 (r + 1) := by
    ext j
    simp only [Finset.mem_union, Finset.mem_Ico]
    omega
  unfold rankTail41
  rw [← hu, Finset.prod_union hdis]

def RH41TwoEndpointCalibration (D : D7) : Prop :=
  letI := D.host.cmStar
  ∃ C : ℝ, 0 < C ∧
    volY0 D = C * rankTail41 D D.R.r ∧
    massI D D.R.k = C * rankTail41 D D.R.k

theorem aggregate_of_two_calibrations41 (D : D7) (C : ℝ)
    (hR : volY0 D = C * rankTail41 D D.R.r)
    (hK : massI D D.R.k = C * rankTail41 D D.R.k) :
    RH30AggregateMassVolume D := by
  letI := D.host.cmStar
  have hr : D.R.r = D.R.k + (D.R.m - 1) := by
    have := D.R.r_eq
    have := D.R.two_le_m
    omega
  have hk : 1 ≤ D.R.k := by have := D.R.k_ge; omega
  have hkr : D.R.k ≤ D.R.r := by omega
  have hsplit := rankTail_split41 D D.R.k D.R.r hk hkr
  unfold RH30AggregateMassVolume
  calc
    volY0 D = C * rankTail41 D D.R.r := hR
    _ = (C * rankTail41 D D.R.k) *
        ∏ M ∈ Ico (D.R.k + 1) (D.R.r + 1), ratioH D M := by
          rw [hsplit, mul_assoc]
    _ = _ := by rw [← hK, hr]

theorem rh41_aggregate_of_packet (D : D7) (h : RH41TwoEndpointCalibration D) :
    RH30AggregateMassVolume D := by
  obtain ⟨C, _, hR, hK⟩ := h
  first
  | (rh_reduce 2 using [aggregate_of_two_calibrations41]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact aggregate_of_two_calibrations41 D C hR hK

theorem rh41_family_of_calibration {eps : ℝ} (Fm : Formalism.MainNotions.FamP eps)
    (hcal : flipTwoThree.fam0 Fm RH41TwoEndpointCalibration)
    (h3 : flipTwoThree.fam0 Fm SigmaDegreeTwoSidedBoundOfGap) :
    FamilyVandermondeCountExplicit Fm := by
  apply rh30_family_of_aggregate Fm _ h3
  obtain ⟨x0, hx0⟩ := hcal
  exact ⟨x0, fun x hx hxx i => rh41_aggregate_of_packet _ (hx0 x hx hxx i)⟩

rh_scan family_of_global_statements limit 2000
rh_scan division_level_prime_family limit 2000
rh_scan rh41_family_of_calibration limit 2000
rh_prune aggregate_of_two_calibrations41 as RH41EndpointPruned
rh_prune rh41_family_of_calibration as RH41CountFamilyPruned
#print axioms family_of_global_statements
#print axioms rankTail_split41
#print axioms aggregate_of_two_calibrations41
#print axioms rh41_family_of_calibration
end Formalism.MainNotions.StandardLattice
