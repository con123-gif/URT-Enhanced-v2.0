# A181674: the proposed log-log average order is false

Research credit: Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.
This is a complete informal argument using classical Chebyshev bounds. The full
Lean disproof passed the exact pinned kernel check at20:24:17UTC on November27,
2026: run46063152958, job140722015963, commitc9cbdbc848efaa11bd3b0bb018054759fcb0f2ba.
OMA.disproof uses only propext, Classical.choice and Quot.sound, with no errors.
This is a fork verification result; no official submission, acceptance or
historical-priority claim is asserted by this receipt.

The current source is OEIS A181674, revision11. Its full current entry, all11
historical revisions with discussion, and the related A175933/A100949 records
were read. The full defining A001358 and A002110 entries were also read. Charles R. Greathouse IV's2011 conjecture remains explicitly:
"Average order is Theta(log log n)." The standard average-order convention is
that the sum of a(n) through N has order Theta(N log log N), equivalently that
the arithmetic mean through N has order Theta(log log N). No pointwise lower
bound is substituted for this mean assertion.

Let K(X) count DISTINCT primorial values <=X, including1, and let Q(X) count
semiprimes <=X, including prime squares. Let S(X) be the total number of
unordered primorial-plus-semiprime partitions of positive integers <=X.
Recording an unordered partition by its nondecreasing pair gives

    S(X) <= 2 K(X) Q(X).

Indeed every such pair lies in the product of the two sets in one of the two
orientations. This loose factor2 avoids any issue concerning the overlap at6.

## Primorial bound

Classical Chebyshev estimates give psi(x)-theta(x)<=C sqrt(x) for an absolute
C and psi(n)>=n log2-log(n+1). Using
log(n+1)<=2 sqrt(n)+2 and

    (C+2)sqrt(n) <= n/4+(C+2)^2,

which follows by completing a square, yields

    theta(n) >= n/4-B,  B=(C+2)^2+2.

Every primorial value other than1 equals primorial(p) for a largest included
prime p. If this value is <=X, then theta(p)=log(primorial(p))<=logX, hence
p<=4logX+4B. Thus

    K(X) <= 1+pi(4logX+4B) = O(logX/loglogX),

by the classical Chebyshev upper bound pi(t)=O(t/logt). No prime number theorem
or inverse-primorial asymptotic is required.

## Semiprime bound

The same Chebyshev bound, followed by finite partial summation, gives

    H(Y):=sum_{p<=Y}1/p = O(loglogY).

For completeness, the exact identity for Y>=2 is

    H(Y)=pi(Y)/Y + integral_2^Y pi(t)/t^2 dt.

Beyond any fixed threshold at which pi(t)<=C t/logt, the integral is at most
C times the integral of1/(t logt), which is C loglogY plus a fixed constant.
The fixed initial interval is absorbed because loglogY tends to infinity.

Every semiprime p*q<=X can be ordered with p<=q, so p<=sqrt(X). Consequently

    Q(X) <= sum_{p<=sqrt(X)} pi(X/p).

For all these p, X/p>=sqrt(X), so the Chebyshev bound holds uniformly once
X is large. Also log(X/p)>=logX/2. Therefore

    Q(X) <= (2C X/logX) H(sqrt(X))
         = O(X loglogX/logX).

## Contradiction to the exact source conjecture

Combining the two bounds gives S(X)=O(X). Hence the arithmetic mean S(X)/X
is bounded. Since loglogX tends to infinity, it cannot be bounded below by a
positive constant times loglogX for all sufficiently large X. This disproves
the claimed Theta average order.

The argument does not claim an exact limiting mean. Any stronger mean->1
claim would require a separate proof and is not part of the proposed Lean
target or campaign count.

## Source and prior boundary

The exact conjecture was freshly eligible with zero agents and no declaration.
Proper default-all-state upstream full-ID PR search, actual TrureTuring
repository exact-ID code search and global Lean exact-ID search all returned0
with complete result flags. Both web search engines were used for the exact
ID and primorial/semiprime average-order formulations. No earlier exact
settlement was located in this bounded screen. This is not a universal absence
or first-priority claim.

All Chebyshev bounds, reciprocal-prime partial summation and the elementary
factor-pair bound are prior mathematics. Their application here is the
disproof of the source's stated conjecture. The verified certificate uses
actual Mathlib Chebyshev declarations and a proved prime-harmonic helper,
not unproved PNT, Landau or Mertens assumptions.

Independent collaborating AI agents challenged the complete informal argument and
the analytic closure. The runtime collaborator supplied the proved Abel/prime-
reciprocal and semiprime upper-bound modules. No human reviewer is asserted.
The exact sorted-pair definition matches all105 displayed source terms in the
reproducible finite sanity check; finite values are not the asymptotic proof.
