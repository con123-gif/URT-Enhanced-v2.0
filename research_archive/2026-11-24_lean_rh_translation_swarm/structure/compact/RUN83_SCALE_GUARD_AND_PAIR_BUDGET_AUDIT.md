# RUN83 — exact scale-guard audit at the B2 level-energy consumer

27 November 2026. HUMAN SOURCE-MATCHED REVIEW / AGREE under retained
primitive inputs. Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: mission 3adc76221a978016e3505cdf3e36ad688354d7d7 and binding
amendment 99cfbd1f04c3a4c6d02c21a8fde207f2121aef20, spine
33861bf3d18e22477f4f64693b91993fbf06b97b, ledger
d9a79b815446e5de21e207f6149432d9b478f7f7; detailed manuscript relevant
B2 sections, SWARM_PROTOCOL, HANDOFF_QUEUE, AGENTS, continuity,
research state/log/protocol and CI summary consulted. Prior RUN82
b1d35bf2 read in full. Peer integration 06486f1e, Landau 1597b877,
dependency cbd956ca, prime 55afd422 and kernel f8e95752 inspected.
Use existing link-pair caller audit (A)-(H), Landau RUN76 symmetric
product, audit 446c68f9 geometric level aggregation and RUN81/82.
Do not redo those results or reoptimize fixed exponents. This note
fills the remaining explicit guard audit, not a new count/geometry proof.

## 1. Source and the exact context of H

CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f,
94–111 and 118–160; Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
275–312; NearTerms.lean bd8a969f8d1bda48ca0468c28a8a62bc78e280ce,
281–293; CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18,
85–93; LinkPairing.lean a802533ca5a385d6f44c3254f1a4d600b28fc416,
284–287; SchurTest.lean classSize; BlockBound.lean
6c68e80e3b1ea2b7983696716305493a37f2b1fd, 232–233.
All source anchors under New/Filling/. Active replacement
integration/B2_ACTIVE_ENERGY_REPLACEMENT.lean blob
e8ef74cafecd49e361b7b147c3970953e30a7f6d was retrieved; a literal
JavaScript string comparison of the ten lines from "have H" through
the line immediately preceding "repeat rw [ite_eq_left" returned
true against the pinned source. This checks unchanged source text,
not the Lean kernel.

Fix S admissible and the SAME c,c',s in Omega, level j in Fin(rho+2),
stable T, and gamma,gamma' in T over (c,s,c'). Fix the actual pair of
link labels pi=(Lambda,Lambda') OUTSIDE diag(R). From the fibre
membership, Lambda=link(gamma), Lambda'=link(gamma'). Both terms
have HasLevel j. Use the single i supplied by pairInvariant_mul_le
for these SAME terms, in particular i=0 implies Lambda=Lambda'.
Let X be the original natural FixesNormAtLeast parameter, X!=0.
Put tau=tailScale>=2, d=mainEnergy>=0, e=besselEnergy>=0, f=numInfPlaces,
k=shape.k, F=codimFactor=(b/g)^(kf)*(2*tau^2).
Thus 0<=F<=1, C>=e>=0, tau^18 F d<=e (Setup.IsAdmissible).
Let ell=(j-rho)_+, which is 1 at the top j=rho+1, 0 otherwise.
Let x0=X only when ell=1 and i=0, otherwise 1. Then x0>=1.
Exactly as classSize, let D=d at the top, otherwise
D=tau^13 e/(tau^32)^j. The local H in the source is

    K = tau^4 D (2*tau^2)^ell F^i / x0^k <= C/tau^3.

There is no additional factor of N, frame index, class number or Haar
mass here. Those occur in the separate pair-weight comparison.

## 2. Normalize the budget once, then use the four exhaustive cases

Since tau>0, H is equivalent to tau^3 K <= C. No division by C,
d, e or F is necessary, so all their allowed zero cases are included.

Top j=rho+1 and i=0: the implication i=0 => Lambda=Lambda' and
pi outside diag(R) force Lambda notin R. Otherwise pi would be the
diagonal image of this very Lambda in R. This is the required explicit
witness to h2. In particular if R is the entire link set, this case
has no actual pair. Now h2 gives tau^12 d/X^k <= C. Hence

    tau^3 K = 2*tau^9 d/X^k
             = (2/tau^3)*(tau^12 d/X^k) <= C.

Top j=rho+1 and i>=1: x0=1, F^i<=F (including F=0). Hence

    tau^3 K = 2*tau^9 d F^i
             <= (2/tau^9)*(tau^18 F d)
             <= (2/tau^9)*e <= C.

This uses mainEnergy_le, not the differently directed besselEnergy_le.
It does not require h2, even if R omits links.

Lower level j<=rho and j=0: HasLevel j supplies IsNormalForm 0 gamma.
Together with gamma in T, its original classes, s in Omega and
gamma in termsOver c s c', this is the actual existential witness
for h1. Consequently

    tau^3 K = tau^20 e F^i <= tau^20 e <= C.

It is not necessary that every term have IsNormalForm 0, nor that
the second term supply a different normal form.

