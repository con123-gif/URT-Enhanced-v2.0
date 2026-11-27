# C2: a checked uniform standard-pair interface

27 November 2026. **One new restricted interface is checked.** This is not
the original general finite-modulus exchange statement or a completed
determinant class-sum replacement. RH and root C2 remain OPEN.

With the original rank, sign, weight and rapidness conditions, one common
real C and one rapid datum x work for every semilocal tame character:

\[
 \forall\mathfrak c\;\exists c_{\mathfrak c}\ne0,\qquad
 |c_{\mathfrak c}|^2=C\,\Pi_{\mathfrak c}(e).
\]

The same coefficient gives the theta-integral identity for every integral
standard row/column pair. C and x are chosen before the character; neither
is fitted separately to the family. All original measure factors remain.

The proof uses the two already checked C2 suppliers. The equal-rank
reference gives a fixed R₀≠0. The standard-pair helper gives a fixed D and
the required integral identity with D|c|²=Π(e)R₀. Positivity of Π(e) implies
D≠0 and c≠0 for every actual character. Set C=R₀/D. The rank and weight
arithmetic is proved explicitly in the source.

Actual Lean 4.35.0 compilation: **exit 0, 56.16 s**, standard axioms only,
both required suppliers consumed, original general targets absent directly.
Source blob `1b945d4df64ade81cb8ccf5f345a52668afc5f7a`.
Checked module: 640,504 bytes, SHA256
`9f4256154fcef86ce5f586bcfe41b6c23a1ea741f1d75d321062beb7a82108a8`.

The two-root constructor-inclusive comparison also passes: 118,229 union
declarations, 3,796,760 edges, zero missing endpoints, both independent
verifiers and all seven supplier guards. The new interface reaches the
checked nonzero reference and standard helper, while the original general
exchange and original equal-rank target are absent transitively.
Its closure has 118,068 declarations; the general exchange has 118,191.
These statements have different interfaces, so this is not an established
size reduction for an unchanged determinant theorem.

Exact [source](C2_STANDARD_EXCHANGE_UNIFORM.lean),
[compiler receipt](2026-11-27_standard_exchange_receipt/standard_exchange_results.json),
[compiler log](2026-11-27_standard_exchange_receipt/compile.log), and
[graph evidence](2026-11-27_standard_exchange_graph_receipt/)
are retained. The first attempt's four unfilled arithmetic/sign premises
remain preserved as a failed attempt; the accepted proof has none.

The determinant datum identity is now checked separately: inverse finite
character of the determinant lifts to the semilocal standard column datum.
This uses local-hom unit reflection and compatibility on integral units;
surjectivity is unnecessary. The empty-column finite lift and standard
datum are also proved to be the constant function one. This does not set
the rank-zero Haar volume equal to one.

All three new algebra declarations passed actual Lean compilation
(exit 0, 69.83 s), with standard axioms only. A separate environment audit
(exit 0, 78.27 s) confirms that the general exchange, explicit matching
and determinant class-sum targets are absent from the whole imported
kernel environment of these algebra lemmas. This absence audit is not
a new complete constructor graph. Source blob
`052a8d386b6573cac924804cbc7640a34957b045`; module SHA256
`c01028a6552e518437792dd9b0a6b2778d9cba80bceca79745093f110b2bdd1d`.

Exact [algebra source](C2_DETERMINANT_LIFT.lean),
[receipt and environment audit](2026-11-27_determinant_lift_receipt/),
and all three failed prior attempts are preserved.

Next: construct the modulus-specific character and reduction map to join
these two checked interfaces, then reuse the native real_matching
specialization and exact rank-zero Haar normalization at the class sum.
No arbitrary-partner extension is needed by this restricted supplier,
but the actual consumer attachment still requires its own proof and audit.
