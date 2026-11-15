# Q154 and Q155 — Actual native finite-volume electromagnetic vacuum verdict (15 Nov 2026)

## Direct completed physical calculations
Q153 original native 481D Hessian at Q152 stationary 528-field: all 481 strictly positive (min 1.0776023355), no negative; finite numerical stability of the **chosen** Q109 charged Gaussian model.

Q154 **COMPLETED native GitHub Actions, run 43720862967, return code 0**: actual original Q109 analytic current/seagull Hessian at pinned Q152 field probed with ten exact link-integrated 4D Fourier electromagnetic sources. Longitudinal Ward errors are <1e-15, vacuum gradient 5.122e-6 and native Ward residual 1.738e-12. All ten tested transverse response matrices are positive, but the physical response is strongly mixed across momenta. Fourier-mode leakage fractions range **0.7515262 to 0.8361437**. Therefore treating their diagonal matrix elements as an ordinary translation-invariant photon dispersion would be invalid at this finite vacuum. See Q154_NATIVE_RESULT_RETRIEVED.json, recovered directly from the saved native compute-state job log. Q154 native script had hard-coded /tmp output so the JSON was not originally persisted in the compute outputs; it is now archived here from the completed original log, and the script/registry output paths have been corrected.

At k=(0,0,0,0), all FOUR flat Wilson modes have exactly zero bare-local-Maxwell curvature yet original matter-induced microscopic stiffness eigenvalues **25.85785799, 171.42294162, 177.06003184, 203.27927834**. Their unit normalization is internal to the chosen action, not alpha. This confirms the finite charged determinant depends on noncontractible Wilson holonomy, not only elementary local plaquette flux.

At k=(2pi/6,0,0,0), normalized transverse microscopic response eigenvalues **115.69293,319.01079,394.00584**, versus bare geometric curl eigenvalues **2.84768,8.36533,8.36533**; response and local Maxwell geometry have different structures, not a demonstrated continuum Maxwell law. No coefficient is fitted to the discrepancy.

## Q155 independently executed local gauge-invariant test
I independently extracted the actual Q152 native 528-angle .npy artifact, verified the exact Git blob SHA1 **ad746e6f14a5332e8d3b84fb8a2cd46eff65e258**, and reconstructed the original 6×2×2×2 Wilson loops by site and 67 native face types (55 commuting squares +12 triangles per site). For each face calculate q_min=1/3 holonomy U_f=exp(i curl_f(A)/3); compare to that SAME oriented face translated one lattice step in each coordinate. Unlike comparing A directly, this is fully gauge invariant under the original 6pi fractional-charge gauge group.

Q155 local ORIGINAL-BINARY exact-geometry Python test exit 0:
- Flux RMS |U_f-1| = **0.5533427872139777**.
- Time translation RMS |U_f(x+e_t)-U_f(x)| = **0.7693684652056179**.
- X = **0.7820644190456477**; Y = **0.7991028430361657**; Z = **0.7630839607184754**.
- All four elementary translations alter *all* 3216 local Wilson holonomies to threshold 1e-6; no pure U(1) gauge choice restores these primitive symmetries.

Thus Q152 is a **physically translation-noninvariant flux vacuum of the specified finite model**, not just a gauge-fixed homogeneous Maxwell vacuum. This directly explains why Q154 momentum probes mix strongly. The Q155 source-native re-execution against the original Q149 code has been registered for independent CI. Only the **local original-binary geometry** executed in the assistant sandbox at this report time; label native CI pending until run returns.

## What this proves and does not
It is meaningful progress on **physics**, not a claim to have solved the model's whole electromagnetic/continuum problem. The selected stable background has nontrivial local flux and genuine translation symmetry breaking, while its charged microscopic 4D source responds in a strongly momentum-mixing way. It could be a flux-crystal-type phase in this finite chosen action. It is not evidence that nature's vacuum is such a crystal or that a photon is massive. Combined translations/internal transformations and the larger-volume/continuum phase diagram are NOT tested.

**Next physics gate:** Find whether the same primitive-selected full-Cathedral action admits a Lorentz/translation-restoring large-volume phase or controlled coarse-graining with 2-polarization massless photon pole and unit-charge source normalization; derive its action/time/relative kinetic coefficient from primitive pi,phi,e and original all-five 190/H64/24 architecture, without fitting historic ARFs or importing old Q77.