Lower level j<=rho and j>=1:

    tau^3 K = tau^20 e F^i / tau^(32j)
             <= e/tau^12 <= e <= C.

All powers are on positive tau and nonnegative F. All four cases
use the identical fixed native data. This proves H precisely where
it is consumed. It does not replace the conditional h1/h2 hypotheses
of the public theorem by unconditional bounds; the two existential
witnesses are derived from the support of the remainder.

Rejected shortcut: bounding all top pairs by tau^18 F d<=e
would wrongly insert F at i=0. A scalar control even respects the
other admissibility energy directions: tau=2, C=e=1, d=tau^44,
F=tau^(-62), X=1. Then tau^44 e=d, tau^18 F d=e, 0<F<=1.
At the top with i=0 the scaled K=2*tau^9*d>1, without h2.
At j=0,i=0 the scaled K=tau^20>1 without h1. These are algebraic
countermodels to dropping the guards from the scalar implication,
not constructed admissible fillings or evidence of a native defect.
A separate invalid route is to infer an omitted link merely from
the presence of an off-diagonal pair: distinct links may both
belong to R. The equality forced by i=0 is essential.

## 3. Connect H to the existing symmetric pair route without changing the native target

Reuse Landau RUN76, blob e27e9a0941eca29a5890fe51701b8139acdf92e3,
for its actual class-size product and symmetric AM-GM comparison.
In its notation m=k-dim(commonLink), q=x0*(g/2)^(if),
a=o*d' and b0=o'*d (here d,d' are indices in RUN76, not energies).
The coefficient before the symmetric pair sum is
tau^4 D(2*tau^2)^m q^(-k). The source codimension inequality gives
m<=i+ell. Hence this coefficient is <= K by

    (2*tau^2)^m q^(-k)
       <= (2*tau^2)^ell F^i/x0^k,

because (2/g)^(ikf) <= (b/g)^(ikf) for b>=2. No new exponent
optimization, no separate choice of the commonLink or i and no
AM-GM before the exact index cancellation. Thus the previously
proposed symmetric half-factor really consumes H on its actual
support; the native, weaker coefficient C/tau^3 multiplying W+W'
also follows. This verifies the formerly retained scale premise
in the peer derivation, not a fresh proof of its index suppliers.

For the native target use RUN82's exact link-fibre expansion and
support injection, and sum_pairWeight_le <= 2*tau^2 in each
orientation. After division by the SAME positive nu^2, the
remainder is at most 4*C/tau. Let r=rho+1-j=j.rev.val>=0.
NearTerms.pow_le_tailScale at exponent r+31 yields
tau>=b^(r+31). Its guard is the native shape bound used at
CrudeEnergy.159–160; do not generalize to arbitrary k/rho/f.
Since b>=1000>=4,

    tau >= b^30*b*b^r >= 4*b^30*4^r,
    4*C/tau <= C/b^30/4^r.

This recovers exactly the original level-energy coefficient and
not just a heuristic asymptotic bound. The independent geometric
aggregation audit and full-energy three-norm estimate can therefore
use the unchanged original level estimate; do not compound claimed
improvements from different variants. B2 primitives and complete
caller replay are distinct obligations.

## 4. Verification / limits

Actual verification this run: retrieved pinned sources, matched the
ten-line H text exactly to the active caller, and independently
derived the four cases and the two actual support witnesses above.
Reread state receipt
compute/rh-compact-b2-energy-repair-20261127/outputs/b2_native_results.json
blob 6684b794bbed520fa4b813ddbb556d1e91a07b24: source build exit 0,
active candidate exit 1, caller_replacements_checked=false,
all_requested_checks_ok=false, human_assembly_verified=false,
full_RH_replay=false. No newer successful whole-file receipt established
by this run; integration is handling the corrected opaque-body and
axiom-name guards using its authenticated cache. No new Lean run,
no synthetic scalar regression, no duplicated cold build, and no new
axiom or graph coverage claim. No global edge deleted.

URT candidate: separate the two discrete switches (top vs lower,
equal vs different links), and multiply by the common tau^3 before
using any estimates. Ordinary exact monotonicity gives the proof;
the source already uses these same cases, so this is a human audit
and reusable concise explanation, not an observed URT speedup.
No unproved URT premise, O(N) claim or external formal certification
conflated with our incomplete reconstruction.

RESUME HERE: independent audit of the finite-fixer primitive used by
LinkPairing's quotient lower bound (E), specifically BoxPartition.lean
150–213, le_genIndex_det_of_fixesNormAtLeast: check the simultaneous
selected/conjugate-place CRT kernel and the descending annihilator
step against the existing 26-Nov primitive section 5a; reuse it and
record only a specific missing premise or independently checked bridge.
The integration worker handles native receipts. Do not redo H,
pointwise AM-GM, packing, or level aggregation.
HANDOFF TO integration and audit: H and its exact support witnesses,
plus compatibility with the already recorded symmetric product.
No shared ledger, protected workflow, schedule or physics edits.
