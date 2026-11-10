# Newton's Cathedral / URT — forward no-fit coupling calculation

**Date:** 9 November 2026. **Scope:** a new exact mathematical bridge starting from the *original URT complex recursion*, not from the historical four ARF values. This does **not** assert that four physical ARF responses have been proved. The original 7 November full five-solid source is included unchanged; its SHA256 is `5577557613a77796a38f8be7f2615feb4714a8494259f5b253cbcaae60f72fcd`. No GitHub modification was made.

## 1. Original URT first, rather than backwards from the answer

The recovered v61 URT engine defines, for nonzero complex `z`,

\[
F(z)=\left[\frac\pi e-\left(\frac\pi e-1\right)
       \left(\frac{|z|}{9/13}\right)^4\right]
  \frac{z^2}{|z|}\,e^{i\omega},\qquad
\omega=\frac{2\pi}{\phi^2}=\pi(3-\sqrt5).
\]

At `r*=9/13` the radial multiplier is exactly 1, and radial derivative is `5−4π/e≈0.377090600836313`. On that invariant circle,

\[
\theta_{n+1}=2\theta_n+\omega\pmod{2\pi}.
\]

Changing coordinate to `x=(theta+omega)/(2*pi) mod1` gives the **exact conjugacy** `x_{n+1}=2 x_n mod1`. This is the binary shift. Its unique absolutely continuous invariant probability measure is Lebesgue/Haar. For Haar-typical initial phases the six successive binary digits form all 64 history words, each with probability **1/64**, and disjoint six-bit blocks are independent. A specified six-bit word repeated consecutively `k` times has probability `64^{-k}`; hence the sum of successive *specified-word* repetitions is

\[
\sum_{k\ge1}64^{-k}=\boxed{1/63}.
\]

This is the coefficient appearing in the historical rail ARF, **for exactly this event definition**. An arbitrary return to the same four-sheet state after three steps is a different event and has probability `1/4`, not `1/64`. An arbitrary same-bin three-step return on the 24 equal phase bins, averaged over bins, has probability `1/24`. These distinctions are part of the theorem, not modelling details to conceal. Also, uniform six-bit frequencies along one explicitly selected exceptional orbit cannot be asserted solely because the invariant absolutely continuous measure is uniform; typicality is an assumption if an individual starting phase is specified.

## 2. Direct no-fit six-axis geometric coupling

Take the six **unit** icosahedral axes (one from each antipodal pair), with coordinates obtained from the original `(0,±1,±φ)`, `(±1,±φ,0)`, `(±φ,0,±1)` shell, and collect them as a `3×6` matrix `V`. Then

\[
VV^T=2I_3,\qquad |v_i^Tv_j|^2=1/5\ (i\ne j).
\]

For the URT symbolic six-bit history `s∈{±1}^6`, let `x(s)=Vs`. Haar binary coding forces `E[s_i s_j]=δ_{ij}` and therefore

\[
\boxed{E[x]=0,\quad E[xx^T]=2I_3,\quad E\|x\|^2=6,\quad E\|x\|^4=48.}
\]

No fitted source covariance appears. Identifying bit positions with named antipodal axes is an explicit geometric-history dictionary; the uniform law itself does not fix every source/charge identification.

## 3. Exact 24-bin golden phase transfer

**Declared readout:** identify the 24 clock labels with equal-length angular bins of `theta`. This is a natural test, but is **not yet a theorem** identifying the *temporal* 24-track operator in the original full Cathedral with 24 angular bins.

Measure angle in units of one bin. The twist is `24/φ²=9+f`, where `f=27−12√5=0.1671842700025236...`. An interval of one input bin maps to an interval of two output bins. Its conditional one-step transfer has exactly three destinations:

\[
P_{i,2i+9}=(1-f)/2,\quad
P_{i,2i+10}=1/2,\quad
P_{i,2i+11}=f/2
\quad\text{(indices mod 24)}.
\]

`P` has **72 nonzero entries**, is doubly stochastic, and is computed in `O(24)` sparse work. For `A=(3f²−3f+1)/4`, the *exact* characteristic polynomial is

\[
\boxed{\det(\lambda I-P)=\lambda^{21}(\lambda-1)(\lambda^2-A).}
\]

At the golden `f`, `A=4267/4−477√5`, so nontrivial eigenvalues are `±0.3815425698402667...`. In particular three coarse-grained steps leave only a rank-three observable image. This is an asymptotic **spectral** cap, not a claim of one-step operator-norm contraction by that eigenvalue. `P` is nonnormal.

**Exact deterministic three-step correction:** conditioning only at the initial and final bin, and iterating the actual doubling map for three steps, gives a different stochastic matrix `Q_3` of rank three with 216 nonzero entries and spectrum

\[
\operatorname{spec}(Q_3)=\left\{1,\ \pm\sqrt{\frac{7(21f^2-9f+1)}{64}},\ 0^{\times21}\right\}
\]

for the golden branch `1/7<f<2/7`. Its two nontrivial eigenvalues are `±0.0948787276831661...`. **`Q_3≠P³`**; the exact squared Frobenius discrepancy is `0.3148773201753124...`. This distinguishes the actual deterministic URT history from a Markov approximation that re-randomises within bins between steps. Both average three-step same-bin returns equal `1/24` here.

## 4. The 64-history to 24-track overlap supplies a positive transfer automatically

Let `H_h=[h/64,(h+1)/64)` be the six-bit cylinder in `x`, and let `C_j=[j/24,(j+1)/24)` be the equal clock arc in `theta/(2π)`. Since `x=(theta/(2π)+φ^{-2}) mod1`, define the **exact joint probability**

