# Newton’s Cathedral / URTF — A symmetry-compiled analytical solver

**Local research result — 15 October 2026. No GitHub changes.**

## Result in one sentence

The 64-state augmented icosahedral cell carries **four copies of each of the five real irreducible representations of the proper icosahedral rotation group**. Therefore, **every invertible 64×64 operator commuting with those rotations has an inverse expressible as five cubic polynomials in the same operator**. The inverse coefficients are obtained directly from four traces per symmetry sector, with no root search or iterative minimization. Certain localized species/defect couplings can be appended through exact Woodbury corrections, and nearest-stage arrays of these cells admit direct O(number of stages) recurrences once the fixed cell is preprocessed.

This is a genuine reusable consequence of representation theory, Cayley–Hamilton, and the Cathedral’s recovered incidence geometry. It is **not** evidence that the golden angle or π/e alone universally optimizes arbitrary systems, nor that the chosen quadratic action is the unique physical action of nature.

## Mathematical theorem

On the augmented chain H64 = R ⊕ C0 ⊕ C1 ⊕ C2 ⊕ R, of dimensions 1+12+30+20+1, the 60 proper icosahedral rotations act by *signed permutations* on the oriented edge and face cells and by ordinary permutations on vertices. Direct character projection gives the rank-4,12,12,16,20 orthogonal isotypic projectors

\[
P_r=\frac{d_r}{60}\sum_{g\in A_5}\chi_r(g)U_g,
\qquad d_r\in\{1,3,3,4,5\}.
\]

All five satisfy P_r²=P_r, sum_r P_r=I64, and all commute with the cellular boundary operator. The representation identity is

