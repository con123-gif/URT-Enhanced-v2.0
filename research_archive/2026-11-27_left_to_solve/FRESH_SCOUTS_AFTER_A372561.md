# Fresh scouting after the complete A372561 certificate

27 November 2026. Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
These are bounded investigations, exclusions and failed approaches. None is an
additional solved problem, official submission or acceptance. No lease was taken.

## A239455: exact published proof found; excluded

The current OEIS A239455 source still calls the Look-and-Say image versus
distinct-run-length permutation equivalence a conjecture. We independently
derived a complete informal argument: minimize the number of globally distinct
colored block lengths; a color with d blocks and only o other blocks, d>o+1,
admits a collision-free merge of its largest block with another, since the d-1
distinct resulting sums all exceed every block of this color and outnumber o.
Balanced color multiplicities then admit an ordering with unequal neighbors.

Before any Lean work or claim, a strong primary-source search found **the exact
same complete argument** in Alper Ferudun's 22 July 2026 comment on OEIS A383111.
It explicitly says that it proves the conjectured converse in A239455. This is
prior mathematics and is not a new result of this campaign. The general argument
also covers normal-multiset aliases such as A386580. The TrureTuring triage note
Library/Words/oeis2026triage0910.md did not inspect that decisive A383111 comment;
its older open classification is not used to override the actual proof.

Primary prior: https://oeis.org/A383111 . Both search engines exposed the full
comment. A subsequent page open returned403, so the live rendered page was not
claimed read through that failing route. The primary indexed comment itself was
read in full. Exact upstream all-state PR search returned0, exact public Lean
search returned0, and TrureTuring exact-ID search found only the triage file.
Absence of a Lean file does not restore mathematical novelty.

## A261725: finite-box Hamiltonian shortcut fails

The exact source is the least-unused decimal-grid walk: consecutive terms differ
in one digit by one, without a carry, permitting leading zero changes. Its
permutation conjecture remains unresolved in this lane. The full primary page
was read. An upstream all-state PR search returned0. An initial guessed-repository
code query was incomplete and provides no prior clearance.

An exact finite computation disproved the proposed helper that the greedy walk
exhausts every finite digit box before leaving it. In [0,999], the restricted
decimal walk stops after780 vertices at991, leaving606 as its first missing
vertex. The binary six-coordinate analogue stops after56 of64 vertices, first
missing44. These are failures of the helper, **not** counterexamples to the
infinite permutation conjecture, since the infinite walk can leave and return.
No increasing-range search was substituted for a general proof.

## A055173: source-open, no complete argument

Full primary indexed records A055173, A055171 and A055187 were read. The first
asks whether distinct values in the cumulative inventory sequence cover all
positive integers. Direct JSON retrieval returned HTTP errors. The frequency
recurrence is c_(t+1)(x)=c_t(x)+1_(c_t(x)>0)+#{j:c_t(j)=x}. No proof that every
frequency is attained was found in this lane. No full prior clearance or result
is claimed.

## A395110: genuinely unresolved finite-square variant; bounded search only

The conjectural object is the integer zero-boundary n by n array with
0<=4f(i,j)-sum(neighbors)<=2. Its proposed count is2^floor(n/2). The main OEIS
DATA instead counts the upper bound3; these were kept distinct.

Exact upstream all-state PR and public Lean identifier searches returned0.
The actual TrureTuring triage file was read: it leaves the finite-square count
open, records only n<=3 finite checks and distinguishes the cited 2017 infinite
quadratic-growth theorem from this finite Dirichlet counting question.

A bounded SciPy MILP candidate search compared two reflected boundary entries
for n=4,5,6,7,8,9,10,12. Every returned candidate was independently checked using
exact integer Laplacians and had zero value of the tested asymmetry. A separate
finite max-sum search through n10 produced dihedrally symmetric examples.
These solver results are not an exact exhaustive certificate, a general symmetry
theorem, a count proof or a Lean verification. Files a395110_search.py and
a395110_search.json retain the bounded search. No counterexample was found and
no infinite conclusion is inferred.

## Further excluded candidates

* A255683: the July2025 formula on the primary OEIS page already implies the
  queried cyclic-binary-digit identity with A063787. Excluded as prior.
* A152020: exact prior TrureTuring problem dossier and named Lean module
  RationalDenominatorCubeShift.cicuttin_a152020 were located, together with
  earlier upstream PRs5882 and6426. No new proof or compilation is claimed here.
* A353890: the prime-index largest-factor conjecture has an elementary possible
  obstruction at29, but existing upstream PR3951 is open. Work stopped on the
  duplicate; no statement or claim was submitted.
* A396111: an explicit quartic-remainder witness n=8k-1 and the divisor bound
  2n+1 divides16k-1 would prove both assertions. Existing PRs5434,5934,6376 and
  current shorter-proof PR10754 exclude it. No new proof was queued.
* A395531: an exact prior full TrureTuring proof of the all-index greedy-brick
  identity was located. Its literal row-birth bridge is acknowledged; excluded.
* A396102 and A396099: exact TrureTuring problem dossiers and full Lean modules
  for the coefficient congruences were located before implementation. A newer
  indexed Goyal manuscript also covers the triple-iterate family. Excluded.
* A397683: the full primary source and its Cohen references were read. Its
  prime-power clause is already stated as known in the source. A full modular
  existence proof would require a genuinely formalized consecutive-primitive-root
  theorem or another complete replacement. No such kernel dependency was
  supplied, and no source loophole at the specially defined m=1 is counted.

## Next concrete contribution

The independent combinatorics lane assigned a separate block Schur-elimination
helper for its complete informal MO513259 argument. The candidate is written in
combinatorics_work/mo513259/BlockSchurElimination.lean and handed to its owner for
actual pinned verification. It proves a general algebraic infrastructure step,
not an additional mathematical solution by itself. No new lease or shared
verification-branch mutation was made for that helper.
