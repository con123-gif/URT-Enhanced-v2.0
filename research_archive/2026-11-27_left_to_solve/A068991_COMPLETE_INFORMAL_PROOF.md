# A068991: squarefree integral divisor-ratio terms divide a Bernoulli denominator

This is a complete informal proof accompanying a FULL pinned-kernel-verified
Lean certificate: run46067781887/job140737180507 at21:05:30UTC,
commit91d229e3cd1dcbcca0fc684fd93743067701a7f5. The actual compiler exit is0,
no compiler errors occurred, and OMA.solution uses only propext, Classical.choice
and Quot.sound. This fork verification is not official submission/acceptance.
The source's entire current entry and all35 history changes/discussions were
read. Its conjecture is the literal implication: if positive squarefree n
has integral sum of sigma(d)/phi(d) over d|n, then n divides den(B_(2n)).
The separate recursive-search question in a later comment is not claimed
solved. For n=1 the divisibility conclusion is immediate. Assume n>1 below.

Write P for the distinct prime divisors of n and r=|P|. By multiplicativity
and squarefreeness,

    sum_{d|n} sigma(d)/phi(d)
      = product_{p in P} (1+(p+1)/(p-1))
      = 2^r n/phi(n),           phi(n)=product_{p in P}(p-1).

Integrality therefore gives phi(n) | 2^r n.
For every odd prime ell this implies

    sum_{p in P} v_ell(p-1) = v_ell(phi(n)) <= v_ell(n) <= 1.    (1)

Thus every odd part of p-1 is squarefree and divides n. In particular, its
prime factors are smaller primes in P. The same odd prime cannot divide
two different predecessor factors p-1.

For ell=2, if n is odd, each of the r predecessor factors is even and
the total valuation is at most r, so every v_2(p-1)=1.
If n is even, P contains2, whose predecessor contributes0, and the r-1
odd primes each contribute at least1. Their total valuation is at most
r+1. Equivalently,

    sum_{p in P, p odd} (v_2(p-1)-1) <= 2.                    (2)

Suppose some predecessor has v_2(p-1)>=3. This cannot occur for odd n.
For even n, (2) shows there is exactly one predecessor of valuation3,
and every other odd-prime predecessor has valuation1. In particular5
is not in P, since v_2(5-1)=2.

The exceptional prime is greater than7, so choose the least q in P with
q>7. Every odd prime factor of q-1 lies in P by (1), and is smaller than
q. Minimality of q, together with5 not in P, leaves only3 and7. Equation
(1) also bounds each exponent by1. Hence

    q-1=2^a*b,       a in {1,3},       b in {1,3,7,21}.

The eight candidate values of q are

    3,7,15,43,9,25,57,169.

The only prime greater than7 is43. Its predecessor42 has a factor7,
so7 also lies in P. The two distinct factors43-1=42 and7-1=6 then
force v_3(phi(n))>=2, contradicting (1). This excludes the exceptional
valuation. We have proved v_2(p-1)<=2 for every p in P.

If n is odd we already proved v_2(p-1)=1, so every p-1 divides2n.
If n is even, v_2(2n)=2, and the same conclusion follows from the
valuation bound and the squarefree odd parts in (1). The case p=2
has predecessor1 and is automatic.

The classical von Staudt-Clausen theorem states that the denominator
of B_(2n) is the product of the primes p for which p-1 divides2n.
Every prime dividing squarefree n therefore divides this denominator;
their product n does too. This is the desired implication for all n.

## Review and prior boundary

The parent researcher and a separate collaborating algebra AI agent
independently challenged the valuation budget and least-prime argument.
Both found the argument sound. No human reviewer is asserted.

Current A068991, full35 history changes, and full related A106741/A099008,
A014117 and A347527 entries were read. The unrelated SequenceMachine
A347527 intersection suggestion is not a theorem and is already inconsistent
with nonsquarefree A068991 terms; it was not used. Kellner's2005 two-page primary note was read in full:
it supplies the classical denominator product and a related finite
prime-support strategy for denom(B_n)=n, not this sigma/phi integrality
implication. Don Reble's2018 four-page primary note "A014117 and related OEIS sequences"
was also read in full. Its least-prime closure method and Bernoulli-
denominator equivalences concern p-1|n, not the present phi(n)|2^r*n
condition; it does not state the sigma/phi implication. Both predecessors
are credited as background; no new-method claim is made.
The related Miller2012 NMBRTHRY email is unavailable: direct HTTP and HTTPS
both return503, and the web tool could not retrieve it. It remains explicitly
unread. Initial proper default-all-state upstream PR and actual TrureTuring
exact-code searches returned zero with complete flags; both web engines
found no exact earlier settlement in the checked scope. This bounded audit
is not a universal absence or historical-priority claim.

The complete Lean certificate passed the exact pinned compiler and kernel.
The independent runtime reviewer checked the real per-probe exit0, all error
forms, exact ZIP/GitHub digest, immutable public probe bytes, exact statement
prefix and full canonical proof body. No lease or official submission has
been attempted while the campaign's coordinated desk-write STOP is in force. Research credit: Cornelius Lytollis
(@con123-gif), assisted by ChatGPT/Codex (GPT-6; exact serving variant not
exposed), with collaborating AI runtime/review agents and classical prior
mathematics acknowledged.
