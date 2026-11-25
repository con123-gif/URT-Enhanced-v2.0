import Formalism.HermitianLattices.HermitianLatticesProofs.MassBasic
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# Editor RUN11: rational genus bridge, not just completed-local isometry
2026-11-25 13:56 UTC. Pin 40e56bab026552e089d7afcfeff08d2defb9c005.
Mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc. Upstream head observed
d91ae2678eea19a0c3045ffca37f1da757c2e719; do not mix.
Status HUMAN SOURCE-MATCHED / Lean certificate PREPARED, not compiled.

The actual genus predicate in StatementLat.lean is stronger in its wording
than merely having local unitary isometries: for EACH maximal ideal p it
requires a rational isometry g with gmap g (loc p L) = loc p M.
The witness may depend on p. This is the quantifier that permits weak
approximation, without strong approximation or any global lattice isometry.

## Mathematical proof (ordinary number field setting)
Let E/F be a CM quadratic extension unramified at finite places, with its
usual conjugation; V a finite-dimensional nondegenerate Hermitian space.
Let L,M be full self-dual O_E lattices in V. Fix a finite place v of F.

1. Self-duality survives completion: finite projective modules commute
with dual and flat base change. At a nonsplit v the integral Hermitian
pairing is perfect over the unramified quadratic local extension.
In its nondegenerate residue form some vector has nonzero norm: otherwise
the expansion of h(x+a*y,x+a*y) would force Tr(a*h(x,y))=0 for every
residue a, contradicting the perfect residue trace pairing whenever
h(x,y)!=0. This works also at residue characteristic 2. Lift the vector.
The unit norm map is onto: the finite residue norm is onto and
N(1+pi^j*a)=1+pi^j*Tr(a) mod pi^(j+1), j>=1; lift successively using
surjective residue trace and completeness. Normalize the lifted vector
to norm one, split it off orthogonally by the integral projection, and
induct. Both completed lattices admit orthonormal bases.
At a split v the involution exchanges the two factors. A self-dual
lattice is a pair of lattices perfectly paired with each other; a basis
on one side and its dual on the other identify it with the standard
pair. Thus at either place there is u in U(V)(F_v) carrying L_v to M_v.

2. The coset of such u is open: the stabilizer of a full completed
lattice contains an identity neighbourhood, by integrality of matrices
and inverses in a lattice basis (use both factors at split places).
To hit the Cayley chart, multiply u by a central norm-one scalar z
arbitrarily close to 1. Choose a nonzero c in E with bar(c)=-c, and
z=(1+t*c)/(1-t*c) for sufficiently small t in F_v. Each component
of this rational scalar function is nonconstant; det(1+z*u) has only
finitely many excluded t in each field component, including at a
split place. Choose t outside their union and within the open coset.
Then X=(1-z*u)(1+z*u)^(-1) satisfies X*=-X and 1+X is invertible.
The skew-adjoint space is an F-vector space, and its defining linear
equations commute with extension to F_v. Approximate X by rational
skew-adjoint X_i (F is dense in F_v). On the open invertible locus
g_i=(1-X_i)(1+X_i)^(-1) is a rational unitary isometry and converges
to z*u. For sufficiently close g_i, g_i(L_v)=M_v. No approximation
simultaneously at infinitely many primes is needed.

3. For p over v, hcompl(p) is the multiplicative set of elements
avoiding both p and conjugate(p), since conjugation preserves O_E and
these are prime ideals. There are no other primes over v in the
quadratic unramified case. For x in V(E), I_x={a in O_E : a*x in L}
is a nonzero ideal by fullness. Native membership x in loc p L is
equivalent to I_x meeting that multiplicative set. By finite prime
avoidance this is equivalent to I_x not being contained in either
prime, hence to x belonging to both corresponding localizations.
Membership in each localization is equivalent to membership in its
completed lattice for rational x: tensor the finite module
(L+O_E*x)/L with the local DVR and its faithfully flat completion.
Therefore loc p L is precisely the rational intersection with L_v.
The rational g_i just constructed commutes with this intersection,
giving gmap g_i (loc p L)=loc p M. Thus SameGenus holds in the actual
semilocal/rational sense of StatementLat, not a substituted definition.

4. Native genusBasic gives the equivalence relation. Equal genera give
the same IsClassReps predicate, since the global isometry relation
and automorphism weights depend on h, not the reference lattice.
The native massBasic sum formula then yields mass h L = mass h M
using the SAME finite representative set, with no estimate or norm.

Application to arbitrary positive definite W: if LandherrSig gives
a rational Hermitian isometry W -> stdPos(D,W.rank), transport the
self-dual lattice along it. Steps 1-4 identify its mass with the
standard lattice mass. A rational Hermitian isometry transports
genus representatives bijectively (commutes with scalar saturation)
and conjugates stabilizers bijectively, preserving each Nat.card.
Use the already isolated standard-model equality (8825cbd3).
Thus the human argument supplies the general GenusMassStd from
ordinary local classification, weak approximation and LandherrSig,
rather than assuming general genus normalization. Rank zero is
trivial (one zero lattice and trivial automorphism group).
Native encoding of finite projective completion, the CM/unramified
dictionary, Cayley density and cross-space transport still require
formal proof. Do not report them as Lean-closed. The selected-standard
shortcut for the count branch remains preferable; this is for the
surviving broad genus consumer in stmtF_of_named and related packets.

