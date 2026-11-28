# Conditioned energy slack: preserve the sharp unconditioned moment
28 November 2026. Human proof of a weaker sufficient set of energy premises; not a proof of the relaxed arithmetic premises, sector lower bound, native replay or RH. Credit Alpöge, Sernau, Anthropic collaborators and Claude for original proof; Jimmie Adriazola for related precision work. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207. Source [Moments.lean lines 220–258](https://github.com/lsernau/grh-lean/blob/72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src/New/Filling/Moments.lean#L220-L258), blob ec2cb964ede0d5eeae41a077dc6dbfface9c0444; card_mul_sum_det_le in OneDeterminant.lean. This targets the arithmetic energy inputs more specifically than the preceding relaxed endgame or sector certificate.

## Proposition
Let v=columnDim, C=mainEnergy, e=b^-4, t=b^(-6k), k=|κ|, b>=1000, and write F(A,D) for the original fixingSet A D. Retain all native finite-group, representation, determinant and scale hypotheses of sum_le_of_positive_type, and its original definition of admissible Θ: nonnegative, positive type, dominated on each set by the amplitude energy, supported on the required fixers of given nonzero vectors at places A. Suppose instead of the sharp fixing-set bound for every A, one proves just
    energy(F(A,D)) <= (1-e)(1+9e) C [b^4 t]^|A|.
Then the unconditioned native conclusion remains EXACTLY
    Σ_s Θ(s) <= (1+9e) C     when A=empty.
The conditioned arithmetic requirement is enlarged by b^(4|A|), while the unconditioned target is unchanged. The native main rank, complement-energy and central-trace conclusions need no weakening. This is an alternate sufficient theorem, not a circular assumption of the unconditioned moment.

## Proof
Put K_A=(1+9e) C [b^4 t]^|A|. Induct by reverse inclusion on A, allowing all admissible Θ and all choices of nonzero vectors, as in the original proof. If M=ΣΘ>K_A, use the assumed good set energy to obtain
    Σ_{s∉F(A,D)} Θ(s) >= M-(1-e)K_A > e M.
If A is full, the left side is zero by the support hypothesis, contradiction. Otherwise fix one w outside A. Each term in the complement with positive Θ has a vanishing leading minor at w. Assign such terms to one failing minor (there are at most ϱ+1 ≤ k+1 ≤ b+1 ≤ 2b labels). The actual native F(false), F(true), finite field size q and representation are unchanged.

Conditioning Θ further on fixing a nonzero vector or covector is positive type: tensor the Gram vectors with the permutation basis vector of its orbit, exactly as in Moments.lean lines 244–251. Support and amplitude domination are inherited. Thus induction on A∪{w} gives the uniform fixer mass bound
    Y<=K_{A∪{w}}=b^4 t K_A < b^4 t M.
The finite Fourier determinant inequality says for each minor with order h and ambient rank n
    q Σ_{s:minor=0} Θ(s) <= 2M+q^(h+n/2)Y.
In the native proof, setting Y=t M makes the RHS after division by q at most 3M/b^10, as established in lines 239–258 with the native q/h/n guards (reuse exactly this numerical inequality, not an estimate for arbitrary finite fields). Because b^4>=1, replacing Y by b^4 t M multiplies the upper bound by AT MOST b^4, including the 2M/q term. So each minor mass is <=3M/b^6. Summing at most 2b minor labels gives <=6M/b^5 < eM at b>=1000. This contradicts the good-set complement lower bound. The base and induction both follow. At A=empty K_A is precisely the old sharp conclusion.

More generally a multiplier p>=1 per extra fixed place works whenever 6p/b^9 <= e; the conservative p=b^4 satisfies this. This follows from the same proof, not an asymptotic claim about the native arithmetic.

## Consequence and concrete research task
The original geometry tries to achieve a near-one main-term constant even on every deeply conditioned set. This proof shows it suffices to retain the sharp unconditioned good-cell bound while replacing the conditioned estimate (|A|>0) by
    O(C b^(-(6k-4)|A|)).
The exact prefactor above, or a smaller bound, is sufficient. For b=1000 and |A|=1 the relaxation is already 10^12. On the full set A, no sharp determinant control is needed beyond that weaker bound. The complement-energy estimate of Moments.lean remains separate and cannot be discarded using this proposition.

Do not claim the rough bound follows from an unconditioned estimate alone: point mass at the identity is nonnegative positive type, supported on every compatible fixer, and can lie wholly outside the unconditioned good-cell set. Its mass is not bounded by that good-cell estimate. The conditioned controls are genuinely required for this argument, even though their precision can be much lower.

Next: in energy_fixingSet_le split A=empty from A≠empty. Keep the exact original normalized energy (including ν factors), support and local divisibility. For nonempty A, try coarse local volume or lattice counting instead of the sharp GlobalSieve/FiniteSystem shell calculation. The permitted loss is b^4 per fixed place, not a blanket loss of tailScale powers, which may be vastly larger. Inspect FixedLines and FiniteSystem for a coarse fixed-vector volume estimate, and CrudeEnergy/BlockBound for cost of lifting that estimate to full energy. No verified bypass of those suppliers yet. For A=empty keep existing sharp path or the earlier relaxed endgame as separate alternatives. Replay the numeric minor bound and conditioned proposition against native Lean before selecting. Do not overwrite live spine or repeat passed source builds.
