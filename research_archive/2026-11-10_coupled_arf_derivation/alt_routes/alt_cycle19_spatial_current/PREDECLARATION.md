# Predeclaration — alt_cycle19: vertex-to-spatial-edge charged current

Date: 2026-11-10 (Europe/London)
Route: (19) Build a vertex-to-spatial-edge charged current from the five-solid incidence (cochains) and check Ward identities. If a unique finite electromagnetic response ratio exists, compute it and compare it with R_α only after this predeclaration, with a look-elsewhere census.

## Predeclared construction
C1. Five Platonic solids rebuilt as in alt_cycle02 / alt_cycle12: 50 vertices, 90 spatial edges, incidence b1 (V × E) with (d0 ψ)_e = ψ_j − ψ_i on the oriented edge e = (i, j). The A5-native subcase is the icosahedron (12 vertices, 30 edges).
C2. Minimal coupling of the Hodge kinetic: (d_A ψ)_e = ψ_j − exp(i q A_e) ψ_i, with vertex charge q = 1 (the pairing value used in previous cycles). Action S[A, ψ] = ||d_A ψ||². The Noether current is j_e = ∂S/∂A_e at A = 0.
C3. First Ward identity: exact invariance of S under the simultaneous replacement ψ_v → exp(i q λ_v) ψ_v and A_e → A_e + λ_j − λ_i. Differentiating at A = 0 gives the local continuity equation relating div j to the matter variation.
C4. The five-solid bridge Cbridge is a separate, generally non-local vertex bilinear (on the icosahedron it is 4 P_1 + 4 P_3). Local Ward identities for a current supported only on the 90 (resp. 30) spatial edges are tested both for pure Hodge and for Hodge + Cbridge.

## Predeclared electromagnetic response (computed only if finite and unique)
The candidate dimensionless ratio, if it exists, is
    R_EM = λ_min(Π_T) / λ_min(Δ1_T)
on the transverse edge space of the icosahedron (the orthogonal complement of im d0, dimension 19). Here Δ1 is the Hodge edge Laplacian d0 d0† + d1† d1, and Π is the Hessian at A = 0 of the one-loop effective action log det(Δ_A) for a charge-1 complex scalar with kinetic ||d_A φ||² (equivalently the seagull-minus-bubble current correlator), using the Hodge kinetic only. No Yukawa mass is inserted, because no unique Yukawa ray has been derived.

Diagnostic (not an observable, and not to be compared with R_α): the same construction with Δ_A replaced by Δ_A + ε I for several positive ε, to test infrared regularity. If Π diverges as ε → 0 or if the ratio depends on ε, then no finite parameter-free R_EM exists and no comparison with R_α will be performed.

If a finite unique R_EM is obtained, it will be written to results.json first. Only afterwards will it be compared with
    R_α = 3/(64 φ) + 1/(79 φ²)
and with the other three historical ARFs, using the predeclared G_strict T1 grammar of alt_cycle08 (unordered two-atom sums from the strict Cathedral integer alphabet, without admitting 79 by hand). A numerical near-hit is not a derivation.

## Hypotheses
H1. The current C2 exists, is unique given the Hodge kinetic ray and q = 1, and satisfies the first Ward identity C3 on each solid and on the disjoint five-solid complex.
H2. Hodge + Cbridge does not admit a current supported only on the spatial edges that satisfies the same local Ward identity, because Cbridge has matrix elements off the spatial edges.
H3. The massless one-loop Π at A = 0 is infrared-singular (the ungauged Hodge Laplacian has a charged constant mode). Consequently no finite parameter-free R_EM exists from C1–C2 alone.

## Integrity
No ARF target is inserted into the current or into Π. Comparison with R_α occurs only if H3 is false and only after R_EM is recorded. Classification PROVED / CONDITIONAL / FALSIFIED / OPEN.
