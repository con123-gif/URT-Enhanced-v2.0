# Dual table cut: remove comparison-metric invariance at an explicit height cost
28 November 2026. Human finite-dimensional and conditional height argument, not a compact Lean replay, not a proof of a small arithmetic cut, and not RH closure. Credit Alpöge, Sernau, Anthropic collaborators and Claude for the underlying comparison-form, Selmer and height machinery. Follows b26a6bac65310fbba7a961afa7f50cd99092a32e. Compact source pin 72fead102f663d5c7a407964a13dc0cf9d977207.

## 1. Exact cut-test transfer without AA* invariance
Fix a single lift index j and write X=goodForms(W_j), Q=Tables(j), u_theta=goodLift(theta,j):X→V_theta (injective), gl_theta:Q→V_theta, and A:Q→X the common surjective comparison map. The native exists_comparison_forms (ComparisonForms.lean blob 14ef893c54f5db837ea7e4f143b2b1a444b89b5a, lines 200–206) gives u_theta* gl_theta=gamma_theta A, gamma_theta≠0, and gl_theta A*y tested relative to range(u_theta)^perp for all y∈X. Set B_theta=u_theta*u_theta>0 and K=A A*>0. If S⊂X is any n-dimensional subspace, define its common dual table cut
    E_S=A* K^-1 S ⊂ range A*.
Then A|E_S:E_S→S is an isomorphism: A A* K^-1=I; conversely E_S has dimension n. Define the twist-dependent dual lift cut
    Z_theta=u_theta B_theta^-1 S.
The orthogonal projection P_full to range(u_theta) satisfies
    P_full gl_theta ζ=gamma_theta u_theta B_theta^-1 Aζ.
Indeed P_full=u_theta B_theta^-1 u_theta*. Thus for ζ∈E_S this lies in Z_theta. As ζ is in range A*, gl_theta ζ is tested for the full lift range. The native full range lies in the good-type image intersected with each specified Hecke-test kernel (LiftVolumeHeight.lean lines 89–91). Call this intersection C_w. For x∈C_w∩Z_theta^perp, decompose x=P_full x+(I−P_full)x. Both terms lie in C_w because the full range is contained in it; the second is perpendicular to the full range. The first is perpendicular to Z_theta. The full tested property annihilates the second, and the projected identity above annihilates the first. Hence
    gl_theta(E_S) is tested relative to Z_theta^perp.
This holds for arbitrary S without assuming K S⊂S, or B_theta S⊂S. If S reduces B_theta then Z_theta=u_theta S, exactly the primal lift cut needed by the previous partial determinant note. No need for S to reduce the comparison metric K. This is an exact statement about the native map and test condition, not a claim about arithmetic eligibility of arbitrary Z_theta.

## 2. Exact determinant identity on the dual cut
Fix any basis ζ_1,...,ζ_n of E_S and write y_i=Aζ_i, a basis of S. Define
    p_theta=det( <P_full gl_theta ζ_i,P_full gl_theta ζ_j> ) >0.
The projection identity gives p_theta=|gamma_theta|^(2n) det(<y_i,B_theta^-1 y_j>). If S reduces B_theta for all twists, then, with lambda_theta(S)=det(B_theta|S) in an orthonormal basis,
    p_theta=|gamma_theta|^(2n) det(Gram(y_i))/lambda_theta(S).
Therefore for the same basis, with reference theta=1,
    lambda_1(S)/lambda_theta(S)
      =(p_theta/p_1) (|gamma_theta/gamma_1|²)^(-n).
The common table basis cancels. If S does NOT reduce B_theta, this instead controls the inverse compression (the inverse of the Schur complement), NOT the original compressed Gram determinant. Do not silently replace it. Counterexample B=[[2,1],[1,2]] on C² and S=span(e1): compression is 2, inverse compression 2/3, inverse of compression 1/2. Thus the reduction still requires suitable common Hecke/Gram cuts or a new primal-dual bridge.

## 3. Explicit sufficient arithmetic cost of the table basis
Suppose the selected S is a reducing cut with the native eligible spanning property, so denominatorLe_rowBudget can be reused for the smaller Z_theta=u_theta S. Retain the actual common fit family, and the same scalar gamma and height laws as in the source. Explicitly require for the cut a family beta_l with sum<=B0 giving the smaller DenominatorLe at each fit twist; this is NOT automatically a consequence of IsFitFamily's full-range statement, and must be obtained from the existing Selmer witnesses/DenominatorBound.lean. Now make just the following extra table-basis assumption:
- the fixed ζ_i above are integral at ALL embeddings over all primes in the table gauge of ComparisonForms.lean (including the conjugated condition);
- their conjugate squared table norms obey sum_a weylNormSq(sigma∘ζ_i(a))≤exp(K_j) for every sigma∈Aut(C), all i, with K_j≥0.
These are arithmetic size conditions on the actual dual table cut, not an assumed norm bound on a possibly transcendental projector.

