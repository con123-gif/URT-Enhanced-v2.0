# B3 averaged sieve — common head / Gram transport audit

28 November 2026. Status: SOURCE-MATCHED human proof of the common-cutoff junction, conditional on the actual existing local estimates and the convex SieveSystem construction. No native replay. Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0 / Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Continue preceding b4804e50b7cd86486b45eaa450e5e495a963634d §3, rather than repeat its scalar checks. Read current mission/spine/ledger blobs 3adc76221a978016e3505cdf3e36ad688354d7d7 / 1c4608f2190154fd4bc4b38fc77db10ec5e60e64 / 579ecc1cafdb28eae7d1c97565700c571dfa7484, AGENTS and swarm protocols. RUN90 shell transport is a separate prepared peer result.

## 1. Exact source and new audit result

Read actual pinned declarations (not old source):
- New/Filling/Moments.lean ec2cb964ede0d5eeae41a077dc6dbfface9c0444, energy_fixingSet_le lines 105–182; in particular 123–130 (choice), 133–142 (nested limits), 143–154 (subgroup/top estimate), 165–181 (Gram and density).
- New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610, eventually_isIntegralOff 57–58, exists_places_integralOff 63–67, exists_hasSum_cosetAmplitude 178–208, md_evalPlaces_rpow_half 222ff.
- New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7, sum_blocks_le_topKernel 156–169, exists_finite_sieveSystem 235–242.
- New/Filling/GlobalSieve.lean 0ad01a3eec4c5dcd2a51bb1d9773f7834970e372, hA/hg 82–84, sieve 172–179.
- New/Filling/BesselSystem.lean 847e2869ed2c189c30f6efef85e7c1f2451058, normCorrelation 67–69 and HasBandLimits 74–77; EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce, SieveSystem 81–91 and pi 96–112.
- CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18, fixingSet 38–39; CrudeEnergy.lean da67bf862a4c5e72ab6a81a7dfb462545cd8833f, energy_le_of_linkEnergy_le 180–183.

The earlier assertion of common cutoffs needs a precise quantifier order. In particular one MUST NOT intersect separate frequently-atTop sets (two cofinal sets can be disjoint), or infer monotonicity of squared norms when adding head tuples. Both pitfalls are avoided below. Also T0 is a finite set of rational units, not a set of primes; T is the finite set of places. The argument proves the requisite simultaneous truncation and Gram matching using one call to the source cofinality supplier on the union of units.

## 2. Choices before truncation: tagged support, not an injective union

Let alpha range over the finite family of proper prefix masks and direction choices from b4804e50, with c_alpha >= 0. Fix arbitrary finite F_alpha of the actual nonzero support of linkEnergy(univ intersect termDisc!=0, fixingSet_alpha, univ). All masks here are proper, so fixingSet has the good-minor clause. The full mask is excluded and continues through its separate crude bound.

For every tagged (alpha,j), j in F_alpha, choose exactly the witnesses of Moments 123–130 by applying GlobalToLocal.exists_hasSum_cosetAmplitude. Its hypotheses involve the nonzero amplitude over the original (c,s,c',Lambda) and nonzero leading minors of all terms over (c,s,c'), obtained from the good-minor clause precisely as in the original proof. Write t_j, sigma_j, n_j, L_j, H_j, H'_j for these witnesses (alpha implicit). In particular t_j is a unit, sigma_j in GT rho, frameProducts(sigma_j)_top,top=t_j, N^2<|Phi_v(t_j)|^2 for every v, reduction(n_j)=s_j and Lambda_j=link(w_1 sigma_j). The limit functions are on the SAME rational head space X=(Fin rho -> E^×), not on a mask-dependent space.

