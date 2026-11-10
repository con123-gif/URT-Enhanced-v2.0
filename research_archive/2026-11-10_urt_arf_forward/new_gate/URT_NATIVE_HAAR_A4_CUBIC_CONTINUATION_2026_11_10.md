# Newton's Cathedral / URT — exact natural-history response and tetrahedral cubic source

**Date:** 10 November 2026. **Scope:** rigorous finite calculations from the original signed icosahedral history and the user-owned all-five-solid nonlinear source. No fitting, no imported observational constants, no historical four-ARF coefficients in the executable calculations. **Four physical ARFs: NOT DERIVED.** This is forward URT mathematics, not a completed Theory of Everything.

## 1. The URT invariant history measure is fixed within the absolutely continuous class

On the invariant radial circle of the original complex URT engine, write the angular coordinate in turns `x=theta/(2*pi)`. Its map is

`F_a(x)=2*x+a (mod 1)`, `a=1/phi^2`.

Set `y=x+a (mod 1)`. Then `y' = 2*y (mod 1)`: the dynamics is conjugate to the dyadic doubling map. Let `f` be an integrable probability density invariant under `F_a`. Its Fourier coefficients satisfy

`fhat(k)=exp(-2*pi*i*k*a) fhat(2*k)`.

For every nonzero integer `k`, the Riemann–Lebesgue lemma makes the right-hand side tend to zero under iteration, forcing `fhat(k)=0`. Since `fhat(0)=1`, the unique absolutely continuous invariant distribution is Haar/uniform measure. This proves that the six consecutive binary symbols are independent fair bits and all 64 history words have probability exactly `1/64`, subject to this clearly stated regularity class. It does not assert uniqueness among **all** invariant measures: periodic-orbit measures also exist.

The six-bit transition obeys `Q[h,2*h mod64]=Q[h,(2*h+1) mod64]=1/2`, `rank(Q^n)=2^(6-n)` for `0<=n<=6`, and `Q^6=J64/64`. The invariant-phase shift `a` itself can be removed from this bare angular map by conjugacy; the physical golden phase must acquire observable content through the coupling to the Cathedral geometry/24-clock/charges, not from binary chronology alone.

## 2. The exact full stationary Green–Kubo response

For the unchanged nonlinear source `h(h_word)=h3+h5` in the 20-face representation, evaluate it on all 64 URT histories using the original five-Platonic 50-vertex embedding, and define

`C_k = (1/64) sum_{u,v} Q^k[u,v] h(u) h(v)^T`.

The source has zero mean. Its odd and even hidden quartets are mutually orthogonal at every lag by global-history sign symmetry. From the exact Q(sqrt5) source computation the **trace correlations** are

- `c3=[36+72sqrt5/5, 18/5+36sqrt5/25, (27+9sqrt5)/25, (36+18sqrt5)/25, 0]`.
- `c5=[7, 7/40, -61/120, -1/24, -1/6]`.

All corresponding trace correlations for lag `k>=5` vanish exactly. Therefore the integrated stationary fluctuation/Green–Kubo matrix is the finite sum

`S=C0 + sum_{k=1}^4(C_k+C_k^T)`.

The exact scalar trace responses are

`Tr(P3 S) = 18(67+27sqrt5)/25 = 91.70916148259592...`

`Tr(P5 S) = 71/12 = 5.91666666666667...`

`Tr S = 16247/300 + 486sqrt5/25 = 97.62582814926257...`.

The full numerical `S` is symmetric positive semidefinite of rank eight, with positive eigenvalues (rounded):

- Hidden odd quartet: `12.69620225099766, 13.46867036298624, 27.87988280075944, 37.66440606785258`.
- Hidden even quartet: `0.56864786770692, 1.07080120004545, 1.875, 2.40221759891431`.

Positivity of `S` follows generally from `v^T S v = lim_{n->infinity} Var(sum_{t=0}^{n-1} v^T h_t)/n >=0`; the eight-dimensional rank is independently verified from the original finite matrices.

For **all n>=5**, the variances of the total hidden source accumulated over n chronological steps are exactly

`V3(n) = [ (1206+486sqrt5)*n - (504+216sqrt5) ]/25`

`V5(n) = (71/12)*n + 49/15`.

