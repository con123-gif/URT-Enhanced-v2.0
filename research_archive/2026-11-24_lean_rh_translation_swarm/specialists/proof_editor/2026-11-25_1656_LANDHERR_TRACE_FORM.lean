import Formalism.LocalToGlobal.GlobalTheory.GL5.PNamed
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
Editor lane 15, 25 Nov 2026, 1656. HUMAN DERIVATION / NATIVE ADAPTER PREPARED.
Actual native LandherrSig supplier via Hasse–Minkowski and elementary Hermitian
cancellation. This is an independent route to a classical geometric premise,
not a new RH criterion. Pin 40e56bab026552e089d7afcfeff08d2defb9c005; Mathlib 0df444a360eaa60ab8c11dca51a86af692955474;
Lean 4.33.1. Observed upstream head 91b273530883b723ef4422436e0dc3557749325a;
not substituted. Mission blob cd0a176134d46b5b624896e56843a24915c14477.

Ordinary mathematical proof (to be audited):
Let E/F be the native CM quadratic extension and W1,W2 be the two native
HSpace objects of common rank, with equal signatures at every embedding.
Each has a full self-dual lattice L0 (not necessarily globally free).
The native IsCMUnram condition excludes nontrivial inertia at every finite
prime: in a ramified quadratic local extension the involution is identity
on residue classes, contradicting the witness theta-star(theta) outside P.
The fixed-field condition and degree two identify the given F and involution.

At a finite place v of F, completion of each lattice is self-dual: the
dual is identified, using the nondegenerate pairing, with the conjugate
module dual Hom_OE(L,O_E); finite projectivity of the full lattice over
the Dedekind domain makes Hom commute with scalar extension. At a split
place the two local factors pair perfectly with each other and admit dual
bases, giving the unique standard split Hermitian space.

At a nonsplit finite place the extension of complete DVRs is unramified
quadratic. The reduction of the lattice pairing is nondegenerate
Hermitian over the quadratic residue-field extension. Some vector has
nonzero norm: otherwise for all x,y,c the polarization of x+c y would
give Tr(c h(x,y))=0, contradicting nondegeneracy of the separable residue
trace pairing. This also works at residue characteristic 2. Lift such
a vector to unit norm up to a unit factor; its orthogonal complement
splits integrally by division by that unit, remains unimodular, and
iteration gives an orthogonal basis with unit diagonal. Every base unit
is a norm: first use surjectivity of the finite-field norm, then at
each stage j>=1 use N(1+pi^j a)=1+pi^j Tr(a) mod pi^(j+1) with
surjective residue trace; completeness yields the desired norm. Rescale
the basis to diagonal 1. Thus BOTH native completed spaces are locally
isometric at every finite place. At each real place equal complex
Hermitian signatures give local isometry. Every real place extends to
a complex embedding of E.

Define q_i(x)=h_i(x,x), valued in F. This is a nonsingular F-quadratic
form: its polar pairing is Tr_E/F h_i(x,y), nondegenerate by the trace
pairing and E-linearity in y. Consequently q_1 and q_2 are isometric at
all completions. Invoke the standard Hasse–Minkowski local-global
isometry theorem for nonsingular quadratic forms over number fields.

To recover an E-linear isometry, induct on rank. Rank zero is trivial.
Choose a nonisotropic vector x in W1 (exists by polarization in
characteristic zero), set a=h1(x,x) in F^*. The F-quadratic isometry
provides y in W2 with h2(y,y)=a. Both E-lines Ex and Ey carry exactly
the same quadratic norm form a*N_E/F. Split each off orthogonally
in the Hermitian spaces. Witt cancellation for nonsingular F-quadratic
forms cancels those identical norm forms, leaving isometric quadratic
forms on the Hermitian orthogonal complements. Induct and adjoin the
E-linear isometry cx -> cy. This proves the required Hermitian
isometry, without assuming that an arbitrary F-quadratic isometry is
E-linear. The distinction matters.

Hence the human LandherrSig statement follows from the native CM and
lattice hypotheses, standard Hasse–Minkowski, Witt cancellation, and
the explicit local proof above. Native PNamed.unitSplit_of_landherr
then gives the exact unit splitting used by volRatioTrue_of_named;
no new volume premise is assumed or discharged here. Also supplies
the rational isometry input to the older genus bridge, not its
local coset witnesses. Native formalization still needs localization/
completion dual transport, identification of residue involution and
the quadratic form/local-global/cancellation API. This is not a claim
that those external classical theorems are in the current Mathlib.

