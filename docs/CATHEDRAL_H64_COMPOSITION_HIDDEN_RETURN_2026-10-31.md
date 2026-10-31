# Cathedral/URT: exact history composition and hidden-return theorem (2026-10-31)

**Original Cathedral mathematics; not James Lockwood's work.** Mathematical result on the native H64=H13⊕H51 Walsh carrier, not a proof of nature or a Clay mass-gap proof. Preserve all five Platonic solids, D6→H3, 24-clock, Golay/Leech and spatial refinements as part of the wider project.

## A. Refinement-composition theorem

Suppose \(T_*\) is a strictly positive self-adjoint contraction on its supported Hilbert space and \(S_t\) is a strongly continuous family of positive self-adjoint transfers with \(S_0=I\), \(S_1=T_*\), \(S_{t+s}=S_tS_s\). Then **uniquely**
\[
S_t=T_*^t=e^{-tH_*},\qquad H_*=-\log T_*.
\]
Indeed, \(S_{1/n}^n=T_*\) forces the unique positive nth root, rational times follow by composition, real times by continuity. The earlier \(e^{-a^2 H_*}\) ambiguity violates composition. This theorem is conditional on the original URT microscopic history evolution obeying such refinement composition; it does not independently prove that physical identification, and does not solve spatial refinement.

## B. Reconstruct the original H64 and H13 without reduction

Six antipodal unit icosahedral axes \(u_i\) have \(u_i\cdot u_j=\pm1/\sqrt5\) for \(i\ne j\). A history is \(s\in\{\pm1\}^6\). The exact original kinetic operator is
\[
H_8=15I-\sum_{i<j}X_iX_j,\quad
\operatorname{spec}(H_8)=0^{(2)}\oplus10^{(12)}\oplus16^{(30)}\oplus18^{(20)}.
\]
Inside the 64 Walsh states, define native H13 from the functions \(1\), \(\prod_i s_i\), the six degree-one functions \(s_i\), and the five independent tracefree quadrupoles of \(x(s)=\sum_i s_i u_i\). This gives \(H_{13}\cong2\cdot1\oplus3\oplus3'\oplus5\), its orthogonal complement \(H_{51}\), and projectors \(P,R=I-P\).

Use the **already documented geometric history candidate**
\[
Q(s)=\|x(s)\|^2=6+\frac2{\sqrt5}\sum_{i<j}c_{ij}s_is_j,\qquad c_{ij}=\pm1,
\quad H_\lambda=H_8+\lambda\,\mathrm{diag}(Q),\quad T_t=e^{-tH_\lambda}.
\]
The dynamical inclusion and magnitude \(\lambda\) are NOT uniquely derived from the source-loaded \(B_*\); keep \(\lambda\) symbolic, no observational fitting.

## C. Exact hidden-return identity and universal rank

For any self-adjoint semigroup \(T_t\), the **operator identity**
\[
\boxed{PT_{2t}P-(PT_tP)^2=PT_tRT_tP=(RT_tP)^\dagger(RT_tP)\succeq0}
\]
follows by inserting \(I=P+R\). For the native history geometry \(RH_8P=0\), hence
\[
RT_tP=-t\lambda RQP+O(t^2),\quad
PT_{2t}P-(PT_tP)^2=t^2\lambda^2G+O(t^3),\quad G=PQRQP.
\]

**Exact algebraic theorem**
\[
\boxed{\operatorname{spec}_{H13}(G)=12^{(2)}\oplus8^{(6)}\oplus(19/5)^{(5)}}.
\]
Therefore \(G\succeq19P/5\) and, for each \(\lambda\ne0\), sufficiently small \(t>0\) obey
\[
PT_{2t}P-(PT_tP)^2\succeq(19/10)\lambda^2t^2P.
\]
**Every one of the 13 visible modes couples to H51.** The 13-state transfer is not dynamically closed, even though the full 64-state transfer is a semigroup.

### Exact certificate

In the Walsh-character basis indexed by subsets \(S,T\subset\{1,\ldots,6\}\), multiplication by \(Q\) has matrix
\[
Q_{ST}=6\delta_{ST}+\frac2{\sqrt5}\sum_{i<j}c_{ij}\delta_{S\triangle T,\{i,j\}}.
\]
Let \(E\) be the 64×13 matrix spanning the above native H13 and \(D=E^\top E\). In the nonorthonormal visible basis the return is similar to
\[
M=D^{-1}[(QE)^\top(QE)-(E^\top QE)D^{-1}(E^\top QE)].
\]
The independent symbolic certificate operates entirely in \(\mathbb Q(\sqrt5)\) and verifies
\[
\boxed{5M^3-119M^2+860M-1824I=0,\quad\mathrm{tr}M=91,\quad\mathrm{tr}M^2=3721/5.}
\]
The polynomial has exactly the roots \(12,8,19/5\); the two traces and \(\dim M=13\) determine multiplicities \(2,6,5\). Run \`research_archive/cathedral_walsh_exact_certificate_2026_10_31.py\` (fully symbolic) and \`research_archive/cathedral_h64_return_numeric_2026_10_31.py\` (64-state transfer test). Both were run successfully in the original derivation. The raw rank/spectrum \(12,8,19/5\) was previously recorded on Oct 25; the fresh result is its exact **time-composition memory** and positive lower bound.

## D. Exact energy-dependent elimination

For any Hermitian full history generator \(H=\begin{pmatrix}A&C\\C^\dagger&D\end{pmatrix}\) on H13⊕H51,
\[
P(zI-H)^{-1}P=[zI_{13}-A-C(zI_{51}-D)^{-1}C^\dagger]^{-1}
\]
whenever the inverses exist. Hidden return cannot be removed by prematurely replacing the full transfer by \(PTP\); that would change the physical spectral poles and residues.

## Scope

This is a **proved full-rank history-return theorem**, conditional on the stated geometric \(H_\lambda\), together with a positive semigroup uniqueness theorem conditional on composition. It is not yet a theorem selecting the source-loaded URT microscopic coupling, a physical gauge group/current/clock, a 3+1 spacetime continuum, gravity, or a volume-uniform interacting mass gap. The original 64-state Hilbert space and its H51 complement were *not* discarded. Reference: \`docs/CATHEDRAL_UNIFIED_FINITE_DYNAMICS_2026-10-25.md\` and \`docs/RELATIVE_HISTORY_GAUGE_FIRST_PRINCIPLES_2026-10-27.md\`.
