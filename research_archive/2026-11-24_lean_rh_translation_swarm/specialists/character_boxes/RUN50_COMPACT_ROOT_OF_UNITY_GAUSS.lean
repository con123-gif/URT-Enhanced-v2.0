import Mathlib

/-!
# RUN50 — compact character-boxes: uniform simultaneous root-of-unity selection

2026-11-26. HUMAN SOURCE-MATCHED reconstruction; scalar replay PREPARED,
not compiled. This is a compact-proof supplier, not new RH proof closure.
Latest ONE_EQUATION_MISSION blob 7e4a2d2c61c43503df6ca1d763cd4027ba7298bd
migrates to lsernau/grh-lean pin 72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Preserve RUN1–49 and the original graph. Do not use old toolchain evidence
for the compact proof. Recent peer commits ec7f131f (prime error), 18aa81b0
(Ribet coefficient), 2776e6a5 (A), de382b26 (compact kernel) address
different suppliers.

## Actual static caller path (not elaborated reachability)
All paths relative to grh-compact/src, blob IDs retrieved at pinned commit.
- Main.lean a5d8389131c985a0b54ce5b0e778ee5c8126a997 line 4: root.
- New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65:
  New.grh -> eventually_primeError_le_rpow -> star_inequality.
- New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05:
  Data.integral_forms_long -> exists_isFitFamily (line 66).
  Same family from A+B is retained; no independent witness.
- New/Selmer/FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14:
  exists_isFitFamily -> exists_mFoldTwist_selmerLengthLe (line 35).
- New/Selmer/TwistForRows.lean 802242498ad4530e7f52cc4f14e0a03be2c59f4d:
  exists_mFoldTwist_selmerLengthLe -> exists_anticyclotomic_twist (line 24).
- New/Selmer/TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754:
  exists_anticyclotomic_twist uses exists_roots_of_unity_ellVal_le
  TWICE (lines 119–120): first along a line, then on common roots.
- New/Selmer/RootsOfUnityPoints.lean 7c07be15e6c410124a9bc5ecb470e7750ac67074:
  exists_roots_of_unity_ellVal_le (line 72) uses
  exists_root_of_unity_eval_large (line 21) (line 82).

## One exact Gauss-norm transport (human proof of line 21)
Let |.| be the normalized l-adic absolute value, 0<r<1 with
|l|<r^(l-1). Let F_k be finitely many integral polynomials of arbitrary
degrees, with Gauss norms ||F_k||_r >= y_k>0. If some y_k>1, inputs
are impossible, since all coefficients integral. Otherwise put
P=prod F_k and choose integer a>=1 with r^a<|l|.

For a fixed N, assume every l^N-th root zeta is bad, meaning at least
one index k has |F_k(zeta-1)|<r*y_k. For 0<=j<N set
L=l^(j+1), A=a*(j+1), rho_j=r^(1/l^j),
Q_j=(1+X)^L-1. Take the L distinct nodes x_i=zeta_i-1, including 0.
All have |x_i|<=|l|^(1/(l^j*(l-1)))<rho_j. The coefficient ring
must contain a primitive l^N-th root; finitely many requisite roots
then lie in it. Choose a bad index k(i) at each node, and write
P=F_k P_k. Define S_j by the exact polynomial identity

 Q_j S_j = Q_j' P^A
   - sum_i [Q_j/(X-x_i)] F_{k(i)}(x_i)^A P_{k(i)}^A.       (1)

Existence of S_j is integral polynomial divisibility, not an estimate:
Q'_j=sum_i Q_j/(X-x_i), and each term of the difference factors
as Q_j/(X-x_i) times
(F_{k(i)}^A-F_{k(i)}(x_i)^A) P_{k(i)}^A, divisible by Q_j
via the monic factor theorem. No division by an evaluation or by a
possibly zero F_k(x_i).

At rho_t for t>=j, multiplicative Gauss norms give
||Q_j||=rho_t^L, ||Q_j/(X-x_i)||=rho_t^(L-1),
||Q'_j||=|l|^(j+1) (because 1+X has norm 1).
Since ||F_k||_rho_t>=y_k, the entire correction sum has norm at
most rho_t^(L-1) r^A ||P||_rho_t^A, strictly smaller than
|l|^(j+1)||P||_rho_t^A. The ultrametric inequality is therefore
an EQUALITY, not a loss:
 
 ||S_j||_rho_t = |l|^(j+1) ||P||_rho_t^A / rho_t^L.        (2)

