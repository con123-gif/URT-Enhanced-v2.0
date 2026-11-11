# Induced photon action of the native v61 Wilson sea: θ = 0 is a saddle

Status: CLOSED INTERNALLY for the archived operator (floating-point certificates, executed) /
PHYSICAL IDENTIFICATION PENDING. No gate is closed.

## Prior-work ledger
- `2026-10-24_alpha_physical_gate/`: Maxwell family S_λ leaves 1/λ unfixed (a Maxwell term added by hand).
- `2026-10-26_137_360_dual_spectral_bridge.md`: Hilbert–Schmidt match of the Peierls Hessian, 42.9% residual, at θ = 0.
- `microscopic_source_currents.py` (CI check `native.wilson_source`): sea-energy link Hessian at flat links;
  its checks JSON records `negative_hessian_modes_at_1e-9 = 72`, `positive = 409`. No status file draws a conclusion from this.
- No archived file computes −log|det H| or minimises any functional over the link phases (searched: logdet, slogdet, induced, flux phase).

## Statements (operator: archived v61 H(θ) = γ5(D_W(e^{iθ}) − M), 48 sites, 528 U(1) links, r, M, 1/16 as archived)
1. Γ(θ) = −log|det H(θ)| is invariant under H → cH. Among spectral actions −Tr f(|H|) only f = log has
   this property, so Γ has no coupling-scale freedom. This escapes the S_λ obstruction's hypothesis.
   (An integer species multiplicity remains; see Open.)
2. Its Hessian Π_E at θ = 0 obeys the Ward identity (‖Π_E·incidence‖ = 9×10⁻¹⁴), has null space exactly the
   47 gauge modes, and is **indefinite on the 481 physical modes: 72 negative, 409 positive**, minimum −2.958.
   The archive's sea-energy Hessian has the same 72/409 split. Flat links are a saddle of both functionals.
3. A stored configuration θ* is a stationary point (physical gradient 1.7×10⁻¹⁵) with **positive-definite**
   physical Hessian (min 2.6×10⁻⁵, max 1.123). Γ(θ*) − Γ(0) = −99.104690. The gap of H opens from 0.8256 to
   1.8840 and H(θ*) has five |eigenvalue| levels: 1.883993 (8), 2.150954 (48), 2.157697 (24), 2.257833 (8), 2.578021 (8).
4. Gauge-invariant content of θ*: every triangle and four-cycle flux lies in
   {0, π, π/2 ± ε, π − 2ε, 2ε, 4ε} with one number ε = 0.0050756442 π. Triangles: 384 at 0, 1536 at π/2 − ε, 384 at π.
5. The archive's sea energy is lowered by 76.71 at θ*, and by 76.72 at nearby minima of its own; its minimiser
   started from θ* stays a π/2-type flux phase (triangle flux 0.497 π). The exact vacuum differs between the two
   functionals; leaving θ = 0 does not.

## Not established
- Global minimality of θ*: 16 random starts found nothing lower (two other minima within 5×10⁻³). Compute job
  `induced-photon-vacuum-census` extends this. A proof would need a Lieb-type flux argument for this lattice.
- Dependence on r, M and the temporal weight 1/16. These are v61 regulator inputs "selected conditionally",
  not derived. They are the remaining continuous inputs of this route.
- Whether −log|det H_W| or the overlap determinant is the physical action: v61 uses H as an overlap kernel.
- The full registry: Γ_Q(θ) = −Σ_s log|det H(q_s θ)| over the Q96 charges. Its vacuum is not computed.
- Any coupling. The Hessian at θ* is the object a photon normalisation must be read from; nothing has been read from it.

## Consequence
Every archived native photon computation expands around flat links. That point is unstable under the operator's
own induced action, so those kernels are not vacuum response functions.

Certificates: `INDUCED_PHOTON_LOGDET_KERNEL_2026_11_10.py` (1 s), `INDUCED_PHOTON_VACUUM_SELECTION_2026_11_10.py [n_census]`.
Executed in Claude's sandbox (numpy 2.5, scipy 1.18); CI re-executes both.
