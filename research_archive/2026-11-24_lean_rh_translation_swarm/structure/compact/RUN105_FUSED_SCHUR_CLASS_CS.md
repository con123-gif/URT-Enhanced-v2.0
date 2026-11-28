# RUN105 — Fuse both Schur Cauchy steps on the actual thin class
28 November 2026. PARTIAL / source-matched human replacement at B2.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Source:
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: live mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 1c4608f2190154fd4bc4b38fc77db10ec5e60e64, ledger
579ecc1cafdb28eae7d1c97565700c571dfa7484, manuscript
619ae01be98c32e053eef1c8bcd44ccddd0664e7 (398–405, 834),
SWARM_PROTOCOL, AGENTS, HANDOFF_QUEUE, expansion, state/log/protocol
and continuity consulted. Binding amendment at 99cfbd1f04c3a4c6d02c21a8fde207f2121aef20
retrieved. Latest peers cd51ee6f, 3207b107, 569bbe26, f678ea4a,
6cb0935a and bd496d07 concern other suppliers. Physical CI
46137339894 is not RH replay evidence. RUN104 resume asks for
SchurTest.amplitudeAbs_sq_le; RUN100 section 2 already derives the
two-step Cauchy estimate, as does the integrated V12
(06f07be1986616e2068cfa1bdb5641e075da450b). Do NOT redo V12 scalar
normalization. Instead, fuse its TWO Cauchy inequalities into one
on the class times the actual infinite-place group, explicitly
certify the finite pointwise factors, and identify the exact
hypothesis enabling the fusion.

## 1. Actual anchors and retained data

- New/Filling/SchurTest.lean bcb1fd28783bdeb4d0e3c7d83559d0ef99cecdea,
  lines 103–115 (boxed cutoff, Schur weight, integral),
  121–129 (cut support and measurability), 131–140 (local square),
  145–169 (averaging, retained).
- New/Filling/ThinClasses.lean 6ae40a38e407331b9954067c833c34a62277b2e5,
  lines 48–51 (finite Schur budget), 131–149 (actual thin caller;
  especially 140–146, the second Cauchy and inverse class).
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
  252–254 (box partition support), 257–264 (tensor product),
  328 (countability), 343–345 (nonnegative subgroup cutoff),
  356–367 (class cutoff and absolute amplitude).
- New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641,
  453–454 (chosen box partition), 507–508 (class cutoff sum one),
  563–564 (measurability).
- New/Filling/AmplitudeSums.lean 832e25af346bbbbdabdbec205b0e7f833170e0a1,
  64–69 and 108–111 (absolute convergence, not needed as a premise
  for the fused nonnegative estimate).

