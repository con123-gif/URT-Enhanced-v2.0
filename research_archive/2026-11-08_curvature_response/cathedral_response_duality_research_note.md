# Newton's Cathedral: Sharp Energy-Dual Response and Hidden-History Stability

**Research note — 8 November 2026**  
**Status:** exact statements for the explicitly defined finite linear operators, with numerical checks. **No claim** of a continuum Yang–Mills gap or experimental parameter prediction. Independent mathematical development using standard finite Hodge/spectral theory.  
**Attribution:** The energy–dual pseudoinverse inequality was shared by the user as part of the Yang–Mills work of **James Montgomery Lockwood**. Its mathematical basis is the standard Cauchy–Schwarz inequality in the spectral energy norm; neither this identity nor Lockwood's constrained-block gauge analysis is claimed as a new discovery of Newton's Cathedral. The Cathedral calculations here are independent and use no source code or proof text from Lockwood or his collaborators. See the full bibliographic citation below.

## Credit, provenance and primary citation

**James Montgomery Lockwood** is explicitly acknowledged for his contributions to constrained-cube/forest-gauge analysis, code and Lean 4 formalisation, and multiscale metric composition in the joint Yang–Mills project, as described in the paper's contributor statement. The other listed contributors are **Deep Bhattacharjee, Ushashi Bhattacharya and Tristan Romanov**. See **[1]**. The supplied forest-gauge block Poincaré claim is

\[\|d\varphi\|^2 \ge \frac{537}{5000}\|\varphi\|^2,\]

for the *specified constrained link fields*, not for arbitrary fields. Its exact constant and assumptions have not been independently certified in this note. The separate sharp energy–dual pseudoinverse inequality below is a classical Hilbert-space Cauchy–Schwarz identity, **highlighted in the material attributed to Lockwood**, not asserted to be originally invented by him.

This note acknowledges the research motivation and is **not coauthored or endorsed by those researchers**. Our original finite Platonic/24-track constructions and numerical tests are mathematically distinct. No third-party research source, proof or code is reused.

## 1. The supplied sharp duality theorem

For a finite reversible generator `L` on the mean-zero subspace of a probability space `(Ω,ν)`, with `L=L*≥0` and `ker L=span{1}`, for mean-zero κ and any observable `F`,

\[
|\langle\kappa,F\rangle_\nu|^2\leq
\langle\kappa,L^\dagger\kappa\rangle_\nu
\langle F,LF\rangle_\nu.
\]

Proof: project `F` off the constants and write the pairing as `⟨L^{-1/2}κ,L^{1/2}F⟩`; apply Cauchy–Schwarz. Equality is attained for `F=L†κ` plus an arbitrary constant; more generally the two vectors may be proportional. The sharp source-specific coefficient is

\[
\chi_L(\kappa)^2=\langle\kappa,L^\dagger\kappa\rangle_\nu
=\sum_{j>0}\frac{|\langle\kappa,e_j\rangle_\nu|^2}{\lambda_j}.
\]

In particular, a uniform all-observable bound `χ²≤C||κ||²` is equivalent to a uniform spectral gap `λ_1≥1/C`; for a specified family of sources `κ_s`, uniform response is strictly weaker than a uniform spectral gap.

## 2. Exact Cathedral finite curvature response

For each Platonic surface complex, let `d0:C0→C1`, `d1:C1→C2` be unit-weight oriented coboundaries with `d1 d0=0`. Their direct sum has cochain dimensions `(50,90,50)` and co-closed edge space

\[
\mathcal V=\ker d_0^* =\operatorname{im}d_1^*,\qquad\dim\mathcal V=45.
\]

The equality follows from `H^1(S²)=0` on each component. On `V`, define `K=d1* d1`. Its smallest eigenvalue is the dodecahedral dual-graph eigenvalue `μ=3−√5≈0.763932022500`, multiplicity three. Hence

\[
\boxed{\quad |\langle J,F\rangle|^2\le
\langle J,K^{-1}J\rangle \langle F,KF\rangle,
\qquad\chi_K(J)^2\le\frac{\|J\|^2}{3-\sqrt5}.\quad}
\]

Both bounds are sharp: take a nonzero `J` from the 3D lowest eigenspace and `F=K^{-1}J`. A unit source gives exact maximal response

\[
\boxed{\sup_{\|J\|=1}\chi_K(J)^2=\frac{1}{3-\sqrt5}=\frac{3+\sqrt5}{4}
=1.309016994375\ldots.}
\]

