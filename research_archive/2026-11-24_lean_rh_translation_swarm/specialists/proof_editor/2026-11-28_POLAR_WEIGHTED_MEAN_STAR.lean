import New.Endgame.OneSidedCriterion
import Mathlib.Tactic

/-!
# Editor — replace pointwise fiber star by ONE weighted mean
28 November 2026. HUMAN DERIVATION / SOURCE-MATCHED; Lean aggregation
certificate below PREPARED, not compiled. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.
Compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7,
1c4608f2190154fd4bc4b38fc77db10ec5e60e64, 579ecc1cafdb28eae7d1c97565700c571dfa7484.
AGENTS, SWARM, HANDOFF, EXPANSION read. Recent peer RUN93 fiber
0f24af4e, RUN95 native grid d3fcfc01, kernel cache 176ea09a,
C2 cache c1f43d70 and B3 queued a12acead inspected by commit/file.
No duplicate cold build or protected workflow edit. Previous editor
native remainder junction e8375454 still pending; do not report PASS.
RUN93 fiber asks for star at EVERY u of one fixed data fiber. The new
route strictly reduces that demand to ONE signed weighted integral.
This is an alternative sufficient criterion; not a claim to have
proved the arithmetic estimate or a reason to delay existing replays.

## 1. Strengthen the existing polar window to a weighted mean

Exact source New/Endgame/OneSidedCriterion.lean
93f9a2f5e8cde2438a3cbf030ba823c9613d0ba3:
IsPolar.eventually_moment_le and IsPolar.exists_window_sub_mul_le.
Fix E,E' polar as in the native theorem, before t grows. Choose a
single R with 3<R<4 sufficiently close to 3 for BOTH moment bounds.
For all large t and all v>=0, |E(v)|,|E'(v)|<=t exp(v). The same
t bounds both signed moments in absolute value by k! t/R^k, with
integrability on (0,infty). Fix X in [0,exp(t)], let
    k = ceil(t^2/9), w(v)=v^k exp(-3v),
    J=[t,t^2], G(v)=E(v)-X E'(v)-exp(-t).
The native proof already supplies t+tX+1<=exp(2t). Consequently
|w(v)G(v)|<=v^k exp(2t-2v).
Outside J this is bounded by the following NONNEGATIVE majorants:
    v<t:     v^k exp(7t-Rv)
    v>t^2:   v^k exp(2t-t^2-v).
Indeed (R-2)v<2t<5t in the first case; v>t^2 in the second.
Thus, by additivity on J and its complement and integration of
nonnegative majorants over the larger positive half-line,
    integral_J w G
    <= integral_(0,infty) w G
       + k! exp(7t)/R^(k+1) + k! exp(2t-t^2).
These are the SAME two native tail terms. There is no assumption
on the pointwise sign of G on J. Full-line moment comparison gives
    integral_J w G <= k! [
      t(1+X)/R^k + exp(7t)/R^(k+1)
      + exp(2t-t^2) - exp(-t)/3^(k+1)].
Divide the positive contributions by k!/3^(k+1). Uniformly in X,
they are bounded by
    3 exp(2t) (3/R)^k,
    exp(7t) (3/R)^(k+1),
    exp(2t-t^2) 3^(k+1).
