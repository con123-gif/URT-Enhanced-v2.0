# A399155: finite positive level sets

Status: mathematical derivation awaiting independent review; not Lean checked.
This is an extension on the same problem ID, not a second campaign solution.

The OEIS source also records the empirical observation that each positive
value of D(n)=F(n)-G(n) occurs only finitely often. The following bound proves it.

First prove, for n!=1,

    5 G(n) <= 2 n + 2.

Use strong induction on n. The cases n=0,2,4 are immediate. If the greatest
prime factor q of n is at least three, subtraction gives

    5 G(n) <= 5 + 2(n-q) + 2 <= 2n+1.

If q=2, n is a power of two. For n>4 the greatest prime factor q' of n-2
is at least three: otherwise n and n-2 would both be powers of two, which
differ by two only for n=4. Apply induction after two subtractions:

    5 G(n) <= 10 + 2(n-2-q') + 2 <= 2n+2.

None of the subtractions leaves one, as established in the main proof.
All applications of induction therefore avoid the exceptional input.

For composite n, its least prime factor p is at most sqrt(n), and the main
proof gives F(n)=1+(n-p)/2. Consequently

    D(n) >= n/10 - sqrt(n)/2 + 3/5.

For n>=100, sqrt(n)<=n/10, so

    D(n) >= (n+12)/20.

Prime inputs have D(n)=0. Hence, for a fixed positive integer k, every input
with D(n)=k is composite and lies below max(100,20k+5). This proves that each
positive level set is finite and provides a simple explicit search bound.

The coarser displayed search bound intentionally leaves room in the
inequality; the preceding stronger bound gives n<=20k-12 for n>=100.

RESUME HERE: independently review the two-step estimate, then construct
Lean lemmas after the main nonnegativity proof is accepted. Do not enlarge
the already submitted statement or count this as a distinct problem.
