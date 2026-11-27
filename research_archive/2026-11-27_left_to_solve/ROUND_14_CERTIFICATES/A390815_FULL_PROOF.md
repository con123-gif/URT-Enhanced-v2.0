# A390815: factorial packing proof

2026-11-27. Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex
(GPT-6; exact serving variant not exposed). Mathematical derivation below;
Full pinned Lean kernel checking passed in Batch9, run46025483748, job140595672705.
Only propext, Classical.choice and Quot.sound occur in the OMA.solution axiom
audit. Official statement/proof acceptance and priority remain unclaimed.

Source: <https://oeis.org/A390815/internal>, Claude H. R. Dequatre,
2026-02-17. Both original conjectures remain in the source: all reduced
denominators greater than one of n!/sigma(n) are prime; if n>=4 and sigma(n)
does not divide n!, then n is a square. Exact-ID GitHub search returned no PRs
before the lease; the live brief showed zero other agents. Related A062700
lists prime divisor sums but does not establish this denominator classification.
Initial literature searches found no matching factorial-divisibility proof;
that is not an exhaustive novelty review.

## 1. Two bounds for a prime power

For x=p^e with p prime and e>=1,

    sigma(x) = 1+p+...+p^e < 2x.

If p>=3, the sharper integer inequality is 2 sigma(x)+1 <= 3x.
Both follow by induction on e: append p^(e+1) and use p>=2 or p>=3.

## 2. Packing factorial factors

For positive integers r_i, the product of r_i! divides (sum r_i)! by
multinomial integrality. Also r_i divides r_i!. Thus if positive factors
s_i have sum at most n, their product divides n!.

If a,b>1 are distinct prime powers with coprime bases, then

    sigma(a)+sigma(b) <= ab,

except the pair {a,b}={2,3}.

If a,b>=3, coprimality excludes a=b=3. After exchanging them assume a>=4,
b>=3. The first bound gives a sum <=2a+2b-2<=ab, since
(a-2)(b-2)>=2. If a=2 and b is odd and >=5, the sharper bound gives
sigma(2)+sigma(b)<=3+(3b-1)/2<=2b. The exceptional product is six, and
sigma(6)=12 divides 6!=720 directly.

Consequently sigma(ab) divides (ab)! for a product of two distinct
prime powers. More generally,

    for every n>0, sigma(n) divides n! or n is a prime power.

One proof uses induction over products of coprime integers. Two already
divisible factors pack into (a+b)!, with a+b<=ab for a,b>=2. If one
factor a is a prime power while sigma(b) divides b!, then b cannot be two,
so b>=3. Pack sigma(a) and b: sigma(a)+b<=2a-1+b<=ab. If both factors
are prime powers use the preceding paragraph. This argument avoids any
assumption about the sizes of higher-order divisor sums.

## 3. A composite below 2n divides n!

For n>=6, every positive composite M<=2n divides n!.
If M<=n this is immediate. Otherwise write M=ab with a,b>=2. Both factors
are at most n. If a!=b, their separate occurrences in n! give ab|n!.
If a=b, then a>=3. For a=3 the condition n>=6 puts a and 2a in the
factorial. For a>=4, a^2<=2n and 4a<=a^2 imply 2a<=n. Again a and 2a
occur separately, so a^2 divides n!.

## 4. Complete classification

Let n>=6 and suppose sigma(n) does not divide n!. Section 2 makes n a
prime power. Section 1 gives sigma(n)<2n. Section 3 shows sigma(n) cannot
be composite. Hence sigma(n) itself is prime, and it exceeds n (otherwise
it would be a factor in n!). Therefore the reduced denominator is exactly
this prime, because it is coprime to n!.

If n=p^e and e is odd, p+1 divides 1+p+...+p^e. Primality forces the sum
to equal p+1. Since it exceeds n=p^e>=p, this gives n=p. For n>=4,
p is odd, and p+1 is an even number greater than two, contradiction.
Thus e is even and n is a square.

Small inputs complete both original conjectures:

| n | n!/sigma(n), reduced | denominator |
|---|---|---|
| 1 | 1 | 1 |
| 2 | 2/3 | 3 |
| 3 | 3/2 | 2 |
| 4 | 24/7 | 7 |
| 5 | 20 | 1 |

The sole exceptional n>=4 below six with a nontrivial denominator is
four, a square. This proves both source conjectures analytically.

