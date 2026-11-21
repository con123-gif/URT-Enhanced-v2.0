# URT prime magnetic plaquette: one quantum vacuum, ground-state energy, and gauge-invariant site entanglement

**Date:** 21 November 2026. **Scope:** standalone URT arithmetic-prime ZPE branch; no Cathedral operators, entropy carrier transfer, horizon area law, or RH assumptions. **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for the explicitly specified finite quantum model. This is not a derivation of physical dark energy.

## The missing common-state calculation

Earlier candidate cosmological comparisons combined the vacuum energy of a finite magnetic four-cycle with the entropy of a separately specified eight-state density matrix. The two observables were not derived from the same physical state. An alternative single-particle `C^4=C^2 tensor C^2` entanglement varied under lattice vertex-phase gauge changes because its notional prime-qubit factorisation was not preserved by those transformations.

Here we instead quantise **one complex local oscillator at each of four actual lattice sites**. The physical two-site subsystem is a tensor product of its local canonical oscillator algebras; a lattice gauge change acts locally on each oscillator, so physical site entanglement is gauge-invariant.

## Inputs and Hamiltonian — no fitting

Only the phase and the declared prime reciprocity sectors enter:

\[
\phi=(1+\sqrt5)/2,\quad \theta=2\pi/\phi^2,\quad z_\epsilon=\epsilon e^{-i\theta},\quad \epsilon\in\{+1,-1\}.
\]

Define four-site adjacency $A(z)$ on vertices $0,1,2,3$ by undirected edges $0\leftrightarrow1$, $0\leftrightarrow2$, $1\leftrightarrow3$ (complex hopping $z$), $2\leftrightarrow3$, with reverse hopping $\bar z$. The graph Laplacian is

\[
L(z)=2I_4-A(z),\quad |z|=1.
\]

This is **the independently defined finite, degree-two magnetic cycle**, not the compression $4I_4-A(z)$ of an infinite degree-four prime-lattice operator. It must not be labelled as a derivation of that infinite operator; retaining its valid finite spectrum does not select it uniquely as the physical vacuum.

**Conditional quantisation hypothesis:** Introduce at each site two real local canonical coordinates and momenta, with $[Q_a,P_b]=i\hbar\delta_{ab}$. The realification of $L$ is $K=\mathcal R(L)$, a real symmetric positive $8\times8$ matrix. The **single** Hamiltonian is

\[
H_z=\frac{1}{2m}P^T P +\frac{m\omega_0^2}{2}Q^T\mathcal R(L(z))Q.
\]

Canonical commutation relations, $m$ and physical frequency $\omega_0$ are **not derived from primitive URT**. No values are tuned. For $0<|\arg z|<\pi$ the matrix is strictly positive, and its Gaussian ground state is unique.

## Theorem 1 — exact vacuum ground-state energy

Writing $F=|\arg z|\in(0,\pi)$, the four eigenvalues of $L(z)$ are

\[
\lambda(F)=\left\{2\pm2\cos(F/4),\;2\pm2\sin(F/4)\right\}.
\]

The eight real oscillator frequencies are $\omega_0\sqrt{\lambda_j}$ with multiplicity two. Consequently

\[
\boxed{\frac{E_0(F)}{\hbar\omega_0}=\operatorname{Tr}\sqrt{L(z)}
=2\left[(1+\sqrt2)\cos(F/8)+\sin(F/8)\right].}
\]

The derivative is

\[
\frac{d}{dF}\left(\frac{E_0}{\hbar\omega_0}\right)
=\frac14\bigl[\cos(F/8)-(1+\sqrt2)\sin(F/8)\bigr]>0
\qquad(0<F<\pi),
\]

since $\tan(F/8)<\tan(\pi/8)=\sqrt2-1$. Thus greater nontrivial magnetic flux raises this model's ZPE **as an exact theorem**, not a numeric fit. The two flux magnitudes are $F_+=\theta$ and $F_-=\pi-\theta$; $F_+>F_-$.

## Theorem 2 — gauge-invariant *physical site* entanglement of the same ground state

Set $W=L^{1/2}$. In units with $\hbar=m=\omega_0=1$, the Gaussian ground-state canonical covariances are

\[
\Gamma_Q=\tfrac12\mathcal R(W^{-1}),\qquad
\Gamma_P=\tfrac12\mathcal R(W),\qquad \Gamma_{QP}=0.
\]

For physical sites $A=\{0,1\}$ (the other two physical sites are $B=\{2,3\}$), let

\[
W_A=(W)_{AA},\qquad V_A=(W^{-1})_{AA}.
\]

The positive eigenvalues of $W_A V_A$ are explicitly

\[
r_\pm =\frac{t\pm\sqrt{t^2-4d}}2,\quad
t=\operatorname{Tr}(W_AV_A),\quad d=\det(W_A)\det(V_A).
\]

