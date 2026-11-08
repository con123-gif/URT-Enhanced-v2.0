# URT prototype versus full Cathedral — precise source audit (2026-11-08)

## Ground truth and scope

This audit inspects the exact canonical module [`cathedral_core/urt.py`](../../cathedral_core/urt.py) as retrieved on 2026-11-08, not every historical URT prototype ever written. **No original source file is changed.** The wider Cathedral (all five Platonic solids, 190 cochains, two distinct H64 operators, H13⊕H51, D6→H3, 24 tracks, 50→8→12 source, Golay/Leech, gauge/matter/gravity and continuum) remains an active complete research programme. Nothing here proves those downstream components false.

## Source facts

The module defines

\[
 r=\pi/e,\qquad \vartheta=2\pi/\varphi^2,\qquad \Omega=\log(r)+i\vartheta,
\]

but its recurrence is

\[
F(p;u)=\beta\{\alpha[p-\theta_h f(p)]+u\},\quad
 f(p)=\begin{cases}\sin p,&|p|\le \pi\\ \operatorname{sgn}(p),&|p|>\pi.\end{cases}
\]

with default parameters `alpha=1.155`, `beta=0.235`, `theta_h=2.4`. The update uses π through the switching threshold and sine; it does **not** call `SPIRAL_SCALE`, `SPIRAL_PHASE`, `OMEGA` or `PHI`. Thus, as implemented, changing the exported golden ratio or the value of e in those separate constants leaves every sequence of `urt_step` updates unchanged at fixed inputs and defaults. It is invalid to deduce a unique golden 24-track link phase or a full physical transfer solely from this scalar recurrence; extra dynamical information is essential.

### Theorem A — nonidentifiability from scalar projection

Given *any* scalar update `F(p,u)`, choose any finite auxiliary Hilbert space H and any two positive transfer operators `T1 != T2` on H. The enlarged updates

\[
 \mathcal F_i(p,h;u)=(F(p,u),T_i h),\qquad i=1,2,
\]

have **identical scalar projections for every initial p and every driving input u**, but distinct hidden dynamics. In particular choosing `T1=diag(1,exp(-1))` and `T2=diag(1,exp(-2))` produces distinct hidden gaps. This is a proof that the scalar recurrence alone cannot uniquely fix hidden spectra, interactions, gauge coupling or dimensionality. It does not preclude a **completed URT** in which the later Cathedral structure and additional laws resolve this underdetermination.

### Theorem B — the source function is discontinuous at its switch

For `p=pi`, `f(pi)=sin(pi)=0`, whereas for `p->pi+`, `f(p)=1`. Consequently for any continuous fixed input u,

\[
 F(\pi^+;u)-F(\pi;u)=-\alpha\beta\theta_h=-0.651420\ldots
\]

at the defaults. The analogous jump occurs at `-pi`. Therefore `F` is not globally continuous and cannot be a global Lipschitz contraction on all real p. The `max_piecewise_fibre_derivative` value

\[
 \alpha\beta(1+\theta_h)=0.922845\ldots<1
\]

is a **branchwise derivative bound**, not a proof of a global contraction across the switches. This matters if the earlier bounded recursion was called a globally contracting selector.

The `absorbing_bound` remains a valid coarse *forward bound* when `|u|<=U` and `alpha*beta<1`, because `|f(p)|<=1` implies

\[
 |F(p,u)|\le\alpha\beta|p|+\beta(\alpha\theta_h+U).
\]

This is an absorbing-ball statement, not an assertion of uniqueness of an attractor or a unique physical geometry. For a truly globally continuous controller, change the switching interpolation explicitly and prove its properties; do **not** silently alter the original research algorithm.

## Consequence for the research strategy

There is no obligation for a preliminary scalar URT controller to already contain the completed physical laws. The defensible process is:

1. Treat the above `urt_step` as an **early controller prototype** with bounded-input estimates, not as the unique microscopic physics axiom.
2. Use the *existing* source-loaded Cathedral operators and verified exact mathematical identities to define a candidate **full-state URT**, including all five solids and native H64/24-clock dynamics. Keep source provenance and explicit premises visible.
3. Demonstrate that the early scalar controller appears as an observable, coarse-grained limit or a useful engineering approximation of a completed full-state model if it genuinely does. This is a scientific compatibility target, not something to insert as an axiom.
4. Require independent physical discrimination of candidate full-state laws (conserved currents, continuum scaling, anomaly/representation constraints and measurements). A parameter-free choice is not the same thing as a uniquely derived physical law.

This **reverses** the mistaken logic that every subsequent finite Cathedral theorem must be forced by the primitive implementation of `urt_step` before it counts as progress. It preserves the complete non-reduced Cathedral and records an exact, executable audit of the original scalar prototype.

## Reproduction

Run `python research_archive/2026-11-08_urt_prototype_audit/test_urt_prototype_scope_2026_11_08.py` from the repository root; no new dependencies beyond the existing `cathedral_core` package. The script checks the jump, bounds, scalar/hidden underdetermination and that the fixed spiral constants are not called by the update.

## Integrity of verification

The exact original `cathedral_core/urt.py` fetched from the canonical `newtons-cathedral` branch has Git blob SHA `96a1fe6b9420f02f6c8db4bea17226e2bae0b091`. A local byte-for-byte source copy used solely to execute this audit has the same `git hash-object` SHA. The original repository module was not edited. The executable tests passed; see `urt_prototype_scope_2026_11_08.verify.log`. This proves the properties of that inspected prototype, **not** the state of all historical URT variants.