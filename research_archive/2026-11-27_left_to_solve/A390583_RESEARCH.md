# A390583: equal largest Descartes radii

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.27 November2026. Complete mathematical argument and full Lean certificate FIRST-PASS verified in the exact pinned compiler, run46046194063/job140665952355, public commit221bdca74010f2129aff8c050274a6df235960e3. OMA.solution has only propext, Classical.choice and Quot.sound; no proof errors. The official statement checker also returned accepted/errors[]. Mandatory formalization claim is being recovered through the established secure Actions route after one local500; no official statement/proof PR yet asserted. Structural literature/source audit passed within its explicitly bounded scope; no priority assertion.

## Exact selected claim

The current primary entry, https://oeis.org/A390583/internal, revision10 dated17 November2025, defines primitive positive integer radius quadruples by the explicitly displayed Descartes equation. Its selected catalogue conjecture says that when the largest two radii are equal, the absolute difference between the other two is a cube or twice a cube. The catalogue selects this exact comment. A separate arbitrary-chain question elsewhere in the entry is outside this target and remains untouched.

For ordered radii (x,y,R,R), positivity and primitivity mean 0<x<=y<=R and gcd(gcd(x,y),R)=1. The formal target retains these hypotheses and the exact rational Descartes equation. The natural difference y-x equals the source's absolute difference.

## Complete proof

Clearing the positive denominators in Descartes gives

\[
R(y-x)^2=4xy(x+y).
\]

Write x=ga,y=g(a+delta), where g=gcd(x,y). Then gcd(a,delta)=1, gcd(g,R)=1, and cancellation of g² gives

\[
R\,delta^2=4g\,a(a+delta)(2a+delta).
\]

Use the elementary uniqueness of reduced fractions: if R*D=g*N, gcd(R,g)=gcd(D,N)=1, then g=D. One direction of divisibility follows from each coprimality, so equality follows by divisibility antisymmetry.

* If delta is odd, delta is coprime to2,a,a+delta,2a+delta. Consequently delta² is coprime to4a(a+delta)(2a+delta). Reduced-fraction uniqueness gives g=delta², so y-x=delta³.
* If delta=2d with d odd, then a is odd and gcd(a,d)=1. Cancel4 to obtain R*d²=g*[2a(a+2d)(a+d)]. The bracket is coprime to d, and therefore to d². Uniqueness gives g=d², hence y-x=2d³.
* If delta=4e, a is odd and gcd(a,e)=1. Cancel8 to obtain R*(2e²)=g*[a(a+4e)(a+2e)]. The bracket is odd and coprime to e, hence coprime to2e². Uniqueness gives g=2e². Therefore y-x=8e³=(2e)³.

The parity cases exhaust all natural delta. The formal proof also handles delta0 without assuming a nonexistent geometric configuration exists. All arguments are exact algebra and gcd cancellation, with no finite search used as an infinite proof.

## Files and verification boundary

`oeis-a390583.statement.lean` faithfully states the selected whole conjecture. `oeis-a390583.proof.lean` contains the complete initial certificate using a shared reduced-cross-product lemma and all three parity cases. `ProbeA390583.lean` combines the statement and proof for the pinned remote compiler. No other source conjecture or artificially split consequence is counted as a second solution.

The official static linter passed both isolated statement and proof paths. Full kernel verification subsequently passed on the first run; the local exact checker excerpt is `A390583_FIRST_FULL_KERNEL_PASS.log`. Descartes' theorem and reduced-fraction uniqueness are standard prior mathematics and are credited as such. No changes to the frozen checked statement/proof/probe have been made since the pass.

## Completed bounded source and prior gate

The number-theory lane read all10 historical revisions of A390583 completely, as well as the full related primary entries A390148 and A290508. The cube conjecture was introduced in the author's initial substantive revision2,11 November2025, and has not been replaced by a proof in those revisions. The three known regular source families only cover the individual differences1,2,8; they do not give the general primitive classification. The related sphere-and-plane entry A390148 has a different Descartes factor3 and different conjectures. A290508 provides the general radius equation, examples and classical packing references without the target cube classification.

The independent algebra prior-work lane completed the previously pending Bradley gate. It read Christopher J. Bradley, Challenges in Geometry(OUP2005), Section7.2 in full, including Eq7.2.5, through the complete book text at https://www.academia.edu/8307088/Geometry, with publisher edition/scope independently verified at https://academic.oup.com/book/53934/chapter-abstract/422195812. The section supplies a generic integer-curvature parametrization followed by reciprocal radii and LCM scaling. It does not state or prove this primitive equal-largest-radii cube property, or provide the necessary primitive gcd normalization. Its general construction is acknowledged as earlier background; no global priority conclusion follows. The same lane independently challenged all three gcd/parity cases and found no mathematical gap. This bounded prior gate permits kernel checking, without any assertion that all world literature has been exhausted.

Independent exact computational challenge:3003 primitive ordered equal-largest configurations with1<=x<y<=1500 were tested, including1676 odd normalized differences,826 differences congruent2 modulo4, and501 divisible by4. All matched the three proved gcd identities and the source conjecture. `A390583_EXACT_FINITE_CHECK.json` records this finite validation; it is not used as an infinite proof.
