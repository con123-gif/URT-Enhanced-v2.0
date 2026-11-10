# Newton's Cathedral — source-preserving physical stability test

**Date:** 9 November 2026. **Status:** proved algebraic obstruction for the *existing spatial Hamiltonian* and independent numerical check of its exact 64-history operator. **No GitHub writes or third-party research imports.**

## Primary existing sources inspected, not replaced

- [Full native nonlinear Hamiltonian](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/cathedral_core/full_dynamics.py)
- [Native full 3D spatial extension](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/cathedral_core/spatial_dynamics.py)
- [Native 64-history propagation](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/cathedral_core/history_propagation.py)
- [8 November integrated spatial theorem and explicit caveat on semibounded energy](https://github.com/con123-gif/URT-Enhanced-v2.0/blob/newtons-cathedral/docs/NATIVE_URT_UNIFIED_SPATIAL_INTERACTION_2026_11_08.md)
- [7/8 November whole 190×64×24 interacting model](https://github.com/con123-gif/URT-Enhanced-v2.0/tree/newtons-cathedral/research_archive/2026-11-07_joint_interacting_native)

**Critical scope:** The real full source was examined through the connected GitHub read API. This environment could not network-clone the repository. The attached Python runs an **independent reconstruction of the exact native 64×24 invariant sector**, not the original 190×64×24 source program. No claims about rerunning its complete test suite are made.

## Theorem 1 — the specified complete nonlinear spatial action is unbounded below even at fixed conserved charge

Let `z(x) ∈ C^(24×190)` and `y(x) ∈ C^(24×64)` be the full native Cathedral fields on a periodic three-torus. Keep **all original** nonlinear face-incidence sources, the 8-state KMS term, 24 charged clock, and the native spatial first-order momentum as written in the original source. Define conserved charge `Q= ∫ (||z||²+2||y||²) dx`.

In the full nonlinear action, select the permitted field submanifold **z(x)=0**. Since the face source is quadratic in z, all face-source components `h3(z),h5(z)` vanish, their quartic contacts vanish, and the KMS entropy term is zero. Furthermore the original geometry gradient also vanishes, so `z=0` is invariant under the native Hamiltonian flow. This is an exact restriction of the original full action, **not a substituted model**.

With a constant golden clock-link phase `θ=2π/φ²`, the remaining history energy is exactly

\[
\mathcal H_y=\frac12\int\!\sum_j \bigl[y_j^*H_{64}y_j+r^2\|y_{j+1}-e^{2iθ}y_j\|^2+\sum_s\overline y_{js}(-iv_s\cdot\nabla)y_{js}\bigr]dx,
\quad r=π/e.
\]

The six icosahedral axes define `v_s = r ∑_{i=1}^6 σ_i(s)u_i`; the **actual native** pair-flip `H64=15I−∑_{i<j} X_i X_j` has diagonal 15. Take a history label `s0` with `v_(s0),x = 3.181444458492577...`, clock Fourier index `m=18`, and a spatial plane wave `exp(−inx)` on a `2π`-periodic x-axis. Occupy only `y_(j,s0)` and normalize its amplitude so the **full field charge is Q=1**. Every such `n` is a valid smooth periodic field.

Its exact whole-action energy is

\[
\boxed{\mathcal H_n=\frac{15+q_{18}-n v_{s0,x}}4,\quad Q=1,\qquad
q_{18}=r^2[2-2\cos(2θ-2π\,18/24)] =0.01022872513785791\ldots.}
\]

Therefore `H_n → -∞` as `n→+∞` **while Q stays exactly 1**. Since all original nonlinear geometry-to-history sources vanish on this allowed field, their positivity/Schur bounds cannot eliminate this family of negative states.

**Consequence:** as currently written, the native spatial Hamiltonian is not bounded below on the fixed-charge classical state space. Under an ordinary bosonic positive-energy interpretation this rules out a stable energy-minimizing vacuum without an additional, justified physical construction. It is **not** evidence of exponentially growing time dynamics (the linear Schrödinger evolution can remain unitary); it is not a falsification of the entire URT hypothesis, and it is not a claim that a fermionic filling or other independently derived spectral prescription is impossible.

## Theorem 2 — direction-independent analytic bound from the unreduced native H64

Fix either native 32-state history-parity sector `ε=±1`. The uniform sector vector `u` satisfies `H64 u=0`. For a unit spatial direction `n̂`, the field `w=diag(v_s·n̂)u` satisfies `H64 w=10w`, `||w||²=2r²`, and `⟨w, diag(v_s·n̂)w⟩=0`. These are exact consequences of the six-axis icosahedral tight-frame identity `∑ u_i u_i^T=2I3` and parity Walsh orthogonality.

The restriction of `H64+diag(v_s·k)` to `span{u,w}` has the 2×2 Rayleigh matrix `[[0, √2 r |k|], [√2 r |k|, 10]]`. The min-max principle consequently gives, in **either parity sector** and **every momentum direction**,

\[
\boxed{\lambda_{\min}(k,m=18)\ \le\ q_{18}+5-\sqrt{25+2r^2|k|^2}.}
\]

In particular a negative-energy eigenbranch is **guaranteed** whenever

\[
|k|> k_{\mathrm{cert}}=\sqrt{\frac{10q_{18}+q_{18}^2}{2r^2}}=\boxed{0.19577731411550228\ldots}.
\]

This is a universal *sufficient* bound, not the exact crossing threshold. Direct numerical diagonalisation of the native 32×32 parity blocks yields zero crossings near `0.1956898` (slight sixth-order orientation dependence). The existence of a crossing had already been reported in the November 8 spatial paper; the new result here is the simple, all-direction **analytic certificate** and the **fixed-charge full-model obstruction**.

## Executed numerical checks

Run `python cathedral_native_spatial_vacuum_audit_2026-11-09.py`. The script independently verifies:

- Full 64-state pair-flip spectrum `{0×2,10×12,16×30,18×20}`.
- All six physical icosahedral axes and `∑u_i u_i^T=2I3`.
- Both 32-state parity sectors, the exact 10-eigenmode used in the 2×2 analytic certificate, and its zero cubic diagonal.
- Four momentum directions in both parity sectors; every numerically detected zero crossing lies **below** the analytic guarantee.
- A **literal fixed-Q=1 field sequence** of 24-clock complex amplitudes, evaluating the original quadratic history and charged-clock terms and the physical-space momentum term directly; measured `E_5=−0.22424839183125744`, `E_10=−4.20105396494698`, `E_100=−75.78355428102996`.

The machine-readable results are in `cathedral_native_spatial_vacuum_audit_2026-11-09.json`.

## What this means for physics and continuity

The native history construction *already* delivers concrete finite-speed and Green–Kubo transport physics inside its specified stochastic and Hamiltonian systems. The issue is not a missing Platonic spectral calculation. The present full nonlinear *spatial* Hamiltonian cannot yet define a conventional positive-energy quantum vacuum, even before attempts to identify photons, gravitons or Standard Model particles. A physical completion would need to **derive**, rather than merely insert, a suitable stable spectral sector / positive kinetic operator / quantum-statistical construction while preserving the actual URT source-loaded dynamics, conserved current and finite-speed result.

**Claim status:** Exact theorem under the original stated spatial action; numerical checks pass; no claim of an experimental prediction or derivation of observed 3+1D physics. Do not promote this result as a continuum Yang–Mills mass-gap proof or replace the larger Cathedral with the invariant diagnostic sector.
