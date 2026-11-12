# Newton's Cathedral — native 64-history / 24-clock / modular-time interface

Date: 12 November 2026 (UTC). Status: **exact rational finite-history obstruction + numerically executed native-source conditional clock readout**. Physical seconds, Lorentz dynamics and gravitational time remain **open**.

## Research provenance

Read the living repo `con123-gif/URT-Enhanced-v2.0` branch `newtons-cathedral`: `AGENTS.md`, `docs/RESEARCH_STATE.md`, `docs/CONTINUITY_PROTOCOL.md`, the research log and protocol; direct source:

- `research_archive/2026-11-10_urt_arf_forward/forward/cathedral_constructed_joint_dynamics_2026_11_07.py` (all five solids, 190-cochain/H64/native hidden intertwiners and charged 24-clock).
- `.../forward/URT_NATIVE_HISTORY_CLOCK_KERNEL_THEOREM_2026-11-09.py` (K64 + clock, KMS reversed source cost).
- `.../forward/URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py` (conditional Haar 24×64 phase-clock overlap B).
- `.../forward/URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py` (native six-bit all-five hidden sources R3,R5).
- `.../forward/URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py` (prior 8D conditional transfer with amplitude suppression; not a physical clock).
- `.../forward/URT_24_CLOCK_MUST_BE_FIBRE_2026-11-09.py` (Q^6 rank-one excludes 24-cycle as a Q factor).
- `research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_NATIVE_190_24_COVARIANCE_AND_NONLOCAL_WICK_STABILITY_2026-11-08.md` (native 190×24 Gaussian source, **not** a trivial 8-state model).

No external fitted physical values were used. The clock-bin/H64 source dictionary is conditional. This is a continuation, *not* a discovery of the already archived H64→24-clock map.

## Theorem A: exact thermal/native-H64 alignment on the hidden carrier

Let P3,P5 be the native face-sector 20×20 rank-four projectors, and U_h: R^20→R^64 the actual partial isometry. In the eight-dimensional hidden image:

- Hbits U_h P3 = 18 U_h P3;
- Hbits U_h P5 = 16 U_h P5;
- Lhid=3P3+5P5,
- rho* = (P3+Delta²P5)/[4(1+Delta²)], eta=−ln Delta.

The modular Hamiltonian satisfies

Kmod=−log rho*=ln[4(1+Delta²)]I+2eta P5
=const·I+eta(18 I − U_h† Hbits U_h) (on the rank-eight hidden sector).

Consequently for a hidden observable A, **exactly**

sigma_s(A)=rho*^{is} A rho*^{−is}=e^{i Hhid (eta s)} A e^{−i Hhid (eta s)}.

Thus the canonical modular flow agrees with *unitary time evolution under the native Hermitian Hbits*, with **dimensionless** time t=eta·s on this invariant subspace. No extra parameter is needed for *relative time units*; a physical energy/time scale is still absent. (All signs depend on the conventional Heisenberg flow; here sigma_s=e^{iHt} A e^{−iHt}.)

The 24-track Hermitian kinetic term r² L24^(2) acts identically on both hidden sectors and hence does not alter their gap of 2 in the original Gaussian history Hamiltonian Hbits⊗I24 + r² I64⊗L24^(2). This is an algebraic statement about that archived term, **not** an identification of the actual cyclic shift with modular flow.

## Theorem B: conditional native source-clock POVM *does* detect modular phase

The existing phase-bin dictionary defines normalized 24×64 B (conditional expectation of 64 six-bit histories on 24 equally spaced golden-shifted bins). The existing all-five source R3,R5 defines

H = [R3/sqrt(c3)+R5/sqrt(c5)] / 8,  c3=9+18√5/5, c5=7/4, and HᵀH=P3+P5.

The positive instrument T=HᵀBᵀBH has 8 strictly positive eigenvalues in [0,1]. Reconstructing the archived native operators independently in the supplied certificate gives:

||P3 T P5||_F = 0.1478126046742381;
||T||_F relative cross = 0.15917152370592236;
||[Lhid,T]||_F = 2√2 ||P3 T P5||_F = 0.41807718044000053.

This is an **operator-level, finite, nonzero bridge**, not a projection that discards the inter-sector modular phase.

