# RUN81 — exact geometric colouring interface and representative uniqueness

27 November 2026. B2 independent source-matched human REVIEW; conditional on
the named primitive inputs. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
External formal certification is distinct from our incomplete reconstruction.

Preflight: latest mission 3adc76221a978016e3505cdf3e36ad688354d7d7,
spine 67e542df1b5557b2e1314643931ef1355bbdc50d,
ledger 073d86374ebc415e217a2732814dde7b0f3dfb9d; binding allocation
99cfbd1f, HUMAN_PROOF_COMPACT, SWARM_PROTOCOL, handoff, AGENTS and continuity.
Read integration bc88529e262b8795a836727ffd920ef9e1d6e1f3 (link pair caller),
26-Nov weighted count and lattice saturation notes, RUN73/74/75, and
latest peer 2cb538476dd3d03e3f3a63ad774b4957de48fd37 (class-witness distinction),
a62382a86087c9b58b704d0ba1d9889563917379 (outer divisor and replay).
Do not duplicate their pair-weight assembly. This note addresses their
specific outstanding geometric colour primitive, including the labelled
representative uniqueness and the two actual finite colour sizes.

Source blobs: BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
130–216; VolumeKernel.lean fc115f79a99192fc8ea0e72c2caa0bf2546b5cf0,
17–48, 55–122; NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
136–145, 194–200, 252–266, 295–317; BoxPartition.lean
53f11966247a892d94cf688e8b366e887a92f641, 313–395;
Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727, 22–58.
Actual consumer: sum_pairWeight_le -> energy_le_of_level_pairs ->
energy_le_of_linkEnergy_le -> energy_fixingSet_le ->
Fits.exists_translate_finrank_comap_le -> ramifiedColumns_fill_rows.

## 1. The denominator and the precise first colour

Fix one native admissible filling S, level j, left class c, subgroup label
t, and A subset of IsLabelledTerm(j,c,t). Let T be the actual rational X0
subspace, k=dim X0, n=rho+1, f=numInfPlaces(E), l=k-dim T <= s, and
w(p) the supplied natural-valued weight denominator (not n). Retain
StablyUnram E, the term witnesses, level/near hypotheses, and
frameValueIndex(c,termElem(c,p),g,T) | w(p).

Partition by the EXACT rational Gram Z=frameProducts(p.2). In one nonempty
part choose p0; set Y=paddedLeading(j,Z), Delta=det Y nonzero, P=xRows Z,
M=q0^(n^4), a=M g Delta bar(Delta) (viewed also as its principal finite
idele). All entries of Z and Y are algebraic integers (NearTerms.315–317);
a is nonzero, integral and self-adjoint. Let R=Ohat_E and define
B=colLattice(P*), t0=g^-1 Y^-1, K=gB + preimageLattice(t0*).
Here * is conjugate transpose, and preimage means {v : t0* v integral}.
The actual BlockBound 213–215 inclusion follows without valuation splitting:

    t0* (a v) = M Delta adj(Y*) v  in R^n, for v in R^n.

So a R^n <= K. Merely replacing preimageLattice by colLattice(t0*) would
not give the same condition. First colour input is the INTEGRAL matrix
F_p=frameMiddle(termElem c p)* of shape n x (k+1). Its primitive m is
latMiddle times the class-coordinate image of sublatticeBasis(T);
it has shape (k+1) x (k-l). The primitive left inverse is from
sublatticeBasis and the integral unimodular latMiddle, not from an
arbitrary rational basis of T. The column lattice F_p m is precisely the
one in frameValueIndex, and gB is contained in K, so
[F_p m R^(k-l) : intersection with K] divides the corresponding index
modulo gB, hence divides w(p). The first quotient is finite because
aR^n<=K and F_p m is integral. Zero w has weight zero by native ofReal
inverse convention; no division by a zero index. The VolumeKernel
weighted-colour lemma takes sigma=n, tau=k-l, complement l+1 and
exponent k. Its multiplier is exactly I^(n(n+l+1)), I=genIndex(a).

## 2. Audit the second colour and the final equality of terms

