# Full recursive algebra reduction: sum Fourier coefficients before bounding thick-weight loss
25 November 2026. Status: human source-matched conditional replacement lemma, no Lean replay, no RH proof. User requests same reduction across all mathematics. Continues 86122968 (signed ramp algebra) and ce407759/9532e2af (rank). Read current mission, recent commits 91c8057c (quasipolynomial VWin supplier), 3fdcc6c3 (cyclic class-group reduction), c306a9d9 (root adapter); no exhaustive archive audit. Source pin 40e56bab026552e089d7afcfeff08d2defb9c005. No URT assumptions.

## Exact improvement of the native th_le inequality
Use native Deduction.CharacterBalanceMoves.th_le from src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean (878f5077bc382426c7da988e5a375b85deeaa7de). Let F=|PhiSet|, G=E0 x H, with |G|=2F. Fix its original A>0, b>0, x>=3, |A/b-x|<=1, eta>=0, and actual positive w_g=w(cconj+g+topPl t) for g in the complement of InPhi(g+topPl t). Denote by J the thick subset, so b<=w_g<=b+eta+1 there. Keep all original thin hypotheses. For v>0 define the real normalized Fourier ramp
 P_g(v)=Re[(1/F) sum_chi chi(-g)*v*GPsi(D,ell,chi,A/v)].
Native StronglyIrreducible.lean (94a385f59f3781ae6b1ab4beddc73850708a2bc6) inner_eq and GPsi, using the finite sum over n<=floor(A/v), give
 P_g(v)=sum_n Lambda(n) Kc(n,g) (A/n-v)_+ - (A/F)log(A/v)+(1+gamma)A/F + (A/F)Re sum_{chi!=0} chi(-g)ell_chi.
The sum is finite. The coefficient Kc is real whenever Lambda(n) !=0: native orthogonality_ramified and ortho_coset explicitly give for n=p^k, k>=1
 Kc(p^k,g)= 2/|I_p| if g-k*frob(p) belongs to inertia I_p, 0 otherwise.
In particular Kc>=0 and sum_{g in G} Kc(p^k,g)=2 exactly, with all ramified primes retained. Use PB.conj_eq_neg for the conjugation convention. No assumption that host weights are constant, no cancellation of arbitrary weights.

For each thick g, all logarithmic-derivative terms cancel upon subtracting P_g(b):
 P_g(w_g)-P_g(b)
 = sum_{n<=A/b} Lambda(n)Kc(n,g)[(A/n-w_g)_+-(A/n-b)_+] + (A/F)log(w_g/b).
The log term is nonnegative, and each square bracket lies in [-(eta+1),0]. Sum over J BEFORE taking any absolute values:
 sum_{g in J} (P_g(w_g)-P_g(b)) >= -2(eta+1)*psi(A/b),
where psi(y)=sum_{n<=y} Lambda(n). This eliminates the original per-character Lipschitz estimate on the thick subset, and its group-cardinality multiplication. No extra analytic estimate is used: for integers n>=1, psi(2n)-psi(n)<=log binomial(2n,n)<=2n log2 by Legendre valuations (each prime power in (n,2n] contributes one to v_p). Sum over dyadic n and round y up to a power of two to get psi(y)<=4(log2)y for y>=1. Thus the loss is at most 8(log2)(eta+1)(x+1) < 6(eta+1)(x+1), independent of |H|.

For thin g keep native ThinScales and original proof A/w_g>=X'/3 from b'X'<=xb and w_g<=2b', A/b>=x-1. Then each |v GPsi|<=A theta, and exactly |G|/F=2, so P_g(w_g)>=-2 A theta. If L is the number of thin g, the exact source identities CR.De_re and hTh in th_le therefore give the replacement
 Th.re <= De.re + 2(eta+1)*psi(A/b) + 2 L A theta.
Here L=F-|T2| from thick_filter/thick_inj; even without that equality L<=F suffices. For a coarser bound use 6(x+1)(eta+1)+2F(x+1)b theta. Compare source bound 2*fPl(H)*(3*(x+1)*(eta+1)+(x+1)*b theta), which uses the same half-group cardinality. The improved thick term removes its multiplicative place count. It applies to GENERAL H, not just principal base. No need for hLip in this replacement th_le. Keep ThinScales or supply an independent thin estimate. At eta+1>=0 no issue with cutoff crossing: positive-part difference is 1-Lipschitz in the cutoff. Does not eliminate the independent geometry ASK-MAIN bound or all other users of lipschitz_weight_all, and does not prove RH.

## Native provenance
- src/Formalism/SizeWindowBrackets/ChainSlopeWindows/StronglyIrreducible.lean (blob above): PB.conj_eq_neg, ortho_coset, orthogonality_ramified, Kc, inner_eq, sum_cut.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean (blob above): th_le, its exact hTh and CR.De_re comparison identity, thick_filter/inj, norm_avg_le, core.
- same folder ChBalance.lean 37648715bcf507e086374e8cc476ee746fd274f4 uses inner_eq in its actual balance identity.
- src/Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean b5662cda1f3523fc53b547ee582a46bd3cd826d4 defines SizesA and exact gapA; all positivity and scale restrictions preserved.
Fetched and read exact pinned bodies. No numerical experiment required for this analytic derivation; no native Lean replay or CI. No claim of speedup or removal of all global consumers.
RESUME HERE: insert improved thick loss into actual core cost supplier, and investigate one-sided thin aggregate bound that avoids estimating all individual characters. Check each independent consumer before removing LipW globally. HANDOFF TO math, character boxes, prime, geometry, audit, integration. RH OPEN.
