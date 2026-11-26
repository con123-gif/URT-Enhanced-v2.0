# One adelic determinant witness for A+B+C
26 November 2026. User requests unification as a route to breakthrough. This is a rigorous source-matched human reduction of the actual compact proof's final assembly, not an independent RH proof. Primary pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207; no native replay. All deep native suppliers listed below remain required. One URT lane only; fourteen ordinary proof lanes.

## The unified object

Fix the SAME admissible Data, row dimension D>0, original A/B-selected n independent short rows y and index allowance delta. Complete them to one basis x of the row space using the native crude rows. Put s=D-n, G_v=Gram(Theta_v x), A=det G_1 nonzero. Keep the same m-fold fit family theta indexed by p-adic isomorphisms iota, with theta_iota prime to the corresponding p. For every j=1,...,m define K_j(v) as the determinant of the actual compressed comparison Gram operator (smallHookNumber times projection of gl_v gl_v* onto the good lift image), and R_j(v)=heckeValueProd(j,v^j)/heckeValueProd(j,1). Here gl_v and R_j(v) refer to the j-th power of v, not a separately chosen twist. Set C(v)=|c(v)/c(1)|>0, with native chain-volume normalization c.

The actual adjoint comparison u_v* gl_v=gamma_v A_j with A_j surjective independent of v implies
  lambda_j(v) K_j(v) = h_j^D |gamma_v|^(2D) det(A_j A_j*),
where h_j=smallHookNumber, lambda_j(v)=liftVolume(v,j). Thus
  lambda_j(v)/lambda_j(1) = R_j(v)^D K_j(1)/K_j(v).
All factors nonzero. By the common-basis Gram determinant ratio and actual chain factorization,
  det G_v / A = z(v)/z(1) = C(v)^D prod_j [lambda_j(v)/lambda_j(1)].
Combine EXACTLY, before applying any bounds:
  det G_v prod_j K_j(v)
     = A prod_j K_j(1) * C(v)^D prod_j R_j(v)^D.       (U)
No choice of orthonormal bases across twists is needed; common row basis only. This is the actual source factorization, not an assumption that finite Bessel moments commute with p-adic projection.

## Work with a single witness, not two cancelling volume heights

Recall HeightLe(c,y): a nonzero complex auxiliary number U, arch bound alpha at all automorphisms, local bounds e_p at every embedding iota over p for U y_iota, and eventual alpha+sum e_p<=c. A direct square-root rule holds: if HeightLe(2c,y²), choose a complex square root of U; for EVERY arch/p-adic embedding, |j(sqrt(U)y)|²=|j(U y²)|. Halve every bound. Thus HeightLe(c,y). This uses no choice of compatible square roots at individual primes. In particular CostsSquares(m²) gives HeightLe(m² t x^999,C(theta)^-1); the native statement bounds C^-2 with twice that budget. It is unnecessary to square the entire determinant identity to use this normalization.

Use the actual integral pairing in LongForms, with two possibly DIFFERENT recombination matrices at j_p and j_p∘conj. Let Gamma_iota=|gamma_aux(theta_iota)/gamma_aux(1)| (the crude-row scalar, not gamma_v of a comparison operator). The local determinant bound is
  |iota(det G_theta * Gamma_iota^(2s))| <= exp(2 e_p),
and the common untwisted A has arch log bound alpha_A=V+s a_aux, where V=n(H-mR+L) and a_aux is the native squared norm bound per completion row. Here H=mainHeight, R=remainder, B=budget, L=log b*B. Native crude_rows bounds alpha_A + s g_aux <= V+D b with HeightLe(g_aux,Gamma^-2), and sum_p e_p<=delta. Keep those exact guards. The determinant bound follows by multiplying determinants of the two recombination matrices and the Gram matrix; use the second matrix at conjugate embedding, not commuting p-adic embedding with complex conjugation.

For each j, the SAME fit family supplies beta_j(p) with sum over finite primes<=B0, B0=B/(mk). Native arch and p-adic compressed-Gram estimates give
  |sigma(K_j(1))| <= exp(2D r B0) for ALL complex automorphisms,
  |iota(K_j(theta_iota))| <= exp(D r beta_j(p))
where r=Data.r, distinct from s (number of missing rows) and R (remainder). The native Hecke-value inverse height is
  HeightLe(Q_j,R_j(theta)^-1), Q_j=10m x^999+k(6B0-dirCost).
It is a signed bound and may be negative. The source's conductor-power conversions have norm one because the SAME twist is prime to p. Retain all these hypotheses.

Set W0=A prod_j K_j(1), a single nonzero complex number, and define the local family
  F_iota = Gamma_iota^(2s) C(theta_iota)^D prod_j R_j(theta_iota)^D.
