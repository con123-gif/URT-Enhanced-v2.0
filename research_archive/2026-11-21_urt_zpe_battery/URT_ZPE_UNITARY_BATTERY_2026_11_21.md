# URT–ZPE: a bounded-below quantum work battery for native magnetic-sheet activation and joining

**Date:** 21 November 2026. **Track:** standalone 3D golden-flux URT vacuum. **Status:** THEOREM for an explicitly constructed, conditional nonlocal energy-conserving quantum converter. **Not** a first-principles microscopic URT energy reservoir, local coupling, quantum gravity or Riemann-hypothesis result. Extends the verified native Hamiltonian (`9e3fc93`), three-layer ledger (`489d3d7`), covariant auxiliary action (`fe4b73d`), and real-time Gaussian seam protocol (`db6be9d`).

## 1. The exact energetic question

A prepared magnetic new layer and its native seam cannot emerge from an energy-free operation. The original physical model has two separately positive costs: the oscillator ground energy of the disconnected new layer and the joining work of its four original bonds (for a 2×2 sheet). We now construct a **completely unitary joint system + battery** that transfers precisely the required energies without a negative-energy battery, and show the exact energy cost with the unchanged original graph.

This is an **existence construction**, not a selected physical source. The conversion operator acts on global oscillator ground-state projectors and is therefore nonlocal; it does not supersede the local real-time ramp in `db6be9d`.

## 2. Bounded-below quantum battery and exact switch unitary

For any two quantum ground-state channels \(|0,g_0\rangle\), \(|1,g_1\rangle\) with fixed energies \(E_0\), \(E_1>E_0\), define \(\Delta=E_1-E_0>0\). Let the battery Hilbert space be \(\mathcal H_B=L^2([0,\infty),dE)\), with physical energy Hamiltonian \((H_B\psi)(E)=E\psi(E)\), **bounded below by zero**. The channel energies are part of the native oscillator Hamiltonian, while a switch distinguishes the old and new physical coupling sectors.

On the two ground channels, a state is a pair of battery functions \(\psi_0(E),\psi_1(E)\). Define

\[
 (U_\Delta\psi)_0(E)=
 \begin{cases}\psi_0(E),&0\le E<\Delta,\\\psi_1(E-\Delta),&E\ge\Delta,\end{cases}
 \qquad
 (U_\Delta\psi)_1(E)=\psi_0(E+\Delta),\quad E\ge0.
\]

Define \(U_\Delta\) to be the identity on the orthogonal complement of these channels. Shifting the integration variable shows that \(\|U_\Delta\psi\|^2=\|\psi\|^2\), with \(U_\Delta^\dagger=U_\Delta\) and \(U_\Delta^2=I\). For \(E\ge\Delta\), the two swapped channels have the *same* total energy:

\[
 E_0+E=E_1+(E-\Delta).
\]

Therefore, for the fixed uncoupled energy operator \(H_{\rm free}=H_B\oplus H_0\oplus H_1\) interpreted in the switch-block direct sum, **\([U_\Delta,H_{\rm free}]=0\)**. The operator is a genuine energy-preserving unitary, and the battery spectrum never extends below zero. A time-independent total Hamiltonian

\[
 H_{\rm tot}=H_{\rm free}+\hbar\kappa U_\Delta
\]

also conserves total energy, and its evolution after \(t=\pi/(2\kappa)\) implements \(-iU_\Delta\) up to free-energy phases. The strength/time \(\kappa\) is **not selected by URT**; this constructs a mathematical mechanism, not an autonomously derived physical time scale.

## 3. Exact finite-energy battery state

For arbitrary \(\beta>0\), take a normalised initial state supported at battery energies at least \(\Delta\):

\[
 \psi_0(E)=\sqrt{2\beta}\,e^{-\beta(E-\Delta)}\mathbf1_{E\ge\Delta},
 \qquad \psi_1(E)=0.
\]

