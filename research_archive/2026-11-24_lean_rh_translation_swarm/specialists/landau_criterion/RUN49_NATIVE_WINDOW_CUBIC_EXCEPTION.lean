import Development.AutomorphicArithmetic.PrimitiveCosets.WindowInequalityOfArtinInputs
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.WindowHypOfRpow
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
RUN49 lane 4 — 26 Nov 2026. HUMAN CONDITIONAL ANALYTIC TRANSFER /
LEAN ADAPTER PREPARED, NOT COMPILED. RH OPEN.

Current mission fb152e2897b4c1c320c43b9f42ae0ec088a7da45 (26 Nov sprint,
exceptional-scale bridge priority; mandatory reduction engine). Reviewed
AGENTS, SWARM, HANDOFF, EXPANSION, continuity/state/log/runner excerpts,
RUN48, integration 3aadcd5e755ce1d96ddb0143924f02775c5704a0,
math c4320d6f8bdc9d90ef211d8727b8087a676fba48, integration 5b32b94b
and 394fdbf6, kernel 03b9179d, prime RUN51 ff4ef431eeae74c55b87bad655a0f6ad02b88866.
No duplicate of their pointwise interpolation or page anchoring.

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; latest observed
e4098b46b46c934574c0abba2d107d1fd9c8bfcf not adopted. Lean 4.33.1,
Mathlib 0df444a360eaa60ab8c11dca51a86af692955474.
Directly retrieved native blobs:
DedekindLFunctions/CharFamily.lean 81c8dfd66d910d083d5bc88c664c7917fdbdfe96
  (G, Gm, actual WindowHyp integral).
DedekindLFunctions/LandauTheorems/WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9
  (windowHyp_of_rpow_eventually, windowHyp_of_rpow).
PrimitiveCosets/CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d;
PrimitiveCosets/WindowInequalityOfArtinInputs.lean c349e34925ac26b8bc76bd36e9b91562f86d6b8d;
Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean
  a6ac464a67f99a546566ee3a3e0fd1db1f4c2550.
CharacterBoxes/ExistsPageN.lean 398eb8ed3528aa2666e9d3b2b09a582ad4390dd7,
WinPairs.lean 4670fec488d1eb59a3cc52dffc8d0eab16e16b0b,
TwistForm.lean 5e8b1a992a393336dffd3603524526dfccfa1981,
FieldChi.lean f3e2032b133ff64406a87e27438cdf467aa05a1f,
OrdAny.lean d83838c691b46df790ddad8daf5eb3e3ef5bb35a,
ShortNorms/supplyOfAdmOf.lean 04ca5068e90544580c7684a316ec79c49d3572fc.

RESULT: use the existing native WindowHyp integral DIRECTLY; do not
require a pointwise RH-scale bound at failed scales. For principal G,
fix 1/2<theta<1, C>=0, X>=1. Suppose on [X/2,3X] a measurable cover E
of actual tied-family failures has length B<X/2. All good scales have
the same fixed Fm, constants, eventual threshold; hE and hT give
core_gm with exponent <=theta (choose eps using TopWin.exists_small_eps).
Each good x has its own i as the native source allows.
Let f=G-C*x^theta. The previous integration peer proved convexity of
f(x)+x^2/X: finite nonnegative von Mangoldt ramps are convex,
(-x log x+x^2/X)''>=0, -C*x^theta convex. G is continuous, since the
finite sum can use one common upper cutoff on the padded interval.

For any component (a,b) of {f>0} meeting [X,2X], the endpoints are
interior: a component reaching a padded boundary would have length
>=X/2, contrary to B<X/2. f(a)=f(b)=0. The exact chord gives
f(x) <= (x-a)(b-x)/X on this component. Crucially integrate rather
than maximize:
  integral_a^b (x-a)(b-x)/X dx = (b-a)^3/(6X).
The open components are countable disjoint intervals; their total
length is <=B. Integrating only over [X,2X], using x^(-theta-1)<=
X^(-theta-1) there, and summing nonnegative terms, gives
  integral_[X,2X] max(f,0) * x^(-theta-1) dx
    <= sum_components (b-a)^3/(6 X^(theta+2))
    <= B^3/(6 X^(theta+2)).
The last step follows from sum l_i^3 <= (sum l_i)^3, by monotone
limits of finite nonnegative sums. No measurable choice of host/index
needed, only measurable cover of failed existence. Actual native
consumer uses R=max(G,0), continuous on the compact positive window,
and R<= C*x^theta+max(f,0). Therefore
  integral_[X,2X] R*x^(-theta-1) <= C log 2 + B^3/(6 X^(theta+2)).

In particular uniform B<=K X^((theta+2)/3) is sufficient. The guard
B<X/2 holds eventually since theta<1. This is a larger permitted
exceptional-scale measure than the pointwise transfer threshold
X^((1+theta)/2); exponent difference (1-theta)/6>0. At theta near 1/2
it is 5/6 rather than 3/4. At theta=1/2+eps it is 5/6+eps/3.
Alternatively use the sum of cubed actual bad components, retaining
B<X/2 to ensure endpoints. No use of signed mean in place of positive
excess, and no new external RH criterion.

PADDING / QUANTIFIERS: suppose the SAME chosen family supplies padded
block covers inside arbitrarily distant [W,W^(1+d)], fixed d>0, with
uniform C,K,theta. Set Y=2W and d'=d/2. For W sufficiently large,
3*Y^(1+d')<=W^(1+d). For dyadic X=2^j Y up to the last X<=Y^(1+d'),
all [X/2,3X] lie in original window. Sum the above positive integral
bounds over at most 1+d' log(Y)/log(2) blocks, truncating the last
block. Thus integral <= K' log Y for one uniform K'>=0 once Y>=2.
For every eta>0 this is <=Y^eta eventually, using the EXACT native
windowHyp_of_rpow_eventually. The Lean adapter below feeds this budget
to the existing WindowHyp, not a new standalone RH statement. Use the
previous singleton identification Gm=G (RUN36/compiled conditional
root evidence preserved); then the same Landau endpoint and half-strip
root, with theta chosen below the prospective zero's real part.
No upstream claimed theorem imported or used.

