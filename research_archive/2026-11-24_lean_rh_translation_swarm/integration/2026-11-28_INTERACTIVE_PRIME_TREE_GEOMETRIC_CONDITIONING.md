# Prime-tree geometric conditioning: rigorous polynomial bounds and failure of uniform diagonal stability

Continuation of 021e7809289d4a17124f8b4b5acb815d39083217 (exact source retrieved). This addresses the geometric rather than coefficient norm. The finite conditioning estimates below are unconditional, but do not establish geometric density or RH. No computation of new witnesses, no numerical checks, native Lean replay, literature priority claim, or changes to workers/schedules.

Use t=1/x, ||g||^2=integral_1^infinity |g(t)|^2 dt/t^2, b_n(t)={t/n}-{t}/n, b_1=0. For n>=2 write p(n)=least prime factor, m(n)=n/p(n), H_n=T_m b_p=b_n-b_m/p, and normalize G_n=sqrt(n) H_n. The Gram matrix of G_2,...,G_N is denoted K_N. Its quadratic form is the actual geometric norm of a correction. The earlier stable coefficient transform did not establish stability in this norm.

## 1. Exact finite lower bound using Mobius inversion of increments

For g=sum_(n=2)^N a_n b_n=sum_(n=2)^N c_n H_n put g_j=g(t) on [j,j+1), g_0=0, d_j=g_j-g_(j-1), and A=sum a_n/n. Then for j>=1,
 d_j=A-sum_(n|j,n>=2) a_n.
Consequently, extending a_1=0, for 2<=n<=N,
 a_n=-sum_(k|n) mu(k)d_(n/k).
Indeed this is finite divisor inversion and the constant A disappears because sum_(k|n)mu(k)=0 for n>1. Divide by n, and set v_j=d_j/j. The resulting operator on the finite vector v is a sum over k<=N of coefficient -mu(k)/k times the truncated index dilation (D_k v)_n=v_(n/k) if k divides n, zero otherwise. Each such dilation has l2 norm at most 1. The triangle inequality yields
 sum_(n=2)^N |a_n/n|^2 <= H_Nharm^2 sum_(j=1)^N |d_j/j|^2,
 H_Nharm=sum_(k<=N)1/k.
Meanwhile |g_j-g_(j-1)|^2<=2|g_j|^2+2|g_(j-1)|^2, and
 1/j^2<=2/[j(j+1)], 1/(j+1)^2<=1/[j(j+1)].
Therefore sum_(j=1)^N |d_j/j|^2<=6||g||^2, and
 sum_(n=2)^N |a_n/n|^2 <=6 H_Nharm^2 ||g||^2.
This controls the actual geometric norm from below, using only the first N cells. It does not use nonvanishing of zeta.

In the prime tree, the coefficient recursion gives
 c_n/n=sum_(j: n is an ancestor of j, including j=n) a_j/j.
Each descendant j is a multiple of n, so there are at most N/n descendants. By Cauchy-Schwarz,
 |c_n|^2/n <= N sum_(j: descendant of n) |a_j/j|^2.
Each j has at most floor(log_2 N) ancestors >=2, since every parent divides by a prime >=2. Summing and applying the preceding inequality proves, with x_n=c_n/sqrt(n),
 sum_(n=2)^N |x_n|^2 <= 6 N floor(log_2 N) H_Nharm^2 ||sum x_n G_n||^2.
Also ||G_n||^2=n||b_p||^2/m<=2, by the earlier individual column bound. Cauchy-Schwarz gives ||sum x_n G_n||^2<=2(N-1)sum |x_n|^2.
Thus K_N is strictly positive and satisfies
 [6 N floor(log_2 N) H_Nharm^2]^(-1) I <= K_N <= 2(N-1) I.
In particular its condition number is at most 12 N(N-1) floor(log_2 N) H_Nharm^2. This is a conservative polynomial bound, not a claim of sharpness or of uniformly well-conditioned least squares. In the original b_n basis normalized by sqrt(n), the same increment inequality directly gives the slightly stronger lower bound (6 N H_Nharm^2)^(-1).

## 2. Explicit obstruction to uniform geometric stability

For all m>=1, H_(2m)=T_m b_2 because the least prime factor of 2m is 2. Let b=b_2, which equals 1/2 on cells with odd index and zero otherwise (also zero below 1). Its exact squared norm is (log 2)/4, by the alternating harmonic sum. Hence ||G_(2m)||^2=(log 2)/2, independent of m.

Take consecutive m,m+1, delta=1/m, and substitute t=m u. Then
 ||G_(2m)-G_(2m+2)||^2 =2 integral_0^infinity |b(u)-sqrt(1+delta)b(u/(1+delta))|^2 du/u^2.
For 1<=u<=1/delta the two step values can differ only on the union of intervals [j,(1+delta)j), j>=1 integers (their floors cross a jump). The integral over each full interval is delta/((1+delta)j). The tail u>1/delta has mass delta. Therefore the weighted measure of the difference set is O(delta log(2/delta)). The amplitude difference sqrt(1+delta)-1 contributes O(delta^2) in squared norm because b(u/(1+delta)) vanishes for u<1. These bounds give O(delta log(2/delta)) for the displayed norm squared. Conversely, for 1<=j<=floor(1/(2delta)) the intervals are disjoint and the two floors are j and j-1, so one step value is 1/2 and the other zero. Integrating over them gives a matching lower bound for small delta. Thus
 ||G_(2m)-G_(2m+2)||^2 = Theta(log(2m)/m) as m->infinity.
The Rayleigh quotient of the coefficient vector supported on these two indices with values 1/sqrt(2), -1/sqrt(2) proves lambda_min(K_N)=O(log N/N) by choosing m=floor(N/2)-1. The same near-parallel obstruction remains after individual column normalization to unit norm, since these even columns have the same fixed norm.

For the largest eigenvalue choose the even indices 2m with ceil(N/4)<=m<=floor(N/3). For N sufficiently large there are >=cN such indices. For each of them and t in [N/3,N/2) one has 1<=t/m<2, so G_(2m)(t)=sqrt(2m)/2 >= c' sqrt(N). Use a unit coefficient vector constant positive on these indices. On this common interval its sum is >=c'' N; its squared weighted integral there is >=c''' N, because integral_(N/3)^(N/2) dt/t^2=1/N. Hence lambda_max(K_N)>=c''' N. Together with the previous upper bound lambda_max(K_N)=Theta(N). Consequently
 kappa(K_N) >= c N^2/log N
 for all sufficiently large N, whereas Section 1 bounds it above by O(N^2 (log N)^3). In particular uniform geometric stability of these diagonally normalized prime-tree columns is impossible, not merely unverified. The coefficient-norm contraction in the previous note is consistent with this result.

## 3. Interpretation and precise outstanding theorem

These two-sided polynomial conditioning bounds are new deductions in this investigation, not a claimed new zero-free theorem. The near-parallel even branches supply an explicit reason why diagonal column scaling cannot be a uniform geometric preconditioner. The increment inversion gives a lower spectral bound that does not assume RH and avoids an exponential dependence on N; it may help estimate the numerical cost of finite projection. The exact constants are deliberately conservative. This does not bound the residual of the target chi=1_(t>=1) after projection: invertibility of K_N only concerns vectors already in the correction space, not their distance to chi. Even perfect finite preconditioning leaves the limiting approximation problem intact.

No all-scale vanishing residual bound or signed arithmetic estimate was obtained. Do not treat a polynomial condition number, additional finite witnesses, or another equivalent criterion as the decisive breakthrough. The required theorem remains the unconditional convergence of the Nyman–Beurling distance to zero. The main compact proof program is unchanged.