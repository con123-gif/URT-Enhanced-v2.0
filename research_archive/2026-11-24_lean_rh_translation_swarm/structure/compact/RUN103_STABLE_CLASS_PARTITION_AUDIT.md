# RUN103 — One common class sum from the thin/thick partition
28 November 2026. PARTIAL / independent human source-matched audit of
BlockBound.enorm_amplitudeSum_le_classSize, not fresh Lean replay.
Resume RUN102 6e0d0dba4388c8d5942ce4ecf440c428a40c1f33, reusing RUN100
a6ccfe572f74db859eae928aead1ce2668a76ac8 and RUN101
0dfa25553d68d9eebf868a0079da6b7651012757. Credit Alpöge, Sernau and collaborators.

Preflight: latest mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (especially 832–834), root
AGENTS, handoff, expansion, swarm protocol and exact allocation amendment
99cfbd1f04c3a4c6d02c21a8fde207f2121aef20 inspected, plus physical
state/log/protocol/continuity excerpts. RUN103 commit search empty.
Physical CI 46128151625 is not RH replay. The accepted joint B2 caller
module is distinct from this human audit; integration/2026-11-27_ACTIVE_B2_CALLER_WORK.md
and live B2 ledger retain its receipts and outstanding primitive scopes.

## Pinned native interface
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
- New/Filling/BlockBound.lean, 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
  304–363 (thick supplier), 368–394 (actual target).
- New/Filling/ThinClasses.lean, 6ae40a38e407331b9954067c833c34a62277b2e5,
  25–31 (class transport), 131–149 (thin supplier).
- New/Filling/BoxPartition.lean, 53f11966247a892d94cf688e8b366e887a92f641,
  339–342 (xRowsIndex), 359–371 (minorNorm, classGauge, IsNearRep),
  401–405 (minor positivity/inversion).
- New/Filling/CrudeBoundDefs.lean, 0ba0d2532b14c414b9032466b79e10d4d60c3d18,
  92–93 (HasLevel), 102–111 (termDiscNorm, boxedPoints, IsNear).
- New/Filling/StableCells.lean, 236a41919b3697e1e30c4be840140f6452642599,
  57–67 (discriminant and level stability).
- New/Filling/Setup.lean, 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  233–244 (termPosition, termsOver, class groups), 366–370 (amplitudes),
  395–400 (Agrees, IsStable).
- New/Filling/SchurTest.lean, bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea,
  30–32 (exact sum splitting), 103–115 (boxed weights), 131–140 (Schur).
- New/Filling/NearTerms.lean, bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
  268–270 (near stability under frame-fixing group).
- New/Filling/AmplitudeSums.lean, 832e25af346bbbbdabdbec205b0e7f833170e0a1,
  110–111 (summability for any T), 192–194 (nonagreeing cancellation).
- New/Filling/CrudeEnergy.lean, da67bf862a4c5e72ab6a81a7dfb462545cd8833f,
  118–128 (actual common link caller).

