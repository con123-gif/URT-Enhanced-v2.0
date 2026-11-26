# Compact B: close both frequency substitutions in the global sieve
26 November 2026. Continuation of positivity worker RUN52 (fa58872b6013d7fe620f205324e570120b383c8a), which explicitly left the two exponent substitutions in GlobalSieve.sieve open. Same compact pin 72fead102f663d5c7a407964a13dc0cf9d977207, same finite system, head functions, Poisson recurrence and final native bound. No RH assumption, no new native replay. This is a human scalar completion of the actual sieve from its previously reconstructed frequency lemma and native local band/finite-system inputs.

Notation: n=rho+1, f=numInfPlaces E, k=shape.k, b=S.b, K=n^6, J=k-n^7. Native guards k>=1000(2n)^9=512000 n^9, f>=k, b>=1000, N<=b^(60n), 1<=|kappa_v|<=b^23, g>=1, N>=1, rd_E<=b. Thus J>=0. Actual l_va=frameScaleSq(v,a)=kappa_v^(2(rho-a))/N, a<=rho, so 1/N<=l_va<=b^(46n). Write C_i=prod_(a<i)c_a, c_a=volÔ(E)/prod_v l_va². Native volÔ=(rd_E/2)^(-f), hence
 C_i^(-1)=(rd_E/2)^(fi) prod_(v,a<i) l_va² <= b^((1+92n)fi).

Frequency lemma (RUN52, actual sum_frequencies_le): for finite nonzero T-integral y, scales c_v with |c_v|^-1<=|x_v|<=B, B>=1, the sum of prod_v dampedPower(j,|c_v Phi_v(y)|^-1) times genIndex(y)^(j/2)/denomIndex(y)^6 is <= prod_v [|x_v|^j (b B²)^3] (b rd_E)^(3f). Preserve denominator and field norm normalization.

1. Head budget. For a prefix of length i<=rho, the partial products m_j of its entries (j=1,...,i) determine the prefix injectively. The exact product of local head weights is at most the product of the above frequency summands for each m_j, because finHeadWeight is zero unless all partial products are integral on T, in which case their denominator indices are 1. Use c_v=prod_(a<j) l_va, so |c_v|^-1<=N^j<=N^i. Take B=|x_v|=N^i and exponent K. Extend the injective image to the Cartesian product of the finite partial-product sets, as in RUN52. Then
 sum_p Lambda_i(p) <= [N^(i K f) (b N^(2i))^(3f) (b rd_E)^(3f)]^i
 <= b^[fi(60niK+360ni+9)].
Consequently
 (sum_p Lambda_i(p))²/C_i
 <= b^[f(120n i² K+720n i²+18i+i+92ni)]
 <= b^[f(120n^9+720n^3+92n²+19n)] <= b^(1000 n^9 f).
The inequalities use i<=n, n>=1 (120+720+92+19=951<=1000). For i=0, head sum and C_0 both equal 1. Thus choose Gamma=b^(1000 n^9 f). This is one explicit sufficient instantiation of the native existential power, not a modification of the conclusion.

2. Frequency budget for every pivot a. For |c_v|^-1<=|kappa_v|/g, inverse magnitude of the real scale c_v/l_va is <= l_va |kappa_v|/g <= |kappa_v|^(2rho+1)/(gN)=x_v. All x_v positive, and x_v<=b^(46n). Choose B=b^(46n). The actual product-system frequency function beta combines finite frequencyGain with the real HasBandLimits factors. Thus its sum on the same rational frequencies is bounded by
 b^(2001 n^9 f) prod_v bandConst * [prod_v x_v^J (bB²)^3] * (b rd_E)^(3f)
 <= b^[(2001n^9+276n+9)f] prod_v (bandConst x_v^J).
This uses the exact finite factor b^(n^9 f) and real factor b^(2000 n^9) at each infinite place, not a guessed extra power. Here B may be enlarged to b^(46n), which is allowed by the frequency lemma. Let epsilon be this last bound, positive. Native admissibility gives prod_v (bandConst b^(7k) x_v^J)<=besselDegree^-1. Therefore
 epsilon <= besselDegree^-1 b^(-7kf+(2001n^9+276n+9)f).

3. Finish the actual recurrence. In one_sided_poisson take the preceding Gamma and epsilon, n_pivot=rho. The error at the last pivot is (2rho+1)Gamma epsilon. Since 2rho+1<=b by the native magnitude bounds, it is at most
 besselDegree^-1 b^[-7kf+(3001n^9+276n+9)f+1].
The native k>=512000 n^9 implies k-(3001n^9+276n+9)>=508714 n^9>=11; f>=1. Thus exponent <=-6kf-10 exactly as required. The zero-frequency term is unchanged: e prod_v ((1+b^-10)/deg_v). Multiplying by C_(rho+1) proves the actual statement of Filling.sieve:
 Re sum <= C_n [e prod_v ((1+b^-10)/deg_v) + besselDegree^-1 b^(-6kf-10)].
No need for an improvement of the final coefficient. No independent choices of the finite system, partial-product sets or local bands.

Source anchors: New/Filling/GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372 (both actual calls of sum_frequencies_le and sieve); Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727 (pow_le_k, N_le, frameScaleSq, prod_band_le_inv_deg); EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce (headWeight, finHeadWeight, product system); BesselSystem.lean (HasBandLimits, bandConst); Lib/Adelic/Adeles/RationalPoints.lean (volÔ_eq). RUN51 finite Fourier/Poisson argument 025426f92fc87ece6dbe883d1b31c20a2d9b2581; RUN52 frequency lemma fa58872b6013d7fe620f205324e570120b383c8a. The proof is conditional on the native band limits and finite system and the stated frequency/discriminant lemma and Poisson recurrence; it completes the previously unresolved final exponent arithmetic. No kernel replay or complete human proof. RESUME: actual energy_fixingSet_le, finite-system/top-correlation supplier, matrix-size and local norm bounds; do not re-optimize either exponent substitution. Editor integrate this into B instead of leaving both substitutions as open tasks.