By (U), exactly
  W0 F_iota = det G_theta Gamma_iota^(2s) prod_j K_j(theta_iota).
Therefore |iota(W0 F_iota)|<=exp(2e_p+D r sum_j beta_j(p)) and
|sigma W0|<=exp(alpha_A+2m D r B0). This is one witness for the entire combined local estimate, not two ratios separately.

Choose auxiliary HeightLe witnesses W_G, W_C, W_j for Gamma^-2, C^-1 and R_j^-1 respectively. Form ONE nonzero number
  W = W0 W_G^s W_C^D prod_j W_j^D.                   (W)
Multiplying the local bounds for W0 F_iota and the inverse factors cancels F_iota EXACTLY, giving local bounds for W itself at every iota; the arch bounds add. Eventually their total is <=
  alpha_A+2delta+s g_aux + D m² t x^999
       + D sum_j [3r B0 + 10m x^999 + k(6B0-dirCost)].
Because W is nonzero and has a uniform arch bound, it is algebraic: if transcendental, scaling it by arbitrary positive integers while fixing the other elements of a transcendence basis extends to complex automorphisms, contradicting the uniform bound. Apply the product formula to the rational norm of W in its finite number field, using extension of all embeddings as in HeightLe.nonneg. Its signed total cannot be negative. This is the only global product-formula application. No independent assumption of algebraicity of the theta volumes is made.

Hence the more precise direct scalar inequality is
  0 <= V + 2delta + D b - D H
         + D [m² t x^999 + 10m² x^999 + (3r/k+6) B].     (S)
We used mk dirCost=H and mk B0=B. In particular the native magnitude bounds 3r B0+10m x^999+6kB0<=k log b B0 and m²t x^999<=L show that (S) implies exactly the native C bound
  V+2delta >= D(H-2L-b) >= D(H-3L).
The direct route bypasses separate human lemmas heightLe_liftVolume_ratio, heightLe_volume_ratio_sq, heightLe_volume_rows and their squared-ratio cancellation as independent exposition blocks. It still explicitly uses their lower-level mathematical suppliers and does NOT remove them from native Lean or its axiom/dependency graph.

Finally substitute A's per-row log bound h=H-mR+L, V=n h, B's rank defect s<=4D/b², and delta<=5D log(1+b²)B into (S). Use -h<=b² x^99, so nh<=Dh+4D x^99 even when h is negative. Divide by D and cancel H:
  mR <= L+4x^99+10log(1+b²)B+b
           +m²(t+10)x^999+(3r/k+6)B.
This retains the raw signed repayment rather than coarsening it to 3L. The original star_inequality follows with exactly the original size estimates. The important result is not a smaller constant: the common determinant witness (W) uses the SAME rows, SAME local repairs, SAME completion and SAME twist in one product formula. It exposes the exact shared supplier contract.

## What is and is not unified

A supplies short vectors and actual local recombination matrices; B supplies a sufficiently large common independent family; C supplies comparison and twisted local denominator bounds. They meet at the product (U) and witness (W), not at a generic URT spectral ansatz. The actual remaining bottlenecks are construction of those inputs: A local Schur-jet raises, marked/Fourier elementary divisors and stage support; B quantitative coherent-link energy and local Bessel band/geometry; C fit-family/row Selmer denominator and comparison-form construction including rigid-label and Rallis suppliers. Neither (U) nor positivity alone establishes any of these. No fabricated completion, no guarantee of deadline.

Source anchors at compact pin: New/Endgame/LongForms.lean 9eff36cf003ac398fbd24361e80e95a03d0b0e05; New/Rows/RowVolume.lean 925de9c592b40763516e70ddeae48b4ad1a35b88; New/Rows/LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1; New/Rows/HeckeValueHeight.lean f61d2e3c521863d4f814e3338e37c4e2c2fd1f84; New/Heights/Heights.lean a18a99e1f76a6e963113cae8f906ddc99814f518; New/Heights/OneDeterminant.lean 329f004f845b9e2becc896419c8594e82dfef0a6; New/Exchange/CostOfSquares.lean 3842be43cd82966d3398d9929f72dd7667a62f4d; New/Main.lean 198ed5bf26aa294898931e0649bc2b88f1389f65. Previous integrated source-matched derivations retained; peer c7cde9ac and bf254a7b comparison orientation retained. All derivations human, independent audit and native verification outstanding.

RESUME HERE: editor condense the final assembly to (U), (W), (S), link every primitive supplier to this exact contract, and preserve the prior expanded proof as an audit appendix. All mathematical lanes close actual supplier premises rather than re-prove equivalent volume height assemblies. Kernel use shared targeted verification already queued; do not wait on it for human proof work. No new claim that the proof is complete.