Retain SAME admissible S, StablyUnram E, level j of gamma, hk over
(c,s,c'), Side.cut and thin inequality termDiscNorm <= N^f minorNorm.
Write X=L gamma H with L=classUnip0 c, H=classUnip0 c'; Y the actual
product infinite-place group, mu its Haar measure. X is countable by
Setup.328, use counting measure on its discrete measurable space.
For delta in X set z=ratToInf(delta)^(-1)y. Put
  a=boxCutoff_c(y), d=boxCutoff_c'(z),
  U=prod_v ||W_v^cut(y_v)||, V=prod_v ||W_v^cut(z_v)||,
  r=prod_v (frameVolume(y_v)/frameVolume(z_v))^(k+n).
Every frame volume is finite strictly positive (native frameVolume_pos)
and hence r is finite positive. Tensor norm = UV by the Euclidean
product-coordinate definition, distributing the finite sums of squares.

## 2. Pointwise identity with no extended-real indeterminacy

The class cutoff sum over classUnip is 1 at every y
(BoxPartition.507). Its identity summand is classCutoff_c(y);
nonnegativity gives 0 <= classCutoff_c(y) <= 1, hence finite.
The boxed cutoff is bounded by the same 1. This explicit observation
removes any need to divide extended-real cutoffs or to infer their
finiteness from an integral. The local W norms are finite.
If UV>0, SchurTest.121–123 supplies InCut for both y and z
at EVERY place. If also both original cutoffs are nonzero,
the chosen box partition has nonzero value at each point (Setup.356),
so Setup.252–254 puts each point in its box. Thus the two original
cutoffs agree there with a,d. Otherwise either UV or an original
cutoff is zero; both absolute integrands vanish because the boxed
cutoff is at most the original. This proves, everywhere, not merely
on a presumed full-measure support,
  J(delta,y) = original cutoff product * tensor norm = a d U V.

Define two nonnegative *real-valued* measurable functions on X x Y:
  p(delta,y) = a d U^2 r,
  q(delta,y) = a d V^2 / r.
(Use toReal only on the already finite nonnegative cutoff factors;
all other factors are ordinary reals.) Direct multiplication gives
  J^2=p q,   J=sqrt(p) sqrt(q).                      (105.1)
If only one W vanishes, p or q can remain positive; no equality
of their individual supports is asserted. No inversion of a or d,
no division by a W norm, and no need for r to be bounded globally.
Haar left translation z=ratToInf(delta)^(-1)y transports q to the
native opposite Schur integral with c,c' exchanged and delta inverted.
The factor r becomes its reciprocal because the argument of the
opposite weight is ratToInf(delta^-1)^(-1)z=y. Hence
  int_Y p(delta,y) dmu = P_delta = SchurIntegral(c,c',delta),
  int_Y q(delta,y) dmu = Q_delta = SchurIntegral(c',c,delta^-1).
For a single delta, (105.1) gives the native local square via
Cauchy-Schwarz; if a Schur integral is zero then the corresponding
function is zero a.e., and so is J. If one is infinite and the other
nonzero the ENNReal bound is automatic. If both are finite use L2.
This covers the 0 * infinity convention without using infinity
as a real number or cancelling it.

## 3. One Cauchy inequality replaces the nested pair

By the existing RUN99 native Schur bounds, the full class sums
P=sum_X P_delta <= B+, Q=sum_X Q_delta <= B- are finite, where
  B±=nu d_B tau² (b^4 g)^(-m k f) (I±/sqrt(D))^(k+1),
with exactly RUN100 notation (D>0, m=min(h,j), I± the two index
values). For Q use the bijection X -> H gamma^-1 L by inversion,
hk.inv, h.inv, D(gamma^-1)=D(gamma), and inverse termPosition.
No equality of the two indices is required.

Measurability on the product follows from the countable discrete X,
the measurable cutoff and the native measurable W and frame volume.
Tonelli for nonnegative functions on counting x Haar gives
  int_(X x Y) p = P,  int_(X x Y) q = Q,
  int_(X x Y) J = sum_X amplitudeAbs(c,c',delta).
Alternatively use the disjoint union measure, with the same identities.
The first two finite integrals imply sqrt(p), sqrt(q) belong to L2
on that very measure space. Apply ordinary integral Cauchy-Schwarz
ONCE, with (105.1):
  sum_X amplitudeAbs
     = int_(X x Y) sqrt(p) sqrt(q)
     <= sqrt(P Q) <= sqrt(B+ B-).                    (105.2)
No separate per-term square inequality or second discrete Cauchy
application is needed at THIS caller, and no prior amplitude
summability assumption is needed. If P or Q=0 the same L2 proof
gives zero (do not normalize by P or Q).
Equation (105.2) is exactly RUN100 (100.1) and integrated V12.
Reuse RUN100 (100.2)–(100.5) unchanged to get the actual classSize
bound at ThinClasses.131–149 and its BlockBound consumer.

For clarity about the improvement: the native source first invokes
amplitudeAbs_sq_le inside sq_lintegral_le for counting measure.
The fused proof replaces this local two-layer CS invocation with
one product-space L2 inequality and explicit factorization, not a
claim to reduce the already-established constants or the full kernel
DAG. The native local lemma remains valid and need not be deleted.
Any replacement in Lean requires a complete original-statement
bridge, countable product-measure / Tonelli API checks, and an
actual caller and axiom audit. The ordinary two-step proof may
still be the smaller native proof term; no benchmark was run.

## Rejected routes and status

- Applying to full W: the cut-support-to-box implication is essential.
- Globally setting classCutoff=boxCutoff, or demanding p,q have
  identical supports: neither follows; only the product is needed.
- Taking toReal before proving finiteness: ENNReal.toReal(infty)=0.
  The identity summand of the native cutoff partition supplies the
  missing pointwise guard, independent of the Schur integral budget.
- Applying L2 before the two total Schur budgets are available:
  square integrability on X x Y is then not justified.
- Swapping gamma without inverting the double class and exchanging
  c,c': wrong measure transport and wrong index.
- Cancelling sums or assuming amplitude summability to justify
  Tonelli: unnecessary; use nonnegative integration first.
- Claiming global elimination of amplitudeAbs_sq_le or O(N) proof
  search: caller and native graph evidence absent.

Verification actually performed: exact pinned source read, comparison
against RUN100 and integrated V12, independent pointwise algebra,
zero/infinity branch check, countable disintegration and L2 derivation.
No Lean replay or numerical benchmark. This is a source-matched
human simplification under retained suppliers; all B2/root audit
and replay obligations remain. URT grouping suggested fusing the
two summation/integration axes; ordinary measure theory proves it.

RESUME HERE: audit the actual subgroup cutoff averaging transport
SchurTest.lintegral_boxCutoff_le_of_average, lines 145–169, with the
precise chosen subgroup cutoff and right Haar translation. Reuse
HUMAN_PROOF_COMPACT.md 405 and RUN98; focus on the quotient cutoff
mass and exact reindexing, not the already audited scalar budgets.
HANDOFF TO integration/audit: (105.1)–(105.2) is an optional shorter
human thin-class junction; preserve RUN100 constants and all native
primitive obligations. No change to schedules or protected files.
