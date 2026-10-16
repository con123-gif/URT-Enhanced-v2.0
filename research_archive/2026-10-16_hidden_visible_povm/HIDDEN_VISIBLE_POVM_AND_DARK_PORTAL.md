# Newton’s Cathedral — exact hidden-to-visible quantum measurement, parity and dark-portal audit

**16 October 2026. Status:** New finite operator construction, with previous icosahedral_125_DEC_H64 and signed-face chirality identities retained. No fitted coefficients. Gravitational/dark-matter interpretations remain separately testable hypotheses. Independent executable: [hidden_visible_povm_check.py](hidden_visible_povm_check.py).

## 1. Retain the exact 4⊗4 identity and distinguish A5 from Ih

For the rotational icosahedral group A5, \(\chi_4=(4,0,1,-1,-1)\), so the off-quartet transition transforms as
\[
4\otimes4=1\oplus3\oplus3'\oplus4\oplus5.
\]
This proves that the abstract 16-dimensional transition representation contains one copy of every irrep in the twelve-vertex representation, plus a 4. It does **not** provide a canonical physical vertex map or a 25% dark-matter abundance.

The actual two hidden face quartets have opposite inversion parity: \(4_3=G_u\) and \(4_5=G_g\). Therefore **their inter-quartet product is entirely inversion odd**, whereas
\[
V_{12}=(1_g\oplus5_g)\oplus(3_u\oplus3'_u).
\]
For the full \(I_h\), the off-diagonal 16 alone cannot yield an ordinary linear equivariant isomorphism with all 12 vertices. The old signed-face **chirality operator W** is an *orientation-odd additional intertwiner*: its known nonzero fiveplet map is not contradicted by this statement, but must carry the sign of the orientation tensor and is distinct from an unsigned vertex-probability measurement.

## 2. A parameter-free 12-outcome POVM from the two hidden quartets

Let \(C\in\{0,1\}^{20\times12}\) be the face–vertex incidence matrix. Let \(H_3,H_5\in\mathbb R^{20\times4}\) be orthonormal bases of the genuine face-Laplacian eigenvalue-3 and eigenvalue-5 hidden kernels, and \(H=[H_3\ H_5]\in\mathbb R^{20\times8}\).

Define one 8×8 Hermitian measurement effect per visible vertex \(i\):
\[
\boxed{E_i=\frac13 H^\dagger\operatorname{diag}(C_{:i})H.}
\]
Every face has exactly **three vertices**, giving \(\sum_i C_{fi}=3\). Consequently,
\[
E_i\succeq0,\qquad \boxed{\sum_{i=1}^{12}E_i=I_8}.
\]
Thus \(p_i(\rho)=\operatorname{Tr}(\rho E_i)\) is a valid 12-outcome quantum measurement (POVM) on *any* normalized positive hidden state. No observed quantity or adjustable coefficient enters its construction; the factor 1/3 is fixed by triangle incidence.

For the pre-existing master Gibbs state
\[
\rho_*=(aI_4)\oplus(bI_4),\quad
a=\frac{1}{4(1+\Delta^2)},\
b=\frac{\Delta^2}{4(1+\Delta^2)},
\]
both quartet projectors have constant face diagonal \(1/5\). Hence
\[
\boxed{p_i(\rho_*)=\frac1{12}}\quad(i=1,\ldots,12).
\]
The vacuum visibly has uniform position probability, despite its highly unequal hidden quartet occupations. This is a concrete linear quantum-hidden to visible-probability dictionary; it is **not yet a spacetime metric or gravitational field**.

Numerical checks: POVM completeness Frobenius residual \(2.29\times10^{-15}\), minimum numerical effect eigenvalue \(\gtrsim-6\times10^{-17}\), uniform-probability error below \(10^{-16}\).

## 3. Real off-diagonal coherence supplies exactly six odd vertex modes

Define the real 12×16 bilinear incidence map
\[
B_{i,ab}=\sum_f C_{fi}(H_3)_{fa}(H_5)_{fb}.
\]
Direct computation gives
\[
\boxed{
BB^\top=\frac{5+2\sqrt5}{15}P_{3_u}
+\frac{5-2\sqrt5}{15}P_{3'_u}.
}
\]
Therefore \(\operatorname{rank}B=6\), its two nonzero singular triplets are \(\sqrt{(5\pm2\sqrt5)/15}\), and their ratio is \(\phi^3\). No scalar \(1_g\) or even \(5_g\) lies in the image of this parity-preserving, *unsigned-incidence* off-diagonal POVM map.

For the normalized Hermitian density tangent \(\delta\rho=2^{-1/2}\begin{psmallmatrix}0&Z\\Z^\top&0\end{psmallmatrix}\), \(Z\in\mathbb R^{4\times4}\), the visible response map is \(T_{35}=(\sqrt2/3)B\). Ten of the **16 real** off-diagonal directions are invisible to this specific first-order vertex-position measurement. For a general complex \(Z\), all 16 imaginary directions also have zero first-order vertex-position response; thus the 32-real-dimensional offdiagonal carrier has first-order measurement rank 6 and a 26D kernel. These are *measurement dark* directions, not proven gravitating dark matter.

The rank-4 \(A_5\) irrep is indeed one distinguished subspace in the kernel. However, the natural measurement's kernel also contains \(1\oplus5\) (parity selection); its effective invisible fraction is not universally 25%, and there are physically distinct observable maps such as the earlier signed-face chirality intertwiner. At second order, \(\mathrm{Sym}^2 4=1\oplus4\oplus5\), so symmetry ALLOWS a dark-quartet bilinear to source a visible even scalar or spin-2 mode. An actual coupling coefficient or gravitational interaction is not yet derived.

## 4. Complete 11-dimensional traceless visible response and BKM susceptibility

A Hermitian density change \(\delta\rho\) must satisfy \(\operatorname{Tr}\delta\rho=0\). The POVM is trace preserving, so \(\sum_i\delta p_i=0\). Thus **the uniform \(1_g\) is the fixed background probability**, and the visible *deformable* sector is the remaining \(3_u\oplus3'_u\oplus5_g\), dimension 11.

- Real symmetric intra-quartet changes provide the even \(5_g\); the \(4_g\) in each symmetric square stays unobserved by this POVM.
- Real inter-quartet coherence supplies the two odd triplets.
- The complete traceless real-Hermitian map has rank 11.

Now define a *precise* information-theoretic response model: the second-order Umegaki relative entropy at \(\rho_*\), penalized by the probe source \(-j^\top\delta p\). Its BKM quadratic metric has intra-quartet eigenvalues \(a^{-1}\), \(b^{-1}\), and normalized real offdiagonal value
\[
\chi_{35}=\frac{\log a-\log b}{a-b}
=8\eta_\Delta\frac{1+\Delta^2}{1-\Delta^2}.
\]
After imposing total-trace conservation and integrating out all real quadratic hidden tangent coordinates, the static **vertex probability-response operator** has the *exact* spectral form
\[
\boxed{
\mathcal R_{\rm vert}
=\left(\frac a{75}+\frac b{27}\right)P_{5_g}
+\frac{2(5+2\sqrt5)}{135\chi_{35}}P_{3_u}
+\frac{2(5-2\sqrt5)}{135\chi_{35}}P_{3'_u},
\qquad \mathcal R_{\rm vert}P_{1_g}=0.
}
\]

For the unaltered \(\Delta\) and \(\chi_{35}\), the three nonzero eigenvalues (with multiplicities \(5,3,3\)) are:
- **Even spin-2 response:** \(r_5=0.00333337005053\).
- **First odd triplet response:** \(r_3=0.00292551136297\).
- **Second odd triplet response:** \(r_{3'}=0.00016303316053\).

The triplet response ratio is EXACTLY \(\boxed{r_3/r_{3'}=\phi^6}\), since both share the same interquartet BKM metric. The relative Frobenius operator residual was \(3.19\times10^{-17}\). **This is a fixed, testable finite susceptibility**, not a fit to particle masses, gauge strengths or gravitational data.

The identification of probe \(j\) with a physical conserved source remains a separate dynamical task. By construction this is a probability-response kernel, not already an inverse-square force or Einstein equation.

## 5. Entropy and noise: preserve quantum positivity

The exact master entropy is
\[
S(\rho_*)=\log4+H_2\!\left(\frac{\Delta^2}{1+\Delta^2}\right).
\]
The baseline \(\log4=2\) bits follows from equal degeneracies; being an entropy term does not by itself prove it is topological entropy.

The scalar \(\chi_{35}\) acts uniformly on the normalized off-diagonal *BKM quadratic tangent*; it does not force an equipartition/white-noise bath. A Gaussian variance \(32/\chi_{35}\simeq0.66713\) interpreted directly as density-matrix perturbation magnitude exceeds the positivity-compatible total squared-norm cap \(8ab\simeq3.0980\times10^{-6}\) by a factor \(\sim2.15\times10^5\). That earlier positivity obstruction still applies to the unscaled Gaussian model, without negating a properly normalized completely positive quantum dynamics.

## 6. Physics programme enabled by this construction

The first new microscopic-to-observable component is now explicit and entirely intrinsic to finite Cathedral geometry:
\[
\text{hidden } \rho_*
\quad\xrightarrow{\text{incidence POVM}}\quad
\text{12 visible probabilities}
\quad\xrightarrow{\text{BKM susceptibility}}\quad
\text{exact }11\text{-mode response}.
\]

The next *physical* calculation must combine this vertex POVM with the previously verified orientation-odd signed-face chirality fiveplet map, the selected URT history transfer, and the massless scale-chain. Derive a conserved stress-energy source current and a gauge-protected field operator. Do not identify the \(4\) in \(4\otimes4\) with dark matter or use \(\dim4/\dim16\) as a measured density fraction.

**Source continuity:** This result extends (not replaces) the October 15 face/edge/125-DEC/H64 work, the prior signed-face chirality theorem, BKM and the original URT recursive dynamics. Do not retire earlier flavour or cosmological routes because of this local static measurement calculation.


## 7. Exact rational-matrix proof (independent of numerical diagonalization)

[Standalone SymPy exact certificate](hidden_visible_exact_certificate.py) reconstructs all 12 icosahedral vertices, 30 edges and 20 triangular faces from golden coordinates and checks the following identities by **exact symbolic matrix equality**, not floating-point tolerance.

Let \(L_F\) be the 20-face dodecahedral graph Laplacian, and \(I=I_{20}\). Its hidden-quartet projectors are the rational polynomials
\[
P_{4_3}=\frac1{30}L_F(L_F-2I)(L_F-5I)(L_F^2-6L_F+4I),
\]
\[
P_{4_5}=-\frac1{30}L_F(L_F-2I)(L_F-3I)(L_F^2-6L_F+4I).
\]
Both are exact rank-4 orthogonal projectors, are annihilated by \(C^\top\), and have precisely \(1/5\) on every face diagonal.

With \(\circ\) denoting entrywise (Hadamard) product, the *bilinear* hidden-to-vertex Gram matrix obeys the new polynomial identity
\[
\boxed{
C^\top(P_{4_3}\circ P_{4_5})C
=\frac{L_{\rm ico}(L_{\rm ico}-6I_{12})(L_{\rm ico}-7I_{12})}{60}.
}
\]
This yields the two exact nonzero eigenvalues \((5\pm2\sqrt5)/15\), each of multiplicity 3, directly from the pre-existing icosahedral Laplacian roots.

The even sector is certified independently:
\[
\boxed{
C^\top(P_{4_3}\circ P_{4_3})C=3P_0+\frac3{25}P_5,
}
\]
\[
\boxed{
C^\top(P_{4_5}\circ P_{4_5})C=3P_0+\frac13P_5.
}
\]
Here \(P_0=\mathbf1\mathbf1^\top/12\) and \(P_5=-L_{\rm ico}(L_{\rm ico}^2-10L_{\rm ico}+20I)/24\).

All five claims passed exact symbolic equality in the local run, taking ~0.05 seconds for the matrix checks after constructing the finite combinatorics. These identities provide the precise mathematical foundation for the 12-outcome POVM and the three positive BKM response bands, without fitting any spectral constant.
