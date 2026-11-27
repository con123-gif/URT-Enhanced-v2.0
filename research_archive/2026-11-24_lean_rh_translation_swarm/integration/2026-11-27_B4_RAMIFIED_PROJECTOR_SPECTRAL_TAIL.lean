import Mathlib

/-!
# Integration: a rank-only B4 supplier via the ramified range projector

27 November 2026. Source-matched conditional mathematics; scalar Lean candidate
below is PREPARED, not compiled. No new root closure. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.

Read ONE_EQUATION_MISSION, LIVE_PROOF_SPINE, LIVE_OBLIGATIONS (blobs
3adc76221a978016e3505cdf3e36ad688354d7d7,
4878ea106b791c42b5f5a45810162de59701c4d9,
01fa22a6b12abad5ccf580d2621f82be3bf70c13), AGENTS, SWARM, HANDOFF, EXPANSION.
Compact upstream pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original 40e56bab pin is not mixed into this derivation.

## Actual consumer and proposed weaker supplier

Use EXACT full-column maps B_s = D.goodProjTranslate s ∘ D.poincare ∘
(c0 • D.ramifyingOp univ), with c0 a nonzero scalar, from
New/Filling/FillingTheorem.lean (801448ae9b895babd0d69dc4f7967d86eb006e76).
Identify rows with the native good central projection range W via the same
coordinate identifications in that proof. Let c = dim Column > 0, d = dim W > 0
(retain the positivity guard), eta=b^(-2), delta=b^(-4). Let Q_s be the
orthogonal projector on im B_s and M = (1/|G|) sum_s Q_s on W. These are
projectors on the actual RAMIFIED images, not on columns before ramification.
Sufficient new input:

    dim spectralSubspace(M, eigenvalue < c/(2d)) <= eta*d.    (TAIL)

Unlike a bound on the full second moment, TAIL ignores large eigenvalues,
and is unchanged by any invertible column-coordinate change. It only concerns
the number of deficient row directions. For a reachable span F of codimension
r, let Pi be orthogonal projection onto F-perp. The positive contraction
Pi Q_s Pi has trace <= rank(Pi B_s), since its eigenvalues are <=1 and its
range is contained in im(Pi B_s). If L is the low spectral projector and
k=rank L, then M >= (c/(2d))(I-L) in Loewner order. Consequently

    max_s rank(Pi B_s) >= tr(Pi M)
                       >= c/(2d)*(r-tr(Pi L))
                       >= c/(2d)*(r-k).

The last inequality uses 0<=Pi<=I, NOT commutativity with L. If r>4 eta d,
then k<=eta d<r/4 and rank gain >=3cr/(8d). At each step add the translate
achieving this inequality; it is not already selected because the gain is
positive. The integer r decreases, so iteration stops at r<=4 eta d.
With potential Phi(r)=5d log(1+r/(eta d)), a gain g costs c columns and
decreases Phi by at least 5d*g/(r+eta d) >= (15/8)c*r/(r+eta d) > (3/2)c.
Proof: -log(1-x)>=x for 0<=x<1; here x=g/(r+eta d).
Thus total cost is at most 5d log(1+1/eta), EXACT original index budget.
No estimates on non-reachable spans are needed; no changed A/C constants.
This replaces the *consumer* of IsSpread, not its full original statement.
If d=0 no division is allowed; explicitly retain or prove row positivity.

## Source-supplied bridge (not a proof of a new independent moment)

Moments.lean (ec2cb964ede0d5eeae41a077dc6dbfface9c0444),
Fits.exists_translate_finrank_comap_le, supplies the three estimates
already exposed in 2026-11-26_COMPACT_CENTERED_FILLING.md. In precisely
that normalization P=tQ, with A=PP*, R the good central projection,
T=average rho(s) A rho(s)* and T_W=RTR on W, they are

  sum_i ||(P*P-I)e_i|| <= delta*c,
  tr((I-R)A) <=4 delta*c,
  ||T||_HS^2 <= (1+9 delta)c^2/d.