Retain CM field E, StablyUnram E, admissible S, cut side, stable T,
one fixed j in Fin(varrho+2) with HasLevel j on all T, fixed c,s,c'.
Write f=#infinite places, nu=unipCovolume, X=termsOver(c,s,c'),
D(gamma)=termDiscNorm(gamma), H(gamma)=N^f minorNorm_j(gamma),
i(k)=xRowsIndex_j(k), k=termPosition(c,c',gamma). Let r(gamma) be the
actual DoubleCoset.out for the two frame-fixing class subgroups,
not a newly chosen representative. Put
 G_j(gamma)=max(D(gamma),H(gamma))/(i(k)i(k^-1)),
 w_j(gamma)=ofReal(nu classSize_j(G_j(gamma))).
These are exactly native classGauge and the desired nonnegative summand.

## 1. Stable partition, including the equality boundary
K={gamma:H(gamma)<D(gamma)} is the THICK subset, not thin.
T_-=T minus K is thin and includes equality; T_+=T intersect K is thick.
Both are stable: the leading-minor and frame-disc identities under
u^-1 gamma u' preserve D and H, because the norms and scaling N are fixed.
In particular both branches inherit the same HasLevel j.
If Agrees(s) fails, the full sum vanishes by the native cancellation
theorem and the desired index subtype is empty. Hence assume Agrees(s).
Use the native summability for arbitrary subsets to split the vector sum:
 A_T=A_{T_-}+A_{T_+}.
No positivity of vector amplitudes or a priori finiteness of the
representative-weight sums is needed.

## 2. Thin branch: exact grouping on the nonzero support
Set R_-={delta in T_- intersect X: IsNearRep(c,c',delta)}.
The map gamma -> r(gamma) sends every gamma in T_- intersect X with
amplitudeAbs(gamma)>0 into R_-:
- For the same double coset, r(gamma)=a gamma b with a,b in the indicated
  frame-fixing arithmetic class groups. Thus stable T_-, level and
  termsOver membership transport by the native group facts.
- Nonzero absolute amplitude implies nonzero schurIntegral(c,c',gamma):
  otherwise amplitudeAbs^2 <= schurIntegral * reverseSchurIntegral = 0,
  using ENNReal zero multiplication even if the reverse integral is infinite.
  Nonzero nonnegative integral implies some y with nonzero integrand.
  The two boxed cutoff factors in SchurTest.103–115 must then be nonzero;
  hence y and (ratToInf gamma)^-1 y are boxed, i.e. IsNear(gamma).
  NearTerms.268 transports this witness under the same frame-fixing a,b.
  By quotient.out_eq the representative of r(gamma) is itself.
- Distinct delta in R_- have disjoint double cosets: if they met,
  their quotient labels, and therefore their fixed out values, coincide.
  Conversely every member of such a double coset remains in T_- intersect X.

Thus, for nonnegative extended-real absolute amplitudes, the exact fibre
identity (zero terms discarded) is
 sum_{gamma in T_- intersect X} amplitudeAbs(gamma)
 = sum_{delta in R_-} sum_{gamma in C(delta)} amplitudeAbs(gamma).
This follows either by the nonnegative fibre-sum theorem or by taking
suprema over finite sums; no finite coset or finite representative-set
hypothesis is required. One may instead use the weaker covering inequality
as in the native proof. Use triangle inequality for the summable vector
amplitudes and the individual norm bound, then RUN100/native
tsum_amplitudeAbs_class_le at EACH delta:
 ||A_{T_-}||_e <= sum_{delta in R_-} w_j(delta).
Its thin premise D(delta)<=H(delta) is exactly membership in T_-.
No invariance of amplitudeAbs or of the gauge within a coset is assumed.

## 3. Thick branch: exact common-gauge identification
For gamma in T_+, H(gamma)>=0 and D(gamma)>H(gamma), hence D(gamma)>0.
If termDisc were zero its product norm would be zero, contradiction.
HasLevel then gives varrho<j; since j in Fin(varrho+2), j=top=varrho+1.
At top every a in Fin(varrho) satisfies a<j: IndexBelow j is the whole
row index set up to the canonical equivalence. Therefore BOTH modules in
xRowsIndex_j(k) are the same column lattice, their relative index is 1,
for every k, and also for k^-1. No full-rank hypothesis is required for
the index of a module in itself. The strict thick inequality fixes the
maximum. Consequently
        G_j(gamma) = max(D(gamma),H(gamma))/(1*1)
                   = D(gamma),       j=top.              (103.1)
Thus the top-level summand in RUN101–102/native
enorm_amplitudeSum_le_classSize_top is literally w_j(gamma), not
merely a bound involving monotonicity of classSize. The thick supplier
requires stable T_+ and nonzero termDisc on all T_+, established above.
Its indicator sum is the sum on
 R_+={gamma in T_+ intersect X: IsNearRep(c,c',gamma)}.
So ||A_{T_+}||_e <= sum_{R_+} w_j. If T_+ is empty, both are zero;
there is no inference j=top for an empty thick branch.

## 4. Single common sum and exact caller
R_- and R_+ are disjoint and their union is exactly
 R={gamma in T intersect X: Agrees(s) and IsNearRep(c,c',gamma)}
in the agreeing case. Combining (1)–(3) proves
        ||A_T||_e <= sum_{gamma in R} w_j(gamma).        (103.2)
The only two quantitative class estimates used are the existing thin
and thick estimates at their actual respective inputs. This makes the
human assembly a partition of one sum, not two separately optimized
scales. No extra factor 2 is paid. The nonagreeing case has already
been proved. At CrudeEnergy.118–119 the actual T is T intersect
link^-1{Lambda}; stability follows from link_besselU_mul and hT, while
level inherits from the original T. Hence (103.2) is usable with the
same Lambda, c,s,c' without moving the link or level.

## Rejected shortcuts / proof boundaries
- Reverse K or discard D=H: loses the exact thin premise.
- Infer j=top globally from the possibility of a thick term.
- Assume xRowsIndex=1 at all levels, or invoke full rank for self-index.
- Use an arbitrary near representative instead of the fixed quotient.out.
- Assume near is stable under the larger besselU, not the frame-fixing subgroup.
- Infer near directly from nonzero unboxed cutoff: the boxed Schur
  integral is the needed witness.
- Bound vector sum by rearranging without the native summability.
- Multiply a thin class bound by orbit size: the fibre is already summed.
- Claim the accepted B2 pair/energy caller receipt verifies this new human
  rearrangement, or that the partition proves the primitive suppliers.

Verification: inspected all pinned native anchors above; the exact
fibre identity and equality (103.1) were independently derived using
ordinary quotient/set theory and nonnegative summation. No new Lean
execution, no benchmark or global dependency deletion. The native proof
uses a covering inequality, while the exact disjoint-fibre identity is a
human alternative with identical retained premises. Existing
quantitative B1/B2 suppliers and all kernel replay/graph obligations
remain separate. No claim of full proof.

RESUME HERE: inspect the quantitative packet-to-classSize comparison
in SchurTest.IsNear.le_classSize_and_cellMass_le (72–99), comparing
the exact existing peer derivations first, and audit its scalar
normalization at the RUN102 thick caller rather than redoing the
open-cell construction itself. HANDOFF TO integration/audit: use
(103.1) and (103.2) as the common class-sum junction; no extra
multiplicity, factor 2, or assumption on gauge invariance is necessary.
