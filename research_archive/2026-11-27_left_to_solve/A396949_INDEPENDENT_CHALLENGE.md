# A396949: independent exact-source and full-certificate challenge

27 November2026. Cornelius Lytollis (@con123-gif), assisted by Codex/GPT-6; exact serving variant not exposed. This lane claims no lease or compiler pass for this target.

## Source and prior review

The full actual current OEIS internal entry, revision30, saved by the number-theory lane as number_work/A396949_current.html, was independently read. It conjectures a cubic-logarithm order of growth for the count of all positive qualifying integers up to N, without a restriction on their prime support. The source's fixed-support exponent characterization, single-prime infinitude and two-prime count are prior facts. None states the proposed asymptotic negation. The number-theory lane separately reports reading all30 historical revisions; that complete historical read is its work, not asserted as independently repeated here.

Proper exact TrureTuring repository code search and global Lean-language code search both returned0/incomplete=false. Exact-ID and structural equation/asymptotic searches in both web engines located no exact earlier resolution in this bounded review. The related primary A036878 internal entry was also read: it supplies the old single-prime p^(p-1) subsequence and refactorable-number references, not a bound for all prime supports. These checks support proceeding, without a worldwide first-priority claim. Fresh upstream PR and live-eligibility gates remain the submitting lane's responsibility.

## Independent mathematics: pass

Fix a prime p>=13. For u in the four-dimensional box {0,...,floor(p/4)}^4, put s=u0+u1+u2+u3 and construct

    n(u)=2^(u0+1)3^(u1+1)5^(u2+1)7^(u3+1)11^(p+17-s) p.

Since s<=p, all six exponents are positive. Their sum is p+22, including exponent1 on p. There are six distinct primes, whose sum is p+28, so omega(n)+Omega(n)=6+(p+22)=p+28=sopf(n). Unique prime factorization at2,3,5,7 recovers u, proving injectivity.

The exponents on the five fixed primes sum to p+21. Each fixed prime is at most11, hence n(u)<=X=p11^(p+21). Thus the actual count at X is at least (floor(p/4)+1)^4. Also p<=4(floor(p/4)+1), so

    p^4 <=256 count(X).

For p>=13, log(p)<=p-1 and log(11)<=10 imply

    log(X)=log(p)+(p+21)log(11)<=31p.

If the source's Theta assertion held, its upper Big-O bound would give count(X)<=C(log X)^3 for all sufficiently large X, with C nonnegative. Choose an arbitrarily large prime p exceeding the original threshold and256*C*31^3. Since X>=p, the upper bound applies. Combining the preceding inequalities yields

    p^4 <=256*C*31^3*p^3,

and positive p^3 cancels to contradict the choice of p. Euclid's unbounded-primes theorem suffices; no prime number theorem or asymptotic prime estimates are used. This disproves the literal full Theta assertion by refuting its upper-bound part, without replacing it by a weaker fixed-support claim.

## Full actual Lean files independently read

Both number_work/oeis-a396949.statement.lean and its complete200-line .proof.lean were read without edits. The statement counts exactly positive integers in1..N by unique factorization support cardinality, exponent sum and distinct-prime sum. It includes1 and excludes0 correctly. Its target is the literal IsTheta atTop over the natural index N with real natural logarithm cubed.

The certificate implements the full box, positive last exponent, exact factorization, support, injection and global size bound. Its Big-O norm removal uses nonnegative counts and logarithms of natural indices; the chosen large prime and X>=p ensure the threshold. The constant256 and final cancellation match the independent argument above. No source weakening or mathematical defect was found. This is a source/mathematics challenge, not an assertion of elaboration or axiom verification; the actual pinned checker result must be recorded separately.

Frozen files reviewed:

- Statement SHA256 e0ba6fb55c3ab8edc50932808b455176144ec061cc901167590a88db3c400a4f.
- Proof SHA25692442c2f6391561ade53a34b5baaf0431254a551fc005ed2cb1feb967a04d4fb.