This is a genuine, **exact O(N) long-time response law** of the original nonlinear source: the finite-lag covariance produces precisely linear variance, with all coefficients fixed by the URT history and the all-five incidence map. These variances are **not** physical particle mass predictions.

## 3. Isotropizing a complete history is not isotropizing each update

One may choose a single orientation uniformly among the 60 proper icosahedral rotations and keep that frame fixed during the entire URT history. The complete two-point response is then symmetrized by one common `g`:

`S_fixed = (1/60) sum_{g in A5} U(g) S U(g)^T`.

A5 irreducibility, together with odd/even parity decoupling, gives exactly

`S_fixed = [Tr(P3 S)/4] P3 + [Tr(P5 S)/4] P5`.

The original full 20-face matrices verify this to Frobenius residual `7.54e-14`, with scalar coefficients `22.92729037064898...` and `71/48=1.47916666666667...`. The relative even-quartet response fraction is `0.06060554649145...`.

This is **not** the same dynamics as replacing the chronological kernel `Q` by its group average `Qbar` at every update. For the two-step source correlation, fixed-frame averaging has trace `1.3766511385665905`, but `Qbar^2` gives `0.8787422359499613`. This comparison corrects a possible overinterpretation of the previously obtained four-pole averaged-chronology transfer: that model resamples orientation on every step and is an additional stochastic dynamics, not simply the original URT in an unknown fixed frame.

## 4. A genuine nonzero cubic from the original five-solid source

The 60-element A5 group contains exactly five Klein-four normalizers of order 12, giving the five A4 tetrahedral subgroups. In each of the original hidden 4_3 and 4_5 irreps, their group average projects onto one rank-one invariant direction. If `H3` and `H5` denote the corresponding normalized scalar source amplitudes, exact arithmetic in Q(sqrt5), not floating-point recognition, proves the following identical identities for all five tetrahedral vacua:

| Moment | H3 | H5 |
|---|---|---|
| `E[H^2]` | `9+18sqrt5/5` | `7/4` |
| `E[H^3]^2` | `0` | `27/10` |
| `E[H^4]` | `(26244+11664sqrt5)/25` | `329/30` |

Thus `abs(E[H5^3])=3sqrt(30)/10` is a nonzero **microscopic cubic source vertex**. This goes beyond the earlier A5 group-theoretic permission for a cubic invariant; its amplitude is computed from the original actual source. The overall **sign** changes with the chosen orientation of the normalized A4 singlet and is not selected by this calculation. None of these amplitudes was chosen to reproduce the historical mass/orientation ARF.

## 5. Status against the actual four-ARF objective

- The uniform history weights are derived under AC invariance, not imposed. The all-five original source and a genuine finite-memory, O(N) two-point response now have exact coefficients.
- The five tetrahedral branches share a **unique cubic-magnitude** coefficient, but source orientation and a physical mass-current definition are still needed for the historical mass ARFs.
- The natural URT source-response even-sector fraction `0.060605546...` is not the frozen KMS occupation `Delta^2/(1+Delta^2)~6.196e-6`. Equating them would be a false derivation; the separate KMS weighting/orientation must be shown to arise from the same microscopic physical action.
- The bare dyadic URT dynamics has no intrinsic dependence on the golden phase offset up to topological conjugacy. The 24-track holonomy and spatial gauge-matter transfer must supply its physical role.
- Neither the physical rail source derivative nor the charged 16/48-state Maxwell current nor the two physical mass pole/residue operators is yet uniquely derived from this process. There is therefore **no verified parameter-free theorem for all four historical physical ARFs**.

## Executables

Run with NumPy, SciPy, SymPy and NetworkX:

```bash
OPENBLAS_NUM_THREADS=1 python URT_CANONICAL_HAAR_GREEN_KUBO_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_FIXED_FRAME_A5_GREEN_KUBO_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_A4_SCALAR_CUMULANTS_2026_11_10.py
OPENBLAS_NUM_THREADS=1 python URT_A4_CUBIC_EXACT_SOURCE_THEOREM_2026_11_10.py
```

These use the original `forward/` source paths relative to this research archive; they contain no third-party Yang–Mills work. No original source was modified. The derivations and code are ready for independent reproduction.