The subsystem's four real symplectic eigenvalues are $\nu_+=\sqrt{r_+}/2$ and $\nu_-=\sqrt{r_-}/2$, **each repeated twice**. The reduced site's von Neumann entropy is exactly

\[
\boxed{\frac{S_A(F)}{k_B}=2\bigl[h(\nu_+)+h(\nu_-)\bigr],\quad
h(\nu)=(\nu+\tfrac12)\ln(\nu+\tfrac12)-(\nu-\tfrac12)\ln(\nu-\tfrac12).}
\]

All quantities follow by spectral functional calculus from the **same** $L(z)$. The full ground state has total entropy zero, but $S_A>0$ because sites are entangled. This is **entanglement entropy**, not by itself thermodynamic horizon entropy.

**Rigorous nonzero-entanglement argument:** The pure ground Gaussian wavefunction contains $\exp[-\frac12Q^T\mathcal R(W)Q]$. If it factorised across sites $A|B$, $\mathcal R(W)_{AB}$ would vanish. But then $W$ would be block-diagonal and $L=W^2$ would be block-diagonal, contrary to the actual cross-cut bonds $L_{0,2}=-1$ and $L_{1,3}=-z$. Therefore $S_A>0$ for every nontrivial flux.

**Gauge-invariance proof:** A vertex gauge change is $L\to DLD^\dagger$ with diagonal unitary $D=\operatorname{diag}(e^{i\alpha_j})$. It is a product of local phase-space rotations on the four physical site oscillators, so it is local with respect to $A|B$. Consequently $W_A\to D_AW_AD_A^\dagger$ and $V_A\to D_AV_AD_A^\dagger$, making $W_AV_A$ unitarily similar and leaving $r_\pm$, $\nu_\pm$ and $S_A$ invariant. This **resolves the specific gauge-dependence problem of the earlier artificial prime-qubit tensor split**.

## High-precision results — original URT golden phase, no fitting

| Ground-state observable | $\epsilon=+1$ | $\epsilon=-1$ |
|---|---:|---:|
| $F$ (radians) | $\theta$ | $\pi-\theta$ |
| $E_0/(\hbar\omega_0)$ | 5.203810807053425762 | 4.992836201484006680 |
| $\nu_+$ for cut $\{0,1\}$ | 0.547659816628014015 | 0.780377887748130182 |
| $\nu_-$ for cut $\{0,1\}$ | 0.514886384164792474 | 0.507948169344486062 |
| $S_A/k_B$ (nats) | 0.542933527495884776 | 1.438786007428435997 |

\[
\frac{\Delta E_0}{\hbar\omega_0}=0.2109746055694190823\ldots,
\qquad
\frac{\Delta S_A}{k_B}=-0.8958524799325512211\ldots.
\]

These two sector values come from **one Hamiltonian family and the ground state it determines**. A direct 75-digit spectral-projector implementation and independent NumPy/SciPy Gaussian covariance check agree. Under both sectors the gauge-transformed entropy remains invariant to the tested numerical precision. Entropy is cut-dependent: the nonadjacent cut $\{0,3\}$ has $S_A/k_B=0.85489366505...$ for $+$ and $1.69648330507...$ for $-$; therefore a unique macroscopic state-counting entropy has not been specified.

## What is and is not demonstrated

**THEOREM / CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (conditional on canonical quantisation and an independently defined four-site magnetic graph):** strictly positive ZPE, strictly positive and gauge-invariant local bipartite ground-state entanglement, and an exact shared spectral functional calculus that gives both; higher flux raises $E_0$. The original finite ZPE result survives, now accompanied by a compatible local entropy. The local entropy change is numerically anti-correlated with energy between the two reciprocity sectors.

**Not demonstrated:** primitive URT uniquely implies the projective prime connection, canonical commutators, local charged complex oscillators, finite graph versus infinite boundary, physical energy scale $\omega_0$, continuum gravitational dynamics, Bekenstein–Hawking entropy, area-law counting, $w=-1$ or measured dark energy. In particular the earlier 95.6157% de Sitter comparison is **not** rescued by the new entropy: the new entropy has a different value and physical meaning from the previously imported eight-state master entropy.

**RESUME HERE — exact next mathematical step:** Define an intrinsic finite-volume **many-site** URT magnetic transfer graph and its canonical physical-site algebra, calculate the Gaussian vacuum covariance and its entanglement entropy for a sequence of nested boundary cuts, then prove or disprove an entropy-area limit and its coupling to the *same* vacuum energy as the number of sites grows. Do not insert a horizon count, a stability tax, or a target entropy coefficient.

### Files and execution

- `URT_JOINT_ZPE_ENTROPY_CERT.py`: 75-digit fail-on-error mpmath direct construction; checks spectral square roots, covariance trace/determinant, ground-state energy, two-sector entropies, exact formula, and local gauge invariance.
- `independent_gaussian_check.py`: independent NumPy/SciPy eigenvalue and covariance check on the same physical site cut.
- Executed locally in a Python container on 2026-11-21, both exit 0, before any GitHub CI claim.