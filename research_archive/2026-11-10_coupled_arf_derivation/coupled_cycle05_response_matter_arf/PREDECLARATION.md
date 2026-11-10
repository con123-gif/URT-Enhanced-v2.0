# Coupled cycle 05 predeclaration

Five-solid constraints, recursive response, transfers, Ward contacts,
then charged-matter H13 ⊕ H51 with fermion poles and EM responses.
ARFs are compared only at the end, with a look-elsewhere count.
No historical ARF formula is inserted into any operator.

A. Five-solid constraints (original D, Cbridge, Plinear, Eglobal):
   (V,E,F) = (50,90,50); Tr D² = 720; Tr D⁴ = 3456; Tr Cbridge = 160;
   rank Plinear = 8; every solid contributes to Eglobal; every unordered
   pair of solids has a nonzero mixed quartic q4(e_i + e_j) − q4(e_i) − q4(e_j)
   using the Schur bound (2/9, 7/32) on deterministic unit vertex indicators
   (no RNG).

B. Recursive response operator of the unique zero-background KMS semigroup
   T0 = exp(−η H0), H0 = (Hg ⊕ Hbits) plus the charge-1 / charge-2 clock
   Laplacians with coefficient r², Hg = D² + Cbridge, η = −ln Δ.
   Resolvent R(z) = (I − z T0)⁻¹. Poles at z_k = exp(η E_k) where E_k runs
   over {E_g(i) + r² λ1(m)} ∪ {E_h(j) + r² λ2(m)}.
   Residue of the scalar resolvent factor 1/(1 − z λ) at z = 1/λ is −1/λ,
   so the residue operator is −e^{η E_k} P_k.
   Report the two lowest levels (values, multiplicities, origin) with
   independent recomputation, not copied figures.

C. Transfers: 1-step T0, 2-step T0², n-step T0^n with eigenvalues e^{−n η E_k}.
   No identification of the discrete step index n with a physical time interval
   is made or used.

D. Gauge covariance and Ward contacts: dim ker Hg, dim ker Hbits, and the
   statement that history_source_solve is independent of adding Hbits-kernel
   vectors to y (the original quotient). Clock Wilson charge is 1 on geometry
   and 2 on history, matching the quadratic source charge. No new current is
   invented.

E. Charged matter: H13 = centre ⊕ 12 icosahedral vertices, character
   (13,1,1,3,3) = 2·1 ⊕ 3 ⊕ 3' ⊕ 5. Abstract complement
   H51 = 2·1 ⊕ 3·3 ⊕ 3·3' ⊕ 4·4 ⊕ 3·5 inside H64 = 4(1⊕3⊕3'⊕4⊕5).
   Recompute Hom_A5(4, H13) = 0, Sym²(H13) quartet multiplicity = 4, hence
   an 8-real-dimensional Weyl pairing to 4_3 ⊕ 4_5 at vertex charge +1.
   Full uniform-charge H13⊕H51 count 276 (from the archive character count,
   recomputed). Mean-field fermion poles vanish at centred hidden ensemble
   (prior cycle 07; restated, not re-fitted). No unique EM current on the
   90 edges is derived here; that remains the documented obstruction.

F. ARF comparison only: numerical values of the four frozen-constant ARF
   targets versus the independently computed T0 levels, hidden Hessian
   ratio, and cycle-02 (a, b). Look-elsewhere: count how many of a fixed
   list of Cathedral integers {1,2,3,4,5,7,8,9,12,13,15,16,18,20,24,35,40,51,63,64,79,80,81,90,1053}
   appear in a writing of each ARF target, and note the previously recorded
   near-hits (cycle 05 of the first programme). Do not claim derivation.

Classification per subquestion: PROVED / CONDITIONAL / FALSIFIED / OPEN.
