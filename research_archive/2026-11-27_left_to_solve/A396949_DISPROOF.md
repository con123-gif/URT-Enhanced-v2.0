# A396949: disproof of the cubic-logarithm counting conjecture

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex. No historical
priority claim. This is a complete human argument; The exact pinned full Lean certificate has now PASSED (run46056761830/job140701030167; only the three permitted standard axioms). An official contribution and official acceptance are separate stages and have not yet occurred.

The source conjectures that the count C(X) of positive integers n<=X satisfying
omega(n)+Omega(n)=sopf(n) is Theta((log X)^3). Its existing fixed-prime-support
characterization is credited to the OEIS source. The new argument below uses
supports containing one arbitrarily large prime to contradict the upper bound.

Let p>=13 be prime. For any five positive integers e1,...,e5 whose sum is p+21,
form

    n = 2^e1 * 3^e2 * 5^e3 * 7^e4 * 11^e5 * p.

There are six distinct prime factors. The sum of their exponents is p+22 and
the sum of the primes is p+28, so every such n is a member. Unique factorization
makes all the resulting n distinct. There are binomial(p+20,4) choices, at least
p^4/24, and every n is bounded by X_p = p * 11^(p+21).

For p>=13, log(X_p) = log p + (p+21)log 11 <= 31p (using log p<=p and log11<=10).
Consequently

    C(X_p)/(log X_p)^3 >= p/(24*31^3),

which is unbounded because there are arbitrarily large primes. Thus the count
is not even O((log X)^3), so it cannot be Theta((log X)^3).

For a simpler finite-family Lean certificate, let k=floor(p/4), choose four
parameters ui in {0,...,k}, set ei=ui+1 for i=1,...,4, and set
e5=p+17-(u1+u2+u3+u4). Then e5>=17, the exponent sum is still p+21, and there
are (k+1)^4 distinct members below X_p. Since p<4(k+1), this yields the weaker
but sufficient lower bound C(X_p)>p^4/256. The certificate can use this box
instead of invoking a stars-and-bars count.

All assumptions are included: positive integers, distinct primes, positive
exponents, finite count through X, and an unbounded sequence X_p>=p. The
argument does not infer an infinite theorem from finite experiments.

The bounded literature audit found no prior exact settlement in the inspected
material: proper upstream all-state full-ID PR search zero; actual TrureTuring
repository exact code search zero; global Lean exact code search zero; both
web search engines exact and structural searches returned no earlier
asymptotic disproof; related A036878 supplies only the single-prime family.
The actual current OEIS page (revision30) and ALL30 revisions, including every discussion, were read on 27November2026. The asymptotic claim remains conjectural; the history contains no settlement. Live-eligibility and deduplication checks must be refreshed before any lease or official submission. Both static lints pass; the first exact pinned kernel run46055611825/job140697239992 accepted the statement but found formal errors in the full proof (noncomputable marking, support simplification, finite-index normalization, a numeric log simplification, and a tactic timeout). The second run46056267202 reduced the remaining issue to one final multiplication-cancellation API call. After that repair, the third full run46056761830/job140701030167 PASSED at19:28:04UTC with OMA.disproof axioms exactly propext, Classical.choice, Quot.sound and no errors. Independent full-file source and mathematical challenges passed. Finite exact checks cover all6273 box witnesses for p=13,17,23,31; this evidence supplements the infinite proof and is not its basis. The source's elementary fixed-support
identity is not attributed to this campaign.

## Further human corollary, not part of the Lean claim

In fact no fixed power of log X can give an eventual upper bound. Fix r>=3
distinct small primes q1,...,qr, and put S=sum qi and Q=max qi. Choose the first
r primes, so S-2r-1>0. For a prime p>Q use those r primes with positive
exponents whose sum is p+S-r-2, and give p exponent1. Again omega+Omega=sopf.
Choose the first r-1 exponent decrements independently in
{0,...,floor(p/(r-1))}, and let the last exponent balance the sum. It is at
least S-2r-1>0. This gives at least (floor(p/(r-1))+1)^(r-1) distinct members
below p*Q^(p+S-r-2), whose logarithm is O(p). Hence for every fixed d, choosing
r-1>d makes the ratio to (log X)^d unbounded along these prime cutoffs.

This generalization uses the same construction, is not an additional problem,
and has not been formalized or kernel checked. The proposed official target
remains only the source's cubic-logarithm conjecture.
