import New.Seesaw.SeesawTheorem
import Mathlib.Tactic

/-!
# RUN72 — two-sided near-line transport and actual stage-cut support
27 Nov 2026. HUMAN-DERIVED scalar transport and compact-support argument at
the actual A caller; matrix/period and integral-Witt suppliers retained.
Prepared Lean scalar certificate and native probes, NOT executed.
Source compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Latest mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10:
completion-first compact migration and mandatory reduction read;
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, continuity,
research-state and HUMAN_PROOF_COMPACT read. Prime RUN71 72e67b83;
latest peer kernel 14196cf5, dependency a5c02498, acceleration 0b2ac210,
editor d14639a0 identified, with manuscript already containing the
abstract cut multiplicity and finite-sum induction (lines 380–394).
Do not repeat that result. Here supply the missing actual compact
support D0 of exists_stage_cut, and the quantitative scalar step
under the actual zero-term matrix supplier. No URT or unrelated physics.

## 1. Exact cancellation of the near-line centres
Source EqualLinesOrbit.lean 40–44, LinesStep.lean 53–69.
Let A_w = ideleLogVal(a)(w), A_bar = ideleLogVal(a)(bar w),
and let d_w=A_w-A_bar. Write t_{s,m}(j,w) for the reference
centre of HasNearLines. It is
  m d_w                   (s odd),
  m d_w - A_w             (s even and 2j<s),
  m d_w + A_bar           (s even and 2j>=s).