The `K` space has no constants left after co-closed projection, so the inverse is ordinary; this is *not* a claim that the full unprojected 90D edge curl operator has no kernel. That latter claim would be false because all nonzero exact gradients have zero curl.

## 3. 24-track covariant extension

Let `F_j∈V`, `j∈Z/24`, and `U_j:V→V` be arbitrary orthogonal maps. For `τ≥0`, set

\[
\mathcal E_{24}(F)=\sum_j\langle F_j,KF_j\rangle
+\tau\sum_j\|F_{j+1}-U_j F_j\|^2.
\]

Because the second term is nonnegative, `K_24≥μI` for the `24·45=1080` dimensional track field. Thus the *same sharp universal upper bound* holds for unit sources,

\[
\chi_{K_{24}}(J)^2=\langle J,K_{24}^{-1}J\rangle\le 1/\mu.
\]

The universal constant cannot be improved across all possible transports because `U_j=I` admits track-constant lowest curvature modes. There is no commutation requirement between each `U_j` and `K` for this inequality.

For an **additional model** in which every link rotates a 2D lowest curvature eigenspace by the fixed golden angle `θ=2π/φ²` and `τ=1`, the track helices have eigenvalues

\[
\lambda_m=\mu+4\sin^2\left(\frac{2\pi m/24-\theta}{2}\right),\quad m=0,\ldots,23.
\]

The lowest such value is at `m=9`:

\[
\lambda_9=0.765847419254\ldots,\qquad\chi^2_{\text{unit helical source}}=1/\lambda_9=1.305743121749\ldots.
\]

This helical result holds for the specified invariant two-dimensional rotation sector; it is not a claim that arbitrary Wilson transports commute with the curvature operator.

## 4. The hidden-history interaction threshold: a rigorous *conditional* result

A geometric and hidden quadratic action has Hessian

\[
M=\begin{pmatrix}K&B\\B^*&H\end{pmatrix},\qquad K\succeq\mu I,\quad H\succeq hI,\quad\|B\|\le b.
\]

Assuming the hidden zero modes are properly removed so `h>0`, complete the square or eliminate the hidden field. The geometry Schur complement obeys

\[
S=K-BH^{-1}B^*\succeq\left(\mu-\frac{b^2}{h}\right)I.
\]

Therefore, **whenever** `b²<μh`, the full Hessian is positive and every geometry source has the response estimate

\[
\boxed{\chi_{\mathrm{geo}}(J)^2
=\langle J,S^{-1}J\rangle
\le\frac{\|J\|^2}{\mu-b^2/h}.}
\]

This is an implication, not a necessary condition for positivity of general `M` (a particular coupling can remain stable beyond this conservative norm threshold). Equality is attained in an explicitly constructed rank-one model coupling a lowest geometric eigenvector to a lowest hidden eigenvector.

For the established Cathedral finite hidden levels `(3,5)`, `h=3` gives

\[
b_{\rm crit}=\sqrt{3(3-\sqrt5)}=1.513867916134\ldots.
\]

Computed exact rank-one responses for normalized geometric eigen-source:

| Cross-block norm `b` | Schur eigenvalue `μ−b²/3` | Response `1/(μ−b²/3)` |
|---:|---:|---:|
| 0 | 0.763932022500 | 1.309016994375 |
| 1.0 | 0.430598689167 | 2.322347989342 |
| 1.4 | 0.110598689167 | 9.041698482440 |
| 1.5 | 0.013932022500 | 71.777087639996 |

**Interpretation:** a positive geometric gap does not by itself bound the source-loaded coupled response, unless the hidden gap and cross-coupling have an appropriate uniform quantitative bound. The physical `B` is *not identified* by these rank-one examples. The statement also applies to the 1080-dimensional 24-track geometric operator because its minimum remains `≥μ`, provided its full hidden coupling obeys the same norm and positivity hypotheses.

## 5. Exact counterexample: equilibrium Gibbs weights do not determine relaxation rates

The frozen Cathedral Gibbs marginal fixes

\[
p_5=\frac{\Delta^2}{1+\Delta^2},\quad p_3=\frac{1}{1+\Delta^2},\quad \Delta=\frac{3}{20}-\frac{80\pi}{1053\phi}.
\]

For **every** `c>0`, the two-sector reversible Markov generator

