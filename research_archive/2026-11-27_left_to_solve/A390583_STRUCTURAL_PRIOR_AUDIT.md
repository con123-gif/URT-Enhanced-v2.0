# A390583: exact structural prior gate

27 November2026. Verdict: **PASS for kernel verification of the complete cube conjecture; no exact prior settlement located in the bounded inspected material.** This is not a historical-first or new-method assertion. No lease or GitHub write was made by this lane for this target.

## Actual prior source inspected

Christopher J. Bradley, *Challenges in Geometry: for Mathematical Olympians Past and Present*, OUP2005, §7.2, pp109–112. The [publisher's chapter metadata](https://academic.oup.com/book/53934/chapter-abstract/422195812) establishes the author, edition, pages and date. The actual complete §7.2 was read in the [full primary book text](https://www.academia.edu/8307088/Geometry), including Eq7.2.5 and its surrounding derivation. The initially discovered standalone PDF mirror returned404; no claim is made to have read that failed download.

Equation7.2.5 parametrizes integer **curvatures**, with

\[
\alpha=f^2+4d^2+3ed+fd,\quad
\beta=e^2+4d^2+3fd+ed,\quad
\gamma=e^2+f^2+2ef-2d^2-ed-fd.
\]

It gives u and the two fourth curvatures as well, and obtains integer radii by reciprocal conversion and LCM scaling. This is a general parametrization of configurations, not a primitive equal-largest-radius classification. The section contains no cube/twice-cube conclusion and no corresponding primitive gcd normalization. The broader book text searches found no equal-radii discussion or relevant number-theoretic cube claim. Converting generic parametrizations to the requested primitive property still requires an arithmetic normalization argument; the book is acknowledged prior background, not a located resolution of the exact conjecture.

The actual [Graham–Lagarias–Mallows–Wilks–Yan number-theory paper](https://arxiv.org/pdf/math/0009113), arXiv math/0009113v2, was opened and its readable full text downloaded. Its abstract and relevant exact-text searches concern integral curvature packings and locate no equal-radius cube theorem. The older Michigan PDF has broken text encoding; the arXiv copy is usable. This is a relevant-scope check, not a claim that all53 pages were read line by line.

## Exact source scope

The full current [A390583 primary record](https://oeis.org/A390583/internal), revision10, was independently read. The selected conjecture is precisely: for a primitive positive integer radius quadruple whose two largest entries agree, the difference of the two remaining entries is a cube or twice a cube. Primitivity means the common gcd of the tuple is1; it cannot mean pairwise coprimality because the largest two radii are repeated. The catalogue selects this cube assertion. A separate arbitrary-chain question in the same OEIS entry is outside this target and must not be claimed solved by the cube proof. The number-theory lane independently read all10 source-history revisions plus A390148 and A290508; no earlier exact cube resolution was found there.

Strong searches used both exact IDs and the structural descriptions: integer/rational radii, two equal radii or curvatures, primitive Descartes quadruples, cubes and Soddy circles. No exact earlier cube-property proof was located. These are bounded negative findings and do not prove universal priority.

## Independent full mathematical challenge

For ordered radii x<y and repeated R, clearing the positive denominators in Descartes' equation gives

\[
 R(y-x)^2=4xy(x+y).
\]

Write x=ga,y=gb with gcd(a,b)=1, and put delta=b-a>0. The tuple's primitivity gives gcd(g,R)=1. Dividing by g² yields

\[
 R\,\delta^2=4g\,ab(a+b).
\]

The number-theory lane's three cases were independently derived and checked:

* If delta is odd, it is coprime to4ab(a+b). Thus g=delta² by divisibility and gcd(g,R)=1, and y-x=delta³.
* If delta=2d with d odd, then d is coprime to ab(a+b), forcing g=d² and y-x=2d³.
* If delta=4e, then a,b are odd and ab(a+b)/2 is odd and coprime to e. The equation becomes2Re²=g·ab(a+b)/2; primitivity forces g=2e² and y-x=(2e)³.

Every original case is covered. The source's ordering and largest-radius conditions may be retained in the statement even though the arithmetic argument proves a stronger implication. No mathematical defect was found. The129-line Lean candidate remains subject to actual kernel verification; no pass is fabricated by this audit.

The actual complete `number_work/oeis-a390583.statement.lean` and `number_work/oeis-a390583.proof.lean` were then independently read in full. The statement retains the rational Descartes equation,0<x≤y≤R, common-tuple-gcd primitivity and the entire cube-or-twice-cube conclusion. The proof includes both the denominator-clearing bridge and the positive-gcd reduction to the three arithmetic branches. The full mathematical/source challenge passes; Lean elaboration remains for the actual checker.

The explicit PASS was sent to both root and number theory, allowing the guarded verifier submission to proceed. Prior methods and the classical Descartes theorem must be credited; neither an accepted proof nor first-ever mathematical resolution is asserted here.