No coherence of choices for a block appearing in two masks is needed. For each alpha and t, use the original fiber {j in F_alpha | t_j=t}; native injection of (c,c',reduction(n),sigma) is required only within this fiber, using the original link identity. Do not apply the injection premise to the tagged union (it may contain two copies of the same block). The tag is used only for finite sums, choice, and simultaneous convergence.

## 3. Two directed limits with correct cofinal witnesses

Let U be the union of the finite sets U_alpha=image(t,F_alpha). For an arbitrary finite head truncation A subset X, define the single rational-unit set

    T0 = U union union_{p in A} image(p, Fin rho).
    B(T0) = {p in X | all coordinates of p lie in T0}.

B(T0) is a finite head set containing A, exactly the map of univ over Fin rho -> subtype T0 in Moments 137–139. Empty fibers, empty A and rho=0 are permitted; if every F_alpha is empty the bound is immediate. For fixed A and T0, apply GlobalToLocal.exists_places_integralOff T0 ONCE. It supplies frequently-atTop T star-stable with t,t^-1 T-integral for all t in T0, gIdele^-1 integral off T, latBasis in intGL(integralOff T) and N^-1 T-integral. This one frequently condition is intersected only with an eventually condition: for the finite family of all tagged j and p in B(T0), eventual integrality of the two term positions from Moments 142, 144–146 and 182 follows from eventually_isIntegralOff and finite conjunction. Intersecting frequently with eventually is valid. No assumption that the intersection of arbitrary cofinal sets is cofinal.

For each such T choose ONE filling level F and local place structure P by exists_isFillingLevel; within that level choose each Z_alpha and K_alpha via FiniteSystem.exists_finite_sieveSystem. The subgroup containment has its own n_j because reduction(n_j)=s_j lies in fixingSet_alpha. Each native sum_blocks_le_topKernel gives an eventually-smallSets condition. Intersect the finitely many conditions over alpha and its nonempty t-fibers; then use the very same closed-ball open additive subgroup basis as Moments 147–148, yielding ONE compact open L containing 0. This is a finite intersection in a filter of eventual conditions, not of merely frequent conditions. No uniform bound on the subgroup radius in alpha, A or T is required.

Take limits in the following order. For fixed T0, the finite weighted sum of squared norms of the finite coset-amplitude sums converges as T tends to atTop, by each H'_j, finite linearity and continuity of norm squared. If a fixed upper bound holds frequently in T, it holds at the limit. Then consider the finite weighted sum with the inner T-limits taken, as the head finset tends to atTop: H_j (HasSum) gives convergence of each finite head sum. For every initial A the constructed B(T0) contains A, so the inequality at these B(T0) is frequently true. Apply le_of_tendsto_of_frequently again, exactly in the order of Moments 136–142. This is not monotone convergence of complex partial sums. The upper bound below is independent of T0, T, L and all F_alpha. Finally take the supremum over arbitrary F_alpha (finite products of finite selections); nonnegative terms imply the desired weighted ENNReal sum bound. The coefficient c_alpha=0 is harmless, and no division by a zero total energy is used. The common r from Moments 133–139 is strictly positive and can be cancelled after summing.

## 4. Common Gram is a source equality, not a new analytic hypothesis

For the above fixed T0, T, F, and each t in U, let

    a_p = padTuple(p,t), omega_p = Units.map(ratToPlaces T) composed with a_p,
    x_v(p,t)(i) = unitOrOne(frameScaleSq(v,i) * Phi_v(a_p(i))),
    R_t(p,q) = product_v bandLimit_v(n, x_v(p,t), x_v(q,t)).

The exact R_t is independent of alpha and all choices sigma_j. Indeed Moments 165–175 proves the Gram equality demanded by FiniteSystem 165–166 with this R_t: use HasBandLimits.2 for each sigma_j (GT hypothesis, its actual top frame product t, same padded top entry); the product of the local normalized correlations is the Gram of the scaled global correlation by the product-vector inner product and product-measure identity. The proof uses the original real Bessel functions and .cut side throughout. No finite subgroup variable appears in this equality.

The second demanded equality rho_p * F.headDensity(rho,omega_p,1).toReal = r sqrt(G_t) is precisely Moments 176–181, using md_evalPlaces_rpow_half(h0 on each head unit), the same level F, scales and t. Here G_t=(product_v(|Phi_v(t)|^2-N^2))^(k-1). This is independent of Z_alpha, its massRatio, and L. Thus even where representatives differ between masks, both identities hold with the SAME R_t and head-density factors. Subgroup-dependence remains solely in K_alpha's normalized finite top kernel. It is essential to use each Z_alpha's own normalization, not divide an averaged raw kernel by an averaged mass.

For fixed common T0, let Q_alpha(t) = Re sum_{p,q in B(T0)} R_t(p,q) J_alpha(n,omega_p,omega_q), with J_alpha the normalized system from K_alpha. This is nonnegative for every t in U, INCLUDING t absent from the alpha fiber. The source gives this without a new Gram hypothesis: each local real band system has SieveSystem.posSemidef (HasBandLimits.1), and K_alpha.posSemidef holds for common entry rho=t. Use the existing SieveSystem.pi (EichlerFlag 96–112), whose PSD proof explicitly uses Hadamard products, then its top quadratic form at the all-ones vector. No sigma representative for the missing fiber is needed. This justifies padding the t-label sum from U_alpha to U. It does not justify monotone enlargement of B(T0).

Consequently, with C=(1+b^-6)*packetConst and P=sum c_alpha>0, summing the separate native top estimates gives

    sum_alpha c_alpha sum_{j in F_alpha} r^2 |sum_{p in B(T0)} cosetAmplitude(T,j,p)|^2
      <= C sum_alpha c_alpha sum_{t in U_alpha} Q_alpha(t)
      <= C sum_{t in U} sum_alpha c_alpha Q_alpha(t)
      = C P Qbar(U).

Here Qbar is the same GlobalSieve.sieve expression with Jbar=P^-1 sum c_alpha J_alpha. Its precise hypotheses are common hA on T0, hg, U subset T0, and the convex SieveSystem closure of b4804e50 §2. The two inequalities and equality retain all original block hypotheses. Apply sieve once, then use the affine calibration and crude-energy junction in the preceding note. This establishes common-cutoff/Gram transport as a human source-matched proof, not a new arithmetic bound or a claim that the entire earlier derivation has compiled.

## 5. Native replay frontier

The following minimal helper is PREPARED (not compiled), to use at the exact finite t-label padding above. It does not establish the source matching or substitute for the actual caller.

```lean
import New.Filling.Moments
open Finset
open scoped BigOperators
namespace Filling
theorem commonTopLabels_weighted
    {I T : Type*} [Fintype I] [DecidableEq T]
    (c : I → ℝ) (V : I → Finset T) (U : Finset T)
    (Q : I → T → ℝ)
    (hc : ∀ i, 0 ≤ c i) (hV : ∀ i, V i ⊆ U)
    (hQ : ∀ i t, t ∈ U → 0 ≤ Q i t) :
    (∑ i, c i * ∑ t ∈ V i, Q i t) ≤
      ∑ t ∈ U, ∑ i, c i * Q i t := by
  classical
  calc
    _ ≤ ∑ i, c i * ∑ t ∈ U, Q i t := by
      apply Finset.sum_le_sum
      intro i hi
      apply mul_le_mul_of_nonneg_left _ (hc i)
      exact Finset.sum_le_sum_of_subset_of_nonneg (hV i)
        (fun t ht _ ↦ hQ i t ht)
    _ = _ := by
      simp_rw [Finset.mul_sum]
      rw [Finset.sum_comm]
#print axioms commonTopLabels_weighted
end Filling
```

Verification actually done this run: read the exact cited upstream source bodies, checked the quantifier order, audited the matching equalities at their original call sites, and read the existing live dependency receipts. Native Lean/lake absent from the local environment (command -v lean, command -v lake returned no paths). No new native rh_scan/prune/reduce/auto/frontier execution or kernel/axiom graph result; no synthetic regression tests or inferred CI PASS. The current source graph retains GlobalToLocal, FiniteSystem, all local band-limit and calibration dependencies. Proposed reduced caller graph replaces the repeated global sieve calls only; it adds the finite weighted padding/convex closure and shares the original cofinality supplier. No global dependency removal or B3/B4 root closure claimed.

RESUME HERE: implement the convex closure of the exact EichlerFlag.SieveSystem fields (especially Integrable twisted step, finite linearity of its zero-frequency integral, and posSemidef), and compile that together with commonTopLabels_weighted on the retained compact workspace before attempting the full weighted Moments caller. Preserve original caller and graph; use one shared runner slot and verify actual exit/axiom outputs. HANDOFF TO integration / Landau / positivity / audit.