The new length is s'=s-1; m=m'+1 for even s, m=m' for odd s.
For i in Fin s', let r=s-1-i, the native i.rev.succ.
Set e_i=1 if (Odd s' iff i<=i.rev), else zero. The grading
constant has log C_w=A_w+A_bar by the actual ha. The identity is
  t_{s',m'}(i,w)
    = e_i C_w - A_w - t_{s,m}(r,bar w).                 (1)
If s odd, source centre at bar w is -m d_w. Then e=0
on the new lower half and 1 on the upper half, giving the two
new even centres. If s even, source r lies on the upper half
exactly when the new i is in its lower half INCLUDING middle;
then source centre at bar w is -m d_w + A_w and e=1.
Otherwise it is -m d_w - A_bar and e=0. Both yield
(m-1)d_w. This covers the central index without a fictitious
two-sided split. Also
  t_{s',m'}(i,w)+t_{s',m'}(i.rev,bar w)=0.               (2)
For even length use opposite halves, for odd length only d_w.
These identities use no estimate or summation over places.

## 2. Two-sided quantitative propagation, using the actual matrix entry
Keep EXACT source hypotheses of HasNearLines.step, including nonzero
constant term, the same adapted bases B,B', the Heisenberg invariance
hf, and the native hg reflected-pair nonpositivity. Let g_j(w) and
g'_i(w) denote ideleLogVal gamma and gamma'. Put I_w=1 on Q union
bar Q, zero elsewhere, and J_w=1 on Q, zero elsewhere. Thus
I_barw=I_w and J_barw<=I_w. The native matrix assertion H (65–66)
is integrality of
  c^(e_i) * star(b/gamma_r) / alpha / gamma'_i.
Here c is the grading constant, b the actual idele from the twist.
With log valuation nonpositive on integral elements this is
  g'_i(w) >= e_i C_w + B_barw - g_r(bar w) - alpha_w.
The premise hb at bar w gives B_barw-alpha_w>=-A_w-J_barw.
Consequently, using the old upper half of the absolute bound and
the EXACT cancellation (1),
  g'_i(w) >= t'_{i,w} - k I_w - J_barw
            >= t'_{i,w} - (k+1)I_w.                   (3)
The SAME argument at (i.rev,bar w), followed by hg and (2), gives
  g'_i(w) <= -g'_{i.rev}(bar w)
            <= t'_{i,w} + (k+1)I_w.                   (4)
Thus |g'_i(w)-t'_{i,w}| <= (k+1) I_w, exactly the native
HasNearLines conclusion. In particular the lower and upper bounds
are exact equality off Q union bar Q; no factor 2k, no loss summed
over places, no bound at the conjugate place omitted.

This proves the scalar implication of actual LinesStep.lean 63–69.
The retained matrix supplier is precisely H, derived by the source
from zeroTermFin_support and the string-reversal entry of
B'^{-1} W J^{-1} (B^{-1})^*. At 89–94 the product sum reduces to
the single pair (i.castSucc,i) by triangularity and string reversal.
Do NOT infer H from a generic nonzero period; its exact splitting,
matrix and support identities still need independent human derivation.
Likewise keep IsAdaptedAt.ideleLogVal_add_rev_nonpos, including
its exceptional odd-middle split-place exclusion (17–50);
the integral Gram entry alone pays only the nonexceptional cases.

## 3. Actual stage cut: finite corrected valuation representatives
Source SeesawTheorem.lean 39–75, EqualLinesOrbit.lean 46–106,
StandardLatticeLevel.lean 16–33, UnfoldingStages.lean 72–112.
Fix k>0 and the SAME stage Y=gradingY k. Let K=Kf, J=levelY(theta,k),
S=Y.besselFin, q=levelNorm(theta)>0. Retain J<=K and inclusion
of columnLevel into K (the native inclXFin_mem_Kf).
Choose an adapted basis B(d), beta(d) for every finite group point d.
The valuations are intrinsic: if two adapted bases span the same
lattice, the transition and inverse are integral; at a string index
the diagonal entry of their triangular product has only its one
diagonal summand (flagOrder has unique value at each string index).
Hence both log inequalities give equality. This proves precisely
the local independence used by IsAdaptedBasis.ideleLogVal_eq
(24–27,68–77), also for two points with identical local components.

Use the native reference at d=1, hasNearLines_zero, with
n=(D.m-k+1)/2 and the same graded-lattice scale. For each d define
  Phi(d)_(i,w) = logVal beta_i(d)(w) - logVal beta_i(1)(w),
  w in Q union bar Q.
The source valuations are integers. If d is in the support of the
actual unfolded integrand, hasNearLines_of_unfoldStage_ne_zero
gives Phi(d) in the finite integer box [-k,k]^(s*|Q union bar Q|),
and off those places the difference is exactly zero. The number
of box elements is at most (2k+1)^(s*|Q union bar Q|); no bound
uniform in twists is needed for finiteness.

For every vector in the image of Phi choose one preimage d_v;
on box elements outside the image choose any group point. Put
c_v=componentOn Q(d_v) (component localization, with its forced
conjugate components) and D0=union_v c_v K. It is compact as a
finite union of translates of the compact level K and is integral
away from Q union bar Q, hence belongs to the native ambient
localLevel away from q. For support point d take v=Phi(d).
At w in Q union bar Q, c_v and d_v have the same local component,
so have the same adapted string log valuations. Off those places
c_v is identity, so its valuations equal the reference. Therefore
c_v and d have equal adapted string valuations at every place.
Apply the actual IsAdaptedAt.exists_mem_besselFin: some h in K
has c_v h d^{-1} in S. Thus the S-orbit of d meets D0, with
the SAME d (not an independent representative in each local orbit).
The retained supplier here is the integral Witt extension in
EqualLinesOrbit 89–106: match primitive half-string columns with
equal Gram matrices, extend their isometry over the integral
lattice, then use the Bessel triangularity condition. Equal
diagonal valuations alone for arbitrary lattices are NOT enough
without that integral Witt theorem and stably-unramified premise.

## 4. Prime support of the actual stabilizer denominators
For each x in D0 prove the powering hypothesis needed by
exists_cut_coverMultiplicity_dvd, not just finiteness of the cut.
At w outside Q union bar Q, x and u in J are integral units,
so their conjugate is integral. At a place w in Q the native
levelOf congruence gives u_w=I+M with entries in the maximal ideal
of the local integers. If p is its residue characteristic and
r>=1 is the depth, the binomial expansion yields
  (I+M)^p-I in the (r+1)-st matrix ideal.
Indeed intermediate binomial coefficients are divisible by p,
the first term has depth at least r+1, and M^p has depth pr>=r+1.
This holds for p=2 too. Induction gives depth at least r+a after
power p^a. Since p divides q, powers q^a give at least the same
depth (the remaining integer power preserves each congruence
subgroup). This proof is uniform in u; it does not use compactness
to infer a uniform exponent from pointwise convergence.
For fixed x, choose a depth whose conjugate by x_w lies in K_w:
matrix multiplication bounds the entry denominators of x_w and
x_w^{-1}; equivalently use openness of x_w^{-1} K_w x_w.
There are finitely many w in Q, so take maximum a, using the
involution condition to handle conjugate places. Thus
  (x u x^{-1})^(q^a) in K   for ALL u in J.
If Q empty, D0=K, q=1 and a=0 works. At k=0 instead choose
A=D0=chosenLevel, J<=chosenLevel, and the actual filling_fits
support property; a=0 works directly. This reproduces the
actual hD and hW inputs of SeesawTheorem.exists_stage_cut.

Apply the already integrated IntegralAsCosetSum lemma (manuscript
380–382): get a finite cut T, invariant under S intersect A,
integral off q, with positive multiplicities dividing q^j on
T and relevant support. Its denominator is a unit at every
prime prime to q, and at q=1 exactly one. At k=0 it is contained
in chosenLevel as required. This supplies the stage support
and conductor-prime denominator bridge to
exists_isAdmissibleComb_unfolding 95–112, conditional on the
retained exact near-line/level/Witt suppliers. The prior finite-sum
and l1 estimates remain in force; this does not establish their
separate class-count or geometric adjunction premises.

## Source and graph ledger
Compact source paths relative to grh-compact/src:
 New/Seesaw/EqualLinesOrbit.lean b5ace630b79ecf9eeaca084da26fc55abe4c1e6d
  16–106, flagOrder, IsAdaptedBasis, HasNearLines, exists_mem_besselFin.
 New/Seesaw/LinesStep.lean 017ac7b96f33f7a41462aaef726ed1d26dec6767
  17–50 and 57–94, reflected inequality and step.
 New/Seesaw/StandardLatticeLevel.lean 0a7087b2ee0c5a549fb6e990f9c9e40a65018b06
  16–33, base adapted valuation and level inclusion.
 New/Seesaw/UnfoldingStages.lean 5e6b4189ad78c708ce8f30888678b4467672b850
  72–112, nonzero support induction and split central-generator exclusion.
 New/Seesaw/SeesawTheorem.lean 0e6f5541f15ddb75c30751d22163bfdbd4194d91
  39–75,95–112,135–154.
 New/Seesaw/IntegralAsCosetSum.lean 32fb5c67023696c8e6be524aa445e0c7804529d7
  exists_cut_coverMultiplicity_dvd, previously integrated.
 New/Endgame/ShortAndEnough.lean b99eea0689be372d84362c58272b705e104b6a3a
  128–168, actual A consumer.

Original selected source-visible edges:
 short_forms -> seesaw -> exists_isAdmissibleComb_unfolding ->
 exists_stage_cut -> {hasNearLines_of_unfoldStage_ne_zero,
 exists_mem_besselFin, localCongruence powering, level inclusion,
 exists_cut_coverMultiplicity_dvd};
 near-lines induction -> {base support, HasNearLines.step,
 split central-generator exclusion};
 step -> {H matrix entry, hg, hb, old bounds, parity centres}.
Reduced human chain replaces scalar arithmetic in step by (1)–(4)
and supplies explicit compact representatives and uniform local
powering; all nontrivial matrix/geometry/level/Witt dependencies
remain. No global native graph edge removed. Preserve original
and reduced graphs and all axiom evidence. Context key includes
compact pin, fixed D,Y,k, same Q,q, involution, a,b,alpha, same
adapted bases, actual nonzero integrand and actual column level.
No use of the claimed RH theorem.

Native Lean/lake/elan absent from local PATH, checked. Native
rh_prune/scan/reduce/auto/frontier unavailable for this run.
Prepared scalar certificates below, no execution claim.
Actual previously published CI file
cathedral-research-state:compute/rh-compact-primitives-replay-20261126/
outputs/targeted_results.json re-read: A build timeout 124 at
2700.11s; six B/C native checks reported three standard axioms;
all_requested_checks_ok=false, full_RH_replay=false.
No new PASS; no numerical simulations needed.

RESUME HERE: independent audit of (1)–(4) and the compact
representative argument at exists_stage_cut; next derive
LinesStep.lean 70–94 actual H from zeroTermFin_support and the
odd-middle reflected inequality 17–50, including the native
UnfoldingStages 95–112 ramified central-generator exclusion.
Then connect the established stage cut to the existing seesaw
scalar and norm transport at short_forms. Do not repeat the
finite multiplicity or height assembly. Request native runner
to replay the prepared scalar lemmas with module probes in
existing queue when resources permit. All other A, B, C and
analytic obligations remain as in existing ledger.
HANDOFF TO integration, editor, formal audit, theta, native runner.
-/

namespace CompactPrimeRun72

theorem odd_to_even_lower (m a abar : ℝ) :
    0 * (a+abar) - a - m*(abar-a) = m*(a-abar)-a := by ring

theorem odd_to_even_upper (m a abar : ℝ) :
    (a+abar) - a - m*(abar-a) = m*(a-abar)+abar := by ring

theorem even_to_odd_lower (m a abar : ℝ) :
    (a+abar) - a - (m*(abar-a)+a) = (m-1)*(a-abar) := by ring

theorem even_to_odd_upper (m a abar : ℝ) :
    0 * (a+abar) - a - (m*(abar-a)-abar) = (m-1)*(a-abar) := by ring

theorem one_step_lower (v old centre oldCentre ec a b alpha k I J : ℝ)
    (hentry : ec+b-old-alpha ≤ v)
    (htwist : -a-J ≤ b-alpha)
    (hold : old ≤ oldCentre+k*I)
    (hcentre : centre = ec-a-oldCentre)
    (hJ : J ≤ I) :
    centre-(k+1)*I ≤ v := by
  linarith only [hentry, htwist, hold, hcentre, hJ, show (k+1)*I = k*I+I by ring]

theorem reflected_nearness (v vr t tr E : ℝ)
    (hlo : t-E ≤ v) (hlor : tr-E ≤ vr)
    (hreflect : v+vr ≤ 0) (hcenter : t+tr = 0) :
    |v-t| ≤ E := by
  apply abs_le.mpr
  constructor <;> linarith

#print axioms odd_to_even_lower
#print axioms odd_to_even_upper
#print axioms even_to_odd_lower
#print axioms even_to_odd_upper
#print axioms one_step_lower
#print axioms reflected_nearness
end CompactPrimeRun72

#check Grading.IsAdaptedBasis.ideleLogVal_eq
#check Grading.IsAdaptedAt.exists_mem_besselFin
#check Grading.HasNearLines.step
#check Data.hasNearLines_of_unfoldStage_ne_zero
#check Data.exists_stage_cut
#check Data.exists_isAdmissibleComb_unfolding
#check Data.seesaw
#print axioms Data.exists_stage_cut
#print axioms Data.seesaw