S_j is the same polynomial at both radii. By monotonicity
||S_j||_rho_j<=||S_j||_rho_(j+1). Cancel |l|^(j+1) BEFORE taking logs.
All P norms positive (y_k>0); the exact resulting scalar inequality is

 log||P||_rho_(j+1)-log||P||_rho_j
     >= (l-1)*(-log r)/(a*(j+1)).                         (3)

Indeed L*(log rho_(j+1)-log rho_j)=(l-1)*(-log r).
Sum (3); ||P||_rho_N<=1 by integrality, and
||P||_r>=prod y_k. Hence a necessary condition for all nodes bad is

 ((l-1)*(-log r)/a) * H_N <= -sum_k log y_k.               (4)

Choose ANY N with H_N greater than the right-hand budget divided by
the positive coefficient. For example H_(2^b)>=1+b/2 by grouping
dyadic blocks, so a uniform explicit N=2^b exists depending only
on l,r,a and the y_k, NEVER on polynomial degrees or coefficients.
This is a quantitative extraction of the native harmonic contradiction,
not a new theorem about RH. Every larger N also works. Once N chosen,
take O sufficiently large to contain a primitive l^N-th root; only
then quantify over arbitrary F_k in O[X]. This is the exact native
eventual-N/eventual-O/forall-F ordering.

Empty index set: any root (1) works. Strict separation in (2) is
essential; replacing r^a<|l| by equality does not justify equality
of the norm. Using independent good roots for the F_k would NOT
satisfy the caller. Formula (1) is the compressed same-polynomial
transport behind native W,s,K,V. No extra conjectural premise.

## Remaining frontier / status
Original source proof preserved. Candidate human replacement: line 21
via (1)-(4); line 72 multivariate coordinate induction remains, including
simultaneous powers 1<=d<=m, monic auxiliary polynomials and total
degree L, all coordinate bounds q and the uniform initial valuation.
Both calls at TwistTheorem lines 119–120 survive; all tied-prime,
balanced-row, Fitting determinant, p-adic comparison and denominator
bounds survive. No global pruning, no axiom deletion, no new verified
caller substitutions. No URT ranking needed. Static source references
only; use context keys (pin, declaration, l, r, family y, N/O order).

Actual tool evidence: 7 pinned blobs and explicit caller anchors
retrieved from GitHub. Local lean and lake absent. Historical old-pin
status b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc and
7da354941e402b6f8b364ed03d8c5c82d27b7717 report pass only for
old native strip/engine jobs. Old shared replay failed (status
22989ce418dbfe8731db225af351ca57592ead73, Unicode import).
Compact union graph job actual run 45781154005, status blob
ea44d71556e0d21703e72fcd61bbaf2bee0ec563, returncode 1,
RESOURCE_BLOCKED below publisher build recommendation, 0.04s.
No compact native graph or axiom ledger produced here. Original graph
and pending declarations retained; do not claim the scalar certificate
has run. Shared kernel worker owns replay, no competing build.

RESUME HERE: reconstruct line 72 coordinate induction on the actual
same-root selection, keeping the extra monic product in the same
family and extracting the precise r exponent q+L+l+ma+1.
Then connect both line/tuple calls in TwistTheorem to the same twist
and exact loss delta + J0*8*delta, not the superseded old Sha bound.
HANDOFF TO: compact editor, math, audit, kernel; use equations (1)-(4)
as one concise supplier paragraph, verify in shared compact build.
-/

namespace CompactCharacterBoxes50
open scoped BigOperators

-- Scalar portion only; no compact Main import and no assumed RH.
theorem telescoping_gain (u d : ℕ → ℝ) (N : ℕ)
    (h : ∀ j < N, d j ≤ u (j+1) - u j) :
    (∑ j ∈ Finset.range N, d j) ≤ u N - u 0 := by
  induction N with
  | zero => simp
  | succ n ih =>
    have hprev := ih (fun j hj => h j (Nat.lt_trans hj (Nat.lt_succ_self n)))
    have hlast := h n (Nat.lt_succ_self n)
    rw [Finset.sum_range_succ]
    linarith

theorem budget_contradiction (u d : ℕ → ℝ) (N : ℕ) (B : ℝ)
    (h : ∀ j < N, d j ≤ u (j+1) - u j)
    (h0 : -B ≤ u 0) (hN : u N ≤ 0)
    (hlarge : B < ∑ j ∈ Finset.range N, d j) : False := by
  have ht := telescoping_gain u d N h
  linarith

#print axioms telescoping_gain
#print axioms budget_contradiction
end CompactCharacterBoxes50