At the trivial twist, use the cut-tested property from §1 and the source AuxPair.normSqAt_starProjection_le (FitTwists.lean blob c62935a73ccbef6c7fc42f45c83f111e811a5825, lines 96–112), since Z_1 lies in the required good-type/Hecke-test intersection. Each projected gl_1 ζ_i has squared norm at sigma bounded by exp(2r B0+K_j)/smallHookNumber using normSqAt_comparisonForm_le. The hook number is a positive integer ≥1, so discarding its inverse gives an upper bound. The same all-conjugate Gram/Hadamard bound used by LongForms yields |sigma(p_1)|≤exp(n(2rB0+K_j)). Here p_1≠0 is the fixed global height witness.
At each iota, the native comparison-form integrality holds at all embeddings over l for the left gl_theta ζ_i and at iota for the right, because the fit twist conductor is coprime to l and the table basis satisfies the global gauge assumption. The right forms are tested for Z_theta by §1. The smaller DenominatorLe definition (FitTwists.lean lines 50–53) gives |iota(p_theta)|≤exp(n r beta_l) since P_full gl_theta ζ_i is already in Z_theta and hence equals its projection to Z_theta. Thus, in the exact HeightLe definition, with witness p_1,
    HeightLe(n(3r B0+K_j), p_theta/p_1).
Multiply by the n-th power of the native inverse Hecke-value ratio HeightLe (HeckeValueHeight.lean heightLe_inv_heckeValueProd_div):
    HeightLe(n[3rB0+K_j+10m x^999+k(6B0−dirCost)], lambda_1(S)/lambda_theta(S)).
This uses the original p-adic denominator theorem and no new arithmetic operator on tables. Compared with the full-row proof, the additional cost is exactly n K_j. It does not require K=A A* to preserve S.

## 4. Actual scalar slack
Let B=fa(log b)^3, L=log(b)B, B0=B/(mk) and H_main=mk dirCost. Suppose common reducing cuts S_j of dimension n are matched to the short row span by the actual common Hecke Gram operators, and their determinant products and native chain scalar transport hold on those cuts (see b26a6bac note; must audit triangle product restriction and same fit family). Sum the above height costs over j and use the unchanged chain scalar cost ≤nL. On the scale guards of the native proof, 3rB0+10m x^999+6kB0≤k log(b)B0; thus the per-lift upper bound is the original per-row one plus K_j. For the reciprocal squared chain-volume ratio the result is
    HeightLe(2n[2L−H_main+Σ_j K_j], z_S(1)^2/z_S(theta)^2).
Combining with the one_determinant upper height on the same actual n short rows, no auxiliary completion, yields
    mR≤3L+2I/n+Σ_j K_j.
For a single translate with n≥v/2, I≤vB, so it suffices to have Σ_j K_j≤L; indeed mR≤4L+4B≤(log b)^2 B at b≥1000. This yields a concrete total arithmetic height budget for the common dual table cuts. It is not a proof that such small bases exist.

## 5. What has and has not been accomplished
- Exact dual table cut and transfer of full tested property to the cut are proved algebraically, with no AA* invariance. This removes a guard identified in the previous note, but trades it for arithmetic basis size requirements in the proposed height proof.
- Restricted reciprocal height is conditional on the stated integral table basis, smaller denominator, common Hecke reductions, and chain transport. The original source already has generic smaller-cut Selmer theorem; proving the actual cut satisfies its span and budget remains required. No formal replay of the new route.
- The actual Poincare range may contain no joint Hecke reducing subspace of adequate rank. A generic proper subspace of a space with distinct simultaneous eigenlines need contain none of those lines. Even if a reducing cut exists, E_S may have large arithmetic height. Do not infer small height from finite-dimensional invertibility, classical multiplicity one, or Gelfand-Graev weights.
- New next target: construct an actual small integral table cut with a matching short Hecke-stable family, or prove a bound for the primal/dual Schur-complement ratio to remove the reducing-cut guard. If that fails, retain the native filling route. No independent RH proof, no global dependency deletion, no priority claim.
