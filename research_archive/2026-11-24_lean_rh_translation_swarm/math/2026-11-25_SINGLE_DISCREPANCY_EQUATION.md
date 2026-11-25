# Single discrepancy equation: exact elementary reduction
25 Nov 2026. User direction: find the single equation. This is an unconditional elementary reduction of the zeta-only target, NOT a new proof of RH or a claim of novelty. Previous minimal cancellation certificate ae5afbdc0c31a1de4cf6f17ef2bb79f5bf13287d.

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005, CharFamily.lean defines G(x)=sum_{n<=x} Lambda(n)(x/n-1)-x log x+(1+gamma)x. LandauTheorems/ZeroFreeOfRpowWindow.lean applies to the singleton trivial character family (positive weight one, modulus one). No stronger GRH coverage claimed.

Define N=floor x, H_N=sum_{n<=N} 1/n, D(x)=sum_{n<=x} floor(x/n), and K_x(n)=1-{x/n}, with fractional part in [0,1). Then:
sum_{n<=x} Lambda(n) floor(x/n)=log(N!) by sum_{d|m} Lambda(d)=log m.
Hence G(x)=log(N!)-x log x+(1+gamma)x - sum Lambda(n) K_x(n).
The baseline sum K_x(n)=N-x H_N+D(x).
Exact single centered-discrepancy equation:
G(x)+sum_{n<=x}(Lambda(n)-1)K_x(n)
 = log(N!)-x log x+(1+gamma)x-N+x H_N-D(x).
This equality holds for every real x>=1. Stirling gives log(N!)=x log x-x+O(log(2x)); H_N=log x+gamma+O(1/x); the elementary Dirichlet hyperbola identity D(x)=2 sum_{n<=floor(sqrt x)} floor(x/n)-floor(sqrt x)^2 gives D(x)=x log x+(2gamma-1)x+O(sqrt x). Therefore the right side is O(sqrt x), uniformly for real x>=1. Equivalently G(x)=-sum (Lambda(n)-1)K_x(n)+O(sqrt x). This removes the entire deterministic linear main term and exhibits one centered arithmetic mismatch.

Sufficient target: for each 0<eps<1/2 there are C_eps>=0 and fixed delta_eps>0 such that arbitrarily large Y satisfy sum_{n<=x}(Lambda(n)-1)K_x(n) >= -C_eps*x^(1/2+eps) for every real x in [Y,Y^(1+delta_eps)]. Then the upstream singleton Landau criterion excludes zeros Re(s)>1/2+eps, and varying eps plus the functional equation yields RH. Constants need not be uniform in eps. Conversely a bound on G on those windows transfers to the centered sum. No estimate of the required lower bound has been proved here. Orthogonality, boundedness of K, or a uniform model alone does not establish cancellation of the centered Lambda weights. Finite numerical checks cannot establish this asymptotic inequality.

Source distinction: the source's own key_identity5 in Formalism/SizeWindowBrackets/ChainSlopeWindows/LevelOfCongruence.lean follows from Data.key_identity in Formalism/RankGapBounds/RankGapProofs/WeightedMeanData.lean by log-product expansion and algebra; it cancels log normalization terms but does not by itself prove the error budget. The centered-discrepancy equation above is a separate elementary reduction for RH alone, not a claim that the actual all-character proof uses it. Standard factorial and hyperbola identities; human algebra only, no Lean replay. Next: derive a one-sided estimate of the centered sawtooth discrepancy without assuming RH, or explain exact structural obstruction.