A nonempty subset of the fixed-Z part with pairwise columns of F_p
congruent mod K has a chosen p1. The congruence condition is exactly
the hypothesis of HasLevel.exists_frameImage_toRows2_eq_add, with q=id.
Use RUN75 M1–M5, not a new projection: the primitive left inverse gives
the integral projector onto the class X0 inclusion, rational density
gives one simultaneous rational lift, and the late/top columns vanish by
the all-conjugate integral-norm test. Thus choose u_p in classUnip0(c)
aligning the lower rows of u_p p.2 to p1.2. Its finite term position is
still integral and has the SAME reduction as p because u_p is in the
principal level. No simultaneous condition on the different right classes
is being imposed.

Second colour: the first rho rows of the integral frameImage of this
corrected finite term position, modulo aR. There are at most I^(rho*n)
colours (rho*n entries). Equal colours imply the rational upper difference
xi is aX with integral X: frameImage_termPosition and
classCoord_eq_fromBlocks identify the unchanged top chart; injectivity of
the rational-to-finite embedding gives the rational integrality. The lower
rows are already equal. RUN73's Gram subtraction gives X*P=-P*X; its
shared-vector estimate, applied to both actual near terms at every
infinite place, gives X adj(Y) zero in columns >=j. In detail the
integral entry g Delta bar(Delta) (X adj(Y))_ab has absolute value <1
at every embedding, because xi adj(Y)=M times this entry, and each of
the two corrected frame terms contributes <M/2 (BlockBound 93–125).
The product norm gives zero, then cancel g Delta bar(Delta).
The exact RUN73 skew correction is integral with no division by 2,
and its action changes the upper rows by xi. The two corrected
rational frames are now equal.

The last step must identify labelled terms, NOT just frames. Here is
VolumeKernel 70–81 with its original quantifiers:
let gamma1=u p.2, gamma2=u' p'.2, both u,u' in classUnip0(c).
Their term positions k1,k2 use possibly DIFFERENT right classes d,d'.
Their finite reductions s1,s2 have the same given label t. Equality of
rational frames implies equality of finite frames, since both use the
same left factor classCoord(c) (NearTerms.259–260). Thus k2^-1 k1
fixes the whole standard frame, hence belongs to besselS by the native
frame criterion (NearTerms.275–279); it is integral because k1,k2 are.
Its reduction s2^-1 s1 belongs to reducedImage besselS. The two
reductions have equal quotient component and equal t component under
groupEquivQuotientProdSubgroup, so s1=s2. This does NOT require s1=s2
in the first colour, nor does it assume right-class uniqueness.

