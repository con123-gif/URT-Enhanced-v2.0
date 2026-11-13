# Q64 A2 — conditioning forced by relative entropy, but selection principle still conditional

2026-11-12, agent GPT. Gate A active attempt A2. Status: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for the stated finite KL projection; Gate A remains OPEN.

Original inputs: native six-bit Q2 successor rule `h -> (2h,2h+1) mod 64`, and Q3's A5-twirled chronology `K_D=S_D/120` as defined in `research_archive/2026-11-12_q64_conditioned_selection/Q64_CONDITIONED_SELECTION_CERTIFICATE.py`. No new Cathedral operator, measured constant, or fitted parameter is introduced.

**Theorem (rowwise information projection).** Let `A_h={2h,2h+1} mod 64`. Assume the original Q3 twirl has positive total support mass `k_h=K_D(h,A_h)>0` on each native successor pair. Of all stochastic rows `q_h` supported on `A_h`, the unique minimiser of `D_KL(q_h || K_D(h,.))` is

`p_D(h,k) = K_D(h,k)/k_h = S_D[h,k]/(S_D[h,2h]+S_D[h,2h+1])` for `k in A_h`.

Proof: for any such `q_h`, exactly `D_KL(q_h||K_D(h,.)) = D_KL(q_h||p_D(h,.)) - log k_h`. Gibbs inequality gives the unique minimiser, with zero-mass entries interpreted by support restriction. Summing row divergences preserves uniqueness. Thus **the conditional kernel itself is forced** by the explicitly stated *minimum-relative-entropy update* of the original Q3 chronology subject to the original Q2 successor constraint. This is a stronger derivation than simply declaring conditional probabilities, but it is conditional on choosing KL as the update rule.

**Native lift census.** Q2 has precisely `2^32` bijective successor lifts. For every `x=0..31`, the two rows `x,x+32` share the pair `{2x,2x+1}` and must choose opposite destinations. The 32 choices are independent. Under unweighted Q2 every lift has probability `2^-64`, and the total probability of a bijective 64-row choice is `2^-32`. Consequently Q2 by itself cannot select a reversible lift or dictionary.

**Important limit.** The likelihood `L(D,sigma)=prod_h p_D(h,sigma(h))` follows if the 64 row choices are modelled as conditionally independent. Maximising it is a maximum-likelihood *decision rule*, not a consequence of KL projection, Q2, or the URT recurrence. The KL theorem therefore does not yet make Q64's unique selected orbit a parameter-free physical selection. The ratio `L_cond/L_raw = prod_h [S_D(h,2h)+S_D(h,2h+1)]^-1` is constant over lifts for each fixed D, but dictionary-dependent, explaining exactly how conditioning can break Q64's raw-likelihood orbit tie.

Execution: `python research_archive/2026-11-12_q64_a2_native_conditioning/Q64_A2_NATIVE_CONDITIONING.py` locally, exit 0. The script tests exact native Q2 combinatorics and rational conditional identities; the general KL uniqueness is the analytic argument above, not an exhaustive Q3 matrix computation. No physical ARF is inferred.

RESUME HERE: Q64 A2B already distinguishes a single trajectory from the independent 64-row ensemble; test whether the original all-five 24-clock provides the needed ensemble measure.
