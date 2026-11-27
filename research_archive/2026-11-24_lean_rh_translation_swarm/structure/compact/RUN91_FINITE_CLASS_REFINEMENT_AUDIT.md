# RUN91 — exact finite class-refinement audit at the B2 caller
27 November 2026. HUMAN SOURCE-MATCHED REVIEW; B2 remains PARTIAL.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.

Preflight: live mission blob 3adc7622 and amendment 99cfbd1f, live spine
40aaf0af, ledger 579ecc1c, manuscript 619ae01b (B section), SWARM_PROTOCOL,
AGENTS, handoff, expansion, state/log/protocol/continuity consulted.
Read RUN90 a0de93be and editor finite class average 80f4ff6e (current
certificate blob edc6803f), integration 26-Nov lattice saturation note §3.
Recent B3 replay feba40b3 and common-map rank work 869e5afc address
different suppliers. Current Cathedral CI summary 76db0657, run
46066437998, is not an RH replay. No protected edits.

## 1. Exact source and premises

BlockBound.lean blob 6c68e80e3b1ea2b7983696716305493a37f2b1fd,
21–64 supplies hB; 65–73 is the final class average, 294 the actual
sum_pairWeight_le consumer. Keep Field E, CMType, StablyUnram, SAME
Filling S, IsAdmissible and natural codimension s.

Write G for the finite adelic standard unitary group, Gamma=stdRatPoints
and K=S.columnLevel. Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727,
25 supplies aut_columnLevel(g) for EVERY g; 97–99 defines the nonempty
class set C=Gamma\\G/K. PartialDerivComm.lean
b19152de1d6994f3b033f01c16324d2d9415b1e2, 105–119 defines
classAut=Gamma intersect gKg^-1 and its membership test.
FillingData.lean 0ef8b0dfe13173b16bd0a8820a4924f10124e278, 127–128
actually instantiates the field using D.classAut_columnLevel_eq_bot;
ColumnDefs.lean 104b875374798b99448625fe6ce062ea6bfbfe65, 66–67 proves
this from the chosen-level freeness supplier. That supplier is retained,
not assumed for arbitrary levels. LatticeChart.lean
5c87f908fd39bf1c6b11ffe37af9dd5f764c782c, 74–75 converts weighted
class sums to unweighted sums at this specific K.

Use the same finite nonempty index set A=Kf/H0, H0=(latStabilizer.comap
inclHFin).subgroupOf Kf. Its quotient finiteness is obtained at
BlockBound.27 and nonemptiness from the identity coset. Let a_phi be
phi.out embedded in G, h=card A>0, k=shape.k, f=numInfPlaces E,
tau=tailScale, b0=N^(-kf) tau^(s+1). The exact local hB is

    sum_(phi in A) F([u a_phi]_K) <= ofReal(h b0)   for EVERY u in G, (91.1)

with F(c) the original ENNReal sum of ofReal((latticeDisc(c,T)^(k+1))^-1)
over finrank T+s=k. Retain native inverse-zero convention. All geometric,
index and scale premises in hB stay fixed, including RUN89 and RUN90;
no change to their constants.

## 2. Independent audit of coset orientation

The source ClassMean.lean b9d642228711dcfb20687f0b2579fa8ff99838f3,
30–40 defines classIntegral as a normalized finite weighted class sum,
NOT an analytic Haar integral in this module. The editor's candidate
simplifies that finite refinement argument; it does not eliminate a
general Haar measure theorem from every consumer.

Define K_phi=a_phi K a_phi^-1 and L=K intersect all K_phi.
Each K_phi is compact open, so the finite intersection is open and
is closed inside compact K. L has finite index in K and in K_phi:
the disjoint open cosets cover each compact group and have a finite
subcover. D=Gamma\\G/L is finite by ClassMean.99–102 (or by
the surjection C x K/L -> D using chosen class reps) and nonempty.

For each phi put p_phi([g]_L)=[g a_phi]_K. If g'=gamma g ell,
then g'a_phi=gamma g a_phi(a_phi^-1 ell a_phi); the parenthesized
factor lies in K. This proves well-definedness with the correct
conjugation, no normality. Surjective since [u a_phi^-1]_L maps to [u]_K.

Fix c=[u]_K and set M_phi=a_phi^-1 L a_phi <= K.
The map k M_phi -> [u k a_phi^-1]_L is an explicit bijection
from the coset set of representatives modulo right multiplication
by M_phi onto p_phi^-1(c). Indeed if [g a_phi]_K=[u]_K then
g a_phi=gamma u k, proving surjectivity. If two images agree, then
u k2 a_phi^-1=gamma u k1 a_phi^-1 ell, hence

    u^-1 gamma u = k2 (a_phi^-1 ell a_phi)^-1 k1^-1 in K.

