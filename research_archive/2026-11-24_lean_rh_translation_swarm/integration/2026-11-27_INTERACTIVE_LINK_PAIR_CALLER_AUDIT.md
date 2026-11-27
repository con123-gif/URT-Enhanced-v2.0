# Link discriminant to congruent-pair bound: caller audit

27 November 2026. REVIEW — AGREE on the caller algebra under the explicitly
retained primitive inputs below. SOURCE-MATCHED HUMAN DERIVATION; no new Lean
execution, replacement replay or whole-B2 certification. RH remains OPEN.
Source: Alpöge, Sernau, Anthropic collaborators and Claude,
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/`, Lean 4.35.0 / Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.
Integration starting point: `f93cf29c11cceefe76becc115a9b8223c3a96030`.

Task: audit the exact saturated-lift comparison at its actual common-link
split and congruent-pair callers. Reuse the 26-November primitive derivations;
do not describe their already recorded lower-bound and common-link arguments
as wholly missing. Preserve the distinction between mathematical audit and
native replacement replay.

Prior-work ledger:

| Existing result | Exact source | Scope and status |
|---|---|---|
| Common-link split, lower bound, congruence determinant | `integration/2026-11-26_COMPACT_LINK_DISCRIMINANT_PRIMITIVES.md`, sections 4–7 | Conditional human derivations; no replacement Lean replay |
| Primitive Gram/index comparison | `integration/2026-11-26_COMPACT_LATTICE_SATURATION_AND_CONVERGENCE.md`, section 1 | Same marked class lattice; conditional human derivation |
| One index for three penalties | `c9e286fb`, `integration/2026-11-27_INTERACTIVE_SINGLE_LATTICE_INDEX.md` | Exact lattice quotient derivation; replay pending |
| Saturated lift equality | `dd97e28a`, `integration/2026-11-27_INTERACTIVE_EXACT_LINK_DISCRIMINANT.md` | Proposed strengthening for the full lift lattice; audit/replay pending |
| Cross-determinant pair bound | `e5803774`, `structure/compact/RUN80_CONGRUENT_LINK_PAIR_DETERMINANT.md` | Conditional human derivation; replay pending |

Native sources inspected: `New/Filling/{LinkPairing,BoxPartition,GramLiouville,CrudeEnergy}.lean`
and `Lib/General/Algebra/LatticeComplement.lean`. The local source checkout
reports the exact compact commit. `LinkPairing.lean` hashes to
`a802533ca5a385d6f44c3254f1a4d600b28fc416`, as recorded by the source notes.
The current repository receipt records six original native checks, a build
timeout, and `full_RH_replay=false`; no local Lean executable was found.

## 1. What the saturated equality may supply

Keep the SAME filling S, field E with CMType and StablyUnram, classes c,c',
term gamma over an agreeing reduction s, and level j. Put k0=termPosition,
D=minorNorm(j,gamma)>0, I=xRowsIndex(j,k0), I'=xRowsIndex(j,k0^-1),
sigma=saturationIndex(k0), w=II'sigma. Set H=linkMetric, J=linkForm,
Z=zFormPair and L=link(gamma). All finite coefficient matrices refer to
classCoord(c), not to an independently chosen rational integral chart.

The 27-November saturated argument makes two divisibilities in the
26-November proof into equalities for the FULL lift lattice. Its extra
conditions are essential:

- The primitive perpendicular basis must span the entire integral
  perpendicular lattice. This follows locally because primitive integral
  columns admit an integral left inverse; the associated idempotent then
  fixes every integral vector in their adelic span.
- Its kernel under linkMatrix is the integral lattice in U intersect V.
  The tail-coordinate map identifies this kernel with the a-block of that
  adapted primitive basis. The quotient is therefore exactly
  A/(A0+(A intersect B)), of cardinality I.
- The selected frame is A+B0, so its saturation index is exactly I'sigma.
  These quotient identifications use the normal-form leading block and
  its shared isotropic tail, with classCoord transporting the frames.
- Local adapted bases must assemble as invertible finite adelic matrices.
  The valuation-pair primitive-completion theorem supplies this; ordinary
  rational basis extension alone does not. At almost all places the
  rational matrices and a chosen nonzero maximal minor are integral units.

Thus the complement determinant gives discSq(full lift)*w^2=D^2 for that
choice, with the same generalized-index convention as the source. No
indefinite positive-Gram argument or invertibility of the corrected
ambient form is needed. The original existential <= consequence is all
that the following caller consumes. It does not need the stronger
equality to be separately installed as a replacement theorem.

An arbitrary smaller lift lattice cannot satisfy the proposed equality:
replace its coefficient matrix e by 2e. HasIntegralLifts is preserved,
whereas linkDiscSq is multiplied by 2^(4f(k+1)), f=numInfPlaces(E).
The minor and w do not change. This is a scaling of the SAME native
datum and witnesses, and explains the existential/full-lattice guard.
It is a mathematical control, not an executed Lean counterexample.

## 2. The marked common-link inclusion, with its actual lift

Put C=L intersect link(gamma'), K=C intersect ker(Z), and T=commonLink.
Take a rational basis m of K and let p be its first X0 block. Isotropy
for J and vanishing of both Z coordinates give

    m* H m = p* p.

The positive form H makes p injective. Hence col(p)=T and dim K=dim T.
Choose H-orthogonal rational complements u of K in C and y of C in L.
Apply the original existential lift comparison to [m,u,y]. Adapt the
SAME integral lift lattice to C and then K by two primitive triangular
splits. This gives positive squared discriminants dK,dQ,dY with

    dK dQ dY (II'sigma)^2 <= D^2.                       (A)

The split preserves actual lift witnesses. The u-part has a correction
along m, and the y-part has a correction along the whole C. Neither
correction may be deleted in an integrality statement.

Here is the marked step, rather than an assumption that p is integral.
Write Hc=classCoordX0(c) and let pa be the K-part obtained by the split.
HasIntegralLifts.exists_isIntMatrix gives an integral ambient matrix n
with middle block Hc pa, orthogonal to both isotropic frames. The native
BoxPartition.xRows_conjTranspose_mul_eq gives exactly

    frameMiddle(k0)* latMiddle (Hc pa)
         = xRows(frameGram(k0))* (-n_X).               (B)

Stars in (B) mean conjugate transpose. The RIGHT side is in the integral
column lattice QX of the same xRows adjoint, because n_X is integral.
This is the specific marked-lattice inclusion needed at this caller.

Let Lambda_T be the full class-c lattice in T, and write pa=bA for an
adelic basis b of Lambda_T. Its integral left inverse makes A integral;
the nonzero positive Gram determinant makes A invertible adelically.
Consequently q=genIndex(det A) is a positive integer and

    dK=latticeDisc(c,T)^2 q^2.

With Y=frameMiddle(k0)*latMiddle Hc, the native frameValueIndex is
o=[Y Lambda_T : (Y Lambda_T) intersect QX]. By (B), Y(bA R^r) is in
QX. The quotient defining o is therefore an image of
Lambda_T/(bA R^r), so o divides q. In particular

    [latticeDisc(c,T) o]^2 <= dK,   latticeDisc(c,T)>0,
    o>=1.                                              (C)

This rederives GramLiouville.sublatticeDisc_mul_index_sq_le at the
actual common-link caller, including its positivity and finite-index
guards. It retains the sign, the actual class lattice, and the ambient
lift witness in (B).

## 3. The quotient lower bound and the exact cancellation

Write delta=(j-rho)_+, r=dim C-dim K and i=k+1-dim C.
The explicit two native epsilon link vectors satisfy, for v in L,

    epsilon* H v=Zv,
    epsilon* H epsilon=N[[1,-bar(u0)],[-u0,1]].

At j<=rho its determinant is zero by HasLevel; otherwise it has rank
at most two. Positivity of H therefore gives r<=1+delta and

    k <= dim T+i+delta.                                (D)

Apply positive Gram Liouville to the selected independent rows of Zu
and the ACTUAL corrected u-lifts. The paired-frame identity makes the
cross determinant integral. The zero-, one-, and two-row cases give
the ordinary lower bound with
M=max(termDiscNorm(gamma),N^f D). At i=0, C=L and u fills L/ker Z;
the separate finite-fixer theorem supplies the stronger determinant
index x. Thus, with x'=x if j>rho and i=0 and x'=1 otherwise,

    (x'D)^2 <= dQ M^2.                                 (E)

The finite-fixer theorem is NOT a consequence of a positive Gram
determinant. Retain BoxPartition.le_genIndex_det_of_fixesNormAtLeast,
the source FixesNormAtLeast(s,x), all selected places and their
conjugates, and the self-dual character/conductor normalization. Its
human proof is section 5a of the 26-November primitive note; a new
kernel check of that replacement is not claimed here. The source x
is natural-valued. At i=0 the full-quotient rank condition is supplied
by C=L; at i>0 the enhancement is not used.

Set P=latticeDisc(c,T)o sigma and G=M/(II'). Multiply (C) by (E),
then by dY(II'sigma)^2. Use (A) BEFORE dividing by D^2>0:

    (P x')^2 dY D^2 (II')^2
       <= dK dQ dY (II'sigma)^2 M^2 <= D^2 M^2.

Cancel D^2 and (II')^2 to obtain

    (P x')^2 dY <= G^2.                                (F)

This is exactly the quantitative conclusion of
LinkPairing.exists_link_split_le_classGauge, together with (D),
codimension i, equal-link implication at i=0, and corrected lift data.
No separate bound on any of I,I',sigma was introduced. The same
calculation in the reverse order uses the SAME C, T, i and x'.

## 4. The pair caller and what is still required

RUN80 uses those two corrected lift data. Their common C-parts cancel
under J. Nondegeneracy of J on complementary link quotients makes
y*J y' invertible; maximal link isotropy is essential for this step.
The SAME congruence reduction s gives integral
(1-k0 k0'^-1)/g. Thus the divided cross pairing of the integral
ambient lifts is integral with nonzero determinant.

For Q=diag(J.diag/H.diag), the native identities HQ=J and Q*HQ=4H
make positive Gram Liouville, at g^-1 y and Qy', give

    1 <= (2/g)^(4if) dY dY'.                            (G)

The exponent uses [E:Q]=2f exactly once. Multiply the two instances
of (F), apply (G), and take nonnegative square roots:

    P(gamma,gamma') P(gamma',gamma) (x')^2
       <= (2/g)^(2if) G(gamma) G(gamma').                (H)

This is the original pairInvariant_mul_le interface, including (D)
and i=0 only for equal links. CrudeEnergy.energy_le_of_level_pairs
uses it on two terms in ONE sigma-indexed congruence fiber, then
combines it with the separate classSize and sum_pairWeight estimates.
Equation (H) alone does not prove that energy bound: absolute
amplitude convergence, kept-frame packing/weighted counting, sharp
local amplitude bounds and the native size hypotheses still enter.

Source anchors: LinkPairing 50–125 (lift), 145–164 (splits),
188–232 (quotient bound), 239–278 (marked common-link caller),
284–315 (pair caller); BoxPartition 46–70 (positive metric and
Liouville), 150–213 (finite fixer), 329–369 (indices), 422–429
(marked frame identity); GramLiouville 57–85 (index comparison);
CrudeEnergy 109–167 (same-fiber energy consumer).

## 5. Audit outcome and next action

AGREE on (A)–(H), conditional on the named native primitive inputs.
The saturated equality uses the full-lattice choice; the original
<= consequence suffices for the pair caller. No changed class,
congruence fiber, x', field norm, lift correction or rank guard was
found in this assembly. The older 26-November lower-bound/common-link
proofs are extant evidence, not missing derivations to recreate.
This audit does not certify their entire primitive dependency closure
or recheck any Lean replacement. The original graph is unchanged.

Verification: actual compact commit and source blobs authenticated
locally; source bodies and the above caller substitutions inspected;
`git diff --check` run before commit. No numerical stand-in matrices,
new scalar test, Lean execution, compiler PASS or RH completion claim.

RESUME HERE: at BlockBound.tsum_invPowWeight_le_of_codim_le, audit the
marked lattice divisibility, same-frame coloring/packing and
inverse-index-power sum with the actual IsLabelledTerm guards; connect
it and sum_latticeDisc_inv_le to sum_pairWeight_le. Keep the finite
fixer primitive and replacement replay on the validation frontier.
Do not rederive (A)–(H) or optimize their scalar constants without a
specific discrepancy. HANDOFF TO integration, audit, geometry, URT
and the existing shared native runner; no new worker or job launched.
