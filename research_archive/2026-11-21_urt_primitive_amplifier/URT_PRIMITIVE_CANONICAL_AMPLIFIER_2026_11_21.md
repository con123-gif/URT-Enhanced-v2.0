# Primitive URT gain: an exact canonical two-mode quantum dilation, its KMS marginal and a resonant source Hamiltonian

**21 November 2026. Track:** standalone URT → magnetic vacuum and carrier-production physics, not RH or Cathedral ARFs. **Result class:** THEOREM for a declared bosonic interpretation of the primitive URT scalar transfer; conditional physics. The two-mode dilation is a standard SU(1,1) Bogoliubov amplifier, not newly discovered quantum mathematics. What is new *within this research programme* is applying the already fixed, unfitted URT modulus \(\pi/e\) and golden phase to this canonical structure and testing its energy against the unchanged native 3D magnetic-sheet operator. Continues commits `9e3fc93`, `489d3d7`, `fe4b73d`, `db6be9d`, `6141748`.

## 1. Starting from primitive URT, without altering its gain

The originally specified scalar URT step is

\[
 q=\alpha e^{i\theta},\qquad \alpha=\frac\pi e=1.15572734979\dots>1,
\qquad\theta=\frac{2\pi}{\varphi^2}=2.39996322973\dots.
\]

A scalar transfer on a classical complex amplitude can be expansive. To interpret it as the **expectation-value gain of a canonical bosonic signal operator** requires a noise/idler degree of freedom. This interpretation is a **new explicit physical postulate B**, rather than a proven implication of primitive URT. A one-mode map \(a\mapsto qa\) by itself would not preserve the canonical commutator \([a,a^\dagger]=1\) because \(|q|^2>1\). The constructive canonical extension below preserves the original \(q\) exactly.

## 2. Exact parameter-free *minimum one-idler* canonical dilation

Take two independent bosonic modes \(a,b\), with \([a,a^\dagger]=[b,b^\dagger]=1\) and all cross-commutators zero. Set

\[
 s=\sqrt{\alpha^2-1},\qquad r=\operatorname{arcosh}\alpha,
\]

and define a transformation

