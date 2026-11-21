# Prime-URT two-carrier ground-state entropy: exact audit and corrected ZPE operator

Date: 2026-11-21. Status: **THEOREM for the explicitly declared, conditional prime-flux operator**. Physical vacuum, dark-energy and RH identifications **OPEN**. This report is not a claim that primitive URT uniquely selects the reciprocity connection.

## Problem

Test the proposition: a nontrivial projective commutation law

\[
V_pV_q = c_{pq}V_qV_p,\qquad c_{pq}=\epsilon_{pq}\exp(-2\pi i/\phi^2)
\]

forces positive mutual information between two *physical* arithmetic carriers, producing the previously inferred `0.0607823155` nats/carrier. Compute the two-carrier density **from the same operator whose magnetic gap was proved**. Do not fit any entropy or energy coefficient.

## Theorem 1. Exact finite ground state and fixed-basis mutual information

Select the four prime-exponent states `(00,10,01,11)` and let

\[
A(c)=\begin{pmatrix}
0&1&1&0\\1&0&0&c\\1&0&0&1\\0&\bar c&1&0
\end{pmatrix},\quad c=e^{if},\quad f=\operatorname{Arg}c\in(-\pi,\pi].
\]

The correct four-state **compression** of the proven full prime magnetic Dirichlet operator is

\[
L_4(c)=4I_4-A(c).
\]

This follows directly from each isometry satisfying `V_p^†V_p=I` and `V_q^†V_q=I` on the full positive lattice: `(I-V)^†(I-V)=2I-V-V^†`. Compression preserves the diagonal coefficient 4 (not 2).

For `0<|f|<π`, the ground state of `L_4` is unique and, in this graph gauge, exactly

\[
|\psi_f\rangle={1\over2}\bigl(
|00\rangle+e^{if/4}|10\rangle+e^{-if/4}|01\rangle+e^{-if/2}|11\rangle\bigr),
\quad E_{\min}=4-2\cos(f/4).
\]

This follows by direct substitution in `A(c) psi = 2 cos(f/4) psi`; the spectrum of A is `±2cos(f/4), ±2sin(f/4)`. For the declaration `c_+=exp(-iθ)` and `c_-=-exp(-iθ)`, the principal flux magnitudes are `F_+=θ` and `F_-=π-θ`, `θ=2π/φ²`.

In the **fixed** factorisation `C²_p ⊗ C²_q`, arrange the amplitudes into the matrix

\[
M_f={1\over2}\begin{pmatrix}1&e^{-if/4}\\e^{if/4}&e^{-if/2}\end{pmatrix}.
\]

The reduced density is `ρ_p=M_f M_f†`. Since `Tr ρ_p=1` and `|det M_f|=|sin(f/4)|/2`, its eigenvalues are

\[
\sigma_\pm={1\pm\cos(F/4)\over2}.
\]

The global `ρ_pq=|ψ><ψ|` is pure, so the fixed-basis quantum mutual information per nominal carrier is

\[
\boxed{\frac{I(p:q)}2=H_2\!\left(\frac{1+\cos(F/4)}2\right).}
\]

Numerically, no fitted coefficients:

| Sector | `F` radians | `I(p:q)/2` (nats) | Ground `min spec L4` |
|---|---:|---:|---:|
| `epsilon=+1` | 2.39996322972865 | 0.296315557123 | 2.349318389222 |
| `epsilon=-1` | 0.74162942386114 | 0.049319041167 | 2.034277525278 |

Neither equals the previous proposed `0.06078231552544` nats/carrier.

## Theorem 2. Gauge dependence of the naive tensor-factor entropy

Let

\[
G=\operatorname{diag}\bigl(1,e^{-if/4},e^{if/4},e^{if/2}\bigr).
\]

Then `G ψ_f=(1,1,1,1)/2=|+>_p⊗|+>_q`, so the quantum mutual information in the **unchanged** qubit factorisation is exactly **zero**. The transformed operator `A'=G A G†` has **the same eigenvalues and the same loop holonomy** `A'_(10,11) A'_(11,01) A'_(01,00) A'_(00,10)=c`.

This transformation is an ordinary diagonal vertex phase (graph-gauge transformation) but **not** a product of independent p/q qubit phase gates, because its diagonal factors violate `G_00 G_11=G_10 G_01` whenever `f ≠ 0`.

Thus raw entanglement calculated from a fixed tensor factorisation is **not gauge invariant** when the physically allowed vertex phases do not preserve that decomposition. A physical conclusion would require identifying gauge-invariant subsystem algebras, including necessary boundary/edge degrees of freedom; this issue is standard in lattice gauge theory. The argument does **not** mean that physical entanglement would change under a gauge transformation once the physical subsystems and their observables are transformed correctly.

### More direct gauge-invariant observation

The natural prime-divisibility observables on the four-state compressed lattice are diagonal projectors on the prime-exponent values `a=0/1`, `b=0/1`. Their joint probability distribution in the ground state is exactly

\[
P(a,b)=|\langle ab|\psi_f\rangle|^2=1/4.
\]

