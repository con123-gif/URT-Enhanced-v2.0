# RUN92 — split-place integrality and marked class-chart interface
27 November 2026. HUMAN SOURCE-MATCHED, not a new Lean replay.
Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin
lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Continuity: read ONE_EQUATION_MISSION (3adc7622), LIVE_PROOF_SPINE
(40aaf0af), LIVE_OBLIGATIONS (579ecc1c), HUMAN_PROOF_COMPACT
(619ae01b; relevant source ledger and B2 entries), SWARM_PROTOCOL,
AGENTS, binding allocation at 99cfbd1f, HANDOFF_QUEUE, active B2 work
record, integration link-pair caller audit, docs/RESEARCH_STATE, and
RUN91 (45e0e9c3). Root-level RESEARCH_LOG.md and RESEARCH_PROTOCOL.md
returned 404; no claim of exhaustive prior search. No earlier specific
LatticeChart primitive audit located in these records; RUN91 explicitly
assigns this step. Reuse its class averaging, no change to live ledger
or protected workflows.

## 1. Native anchors and premises
All paths below relative to grh-compact/src/New/Filling/ at the above pin.
- LatticeChart.lean 5c87f908fd39bf1c6b11ffe37af9dd5f764c782c:
  34–38 middleBaseChange integrality; 40–43 entrywise change of chart;
  49–55 isIntMatrix_scaleAt_sub_one; 57–65 inclHFin_mem_latStabilizer;
  67–72 reduction_inclHFin_eq_one_iff.
- EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce:
  29–38 exact rectangular change-of-basis and its extension;
  45–47 Gram transport.
- Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727:
  27–33 p*star(p)=N, N prime, N_split, p integral, level primes != N;
  34–35 chosen place rational primes; 111–120 stabilizer and reduction;
  192–223 exact group inclusion.
- BlockBound.lean 6c68e80e3b1ea2b7983696716305493a37f2b1fd:
  21–46 actual weighted class packing consumer, especially 32 and 38–44.

Write O=Ô E, p=S.piBar, o=shape.k0, bar(p)=star p, D=k-I, and
S(a)=scaleAt a o, diagonal with a at o and 1 elsewhere.
For the standalone 49–55 lemma p is an arbitrary finite idele unit
satisfying hp: at every w at least one of p_w, p_star(w) has valuation
one (multiplicative convention). Do NOT require p integral for that
standalone lemma. k is in the native standard unitary group Gf E κ
with k∈congruenceGL(pO, marked row o), a subgroup of integral GL.
Thus k and k^-1 integral, and marked row of each minus I in pO.
Native U.inv_val_eq_conjTranspose k gives k^-1=k^* (conjugate transpose).
For the actual Filling chart, p and bar(p) are both integral, and
N_split provides hp.

## 2. One exact ideal identity replaces the split-case matrix bookkeeping
At each finite place let R_w be its valuation ring and let
a=p_w, b=bar(p)_w. Both nonzero, and a or b is a unit in R_w.
Then aR_w ∩ bR_w = abR_w: if a is a unit both sides equal bR_w,
and if b is a unit both equal aR_w. Hence globally
    pO ∩ bar(p)O = p bar(p) O.                         (92.1)
This uses local membership at every place, not a single chosen place.
No global invertibility of p in O is needed; p is invertible in the
finite adeles. The proof works for fractional principal modules too.

The row condition gives D_oj∈pO. Apply it to k^-1, then conjugate
and transpose: D_io∈bar(p)O. In particular D_oo is in their
intersection. Thus the matrix
    T=S(p^-1) D S(bar(p)^-1)
has integral entries:
    i,j≠o: D_ij∈O;
    i=o,j≠o: D_oj/p∈O;
    i≠o,j=o: D_io/bar(p)∈O;
    i=j=o: D_oo/(p bar(p))∈O by (92.1).
This is the exact native 49–55 conclusion; the elementary block proof
uses no extra URT premise, no asymptotics, and no full matrix determinant.
It makes explicit why two denominators on the corner never accumulate
at one place. For p=S.piBar the corner denominator is precisely N.
The native proof's two branches on hp are the local proof of (92.1).

