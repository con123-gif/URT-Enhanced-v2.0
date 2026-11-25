# Actual nondegenerate row count: cancellation before local density estimation
25 November 2026. Source-matched human derivation, not compiled. RH OPEN. Pin 40e56bab026552e089d7afcfeff08d2defb9c005. Continues bc38f13b; current mission b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc, peers 5d85634d and c0de628b inspected. No surrogate matrix or prime simulation.

## Native count identity
TheoremSSelected -> theoremS_selected_of_loops (ThmSOwn a38627e2) -> theoremS_closedP (4c972cbc1993322d79dadc9674133fa63c0fe097) -> theoremS_rec2P and theoremS_rec (TheoremSRecursion 28bcfa5a67bdb94a0abf0328c88a52cedfcfb6c7). The actual row count used by these calls is FormulaC/RowsSumC, not an independently chosen prime average. FormulaCOf (2253304996dfb8e7629b8eb0d9b0ab80d1f6d601) invokes formulaExplicit_of in DualFamilyCounting/Assemble.lean db42734063141ba2d165174bb40a4f086a7cdd98. StepsR.lean ec4f4d5d8e82a6e53c03d18bedf8eec77b91492d defines the actual cExpl, RowsMass, DensAll and FormulaExplicit. These use the SAME host, F0, what2, u,u', Z and glued lattice M.

For integral M, put q_p=Norm(p), eta_p=etaF(E,F,p) in {-1,1}, j_p=cJ(h,UPair,M,p). The native complement rank is k-1 and pair span rank is m=2rS+2. The source cJ_le gives 0<=j_p<=m, and k>=m+3. Let N=sqrtAbsNormOfScaledGram(T,T',Z) and H=|disc F|^(-2rS(rS+1)(k-1)), and C=cMass(E,F,k-1)*H/massRows(D,F0,what2). Assume positive massRows, as proved for the actual FormulaC producer with a nonempty row-representative set. The exact formula in Assemble.formulaExplicit_of, before hT1 is rewritten, is
  nu(Z) = C*N^(k-1) * prod'_p alphaStd(p,k-1)/alphaStd(p,k-1-j_p).
Here alphaStd(p,n)=prod_{i=1}^n (1-eta_p^i*q_p^(-i)).
The native hT1 and alpha_split express this product as the product of the global L-values (k..r) and the local density prod'_p densP. CANCEL them first, prime by prime:
  J(Z)=prod'_p prod_{i=k-j_p}^{k-1}(1-eta_p^i*q_p^(-i)).
Consequently all rank-k..r Euler factors disappear from the count exactly. The underlying mass formula and integrality branch still matter. In the nonintegral case nu=0 by glueSet_eq_empty and RowsGroupoid (already proved in formulaExplicit_of); no local density supplier is required merely to infer that count is zero. Keep original exact density formula wherever RowsSum, normalization or typed place consumers need it.

## Uniform count estimate with no local rank calculation
Let h=k-m>=3. Each j_p<=m, so every factor in J has i>=h. For a real z with |z|<1, |log(1-z)|<=|z|/(1-|z|), by integration. There are at most f=[F:Q] prime ideals above each rational prime, q_p>=p (f agrees with native fDeg and host rank via the original field dictionary). Hence the sum of absolute logarithms over all factors is bounded by
  f/(1-2^(-h)) * sum_{n>=2} sum_{i>=h} n^(-i)
  = f/(1-2^(-h)) * sum_{n>=2} n^(-(h-1))/(n-1)
  <= f/(1-2^(-h)) * 2^(-(h-1))*(1+2/(h-2))
  <= 8*f*2^(-h) = beta.
The integral test bounds the decreasing series by its first term and the integral from 2 to infinity; h>=3 gives the last numerical inequality. Absolute log convergence justifies the positive Euler product and every regrouping, without relying on a separate local density convergence proposition for this bound. Therefore
  exp(-beta)*C*N^(k-1) <= nu(Z) <= exp(beta)*C*N^(k-1)
for integral M; the upper bound holds for nonintegral M as well (nu=0). No assumption that every Gram point is integral; no lower bound in the nonintegral case. This is a genuine uniform upper bound on the actual arithmetic count, given its native gluing mass and groupoid identity, requiring only j_p<=m, not individual Jordan decompositions or exact local counts.

Under StandingHypotheses and the actual theoremS_selected_of_loops thresholds C'>=29, m>=2, f>=m^4, L=log b>1, C'*m^5*f*L<=k, f<=k: k>=64, k>=2m, k>=60L. For k>=64, log(8k)<=k/8 (true at 64, derivative 1/k<=1/8). Since log 2>=2/3 (e.g. integrating 1/t from 1 to 2 using the tangent at 3/2), beta<=exp(k/8-k/3)=exp(-5k/24)<=exp(-k/5)<=b^(-12). In particular beta<=1/2 and exp(beta)<=1+2beta. Thus the uniform arithmetic count has relative upper error at most 2*b^(-12), much smaller than the actual off-diagonal frame target b^(-6). This estimate applies to the count normalization only, NOT the full operator kernel, whose archimedean amplitudes and pair weights remain essential.

## Eliminate the arbitrary rank-one normalization in C if native RowsMass is available
The native StepsR.RowsMass proposition (not presumed unconditional here) gives massRows=cMass(E,F,k)*T^(k*f)*P_T, with P_T=prod'_p(if T lies in p then 1-eta_p^k*q_p^(-k) else 1). From the definition of cMass and native positive mass ratio, cMass(k)=cMass(k-1)*massRatioRightSide(E,k). Hence C=H/[massRatioRightSide(E,k)*T^(k*f)*P_T]. This is an independent optional reduction; it does not require knowing or computing cOne. Retain RowsMass if using this extra formula. The cMass normalization and gluing mass theorem cannot be deleted globally by this cancellation.

## What this establishes and what it does not
The leading arithmetic count now has a single explicit determinant power and a uniform exponentially small multiplicative error, rather than a separate local calculation at each Gram. The original exact formula is already in the source; the uniform bound is the new human specialization. It does not imply the nondegenerate spectral pair sum is bounded at the Welch scale. Need the actual signed/positive weighted Gram sum with its archimedean factor and common mass normalization, especially theoremS_rec and PB.Link/RowBig/RowNotScalar. The local exact density factors may still be required for those terms; do not remove their producers from the native graph without a caller replay. No assertion of novel mathematical theorem, no new Lean pass.

Verification: source bodies StepsR, Assemble, FormulaCOf, DensCut (5de3c6a2838fc758914057824ecbe97c15f38d63), StatementMass (33a3ea93298eff7969409462ddfc1ed22f173939) and ThmSOwn/TheoremSClosedP fetched at pin; elementary derivation above. No numerical tests needed or claimed. No URT speedup claimed.
RESUME HERE: insert the uniform arithmetic majorant into the actual nondegenerate weighted row sum, checking signs/positivity before replacing nu(Z) by its upper bound. Match the remaining archimedean integral and leading determinant-power coefficient to the normalized Welch denominator. Preserve all same-host quantifiers; retain exact formula fallback. HANDOFF TO theta, geometry, integration, formal audit and editor.