\[
 \boxed{a'=e^{i\theta}(\alpha a+s b^\dagger),\qquad
 b'=e^{i\theta}(\alpha b+s a^\dagger).}
\]

The two original quantum commutators and all cross-commutators are preserved exactly: \([a',a'^\dagger]=[b',b'^\dagger]=\alpha^2-s^2=1\), \([a',b']=[a',b'^\dagger]=0\). Equivalently the Bogoliubov matrix on \((a,b^\dagger)\) obeys \(M\operatorname{diag}(1,-1)M^\dagger=\operatorname{diag}(1,-1)\). It is implemented by a unitary two-mode squeeze followed by a joint phase rotation.

If the idler starts with \(\langle b\rangle=0\), the signal mean transforms as

\[
 \boxed{\langle a'\rangle=q\langle a\rangle}
\]

with the **exact original URT complex transfer**, not an approximated or fitted gain. Given a *single independent canonical idler with a single creation term*, the modulus of the noise coefficient is forced to be \(s=\sqrt{\alpha^2-1}\). This is the quantum-limited minimum-noise one-idler channel under the stated Gaussian gain ansatz; it is not a uniqueness theorem for all possible physical realizations.

The fixed numerical values are

\[
 r=0.551081481114756\ldots,\quad
 s=0.579401162455\ldots.
\]

## 3. The primitive gain now fixes a quantum occupation and KMS ratio

On a two-mode input vacuum, the output is the pure two-mode squeezed state with Schmidt probabilities \(p_k=(1-\lambda)\lambda^k\), where

\[
 \boxed{\lambda=\tanh^2r=1-\alpha^{-2}=1-\frac{e^2}{\pi^2}
 =0.2513320900567\ldots.}
\]

The reduced signal state is **exactly thermal** for an oscillator with energy spacing \(\hbar\omega\). Its mean occupation, effective inverse-temperature product and von Neumann entropy are

\[
 \boxed{\bar n=\frac\lambda{1-\lambda}=\alpha^2-1
 =\frac{\pi^2}{e^2}-1=0.3357057070547\ldots,}
\]

\[
 \boxed{\beta\hbar\omega=-\ln\lambda=1.380980146378\ldots,
\qquad S/k_B=(\bar n+1)\ln(\bar n+1)-\bar n\ln\bar n
 =0.753062688167\ldots.}
\]

Thus **both** the primitive modulus \(\pi/e\) and the golden phase now enter a canonical quantum construction: the modulus fixes the idler quantum noise and entanglement/thermal state while the phase is the signal rotation. The temperature result is **dimensionless** (\(\beta\hbar\omega\)), not a predicted Kelvin temperature or cosmological vacuum entropy. This KMS marginal is conditional on treating the URT gain as a bosonic amplifier, not a KMS theorem for the old magnetic-vacuum transfer.

## 4. A local, number-conserving three-mode physical pump can supply the energy

With a pump bosonic mode \(c\), take resonant free frequencies \(\omega_a=\omega_b=\omega\), \(\omega_c=2\omega\) and a standard local three-mode parametric interaction

\[
 H_{\rm int}=i\hbar\kappa(a^\dagger b^\dagger c-a b c^\dagger).
\]

The total weighted excitation count \(N_a+N_b+2N_c\) commutes *exactly* with this Hamiltonian because every pair-creation term raises \(N_a+N_b\) by two while lowering \(N_c\) by one. Therefore the full resonant free+interaction Hamiltonian conserves the total **nonnegative** quantum energy. Under a large coherent classical pump approximation the interaction reduces to the ordinary two-mode squeezing generator, with squeeze integral \(\kappa\int\langle c\rangle dt\). Matching the unfitted URT gain requires that integral to equal \(r=\operatorname{arcosh}(\pi/e)\); **the pump intensity, phase, controller time and actual URT-to-pump coupling are not derived**.

An exact finite quantum pump check (not a coherent-pump approximation) was executed in the invariant finite subspace \(|k,k,N_p-k\rangle\) for \(N_p=3\), using its exact Hermitian interaction coefficients \((k+1)\sqrt{N_p-k}\), the matrix exponential at the declared demonstration time \(t=r/\kappa\), and exact weighted-number conservation. It gives mean created pairs \(0.943940318795\) and mean remaining pump quanta \(2.056059681205\), summing to three. These are *not* claimed to reproduce the two-mode quantum-limited gain \(\alpha\) for a finite Fock-state pump.

## 5. Original 3D magnetic-sheet energy: a first exact capacity comparison

For the **unchanged** native 3D golden-flux Hamiltonian from `9e3fc93`, extract the disconnected new \(2\times2\) sheet from the actual \(2\times2\times3\) lattice by removing only its original \(z\)-seam edges. Its four positive eigenvalues are computed directly; the complex Gaussian sheet vacuum ground energy is \(E_{\rm sheet}=\hbar c\operatorname{Tr}\sqrt{L_{\rm sheet}}/\ell\).

If one uses **one matched-frequency idler per sheet normal mode** and prepares one URT-gain two-mode squeezed vacuum per pair, the pump supplies the exact excitation energy

\[
\boxed{E_{\rm pump,cycle}=2\bar n\,E_{\rm sheet},\qquad
\frac{E_{\rm pump,cycle}}{E_{\rm sheet}}=2\left[\left(\frac\pi e\right)^2-1\right]
=0.6714114141095\ldots.}
\]

This is an energy-capacity formula for the *declared matched-idler interpretation*, not proof that the pump deposits its energy into a new-sheet ground state. The two original reciprocity sectors give, in units \(\hbar c/\ell\):

| Sector | Native sheet vacuum energy | Matched-idler primitive-gain pump excitation energy |
|---|---:|---:|
| \(\epsilon=+1\) | 5.203810807053 | 3.493897972722 |
| \(\epsilon=-1\) | 4.992836201484 | 3.352247214455 |

The actual source required by the native sheet **plus seam** at this size was already computed in `6141748` as 7.729640715378 (+) and 7.725901038271 (−). The energy-capacity comparison is meaningful only after deriving a coupling that *transfers* pump energy to the prepared sheet/joins; it must not be sold as an energetically closed vacuum-birth cycle.

## 6. What has been accomplished and exactly what remains

**Constructive new connection:** One interpretation of the original primitive *amplifying* URT scalar recurrence has an exact canonical SU(1,1) quantum dilation, with the **minimum idler noise**, a parameter-free squeezed-state thermal ratio, and a physically standard positive-energy resonant pump interaction obeying an exact energy conservation law. We have brought the primitive modulus back into the microscopic quantum story while preserving the original 3D magnetic Hamiltonian and numerical certificates. These Bogoliubov and parametric-amplifier identities are established physics; they do not by themselves constitute a new physical law.

**Decisive remaining physical derivation:** Show from primitive URT why the recursion acts on a bosonic signal expectation, which particular lattice normal mode(s) couple to its idler, how the pump is prepared and driven, and whether the resulting unitary dynamics supplies both native sheet-preparation and joining work at the required rate. Then derive rather than postulate the proper gap floor and carrier density, and determine the full gravitational coupling and absolute scale. Without those results this is a **conditional microscopic extension**, not a finished zero-parameter theory or observational dark-energy prediction.

**Executed evidence:** `URT_PRIMITIVE_BOGOLIUBOV_CERT.py` (SymPy exact SU(1,1) metric and geometric thermal sums; SciPy explicit finite-pump matrix; unchanged native graph/sheet eigenvalues in both sectors), local container exit 0, 2026-11-21. GitHub registration/check requested. **RESUME HERE:** Construct the first explicit local signal–idler–sheet coupling compatible with original three-dimensional magnetic flux and verify its exact energy exchange, or prove a concrete selection rule from primitive URT that determines that interaction; do not invent measured targets or change the old Hamiltonian.
