# MO513069: arbitrary exact cycle lengths by CRT

Cornelius Lytollis (@con123-gif), assisted by ChatGPT/Codex.27 November2026. Complete human proof of a prior-informed extension/correction. No Lean certificate, new open-solution claim, lease, or official contribution. Current primary question, answers, and comments were read in full: zero answers and zero comments at the recorded fetch. The bounded prior audit found MathPages' earlier scaled-CRT method and all-length assertion; this campaign conservatively excludes this work from the genuine-new acceptance target.

Primary question: https://mathoverflow.net/questions/513069. For nonnegative integers define a♥b=ab mod(a+b), with0♥0=0. The source's first conjecture asks for infinitely many primitive bases of exact N-cycles for all positive N other than2; its second conjecture asks eventual periodicity of every orbit. The second conjecture is not solved here.

The first conjecture literally includes N1, where it is false: every positive constant cycle normalizes to the sole basis(1). A zero-cycle, if assigned a normalized convention, adds at most one further basis. The substantive result below proves the intended assertion for EVERY N>=3, rather than stopping at that boundary observation. Exact2-cycles are impossible by commutativity. Thus the corrected cycle-length classification is precise.

## Construction for every N>=3

Index the positions cyclically by0,...,N-1. Set

\[
b_i=\begin{cases}i&i<N-1,\\N^2&i=N-1,\end{cases}
\qquad s_i=b_i+b_{i+1}.
\]

Both lists are injective. The consecutive sums are

\[
1,3,\ldots,2N-5,\quad N^2+N-2,\quad N^2.
\]

Their last two values exceed all the earlier ones and differ because N>=3. All positive absolute differences between two b-values or two s-values are at most4N². Therefore the even positive integer D=(4N²)! is divisible by every such difference.

For any parameter L>=0 put

\[
Q=2D,\quad t=1+Q(N^2+L),\quad a_i=t+Qb_i,
\qquad M_i=t+Ds_i.
\]

Then a_i+a_(i+1)=2M_i. All a_i and M_i are positive odd integers. Also max(a_i)=t+QN²<2t<=2min(a_i), so a_(i+2)<a_i+a_(i+1) at every phase.

## Coprimality

Use this elementary affine-family lemma: if D>0, u!=v and |u-v| divides D, then gcd(1+Du,1+Dv)=1. Indeed a common divisor h is coprime to D and divides D(u-v); hence h divides u-v, thus D, thus1.

For the a-values apply the same argument with coefficient difference b_i-b_j and multiplier Q=2D: a_i is coprime to Q, a common divisor divides b_i-b_j, and that difference divides D. Thus all a_i are pairwise coprime. For the M-values, write M_i=1+D[2(N²+L)+s_i] and apply the affine-family lemma directly. All M_i are pairwise coprime. Since D is even, each M_i is odd, and the moduli2,M_0,...,M_(N-1) are pairwise coprime.

For each i, gcd(a_i*a_(i+1),M_i)=1: a common divisor of either adjacent a-value with M_i would divide their sum2M_i and the other a-value, contradicting their pairwise coprimality. Oddness handles the possible factor2.

## CRT and the actual cycle

For each i choose the well-defined residue

\[
r_i\equiv a_{i+2}(a_i a_{i+1})^{-1}\pmod{M_i}.
\]

Chinese remaindering gives a positive ODD integer lambda with lambda==r_i(mod M_i) for all i. The congruences then give

\[
\lambda a_i a_{i+1}\equiv a_{i+2}\pmod{M_i}.
\]

Both sides are odd, so the same congruence holds modulo2M_i=a_i+a_(i+1). Since0<a_(i+2)<a_i+a_(i+1), it follows that

\[
(\lambda a_i)(\lambda a_{i+1})\bmod[\lambda(a_i+a_{i+1})]
=\lambda\{\lambda a_i a_{i+1}\bmod(a_i+a_{i+1})\}
=\lambda a_{i+2}.
\]

Consequently (lambda*a_i) is an actual N-cycle for the source operation. Its values are pairwise distinct, so its minimal period is exactly N. Pairwise coprimality of the a_i gives gcd(a_0,...,a_(N-1))=1; hence the gcd of the actual cycle is lambda and its primitive basis is exactly(a_i).

Finally L varies over all nonnegative integers. The unique minimum of the primitive basis is a_0=t=1+Q(N²+L), which strictly increases with L. Thus there are infinitely many different primitive bases, even when cycles are identified up to rotation. This is a complete existence construction for every N>=3; no numerical extrapolation is used.

## Verification boundary and source integrity

The scaled-CRT method is prior mathematics of David Einstein and Kevin Brown, presented at https://mathpages.com/home/kmath204.htm (and the linked kmath193/kmath212 pages). All three full primary pages were inspected. The main page asserts existence for all lengths but displays a construction only for odd N. Its stated prime-ratio condition also does not by itself ensure that the proposed next coordinate is smaller than the adjacent sum: its N=3 cluster 7,11,13 yields coordinates 9,5,17, with 17>9+5. Tighter prime clustering can repair that odd-case bound. No even-N construction was located in those pages. The later MathOverflow source still labels its infinite-normalized-bases assertion conjectural.

This proof supplies an explicit affine factorial construction, including even N and the infinite normalized-base parameter, using the same prior CRT mechanism. Because the older article already asserts an all-length result and the historical scope is uncertain, the parent campaign adjudicated it as a rigorous prior-informed extension/correction, not an eligible genuine-new open solve. No first-ever or new-method claim is made. Independent full mathematical challenges by the algebra agent found no gap in this construction.

The literal N1 counterexample does not resolve the eventual-periodicity conjecture, and neither does this arbitrary-cycle construction. If a source-faithful official statement combines the two conjectures, its first component is false as written, but the remaining component must be reported as open. A completed human proof, a finite exact computational check and a draft Lean file are different verification stages; only an actual accepted official contribution can enter the campaign acceptance count.
