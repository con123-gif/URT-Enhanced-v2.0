# RUN98 — Thin-class translated support and weighted fibre audit (B2)
28 November 2026. PARTIAL / independent human source audit; no fresh Lean replay.
Resumes RUN97 (65eab77ab9f244c7d838aea5f66c5817dfc68556), not a new root.
Read current mission 3adc76221a978016e3505cdf3e36ad688354d7d7, live
spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, compact manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (relevant B2 sections),
SWARM_PROTOCOL, HANDOFF_QUEUE, expansion, AGENTS, continuity, physical
state/protocol/log excerpts. Binding amendment 99cfbd1f04c3a4c6d02c21a8fde207f2121aef20
read from commit diff. Latest peer metadata through c6f0722dc05636608c8a39449338e1c5cf7a0c8d
inspected; physical CI 46104879446 is not RH evidence.
Preferred existing derivation: integration/2026-11-26_COMPACT_THIN_CLASS_VOLUME_KERNEL.md
(blob 06f07be1986616e2068cfa1bdb5641e075da450b), V8–V9. Reuse its
V1–V7 (RUN97 audit), and integration/2026-11-26_COMPACT_BOXED_FRAME_SEPARATION.md
(blob f2a4604d3c726ce83e7a9984b3848ece83b76320), B1–B6. This note
audits the actual caller and isolates a single pointwise bound instead of
selecting an auxiliary shift function on the entire integration space.

## Native anchors and premises
Alpöge–Sernau and collaborators, lsernau/grh-lean@
72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/Filling/ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5,
  terms_of_class_spec 25–39, tsum_schurIntegral_le 48–123, specifically
  54–107; do not claim the final scalar comparison 108–123 audited here.
- New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea,
  boxCutoff / schurWeight / schurIntegral 103–115,
  measurability 125–129, lintegral_boxCutoff_le_of_average 145–169.
- New/RealPlace/VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0,
  col_eq_zero_of_norm_lt_one 63–68, exists_frameImage_toRows₂_eq_add
  83–122, frameVolume_mul_left 154–157, exists_kernel_frameVolume_le
  160–235 and frameX₀Part_unipotentOf_inv_mul (following declaration).
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
  xRowsIndex 339–342, frameVector_sub_eq_sum 443–447,
  tsum_classCutoff_eq_one 507–508, tsum_classCutoff_box_le 513–556.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  size guards 50–58, basisScale and basisScale_besselFrame,
  classCutoff 356–358.
