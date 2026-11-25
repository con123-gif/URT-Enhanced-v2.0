# Interactive reduction — combine both Euler tails before sharp-count estimation

25 November 2026. Status: human mathematical derivation, conditional on the pinned native massIdentity_holds comparison; not Lean compiled. RH OPEN.
Source: leanprover-community/riemann-hypothesis @ 40e56bab026552e089d7afcfeff08d2defb9c005, src/Formalism/SharpRestriction/GlobalSchurBounds/LinkMin.lean blob b570e24f60fbc7a2a3a4e08b84ed234f74ceeb4f, lines 181–215 and 349–358. Same D, k, r, f, g_i as the native sharp-count consumers. Current manuscript blob 7beedb2752d934a81d4c92b5a19c1c48362e0dc9; peer endpoint caller e02666f2396bbe39b574fb84cf6acb6330632619. Preserve original graph and independent mass-error consumer.

## One scalar replaces two estimates

Let k>=2, r>=k, f>0 and g_0,g_1>=2. Define
  l = (1/(fk)) sum_{M=k+1}^r log lValEta(E,M),
  s = (1/k) sum_{i=0}^1 sum_{j=k+1}^r log(1-g_i^(-j)).
The native massIdentity_holds comparison used at LinkMin 184–190 and 351–357 is |log lValEta(E,M)|<=f log zetaR(M). In the following, zetaR(M) is the ordinary real Riemann zeta series at integer M>=2 (native call uses zetaR_eq; verify the definition in Lean when replaying). Since log(1+t)<=t, positive summation and geometric summation give
  sum_{M=k+1}^r log zeta(M)
  <= sum_{n>=2} sum_{M>=k+1} n^(-M)
  = sum_{n>=2} n^(-k)/(n-1)
  <= sum_{n>=2} n^(-k)
  <= 2^(-k) + integral_2^infty t^(-k) dt
  = 2^(-k)(1+2/(k-1)).
For u in [0,1), -log(1-u)<=u/(1-u) by integrating 1/(1-t) from 0 to u. Here u<=2^(-(k+1)); for each i sum_j u<=2^(-k). Thus
  -2^(1-k)/(1-2^(-(k+1))) <= k*s <= 0.
Combining without separately carrying rank-dependent bounds,
  |l+s| <= (2^(-k)/k) [1+2/(k-1)+2/(1-2^(-(k+1)))]
           <= 6*2^(-k)/k.
For k>=2 the bracket is <=3+16/7=37/7<6. This covers the empty interval as well. At native k>=44 this is <=6/(44*2^44), approximately 7.75e-15; monotonicity follows immediately for increasing integer k.

## Exact integration into editor anchor

In the existing signed mass anchor replace the separate lower estimates l>=-1 and s>=-1/4 and upper estimates l<=1 and s<=0 by one bound on l+s. The exact expression and normalization defect delta remain unchanged. The old conclusions therefore still follow (since 6*2^-k/k<=3/4 for k>=2), with additional margin at actual ranks k>=44. No modification of epsilon, host, gap or window quantifiers. This is a deterministic bound, not a numerical approximation used in the proof.

The local hSG derivation no longer needs piN_split or local_index_formulas_and_bounds: geometric-series summation replaces that particular consumer. The local hSL derivations no longer need log_zetaR_le_one and rank-multiplicity estimates: the one summed tail suffices. The shared index product formula in family_of_global_statements and the massIdentity_holds supplier remain essential. Do not claim global dependency removal. The combined bound does not prove VolRatioTrue, VolTie, GenusMassStd or sigma-degree estimates.

Human manuscript insertion (two sentences): The two Euler corrections satisfy |l+s|<=6*2^-k/k: sum log zeta(M)<=sum_{n>=2} n^-k/(n-1)<=2^-k(1+2/(k-1)), while -log(1-u)<=u/(1-u) bounds the two local factors together by 2^(1-k)/(1-2^(-k-1)). Thus these corrections consume only a single exponentially small scalar of the signed normalization budget.

Verification: exact source retrieved and blob matched. Analytic inequalities proved above; rational check at k=2 establishes uniform bracket bound by monotonicity. No numerical tests of RH, no new native Lean execution. No URT speedup asserted. This is a local human simplification, not an upstream closure.

RESUME HERE: replay the one scalar bound in the two sharp-count callers with the actual zetaR_eq definition and massIdentity_holds. Independently reconstruct the latter supplier and the terminal definite mass premises; retain original proof as fallback.
HANDOFF TO integration, proof editor, positivity geometry, formal audit.
