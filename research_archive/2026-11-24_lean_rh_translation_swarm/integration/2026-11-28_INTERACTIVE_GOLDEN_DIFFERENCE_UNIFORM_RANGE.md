# Golden two-clock positivity: rigorous uniform range and remaining obstruction
28 November 2026. Continuation of a6e36f61b8cc045fa0aa0ab8b37599c730a86125 (read exact source). New elementary implication of published finite-height RH verification; not a new zero-free region or unconditional RH proof. No numerical sign extrapolation, no Lean replay, no schedules changed.

## Theorem
Let T=3*10^12. With the existing notation lambda_j=-(rho_j-1/2)^2 (one upper-half-plane representative per reflection pair, multiplicity included), H(t)=sum exp(-t lambda_j), D(n,k,d)=(-1)^k Delta_d^k H(nd).
For every real d>=1, every integer n>=1, and every integer 0<=k<=exp(d (T-100)^2), D(n,k,d)>0. In particular both d=1 and d=phi satisfy this uniform range. This is an unconditional consequence of known published rigorous finite verification; not a claim to have repeated that computation.

Inputs: Platt–Trudgian, The Riemann hypothesis is true up to 3*10^12, DOI 10.1112/blms.12460, https://arxiv.org/abs/2004.09765 (all zeros up to T on line). Hasanalizade–Shen–Wong, Counting zeros of the Riemann zeta function, Cor. 1.2, https://arxiv.org/abs/2107.06506 (for t>=e, |N(t)-M(t)| <= .1038 log t + .2573 log log t +9.3675, M(t)=t/(2pi) log(t/(2pi e))). Also 0<Re rho<1 and conjugation/reflection. No unproved RH premise.

## Proof
1. Existence of a verified zero gamma_* in (T-100,T-50]: at the two endpoints the explicit counting error is <15 (log t<30 and log log t<4 give error <14), while M'(t)=log(t/(2pi))/(2pi)>3 on this interval (2pi<7, t>10^12, exp(21)<10^10). Thus N(T-50)-N(T-100)>150-30>0. For all t>=T the same counting bound gives N(t)<=t^2: M(t)<=t^2/6 using log t<=t and 2pi>6; error <= t+10, hence <=5t^2/6. These crude comparisons have enormous slack.
2. Set x_j=exp(-d lambda_j). Absolute convergence of the heat sums permits a finite binomial expansion: D(n,k,d)=sum_j x_j^n (1-x_j)^k. On gamma<=T every term is positive real. In particular for gamma_* as above, x_*=exp(-d gamma_*^2)<=exp(-d(T-100)^2)<1/2, k x_*<=1, and log(1-x)>=-2x for 0<=x<=1/2. Its contribution alone is at least exp(-2-dn(T-50)^2).
3. For every unverified zero gamma>T, |x|<=exp(-d(gamma^2-1/4)) from the critical strip. Hence k|x|<=exp(-d(T^2-1/4-(T-100)^2))<1 and |1-x|^k<=exp(k|x|)<=e. Partition gamma>T into intervals (T+j,T+j+1] for j>=0. Each contains at most (T+j+1)^2 zeros by the explicit bound on N. Since T+j+1<=(T+1)(j+1), the total tail absolute value is <=
 e (T+1)^2 exp(-dn(T^2-1/4)) sum_{j>=0} (j+1)^2 exp(-2dnTj)
 <= 12 e (T+1)^2 exp(-dn(T^2-1/4)),
using exp(-2dnT)<=1/2 and sum (j+1)^2/2^j=12. Conjugation ensures D real. The ratio of this upper bound to the one positive term is <=
 12 e^3 (T+1)^2 exp(-dn(100T-2500-1/4))<1.
For example log(12 e^3 (T+1)^2)<66 (log(T+1)<30), whereas 100T-2500-1/4>66. Thus D>0 throughout the asserted range, even if the entire unknown tail were aligned in the worst possible negative direction.
4. d=1 gives log k<= (2999999999900)^2; d=phi increases this threshold. These are symbolic orders, not tests individually performed.

## Limits and next target
This proves infinitely many n and a huge but finite range of k at either fixed clock. For arbitrary k the factors (1-x)^k can amplify a complex or negative x, and the chosen known positive term can be suppressed. The proof therefore cannot simply extend to k->infinity. Also for any fixed k taking d large makes the criterion insensitive to high zeros, so positivity at coarse clocks and fixed order is not evidence for RH. The previous exact Hausdorff equivalence remains; its missing unbounded-order estimate is not proved. The finite-height implication does not improve the known zero-height verification or the compact arithmetic proof. Do not count this as a new RH root closure.

RESUME: seek a genuinely uniform-in-k positive representation from the actual prime/gamma expression or return to the compact arithmetic suppliers; do not perform further low-order sign checks as substitutes for this missing theorem.