Let u∈im P3 and v∈im P5 be the principal singular vectors of P3TP5, with largest singular value σ=0.12592580988966356, phases chosen so uᵀTv=σ. Let |ψ(t)⟩ = (|u⟩ + e^{2it}|v⟩)/√2. The native positive effect T has exact form

p_T(t)=⟨ψ(t)|T|ψ(t)⟩ = m + σ cos(2t), where
m=(uᵀTu+vᵀTv)/2=0.27385049548409274.

Hence min=0.14792468559442917; max=0.3997763053737563; ideal conditional fringe visibility σ/m=0.45983415026166446 (~46%). This selected optimal coherent input is a **measurement-design diagnostic**; the microscopic URT does not yet prepare it or identify T as an experimentally accessible POVM. The result is not a 46% measured time signal, nor a replacement for the much smaller two-level Gibbs-purification contrast from the previous investigation. T is a model-dependent conditional instrument; its normalization and operational meaning remain unselected.

## Theorem C: *exact* obstruction for autonomous URT history as modular clock

Construct the *actual* native 64×64 two-successor history Markov operator Q, Q[h,2h mod 64]=Q[h,2h mod64+1]=1/2. Then Q^6=J64/64 exactly.

With U_h=M P_h/√2 from the native icosahedral face-bit incidence and P_h=P3+P5, use exact rational arithmetic from C, face adjacency, M, and Q. On the hidden carrier, both inter-sector Q contacts vanish:

P3 U_hᵀ Q U_h P5 = P5 U_hᵀ Q U_h P3 = 0.

However, the hidden subspace is not Q-invariant. Let P_8=U_h U_hᵀ. The **exact** Frobenius leakage squares are

|| (I64−P8) Q U_h P3 ||_F² = 34/25;
|| (I64−P8) Q U_h P5 ||_F² = 436/225.

Additional projected Q properties: ranks 3 and 4 within P3/P5; ranks sum to 7; squared norms 16/25 and 164/225. All hidden U_h columns have zero mean and Q^6 U_h=0, while unitary modular evolution cannot annihilate a nonzero state. Thus **Q restricted to history evolution cannot be the autonomous modular time translation on this hidden carrier**. The separate charged 24-fibre and an additional mechanism for physical observables are necessary. No global no-go for full Cathedral interaction is claimed.

## What was executed, and what was not

The companion Python certificate reconstructs from scratch the original five Platonic vertex coordinates/face incidence, 50→8 Eglobal, face P3/P5, 64-bit M and Hbits, and golden 24-bin conditional B; checks all exact source normalizations, 8 positive transfer eigenvalues, native commutator, optimal coherent fringe; then reconstructs exact rational 20×20 hidden projectors and proves both vanishing projected Q inter-sector blocks and rational leakage squares. It was executed on 12 Nov 2026: `OPENBLAS_NUM_THREADS=1 python cathedral_native_clock_certificate.py` (exit 0). Uses NumPy, SciPy, SymPy; no random or synthetic matrices, no measured constants. The exact rational tests do not depend on floating-point thresholds apart from identifying the underlying small-denominator rationals from known incidence expressions. Native source matrix equations are replicated, not imported from the archive.

No physical light-cone metric, Lorentz invariance, proper-time conversion, charge/gauge matter map or absolute dimensional scale was derived. No physical gate is closed. A nonzero informational phase readout is necessary but not sufficient for a real clock.

## RESUME HERE

1. Use the *native* 190×24 interacting action to derive a preparation and gauge-invariant observable implementing, or falsifying, the conditional POVM T. In particular, connect the source/readout to the full 192-state v61 Wilson current; do not arbitrarily select the coherent singular vectors as physical initial conditions.
2. Test whether its dynamics induces an operational lapse consistent with Lorentz/time-dilation covariance, **without assuming** the relativistic Hamiltonian. The absence of a fundamental dimensional anchor remains open.
3. Preserve separate D6→H3, 24-clock fibre, all five Platonic 190-cochains, 64 histories, Golay/Leech and charged sectors. Do not collapse the physical problem to the eight-carrier result.

Not saved to GitHub at time of local certificate unless a subsequent commit is explicitly verified. Any CI claims require an actual run.