Now the rational quotient gamma2^-1 gamma1 fixes the frame and its
finite term position (with left class d' and right class d) is k2^-1 k1
in principalLevel. NearTerms.eq_and_mem_classUnip_of_besselS gives
d'=d, and the quotient belongs to classUnip(d); fixing the frame
upgrades to classUnip0(d), exactly termsOver.eq_and_mem_classUnip0.
The retained primitive is freeness of the native columnLevel
(Setup.25), used in NearTerms.136–145, plus its native level containment.
One can see its role by projecting the Bessel group to the definite
Levi: the principal-level condition forces equal class representatives;
the residual rational Levi lies in the corresponding class automorphism
group, which is trivial. This is not a freeness assertion for arbitrary
unitary lattices. Therefore gamma1 and gamma2 are equal modulo the
right classUnip0, and p.2,p'.2 are in the SAME double coset for the
left and right classUnip0. IsNearRep selects a unique representative
of precisely this double coset. Hence p=p'. This proves the required
one-point upper colour fibre from the named primitive premises.

Without the shared label t, equality of quotient component alone
does not imply equality of reductions; without the chosen-representative
condition one only obtains equality of double cosets, not rational
elements. Both tempting reductions are rejected. In particular
the actual same-label first colour is not a same-reduction assumption.

## 3. Assemble, keeping the original count bound

Within fixed Z, apply the weighted first colour and the upper unweighted
colour (fibre-one proved above). The result is

    sum_{p:Z fixed} w(p)^(-k) <= I^[n(n+l+1)+rho*n]
                              = I^[n(2n+l)].

The equality uses rho=n-1. The +1 in the complement count is essential:
the middle block has k+1 rows, including z. This connects the two
previously separate geometric proofs to the exact weighted-colour
dimensions at BlockBound.156–173. No change to the exponent 2000 in
the actual theorem is proposed.

For completeness audit the finite Z bound and the denominator size
used at BlockBound.137–154,211–215. Native bounds are b>=1000,
n>=100001, q0<=b^11, g<=b^23,
|Phi_v(Z_ab)|<=b^(5n²), |Phi_v(Delta)|²<=b^(11n³).
The last is NearTerms.norm_map_leadingMinor_le plus det_paddedLeading.
The field norm (degree 2f) gives

    I = (M g)^(2f) |Norm Delta|²
      <= b^[2f(11 n^4+23+11 n^3)] <= b^(40 f n^4).

Here |Norm Delta|=prod_v |Phi_v(Delta)|²; do not count f twice.
For integral z in E with every complex embedding <=B0=b^(5n²),
distinct z differ by a nonzero algebraic integer, so the maximum
embedding norm of their difference is >=1. Packing disjoint open
balls of radius 1/2 in the max-of-complex-moduli norm inside the
ball B0+1/2 gives at most (1+2B0)^(2f) possible z. Apply to the n²
entries independently (an overcount), obtaining at most
b^[f(10n^4+2n²)] <= b^(12 f n^4) possible Z. This works for the
actual embedding lattice, not an assumed box of arbitrary real
matrices. Sum the nonnegative weights over these finite parts.
With n>=2 and l<=s, the resulting exponent is at most
f n^4[12+40 n(2n+l)] <= 2000 f n^6(s+1).
Indeed 12<=12 n², n l<=n² l and 92+40l<=2000(s+1).
This is a verification of the original scale guard, not a competing
optimized constant. Empty A is immediate. Infinite A is permitted:
the weighted-colour bound controls the nonnegative tsum directly.

Conclusion: AGREE on the actual geometric colour interface with the
native primitive basis/level/freeness, RUN73/75 geometric derivations,
near bounds and representative choice retained. This connects the
counting supplier to the two calls at sum_pairWeight_le; use the
separate right-class witnesses of peer 2cb53847 and outer divisor
a62382a8. No new derivation of their scalar geometric sum or class
average. This is not an audit of every transitive primitive.

## 4. Verification boundary, URT assessment and handoff

Actual new native receipt READ this run (not a run started by this lane):
cathedral-research-state/compute/rh-compact-b2-human-replay-20261127/
status.json d9eb4d1dc47d7dc52f36bc13b41b3eea170b667d and
outputs/b2_native_results.json a5dba18064d92bade88f3133b7217addcfe9b9ff,
run 45986308748, completed 11:14:10 UTC. Eight helpers from RUN73/74/75
compiled, six ORIGINAL caller axiom reports passed with only standard
three axioms or subsets; missing-projector-guard negative control
rejected. Explicit flags caller_replacements_checked=false,
human_assembly_verified=false, full_RH_replay=false.
No duplicate replay requested. Local command -v lean/lake/elan
returned no paths; no fresh local Lean execution or native search.
This note is source-matched manual derivation/audit, not an additional
kernel proof. No numerical proxy tests, no imported RH theorem.

URT structural candidate: use the exact integral denominator once,
decompose by the Gram and two residue classes, preserve the label
as the final symmetry invariant. Ordinary weighted colouring and
integral lattice arguments validate the candidate. A tempting
single unlabelled frame invariant fails the actual quotient argument
as explained above. No measured acceleration, no assumed URT premise,
no global dependency edge deletion. Cache key: pin, S,c,j,t,Z,T,
actual class basis and the two separate right-class witnesses.
Preserve original and reduced graph, native axioms, all old artifacts.

RESUME HERE: at BlockBound.enorm_amplitudeSum_le_classSize (368–394)
and its top-level caller, check the actual classSize local open-cell
supplier and the split between termDiscNorm > N^f minorNorm and its
complement, reusing existing weight and absolute-convergence arguments.
Do not repeat the completed pointwise pair or colour derivations.
HANDOFF TO integration/geometry/audit: exact colour dimensions,
representative uniqueness and first preimage inclusion above; native
caller replay remains separate. No edits to shared spine, schedule,
protected workflows or Cathedral physics.
