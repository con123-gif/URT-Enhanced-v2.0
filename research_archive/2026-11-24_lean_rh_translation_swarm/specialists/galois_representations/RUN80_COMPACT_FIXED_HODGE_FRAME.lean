import Lib.PadicHodge.WachKisin.CrystallinePeriodMatrix
import Mathlib.Tactic

/-!
RUN80 — C1: finite fixed Hodge frame and jump identification, 27 Nov 2026.
Human source-matched derivation, retained Ax–Sen–Tate/Tate and primitive
period-ring inputs; executable helper prepared, NOT native replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Read current mission/spine/ledger, lane protocols, AGENTS and RUN76–79;
peer head 85fca362 (B2/C2 joint replay), no overlapping C1 supplier.
Old pin 40e56bab026552e089d7afcfeff08d2defb9c005 not mixed.

Exact sources relative to grh-compact/src:
 Lib/PadicHodge/WachKisin/HodgeFrame.lean 158f4df424f222f593b6f2baee57a294ab221f03
   exists_hodge_frame, isHodgeTateFrame_of_hodgeMatrix,
   hodgeTateMaps.mem_span_same_weight, hasJumps_of_basis.
 Lib/PadicHodge/TateSen/NearOne.lean
   le_of_hodgeTate_stable, tate_eq_zero_of_chi_twist,
   exists_algebraic_of_fixed_near_one, nhds_one_le_map_nearOne.
 Lib/PadicHodge/TateSen/DeRhamFiltration.lean dc4c23217762fe5c0da0a7c70a3d3f7bf297c84b
   smul_tUnit_zpow, prime_tPeriod, hodgeFil, theta kernel.
 Lib/PadicHodge/Crystalline/HodgeTateFrame.lean ffab1bcc712cd7698ce7202db1c60293018e5d08
   inv_mul_apply_of_isHodgeTateFrame, hasJumps_of_rows.
 Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean cf83fda104fb44177d374d62f06b4d6e68e3db08
   IsChartOf.exists_isPeriodMatrix, local J and T, F=top.

1. Replace general echelon elimination by one minimal-support witness
at the actual F=top caller. Let D=BdRPlus, L=BdR, t its uniformizer,
C=C_p its residue field. Retain the native embeddings of Qpbar in L
and C, t Galois transformation, DVR and theta reduction, open image
j(Gamma), Ax–Sen–Tate and Tate nonzero-twist vanishing. Suppose
N(g) g(U)=U for all g, U invertible over L, N(g) algebraic.
Clear a common finite pole order m>=0 for the entries of U to start
with W=t^m U integral, Y=I, all k_i=-m, so
    U Y = W diag(t^k_i),  det(W) != 0.
Keep Y in SL_d(O_Qpbar) fixed by ALL g. No prescribed m needed.

Write P=theta(W), and suppose det(W) is not a unit, so ker(P)
is nonzero over C. Invariance of UY implies
    Nbar(g) g(P) diag(chi(g)^k_i)=P.
Consequently K=ker(P) is stable under the twisted semilinear
operator a_i -> chi(g)^(-k_i) g(a_i). Choose a nonzero a in K
of minimal support; choose j in that support maximizing |a_j|_p.
Normalize a_j=1, hence |a_i|_p<=1. Every vector in K supported
within this support is proportional to a: subtract its j-th
coordinate times a, and a nonzero result would have strictly
smaller support. For EVERY g, normalize the twisted transform
by multiplying by chi(g)^k_j. It has the same support and
j-th coordinate 1, so equals a:
    chi(g)^(k_j-k_i) g(a_i)=a_i.
Tate vanishing gives a_i=0 for k_i != k_j, because the equality
holds in particular near one in the open image. For equal
weights, a_i is fixed by all g and Ax–Sen–Tate makes it algebraic,
in the actual fixed field. Thus the a_i lift uniquely into
Qpbar and are fixed by ALL g there by injectivity/equivariance.
Their p-adic integrality follows from the normalization.
This is the special W'=0 use of le_of_hodgeTate_stable, not
a claimed replacement of its arbitrary-subspace statement.
It uses finite support and one minimal-support choice, not
construction of an entire echelon basis. No claim of lower
native theorem count until caller replacement checked.

