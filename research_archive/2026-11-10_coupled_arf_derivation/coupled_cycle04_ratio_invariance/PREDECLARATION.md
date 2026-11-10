# Coupled cycle 04 predeclaration

Test whether invariant eigenvalue ratios of the coupled quartic response
are independent of source direction.

Three families of sources, all built from the original operators:

1. All 64 signed histories. History s ∈ {0..63} selects, for each of the six
   antipodal icosahedral vertex pairs, one vertex (bit of s). The signed
   12-vector σ_s is +1 on the chosen six vertices and −1 on their antipodes.
   The 0-1 occupancy χ_s of the chosen six is recorded as a second convention.
   Portal coordinates α_s = Iicoᵀ σ_s (respectively Iicoᵀ χ_s).

2. Coherent superpositions: (σ_s + σ_{s'})/‖·‖ for every pair of histories
   that differ by a single bit (the 6-regular hypercube edges, 192 directed
   / 96 undirected edges) and the six single-bit-axis Fourier combinations
   Σ_s (−1)^{⟨ω,s⟩} σ_s for the six weight-1 characters ω.

3. All 24 charge-2 clock modes m = 0..23, via
   λ_m = 2 − 2 cos(2θ − 2π m/24),
   c3(m) = 1/4 − 1/(2(18 + r² λ_m)),
   c5(m) = 1/4 − 1/(2(16 + r² λ_m)).

Two matrices per source:

- H_hid (cycle 03): eigenvalues 2 c3 (×4) and 2 Δ² c5 (×4). Its ratio
  ρ_hid = c3 / (Δ² c5) can depend on clock mode but not on portal direction.
- H_port(α): the 8×8 Hessian of V(α) = c3 ‖q3(Iico α)‖² + Δ² c5 ‖q5(Iico α)‖²
  at the background α of that source, golden-mode (c3, c5) unless the clock
  family is being scanned. Analytic formula (no finite difference):
  ∂²V/∂α_k∂α_l = 2 c3 (⟨dh3_k, dh3_l⟩ + ⟨h3, d²h3_kl⟩)
                 + 2 Δ² c5 (⟨dh5_k, dh5_l⟩ + ⟨h5, d²h5_kl⟩)
  with dh3_k = 2 P3[(C x) ⊙ (C Iico_k)], d²h3_kl = 2 P3[(C Iico_k) ⊙ (C Iico_l)]
  and x = Iico α (and the same with P5).

Invariant ratios under test: sorted |λ_i / λ_max| of H_port, and ρ_hid.
A quantity is “independent of source direction” only if its values agree
across the whole family to 1e-10 relative.

If any family fails, report an explicit counterexample (two labels and
their ratio tuples). Classification: PROVED if every tested ratio is
constant; FALSIFIED if a counterexample exists. No ARF target is used.