Here the last estimate is the already existing B2/B3 normalized energy bound;
do not divide by unipCovolume twice. By decomposition into rank-one
operators, trace norm ||P*P-I||_1 <= sum_i ||(P*P-I)e_i||. Since
P0=RP, P0*P0-I=(P*P-I)-P*(I-R)P, the triangle inequality and positivity
give ||P0*P0-I||_1<=5 delta*c. If Q0 is the orthogonal range projector
of P0, singular value decomposition gives exactly
||Q0-P0P0*||_1=sum_{lambda_i>0}|1-lambda_i|
<=||P0*P0-I||_1 (zero column singular values contribute only on the RHS).

ChainValuation.lean (19e853dfa8c645bfcdf3b3e21183f9b432620ef7),
ramifyingOp_finrank_comap_and_short at p=bottom bounds the codimension
of the ramified column range by #piPlaces*c/(N-1). Native size guards
f<=b, N-1>=b^9, card_piPlaces=f give <=b^(-8)c<=delta*c.
Restricting P0 to that range loses at most this many image dimensions.
Orthogonal projections onto nested ranges differ by an orthogonal
projector, whose trace norm is exactly the rank difference. R commutes
with rho(s); the scalar c0 and nonzero normalization t do not alter
the image. Thus under the exact coordinate/range identities of the native
FillingTheorem, averaging and unitary invariance give

                    ||M-T_W||_1 <=6 delta*c.               (BRIDGE)

Put tau=tr T_W. The native bounds give tau >=(1-5delta)c and
||T_W-(tau/d)I||_HS^2<=19delta*c^2/d, as in the earlier centered result.
On the low spectral subspace L of M, write x=k/d, 0<=x<=1.
Then tr(LM)<=xc/2, but by trace duality, Cauchy-Schwarz, and BRIDGE,

    tr(LM) >= tr(LT_W)-6delta*c
           >= c*((1-5delta)x-sqrt(19delta*x)-6delta).

Divide by c>0. The scalar lemma below proves x<=128delta. Since b>=1000,
128delta<=eta, yielding TAIL. This proves compatibility with the original
three numerical inputs rather than claiming that they are independently
proved here. All original B2/B3 dependencies stay on the fallback path.
The alternative direct TAIL supplier does not require any of those three
numerical bounds, but deriving it for every actual admissible Data remains
a substantive OPEN obligation.

## Symmetry and strictness

Because Q_s=rho(s)Q_1rho(s)* on W (central good projection, fixed ramified
domain), M commutes with the finite level group. In an orthogonal isotypic
decomposition W=sum_pi V_pi ⊗ M_pi, Schur averaging gives blocks
I_(dim V_pi) ⊗ H_pi, with H_pi=partialTrace_(V_pi)(Q_1 restricted to
that isotypic block)/dim V_pi. Cross inequivalent blocks vanish; for equal
irreps retain full multiplicity matrices. Therefore the exact new target is
sum_pi dim(V_pi) * #{eigenvalues(H_pi)<c/(2d)} <= eta*d.
No multiplicity-free, irreducibility, or character-independence assumption.
This makes the new supplier block-local and aggregate; no full s-by-t
amplitude pairing is demanded if one can bound these multiplicity spectra.
The native Data representation is not asserted to satisfy this without proof.

Strict separation in the abstract linear algebra interface (not actual RH
data): take c=1,d=4,G=C4 acting diagonally by its distinct characters, P
an isometric column with coordinate squared magnitudes (5/8,1/8,1/8,1/8),
R=I, no ramification. The orbit-average projector has exactly these four
eigenvalues, all >=1/8=c/(2d), so TAIL holds even with k=0. Its squared
HS norm is 7/16, exceeding (1+9delta)/4 for delta=b^(-4), b>=1000.
Hence the projector criterion does not imply the old sharp second moment.
Exact arithmetic checked in connector JS: 5+1+1+1=8, 25+1+1+1=28,
28/64=7/16, and 19/128<4/25, 1/2-5/1000-2/5>6/128.
No numerical tests on fabricated arithmetic Data. No runtime/URT gain claimed.

