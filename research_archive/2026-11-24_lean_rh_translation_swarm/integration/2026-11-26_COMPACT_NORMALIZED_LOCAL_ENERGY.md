# Compact B: dimensionless floor energy and explicit local index suppression
26 Nov 2026. Source-matched human reduction of FixedLines and its product transport, conditional on the actual native bottom-floor estimate. Native replay outstanding. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. Follows 10d0bbef7bac3b250634671f62a5840de91fc097. External formal proof and our incomplete human reconstruction are distinct. No independent RH criterion.

## 1. Normalize before taking any products

Use the actual Level.floorZeroForm from New/Filling/TopFloor.lean. For a subgroup Z between the level congruence group C=K(g) and integral K, put
  Kappa_mu(Z)=integral_x |integral_{y in Z} phase(g,y x y^-1) dmu(y)|^2 dmu(x).
Write M(Z)=mu(Z). All groups under comparison are open compact, with strictly positive finite M; Kappa is finite by the native bottom-floor upper bound. The exact congruence-group integral is
  integral_{x in C} |integral_Z phase(...)|^2 dmu(x)=M(Z)^2 M(C)
from floorZeroForm_on_congGroup. The integrand is nonnegative, giving Kappa_mu(K)>=M(K)^2 M(C)>0. Define
  J_mu(Z,K)=[Kappa_mu(Z)/M(Z)]/[Kappa_mu(K)/M(K)].
This is dimensionless and equals the ratio in FixedLines.exists_intermediateGroup_one_prime. If mu'=a mu, 0<a<infty, the inner integral scales by a and the outer integral by a, so Kappa scales by a^3 and M by a. Thus J is unchanged. Equivalently Kappa_mu(Z)/(M(Z)^2 M(C)) is itself invariant. Do not assert Kappa/M alone is invariant; it has degree two in measure.

The actual native bottom estimate floorZeroForm_le_main_term, for integer t>=0 and t+10^10 n^4<=k (n=rho+1, k=shape.k), is
  Kappa(Z)<=M(Z) M(C) [M(Z)+v^(t+1) 2^-n],
where v=volume(P.R \ P.intUnits) under the native additive measure. Divide by the exact K lower bound before applying any scale bound:
  J_mu(Z,K)<= M(Z)/M(K)+v^(t+1) 2^-n/M(K).
This follows from the same native measures, no assumption of an exact formula for the off-congruence integral. Native inv_two_pow_le_groupMeasure gives M(K)>=2^-n provided v<=1/B0 with B0>=2, here B0=b^9. Hence
  J<=[K:Z]^-1+v^(t+1).
This is a short exact reduction of the one-prime scalar comparison; it exposes the geometric main term and the sole remainder. In ENNReal carry the positive finite guards before division, or pass to reals with those guards. This is not a new estimate for the deep bottom-floor integral itself.

## 2. Actual native vector fixer and stronger one-place saving

Fix w in the prescribed set of chosen places above levelPrime 0 and its actual nonzero frame vector, including the optional contragredient action. Take precisely the subgroup Z constructed in FixedLines: image under p=(toPlaces T)|latStabilizer of the preimage of vectorFixer(w,d(w)) under reduction. Native proof gives p onto K, C<=Z<=K, and kernel/comap compatibility via integrality off T0. Surjective reduction, surjective projection onto the selected GL_r(q), and the actual ordinary or dual automorphism identify [K:Z] with the stabilizer index in GL_r(F_q), equal to q^r-1: GL acts transitively on nonzero vectors of F_q^r, including under contragredient. Here r=k+2rho+1, q=levelPrime 0, q>=b^10. This is NOT a line stabilizer (which would have a different index). Keep the original subgroup construction and kernel verification; the index formula is the original index_stabilizer_GL_vector step.

Native volume_nonunits_le gives v<=b^-9, b>=1000. Choose t=k-10^10 n^4 with the original natural subtraction guard. Setup.pow_chain gives 10^10 n^4<=n^6<=k/n (n^7<=k), so t>=k(1-1/n). Since n=rho+1>=100001, 9(t+1)>=8k. Also r>=k>=1 and q^r>=2. Therefore
  J <= 1/(q^r-1)+b^(-9(t+1))
    <= 2 b^(-10r)+b^(-8k)
    <= 3 b^(-8k)
    <= b^(-7k).
