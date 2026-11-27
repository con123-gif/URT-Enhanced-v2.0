import New.Filling.BlockBound
import New.Filling.StandardLevel
import New.Exchange.StandardCoefficients
import Mathlib.Tactic

/-!
# Integration RUN76 — geometric fibre, exact Haar slab, represented transport
27 November 2026. Human source-matched integration; new probes prepared, not compiled.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Primary source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10 read first,
including the mandatory engines and completion-first amendment; AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE and research state consulted. Previous integration
392d881d; manuscript d3d4b13233d81e40b5aad8ed8df79be69f367181, editor 0a3ccf19.
The latter already integrates marked gauge, long-gap lift, Cramer and Rallis;
do not repeat them. This additive lane supplement is ready for editor merge
into the existing single HUMAN_PROOF_COMPACT.md, not a separate proposed proof.

## B: geometric fibre-one supplier of the existing weighted count

Peer 29129d5ac0c4f9b4d221386a1109c074a72a64d4, certificate blob
8ce22849ab4dd088bd8934f26a215321b075af1e. Independently read native
New/Filling/BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd
141–215 and 245–292, BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641
227–250. Attach to integration/2026-11-26_COMPACT_WEIGHTED_PAIR_COUNT.md,
not to a new abstract counting problem. The original root-relevant path is
Data.enough_forms -> ramifiedColumns_fill_rows -> exists_translate_finrank_comap_le
-> energy_fixingSet_le -> energy_le_of_linkEnergy_le -> energy_le_of_level_pairs
-> sum_pairWeight_le -> tsum_invPowWeight_le_of_codim_le.

For the native level j and fixed frame-product colour Z, let Y=paddedLeading_j Z,
d=det Y !=0, n=rho+1, M=q0^(n^4). After the first class-unipotent correction
(164–170; retain that integral alignment lemma), middle rows of the two
representatives agree. The upper congruence gives their upper difference
xi=M g d bar(d) X, with X integral over the rational integral star-stable ring.
Set P=xRows Z, alpha=first rho columns of adj(Y), T=X alpha, V=(P alpha)*.
Subtracting the two native Gram identities BEFORE estimating gives
X*P=-P*X and T*P=-VX. Thus (VT)*=-VT.

For every infinite embedding, the actual shared-vector bound of lines 90–125
bounds each summand in the difference xi adj(Y) at late columns l>=j by M/2.
After dividing by M, the resulting entries of g d bar(d) X adj(Y) are integral
and strictly smaller than one at EVERY infinite embedding. Their nonzero field
norm would be a nonzero rational integer of absolute value <1. Therefore
X adj(Y) vanishes at l>=j. No bound on 1/d and no single-place argument suffice.

The one integral skew correction is
    sigma = M [bar(d) T - d T* - V T].
It is skew by the preceding identities and integral term by term; no division
by two. If j>rho then Y=Z and P alpha=d I, so V=bar(d)I and the first and
third terms cancel in sigma P. Otherwise late-column vanishing and equality
of the initial j rows of P and Y give TP=dX; then the second and third terms
cancel. Both branches yield
    g sigma P = xi.
With u=0 and s=sigma in exists_mem_classUnip, the matrix
I+g x sigma x* ratGram makes precisely this upper-row correction, fixes the
middle rows, and lies in classUnip0. IsNearRep.eq_of_frameImage_eq makes the two
kept representatives equal. Thus the SECOND colour in the existing weighted
sum has fibre cardinal <=1 (actual representatives, not merely frame images).
The first weighted colouring and its index bounds remain in force. This
discharges the previously open geometric fibre-one interface under the explicit
middle-alignment, shared-vector, primitive completion and class lattice inputs.

At the next consumer (BlockBound 245–255) an independent check of the dimension
bridge: common link T has dim T+i=k; restrict the native map with rho+1 target
coordinates to T. Its kernel L=T intersect ker(map) has
dim L = dim T-rank(map|T) >= k-i-(rho+1).
Hence codim L <= i+rho+1, exactly the outer colouring budget. The inner
colouring still has codimension i. This does NOT establish the divisibility
input for the outer colouring. Lines 256–292 use the actual common link,
definiteness and principal-level lattice relation; preserve that as OPEN,
as well as sum_latticeDisc_inv_le. Do not infer the weighted sum from rank
alone. Keep the original tailScale and native exponents.

## B: exact Haar slab at the existing Siegel sum consumer