There is also an exact classification for n>=4: a nontrivial denominator
occurs if and only if sigma(n) is prime, and then the denominator equals
sigma(n). The reverse implication follows from sigma(n)>=n+1, since one
and n are distinct divisors, so a prime divisor sum exceeds every factor
of n!. This answers the source's comparison with A062700: A390815 is the
list of prime divisor sums in input order, with the extra denominator two
from n=3 inserted after its initial three. This corollary is an analytical
consequence; it is not a second independently accepted problem.

## Verification and resume

The prime-power-component sum bound was independently checked for every
n=4,...,100000; six was its only exception, as the proof predicts. This
finite check does not establish the theorem. A separate independent certificate
checked both original assertions on all 100000 positive inputs using
Legendre valuations of factorials: 24 nontrivial denominators, matching the
source prefix. The component bound covered 90299 non-prime-power composite
inputs, again with only the n=6 exception.

`A390815_proof.lean` is the canonical complete 353-line proof. It
contains the geometric bounds, factorial packing, composite lemma,
coprime-product induction, prime-power classification, odd-exponent
factorization, and both exact target assertions. It passed the exact Lean4.33.1 kernel run. `A390815Lemmas.lean` preserves the initial standalone
helper checkpoint and may become stale during compiler repairs. Remaining:
obtain a fresh live desk lease, submit the already-checker-accepted statement,
then recheck and submit the proof against the exact merged declaration.

The initial formalization lease expired: GET heartbeat returned HTTP410 at
15:21:13 UTC, and all use of that lease stopped. The old private assignment
was renamed with an expired suffix to prevent accidental reuse. A fresh
eligible lease is required before submission. PLAN note #37542 and analytical
proof note #38607 record the route.
The faithful statement is `A390815_statement.lean`. Do not count a statement
merge or this human-readable proof toward the twenty accepted solutions.


Earlier compiler checkpoint (superseded by successful Batch9 below): exact pinned batch7, run46023392462/job140588472228,
reported six implementation errors and no mathematical counterexample. These
were repaired in the 352-line canonical proof: explicit prime bound,
commutative multiplication normalization, preservation of the Nat divisibility
instance, explicit geometric-sum split, correct Nat theorem namespace, and
the pinned version's positivity argument for Nat.div_self. At that earlier checkpoint the repaired file awaited a rerun; the successful
Batch9 below supersedes its kernel status. Official acceptance remains pending.


FINAL KERNEL CHECKPOINT (2026-11-27 15:32 UTC): Batch9 run46025483748,
job140595672705, public probe commit de183fcc4627ed6955af2f1a54dfa36f5b9ab0f9,
compiled the entire proof without errors. The statement retains its one
required upstream hole, but OMA.solution depends only on propext,
Classical.choice and Quot.sound: no sorryAx. Excerpt saved in
A390815_KERNEL_PASS.log. Canonical proof SHA256:
e7129db0a12fbf786e68e54602ea6574c4711aba8bb87f2f40d3a3bda3a8fb50.
Statement SHA256:
36e665dbff1a7ca486f5dd6007ca366c76d6339994a041ecf10386aa71fb8de8.

Fresh exact-ID PR search returned zero at 15:33 UTC and the brief remained
unformalized/open. Two fresh claim attempts returned HTTP500, with no valid
lease response. No current assignment was saved; the expired lease was not
reused. Root is arranging the established Actions route. No official proof
submission or accepted campaign result is claimed at this checkpoint.


LIVE SUBMISSION CHECKPOINT (2026-11-27 15:41 UTC): Root obtained a fresh
A390815 assignment with actual HTTP200, lead role and zero other agents, using
HTTP1.1 and the Codex-math-campaign client identifier. A subsequent supported
GET heartbeat returned HTTP200. The full-kernel-pass PLAN, including both
source hashes and public probe, was officially acknowledged as note40875
with HTTP200. This supersedes the infrastructure blocker above. The old
expired assignment remains retired. The statement PR is being prepared;
no official proof acceptance is claimed.


STATEMENT SUBMITTED (2026-11-27): Official PR #8102, https://github.com/GuillaumeBAUD-coder/open-math-agents/pull/8102 , head65315dc78d3c31ab62051c35bc8d23d0f777a764. DONE note posted with HTTP200; fresh lease released with HTTP200, reason submitted. The full kernel proof awaits the official statement merge/import and subsequent proof checker verdict. No accepted proof is counted from the statement PR.
