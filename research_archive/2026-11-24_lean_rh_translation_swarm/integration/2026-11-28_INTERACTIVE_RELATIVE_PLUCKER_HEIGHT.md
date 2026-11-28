# Relative Plücker height: replace the absolute table-basis cost
28 November 2026. Human conditional local-to-global height reduction, no compact Lean replay, no bound for the actual arithmetic cut, no RH closure. Credit Alpöge, Sernau, Anthropic collaborators and Claude for the comparison forms, Selmer bound and Auerbach machinery. Follows 59717cca4d087d77e2c05b2c889ee7d29de3a47b. Compact pin 72fead102f663d5c7a407964a13dc0cf9d977207.

## 1. The common map between TWO table subspaces
Use the exact native comparison data: X=goodForms(W_j), Q=Tables(j), u_theta=goodLift(theta,j), gl_theta:Q→V_theta, A:Q→X surjective, u_theta*gl_theta=gamma_theta A. Let B_theta=u_theta*u_theta, K=A A*, h=smallHookNumber j. Fix S⊂X, dim n>0, reducing every B_theta. Keep the actual fit family. Define
    E=A*K^-1 S,    F=A*S,    Z_theta=u_theta S.
Then A|E is an isomorphism to S; gl_theta(E) is tested for Z_theta^perp by the exact dual-table argument in 59717cca. All native good-type/Hecke-test containments are retained. Define
    C_theta=h gl_theta* P_Ztheta gl_theta | E : E→F.
Because P_Ztheta gl_theta ζ=gamma_theta u_theta B_theta^-1 Aζ on E, we have
    C_theta ζ=h |gamma_theta|² A* B_theta^-1 Aζ.
This is an isomorphism to F. Select ANY nonzero fixed exterior generators e in wedge^n E and f in wedge^n F. Write wedge^n C_theta(e)=a_theta f. Then exactly
    a_theta/a_1=|gamma_theta/gamma_1|^(2n) lambda_1(S)/lambda_theta(S),
where lambda_theta(S)=det(B_theta|S). Proof in basis ζ_i with Aζ_i=y_i and F basis A*y_i; other fixed exterior generators multiply every a_theta by the same nonzero factor. No global integral basis of E is needed. The reducing assumption is still essential for F to be fixed and for inverse compression to equal the reciprocal primal determinant.

## 2. Archimedean exterior bound
Use the table Hilbert norm (integer positive Weyl Gram matrices, product across indices). At sigma∈Aut(C) apply sigma coordinatewise, with ordinary positive Hermitian norm on the resulting table. The Cauchy–Schwarz theorem norm_map_inner_le on LevelForms.lean bounds |sigma<y,x>| by norms at sigma and sigma'=conj∘sigma∘conj. For ζ∈E and arbitrary ξ∈Q,
    <ξ,C_1 ζ>=h <gl_1 ξ,P_Z1 gl_1 ζ>.
The actual cut-tested condition and normSqAt_starProjection_le (FitTwists.lean blob c62935a73ccbef6c7fc42f45c83f111e811a5825 lines 96–112) control P_Z1 gl_1 ζ at all conjugates. The native comparison size inequality (ComparisonForms.lean blob 14ef893c54f5db837ea7e4f143b2b1a444b89b5a lines 200–206) therefore gives
    |sigma<ξ,C_1ζ>|≤exp(2rB0) ||sigma' ξ||_Q ||sigma ζ||_Q.