The converter maps it to the final active state with battery wavefunction \(\psi_1^{\rm final}(E)=\sqrt{2\beta}e^{-\beta E}\), \(E\ge0\). Exact integration gives

\[
 \|\psi^{\rm initial}\|^2=\|\psi^{\rm final}\|^2=1,
 \qquad \langle H_B\rangle_i=\Delta+\frac1{2\beta},\quad
 \langle H_B\rangle_f=\frac1{2\beta}.
\]

The battery loses **exactly** \(\Delta\), while the physical oscillator ground energy increases by \(\Delta\); the total expected energy and indeed the total-energy spectral measure are unchanged. No negative-energy reservoir, fitted coefficient or fictitious work source enters the identity. The battery preparation parameter \(\beta\) does not affect the transferred energy, but is an independent resource/state parameter and is not predicted by primitive URT.

## 4. Native 3D two-stage example: activation plus seam joining

Embed an **inactive** new layer state \(|\emptyset\rangle\) in a fixed larger kinematic direct-sum Hilbert space, and an **active** sheet carrying the original magnetic Gaussian oscillator. The first converter activates/prepares the sheet ground state at energy cost \(E_{\rm sheet}>0\). The second converts the disconnected old+sheet vacuum to the original joined-Hamiltonian vacuum at the exact cost \(W_{\rm seam}>0\). The original graph is not modified in the active sector; no literal dimension creation is claimed (the dormant Hilbert sector was available already).

For \(\Lambda_{2,2,2}\to\Lambda_{2,2,3}\), with all original \(x/y/z\) golden-flux links and four original \(z\)-seam bonds, exact additivity of the native ground-state energies gives

\[
 E_{223}-E_{222}=E_{\rm sheet}+W_{\rm seam}>0.
\]

A battery initially supported at energies \(E\ge E_{\rm sheet}+W_{\rm seam}\) can pay both transfers in succession without ever encountering negative energy. The analytic converters above map the corresponding quantum state into the final native joined vacuum with total energy exactly conserved.

The executed local numerical checker gives (units \(\hbar c/\ell\)):

| Golden reciprocity sector | Sheet ground-energy preparation | Native seam joining | Total battery drain |
|:---|---:|---:|---:|
| \(\epsilon=+1\) | 5.203810807053 | 2.525829908325 | 7.729640715378 |
| \(\epsilon=-1\) | 4.992836201484 | 2.733064836786 | 7.725901038271 |

The certificate independently rebuilds all native links, checks that the seam is original and satisfies \(B^2=2B\), that the disconnected Hamiltonian equals old box \(\oplus\) new sheet, and that initial energy minus battery loss equals final energy. The analytic part uses exact SymPy integrals and the pointwise equality of total energies. Both flux sectors passed locally, 21 November 2026.

## 5. Physical status and next work

**What is new:** the prepared sheet and native seam can be included in a larger unitary, **energy-conserving** quantum system, with an explicit work battery that has a genuine nonnegative spectrum. Thus the energy accounting in the old/new lattice growth theorem is mathematically compatible with unitary quantum evolution, and the required source energy is quantified using the original native Hamiltonian.

**What remains conditional:** The switch converter uses global ground-state projectors and does not arise from the local URT lattice Hamiltonian, primitive transfer dynamics or a derived physical control field. The unexcited-to-active Hilbert switch is a specified kinematic embedding, not creation from nothing. There is no predicted battery population, positive-energy supply mechanism, frequency threshold, speed of activation, gravitational coupling or cosmological energy scale. Energy conservation **alone** does not give the observed vacuum, and a generic mathematically possible converter is not a discovery of a microscopic dark-energy engine.

**RESUME HERE:** Replace the global switch converter by an *explicit local coupling* sourced from the original prime-lattice/URT transfer generator; derive the controller's state, locality, rate and physical frequency threshold. Test the exact native sheet-energy/adiabatic work demands against the resulting coupling. Only after this, derive gravity rather than inserting Einstein–Hilbert and an auxiliary fixed-density postulate.
