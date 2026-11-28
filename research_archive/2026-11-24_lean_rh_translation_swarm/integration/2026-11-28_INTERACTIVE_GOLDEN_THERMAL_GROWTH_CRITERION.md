# One golden thermal sequence: exact growth obstruction, not an RH proof

28 November 2026. Continuation of a6e36f61b8cc045fa0aa0ab8b37599c730a86125 and dba5f3e71b86c869380ac7a9b0cdc31bfc1956f8. The exact previous range and prime-side formula were retrieved. Goal: remove the need for infinitely many independent signs and two indices. No assertion of literature priority, no numerical tests or Lean replay claimed, no worker/schedule changes.

## 1. Single sequence directly from the heat trace

Let lambda_j=-(rho_j-1/2)^2, upper-half-plane representative of each reflection pair, multiplicities retained. H(t)=sum_j exp(-t lambda_j). Add a fixed positive damping shift 1 to each lambda_j, solely for absolute summability of the separate prime/gamma terms; it is not a physical parameter or a fitted quantity. Write phi=(1+sqrt(5))/2 and
  Q_n = sum_{m>=1} [ exp(-nm) H(nm) + exp(-nm phi) H(nm phi) ], n>=1,
  D_k = sum_{r=0}^k (-1)^r binom(k,r) Q_{r+1}.
The nodes x_{j,m,d}=exp(-md(lambda_j+1)), d in {1,phi}, are all nonzero and |x|<=exp(-md(gamma_j^2+3/4)). The standard critical strip and zero count imply sum |x|<infinity, since sum_j exp(-gamma_j^2)<infinity and sum_m exp(-(m-1)3/4)<infinity. There are finitely many nodes outside every neighborhood of 0. Multiplicities are finite at every nonzero node. Thus
  Q_n=sum x^n, D_k=sum x(1-x)^k.
These series converge absolutely for each fixed n,k and are real by conjugation. The alternative expression Q_n=sum_j [1/(exp(n(lambda_j+1))-1)+1/(exp(n phi(lambda_j+1))-1)] is also valid.

## 2. Exact theorem
  RH iff limsup_{k->infty}|D_k|^(1/k) <= 1.
Equivalently RH iff the single real sequence D_k is bounded, or converges to 0. Boundedness is sufficient; individual signs are no longer required.

Forward: under RH all x lie in (0,1); 0<=D_k<=Q_1 and dominated convergence gives D_k->0.

Converse: suppose some lambda has nonzero imaginary part beta. Irrationality of phi implies at least one d in {1,phi} has d beta not in 2pi Z. For any nonzero angle modulo 2pi, some positive integer m makes cos(md beta)<0: reduce to angle theta in (0,pi], choose m=1 if theta>pi/2, else m=floor(pi/(2theta))+1. Then the associated node x satisfies Re x<0 and |1-x|>1.

For z near 0,
  B(z)=sum_{k>=0} D_k z^k = sum_x x/(1-(1-x)z).
The latter is meromorphic off z=1, with locally finite possible poles at z=1/(1-x). Uniform convergence of the tail on compact subsets avoiding z=1 and the poles follows from summable |x| and 1-(1-x)z -> 1-z. All equal x terms have identical nonzero residue -x/(1-x); hence no pole cancels, even when different clocks, indices or zeros yield the same x. In particular the above x forces an actual pole strictly inside the unit disk. If limsup<=1, the Taylor series is holomorphic throughout that disk. Identity on the punctured disk (which is connected after deleting the locally finite poles) contradicts the actual pole. Thus beta=0 for every lambda. Since Im lambda=-2(Re rho-1/2)Im rho and nontrivial zeros have nonzero ordinate, RH follows.

More precisely, R=max(1,sup_x |1-x|). Then limsup |D_k|^(1/k)=R. Upper bound follows directly from |D_k|<=sum|x| R^k. If R>1 it is attained (nodes tend to 0) and the preceding pole argument gives lower bound. If R=1, poles approach z=1 as |x|->0, so the Taylor radius cannot exceed 1: analytic extension on any disk of radius>1 would contradict an actual pole there, by the same identity argument on the disk minus 1 and the poles. This also handles RH. The theorem uses no RH as an input.

## 3. Actual prime-side bound: what can and cannot be closed
Use the exact prime/gamma heat formula in a6e36f61. The damping shift makes the terms separately summable when evaluating Q_n. For t>=1 the gamma-integral is uniformly bounded by an absolute constant: on 0<u<=1, the numerator difference is O(u) uniformly in t by the mean value theorem; on u>=1, absolute value <=e^-u+e^(-u/4), denominator bounded away from zero. The elementary exp(t/4) term is also harmless after damping. For the prime contribution, partition log p^a into unit intervals, use 0<=Lambda(l)<=log l and bound the number of integers l in [e^j,e^(j+1)) by e^(j+1). Then
  sum_{l>=2} Lambda(l)l^(-1/2) exp(-log(l)^2/(4t))
    <= e exp(t/4) sum_{j>=0}(j+1) exp(-(j-t)^2/(4t))
    = O(t^(3/2) exp(t/4)), t>=1.
The last Gaussian bound follows by splitting j+1<=t+1+|j-t| and bounding the Gaussian sums by constants times 1+sqrt(t) and 1+t respectively (compare on unit intervals to the integrals, or use decreasing tails). With the prefactor t^-1/2 this gives O(t exp(t/4)). Thus each separate damped term in Q_n converges absolutely and Q_n=O(n exp(-3n/4)) by summing the geometric series over m and d. No need to assume the two growing contributions cancel before summing over clocks. This bound also follows from the spectral side. It is not sharp enough for the desired k-growth: absolute binomial summation of such a bound permits exponential growth (a polynomial in k times (1+exp(-3/4))^k).

The exact remaining prime-side problem is analytic continuation of a single function:
  w=z/(1-z), B(z)=(1+w) sum_{n>=1}(-w)^(n-1) Q_n.
The series identity follows from the binomial generating formula, or from the node representation. The elementary prime/gamma bounds yield convergence for |w|<exp(3/4). The unit z-disk maps to Re w>-1/2; a proof of holomorphy of the Q generating function in that half-plane would suffice for RH. It is NOT supplied by positivity of the von Mangoldt weights, nor by the elementary Gaussian bound. It requires actual cancellation beyond termwise absolute estimates. Do not assert analytic continuation in the target half-plane by assuming the nodes real.

Using Platt–Trudgian (2021), doi:10.1112/blms.12460, all zeros with 0<gamma<=T=3e12 are on line; those nodes have |1-x|<1. All remaining nodes satisfy |x|<=exp(-(T^2+3/4)). The exact growth formula proves unconditionally
  1 <= limsup |D_k|^(1/k) <= 1+exp(-(T^2+3/4)).
This is a tiny but strictly nonzero allowance, NOT a proof of equality. It explains why finite-precision extrapolation, even very far beyond the prior positivity range, cannot close the step.

## 4. Status
The complete mathematical reduction and direct prime-side convergence are proved here; the holomorphy/boundedness needed to prove RH is still unproved. This is an alternative diagnostic, not a closure of compact arithmetic obligations. The choice of shift and clocks is not unique; the role of phi here is only its irrationality. No native Lean run, no computational test, no original-priority claim. No assertion of a new zero-free region.

RESUME: derive holomorphy in Re w>-1/2 for the actual prime/gamma Q_n (not the spectral series by assuming real nodes) or return to the compact arithmetic proof. The key obstruction is the cancellation needed in the binomial transform, not additional finite-order testing. Preserve all previous routes and evidence.