The last uses b^k>=3. This proves the native one-prime saving b^(-6k) with room to spare, from the EXACT same native bottom estimate. No change in chosen vector, field, local measure or parameter guards. If o=None take Z=K and J=1 exactly, as in native proof.

## 3. One finite product; cancellation of the common Haar scalar

The actual FixedLines.exists_intermediateGroup_lines partitions T into disjoint star-stable blocks T_i=T intersect {w,bar w} for each w in Sg, plus residual T_None. The partition exists since chosen places are distinct from their conjugates and all other chosen places. Retain the native map phi: U(T)->prod_i U(T_i) (restriction of all matrix entries), whose inverse assembles entries on the disjoint blocks. The native proof establishes bijectivity, continuous measurable embedding, product descriptions of K and C, and phase factorization: the additive character factors across the disjoint place blocks and the support and unipotent decompositions are coordinatewise. These facts need to be established in the exact native phase definitions; merely formal multiplication of independently normalized measures is insufficient.

Use native uniqueness of Haar: phi_*mu=a prod_i mu_i with common 0<a<infty. For product subgroups Z=phi^-1(prod_i Z_i), Fubini and phase factorization give exactly
  M(Z)=a prod_i M_i(Z_i),
  Kappa_mu(Z)=a^3 prod_i Kappa_{mu_i}(Z_i).
This is the native H Z identity (norm of a.toReal)^2*a=a^3 in finite positive real measures. It applies to the same product K. Thus
  J_mu(Z,K)=prod_i J_{mu_i}(Z_i,K_i).
The a^2 cancels BEFORE any estimates. No absolute global Haar constant needs computing; no assumption of common local normalization. Use the original membership implication for reduction in fixingSet, which only requires the vector conditions at included places. The residual block contributes exactly 1. Multiplying the one-place estimates yields
  J_mu(Z,K)<=b^(-7k|Sg|).
In particular the original b^(-6k|Sg|) follows directly. This gives a human proof of the native relative floor-energy transport with a stronger suppression factor, conditional on the original bottom-floor and group/measure premises.

Do NOT substitute the stronger exponent into downstream energy_fixingSet_le without checking the link-energy tail. Its actual hy uses tailScale^20*besselEnergy<=b^(-6k|Sg|) mainEnergy from besselEnergy_le (tailScale^44) and tailScale=b^(k f/4); at |Sg|=f this consumes all 24 powers of tailScale, i.e. b^(-6kf). The extra local factor alone does not improve that tail. Keep the existing 6k exponent in finite sieve, energy and positive-type consumer unless the tail is independently strengthened. This is an actual identified limiting budget, not a reason to optimize 7k into 8k.

## Sources and exact frontier
Compact pin as above:
- New/Filling/FixedLines.lean a9305a4f1db1dc1cc9861ce3abe53a8a6331fdc9: volume_nonunits_le, actual subgroup/index proof, product partition, Haar scalar and phase identities.
- New/Filling/TopFloor.lean 9762970967aef90b3a4e025b7f2891d892c70111: floorZeroForm, floorZeroForm_on_congGroup, inv_two_pow_le_groupMeasure, floorZeroForm_le_main_term.
- New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727: level primes, b,n,k, pow_chain, mainEnergy and besselEnergy_le.
- New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7: actual exists_finite_sieveSystem consumes FixedLines comparison, plus normalization and kernel bounds.
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444: energy_fixingSet_le and hy.
- Previous centered and extremal results retained on compact pin.

No new native compilation; no whole-proof completion or measured speedup. The bottom-floor majorant/shell estimate, global sieve and orbital-integral energy estimate are still the essential remaining mathematics in this branch, not consequences of normalization alone. The old proof already implements the measure factorization; our contribution is an explicit dimensionless human reconstruction and strengthened local suppression, not a claim of new theorem novelty relative to all literature. 

RESUME: go into TopFloor.floorZeroForm_le_main_term's off-congruence bound, actual lintegral_shells_le and pivotModulus_sq_le_of_capped. Separate exact congruence contribution from the off-congruence remainder; use the relative normalization above. Alternatively tackle actual global sieve after the native finite-sieve witness. Do not spend further runs optimizing the local exponent until the tail or deep supplier is resolved. Kernel/audit verify the scalar exponent and index normalizations; editor merge the short local ratio proof with the earlier extremal argument. HANDOFF geometry, kernel, audit, integration, editor.