## Evidence, failed routes and continuation

The C2 Carrier run 46012543617 has compute status ERROR (blob
e168f3d80ae457b416fab2f5d17f99554d6349a9), despite green workflow.
Carrier build exit 0 (1836.62s); seven original probes exit 0; replacement
exit 1 (11.49s), sorryAx and missing direct guard, RUN79 not executed.
Independently read actual error log blob 8471e129f834dd9781dd5d4e82d656558ce27cc1:
implicit chi, unresolved flip character, simp made no progress, dependency
guard. RUN80 blob 64f2ee7ceca175dcc8baebbd61ef818add6aa916 is a candidate only.
The integration restore/replay runners were concurrently updated
(f12a0fa2...,740a8f2a...,9de8ac47...); abandoned my competing atomic edit before
any write. Do not duplicate their existing combined replay or B2 fusion
run 46016547394. Cache artifact 15206556705, digest
a2c8295259e0cb43d2670c57a02da689e2c4341deb74c91cc527dfe295f6f6be.
Artifact bytes not downloaded. B2 prior caller success is not C2 success.
No local lean/lake, resource guard prevents cold rebuild. Scalar certificate
below UNRUN; no native rh_scan/rh_prune/rh_reduce/rh_auto/rh_auto_frontier
executed. Existing graphs/axioms/premises preserved. No proof of RH.

RESUME HERE: derive TAIL directly from the actual finite-level isotypic
multiplicity matrices H_pi (first prove their exact compression formula
for the native good projected RAMIFIED Poincare image); if no such estimate
can be proved, keep the original moment route. Replay scalar lemma in
the pinned environment; do not mark the new consumer accepted before
native type/axiom/dependency checks and independent audit. The decisive
weighted prime inequality remains OPEN.
-/

namespace RHIntegrationRamifiedTail

theorem low_spectral_fraction (δ x : ℝ)
    (hδ : 0 ≤ δ) (hd : δ ≤ 1 / 1000) (hx : 0 ≤ x)
    (h : (1 / 2 - 5 * δ) * x ≤ Real.sqrt (19 * δ * x) + 6 * δ) :
    x ≤ 128 * δ := by
  by_contra! hn
  have hx' : 0 < x := lt_of_le_of_lt (by positivity : 0 ≤ 128 * δ) hn
  have hp : 0 < x * (x - 128 * δ) := mul_pos hx' (sub_pos.mpr hn)
  have hnon : 0 ≤ 19 * δ * x := by positivity
  have hsquare : 19 * δ * x < ((2 : ℝ) / 5 * x)^2 := by
    nlinarith [hp, mul_nonneg hδ hx]
  have hs : Real.sqrt (19 * δ * x) ≤ (2 : ℝ) / 5 * x := by
    by_contra! hh
    have hpos : 0 < Real.sqrt (19 * δ * x) + (2 : ℝ) / 5 * x := by positivity
    have hprod := mul_pos (sub_pos.mpr hh) hpos
    nlinarith [Real.sq_sqrt hnon]
  nlinarith [mul_nonneg (sub_nonneg.mpr hd) hx]

theorem rank_gain_scalar (c d r k η g : ℝ)
    (hc : 0 < c) (hd : 0 < d) (hη : 0 ≤ η)
    (hr : 4 * η * d < r) (hk : k ≤ η * d)
    (hg : 2 * d * g ≥ c * (r - k)) :
    8 * d * g ≥ 3 * c * r := by
  have h1 : 0 ≤ c * (η * d - k) := mul_nonneg hc.le (sub_nonneg.mpr hk)
  have h2 : 0 < c * (r - 4 * η * d) := mul_pos hc (sub_pos.mpr hr)
  nlinarith

#print axioms low_spectral_fraction
#print axioms rank_gain_scalar

end RHIntegrationRamifiedTail