## Original / reduced graph (source-visible, not full kernel reachability)
Original: stmtF_of_named -> theorem_two_of_landherr /
volume_mass_of_class_items -> GenusMassStd (hypothesis).
Candidate: actual CM/self-dual/definite data + LandherrSig ->
local classification -> rational Cayley approximation -> native
SameGenus -> genus equality -> mass equality -> cross-space
transport + standard model equality -> GenusMassStd.
Retain original graph and all typed/value/constructor/axiom edges;
no global deletions until caller replay. Cache key:
(pin, E/F, involution, h, L, M, p, same host, rank).
No dependence on RH, URT, strong approximation, or uniformity in p.
No numerical surrogate. Source identities checked: 20 exact
blob/anchor assertions executed via connector; local lean/lake absent.
Previous CI 45577239749 and 45576756833 status.json fetched and PASS,
not evidence for this declaration. New native certificate below
checks the exact last same-space implication; upstream local bridge
is proved here in ordinary mathematics, not encoded as an axiom.
Sources (pin above):
src/Formalism/HermitianLattices/StatementLat.lean 4f84ca3c8738dca6ffab6b32fdf4ee309fed05c4
src/Formalism/ThetaLiftIndependence/Statement.lean 0cbe89264b4f4920f2c0d4beab1af5bc3a915547
src/Formalism/HermitianLattices/StatementMass.lean 33a3ea93298eff7969409462ddfc1ed22f173939
src/Formalism/HermitianLattices/HermitianLatticesProofs/MassBasic.lean 38dda8020322a6f4c137e228a9dc1f643675b8d9
src/Formalism/HermitianLattices/HermitianLatticesProofs/GenusBasic.lean 6ba0671adae4dd169fb117a8592f518272dfb868
GL5/Statement.lean 0c920a7767d85d1fd82dc30d6f7d01bc2e8382c7
GL5/PacketStatementOfGenusClasses.lean 3cecaa7a50a0e58c9165870c12748a36439edbcd
GL5/PNamed.lean fcfd96e6e8385ec5e1de13f41d5706803d565c5d.
Peers: 56f510005c25 terminal rank-k frame, 8825cbd3 standard
mass identity, 95545ee1 conventional signature independence.
RESUME HERE: replay last two lemmas and audit exact native CM /
completion and cross-space transport; locate existing HermRepUnram
or equivalent theorem before introducing new formal infrastructure.
Preserve LandherrSig and all independent class/volume/degree suppliers.
HANDOFF: geometry, integration, kernel and formal audit. RH OPEN.
-/

open NumberField
noncomputable section
namespace Formalism.HermitianLatticesTheory

variable {K V : Type} [Field K] [NumberField K] [StarRing K]
  [AddCommGroup V] [Module K V] [FiniteDimensional K V]
  [Module (RingOfIntegers K) V] [IsScalarTower (RingOfIntegers K) K V]

theorem rh_editor_genus_eq
    (h : V →ₗ⋆[K] V →ₗ[K] K) (L M : Submodule (RingOfIntegers K) V)
    (he : Equivalence (SameGenus (R := RingOfIntegers K) h))
    (hLM : SameGenus h L M) : genus h L = genus h M := by
  ext N
  change (Submodule.IsLattice K N ∧ SameGenus h L N) ↔
    (Submodule.IsLattice K N ∧ SameGenus h M N)
  exact ⟨fun a => ⟨a.1, he.trans (he.symm hLM) a.2⟩,
    fun a => ⟨a.1, he.trans hLM a.2⟩⟩

theorem rh_editor_mass_of_genus_eq
    (h : V →ₗ⋆[K] V →ₗ[K] K) (L M : Submodule (RingOfIntegers K) V)
    (hh : h.IsSymm) (hp : ∀ x : V, x ≠ 0 → 0 < Algebra.trace ℚ K (h x x))
    (hL : Submodule.IsLattice K L) (hM : Submodule.IsLattice K M)
    (hg : genus h L = genus h M) : mass h L = mass h M := by
  obtain ⟨⟨s, hs⟩, hsum, _⟩ := massBasic K V h hh hp L hL
  have hsM : Formalism.ThetaLiftIndependence.IsClassReps h M s := by
    simpa only [Formalism.ThetaLiftIndependence.IsClassReps, ← hg] using hs
  exact (hsum s hs).trans ((massBasic K V h hh hp M hM).2.1 s hsM).symm

theorem rh_editor_mass_of_same_genus
    (h : V →ₗ⋆[K] V →ₗ[K] K) (L M : Submodule (RingOfIntegers K) V)
    (hh : h.IsSymm) (hp : ∀ x : V, x ≠ 0 → 0 < Algebra.trace ℚ K (h x x))
    (hL : Submodule.IsLattice K L) (hM : Submodule.IsLattice K M)
    (he : Equivalence (SameGenus (R := RingOfIntegers K) h))
    (hLM : SameGenus h L M) : mass h L = mass h M := by
  first
  | rh_reduce 4 using [rh_editor_mass_of_genus_eq, rh_editor_genus_eq]
  | exact rh_editor_mass_of_genus_eq h L M hh hp hL hM
      (rh_editor_genus_eq h L M he hLM)

rh_scan rh_editor_mass_of_same_genus limit 2000
rh_prune rh_editor_mass_of_same_genus as RHEditorMassSameGenusPruned
#print axioms rh_editor_genus_eq
#print axioms rh_editor_mass_of_genus_eq
#print axioms rh_editor_mass_of_same_genus

end Formalism.HermitianLatticesTheory