\[
\boxed{\;H_{64}\cong4(1\oplus3\oplus3'\oplus4\oplus5).\;}
\]

By real Schur decomposition (every A5 irrep appearing here is of real type), any commuting linear map K acts on each sector as I_{d_r}⊗M_r with M_r a 4×4 matrix. It need **not** commute with the uncoupled cellular Laplacian; it must only commute with the 60 group actions.

For j=1,…,4, compute

\[
q_{j,r}=\frac{\operatorname{Tr}(P_rK^j)}{d_r}
=\operatorname{Tr}(M_r^j).
\]

Use Newton's identities (with e_0=1) to get elementary symmetric coefficients

\[
e_{k,r}=\frac1k\sum_{j=1}^k(-1)^{j-1}e_{k-j,r}q_{j,r}, \quad k=1,2,3,4.
\]

The 4×4 characteristic polynomial is t⁴−e₁t³+e₂t²−e₃t+e₄. If det K≠0, then e₄≠0 and Cayley–Hamilton gives **without diagonalizing K**

\[
\boxed{K^{-1}b
=\sum_{r}P_r\frac{e_{3,r}b-e_{2,r}Kb+e_{1,r}K^2b-K^3b}{e_{4,r}}.}
\]

Thus **three applications of K per new right-hand side** plus the symmetry projectors suffice after coefficients have been computed. Determinants are likewise obtained from five numbers:

\[
\boxed{\det K=\prod_r e_{4,r}^{d_r}.}
\]

This theorem is an application of classical Schur and Cayley–Hamilton methods to a newly explicit operator presentation of the Cathedral; the underlying mathematical machinery is not a new general theorem.

### Assumptions and complexity

- K must preserve the complete specified **proper A5** rotation action; the method does not assume inversion symmetry or an uncoupled block structure.
- The **multiplicity four** is what bounds the polynomial degree by three. Different representations/multiplicities require different degrees. A large unrestricted operator does **not** have fixed complexity from π/e or the golden angle.
- Precomputing the exact rotation action, projectors and four trace moments costs work. For this fixed 64-cell, that work is one-time. For sparse bounded-degree extensions with a fixed-size group, projector application via signed permutations can be linear in the number of cells. Generic dense K matvecs are **not** O(N).
- The displayed polynomial can be poorly conditioned for matrices near singularity or with extreme spectral scales; the local tests use positive-definite, well-conditioned examples.

## Actual coupled 64-state experiment

Using the audited 64-state Dirac D64, vertex–face incidence C and 20-face orientation-signed matrix W, construct an explicit Hermitian positive quadratic test operator

\[
K_0=I+\eta_\Delta D_{64}^2/20
+\Delta\bigl[B_{\mathrm{vertex\!:\!face}}+iW_{\mathrm{face}}\bigr].
\]

Here B is symmetric with blocks C/√3 and Cᵀ/√3; W is real skew-symmetric on the 20-face block, so iW is Hermitian. The two additions do not jointly commute with D64², but they preserve proper rotational A5 symmetry. This **placement of the couplings is an ansatz** for mathematical stress testing, not a derivation of the full Standard Model, gravitational, or flavour action.

- Full group set reconstructed: 60 proper rotations, class order counts (1,15,20,24) at orders (1,2,3,5).
- Representation ranks: 4, 12, 12, 16, 20.
- K0 eigenvalue range: 1.2289864775 to 6.9958109042, so the quadratic objective is strictly convex.
- Cubic inverse vs. dense 64×64 solve: relative equation residual **3.34×10⁻¹⁵** (URTF-forced RHS) and **4.07×10⁻¹⁵** (independent complex RHS).
- Independent dense generic A5-equivariant Hermitian positive operator: relative residual **2.33×10⁻¹⁵**.
- The full determinant formula using five 4×4 characteristic coefficients also matches the direct log-determinant to floating-point tolerance (see JSON).

The five 4-dimensional multiplicity operators have up to 4 distinct roots each (4,4,4,2,4 in this specific experiment). None of those roots need be calculated to apply the inverse.

## An exact route for symmetry-breaking and species couplings

If a physical (or proposed) interaction changes K0 through a known rank-r update, Kf=K0+UV†, the Woodbury identity reads

\[
K_f^{-1}=K_0^{-1}-K_0^{-1}U\bigl(I_r+V^\dagger K_0^{-1}U\bigr)^{-1}V^\dagger K_0^{-1}.
\]

Only a small r×r correction is needed, with K0 inverse supplied by the cubic compiler. A deliberately rank-four charge-word defect, which **breaks the A5 symmetry**, gives:

- Incorrect use of the uncorrected cubic inverse: residual **7.01×10⁻⁴**.
- Exact rank-four Woodbury repair: residual **3.26×10⁻¹⁵**.

For the existing (still physically unverified) *actual four species-loaded geometric H64* candidate, the dressed edge perturbation is factorized via a 64×12 frame F and a 12×12 Yukawa block J_f:

\[
D_f=D_0+FJ_fF^\top.
\]

For any z away from the base poles,

\[
\boxed{\det(zI-D_f)=\det(zI-D_0)\det\bigl(I_{12}-J_fF^\top(zI-D_0)^{-1}F\bigr).}
\]

At z=6, all four (u,d,e,nu) dressed resolvents are reproduced from a **12×12 correction**, with relative residuals approximately 4.15–4.22×10⁻¹⁵ and log-determinant identities matching to ~10⁻¹⁴. This is an exact algebraic reduction of that candidate H64—not a derivation of physical masses, CKM or PMNS mixing. The previous golden bridge in that candidate was nonunitary and still requires physical derivation.

## Many-stage URTF: the O(N) use case

Let x_0,…,x_{m−1}∈C⁶⁴ be a stack of Cathedral cell states and specify a nearest-stage quadratic functional

\[
\mathcal E=\frac12\sum_{k=0}^{m-1}x_k^\dagger K_0x_k
-\beta\sum_{k=0}^{m-2}\operatorname{Re}(x_k^\dagger x_{k+1})
-\operatorname{Re}\sum_k f_k^\dagger x_k.
\]

Set β=1/4 (the pre-existing microscopic-selector value) **as a coupling choice in this test** and take URTF scale/phase forcing

\[
f_k=\kappa^{k-(m-1)}\bigl[\cos(k\theta)f_A+\sin(k\theta)f_B\bigr],
\quad\kappa=\pi/e,\quad\theta=2\pi/\phi^2.
\]

The Euler–Lagrange system is exactly block tridiagonal, with K0 on the diagonal and −βI64 on both neighbouring diagonals. K0 is positive with minimum eigenvalue >2β, so the full functional is strictly convex, with a unique minimizer.

Diagonalize the **fixed 64-cell block once** (or equivalently work within the five A5 representation multiplicity blocks). For each spectral mode λ, the remaining m-stage system has the direct Schur/Thomas recursion

\[
\begin{aligned}
 d_0&=\lambda,\quad w_0=f_0,\\
 d_k&=\lambda-\beta^2/d_{k-1},\\
 w_k&=f_k+\beta w_{k-1}/d_{k-1},\\
 y_{m-1}&=w_{m-1}/d_{m-1},\\
 y_k&=(w_k+\beta y_{k+1})/d_k.
\end{aligned}
\]

There is no iterative convergence threshold, line search or trial-and-error search. The per-stage work is bounded for fixed 64-state cell. **As a function of stage count, the method is O(m).** This includes fixed-width block-tridiagonal physical discretizations, not arbitrary nonlocal all-to-all systems.

| URTF–Cathedral stages | Unknown complex amplitudes | Relative residual, direct recurrence |
|---:|---:|---:|
| 13 | 832 | 1.81×10⁻¹⁵ |
| 64 | 4,096 | 1.80×10⁻¹⁵ |
| 125 | 8,000 | 1.79×10⁻¹⁵ |
| 500 | 32,000 | 1.81×10⁻¹⁵ |

For 13 stages, independent sparse-direct factorization agrees with the recurrence to ~1.94×10⁻¹⁵. The runtime measurements in JSON are illustrative, too short/noisy to establish an empirical scaling law by themselves; the O(m) claim follows from the number of recurrence operations.

## What this does and does not find

**Found:** a reusable mathematical *compiler* that maps (i) a known group action, (ii) an equivariant linear operator, (iii) optionally a finite-rank symmetry-breaking update, and (iv) a locally coupled history chain into a small set of algebraic operations. It works on arbitrary forcings, including URTF boundary-generated and golden-phase forcings. No experimental observable was adjusted to make the residual vanish.

**Not found:** the unique physical action/coupling that makes every Cathedral sector descend from its microscopic T_star; spacetime Einstein canonical energy, gauge connection/force strengths, observed particle masses, or proof of the solar-system entanglement hypothesis. The fast inverse relies mainly on **A5 symmetry and fixed representation multiplicities**; URTF supplies organized phase, scales and boundary histories, not the validity of the inverse formula itself. The method is standard exact operator algebra applied to this particular Cathedral architecture.

## Run the tool locally

Requires Python 3, NumPy and SciPy. All files below are local, no GitHub tools used.

```
python URTF_Cathedral_symmetry_compiler_LOCAL.py
```

Files: `URTF_Cathedral_symmetry_compiler_LOCAL.py`, `cathedral_operator_audit.py`, `cathedral_strict_64_closure.py` and the output `URTF_Cathedral_symmetry_compiler_results_LOCAL.json`. The zipped local research package includes these and the report.