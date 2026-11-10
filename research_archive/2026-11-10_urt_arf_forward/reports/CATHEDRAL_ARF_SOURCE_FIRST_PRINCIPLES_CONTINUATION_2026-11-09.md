# Newton's Cathedral — original-source ARF derivation continuation

**9 November 2026.** Scope: retain all five original Platonic cellular complexes (190 cochains; 50 vertices), the unmodified 7 November nonlinear `Hbits` 64-history source, the 24-clock, and the distinct unmodified 29 October coupled `K64` operator. This report *does not assume or feed in the historical four ARF coefficients*. No GitHub or Library mutations.

## Result A. The source-preserving two-history intertwiner is now explicit

Let `C` be the original unsigned 20×12 icosahedral face-vertex incidence; `L_F` its native face Laplacian; `P_h=P_3+P_5` its eight-dimensional incidence kernel, with each `P_j` rank four. The original six-bit history map `U_h` obeys

\[
 U_h^TU_h=P_h,\qquad (21I-H_{\rm bits})U_h P_h=U_h L_F P_h.
\]

Let `K64` be the *distinct* original coupled 12+12+20+20 history operator. After explicitly reconciling the two original files' icosahedral vertex and face orderings, its common face-sheet isometry is `J_+(f)=(0,0,f/√2,f/√2)`. The original interaction with antisymmetric faces annihilates `P_h`, hence

\[
 K_{64}J_+P_h=J_+L_FP_h.
\]

These are exact algebraic identities. Both were checked on the **complete unmodified 64×64 matrices**. The original normalized full-history sources are

\[
 h_j(s)=P_j\{[C Q v_{50}(s)]^{\odot2}\},\qquad
 f(s)=h_3(s)+\Delta h_5(s),
\]

for all 64 signed histories, and with the actual full five-solid 50→8→12 portal `Q`. Direct exact-orbit and full-source checks give

\[
 S_3=\frac1{64}\sum_s\|h_3(s)\|^2=36+\frac{72\sqrt5}{5},\qquad
 S_5=\frac1{64}\sum_s\|h_5(s)\|^2=7.
\]

The **source-preserving** coupled self-energy is therefore

\[
\boxed{\Sigma_K(w)=\frac{S_3}{3-w}+\frac{\Delta^2 S_5}{5-w}.}
\]

For the original charge-two golden clock with `r=π/e`, `θ=2π/φ²`, `ℓ_m=2−2cos(2θ−2πm/24)`, the native self-energy satisfies

\[
\boxed{\Sigma_{H}(z,m)=-\Sigma_K(21+r^2\ell_m-z).}
\]

This was verified by **three direct full 64×64 inversions for each side and four clock-mode evaluations** with unchanged source vectors. The exact energy-7 projector of the coupled operator has rank nine but the injected original nonlinear source is **orthogonal to it**, with numerical norm `7.45e−16`. Thus this original hidden-source self-energy has coupled poles 3 and 5, **not** the historical ARF's 7 and 5. This is a source-specific conclusion, not a global no-go for any later charged current or source.

## Result B. Native full-five geometry gives an actual energy-7 triplet observable

The *same* history-generated 50-vertex field also gives the pre-existing 12-vertex linear geometric observable `x(s)=Qv50(s)`. On the icosahedral fiveplet, the original tetrahedral Klein half-turns select the rank-three `A4` component `P_{A4,3}`. The full history covariance of the normalized geometric field is the original `3⊕5` projector, hence

\[
\frac1{64}\sum_s\|P_5 x(s)\|^2=5,\qquad
\frac1{64}\sum_s\|P_{A4,3} x(s)\|^2=3.
\]

This triplet lies in the energy-seven coupled-operator subspace. Its **normalized geometric response**, if specified as an observable, therefore satisfies

\[
\boxed{\frac15\left\langle x_{A4,3}^T(K_{64}-w)^{-1}x_{A4,3}\right\rangle
=\frac3{5(7-w)},\quad w=0:\quad\frac3{35}.}
\]

The geometric 3/35 **is therefore source-supported**, not merely a rank match. **However** the November nonlinear action couples *the hidden face source*, not this additional vertex current, to the history field. Treating this vertex observable as an additional interaction is a new physical source-coupling rule until derived from the primitive transfer. The original-source-only energy-seven residue remains zero.

## Result C. Exact first-principles A5 decomposition of *all three* native quadratic source products

Retain the two inequivalent antipodal/thermal hidden quartets `h3` and `h5` (equivalent real `A5` four-dimensional irreducibles). Use only the original 64 sign histories and `A5` rotations acting on the same original icosahedral face incidence. Define the group-character projector on `4⊗4` by