The table Gram matrix is integral and fixed by sigma; sigma(conj ξ)=conj(sigma' ξ). Since sigma' is surjective, this is exactly the operator bound ||sigma C_1||≤exp(2rB0) from sigma E to sigma F in table coordinates. Taking wedge^n (all singular values bounded) yields
    |sigma a_1| ||sigma f||_∧ ≤ exp(2nrB0)||sigma e||_∧.
No small integral basis used at infinity.

## 3. p-adic exterior bound using native Auerbach coordinates
Fix iota above l. The existing norm_det_compressedGramOp_padic_le (LiftVolumeHeight.lean blob 87938141d4103b485fd5a7125721798f65f973f1 lines 51–70) constructs a finite coordinate-dual family f_a in Q using local integral class representatives δ. Its identity Y states
    <f_a,ζ>=h conj(weightRep(δ)(star ζ)_a).
The coordinate functionals ell_a(ζ)=<f_a,ζ>/h jointly separate Q and, by that identity and weylGauge_le_one_iff, the condition max_a |iota ell_a(ζ)|≤1 is exactly the table-integrality condition needed on ζ to make gl_theta ζ integral at iota (star ζ at the conjugate embedding). Also each gl_theta f_a is integral at every embedding above l: this is the left-table integrality proof at lines 64–69, using the integral Fock pairing coefficients after the same representative change. Retain the actual choice δ, conjugation conventions, hook scaling, and fit conductor guard. Do not use an arbitrary complex orthonormal basis in place of these f_a.
Define the iota exterior coordinate norm of any wedge w by
    ||w||_(iota,∧)=max over n-tuples a of |iota (ell_{a1}∧...∧ell_{an})(w)|.
It is positive on nonzero wedge generators and uses the SAME local coordinate system for E,F. The native Auerbach lemma (Lib/General/LinearAlgebra/CommonEigenvectors.lean) on E gives basis ζ_1,...,ζ_n with all max_a |iota ell_a(ζ_b)|≤1 and selected coordinate minor equal to 1. Every minor has norm ≤1 by ultrametricity, so ||ζ_1∧...∧ζ_n||=1. Write ζ_1∧...∧ζ_n=c e, then |iota c|=1/||e||_(iota,∧).
For each n-tuple a,
    ell_a(C_theta ζ_b)=<gl_theta f_a,P_Ztheta gl_theta ζ_b>.
The right forms are integral at iota and cut-tested by §1, and left forms integral at every embedding above l. If the SMALLER native DenominatorLe holds for Z_theta with β_l, its actual definition (FitTwists.lean lines 50–53) gives the determinant of each such n by n matrix norm≤exp(n r β_l). Hence
    ||wedge^n C_theta(c e)||_(iota,∧)≤exp(n r β_l),
    |iota a_theta| ||f||_(iota,∧)≤exp(n r β_l)||e||_(iota,∧).
This is an exterior operator estimate between distinct fixed subspaces; no claim that an arbitrary projection to E preserves integrality. The smaller DenominatorLe still needs actual eligible cut and Selmer witnesses. IsFitFamily only states the full-range DenominatorLe, not this conclusion for arbitrary cuts.

## 4. Exact resulting signed height cost
Define real bounds α_0,e_l (if they exist) satisfying
    log(||sigma e||_∧/||sigma f||_∧)≤α_0 for every sigma,
    log(||e||_(iota,∧)/||f||_(iota,∧))≤e_l for every iota above l,
and α_0+Σ_{prime l<M} e_l≤J for all sufficiently large M. These are a relative exterior-height bound, not the difference of two independently maximized global heights. Signed terms allowed by the actual HeightLe definition in Heights.lean blob a18a99e1f76a6e963113cae8f906ddc99814f518. No assertion of automatic finite J for arbitrary complex cuts. Then using a_1 as the fixed global witness, §§2–3 and Σβ_l≤B0 give exactly
    HeightLe(3nrB0+J, a_theta/a_1).
Multiply by the n-th power of the source inverse Hecke-value ratio (HeckeValueHeight.lean), to obtain
    HeightLe(n[3rB0+10m x^999+k(6B0−dirCost)]+J, lambda_1(S)/lambda_theta(S)).
Thus the additional absolute cost n K_j of 59717cca is replaced by a SINGLE RELATIVE Plücker cost J_j. If E=F, choose e=f and J=0 EXACTLY, without any arithmetic bound on the complexity of E itself. This recovers the comparison-metric-invariant case even for a large-height cut. More generally E,F need not coincide and both may have high absolute heights. Relative cost need not be nonnegative; do not use cancellation across distinct primes or different embeddings unless the uniform bounds prove it. In the elementary model of Q² with standard Euclidean and sup coordinate norms, E=span((1,0)), F=span((1,N)) for integer N>0, choose those primitive rational generators; local ratios are 1 at every prime and alpha_0=−(1/2)log(1+N²). Reverse the lines and the cost becomes positive and arbitrarily large. This illustrates that the relative condition is not automatic.

Retain common reducing cuts and actual common Gram/Hecke chain product transport, the unchanged chain scalar budget and same short row span as in b26a6bac and 59717cca. The governing inequality becomes
    mR≤3L+2I/n+(1/n) Σ_j J_j.
Thus Σ_j J_j≤n L suffices at n≥v/2, I≤vB. This is a conditional replacement of the previous global integral basis requirement by relative line-height control, NOT an established arithmetic estimate for the native E,F.

## 5. Exact boundary and next target
The native local gauge formulas and Auerbach basis remove the need to construct a common globally integral small table basis. It remains to prove the relative cost bound for an actual Hecke-compatible short cut, obtain its smaller Selmer denominator budget, and verify the chain product restriction. The individual reference Gelfand-Graev weights do not prove any of these. For arbitrary S not reducing B_theta, the codomain A*B_theta^-1 S moves with theta, so the fixed F comparison does not apply. No basis-independence trick establishes primal/dual compression equality. No Lean replay; no verified B3 or CrudeRows dependency removal; no independent RH proof. The general exterior estimate is a human derivation from named native inequalities; its exact Lean implementation still needs checking. Prioritize a direct bound for the relative exterior norms or a short subspace invariant under comparison metrics, not another reparameterization of the same assumption.
