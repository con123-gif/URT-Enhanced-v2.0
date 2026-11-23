# Original five-solid projective URT + Hopf magnetic dynamics, joined to the full Cathedral

**Date:** 23 November 2026. **Status:** constructive source-native conditional extension, pending CI at first commit. User-directed whole-Cathedral integration effort. The original 7 November 190/64/24 Hamiltonian and later all-five circulation/hidden-feedback term are retained. No particle masses, coupling constants or empirical data are used as inputs.

## Physical motivation

The existing five-solid Hamiltonian gives free vertex Hodge energy `(1/2)||b1^T ψ||²`. Q161cu independently constructs a native Hopf/Pauli positive spinor on the original vertices, with Chern number 1 on EACH Platonic sphere. The original URT multiplier `q=(π/e) exp(2πi/φ²)` acts on the second spinor coordinate as a **projective** complex scaling. Q161cu showed this redistributes Berry curvature without changing its integral. This extension replaces, rather than doubles, the free vertex gradient by the corresponding original-geometry magnetic covariant derivative. The local modeling choice is that vertex cochain amplitude has the Hopf-line connection charge 1; this is not a theorem of fundamental URT.

## One explicitly specified integrated Hamiltonian

For each of the original 5 surfaces, original oriented edge e=(i,j) and Pauli eigenstates `s_i`, define `s'_i=normalize((s_i,0,q s_i,1))`, `U_e=<s'_i,s'_j>/|<s'_i,s'_j>|` and native magnetic boundary `(B_q ψ)_e=ψ_j-U_e ψ_i`. Keep the original face cochain and edge cochain, and the previous circulation vertex-density quartic unchanged. The same 24 clock entries and 64 history amplitudes still evolve dynamically.

The new Hamiltonian is *exactly*
`H_new(z,y) = H_original_190_64_24(z,y) + H_native_curl(z) + 1/2Σ||B_q ψ||² - 1/2Σ||b1^T ψ||²`.
The subtraction is essential to avoid double-counting the existing bare vertex gradient. The Hopf contribution uses no invented graph: vertices, edges, face incidence and spinor geometry come from the original archived five-solid data.

All five faces have total oriented Berry flux +2π (Chern 1), both before and after projective URT q. The transformation redistributes curvature per face. The phase-difference vertex kinetic also supplies an explicitly gauge-invariant native edge current `J_e=Im(conj(ψ_j) U_e ψ_i)`, with face circulation `J b2`.

With the *unchanged* original normalized Q101/KMS hidden source, the added vertex kinetic changes the evolving all-five vertex amplitudes, then the existing P3/P5 nonlinear face source, and hence H64/24 dynamics. The circulating edge-cochain quartic simultaneously retains feedback onto the same vertex source. Neither sector is a fake scalar surrogate.

## Exact tests

`python research_archive/2026-11-23_hopf_urt_native_join/HOPF_NATIVE_JOIN_CERT.py` imports original native 7 November geometry and whole Hamiltonian; computes **all five** Pauli spinors and q-twisted link phases without substituting independent graphs; checks all five Chern fluxes, 15 directional gradients, exact per-solid ablations, Hopf local-frame gauge transformations of link and matter amplitude, 24-clock charge-one covariance, original-energy subtraction, and zero dE/dt, zero dQ/dt. The actual source and H64 perturbation are tested by evolving identical seeded data under the existing whole-five-circulation engine and the q/Hopf extended one.

## Essential limits

This is a conditional **one-step projective q magnetic connection**, not an autonomous iterative URT chaos-to-Platonic birth process. The Hopf line is a fixed geometrically selected background, not a fully dynamical 3+1 photon or native Q96/v61 charged gauge field. The previous Q161cu exact S3 Hopf-Navier–Stokes solution is not itself identified with a fluid velocity cochain here; instead the newly integrated gauge-invariant edge current has face circulation. No full relativistic gravity/spin-2 or ZPE pump appears in this action, and the *full* local gauge invariance of the original cross-solid/clock action is not implied by the local-frame invariance of this magnetic term. The parent Hamiltonian time generator and unit quartic coefficient are modeling choices.

This is a concrete step beyond the earlier circulation-only join; the remaining physically decisive task is to couple the original Q96/v61 charged lattice and native quantum energy/metric response to this SAME q/Hopf/H64/24 dynamical action, or derive a unique replacement from the primitive structure. Do not claim a completed theory of nature.