Keep native StablyUnram E, CMType E, same admissible S, SAME term over
(c,s,c'), level j, fixed double coset D, rational terms, fixed u in U0
at each place, boxed y. Write h=varrho, n=h+1, m=min(h,j), f=#infinite
places, k=|kappa| (shape rank), b>=1000, k<=b, g>0, tau=b^(kf/4).
Use the actual lattice-index positivity, same-Z normal-form,
cutoff and Haar premises; no arbitrary finite subset of terms in
place of D. All nonnegative sums/integrals below are ENNReal.

## 1. One colour and the exact translated coordinate
Let X be the open unit ball in the native entrywise maximum norm on
the product of complex k-by-m matrix spaces. It is the product of
unit discs, of measure pi^(fkm)>=1 (empty dimension has mass one).
Let U(x)_v=unipotentOf(incl (x_v R_v)^*,0),
R_v=diag(pi g/(b alpha_(v,i))) for i<m, alpha the actual real
nonzero frame scale. All U(x) are in U0.

Write F(Y)=sum_(p in D) schurWeight(c',p,Y). For t in classUnip0(c),
F(tY)=F(Y): p -> t^-1 p permutes D and
p^-1 tY=(t^-1 p)^-1Y; frameVolume(tY)=frameVolume(Y).
The archimedean rational embedding is understood here and below.
Measurability follows from the native measurable weights and
countability of rational terms. Use SchurTest.145–169 as the
existing averaging supplier, with the same cutoff and covolume.
It suffices to bound integral_X F(u U(x)y) uniformly in u,y.

By ThinClasses.25–39, all p have the SAME Z, level and residue.
Use the conjugate full row lattice M and its selected-row
sublattice M0 in the finite chart. The differences of the k+1
middle-column labels lie in gM; colour by their class mod gM0,
relative to one fixed term. The number of possible colours is
at most [gM:gM0]^(k+1)=I_gamma^(k+1), where I_gamma=xRowsIndex.
The index is finite and positive by the actual level hypothesis.
Keep all k+1 coordinates, not just k X0 rows in the raw chart.

Fix a nonempty colour B and p0 in B. RUN96 supplies for each p
a rational k-by-m l_p, class integral C l_p (finite chart
C=classCoordX0(c)), and
    (frameImage p - frameImage p0).toRows2
                = [[g l_p xi; 0]; 0],
where xi is the selected m rows of the common raw Gram.
No uniqueness of this witness is required. Define
    L(l)_v=(b/pi) Phi_v(l).
Fix K_v by RUN97 using y_v, R_v, common real leading Gram z_v,
and V_v=frameX0Part(u_v^-1 p0_v) restricted to the first j columns.
It is important that K_v is chosen before p, l_p or x.

The actual coordinate in K is A=x+L(l_p), not x-L(l_p).
Indeed the inverse unipotent identity in VolumeKernel gives
X0((unipotentOf(q))^-1 gamma)=X0(gamma)+q_1^* xRows(Z).
Thus inverse U(x) adds x R times the selected real Gram rows.
The shift from p0 to p contributes L(l_p) R times those rows:
    (L(l_p)_v R_v)_[a,i]=g Phi_v(l_[a,i])/alpha_(v,i),
    Z_real[i,b]=alpha_(v,i) alpha_(v,b) Phi_v(Z_raw[i,b]).
Their product is exactly the normalized middle difference
g sum_i Phi_v(l_[a,i] Z_raw[i,b]) alpha_(v,b).
The fixed inverse u contributes the same term to p and p0
since their real Gram is identical. Hence with
gamma'=(u_v U(x)_v)^-1 p_v, the native affine premise is
    X0(gamma')_first j=V_v+(x_v+L(l_p)_v) R_v e^* z_v.
Use the native left-U0 level/Gram transport; numerator volume
is invariant and gamma'^-1 y_v=p_v^-1 u_v U(x)_v y_v.
This verifies the shift and its normalization at 100–107.

Now translate each integration variable by a=x+L(l_p).
Lebesgue measure is unchanged; the indicator becomes
1_X(a-L(l_p)), i.e. the translated support X+L(l_p).
For a fixed a put Y_p=u U(a-L(l_p))y and
    w_p(a)=1_X(a-L(l_p)) boxCutoff(c',p^-1 Y_p).
The translated Schur summand is bounded by
    w_p(a) K(a),    K(a)=prod_v K_v(a_v).                (98.1)
The common K is independent of p even though Y_p need not
be. Nonnegative Tonelli may move the countable sum through the
integral before any finiteness estimate.

## 2. Unique active shift and a single pointwise packing bound
Suppose w_p(a),w_q(a) are both nonzero. The two indicators
force a-L(l_p), a-L(l_q) in X, so at every v and entry
    |Phi_v((l_p-l_q)_[r,i])| < 2 pi/b.
The squared norm of each column is strictly below
    k(2 pi/b)^2 <= 64/b < 1,                            (98.2)
using pi<=4, k<=b, b>=1000. When m=0 the difference is
the empty matrix, so the conclusion is immediate. The difference
C(l_p-l_q) is integral, and VolumeKernel.col_eq_zero_of_norm_lt_one
applies to EACH column at ALL infinite places. Therefore l_p=l_q.

Thus for each a with nonempty active support there is exactly
ONE shift value l shared by all active p; otherwise the sum
is zero. This is the structural reduction: choose a reference
only inside that pointwise nonempty support, not a measurable
global selector q(a). The bound below is uniform, so no
measurability of such choices is needed. This replaces the
explanatory choose-q step, not a claimed native dependency deletion.

For fixed a and its common active l put Y=u U(a-L(l))y.
Apply BoxPartition.tsum_classCutoff_box_le to the supported
subtype of B with labels k_p=c', delta_p=p, gamma_p=p,
and BOTH of its y,y' set to Y, x=1. The native hypotheses:
- labels (c',p) injective; all p lie over the same (c,s,c');
- delta_p^-1 gamma_p=1 is in classUnip(c');
- nonzero boxCutoff supplies p^-1 Y boxed;
- w_p(a)<=classCutoff(c',p^-1 Y).
For equal l, RUN96 gives exact equality of all frame rows
below the isotropic e-block (not merely equality of Gram).
FrameVector_sub_eq_sum 443–447 expresses their normalized
frame difference as a linear combination of the h fixed
vectors frameVector(Y_v,a) with a<h, separately in each of
n frame columns and f infinite places. Use the actual image
of this real-linear coefficient map, not a subspace chosen
separately for each pair. Its real dimension d<=2fhn.
Therefore
    sum_p w_p(a) <= b^(6 n^2 d)
                  <= b^(12 f n^4) <= tau.              (98.3)
The last inequality uses the native pow_le_tailScale as at
ThinClasses.97; alternatively k>=n^7 and n>=100001 imply
48 n^4<=k and b>=1. Equal-frame fibres are not counted
unweighted: the retained BoxPartition theorem uses the exact
classCutoff partition identity and the same labels. This also
covers infinite supports.

Multiply (98.3) by K(a), integrate (98.1), and use Tonelli:
    integral_X sum_(p in B) schurWeight(c',p,u U(x)y)
       <= integral (K(a) sum_(p in B) w_p(a))
       <= tau prod_v integral K_v.                     (98.4)
This is the single pointwise domination underlying native
78–107; no separate integration over the possibly infinite set
of shifts is needed. Each K_v has the uniform bound J_v in V7
(independent of the representative of B, though K_v itself
depends on that representative). Sum the finite colours, then
apply the actual averaging lemma to get
    sum_(p in D) schurIntegral(c,c',p)
       <= nu d_B I_gamma^(k+1) tau prod_v J_v.          (98.5)
Here d_B=card BesselCoord, nu=unipCovolume. This verifies
V9 as a bound with J_v, not a single universal K across all
colours. There is no division by volume(X): the native averaging
uses volume(X)>=1 in the direction of an upper bound. The
remaining scalar conversion of J_v to the original V11 bound
is 108–123 and remains for its own audit; do not mark it closed.

## 3. Rejected routes and verification
- Wrong sign A=x-L: inverse unipotent adds q_1^* xRows, so
  substitution must be x=a-L, not x=a+L.
- Divide by the complex scale modulus: the real alpha can have
  either sign; R and L R retain alpha, not |alpha|.
- Replace k+1 quotient labels by k: the finite middle lattice
  includes the z coordinate; no such reduction follows.
- Use distinct rational shifts as proof of disjoint supports:
  without integral rigidity, shifts 0 and 1/2 in C overlap.
- Use <=1 instead of <1 for integral norm vanishing, or use only
  one archimedean place: 1 disproves the former, a nontrivial
  quadratic unit can be small at one place and large at another.
- Count terms in an equal-shift fibre: the theorem bounds cutoff
  weights and allows infinitely many labels; only distinct frames
  have the packing cardinal bound.
- Take all real matrix coefficients to be independent or assume
  V is a different subspace for each pair: use a single fixed
  linear image for each a, with dimension at most its domain.
- Integrate K chosen after p or extend K uniformly across
  different colours: the common kernel is only within one
  colour; the common numerical upper bound J_v is sufficient.

Actual verification: retrieved pinned native statements and bodies,
read existing human proofs and prior audit, checked algebraic shift,
strict all-place integrality argument, support dimension, label
injection and nonnegative Tonelli by hand. No fresh Lean build,
rh_scan/prune/auto, computational benchmark or claim of removed
native proof-term edge. Existing eleven-declaration/eight-root
B2 replay is separate evidence. URT structural grouping identifies
one active shift at a time; conventional algebra, measure theory,
and the retained native suppliers justify the bound. B2/full RH
human assembly remains OPEN.

RESUME HERE: independently audit ThinClasses.tsum_schurIntegral_le
108–123, using V10–V11 and (98.5); in particular the full-level
normalization by N and the retained extra tailScale, before auditing
the opposite-Schur-weight consumer at 131–149.
HANDOFF TO integration/audit: retain V8 and V9 as preferred; use
(98.1)–(98.5) to clarify support uniqueness, exact shift sign and
uniformity, no new root closure.