\[
\Pi_\lambda=\frac{d_\lambda}{60}\sum_{g\in A_5}
\chi_\lambda(g)\,R_4(g)\otimes R_4(g),
\quad\lambda\in\{1,3,3',4,5\}.
\]

In particular for the fiveplet `χ5` equals `5` on the identity, `+1` on the 15 order-two elements, `−1` on the 20 order-three elements, and `0` on both order-five classes. For any rank-one tensor `a⊗b`, the exact projected norm is

\[
\|\Pi_\lambda(a\otimes b)\|^2
=\frac{d_\lambda}{60}\sum_g\chi_\lambda(g)
\langle a,R_4(g)a\rangle\langle b,R_4(g)b\rangle.
\]

This identity was evaluated **exactly in `Q(√2,√5)`**, using the actual face-source vectors and all 60 original icosahedral symmetries. There are four native history orbits: 12+12 with zero hidden source, 20+20 active. Computing two active representatives certifies all 64 histories. This yields the following **exact fractions of the source's own squared norm**, not fractions of the ambient 16-dimensional trace:

| Original source tensor | `1` | `3` | `3′` | `4` | `5` |
|---|---:|---:|---:|---:|---:|
| `h3⊗h3` | 1/4 | 0 | 0 | 1/2 | 1/4 |
| `h3⊗h5` | 0 | 1/4 | 1/4 | 1/2 | 0 |
| `h5⊗h5` | 1/4 | 0 | 0 | 1/18 | 25/36 |

The exact history-averaged **absolute** squared source strengths are

\[
\begin{aligned}
T_{33}&=\frac{839808+373248\sqrt5}{125},\\
T_{35}&=\frac{3744}{5}+\frac{7488\sqrt5}{25},\\
T_{55}&=\frac{752}{5}.
\end{aligned}
\]

Thus the *original quadratic source observable algebra* supports all `1+3+3′+4+5=16` representation types without adding a fitted strength or an external source species. In the already-documented finite four-force labeling `4_g+1_Y+3_W+(3′+5)_C`, this provides a source **capacity** for every label. It does **not** by itself prove that the entire dynamical gauge-current action has those couplings or generates Yang–Mills and gravity.

A nontrivial correction to the historical ARF reading follows: the *tracial rank fraction* `5/16` is **not** the microscopic source weight. The actual source fiveplet fraction is **zero** for the cross-quartet source, **1/4** for the low-quartet self-source, and **25/36** for the high-quartet self-source. Inserting `5/16` as an interacting mass coefficient therefore requires an independently justified observable choice, not just the fiveplet's existence.

## Status of the four historical ARFs following the complete source checks

The four archived formulas were not supplied as inputs to any script in this report:

1. **Rail:** original `β³/(1−β³)=1/63` and normalized rank-eight energy-five trace `1/40` are algebraic. The **actual** source-preserving transfer instead gives the 3/5 self-energy above, with zero energy-seven residue. The historical `δ³/63+γ/40` vacuum coupling has not been forced from that source.
2. **Electromagnetic `Rα`:** the native spatial triplet supports a rank-three response in 64 histories. The archived `1/79` channel still requires selecting one physical current line from the 2D `A5`-invariant traceless current plane in the 80-dimensional `End_0(1+3′+5)` carrier. The original full source does not yet define that unique physical current embedding. Merely stating `79=80−1` is not a derivation of the electromagnetic response.
3. **Mass `C_mass`:** the actual same-quartet source has a fiveplet, and the mixed source does not. The original 16D BKM metric has a rank-five sector with tracial weight `5/16`, but **no source-selected equality** to that weight follows; source fractions above are different. The tangent rank-seven in an active 8-state source gives `7/8` as a dimension ratio, not yet the physical `πφ` vertex.
4. **Mass residue `R_mass`:** the normalized actual tetrahedral vertex-triplet response yields exactly `3/35`. The rank-four H51 hidden response admits the tracial ratio `4/51`. The assignment of the physical `δ²` and orientation `π³` source normalizations to these particular responses is not established by the original action.

### Exact physical-current identifiability test for the electromagnetic ARF

The existing `H9=1+3′+5` representation has **two** independent invariant traceless currents. With projectors onto those three irreducibles, the two explicitly normalized candidates

\[
Y_1=(3P_1-P_{3′})/\sqrt{12},\qquad Y_2=(5P_1-P_5)/\sqrt{30}
\]

both commute with `A5`, are traceless and have unit Hilbert–Schmidt norm. Both leave exactly **79** directions after removing their one-dimensional line from `End_0(H9)` (dimension 80). But their source overlaps with the *actual* geometric fiveplet differ exactly:

\[
\operatorname{Tr}(Y_1 P_5)=0,\qquad
\operatorname{Tr}(Y_2 P_5)=-\frac{5}{\sqrt{30}}.
\]

An independent exact SymPy test reproduced this and agrees with the pre-existing v70/v71 two-current nonuniqueness theorem in the user's Library. Thus the `1/79` rank identity is **not sufficient to select the physical electromagnetic current**, even with the original geometric quintet present. No parameter-free, unique physical `R_alpha` follows from those data alone.

This is a precise scope-limited non-identifiability result: an additional *already-derived* microscopic charge/current operator could select the physical line if its mapping into `H9` were established. Merely choosing the line that reproduces the historical coefficient is not permissible.

**Definite verdict.** These tests advance the *derivation of the actual microscopic response* substantially, close the source-preserving 64↔64 spectral bridge, and prove an exact full-16 source-selection theorem. They do **not** derive the four historical ARF observables uniquely from the primitive URT law. Claiming otherwise would require choosing additional source/observable maps by matching historical residues. The current original action plus its declared observables does not yet determine those maps. This qualification is specific to the studied operators, not an assertion that no more complete URT law could exist.

## Reproduction

Archive `CATHEDRAL_ARF_FIRST_PRINCIPLES_CONTINUATION_2026-11-09.zip` packages original unchanged source files and the executed source-first verifiers. Run from its script directory (NumPy, SciPy, SymPy, NetworkX, mpmath):

```bash
OPENBLAS_NUM_THREADS=1 python arf_full_source_intertwiner_2026_11_09.py
OPENBLAS_NUM_THREADS=1 python arf_exact_all16_sector_certificate_2026_11_09.py
OPENBLAS_NUM_THREADS=1 python arf_exact_same_quartet_source_channels_2026_11_09.py
python arf_exact_79_current_identifiability_2026_11_09.py
```

These scripts do not load the four historical ARF target values, any empirical particle constants, or third-party Yang–Mills source material. Original source files are kept byte-for-byte unchanged and are not written to the user's GitHub repository or Library.