Each is o(exp(-t)): for the first two use k>=t^2/9 and
log(R/3)>0; for the third k<=t^2/9+1, giving a quadratic exponent
-(1-log(3)/9)t^2+O(t) with positive quadratic saving.
Therefore integral_J w G < 0 eventually, uniformly for all X in
[0,exp(t)]. W=integral_J w>0 as t>1, w continuous and strictly
positive in (t,t^2). The exact strengthened native conclusion is
    integral_J w (E-X E') <= exp(-t) W.
The original pointwise existence is a corollary. This uses only
the original polar moments, Laplace integral and tail estimates,
not an external PNT estimate or RH. Endpoints are null for Lebesgue
measure. No exchange of limits with D or X; t threshold depends
on the fixed E,E', R, and is uniform in X.

## 2. The star cancels at the level of ONE mean

Exact sources:
New/Data/AdmissibleData.lean 04208a5044bb7cf6464ef142a14d939148bed834
Data record and definitions x,b,E,f,a,tops,budget.
New/Data/DataExist.lean 634c6a1f88791a3bb770326785b70411e8289b41.
New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
Data.remainder_eq.
New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65
eventually_primeError_le_rpow (do not import Main).
For fixed P and epsilon, and each large x=k0^4, take ONE native
admissible D satisfying the exists_data facts. Let t=10^6 log x,
X=#tops/#thick=towerDeg(s)/#thick. The native count and scale
bounds give 0<=X<=exp(t) and #thick>0. For each u in J define
D_u by replacing ONLY logX1 with u and its proof of scale.
The original D.logX1>=t^2 ensures all scale inequalities on J.
The entire other record is fixed; in particular x,b,m,a,f,#thick,
#tops and K=logB^2 budget are CONSTANT in u. This is verified from
the actual definitions: a rounds x*b, f is determined by P,s,
tops by P,s, and budget=f*a*logB^3. No assumption that row spaces,
rank, weights or H are constant; those may genuinely change.

Put C=m*a*#thick>0, A=primeError(P.d,P.N0,x),
P(u)=primeError(P.d,P.N0,exp u)-X*primeError(P.d,1,exp u),
S(u)=m*D_u.remainder. (Here P(u) denotes polar error, not Parameters.)
The exact native remainder identity gives for EVERY u in J
    S(u)+C P(u)=C A.
By the proved moment integrability and this equality, the weighted
functions are integrable on J. Integrating before estimating yields
    C A W = integral_J w S + C integral_J w P.
It is consequently sufficient to establish the following ONE
arithmetic inequality for the fixed fiber (not for all its points):
    integral_J w S <= K W.                       [MEAN STAR]
Together with the polar mean this gives A<=K/C+exp(-t), exactly
the same right side as the native pointwise caller. The existing
HasLogBound scale comparison gives x^(8 epsilon-1/2). Use the
existing quartic/principal endpoint and epsilon/2 slack unchanged.
For each fixed P,epsilon, the required assertion is existence of such
a D with mean star at every sufficiently large quartic x. Do not
interchange existence of D with integration in u. Uniform fiber
star implies mean star because w>=0; the converse is not a logical
consequence. Pointwise or average star has not been established by
this argument. In particular an arbitrary selection of a different
D at each u does not give this cancellation because C,K can vary.
This may permit an aggregate arithmetic/geometric estimate without
uniform rank/height control at each u; no such supplier yet proved.

## 3. Exact scope and replay

Actual connector JS ran 11 unique source anchors and 22 removed/
duplicated controls across the four named pinned files; all matched
or rejected as expected. The human tail comparison above is
independent of those text controls. Local command -v lean/lake/elan
empty; no new native compilation, rh_scan/prune/reduce/auto/frontier,
graph, axiom or root closure. Earlier verified endpoint, B3 and C2
receipts keep their scopes; earlier native remainder equality still
needs replay. No benchmark or original URT claim. Original
pointwise graph and all previous candidates remain intact.

RESUME HERE: formalize the strengthened signed window integral
directly at IsPolar.eventually_moment_le using the native tail
majorants and its existing Laplace moment estimates. Use the
aggregation lemma below on the restricted Lebesgue measure on J;
compare original pointwise theorem and new mean caller with full
constructor-inclusive dependencies, actual kernel and standard
axiom checks. Coordinate with Landau/prime to avoid duplicate
replay; do not replace the preferred pointwise route before this
receipt and a real arithmetic mean supplier. HANDOFF TO
Landau/prime/integration/audit. RH and every root obligation OPEN.
-/

open MeasureTheory

/-- Algebraic/measure-theoretic bridge, independent of the arithmetic
supplier and of the method for obtaining the polar mean. No positivity
of the signed functions is imposed. The restriction to J is encoded in μ. -/
theorem editor_weighted_star_cancel {α : Type*} [MeasurableSpace α]
    (μ : Measure α) (w S Q : α → ℝ) (C A K e : ℝ)
    (hC : 0 < C) (hW : 0 < ∫ u, w u ∂μ)
    (hw : Integrable w μ)
    (hS : Integrable (fun u => w u * S u) μ)
    (hQ : Integrable (fun u => w u * Q u) μ)
    (hpoint : ∀ u, S u + C * Q u = C * A)
    (hs : (∫ u, w u * S u ∂μ) ≤ K * (∫ u, w u ∂μ))
    (hq : (∫ u, w u * Q u ∂μ) ≤ e * (∫ u, w u ∂μ)) :
    C * A ≤ K + C * e := by
  have hid : (fun u => (C * A) * w u) =
      (fun u => w u * S u + C * (w u * Q u)) := by
    funext u
    rw [← hpoint u]
    ring
  have heq := congrArg (fun f : α → ℝ => ∫ u, f u ∂μ) hid
  simp only [integral_add hS (hQ.const_mul C), integral_const_mul] at heq
  apply le_of_mul_le_mul_right _ hW
  nlinarith only [heq, hs, mul_le_mul_of_nonneg_left hq hC.le]

#print axioms editor_weighted_star_cancel