The same gamma is in Gamma, so S.aut_columnLevel(u) forces gamma=1.
Thus k2=k1(a_phi^-1 ell a_phi), exactly the equivalence k1 M_phi=k2 M_phi.
Conversely this last equality gives equality of L classes.
No need for a_phi to normalize K; no freeness at identity alone.

Consequently card(p_phi^-1(c))=m_phi=[K:M_phi] is finite positive
and independent of c. Since p_phi is surjective between the SAME finite
nonempty sets, card D=m_phi card C, so all m_phi=m. This establishes the
precise fibre multiplicity without invoking unimodularity.

## 3. New simplification: stay in ENNReal at the exact caller

The editor candidate uses real F after proving finiteness, and the native
code lifts F to NNReal before introducing a signed defect. Both detours
are unnecessary for this caller. Directly use B=ofReal(b0) in ENNReal;
ofReal(h b0)=(h:ENNReal)*B since h is nonnegative.
Reindex the finite double sum, with no interchange of infinite sums
inside F:

    (h*m) sum_c F(c)
      = sum_(d in D) sum_(phi in A) F(p_phi(d))
      <= card D * h * B
      = (h*m) (card C * B).                            (91.2)

Here the natural counts are cast into ENNReal. Every identity follows
from finite reindexing/constant sums and is valid even if some F(c)=top.
Use (91.1) on a chosen representative of each d, as p_phi is well-defined.
Since h,m are positive finite natural numbers, their product is neither
zero nor top; multiplication by its inverse is order-preserving and
cancels exactly on all ENNReal values (including top). Hence

    sum_c F(c) <= card C * B
               = ofReal(card C / N^(kf) * tau^(s+1)).  (91.3)

No preliminary finite-lift lemma, toReal, signed defect, or real
subtraction is needed. Finiteness follows from (91.3) itself since its
right side is finite; each F(c) <= sum_c F(c).
This is literally the original statement of BlockBound.21–24, with its
same native real RHS, not a strengthened or altered discriminant estimate.
Use it at BlockBound.294 exactly as before. The independently checked
editor fibre proof and the ENNReal cancellation may be used as one
preferred human proof, avoiding repetition of the earlier Haar exposition.

## 4. Checks and limitations

- Do not reverse the conjugation: L <= a K a^-1 implies a^-1 L a <= K,
  not generally a L a^-1 <= K. For example in S3, K=<(12)>, a=(123),
  aKa^-1=<(23)> and a^-1Ka=<(13)>. For L=K intersect all conjugates
  the mistaken implication can hold accidentally; the correct argument
  comes from multiplying the representative equality on the right.
- The map [g]_K -> [g a]_K need not be defined. In the same S3 example
  with Gamma trivial, [1]_K=[(12)]_K but [a]_K differs from [(12)a]_K
  because a^-1(12)a=(13) is not in K.
- Freeness is for every u, not merely Gamma intersect K trivial:
  in S3 take Gamma=<(12)>, K=<(23)>; intersection at 1 is trivial but
  K has a conjugate equal to Gamma. Fibres of refinement to the two
  double cosets at K have sizes 1 and 2 for L=1.
- Cancellation in (91.2) is not allowed for zero or infinite counts.
  In ENNReal, 0*top=0; top*1=top*2. Finite positivity of h,m is essential.
- Do not convert ENNReal to real before controlling top: toReal(top)=0,
  so a finite real bound after an unchecked conversion need not bound F.
  The direct argument avoids that failure.
- Keep the quotient labels phi and their actual representatives: distinct
  phi can produce the same p_phi(d); (91.2) counts occurrences, not
  distinct image classes.

Actual verification: exact pinned source read, editor proof and native
caller independently audited by the above algebra; explicit S3 controls
checked by permutation conjugation and double-coset sizes (human checks,
not executed code). command -v lean/lake returned no executable.
The existing eleven-declaration B2 replay and graph audit are distinct:
no fresh kernel verification of this replacement, no native dependency
retired. The editor's existing real scalar certificate remains prepared.
URT-inspired symmetry/reindexing is a search heuristic only; the proof
uses ordinary finite counting and ordered-semiring cancellation. No
benchmark or O(N) proof-search claim.

RESUME HERE: audit the actual split-place integrality implication in
LatticeChart.49–65 (isIntMatrix_scaleAt_sub_one and
inclHFin_mem_latStabilizer), specifically why dividing the marked row
and column by conjugate ideles introduces no simultaneous denominator
at any place. Reuse integration's weighted congruence and RUN89–91;
check for an existing primitive audit before doing it.
HANDOFF TO integration/audit: accept the direct ENNReal variant of the
editor class-refinement candidate as human source-matched under the
same hB and S.aut_columnLevel. Keep the replay frontier and all original
source evidence. B2 and the full RH reconstruction remain OPEN.