SOURCE AUDIT / REMAINING SUPPLIER: windowInequality_of_artinInputs
uses hE at the SAME i chosen by FamCoreConstantBounds from hT. Its
source has no estimate for a failed scale's measure, and EFamC,
ChebyshevInequalityOnFamilyWindows and Windows are quantified predicates,
not independent probability laws. The original universal version, if
proved, supplies E empty; an averaged local kappa or prime-terminal L2
does NOT by itself bound B. Prime RUN51 provides conditional page
prefix covers for the VAt401 supplier only. Its prefixes now need
O(X^((theta+2)/3)) (rather than the stronger pointwise budget) after
rescaling, AND other native failure sets need their joint cover.
Do not treat this as a proof of any prefix estimate. An apparent
right-anchor shortcut using fixed c>=2 is unavailable without proof:
ordAny gives c<=Nat.card(zpowers psi.chi), which is 1 for the
principal singleton; fieldChi obtains c from ordAny. In the native
principal case k=c^(1/(2+8 eps))=1, and VAt at a later anchor gives
the larger exponential budget, not the smaller earlier one. Preserve
the actual e,q,d,E, exponent and same-family window.

Selected original graph:
level_of_tiedWin -> windowInequality_of_artinInputs -> core_gm
  with hE,hT at all scales -> FormB / principal Landau path.
Existing exceptional path: cover B -> pointwise chord -> rpow adapter.
Candidate: same native good-scale suppliers -> cover B (OPEN) ->
integrated chord (human derivation above) -> native WindowHyp log
adapter (prepared below) -> existing singleton Landau conditional root.
Keep original graphs, all native arithmetic/geometric guards, old
stronger interfaces, and earlier axiom ledgers. This is a local
consumer replacement, not closure of the measure supplier.
Cache key: pin, principal character, Fm, constants, theta, W,d,
dyadic X and actual cover. Backtrack to original pointwise route
if a valid cover is not obtained. No URT speed comparison asserted.

Execution: local lean/lake absent. Retrieved actual published
baseline statuses: strip root 45577239749 returncode 0, 98.87s,
prune 45576756833 returncode 0, 77.94s (historical only).
Current shared replay status blob 22989ce418dbfe8731db225af351ca57592ead73
reports returncode 1, 133.27s, unhandled Unicode import
GaloisCohomology₂.PoitouTateNineTermTransgressionZeroApply.
Do not report new PASS or launch duplicate shared runner; kernel
lane owns parser repair. No new axiom evidence or numerical suite.
No unconditional root-reachable leaves discharged; no caller
substitutions kernel checked. Actual cover and integrated-chord
formalization still OPEN, as are previous arithmetic leaves.
RESUME HERE: obtain actual same-family failure cover in native
WinDatum/ChainTied construction; use page-prefix lengths plus the
other simultaneous failure sets. Replay this log-budget adapter in
the shared native batch after parser repair, then verify measure
integration and original caller substitution. Do not rederive the
already compiled half-strip root. HANDOFF TO prime, math, integration,
kernel and audit. RH OPEN.
-/

open MeasureTheory Set
noncomputable section
namespace RHLandau49

-- Exact integrated polynomial coefficient (antiderivative in t=x-a).
theorem chord_area_algebra49 (l : ℝ) :
    l * l^2 / 2 - l^3 / 3 = l^3 / 6 := by ring

-- Native actual consumer: a logarithmic weighted integral is enough,
-- regardless of whether a pointwise power bound is supplied.
theorem windowHyp_of_log_budget49 (F : Deduction.CharFamily)
    {theta delta K : ℝ} (hK : 0 ≤ K)
    (h : ∀ Y0 : ℝ, ∃ Y : ℝ, Y0 ≤ Y ∧ ∃ R : ℝ → ℝ,
      IntegrableOn (fun y => R y * y ^ (-theta - 1)) (Icc Y (Y ^ (1 + delta))) ∧
      (∀ y ∈ Icc Y (Y ^ (1 + delta)), 0 ≤ R y ∧ Deduction.Gm F y ≤ R y) ∧
      ∫ y in Icc Y (Y ^ (1 + delta)), R y * y ^ (-theta - 1) ≤ K * Real.log Y) :
    Deduction.WindowHyp F theta delta := by
  intro eta heta Y0
  obtain ⟨Y1, hY1⟩ := Deduction.windowHyp_of_rpow_eventually K eta hK heta
  obtain ⟨Y, hY, R, hI, hR, hB⟩ := h (max Y0 Y1)
  have h1 : Y1 ≤ Y := (le_max_right _ _).trans hY
  refine ⟨Y, (le_max_left _ _).trans hY, R, hI, hR, ?_⟩
  first
  | (rh_reduce 2 using [le_trans]; done)
  | (rh_auto_frontier 2; done)
  | (rh_auto 2; done)
  | exact hB.trans (hY1 Y h1).2

end RHLandau49

rh_scan Deduction.windowHyp_of_rpow limit 2000
rh_scan UpperTheory.Comparison₂.windowInequality_of_artinInputs limit 2000
rh_scan RHLandau49.windowHyp_of_log_budget49 limit 2000
rh_prune RHLandau49.windowHyp_of_log_budget49 as RHWindowLogBudget49Pruned
#print axioms RHLandau49.windowHyp_of_log_budget49
#print axioms RHLandau49.chord_area_algebra49
end
