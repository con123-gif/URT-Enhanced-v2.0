# Coupled cycle 23 predeclaration — gauge-invariant current response

Question D of this block, in the condensed phase. Alt29 computed the
fermion-induced London kernel Π = ∂²Ω_BdG/∂A∂A at frozen real Δ, with
A entering only the magnetic hopping Laplacian, restricted to the
19-dimensional graph-cycle space. That kernel was not positive
definite, so a Meissner mass was not established. This cycle builds
the gauge-invariant charged-current response including the
Nambu–Gor’kov structure and the Goldstone (phase) mode, checks the
longitudinal Ward identity, reports the transverse (superfluid /
Meissner) kernel, and reconciles the two calculations.

## Action and fields (no new couplings)
The archived mean-field action is the Nambu / BdG pairing action of
cycle 18, on the 12-vertex icosahedral graph (the arena of alt29):

    K_ij[A] = magnetic Laplacian, A_e → A_e + λ_j − λ_i on edge (i,j),
    Δ_ij[θ] = |Δ_ij| exp(i (θ_i + θ_j)),

with |Δ| the real even condensate (nuclear-norm maximiser of the
cycle-11 even frame) at a named pairing scale. The 12 real numbers
θ_i are not a new Higgs field: they parametrise the gauge orbit of
the real vacuum (local pairing phases). A global constant θ is the
U(1) Goldstone already identified by alt29; a local λ is compensated
by θ_i → θ_i − λ_i together with A → A + dλ.

The one-loop effective action Ω(A, θ) is the cycle-18 Nambu potential
evaluated on (K[A], Δ[θ]). Because the fermions are quadratic after
pairing, this determinant already contains the full Nambu–Gor’kov
one-loop series (normal and anomalous vertices). There is still no
tree-level |D_A Δ|² in the archive.

Primary kinetic: 12-vertex icosahedral Laplacian, to compare with
alt29. Controls: T = η and T = 0; pairing scales r = 20 (alt29’s
numerically safe point) and r = 100. The physical r_* ~ 8.56×10^5
is recorded only as a large-r diagnostic if numerically stable.

## Will compute, in this order

1. Control: reproduce alt29’s truncation (frozen real Δ, A only in K,
   Hessian on the 19-cycle space) at r = 20, T = η. Signs and the
   existence of negative eigenvalues must agree; quantitative
   eigenvalues are allowed to differ at the level of finite-difference
   step.

2. Gauge invariance of the joint action: for random vertex functions
   λ, Ω(A + dλ, θ − λ) = Ω(A, θ). In particular
   Ω(dλ, −λ) = Ω(0, 0). Residual recorded.

3. Longitudinal Ward identity at the vacuum: the directional second
   derivative of Ω along every gauge orbit (A, θ) = (dλ, −λ) vanishes.
   First derivatives along those orbits vanish as well.

4. Transverse / superfluid kernel: Hessian of Ω with respect to cycle
   (coclosed) A at θ = 0 (unitary gauge). This is the physical
   Meissner kernel of the one-loop action. Report the 19 eigenvalues
   (min, max, numbers of positive and negative) at each (r, T).

5. Reconciliation, predeclared:
   - If (2) and (3) hold and the transverse kernel of (4) agrees in
     sign structure with (1), then alt29 was not missing Nambu–Gor’kov
     vertices (those are already inside the BdG determinant) and was
     not missing the Goldstone in the *transverse* sector (the
     Goldstone is a gauge orbit, eaten in unitary gauge). What alt29
     was missing is the Goldstone compensation along *exact* A = dλ,
     which is why scans of unit exact A at frozen real Δ lowered Ω
     (a gauge artefact). The non-positive transverse kernel is then
     the genuine one-loop result of the archived action (no tree
     |DΔ|²; unpaired charged fermion still present at A = 0).
   - If instead the gauge-invariant transverse kernel is positive
     definite while (1) is not, then alt29’s truncation was missing a
     term that this cycle has now included; that term will be named.
   - Superfluid weight / Meissner mass is PROVED only if the
     transverse kernel is positive definite. Otherwise H3 of alt29
     remains FALSIFIED for the archived one-loop action.

No comparison with R_α is performed. No ARF is used.
