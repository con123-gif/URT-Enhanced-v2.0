# RUN82 — exact thick/thin orbit interface and link-fibre consumer

27 November 2026. B2 source-matched human REVIEW, conditional on named
native suppliers; no fresh native replay. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Source pin lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src, Lean 4.35.0,
Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 636b4e3942cfed705dadb2887c1dec7eef1ca4ae,
ledger ad9e569597e603278d1b6f281f887aaf63032c38, binding amendment
99cfbd1f, detailed manuscript (especially 834–838), SWARM_PROTOCOL,
handoff, AGENTS, continuity and prior RUN81 b6356a2. Read peer 49b0c47b
(active pair/energy caller and local build timeout), a990894e (sector
alternative), existing COMPACT_OPEN_CELL_CONTRACTION and
COMPACT_THIN_CLASS_VOLUME_KERNEL. Do not redo the packet exponents,
tube estimate, thin Schur kernel or the pair-weight proof. This review
supplies the explicit asymmetric quotient normalizer and its caller,
a finer interface than the previous notes' reference to orbit transport.

Source anchors:
- New/Filling/BlockBound.lean blob 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
  299–365 (top), 368–394 (all levels).
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  231–255, 370 (terms, groups, cutoff, sum).
- New/Filling/NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
  188–240, 266, 315–317 (frame, discriminant, near, integrality).
- New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1,
  summable_amplitude, hasSum_amplitudeSum_change_of_weight,
  amplitudeSum_eq_zero_of_not_agrees.
- New/RealPlace/OpenCellBound.lean 054e3375d3ef6c96633ab3c2e44b38df52a94755,
  16–22; New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea,
  65–75, 120–140; New/Filling/ThinClasses.lean
  6ae40a38e407331b9954067c833c34a62277b2e5, 131–149.
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
  365–377, 445–506 (index, gauge, chosen representative and partition).
- New/Filling/CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f,
  105–129 (level-energy caller).

## 1. The exact asymmetric orbit partition