\[
M_{jh}=\mu\big((C_j+\phi^{-2})\cap H_h\big),\quad
j\in\mathbb Z_{24},\ h\in\{0,\ldots,63\}.
\]

This has **88 nonzero entries** and fixed marginals `Σ_h M_jh=1/24`, `Σ_j M_jh=1/64`. Normalise in the Haar `L²` spaces:

\[
\boxed{B_{jh}=\sqrt{24\cdot64}\,M_{jh},\qquad T=B^TB\ge0.}
\]

As a conditional-expectation operator `B` is contractive by Jensen/Cauchy–Schwarz, and maps the normalised constant history vector to the normalised constant clock vector; hence `\|B\|_2=1` **exactly**, and `0≤T≤I`. `rank B=24`, `rank T=24`; numerical singular-value verification passes. The source-independent information trace is

\[
\boxed{\operatorname{Tr}(B^TB)=\frac{552604}{3}-82368\sqrt5
=20.8861626306556195\ldots}
\]

This is an explicit **parameter-free, positive, capped coupling operator**, conditional on the above clock/history readout. It does not rely on the historic ARF formulas, and it does not by itself provide an electromagnetic gauge generator.

## 5. Actual all-five-solid nonlinear source, rather than a synthetic replacement

Using the original Nov 7 source unmodified (190 cochains, 50 vertices, exact all-five `Eglobal`, `Plinear`, 12-vertex/20-face incidence, hidden `4_3+4_5` projectors), generate all 64 original signed history fields from the six icosahedral axes and apply the supplied source `h_s=P_s[(C Plinear v50)^2]`. The Haar-derived 64-history average gives **exactly**

\[
\boxed{\Gamma_h=\left(9+\frac{18\sqrt5}{5}\right)P_3+\frac74P_5.}
\]

The full original code check has residual `6.10×10^-14`. The unique positive covariance normaliser is `W=Γ_h^{-1/2}` on its rank-eight support, with no fitted factor. The **information-observable** history isometry `H=(h_3/√c_3+h_5/√c_5)/8` obeys `H^TH=P_3+P_5`.

Composing source with phase/history coupling yields the **source-conditioned candidate** `F=BH` and the positive rank-eight operator `T_8=F^TF`, with eight calculated nonzero eigenvalues

`0.50776396, 0.48529281, 0.41190208, 0.28071439, 0.24644030, 0.22264964, 0.08741486, 0.05121377`.

Its mean retained source information is `Tr(T8)/8=0.28667397433380626`. Applying the previously frozen gap amplitude `P3+Delta P5` produces four small positive eigenvalues of order `10^-6` with **no newly fitted coefficients**. These are conditional information-transfer eigenvalues, **not established particle masses or physical ARF coefficients**. The information normaliser cannot be silently substituted into the old kinetic action; preserving the physical action also changes its kinetic operator.

## 6. Source phase response and non-selection check

In the local overlap branch around `a=φ^-2`, the information overlap observable has the exact polynomial

\[
Z(a)=\operatorname{Tr}(B(a)^TB(a))
=\frac4{3}(55296a^2-42336a+8119).
\]

Thus at the native golden value

\[
Z'(\phi^{-2})=164736-73728\sqrt5\approx-124.81984510\ne0.
\]

Therefore a proposal that **maximises/minimises this particular overlap** would *not* dynamically select the golden phase. This does not falsify the original URT golden phase, which is supplied as a primitive; it rejects this one proposed variational justification.

## 7. Four ARFs — what is and is not achieved

The historic candidates are:

\[
\Delta\delta=-\delta_\star^3/63-\gamma/40,\quad
R_\alpha=3/(64\phi)+1/(79\phi^2),
\]
\[
C_{\rm mass}=-(5/16)\delta_\star^3+(7/8)\pi\phi,\quad
R_{\rm mass}=(3/35)\delta_\star^2-(4/51)\pi^3.
\]

The forward URT mathematics **does** supply an exact `1/63` six-bit specified-word recurrence mechanism and now a positive history-to-clock transfer `B^TB`. The original nonlinear hidden covariance also follows from the URT-invariant 64-history measure, rather than an externally uniform average.

**Not proved:** (i) that consecutive repetitions of the specified six-bit word are the physical rail observable; (ii) that the temporal clock labels coincide with equal-angle bins; (iii) that the source-information transfer `B` is the microscopic charged-matter/gauge transfer; (iv) that this transfer yields the other three historical ARFs after physical Ward contacts and mass poles. These are genuine mathematical identifications, not tunable numbers. The original scalar URT controller remains a separate piecewise prototype and its branch discontinuity prevents using its local `β α (1+θ_h)<1` derivative bound as a global contraction theorem across the discontinuity.

### Verification

From this folder:

```bash
python URT_FIRST_PRINCIPLES_24_TRACK_2026-11-09.py
python URT_24_SPECTRAL_PROOF_2026-11-09.py
python URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py
python URT_NATIVE_FIVE_SOLIDS_SOURCE_PULLBACK_2026-11-09.py
python URT_SOURCE_CLOCK_POSITIVE_TRANSFER_2026-11-09.py
python URT_HISTORY_CLOCK_INFORMATION_CURVATURE_2026-11-09.py
```

All pass with Python, NumPy, SciPy, SymPy and mpmath. The original November 7 code has not been changed. Outputs are recorded in `VERIFY_OUTPUT.txt`. The original v61 URT recursion is quoted accurately from the user's archived source (section `urt_engine_step`), but the entire v61 compendium is not duplicated in this archive.
