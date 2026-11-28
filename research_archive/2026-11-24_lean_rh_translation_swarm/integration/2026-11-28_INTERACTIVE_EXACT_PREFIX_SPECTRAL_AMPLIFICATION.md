# Independent RH route — exact-prefix spectral amplification and scale-separated energy gluing

28 November 2026. Creative direction suggested by the user's permission to develop mathematical intuition rather than continue numerical enlargement. Uses the exact-prefix logarithmic construction c76cecf61d1fb3f0d544f3264010871c0be4f789 and the finite full-norm certificates 171c6c7ab43c594bf51a4241b938745db2195fdd. The prior derivations are in the current conversation. Two unconditional implications are proved below; neither proves the required energy upper bound, RH, a new zero-free region, or literature priority. No new numerical computation, native Lean replay or schedule/worker changes.

## 1. Change the target: exploit the location of the residual, not only its size

Use the original t=1/x coordinates and measure dt/t^2. Let
 r_N(t)=chi(t)+sum_(n=2)^N c_n b_n(t),
 chi(t)=1_(t>=1), b_n(t)={t/n}-{t}/n,
 P_N(s)=sum_(n=2)^N c_n(n^(-s)-1/n).
For every finite real vector c, the Mellin identity is
 integral_1^infty r_N(t)t^(-s-1)dt=(1-zeta(s)P_N(s))/s
 for Re s>0, with the product's singularity at s=1 removable by P_N(1)=0. This follows from the fractional-part Mellin identity initially in Re s>1, or from the earlier cell/divisor formula followed by analytic continuation. The finite residual is bounded and supported on t>=1.

The EXACT log-average-centered witness of c76cecf has r_N(t)=0 for t<K_N=floor(sqrt N). (The rounded rational vectors certified in 171c6c7a need not preserve this exact property; do not silently use those certificates as certificates for the exact analytic family.)
Let E_N=integral_1^infty |r_N(t)|^2 dt/t^2. At any hypothetical nontrivial zero rho=beta+i gamma with beta>1/2, the identity fixes the Mellin value at 1/rho. Since the support begins at K_N, Cauchy-Schwarz with the actual weight gives
 1/|rho|^2 <= E_N integral_(K_N)^infty t^(-2beta)dt
            = E_N K_N^(1-2beta)/(2beta-1).
Consequently
 ** E_N >= (2beta-1) K_N^(2beta-1)/|rho|^2. **
This is an exact scale-dependent obstruction for every finite admissible witness with an exact zero prefix, not a new claim about zero locations. It is stronger than the earlier unlocalized evaluation inequality for these particular witnesses.

## 2. Relax the proof target from vanishing to subpower growth

For the constructed exact family K_N=floor(sqrt N), a sufficient all-scale bound is now
 E_N=O_epsilon(N^epsilon) for every epsilon>0,
 or even the existence of an unbounded subsequence N_i with
 limsup_i log(max(1,E_(N_i)))/log N_i=0.
Indeed any fixed off-line zero would require E_(N_i)>=c_rho N_i^(beta-1/2) for large i by Section 1. Select epsilon<beta-1/2, contradiction. Symmetry of zeta gives RH. No estimate about the lower half of the strip is assumed.
More generally an independently proved E_N=O(N^delta), delta>=0, would exclude all zeros with beta>1/2+delta. This is a conditional implication, not an established zero-free region.

The exact earlier tail theorem bounds energy above L_N=floor(N^(3/2)) by O(1/log^2 N). Thus the relaxed sufficient target is merely a subpower bound for the middle-band energy on K_N<=t<L_N+1 (along any unbounded subsequence). It need not converge to zero or even be bounded. This is a weaker requirement on the particular witness sequence than the previous proposed O(1/log N) full-norm bound. It is not claimed easier in the sense of a solved arithmetic theorem: any successful estimate would still prove RH. For comparison the coefficient envelope and ||b_n||<=sqrt(2/n) give the elementary unconditional bound E_N=O(1+N/log^2 N), via sum_(n<=N) [1+log(N/n)]/sqrt(n)=O(sqrt N). This is far too weak. No subpower estimate has been obtained.

## 3. A separate constructive intuition: combine errors that occupy disjoint scales

The same exact prefix and tail theorem prove a useful Hilbert-space construction. Take N_j=2^(4^j), j>=2, so K_j=floor(sqrt N_j) and L_j=floor(N_j^(3/2)) satisfy L_j+1<K_(j+1). Write
 u_j=r_(N_j) 1_[K_j,L_j+1), v_j=r_(N_j)-u_j.
Then the u_j have disjoint supports and are orthogonal in L2(dt/t^2). Define A_j=||u_j||^2, B_j=||v_j||. By the proved exact-family far-tail theorem B_j<=C/log N_j, hence sum_j B_j<infinity. These truncations are used only to estimate the norm, not asserted to be admissible arithmetic witnesses.
For every finite nonnegative weight vector w with sum w_j=1, the original combination r=sum w_j r_(N_j) is exactly admissible (finite support of its coefficient vector, constant target preserved). Triangle inequality and exact orthogonality give
 ||r|| <= sqrt(sum w_j^2 A_j)+sum w_j B_j.
Choose S_J=sum_(j=2)^J 1/(1+A_j), w_j=1/[(1+A_j)S_J]. Then
 ||r|| <= S_J^(-1/2)+(sum_(j>=2)B_j)/S_J.
Thus divergence of S_J yields an explicit sequence of admissible convex combinations converging to zero. For example A_j=O(j) suffices, even if the individual band energies diverge. Since j is proportional to log log N_j, a uniform O(log log N) bound for the actual family would suffice for this particular constructive gluing route. Section 2 is the more permissive spectral route (subpower along any unbounded subsequence). Neither assumed growth bound is proved. We do not assume statistical independence of different scales; their truncated supports are exactly disjoint.

## 4. Actual O(N) relevance and remaining task

The exact log-average-centered coefficients and their exact zero prefix come from the earlier O(N) sieve/prefix construction (scalar arithmetic complexity; full residual evaluation not O(N)). The new deductions are analytical, not fresh numerical scans. The goal is now an unconditional upper bound on the energy growth exponent, rather than forcing each witness to approach zero, or merely fitting a descending sequence of finite norms. The finite rounded certificates cannot directly be substituted for the exact-family support bound without a rounding repair or a separate prefix evaluation enclosure. No independent proof of RH was obtained. No claim of originality in the classical Mellin evaluation inequality; the proposed use is its localization to the constructed prefix-perfect family and the explicit orthogonal-band gluing argument.