Compact insertion for living proof (human, pending independent audit):
"In equal rank and signature the self-dual lattices become standard
at every finite unramified place (orthogonal splitting with unit norm
and local norm surjectivity), and the real forms are isometric. Apply
Hasse–Minkowski to h(x,x); cancelling a common Hermitian line as the
quadratic form a N_E/F and inducting gives the rational Hermitian
isometry. The native unit-split construction then chooses a signed
coordinate vector and its orthogonal complement."
Sources: Hasse–Minkowski theorem (local-global isometry over number
fields), https://en.wikipedia.org/wiki/Hasse%E2%80%93Minkowski_theorem ;
Witt cancellation, https://en.wikipedia.org/wiki/Witt%27s_theorem .
These are standard theorems, not claimed new results; literature
inspection was explanatory, not an independent proof of those theorems.

Original source-visible graph: volRatioTrue_of_named -> unitSplit_of_landherr
-> LandherrSig, also volRatioTrue_of_indep -> VolSigIndep/VolTie/ClassItemsAt.
Candidate human graph: LandherrSig <- CMData + HSpace self-duality +
local integral splitting + Hasse–Minkowski + Witt cancellation.
Original remains retained pending exact caller/axiom checks. Context key:
(pin, toolchain, D, F, E, involution, W1,W2, rank, all signatures, lattices).
Do not conflate this with VolSigIndep (which compares DIFFERENT signatures).
No new complete elaborated graph, no new axiom evidence. No URT comparison.
Peer checkpoints read: 841814dc rank scalar, 1a1774df CM indexing,
12705f087 batch replay (PREPARED), 620547cb K-theory qualitative
finiteness, 2d051914 cohomology division. Previous editor recovery
2026-11-25_1556_ADELIC_TOPOLOGY_QUOTIENT_AUDIT.lean remains local artifact.

Pinned source blobs and actual executed static checks (19):
src/Formalism/LocalRingCardinality/DataSpaces.lean f1d2da346f8996c2527724b50fd6409dc8ab937b
src/Formalism/HermitianLattices/StatementLat.lean 4f84ca3c8738dca6ffab6b32fdf4ee309fed05c4
src/Formalism/HermitianLattices/StatementMass.lean 33a3ea93298eff7969409462ddfc1ed22f173939
src/Formalism/LocalToGlobal/GlobalTheory/GL5/PNamed.lean fcfd96e6e8385ec5e1de13f41d5706803d565c5d
Baseline CI status JSON retrieved, both status pass returncode 0:
45577239749, 45576756833 (older engine certificates only). No local
Lean/Lake on PATH; this adapter not compiled, no candidate CI pass.
Peer batch still PREPARED; do not claim queued or retire native premise.
No numerical surrogates. Root-reachable obligations retired: 0 at kernel
level. One classical supplier reconstructed at human level with stated
dictionary obligations. All VWinAt(1,401), entropy, rank/count/local-gain,
measure normalization and other remaining premises retained.

RESUME HERE: formal audit checks the local dual-base change and
dyadic unit norm argument, then kernel lane adds this consumer adapter
to the existing exact-pin batch. Geometry/editor return to the
rank-only Haar density normalization (not a second genus proof).
HANDOFF TO integration, geometry, literature, kernel, formal audit.
RH OPEN.
-/

noncomputable section
namespace RHEditorLandherr
open Formalism.BasicNotions Formalism.MainNotions.StandardLattice
open Formalism.MainNotions.GlobalTheoryTheory.GenusMassVolumes
open Formalism.L2.GlobalTheoryTheory.GenusMassVolumes
attribute [local instance] Formalism.BasicNotions.Host.cmStar

theorem native_unit_split_consumer (D : D7) (hL : LandherrSig D) :
    UnitSplit D := by
  first
  | (rh_reduce 2 using [unitSplit_of_landherr]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact unitSplit_of_landherr D hL

rh_scan unitSplit_of_landherr limit 2000
rh_scan native_unit_split_consumer limit 2000
rh_prune native_unit_split_consumer as RHEditorLandherrUnitPruned
#print axioms native_unit_split_consumer
end RHEditorLandherr
