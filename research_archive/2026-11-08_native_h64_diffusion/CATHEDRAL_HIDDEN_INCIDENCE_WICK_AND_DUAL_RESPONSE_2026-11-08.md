# Newton's Cathedral — exact hidden-incidence Wick centring and source susceptibility

**Date:** 8 November 2026. **Status:** exact finite combinatorial theorem, analytic Gaussian moment theorem, and verified 120,000-sample independent regression, using the **original 7 November five-solid/64-history source matrices**. No imported Yang–Mills source/proof and no observed parameters fitted. Verifier: `cathedral_hidden_wick_exact_2026_11_08.py`.

## 1. Face intersections force a new exact hidden-spectrum identity

Let `C` be the original 20-by-12 unsigned incidence matrix from icosahedral vertices to triangular faces. Let `S=CC^T`. Its entry `S_fg` counts common vertices of faces `f,g` and belongs to `{0,1,2,3}`. For distinct faces `S_fg=2` exactly when the faces share a full edge; the diagonal has `S_ff=3`. Write `Adual` for the dual dodecahedral face-adjacency matrix.

For the possible values `k` the elementary identity `k²=k+2 1_{k=2}+6 1_{k=3}` holds. Applying this entrywise gives the **exact integer-matrix identity**

\[
\boxed{(CC^T)\odot(CC^T)=CC^T+2A_{\rm dual}+6I_{20}.}
\]

The actual hidden projector `Ph=I-C(C^TC)^{-1}C^T=P3+P5` satisfies `Ph C=0`. Since `Lface=3I−Adual`, on its hidden quartet subspaces `Lface P3=3P3` and `Lface P5=5P5`. Multiplying by `Ph` on both sides yields

\[
\begin{aligned}
Ph[(CC^T)\odot(CC^T)]Ph
 &=Ph(6I+2A_{\rm dual})Ph\\
 &=Ph(12I-2L_{\rm face})Ph\\
 &=\boxed{6P_3+2P_5}.
\end{aligned}
\]

Therefore the **squared-incidence operator**, though nonlinear in its entries, acts as exactly `6` on the rank-four hidden-3 sector and `2` on the rank-four hidden-5 sector. This comes solely from the triangular face intersections, without assuming a continuum, fitting a measured mass, or replacing the full Cathedral geometry.

## 2. Automatic Wick centring for an A5-symmetric Gaussian vertex reference

Take any mean-zero real Gaussian vertex vector `x∈R^12` with `A5`-invariant covariance `Σ`. Define face signal `z=Cx` and hidden quadratic source

\[
h=P_h(z\odot z),\quad h_3=P_3(z\odot z),\quad h_5=P_5(z\odot z).
\]

Face transitivity implies the 20 diagonal entries of `CΣC^T` are equal, say `v`. Thus `E[z_f²]=v` for each face, and because `Ph 1_20=0`,

\[
\boxed{E[h]=P_h E[z\odot z]=vP_h1_{20}=0.}
\]

Even pointwise at finite ultraviolet cutoff, the Gaussian Wick subtraction `:z_f²:=z_f²−E[z_f²]` becomes redundant **after hidden projection**:

\[
\boxed{P_h:z^2:=P_h(z^2).}
\]

This identity applies to any symmetry-preserving Gaussian covariance, including one whose common local variance diverges under refinement. It cancels the **mean/tadpole of the quadratic source**, not its variance or all counterterms in the interacting 4D theory.

## 3. Exact hidden-source covariance and energy–dual response

For the explicit isotropic Gaussian reference `x∼N(0,σ²I12)`, face covariance is `V=σ² CC^T`. Wick's Gaussian moment identity gives

\[
\operatorname{Cov}(z_f^2,z_g^2)=2V_{fg}^2.
\]

Consequently the just-proved hidden spectral identity gives

\[
\boxed{\operatorname{Cov}(h)=2σ^4 Ph[(CC^T)\odot(CC^T)]Ph
=12σ^4P_3+4σ^4P_5.}
\]

Since both projectors have rank four,

\[
\boxed{E\|h_3\|^2=48σ^4,\quad E\|h_5\|^2=16σ^4.}
\]

Retain the original *positive* modular history amplitude `Bhid=P3+ΔP5`, `Δ=3/20−80π/(1053φ)`, and dual-face Laplacian `Lface P3=3P3`, `Lface P5=5P5`. The exact energy–dual susceptibility of the weighted hidden source is

\[
\boxed{
E\langle B_{\rm hid}h,L_{\rm face}^{\dagger}B_{\rm hid}h\rangle
=16σ^4+\tfrac{16}{5}\Delta^2σ^4.
}
\]

This directly connects the *same* face incidence, hidden spectrum, Gibbs rail and energy–dual response principle to a computed source susceptibility. The mathematical energy–dual inequality is standard spectral Cauchy–Schwarz and was highlighted in work shared from James Montgomery Lockwood's Yang–Mills programme; the separate original forest-gauge proof/code is neither imported nor claimed here.

For the already specified **static, zero-clock** native 64-history Schur-complement contact

\[
V_{\rm eff,source}=\frac29\|h_3\|^2+\frac7{32}\Delta^2\|h_5\|^2,
\]

this gives the exact Gaussian-reference expectation

\[
\boxed{E[V_{\rm eff,source}]
=\left(\frac{32}{3}+\frac72\Delta^2\right)σ^4
=10.666688352897882\ldots\;σ^4.}
\]

No physical particle mass or scattering strength is assigned to this dimensionless finite-model expectation.

## 4. What the ultraviolet mechanism actually does

The source is automatically centred for a symmetry-preserving Gaussian covariance, which removes a linear history-source tadpole of the form `y·E[h]`. However `E||h||²=64σ^4` in the isotropic reference. A four-dimensional free-field local variance `σ²(Λ)` typically grows with the ultraviolet cutoff. Therefore the source fluctuations themselves require distributional renormalisation in an interacting quantum continuum. **The exact face projection removes an unwanted mean, not the higher source fluctuations.** This distinction prevents a spurious claim that a local Hodge gap or finite Gaussian covariance proves an interacting Yang–Mills mass gap.

## 5. Reproduction, full-Cathedral provenance and credit

From the original joint-model directory (the original Python script remains unchanged), run

```bash
OPENBLAS_NUM_THREADS=1 python cathedral_hidden_wick_exact_2026_11_08.py
```

The verifier imports the original `cathedral_constructed_joint_dynamics_2026_11_07.py`, checks all exact matrix identities, `Ph 1=0`, a nontrivial A5-invariant vertex covariance `Σ=I+0.1 Aico`, the exact Gaussian 3/5 covariance, the weighted inverse-Laplacian susceptibility, and 120,000 random independent Gaussian samples (0.0106862 relative covariance-matrix error). The saved log includes source SHA256 hashes. The five-solid 190-cochain, native H64 and 24-clock sectors are retained in the source; this calculation isolates only one **exact source submechanism**.

**Attribution:** James Montgomery Lockwood and coauthors Deep Bhattacharjee, Ushashi Bhattacharya, Tristan Romanov, *One Cube Estimate Implies the Yang–Mills Mass Gap*, Hexagon 2610.00341v7 (2026), https://hexagonmath.org/2610.00341v7, are credited for their separate inspiring constrained-gauge/response programme. No other researchers' original material was copied into the Cathedral source.