Peer afa6e6483fd14ced55d376c811907356b51b543f, certificate blob
fc3bc6e0651b7f990f9b72fdab0ea70ccec3077f. Independently read
Lib/General/Measure/Place.lean 300ee7d1e3e3d7b1d2ec8538b7f6feb365c70975
119–172, 210–242; Lib/DiscreteSeries/Bruhat/BigCell.lean
da06dcfda1a1401b8ad51f94649da9b760907a87 423–433; New/Filling/StandardLevel.lean
ec149f4a38c54931f75c7e106ce94d1d6e65c5a4 37–61.
Consumer B -> Moments -> FiniteSystem.sum_blocks_le_topKernel ->
siegel_sum_le_lintegral_quadric -> eventually_mass_near_quadric_le.

In the actual Place ring let tau+bar(tau)=1, delta be the skew unit,
nu the skew Haar, q(w)=w*Tw, and t a unit. Chart
x=bar(t)^(-1) tau(delta^(-1)b-q(w))+t a, with a,b skew, satisfies
bar(x)t+bar(t)x+q(w)=delta^(-1)b. Set u=(t bar(t))^(-1).
The native split (b',a)->tau delta^(-1)b'+a pushes nu x nu to volume.
Multiplication of skew coordinates by a self-adjoint unit u changes the
pushforward Haar by md(u)^(-1/2), since the product of the two equal
positive factors is the additive modulus md(u)^(-1). Translation by the
q(w) term has no cost. The fixed t,w chart therefore has total factor
    md(t)^(-1) md((t bar(t))^(-1))^(-1/2) = 1.
Use Tonelli and the fixed null set of nonunits to obtain the actual
lintegral_eq, not an almost-everywhere-only density.

For continuous nonnegative compactly supported f, with support projections
Kx,Kt,Kw, fixed t,w, the possible a lie in one compact set independent of b:
a=skewPart(bar(tau) t^(-1)x). The chart varies continuously in b.
To dominate even near nonunit t, if S_b of allowed a is nonempty choose a0
in S_b. The affine image of S_b x S_b under
t[tau delta^(-1)(a-a0)+(a'-a0)] lies in the fixed compact
C=tau delta^(-1)(Kx-Kx)+(Kx-Kx). Its volume is md(t) nu(S_b)^2.
Hence nu(S_b)<=sqrt(vol C)/sqrt(md(t)). The actual locally integrable
majorant g for md(t)^(-1/2) gives an integrable bound
sup(f) sqrt(vol C) |g(t)| 1_Kt(t) 1_Kw(w).
Dominated convergence proves finite mass and continuity at EVERY b, including
zero. Both disintegration fields are supplied with the original Place axioms.
The native Gram identity and left inverse for floorBasis transport these
measures; closed image ensures pullbacks of compact supports are compact.
No independent probability renormalization is introduced.

For the actual tail map with N=pi bar(pi), the exceptional block is
[[bar(pi),0],[-pi^(-1),-N^(-1)]], determinant -pi^(-1).
Consequently its pushforward is md(pi) times floorVolume, not the inverse.
Its form is q(y)-tau0 bar(tau0)/N. For I(b)=integral f d floorQuadric(b),
the strict hypothesis I(-delta N)<c yields a neighbourhood V of zero on
which the translated I is <c. For EVERY measurable S subset V,
    integral_{q(y)-tau0 bar(tau0)/N+N in S} f(tailVector) dy dtau0
       <= md(pi) c nu({Gamma: delta^(-1)Gamma in S}).
This is precisely the native strict smallSets slab input. The same
distinguished-coordinate compact cutoff and strict c of the Siegel sum
consumer survive. No new local normalization error. Global Siegel–Weil
core identification, operator norm convergence and theta majorant remain
distinct OPEN tasks, not consequences of this local Haar calculation.

## C: standard coefficient transport by a legitimate published theorem

Peer 1f40f70748680f36a26500d0ed02e9f3eab683b7, certificate blob
3385616e9b0c1716542e78c5d09afd1b3ed7a830. Independently read
New/Exchange/StandardCoefficients.lean 85616f797460e30c5134a146bd5220fadc28855c
55–78, Lib/Adelic/Landherr/Landherr.lean 6cb96add6ffdb98d2f87b994c5960c72fb84b9a4
Space.landherr / Space.exists_eq_move. Independently inspected printed p.20,
Theorem 2.4.1 of Markus Kirschmer, Definite quadratic and hermitian forms with
small class number, https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/herm.pdf#page=20.
It applies to rational Hermitian spaces locally isometric at every place of
the fixed field; it explicitly does not assert integral lattice equivalence.

At the actual callback, glue the integral comparison Gram and its inverse
with the SAME star-fixed complementary idempotent e. For Q=eB+(1-e)tau,
Q'=eB^-1+(1-e)tau^-1, the cross terms vanish, QQ'=I.
Retain the primitive local comparison and stably unramified integral
orthonormal-frame supplier. It gives integral k with k*Q_f k=I.
Write T=j beta and q0=scaleIdele q; the actual inverse-different identity
cancels the scale and gives Z_f=q_f k with Z_f* beta_f Z_f=I.

If beta is represented at infinity, take invertible local representatives
of its signatures and invert them to form the infinity components of Z;
together with the SAME Z_f these satisfy the standard Space Gram identity.
For the other space (J,X), each local completion has the isometry X_v Z_v^-1
from beta to J in the sense (X_v Z_v^-1)* J (X_v Z_v^-1)=beta.
This covers split places using the local product algebra; the forms are
nonsingular and E/E+ quadratic. Landherr therefore supplies rational c with
c*Jc=beta. Put w=X^-1 c Z. The two Gram identities give w*D w=D
on all adeles. Set Y=X^-1 c q. Crucially
    Y_f k = X_f^-1 c_f q_f k = w_f in U(I).
It is the SAME integral k and SAME finite point, not a freely chosen
local isometry. The native rational Levi covariance changes the coefficient
C_(j beta) into C_(j J) at the transported parabolic point, so the left
disjunct of h0 applies. If beta is not represented, the right disjunct
of h0 applies directly without Landherr. This supplies the represented
transport interface in apply_stdColDatum_eq_zero -> stdExchange_of_periods
-> exchange_theorem -> explicit_matching -> stdClassSum_det_modKernel_eq.
Retain freitag comparison, weak approximation, dual Fourier inversion,
equivariant lift and all h0 quantifiers. No assertion of integral
local-global equivalence or native dependency removal.

## Integration disposition and evidence
These are three distinct actual consumer replacements, conditional on the
retained suppliers; not three newly kernel-verified theorems. Editor should
merge into the existing weighted count, slab and standard matching sections,
not append duplicate summaries. The latest editor already integrated
968a30c3, 08451434, 06aae25d, 73af0642 and 6c46fb6e. Other peer commits
577605fc, 2e613067, 47dd3858, 2a198f50 and 72775cce were inspected in
the recent commit set; only the three audited blocks above are merged here.
No claim of complete peer or native graph coverage.

Original local edges: B count -> first colour, middle correction, second
colour fibre, saturation index, discriminant sum; B slab -> Place, floor
transport, tail map; C matching -> primitive comparison, integral k,
Landherr, rational covariance. Reduced human edges: exact skew cancellation
and product formula replace fibre-one interface; exact chart measure and
dominating compact bound replace slab interface; published Landherr plus
same-frame Gram bridge replaces rational isometry construction. All surviving
premises listed above and all original/reduced global graphs and axiom
evidence preserved. Context keys include compact pin, level j, Z, both
residue colours and actual representative pair; actual Place, floor, pi,
N and f; E, t', beta, j, delta, q, same k and all h0 points. No global
edge deletion or root retirement. No URT premise.

Actual local command -v lean/lake/elan returned no paths; no fresh native
rh_prune/rh_scan/rh_reduce/rh_auto/rh_auto_frontier execution. Prior engine
checks are on the old pin, not new compact checks. Actual state receipt
compute/rh-compact-primitives-replay-20261126/outputs/targeted_results.json,
blob 088cd2ec0e935ee1a282f10096949bcf671cc804, retrieved: six named native
checks, standard propext/Classical.choice/Quot.sound; module_1 timeout
124 after 2700.11 seconds, all_requested_checks_ok=false, full_RH_replay=false.
Peer prepared certificates plus the scalar codimension bridge below are
uncompiled; no synthetic test or fresh PASS claimed. No protected workflow
or registry edits. Source retrieval and published theorem page inspection
were executed. Human reconstruction incomplete.

RESUME HERE: B BlockBound 164–170 first alignment and 256–292 actual
outer saturation divisibility, then sum_latticeDisc_inv_le; B exact
Siegel–Weil core/majorant still open. C integrate this standard matching
supplier at the actual comparison caller and continue balanced-row,
reciprocity-to-isotropy and Ribet rowBudget. A remains on both quantitative
JetExponentBound suppliers and marked Hecke construction. HANDOFF TO editor,
positivity, character boxes, literature, audit and shared native runner.
The unchanged central inequality is m*remainder <= f*a*(log b)^5.
-/

namespace RHIntegrationRun76

-- Arithmetic end of the actual restriction rank-nullity bridge.
theorem codim_outer (k i l r rho : ℕ)
    (hT : l + r + i = k) (hr : r ≤ rho + 1) :
    k ≤ l + (i + rho + 1) := by omega

#print axioms codim_outer
#check Filling.sum_pairWeight_le
#check Filling.tsum_invPowWeight_le_of_codim_le
#check Place.isDisintegration_quadricMeasure
#check HyperbolicBasis.eventually_mass_near_quadric_le
#check Space.landherr
#check Space.exists_eq_move
#check IsEquivariantLift.apply_stdColDatum_eq_zero

end RHIntegrationRun76
