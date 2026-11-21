# URT zero-point vacuum — unified mathematical core, 21 November 2026

**Scope:** the standalone primitive URT → prime-holonomy → *conditional* canonical quantum-vacuum branch. This is a coherent, testable mathematical model, **not a completed first-principles physical theory of dark energy**. It makes no use of Cathedral operators, ARF targets, RH, or arbitrary stability taxes.

## Primitive rule and proposed arithmetic lift

Primitive URT gives the dimensionless scale–phase recurrence

\[
 r_{k+1}=(\pi/e)r_k,\qquad \theta_{k+1}=\theta_k+2\pi/\phi^2,
\quad\phi=(1+\sqrt5)/2.
\]

To introduce prime-exponent directions, declare the distinct-prime transport relation

\[
 V_p V_q=\epsilon_{pq}\exp(-2\pi i/\phi^2)V_qV_p,
\quad \epsilon_{pq}=(-1)^{(p-1)(q-1)/4}
\]

for odd primes. **This arithmetic lift is a proposed extension, not yet a unique theorem of the original recurrence.** It produces a nonzero loop flux and a positive spectral gap.

## One candidate vacuum action — same operators throughout

Consider a finite connected `N×N` two-direction prime-exponent graph with horizontal links of phase 1, vertical links of phase `e^{ixF}`, and `F=|Arg(\epsilon e^{-i2\pi/\phi^2})|`. Its actual-degree magnetic graph Laplacian is

\[
 L_N=\sum_{(i,j)\in E}(|i\rangle-u_{ij}|j\rangle)
 (\langle i|-\bar u_{ij}\langle j|).
\]

The positive energy functional of complex local fields is `Q(ψ)=ψ†L_Nψ`. A canonical dynamical embodiment is the realified classical oscillator action

\[
 S[Q]=\frac m2\int dt\,[\dot Q^T\dot Q-\omega_0^2 Q^T\mathcal R(L_N)Q],
\]

with `Q` carrying two real coordinates per site. **Canonical quantisation, `m`, and `ω0` are additional physical postulates**, not yet consequences of primitive URT. Once postulated, they specify *one Hamiltonian* and one unique pure Gaussian ground state. Its vacuum energy and a physical site subsystem's entropy are simultaneously

\[
 \frac{E_0}{\hbar\omega_0}=\operatorname{Tr}\sqrt{L_N},\quad
 \frac{S_A}{k_B}=2\operatorname{Tr}h\big((\sqrt{I+XX^\dagger}-I)/2\big),
\]

where `W=√L_N`, `V=W^{-1}`, `X=V_A^{1/2}W_ABW_B^{-1/2}`, `h(n)=(n+1)ln(n+1)-n ln n`. Both are gauge-invariant under local site phase changes. This eliminates the earlier error of combining energy from a four-site graph with entropy from an unrelated eight-level state.

## Established finite and infinite mathematics

- **Uniform frustration gap:** `1-cos(F/4) <= λ_min(L_N)` for all `N>=2`.
- **Finite four-site results:** for reciprocity `+`, `E0/(ℏω0)=5.203810807053...` and half-cut entropy `S_A/kB=0.542933527496...`; for `-`, `4.992836201484...` and `1.438786007428...`.
- **Infinite-volume response:** `u_ε=lim_N Tr√L_{N,ε}/N²` exists. The previously certified magnetic-sector separation satisfies `u_+−u_->0.002211131...`; independent Lanczos estimate `u_+−u_-≈0.00827785286`. This is **relative**, not a physically calibrated vacuum-energy density.
- **New joint interface theorem:** for a full even `N×N` graph (`N>=4`) joined across `N` actual magnetic bonds, let `Δe_N=Tr√L_joined−Tr√L_split`. With `g=1−cos(F/4)`:

\[
 \frac{N}{\sqrt8}\leq\Delta e_N\leq\frac{N}{\sqrt g},\qquad
 c_{\rm low}(F)N\leq S_A/k_B\leq C_{\rm area}(F)N.
\]

Here `c_low(F)>0` and `C_area(F)<∞` are exact expressions in the companion theorem, and the *same ground state* supplies both quantities. In particular,

\[
 c_{\rm low}(F)\sqrt g\;\Delta e_N
 \leq S_A/k_B \leq C_{\rm area}(F)\sqrt8\;\Delta e_N.
\]

The nonzero boundary energy has an actual thermodynamic limit `Δe_N=Nσ(F)+O(1)` with `σ(F)>0` given by the half-plane interface resolvent integral. The **generalized interface response** is calculated by

\[
 \frac{\partial E_0(t)}{\partial t}=\frac{\hbar\omega_0}{2}
 \operatorname{Tr}[B_N(L_0+tB_N)^{-1/2}]>0.
\]

This is an exact, unadjusted microscopic vacuum response to changing a coupling across the interface. It is **not automatically a gravitational pressure**.

## The physical closure that remains

A theory of the **actual physical** zero-point vacuum, gravity and cosmic acceleration must supply a primitive dynamical reason for the projective prime lift and its charged quantum degrees of freedom; a dimensional frequency/length scale; a physical 3+1-dimensional continuum limit; and a generally covariant metric dependence. Only then can its renormalized effective action `Γ_vac[g]` yield an unambiguous, conserved stress tensor

\[
 T_{\mu\nu}^{\rm vac}=-\frac{2}{\sqrt{-g}}\frac{\delta\Gamma_{\rm vac}}{\delta g^{\mu\nu}}.
\]

To qualify as dark energy, that stress must yield `P≈−ρ` under actual cosmological evolution, not simply a convenient `R^{-2}` counting law, a thermodynamic reference-state shift, or matching an old number. Entanglement *area* entropy in a 2D graph is not the 3+1-dimensional gravitational horizon entropy; that identification still requires proof. An absolute energy density cannot be inferred from dimensionless `π, e, φ` alone without an independently derived physical scale.

**What is finished:** a mathematically defined, gauge-invariant quantum-lattice candidate that unifies microscopic flux frustration, macroscopic relative vacuum energy, entanglement entropy and interface response. **What is not finished:** deriving this candidate from *primitive* URT as a unique physical law, determining physical units, and obtaining observed dark energy from its covariant stress. The next needed mathematical object is **the actual metric-sensitive URT vacuum action**, not a target coefficient.

## Archive provenance

- `research_archive/2026-11-21_urt_zpe_gaussian_joint/` — four-site one-vacuum energy and entropy; commit `a0e597ba`.
- `research_archive/2026-11-21_urt_zpe_lattice_area_law/` — uniform gap, Gaussian area upper bound, bulk limit; commit `6b6ef6c`.
- `research_archive/2026-11-21_urt_zpe_infinite_flux/` — exact positive infinite bulk sector difference; commit `939aabcd`.
- `research_archive/2026-11-21_urt_zpe_interface/` — joint two-sided boundary energy/entropy and infinite interface limit; current work.