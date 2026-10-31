# Cathedral/H64 — exact non-Markovian history equation and two-sided memory bounds

2026-10-31. Applies to the original six-axis 64-state Walsh kinetic \(H_8\) and its previously constructed icosahedral geometry coupling \(H_\lambda=H_8+\lambda Q\). It is a **finite-history theorem**; physical selection of \(\lambda Q\) and the spatial continuum remain to be derived from the actual source-loaded \(T_*\).

## The exact elimination

Write the native decomposition H64=H13⊕H51, with H13=2·1⊕3⊕3'⊕5, and block-decompose the real symmetric generator
\[
H_\lambda=\begin{pmatrix}A&C\\C^\top&D\end{pmatrix}.
\]
For the complete Euclidean history evolution \(\partial_t(u,w)=-H_\lambda(u,w)\), with **initial hidden amplitude \(w(0)=0\)**, the hidden equation integrates exactly:
\[
w(t)=-\int_0^t e^{-(t-s)D}C^\top u(s)\,ds.
\]
Substitution into the visible equation proves the exact, nonlocal equation
\[
\boxed{\dot u(t)=-Au(t)+\int_0^t M(t-s)u(s)\,ds,\qquad M(t)=Ce^{-tD}C^\top.}
\]
No expansion or Markov closure is used. With general \(w(0)\) an extra forcing term \(-Ce^{-tD}w(0)\) appears.

## Strict positivity and quantitative bounds — proven for all t≥0

Because the original H8 is diagonal in Walsh degree, its restricted hidden spectrum is exactly
\[
\operatorname{spec}(RH_8R|_{H51})=10^{(6)}\oplus16^{(25)}\oplus18^{(20)}.
\]
The original icosahedral geometry gives \(6-2\sqrt5\le Q(s)\le6+2\sqrt5\) on all 64 histories. For \(\lambda\ge0\), the hidden block satisfies
\[
d_-I\preceq D\preceq d_+I,\qquad
d_-=10+\lambda(6-2\sqrt5),\quad
d_+=18+\lambda(6+2\sqrt5).
\]
The Oct 31 exact algebraic return certificate gives
\[
CC^\top=\lambda^2G,\qquad \operatorname{spec}(G)=12^{(2)}\oplus8^{(6)}\oplus(19/5)^{(5)}.
\]
Since \(e^{-td_+}I\preceq e^{-tD}\preceq e^{-td_-}I\), matrix order and \(CC^\top\) imply the exact, nonperturbative bounds
\[
\boxed{\frac{19}{5}\lambda^2e^{-td_+}I_{13}\preceq M(t)
\preceq12\lambda^2e^{-td_-}I_{13}\qquad (t\ge0,\ \lambda>0).}
\]
In particular **all 13 visible channels retain positive hidden-history memory at every finite time**.

Integrating the memory kernel produces the static positive Schur contribution
\[
\int_0^\infty M(t)\,dt=CD^{-1}C^\top,\quad
\boxed{\frac{19\lambda^2}{5d_+}I\preceq CD^{-1}C^\top
\preceq\frac{12\lambda^2}{d_-}I.}
\]
The associated exact visible resolvent is \([z-A-C(z-D)^{-1}C^\top]^{-1}\), as previously established by the native H64 Feshbach programme.

The lower bound is nonzero for every \(\lambda>0\) and makes no appeal to chosen energies or experimentally measured quantities. At \(\lambda=0\), the hidden coupling vanishes, as it must.

## Independent execution

\`research_archive/cathedral_h64_memory_nonperturbative_2026_10_31.py\` builds the full H64 history matrix and the native H13 projectors directly from the six antipodal icosahedral axes, checks H51 dimension and spectral bounds, evaluates \(M(t)\) for t=0, .05, .5, 2, and integrates the exact 64-state system to verify the convolution equation. Two test couplings are \(\lambda=\Delta\) and \(\lambda=1\); neither is asserted to be a physical choice. Both pass all bounds and reproduce the full 64-history time derivative to residual <4×10^-15.

**What this solves:** the exact 13/51 visible-hidden dynamic reduction and its strictly positive history-memory response for the existing \(H_8+\lambda Q\) candidate. **What it does not solve:** deriving \(\lambda Q\) and the actual source-loaded \(B_*\) from primordial URT, selecting the physical 24-clock, 3+1 spatial refinement, matter currents, gravity or a volume-uniform quantum field mass gap.
