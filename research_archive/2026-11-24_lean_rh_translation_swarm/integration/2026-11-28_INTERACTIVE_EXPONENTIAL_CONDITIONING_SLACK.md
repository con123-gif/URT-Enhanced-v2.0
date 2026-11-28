# Exponential conditioning slack from the native rank and prime guards
28 November 2026. Human derivation, conditional on the replacement fixing-set energy input. No native replay, no verified global supplier deletion, no proof of RH. Credit Alpöge, Sernau, Anthropic collaborators and Claude for source; Adriazola for related endgame precision relaxation. Extends 8e91cbf3ae6d67c2f4b6cfadcd28d26404fbea2d.

## Exact source inputs
Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207:
- [Setup.lean](https://github.com/lsernau/grh-lean/blob/72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src/New/Filling/Setup.lean): b≥1000, n=ϱ+1, k=|κ|, k≥1000(2n)^9, k≤b, b^10≤q≤b^11 for q=levelPrime 0, 10^10 n^4≤n^6, 3 n^6+12≤n^7≤k, f=number of infinite places≥k. Bessel index cardinal r=k+2n-1 (GoodIdempotent.lean Shape.besselIndexEquiv).
- [Moments.lean](https://github.com/lsernau/grh-lean/blob/72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src/New/Filling/Moments.lean#L226-L258), blob ec2cb964ede0d5eeae41a077dc6dbfface9c0444: nonnegative positive-type conditioned induction; a failing leading minor is assigned to one of n labels; same vector/covector fixers.
- OneDeterminant.lean card_mul_sum_det_le: q·Θ{minor=0}≤2M+q^(h+r/2)Y, with h≤n, M=ΣΘ, and Y a uniform conditioned fixer mass bound.

## 1. Much larger slack in the exact induction
Set e=b^-4, C=mainEnergy, u=b^(-28k/5). Assume the fixing-set energy bound
    energy(F(A,D)) <= (1-e)(1+9e) C u^|A|
in place of the original factor b^(-6k|A|). All other source hypotheses unchanged, including the nonnegative positive-type, domination, support, rank and field guards. Then the original exact unconditioned bound ΣΘ≤(1+9e)C still follows.

Proof: the exponent of q in each determinant estimate is h+r/2≤k/2+2n. Since k≥1000(2n)^9 and n≥1, 22n≤k/10. Hence
    q^(h+r/2) <= b^(11k/2+22n) <= b^(28k/5)=1/u.
Let K_A=(1+9e) C u^|A|. Reverse induction over A as in the native proof. If M>K_A then at least eM of its mass (strictly more) is outside F(A,D). At full A the complement is empty on the support. Otherwise fix an unused w; each bad element fails a leading minor there. Restricting Θ to a nonzero vector/covector fixer is positive type by tensoring with the orbit permutation basis, inherits the same domination, and adds w to A. By induction Y≤K_{A∪{w}}<u M. The finite Fourier inequality then gives each bad minor mass ≤3M/q≤3M/b^10. There are n≤k≤b labels, so total bad mass ≤3M/b^9<eM. Contradiction. At A=empty the old bound is exactly recovered. The relaxation per fixed place is b^(2k/5) (compare b^-6k with b^-28k/5), not merely b^4. No new geometric estimate has been assumed true, and the complement-energy proof is unchanged.

## 2. A concrete corresponding local floor replacement
This is a source-matched human derivation of the weakened one-place bottom estimate, using the EXISTING shell theorem at a lower exponent; it does not eliminate the shell theorem yet.
[FixedLines.lean](https://github.com/lsernau/grh-lean/blob/72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src/New/Filling/FixedLines.lean) blob a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9: same group Z, pullback of the native nonzero-vector or nonzero-covector stabilizer. For a selected fixed place, the exact index [K:Z]=q^r−1 is the ordinary GL_r orbit count, as in native proof. Keep its projection-surjectivity, kernel, measure and star-pair guards.
[TopFloor.lean](https://github.com/lsernau/grh-lean/blob/72fead102f663d5c7a407964a13dc0cf9d977207/grh-compact/src/New/Filling/TopFloor.lean): for any integer t≥0 with t+10^10 n^4≤k, floorZeroForm_le_main_term gives
    F(Z)≤M(Z)M(K_c)(M(Z)+v_nonunit^(t+1)2^-n).
Here F is floorZeroForm, M is Haar groupMeasure, K_c is the congruence group. The same exact congruence integral gives F(K)≥M(K)^2 M(K_c). Source volume_nonunits_le gives v_nonunit≤b^-9, inv_two_pow_le_groupMeasure gives M(K)≥2^-n. Thus after division by the positive masses,
    [F(Z)/M(Z)]/[F(K)/M(K)]
      ≤ M(Z)/M(K) + v_nonunit^(t+1)
      ≤ 1/(q^r−1) + b^(-9(t+1)).
Choose t=floor(5k/8). It is admissible since 10^10 n^4≤n^6≤k/3 and 5/8+1/3<1. Then q^r≥b^(10k), t+1≥5k/8, giving
    ratio ≤ 2 b^(-10k)+b^(-45k/8) ≤ b^(-28k/5).
Last inequality: divide by b^(-28k/5); the terms are 2b^(-22k/5)+b^(-k/40). Both together are ≤1, e.g. k≥40, b≥1000, which the native guards easily imply. For the unconditioned local factor use Z=K exactly. Tensor the one-place bound through the SAME product/Haar factorization of exists_intermediateGroup_lines to get F(Z)/M(Z)≤u^|A| F(K)/M(K). No change of local groups, no new measure normalization, no omission of the non-unit region. In contrast to native maximal exponent t=k−10^10 n^4, we use t≤5k/8. Quantified next target: replace the expensive shell proof of this reduced exponent directly, not the entire native high-precision statement. The original floor theorem is still used here.

## 3. Propagate through finite sieve (specific candidate, not yet replayed)
FiniteSystem.lean blob 1c169e04852f767f1d1a0140448d902c16dd04e7 constructs SieveSystem with bottom parameter (1+b^-6)b^(-6k|A|). Substitute the weakened intermediate-group ratio from §2 to get (1+b^-6)u^|A|, preserving the actual kernel, integrability, massRatio, Fourier and continuity guards. The last proof uses the old intermediate-group inequality at its bottom only; inspect and replay the exact caller before accepting.
GlobalSieve.lean blob 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372 has additive error b^(-6kf-10)/degree, independent of the bottom parameter. Because |A|≤f and u≥b^-6k, b^(-6kf-10)≤b^-10 u^|A|. Hence the scalar error budget used by energy_fixingSet_le is no worse. In Moments.lean the auxiliary C=y*mainEnergy with y=b^(-6k|A|) can be increased to y=u^|A|; lower-bound guards on C become easier. Keep original link, near-pair, packet, normalization and main energy bounds. This is a proposed replacement at the named suppliers: no fresh Lean replay and no claim that their large transitive proof dependencies have disappeared.

## Handoff / boundaries
The previous b^4 slack argument used the source coarse determinant bound without exposing the ambient-rank margin. This note exposes that margin, and supplies a concrete local bottom estimate with the smaller shell exponent, not merely a different final inequality. The global sharp unconditioned main energy, Fourier frequency bounds, and original complement/central trace proofs remain. In particular, the direct sector lower bound of 1879ed19189a3cdd78762e13f46a079f9d91a2d6 is not established.
Next: prepare checked scalar bridge and exact modified FixedLines → FiniteSystem → Moments caller. Inspect TopFloor.lintegral_shells_le and pivotModulus_sq_le_of_capped for a direct low-moment substitute at floor(5k/8); because the latter still appears in the unconditioned central trace, distinguish local proof simplification from actual global dependency removal. Preserve all accepted B3 evidence and do not restart builds. No independent proof or novelty claim.
