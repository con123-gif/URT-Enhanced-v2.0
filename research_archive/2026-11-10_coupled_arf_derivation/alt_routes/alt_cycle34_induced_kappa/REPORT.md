# alt_cycle34 — induced Maxwell coefficient from vacuum polarisation

Classification: PROVED on H1–H3. Induced κ is finite but not a unique positive Maxwell coefficient; the vacuum is π-flux.
Advances a physical ARF? No.

## Induced action
There is no tree-level Maxwell term (κ_ext = 0). The effective action for the 30 icosahedral edge phases is the BdG matter free energy of alt_cycles 25–33. Vacuum polarisation is its Hessian Π at A = 0, restricted to the 19-dimensional cycle space. A Maxwell term would be (κ/2) ||dA||² = (κ/2) A^T Δ1 A on that space. Induced κ is unique only if Π_T is positively proportional to Δ1_T (generalised-eigenvalue spread < 0.05 and Frobenius residual < 0.10). The quadratic form diagnoses local stability; the vacuum is the minimiser of the full Ω_matter.

H13 at both kinetics means the graph Laplacian K[A] and the Hodge map Λ = K + I (the unique A5 ray that sends {0, 5−√5, 6, 5+√5} to {1, 6−√5, 7, 6+√5}), each with the Peierls substitution. A 13-site geometric Hodge Laplacian (centre plus 12 vertices, spokes unphased) is a diagnostic, not a second species. The spinor lift is the fermionic double cover of the same 12 vertices and is not added. Other solids do not contribute: alt_cycle27 found no unique hopping onto these vertices. H64 and the 24-clock are not established charged fermions coupled to this A (the commits d71974d..6bad7b3 treat uniform-charge H64 Weyl pairing as conditional and infer no new Maxwell term); no current is invented.

## Result

### Primary sector (12-component H13, graph K, even pairing at r_*)
At T = 0 the transverse Hessian is a negative multiple of the identity:
Π_T = −0.083332 I_19 = −(1/12) I_19
to relative 5.8×10^{-5} (Frobenius residual to a multiple of I: 3.7×10^{-5}). All 19 eigenvalues are negative. This is the unpaired-mode prediction Ω ≈ −½ ⟨v0|K[A]|v0⟩ ≈ −(1/24) ||A||², hence Π = −I/12. It is not Maxwell-like: the residual of the best fit to Δ1_T is 0.459. Δ1_T itself has eigenvalues (3−√5)×3, 2×5, 3×4, 5×4, (3+√5)×3 (sum 60, sum of squares 240, λ_min = 3−√5 ≈ 0.764). The generalised eigenvalues of Π_T v = κ Δ1_T v are therefore κ_i = (−1/12) / λ_i(Δ1_T) ∈ [−0.10908, −0.01592], with relative spread 2.33. They are finite and all negative, but not unique. The isotropic fit is κ_iso = (−1/12) × 60/240 = −1/48 ≈ −0.020833; the cycle-23 ratio is κ_REM = (−1/12)/(3−√5) ≈ −0.10909.

At T = η the unpaired energy starts at O(A²), so that mode contributes only at O(A^4) and drops out of Π. The remainder, from the gapped pairing levels, is tiny (eigenvalues in [−6.3×10^{-6}, +3.4×10^{-6}]) with mixed signs (13 negative, 6 positive). It is neither a multiple of I nor Maxwell-like. A = 0 is still a saddle.

The full Ω_matter (not the quadratic) is lower at the all-π connection than at A = 0 by 5.000 at T = 0 and 1.880 at T = η, reproducing alt_cycle31. With no external Maxwell term the primary vacuum is π-flux.

### Alternative kinetics, not added
Hodge Λ = K + I lifts the unpaired energy at A = 0 from 0 to 1 (and at A = π from 10 to 11) but does not change the T = 0 Hessian: again Π_T = −I/12. At T = η the unpaired mode now starts at E = 1 and does contribute quadratically, Π_T = −[tanh(1/(2η))/12] I ≈ −0.006934 I (all 19 negative, identity residual 3.7×10^{-4}, still not Maxwell-like). Ω(π) − Ω(0) = −2.211.

The 13-site geometric Hodge keeps an unpaired zero (the 13-constant). Its T = 0 Hessian is again −I/12; at A = π the unpaired energy is 8 rather than 10; Ω(π) − Ω(0) = −5.000 at T = 0 and −2.068 at T = η.

The spinor lift, despite a gapped K_spin (λ_min = 0.747), still has a negative identity-like Hessian at T = 0: Π_T = −0.141771 I_19 (residual to I: 4.7×10^{-5}; not Maxwell-like). The lowest doublet rises from 0.747 to 9.253 at A = π, and Ω(π) − Ω(0) = −8.506 = −ΔE_min, as expected for a twofold mode. At T = η every transverse eigenvalue remains negative and Ω(π) − Ω(0) = −3.240.

Every computed sector selects the π-flux phase. None produces a unique positive Maxwell coefficient.

## Verification
`/workspace/arf_research/alt_cycle34_induced_kappa/test_induced_kappa.py` and `results.json`. The T = 0 Hessian is stable under changing the finite-difference step from 0.02 to 0.05 (relative difference ~10^{-4}).
Predeclaration sha256: `fbbb0892457b055b3f5fa849d653507ee8f27091f3c371f189896d1bca606c11`.

## Next obstruction
Integrating out the charged matter the Cathedral actually couples to this A does not generate a usable Maxwell term. The induced quadratic is a wrong-sign, isotropic mass −(1/12) I from the unpaired mode (or a similar negative multiple in the spinor completion). A positive κ would have to come from a derived Higgs kinetic |D_A Δ|², which is still not in the archive, or from charged matter that has no derived coupling to these 30 edges.