2. One exact column identity decreases the valuation.
Let C_j be identity with column j replaced by a (now algebraic).
Its determinant is a_j=1, and all its entries are integral
and fixed. Since a is supported on the same weight as j,
C_j commutes with diag(t^k_i). In D, W a is divisible by t
coordinatewise since P a=0. Put W'=W C_j with column j divided
by t, k'=k+e_j, Y'=Y C_j. Then
    U Y'=W' diag(t^k'_i),  det W=t det W'.
Both identities are exact BEFORE estimating. The new Y' is
integral SL and fixed for all g. W' is integral, determinant
nonzero, and its nonnegative integer t-valuation falls by one.
After at most the initial ord_t det W steps, W is a unit matrix.
This proves the required F=top specialization of exists_hodge_frame
by finite descent, including rank zero (empty determinant 1).
No dependence of the final jump bounds on this initial valuation;
the latter may depend on the individual input matrix. The source
uses a divisibility-minimal determinant rather than a loop;
both need precisely the same strict descent. The stronger arbitrary
filter theorem is not discarded from the original dependency graph.

3. Verify the jump signs and uniform interval at the actual caller.
At termination P is invertible. Inverting the frame identity gives
    P^-1 Nbar(g)=diag(chi(g)^(-k_i)) g(P^-1).
The rows q_i of P^-1 are a C_p-basis of the semilinear forms on
the native representation's chosen basis e, with the weight
convention k_i of hodgeTateMaps. Span extension from e to T uses
the native algebraic scalar fixedness near one. For any form f
of weight u write f=sum_i c_i q_i. Compare its covariance with
the covariance of the q_i on the finite basis e, intersecting
the finitely many near-one eventual conditions. Since rho(g)
is invertible and q_i independent, obtain
    chi(g)^(u-k_i) c_i = g(c_i).
Thus coefficients with k_i != u vanish by Tate, and remaining
coefficients are algebraic by Ax–Sen–Tate. Conversely the
algebraic combinations of equal-weight rows have weight u near
one, since each algebraic coefficient is fixed near one.
The equal-weight rows remain independent over Qpbar. Therefore
    jump(rho,gamma,u)=#{i:k_i=u}.
In particular every k_i occurring in the frame has nonzero jump.
This is exactly hasJumps_of_rows via hasJumps_of_basis; sign
check: if rho(g)=chi(g)^c then k=-c, not +c.

At CrystallinePeriodMatrix apply the construction to each
N_n=phi^n(M) for the SAME invariant crystalline M of RUN77–79,
not a separately chosen crystalline representation. Frobenius
commutes with the Galois action and representation coefficients
are Z_p scalars; hence every N_n satisfies the same invariance
and has the SAME jump function. The actual hab premise gives
-a<=k_ni<=b, uniformly in n. Since Y_n^-1 and Y_n are algebraic
(in D), and W_n and inverse are over D, multiplication gives
    N_n in t^(-a) Mat_d(D),  N_n^-1 in t^(-b) Mat_d(D).
The latter uses -k_ni>=-b. RUN79 applies the all-forward
pole saturation to M and its actual inverse, producing U and
Z in BPlus. RUN77 needs the all-g fixed Y_0 for its coefficient
divisor transport; the present F=top proof supplies exactly
this, not merely near-one fixedness. RUN76 then consumes the
same matrix for the integral basis contraction. No extra
crystalline or RH assumption introduced.

4. Scope and verification.
Local source edges: Tate and Ax–Sen–Tate + residue/valuation ->
minimal support twisted kernel -> column descent ->
exists_hodge_frame at top -> hasJumps_of_rows -> local J,T ->
RUN79 X -> exists_isPeriodMatrix -> RUN76/75.
Candidate reduction bypasses the general echelon-elimination
proof body at this specialized use; the native original and
global graphs/axioms remain unchanged. Other callers can still
require the general theorem. Context key includes compact pin,
actual M, representation, e, all-g fixedness, twist convention,
D, t, residue field, fixed jump interval, n. No URT speed claim.
The chart construction, primitive period rings, Ax–Sen–Tate,
Tate vanishing, the crystalline invariant basis, and downstream
integral contraction/fit witnesses remain open to native replay
or primitive audit. This is not C1 closure or the star inequality.

Executed locally Python/SymPy exact matrices over Q(t):
 W=[[1,1,0],[0,t^2,0],[0,0,1]], a=(-1,1,0), j=1 (zero-based).
 C=I with col1=a, det C=1.
 For k=(0,0,0),(-3,-3,2),(5,5,-2), set k'=k+e1,
 W'=W*C with col1 divided by t:
 W*diag(t^k)*C == W'*diag(t^k'), det W=t*det W'.
 All three checks passed (W assigned W' between checks; second
 and third test algebraic identity, not a claim of integral descent
 at every such artificial step). Negative control W=[[1,1],[0,t]],
 a=(-1,1), weights (0,1): identity fails with the same recipe.
 These are exact algebra regression checks only, not native
 period-ring evaluation. lean/lake absent on local PATH. No native
 rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier or CI replay
 of this replacement. Current live ledger reports B2 caller checks
 and count helper separately passed, graph failure; no C1 receipt.
 No protected workflow changed, no upstream theorem imported as RH.

RESUME HERE: inspect the actual chart/adic approximation supplier
at RUN76 section 3, specifically
Lib/PadicHodge/WachKisin/ChartScalars.lean
eventually_approx_sum_extendedCoord, and audit exact finite
simultaneous approximation and pullback to (p,xi)^m for the
S-linear extension. Coordinate C1 native replay of RUN75–80
with integration, preserving all source statements and axiom evidence.
HANDOFF TO: Galois, integration/editor, independent audit, kernel.
-/

namespace RHGaloisRun80

/-- Exact elimination used to show that two supported kernel vectors
    with the same normalized coordinate differ by a smaller-support
    vector. Actual kernel membership is the caller's premise. -/
theorem normalized_coordinate_elimination {K : Type*} [Field K]
    {ι : Type*} (a b : ι → K) (j : ι) (ha : a j = 1) :
    (b j - b j * a j = 0) ∧
      (∀ i, a i = 0 → b i = 0 → b i - b j * a i = 0) := by
  constructor
  · simp [ha]
  · intro i hai hbi
    simp [hai, hbi]

#check exists_hodge_frame
#check le_of_hodgeTate_stable
#check isHodgeTateFrame_of_hodgeMatrix
#check hasJumps_of_rows
#check Lift.Chart.IsChartOf.exists_isPeriodMatrix
#print axioms normalized_coordinate_elimination
#print axioms exists_hodge_frame
#print axioms hasJumps_of_rows

end RHGaloisRun80