\[
L_c=c\begin{pmatrix}p_5&-p_5\\-p_3&p_3\end{pmatrix}
\]

is self-adjoint in the `ν=(p3,p5)` inner product, satisfies detailed balance and has precisely the same stationary marginal, but its nonzero eigenvalue is `c`. For `κ=(-p5,p3)` with zero `ν`-mean,

\[
\boxed{\chi_{L_c}(\kappa)^2=\frac{p_3p_5}{c}.}
\]

Thus `c→0` gives arbitrarily large susceptibility while the master state and all its fixed probabilities remain unchanged. This is an exact finite counterexample to inferring a physical response/mixing rate from the KMS probabilities alone.

## 6. The source-overlap test: uniform response without a uniform gap

For a scale-indexed family `(L_a,J_a)` on its admissible centred subspace, **the exact test** is

\[
\boxed{\sup_a \chi_{L_a}(J_a)^2
=\sup_a\sum_{\lambda_j(a)>0}
\frac{|\langle J_a,e_j(a)\rangle|^2}{\lambda_j(a)}<\infty.}
\]

A scale-independent spectral lower bound is sufficient, not necessary for the specified sources. Example: `L_ε=diag(ε,1)`, `J_ε=(sqrt(ε),1)` gives `χ²=2` at every `ε>0`, while the gap tends to zero. The fixed source `(1,1)` yields `χ²=1+1/ε→∞`. Therefore the source's projection onto slow modes is *as important as* the spectral gap.

For a continuous-time reversible semigroup,

\[
\chi_L(J)^2=\int_0^\infty\langle J,e^{-tL}J\rangle\,dt
\]

whenever `J` is orthogonal to the kernel and positive spectrum is present. This converts the Wilson-fibre challenge into a bound on an **integrated source-loaded time correlation**. A discrete positive transfer `T` can analogously use `L=I−T` only when the correct source and centred contractive subspace have been derived; `L=−\log T` gives a different relaxation normalization.

## 7. What needs checking for interacting Wilson fibres

1. **Identify the actual** finite-volume, gauge-fixed Wilson-fibre generator `L_{Λ,a,g}` and its invariant measure `ν_{Λ,a,g}`; verify nonnegative self-adjointness/Markov properties, admissible kernel and proper source currents. Do not substitute `d1*d1` for it without a proved map.
2. Compute/estimate the actual source overlaps with slow modes across graph size `Λ`, lattice spacing `a`, and coupling `g`. For all-current uniformity, prove a uniform gap. For a physically specified current, proving uniform integrated spectral overlap may suffice for that response bound.
3. Relate (and quantify) the true H13⊕H51 history, 24-track and 190D geometry interaction blocks; a candidate Schur bound requires positive hidden Hessian after quotient and **uniform** `b²/h` strictly below the geom gap. Generic interacting/non-Gaussian Gibbs measures need a separate generator/Dirichlet-form argument: the quadratic Hessian calculation cannot simply be declared an interacting quantum mass gap.
4. Keep **finite-cell coercivity**, **uniform scaling estimates**, **nontrivial 4D continuum field theory**, and **physical mass gap** as distinct claims.

## 8. Reproducibility

Run `python cathedral_response_duality_verify.py` (requires NumPy, SciPy and NetworkX). It independently constructs the five exact oriented cochain systems, checks topology and the 45D spectra; verifies 100 random Cauchy–Schwarz duality inequalities and equality; computes the 24-track helical response; checks Schur-bound saturation in 53D coupled matrices; demonstrates the fixed-Gibbs-variable-rate counterexample and the vanishing-source-overlap example.

**Verification at creation:** all checks passed on 8 November 2026. No GitHub changes were made.

## References

**[1]** Deep Bhattacharjee, Ushashi Bhattacharya, **James Montgomery Lockwood**, and Tristan Romanov (2026), *One Cube Estimate Implies the Yang--Mills Mass Gap*, Hexagon preprint **2610.00341v7**. https://hexagonmath.org/2610.00341v7. Consult the source's contributor/provenance statement for Lockwood's credited sections; the paper states that the continuum-tuning estimate and nontrivial continuum limit remain open.

**Source note for supplied dual inequality:** formula attributed by the user to the Lockwood Yang--Mills research programme on 8 November 2026; no separate primary publication location for that exact displayed formula has been independently located. The identity is independently justified in §1 of this note using Cauchy--Schwarz.
