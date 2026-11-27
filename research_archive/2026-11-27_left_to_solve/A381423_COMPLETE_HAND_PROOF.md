# A381423: exact signed Hermite mode and complete difference blocks

For Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex (GPT-6; exact serving variant not exposed), 27 November 2026. The complete mathematical argument and matching ENTIRE source-faithful Lean certificate passed the actual pinned kernel: run46050735604/job140681094261, commit00e8488018183316ee9f0cb1a32767b4e332595a, OMA.solution standard three axioms only and exit0. Official statement/proof contribution and final acceptance remain pending. No lease is currently confirmed for this target.

Primary source: [A381423](https://oeis.org/A381423), revision8, Mike Sheppard, 2025. The source uses the **signed** coefficients of the physicists Hermite polynomial, not their absolute values. Its example selects exponent1 in H5, since the coefficient120 exceeds −160. Its full conjecture concerns the1/−3 differences, the blocks (1,1,1,−3) and (1,1,1,1,−3), their spacing, and square-root growth. The informal spacing sentence is made precise below by an exact description of every negative jump and every block.

The earlier public TrureTuring module `D5/S3/Analytic/Polynomial/HermiteSignedMode.lean`, commit `1b672a9b9ddf56469cac348e77e27f078420eb6f`, was fetched and read in full (294 lines). It proves the signed selector and the1/−3 difference clause, and expressly leaves uniqueness, fine patterns, spacing and growth outside its claim. That known partial result is acknowledged and will not be counted as a new solution. The argument below addresses the complete finer characterization. Exact global historical priority remains unverified; the current bounded searches found no earlier statement of this stronger formula.

## Exact maximum coefficient

Write c(n,j) for the signed coefficient of x^j in H_n. DLMF18.5.13 gives, for j≤n and n−j even,

\[
c(n,j)=(-1)^{(n-j)/2}\frac{n!\,2^j}{((n-j)/2)!\,j!};
\]

all remaining coefficients are zero. Positive coefficients occur exactly when j≡n modulo4. Since the leading coefficient is positive, the signed maximum occurs on this residue class.

For j≥4 in the positive class, direct factorial cancellation gives

\[
\frac{c(n,j-4)}{c(n,j)}=
\frac{j(j-1)(j-2)(j-3)}{4(n-j+4)(n-j+2)}.
\]

Put A=j²−3j+1 and t=n−j+3. Then A is an odd integer at least5, t≥3, and

\[
j(j-1)(j-2)(j-3)+4=A^2+3.
\]

Because A is odd, (A−1)²<A²+3<(A+1)², and an even integer2t cannot equal A. Consequently

\[
4t^2\le A^2+3\iff 2t\le A-1.
\]

Equality of the two adjacent positive coefficients is impossible: it would require (2t−A)(2t+A)=3 while2t+A≥11. Therefore the exact strict comparison is

\[
c(n,j)>c(n,j-4)
\iff \binom j2\le n+2.
\]

Since binomial(j,2) increases strictly for j≥1, the positive coefficients increase strictly up to a single position, and decrease strictly thereafter. This proves uniqueness of the signed maximum as well as its location.

Define

\[
Q(n)=\max\{j\ge0:\binom j2\le n+2\}
=\left\lfloor\frac{1+\sqrt{8n+17}}2\right\rfloor.
\]

The unique maximizing exponent is

\[
\boxed{a(n)=Q(n)-((Q(n)-n)\bmod4).}
\]

The remainder is the Euclidean remainder in {0,1,2,3}; equivalently a(n) is the largest j≤Q(n) with j≡n modulo4. This exponent exists and is at most n. For n≥3, Q(n)≤n; the remaining n=0,1,2 give a(n)=n directly. Also Q(n)≥n mod4 for every n, so the equivalent natural-arithmetic formula Q−((Q−(n mod4)) mod4) is well-defined without truncated-negative ambiguity.

## Every jump and every block

For q≥4 define

\[
N_q=\binom q2-2,\qquad
\delta_q=(q-N_q)\bmod4,\qquad
E_q=N_q+\delta_q,\qquad
K_q=\left\lfloor\frac{q-2-\delta_q}{4}\right\rfloor.
\]

Here0≤δ_q≤3. The numerator defining K_q is nonnegative: for q≥5 this is immediate, while δ4=0.

The threshold identity implies

\[
Q(n)=q\iff N_q\le n<N_q+q.
\]

If Q(n+1)=Q(n)+1, the remainder in a(n) is unchanged and the difference is1. Otherwise Q is constant, and that difference is −3 exactly when n≡Q(n) modulo4; in all other cases it is1. In particular, the final index N_q+q−1 of a constant-Q interval never produces a negative jump, because Q increases at the next index.

It follows that **all and only** the negative-jump indices are

\[
\boxed{\{n:a(n+1)-a(n)=-3\}
=\{E_q+4r:q\ge4,\ 0\le r\le K_q\}.}
\]

For n<4 the differences are1. The first negative jump is at E4=4, so the initial block is exactly (1,1,1,1,−3). Within each constant-Q interval the negative jumps are4 apart, producing precisely (1,1,1,−3) blocks.

The gap between consecutive intervals is exactly5. Indeed N_(q+1)=N_q+q, E_(q+1)−E_q≡1 modulo4, and writing q−2−δ_q=4K_q+r with0≤r≤3 gives

\[
E_{q+1}-E_q=4K_q+r+2+\delta_{q+1}.
\]

The last three terms lie between2 and8 and are1 modulo4, so they equal5. Therefore

\[
\boxed{E_{q+1}=E_q+4K_q+5.}
\]

Every negative-jump gap is consequently4 or5. Apart from the initial block, the5-blocks end exactly at E_q for q≥5; the4-blocks occur at the intervening linear progression E_q+4,...,E_q+4K_q. This is a complete exact word description, rather than a claim about a finite prefix.

## Precise quadratic spacing and growth

The offsets δ_q are8-periodic, since

\[
N_{q+8}=N_q+8q+28.
\]

Thus the block positions and counts satisfy the exact identities

\[
\boxed{E_{q+8}=E_q+8q+28,\qquad K_{q+8}=K_q+2.}
\]

In particular the5-block positions form a quadratic quasi-polynomial of period8: E_q=q(q−1)/2−2+δ_q. The number of ordinary4-blocks in each intervening interval grows linearly. These statements give a precise description of the source's informal linear/quadratic-spacing observation.

Let s=floor(sqrt(2n)). Then s²≤2n<(s+1)² and the triangular cutoff gives s≤Q(n)≤s+2. For the upper bound, Q≥s+3 would imply Q(Q−1)≥s²+5s+6>2n+4, contradicting its defining inequality. Since Q−3≤a≤Q,

\[
\boxed{\lfloor\sqrt{2n}\rfloor\le a(n)+3,
\qquad a(n)\le\lfloor\sqrt{2n}\rfloor+2.}
\]

Hence a(n)=sqrt(2n)+O(1), proving in particular the source's O(sqrt(n)) growth claim.

## Verification and remaining work

Exact integer coefficients independently confirm the formula, signed uniqueness, all jump positions and block identities through transitions0..500, using orders0..501; all79 current source terms agree. This is a finite error check, not the infinite proof. The argument above is unrestricted. The full faithful Lean theorem retains the actual signed Hermite maximum, the exact formula, full block characterization, spacing identities and growth bounds. That ENTIRE theorem passed the actual pinned kernel with only propext, Classical.choice and Quot.sound, with no errors/sorryAx. Exact evidence, hashes and byte correspondence are in `a381423_verification_receipt.json` and `A381423_FULL_KERNEL_PASS.log`. Canonical-import checking after statement review/merge, official proof submission and final acceptance remain pending. No new-method priority or exhaustive literature claim is asserted.