Fix the actual admissible S, stable T, c,s,c', and cut side. Write
L=classUnip(c), R=classUnip(c'), L0=classUnip0(c), R0=classUnip0(c'),
X=T intersect termsOver(c,s,c'). The groups are rational; use their
ratToInf images for action on archimedean variables. For this section
assume termDisc is nonzero on T (the actual top lemma premise).
All L/R actions preserve X by stability and the principal level.

Let F be the matrix of standard frame columns and Z_g=F*JgF.
For every g in X, Z_g is invertible: native hasLevel_last supplies
its nonzero determinant from termDisc(g) != 0. The star-row block
of gF is precisely xRows(Z_g), because the paired hyperbolic
coordinates have Gram pairing one. Thus the matrix
    B_g = g F Z_g^(-1) E_0
where E_0 includes the first rho coordinate columns has star-row
block xRows(Z_g) Z_g^(-1) E_0 = I_rho.
If l in L and r in R0 satisfy l g r^(-1)=g, then r fixes F,
so l gF=gF and l B_g=B_g. The native FrameAction.
eq_one_of_mem_besselU_of_fix gives l=1; then r=1. This is an exact
proof of freeness of L x R0 on X, not of L x R for all levels.

Select sigma(Q) in each asymmetric double coset Q=L g R0, preferring
an element satisfying IsNearRep(c,c') if one exists; otherwise
select arbitrarily. No uniqueness of a near representative across
the larger asymmetric coset is needed. Within a smaller L0 g R0
double coset the chosen representative out is fixed.

Define the nonnegative new weight
    phi(g,y)=1_{g=sigma(LgR0)} omega(g^(-1)y),
with omega the RIGHT class c' box partition, not class c.
For fixed gamma in X and y define
    a(v)=sum_{u in L} 1_{u gamma v^(-1)
                              =sigma(L gamma v^(-1) R0)}.
For any x in R, sum a(r0 x) over r0 in R0.
Put g=gamma x^(-1). Then
u gamma (r0 x)^(-1)=u g r0^(-1).
Its asymmetric double coset is fixed; existence of a pair taking
g to sigma follows from its membership in that double coset.
Freeness above implies exactly ONE such (u,r0). Consequently

    sum_{r0 in R0} a(r0 x)=1.                     (P)

Tonelli justifies the order of nonnegative sums. Using the exact
Setup.IsBoxPartition property with (P) yields

    sum_{u in L,v in R} phi(u gamma v^(-1),u y)
       =sum_v a(v) omega(v gamma^(-1)y)=1.

This proves the actual change-of-weight premise at BlockBound
307–325. No cardinality of an infinite orbit and no extra covolume
factor occurs. It also explains why the proof needs the asymmetric
coset L g R0 rather than L g R or L0 g R0. The latter choices do
not establish (P) by this argument. In particular dropping freeness
is invalid: take the abstract negative control G=L=R=R0=C2,
gamma=1, sigma=1, omega=1. The two stabilizer pairs both count,
so the required sum is 2, not 1. This is a mathematical
counterexample to the shortcut, not an instance of the admissible
native data.

## 2. Nonzero selected integral forces a near representative

The actual cutoff properties matter here. Suppose sigma(LgR0)=g
and the cut weighted integral is nonzero. Its integrability is
from AmplitudeSums.hasSum_amplitudeSum_change_of_weight, by (P).
There exists y with omega(g^-1 y) != 0 and nonzero cut kernel.
Both y and g^-1 y satisfy InCut place by place (SchurTest.121).
The right point g^-1 y is boxed: omega puts it in frameBox(boxSize)
and the cut bounds its besselSize. The left point need not be boxed.
Use the native exists_classUnip_mul_mem_boxedPoints at c to choose
u in L such that u y is boxed. Then u g is near, witnessed by u y,
because (u g)^-1 u y = g^-1 y. It lies in X.

Let d be out of the smaller double coset L0 (u g) R0.
Write d=a u g b for a in L0,b in R0. Nearness is invariant
under those two groups by NearTerms.mul_of_mem_besselU0, so
d is near and is the fixed out of its own smaller coset.
Thus d satisfies IsNearRep. It lies in the SAME asymmetric
double coset LgR0. The preferred selection rule forces its
chosen sigma, namely g, to satisfy IsNearRep as well.
This is the precise justification for discarding non-near
representatives in the top bound. One cannot assert that
nearness is invariant under the full L: the boxing correction
and priority rule are needed.

## 3. Verify the existing open-cell estimate at its exact weighted term

For a selected near g, put a=classSize_top(termDiscNorm(g)),
nu=unipCovolume, epsilon=b^(-k^3 f).
Integral frame products imply integral termDisc; nonzero and the
CM norm formula give termDiscNorm(g)>=1. NearTerms.map_termDisc_eq_norm
and gramDiscReal_realFrameGram_ratToInf give strictly positive local
open-cell discriminants, since all frame scales are positive.
The same near witness supplies both local frame boxes and
boxSize>=b. Thus the actual OpenCellBound.open_cell applies
at every place with no independent choice of filling or W.

Retain the previously derived/audited SchurTest comparison:
    epsilon <= a,   product_v cellMass_v <= (nu a/2)^2.
For each place let t_v, A_v, m_v, n_v be the joint shift,
compact support, probability and controlling measure of open_cell.
Tensor the local inequalities for bounded scalar omega.toReal:
for fixed other coordinates first integrate one local y, then sum
its coordinate indices; integrate the remaining shift variables.
Fubini on compact products and the finite coordinate sums allow
the next one-place inequality for each component. Equivalently,
each bounded local integral operator into L2(m_v;C^(I_v x I_v))
extends by its contraction bound from L2(n_v); the tensor product
is a contraction on L2(product n_v). This is justified with the
actual kernel on bounded test functions by the native
IsL2Contraction.pi (not a claim for arbitrary marginal laws).
The resulting expectation of the full restricted integral's squared
norm is <= product n_v(univ) <= (nu a/2)^2 because omega<=1.
There is one point of product m_v outside the support null set with
norm <=nu a/2: otherwise its nonnegative squared norm exceeds
that bound a.s. and the probability integral is strictly larger.
No independent minimization of W factors or support choices.

At this SAME shift change variable y_original=g t y.
The weighted cut kernel on the whole group becomes the kernel
W_cut(g t y) tensor conjugate(W_cut(t y)) with omega(t y)=omega(y),
by U0 H invariance. Nonzero omega and the cut at t y imply
t y in frameBox(boxSize); as t fixes F, y is in that frameBox.
The other cut implies besselSize(g t y)<=b<=boxSize. The support
conclusion from open_cell therefore puts y in product A_v.
The cut integral is unchanged by restriction to this compact
product. For the full integral on that same product the expectation
bound above applies. The difference is bounded by the integral
of omega times the norm of the full-minus-cut kernel over the
whole original group, using Haar change of variable; this is one
nonnegative term of the total change-of-weight error bound
<=nu epsilon/2. Hence norm of selected weighted cut integral
<=nu(a+epsilon)/2<=nu a. The half factors come from two
separate actual inequalities; there is no sum over shifts.

This reviews the last step of the existing OPEN_CELL_CONTRACTION
note, rather than deriving new packet or analytic estimates.
It connects the exact asymmetric partition to the specific
weighted term of BlockBound.326–365.

## 4. Thin/thick split and actual link caller

For the general level j, K={g: N^f minorNorm_j(g)<termDiscNorm(g)}.
Both invariants are preserved by besselU double translation by
StableCells; hence T intersect K and T minus K are stable.
Nonzero termDisc follows on K because the right-hand side of
the comparison is positive. HasLevel then forces j=top, and
xRowsIndex_top(k)=xRowsIndex_top(k^-1)=1 (the generating row
sets coincide, including when their span has smaller rank).
Therefore classGauge_j=termDiscNorm on K; use the top bound above.

On T minus K, take absolute values termwise (summability is
already supplied). Nonzero amplitudeAbs forces both boxed
cutoffs nonzero at some point: SchurTest.amplitudeAbs_sq_le
implies the first Schur integral is nonzero, whose integrand
contains BOTH boxCutoff factors. Thus the term is near.
Its chosen smaller double-coset out is near by U0 invariance
and remains in the same stable T minus K and termsOver block
by the principal level. Every nonzero thin contribution is
therefore covered by exactly one retained double coset.
Apply ThinClasses.tsum_amplitudeAbs_class_le to each such
coset, with its actual level, termsOver and <= guard. Tonelli
or the source's nonnegative covering inequality gives the
bound by the sum over selected near reps. The equality case
belongs to this branch; no gap, overlap or use of the thick
freeness assertion at degenerate levels. If s disagrees,
AmplitudeSums.amplitudeSum_eq_zero_of_not_agrees handles the
WHOLE original sum before the split. The triangle inequality
now combines the two disjoint representative sums to yield
BlockBound.enorm_amplitudeSum_le_classSize as stated.

For CrudeEnergy.120–129, the same bound holds on every fibre
T_Lambda=T intersect link^(-1){Lambda} because link is
besselU-invariant. Absolute convergence gives the regrouping
A_T=sum_Lambda A_(T_Lambda). For any retained link set R,
expand (sum_Lambda ||A_(T_Lambda)||)^2 into ordered pairs
of link labels. Separate the diagonal on R, which gives
exactly the retained linkEnergy contribution, and bound only
the complement by the classSize majorants. These products
expand as ordered rational term pairs. Forgetting s and the
two link labels is injective on this support for fixed c,c':
each rational term determines its link; its unique finite
reduction is determined by termPosition (Setup.233–237).
Thus no extra count of links or finite residues is necessary.
This supplies the actual interface to the existing RUN80
pointwise pair bound and RUN81 geometric count. The remaining
numerical coefficient comparison and full energy replacement
are separately prepared by the active integration worker;
this review is not a replay of that replacement.

## Verification and handoff

Source-matched human argument under the native named primitive
inputs. No new Lean execution, no synthetic benchmark. Existing
helper receipt 45986308748 was reread (8 helper checks, 6 separate
original axiom probes, rejected negative control); it expressly
does not verify this replacement or the full assembly. Active
full pair caller job 45994173721 not treated as passed. Do not
confuse external formal certification with this unfinished
human reconstruction.

URT candidate: isolate the exact frame stabilizer, distinguish
the two quotients, use the same shift and partition the link
sum before taking the remaining estimates. Ordinary matrix
algebra, invariant integration and nonnegative summation supply
the justification. Rejected shortcut: normalize a nonfree
orbit or drop the asymmetric quotient, as the C2 control above
shows. No O(N) proof-search claim, no new URT premise, no
dependency deletion or reoptimization of fixed exponents.
This is a small new source-linked audit, not another full proof.

RESUME HERE: audit the exact scale-guard inequality H in
CrudeEnergy.energy_le_of_level_pairs (132–148), including
the top j/i=0 and missing-link assumptions, against the active
replacement and existing scalar proof; retain C, X and the
native fixed class/fibre witnesses. Do not repeat the orbit,
packet, thin kernel, pair or colour derivations.
HANDOFF TO integration and independent audit: sections 1–4,
especially (P) and the link-label injectivity. No shared
ledger, workflow, schedule or physics edits.
