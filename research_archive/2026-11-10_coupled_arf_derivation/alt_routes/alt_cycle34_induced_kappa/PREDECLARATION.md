# Predeclaration — alt_cycle34: derive the Maxwell coefficient κ from vacuum polarisation

Date: 2026-11-10 (Europe/London)
Route: (34) Compute the induced gauge kinetic term (vacuum polarisation) by integrating out all charged matter the Cathedral actually contains (H13 at both kinetics, the spinor lift, the other solids' edges if charged, history/clock sector if charged), at T = η and T = 0, with no external Maxwell term. Is induced κ finite, unique, and does it put the vacuum in the π-flux or A = 0 / gradient phase?

## Induced action
S1. There is no tree-level Maxwell term in this route (κ_ext = 0). The effective action for the 30 icosahedral edge phases is the matter free energy Ω_matter[A] already used in alt_cycles 25–33. The vacuum polarisation is its Hessian at A = 0,
    Π_{ee'} = ∂²Ω_matter / ∂A_e ∂A_{e'} |_{A=0},
    evaluated on the 19-dimensional cycle space (the same transverse projector as alt_cycles 23 and 29). Face fluxes are the observables; gradient directions A = dλ are reported separately and are not part of the Maxwell identification.

S2. A Maxwell term has the form (κ/2) ||dA||² = (κ/2) A^T Δ1 A on the cycle space, with Δ1 = d†d + dd† the Hodge 1-Laplacian of alt_cycle23. Induced κ is well-defined and unique only if Π_T is positively proportional to Δ1_T. Diagnostics, all recorded before any comparison with R_α:
    - generalised eigenvalues κ_i of Π_T v = κ Δ1_T v
    - κ is unique when (max κ_i − min κ_i) / max(|mean κ_i|, 10^{-12}) < 0.05
    - κ_iso = ⟨Π_T, Δ1_T⟩_F / ||Δ1_T||_F² (best isotropic Maxwell coefficient)
    - Maxwell-like when ||Π_T − κ_iso Δ1_T||_F / ||Π_T||_F < 0.10
    - κ_REM = λ_min(Π_T) / λ_min(Δ1_T) (the alt_cycle23 identification)
    - finite when every |κ_i| < 10^{10} and Π_T has no NaN
    - a multiple of the identity (wrong-sign mass, not Maxwell) when ||Π_T − (tr Π_T / n) I||_F / ||Π_T||_F < 0.10

S3. The quadratic form Π characterises only the small-A expansion. The vacuum itself is the minimiser of the full Ω_matter, already computed at κ_ext = 0 in alt_cycle31. That comparison (Ω at A = 0 versus the all-π connection, and the sign of λ_min(Π_T)) is repeated for every sector below. A negative eigendirection of Π_T means A = 0 is transversely unstable; combined with alt_cycle31 this selects the π-flux phase. A positive-definite Maxwell-like Π_T would make A = 0 a local minimum; the global comparison with π-flux is still required.

## Charged-matter sectors
S4. Primary sector (the condensed A4 phase of alt_cycles 25–32): the 12 icosahedral components of H13, graph-Laplacian kinetic K[A], even pairing Δ at r_* = 8.61261×10^5, y_even = 1. This is the matter content whose London kernel was negative in alt_cycle29.

S5. “H13 at both kinetics” means the two archived A5-invariant spatial kinetics acting on these fermions, each with the Peierls substitution on the 30 surface edges:
    - graph K[A] (S4)
    - Hodge Λ, which at A = 0 is the spectral map sending K-eigenvalues {0, 5−√5, 6, 5+√5} to {1, 6−√5, 7, 6+√5} and which equals K + I as an operator. Its natural gauging is therefore K[A] + I.
    A diagnostic 13-site geometric Hodge Laplacian (centre plus 12 vertices, 12 spokes unphased, surface edges Peierls-substituted; pairing padded by a decoupled centre) is recorded but is not added to S4: it is an alternative description of the same H13, not a second species. The two kinetics are not summed.

S6. Spinor lift: the 24-component vertex12 ⊗ 2 theory of alt_cycle33, with K_spin[A] = deg ⊗ I_2 − Σ_e e^{i A_e} U_{i→j} and Δ_spin = Δ ⊗ ε at that cycle’s r_*. This is the fermionic double cover of the same 12 vertices, not an extra species, and is not added to S4.

S7. Other solids’ edges: alt_cycle27 found no unique derived hopping from the other four solids onto these 12 vertices. Those 60 extra edges of the five-solid complex are not charged under this A and do not contribute to Π on the 30 icosahedral edges. No coupling is invented.

S8. History / 24-clock: the 64-history carrier and the 24-clock are not established charged fermions coupled to the 30-edge geometric U(1). The commits d71974d..6bad7b3 treat a uniform-charge H64 Weyl-pair hypothesis as conditional and state that it is not the physical 16/48/96 charge assignment; they infer no new transverse Maxwell term. No H64-to-A current is invented, and no clock product-sum of the alt_cycle23 kind is added (that identification was already labelled extra).

S9. Sectors are reported separately. Alternative descriptions of the same fermions are not added. The derived vacuum of this route is the full-Ω minimiser of the primary sector S4; the spinor and Hodge sectors are recorded as alternative kinetics / completions.

## Hypotheses
H1. In the primary sector at T = 0, Π_T is finite and dominated by the unpaired constant mode, close to −(1/12) I_19 rather than to a positive multiple of Δ1_T. Induced κ is then either negative, non-unique (generalised eigenvalues spread by those of Δ1_T), or not Maxwell-like.
H2. At T = η the unpaired mode contributes only at O(A^4) (its energy starts at O(A²)), so Π_T comes from the gapped pairing modes. Whether that remainder is a positive Maxwell term is computed, not assumed.
H3. Because there is no external Maxwell term, a negative transverse eigendirection selects the π-flux vacuum of alt_cycle31. Hodge Λ = K + I shifts the unpaired energy at A = 0 from 0 to 1 but does not change the T = 0 Hessian of that mode. The spinor lift, which gaps K_spin, is the sector most likely to produce a different sign; it is not added to the primary Π.

## Integrity
No ARF target is inserted into Π or Ω. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