## 3. Actual chart equivalence (not merely its forward direction)
EichlerFlag.29 gives C=middleBaseChange: its square upper block is
S(bar(p)); its additional row is -p^-1 e_o^t.
LatticeChart.40–43 identifies the potentially nonzero block of
inclHFin(k)-I with L=C D S(bar(p)^-1), with zero entries elsewhere.
This is the source identity via toLatBasis and toBesselH, not a
replacement of the group by an unrelated coordinate system.
Use the native equivalence 57–59 between stabilizer membership and
integrality of the difference matrix: integrality of the inverse in
this lattice chart follows from its unimodular Gram form, not merely
from integrality of an arbitrary invertible matrix.

If marked row congruence holds, T is integral by section 2, and
    L=(C S(p)) T,
where C S(p) has upper block S(p bar(p)), bottom row -e_o^t.
This is integral since p,bar(p) integral. This directly proves the
sufficiency at LatticeChart.65, factoring the same matrix as in 34–38.

Conversely if L integral, multiply by the integral diagonal
S(bar(p)) on the right. Then C D is integral. Its unmarked rows are
D_i*, and its bottom row is -p^-1 D_o*. Therefore D_o*∈pO⊆O,
and all of D is integral. k=I+D is integral, and k^-1=k^* is integral;
the native mem_Kf condition follows. This proves the marked row
congruence and hence the reverse implication with precisely the same
k. The upper marked row of C D is unnecessary for this converse.
This is the two directions of 57–65, without a rational change of
basis being misidentified as an integral automorphism.

For chosen place w of levelPrime i≠N, N_split gives p_w a unit.
Applying N_split at star(w) gives p_star(w) a unit as conjugation
preserves the underlying rational prime. Hence C, its left inverse
on its upper block, and S(bar(p)^-1) are integral at w. Reducing
L modulo the maximal ideal gives L=0 iff D=0 (the square upper
block of C is invertible there). This is 67–72 with the actual
chosen-place and integral-group premises; no new level assumption.

## 4. BlockBound consequence and rejected shortcuts
BlockBound.32 uses r_phi=e_o^t y_phi^-1, with y_phi integral
unitary and representing phi in Kf/(inclHFin^-1 K).
If the counting supplier gives r_b−r_a∈pO^κ, then
    e_o^t(y_b^-1 y_a−I)=(r_b−r_a)y_a∈pO^κ.
Since y_a is integral, this is precisely the marked congruence
used in 42–44 for the relative element y_b^-1 y_a. By section 3,
its included image lies in latStabilizer; the native quotient
equality therefore identifies a=b. Preserve the original
tsum_inv_index_pow_le_of_congr hypothesis that supplies congruence
from the test H, not an arbitrary equality of scalar weights.
This is the injectivity mechanism underlying the class-weight
estimate, not a fresh bound for the still-retained counting theorem.

Negative controls (exact human algebra):
- Without split support a=b=2 in Z_2, with star identity and the
  1x1 unitary k=-1, D=-2 belongs to both 2Z_2 ideals but D/4=-1/2
  is nonintegral. Membership in both ideals alone does not suffice.
- Without inverse/conjugate-transpose control, a unit at w and
  b=2 with marked o=1 and k=[[1,0],[1,1]] has marked row difference
  zero but the scaled (2,1) entry is 1/2, nonintegral. This tests
  removal of the column control, not a counterexample within Gf.
- C is rectangular. Integrality of C D implies row congruence via
  its extra row, not by an alleged integral inverse for C.
- Multiplying the wrong side by y_a does not transport row
  congruence; keep y_b^-1 y_a in the stated orientation.
- At a place above N, p or bar(p) can be a nonunit; the reduction
  equivalence at chosen primes cannot be extended by assuming both
  are units there. Do not divide in the residue field by a nonunit.

Actual verification: exact pinned file reads, source comparison and
human algebra as above. Local command -v lean and command -v lake
produced no executable. No fresh Lean run, no native premise or edge
removed. The accepted eleven-declaration B2 replay and eight-root
graph audit in the live ledger are separate evidence. URT-inspired
row/column decomposition and invariant transport provide this
compact proof; standard local ideal arithmetic establishes it.
No claim of faster search or full B2 closure.

RESUME HERE: inspect the actual supplier tsum_inv_index_pow_le_of_congr
used at BlockBound.38–44; audit the weighted congruence-to-index
summation primitive under its precise hypotheses, reusing this
injectivity and RUN89–91 rather than rederiving their bounds.
HANDOFF: integration/audit may use sections 2–4 as one preferred
human proof of the LatticeChart interface, subject to independent
review and native replay. Full RH human reconstruction remains OPEN.