Hence their **classical mutual information is exactly zero in both flux sectors**, even while the magnetic spectral gap is positive and the Wilson loop is nontrivial. This refutes the implication *noncommutation ⇒ necessarily correlated divisibility measurements*. The flux is present in **phase-sensitive loop observables**, not in these diagonal probabilities.

## Theorem 3. Correction to earlier numerical `0.0607823` target

The earlier entropy-controlled de Sitter comparison used a **different** plaquette stiffness `L_2=2I-A`, appropriate to an independently declared degree-2 magnetic square graph, **not** the compression of the proven infinite prime Dirichlet operator `L_4=4I-A`.

The canonical-oscillator relative energy under that additional quantisation assumption is

\[
d_b=\operatorname{Tr}\sqrt{bI-A_+}-\operatorname{Tr}\sqrt{bI-A_-}.
\]

Direct exact spectral evaluation gives:

- `d_2=0.2109746055694190823...` (historical separate graph model).
- `d_4=0.0044723808219612612...` (**compression of the prime-lattice gap operator**).

Keeping all prior **unproved** horizon assumptions (`ω=c/R`, horizon area entropy, one 8-state entropy carrier per cell, independent additive oscillators), the de Sitter comparison `r_b=2πd_b/s_*` changes from

\[
r_2=0.95615737316656... \qquad\longrightarrow\qquad
\boxed{r_4=0.02026926362528...}.
\]

The original `0.0607823155` correlation target came from the **inconsistent** `b=2` coefficient. In the internally consistent `b=4` comparison, imposing closure would require

\[
\boxed{i_{\rm req,4}=s_*-2\pi d_4=1.35827405995856...\ \mathrm{nats/carrier}.}
\]

But the two-prime exponent carrier is a **qubit** with maximum local entropy `ln2=0.693147...` nats; the original master state's per-carrier entropy is already `s_*=1.3863748574... > ln2`. Therefore the original 8-state per-carrier entropy cannot be assigned to this two-qubit 4-state model in the first place. The required correlation number has no physical force without a full Hilbert-space embedding and a common state/energy derivation. **Do not fit either target.**

## Constructive result: exact gauge-invariant thermodynamic generator

For **the same operator** `L_4` let `F=|arg c|`, `u=cos(F/4)` and `v=sin(F/4)`. Then its spectral partition function is

\[
\boxed{Z_F(\beta)=\operatorname{Tr}e^{-\beta L_4}=2e^{-4\beta}\left[\cosh(2\beta u)+\cosh(2\beta v)\right].}
\]

The associated spectral mean energy, entropy, and susceptibility are **derived from one operator**,

\[
U_F(\beta)=-\partial_\beta\ln Z_F,\qquad
S_F(\beta)/k_B=(1-\beta\partial_\beta)\ln Z_F,\qquad
\operatorname{Var}_\beta(L_4)=\partial_\beta^2\ln Z_F.
\]

All these are invariant under graph-gauge conjugation. At `β→∞` the unique ground state has **total thermal entropy zero**, while at `β→0`, `S→ln4`. The primitive URT phase fixes the flux but **does not fix β, physical energy units, or the horizon-carrier map**. Hence this is a consistent intrinsic thermodynamic family, not an unambiguous physical vacuum law.

A second gauge-invariant quantity is the ground-state spectral response

\[
E_0(F)=4-2\cos(F/4),\quad \frac{dE_0}{dF}=\frac12\sin(F/4),\quad
\frac{d^2E_0}{dF^2}=\frac18\cos(F/4)>0.
\]

This is a concrete, parameter-free **flux response**, unlike the gauge-dependent naive qubit entropy.

## Correct mathematical-physics frontier

1. Derive a unique arithmetic connection (the present prime-reciprocity lift was selected, not forced by primitive URT).
2. Construct a physical composite Hilbert space and **gauge-invariant carrier subalgebras**, with 8-state URT carriers if the frozen `ρ_*` is to be used. Only then does `I_N` have a defined meaning.
3. Derive an invariant state from the original URT transfer/KMS structure, not from a `β` or fitted correlation chosen to match a cosmological deficit.
4. Calculate entropy and vacuum energy **from that same state and Hamiltonian**, with the consistent `4I-A` compression and a covariant stress tensor.
5. Test dark-energy closure and physical consequences *after* the above derivation. The prior 95.6% near-closure and `0.0607823` target should be marked **SUPERSEDED as physical claims**; they remain correct arithmetic for their explicitly different, conditional historical assumptions.

## Executed verification

`python prime_pair_information_certificate.py` (NumPy, SymPy, mpmath). Exact symbolic characteristic polynomial plus numeric eigenstate, Schmidt spectrum, two sector entropies, site-gauge transformations, diagonal divisor independence, thermal trace, and corrected `b=4` relative ground-response values; asserted fail-on-error. No external physical measurements, fitted constants or artificial target coefficients are used as inputs to the model.

Related external background: Casini, Huerta, Rosabal, *Remarks on entanglement entropy for gauge fields*, Phys. Rev. D 89 (2014); Donnelly and Freidel, *Local subsystems in gauge theory and gravity*, JHEP 2016. These discuss how gauge constraints complicate Hilbert-space factorisation; they do not prove an URT physical theory.