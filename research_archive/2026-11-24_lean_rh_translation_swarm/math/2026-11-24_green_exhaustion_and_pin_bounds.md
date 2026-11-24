# Close PinNum bounds and Green exhaustion by counting
2026-11-24. Pinned source 40e56bab026552e089d7afcfeff08d2defb9c005. Continuation of finite_character_induced_parameter_proof. No synthetic tests; exact native inequalities. No independent kernel check.

## PinNum: all general bounds
Source: src/Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/PinNum.lean, blob b6859bd0b7f1e8653ff15ab063f946a370746958.
Write B(g,n)=sum_{p prime divides n}(g^(n/p)-1), g>=2,n>=1. The distinct quotients n/p lie between 1 and floor(n/2), hence B<=sum_{j=0}^{floor(n/2)}g^j<=2g^floor(n/2). The last follows by induction: adding g^(m+1) to 2g^m gives at most 2g^(m+1).
For n>=12 write n=2m or 2m+1, m>=6. A=g^m>=2^m>=8m+1 (base 64>=49 and induction). For even n, 2nB+1<=8m A+1< A² since A²-8m A-1>=A-1>0. For odd n, 2nB+1<=(8m+4)A+1<2A²<=gA²=g^n, since 2A-(8m+4)>=8m-2>0. Thus 2nB+1<g^n.
For n=1..11 substitute g=c+h, h>=0, with c=4 for n=2, c=3 for n=4,6, c=2 otherwise. These cover every non-exceptional integer pair. The polynomial P(h)=(h+c)^n-2n sum_{p|n}( (h+c)^(n/p)-1)-1 has nonnegative coefficients and strictly positive constant, proven by the following exact binomial expansions (coefficients ascending degree; independently evaluated using BigInt):
- n=1, c=2: [1, 1]
- n=2, c=4: [3, 4, 1]
- n=3, c=2: [1, 6, 6, 1]
- n=4, c=3: [16, 60, 46, 12, 1]
- n=5, c=2: [21, 70, 80, 40, 10, 1]
- n=6, c=3: [320, 1062, 1095, 528, 135, 18, 1]
- n=7, c=2: [113, 434, 672, 560, 280, 84, 14, 1]
- n=8, c=2: [15, 512, 1408, 1664, 1104, 448, 112, 16, 1]
- n=9, c=2: [385, 2088, 4500, 5358, 4032, 2016, 672, 144, 18, 1]
- n=10, c=2: [343, 3440, 9900, 14560, 13240, 8044, 3360, 960, 180, 20, 1]
- n=11, c=2: [2025, 11242, 28160, 42240, 42240, 29568, 14784, 5280, 1320, 220, 22, 1]
Hence P(h)>0, proving two_bd for every non-exceptional g,n. For one_bd, outside exceptions use nB<=2nB. In the four actual exceptional cases the exact margin g^n-1-nB is positive:
- (2,2): B=1, margin=1
- (3,2): B=2, margin=4
- (2,4): B=3, margin=3
- (2,6): B=10, margin=3
This closes the previously retained PinNum.one_bd and two_bd numerical proof dependencies; combined with PinChar, PinFld and the explicit exceptional orbit classification in the prior chapter, the Pin theorem now has a complete ordinary mathematical argument using standard finite-field/group facts. No inferred new URT premises.

## Green regular-character theorem: actual exhaustion proof
Sources:
- src/Development/WeilBound/CoreStatements/StandardPublishedResults/StandardTheoremStatements/GreenRegularCharacters.lean 5b5cf915ed0b9e38e6e81450657ed8c903a75163
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProofStatement.lean 4d4dbc49de0b8bdb1950f53020b651b82654c67c
- src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/GreenCuspidalCharsByRegularCharsProof.lean 8b77636fe17dd07c59e7b76bc1234be319b82395
- ExistsCuspidalCharacterOfRegularCharacterGLnStatement.lean 19d86e7ba54ddb5ec6ae7d95d53166bc1a6c9a14
- MonicIrreducibleInjectRegularCharacterOrbitsStatement.lean c82520e539321d142b9e52f3e6b3442586737651
- CardCuspidalMultisetsTotalDegreeLeStatement.lean 7f1435efc21379805c109e7e27b32e8c5a89d315
- NcardMonicNatDegreeCoeffZeroNeZeroStatement.lean fdc071c168aa5bad24905dd10086728d40a47f39
The latter four are in the same InertiaEigenvalues directory.

Fix prime g and degree d>0. Actual upstream existence theorem produces a family τ of cuspidal characters indexed by regular multiplicative characters θ of a degree-d finite field K. It supplies the degree product over 1<=i<d of (g^i-1), the elliptic character formula, and equality of τ exactly up to Frobenius conjugacy of regular θ. This is an important imported producer, not a hypothesis added to RH.

For each e>0 choose an e-degree finite field, using the specified K itself when e=d. The native primeLab_to_regularChar injects monic irreducible nonzero-constant polynomials of degree e into regular character orbits. Compose with the existence family to obtain L_e(P), a cuspidal character of GL_e(F_g), injective on such P. At degree d its image is contained in the specified τ family. At degree zero there are no irreducible prime labels (irreducible polynomial over field has positive degree). Consequently the graded map P↦(deg P,L_deg P(P)) is injective.

Let T be the set of monic degree-d polynomials with nonzero constant term. Its cardinality is (g-1)g^(d-1)=g^d-g^(d-1): choose the nonzero constant and d-1 arbitrary other coefficients. This independently explains the native GrPolys count. Factor each f∈T into a multiset of monic irreducibles. Every factor has nonzero constant term, since otherwise X divides f. Unique factorization and monicity give product of these factors=f. Mapping every factor by the graded injection gives a multiset F(f) of cuspidal characters of total degree d. This map is injective: invert each mapped factor on the image of the graded injection, then multiply. It retains multiplicities, not merely a set of factors.

Suppose χ is a degree-d cuspidal character outside the τ family. Its singleton multiset is not F(f) for any f, because equality of multisets would force one factor P of degree d with L_d(P)=χ, contradicting image containment. Adjoin this singleton to the image of T. The resulting finite set S of cuspidal multisets all of total degree d has cardinal g^d-g^(d-1)+1. But the native CardCuspidalMultisetsTotalDegreeLe theorem bounds every such S by g^d-g^(d-1). Contradiction. Thus every χ is in τ. This is the exact exhaustion argument in greenRegularCharacters_holds, not a circular call to Green regular classification.

## Remaining frontier
The Green exhaustion wrapper, PinNum general and exceptional inequalities, and polynomial count are now reconstructed. Retain these native producers explicitly: ExistsCuspidalCharacterOfRegularCharacterGLn (actual Green character construction and orbit equality); MonicIrreducibleInjectRegularCharacterOrbits; CardCuspidalMultisetsTotalDegreeLe (global upper count). They are not discharged by the counting argument. Next translate these, especially the upper count, then integrate with NameLaws, ParEx and the seven-input theta Green bridge. No full RH proof or kernel validation claimed.
