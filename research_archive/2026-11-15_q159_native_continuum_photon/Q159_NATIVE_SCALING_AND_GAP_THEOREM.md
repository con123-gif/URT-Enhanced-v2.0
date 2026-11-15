# Q159 — First actual larger-volume microscopic electromagnetic response and exact zero-gap limit

**Physics Track M, 15 November 2026.** This advances the original complete charged/wilson source rather than using abstract graph analogies, Maxwell coefficient fits, or retired Q77 history selectors.

## New, independent, tested exact polarization identity
The original Q109 528×528 charged Gaussian gauge Hessian at A=0 is obtained from microscopic native v61 4×4 Wilson **Bloch fermion matrices** and the *actual* Q106 30+30 moving charge spectrum, with exact q² weight 16 from Q96. No 528² Hessian is required:

```
h(p)=gamma5[(3r+1-M)I4 + Σ_{j=1}^{11}(F_j exp(i p·d_j)+B_j exp(-i p·d_j))]
J_j(p,k)=i gamma5 [F_j exp(i p·d_j)−B_j exp(−i(p+k)·d_j)]
W_j(p)=−gamma5 [F_j exp(i p·d_j)+B_j exp(−i p·d_j)]
G_mu(p)=(h(p)+mu I4)^−1
Pi_ij(k)=(16/V)Σ_{mu in ORIGINAL moving 60 modes} Σ_{p original fermion AP temporal BZ}
          {tr[G_mu(p+k) J_i(p,k) G_mu(p) J_j(p,k)†]−δ_ij tr[G_mu(p) W_i(p)]}.
```

`r=R_EXACT`, `M=M_EXACT`, the 11 link displacements and gamma matrices are **read directly from original v61**, not adjusted. `mu` comes from original Q106 exact quaternionic roots and the genuine 30-vertex rectified-icosahedron adjacency. The latter is **not** the chiral skew-current spectrum: its actual adjacency eigenvalues are −2 (×10), 1−√5 (×3), −1 (×4), 1 (×4), 2 (×5), 1+√5 (×3), 4 (×1). Mistaking it for the skew source is wrong and fails the original Hessian test. This correction was caught and fixed during independent numerical development.

Using the original Q157b persisted CI Fourier blocks, the analytic native 4×4 formula independently reconstructs **all 48 original 11×11 4D momentum Hessian matrices**, with maximum relative Frobenius error **2.44×10⁻¹³**. The formula differs by complex conjugation under the two equivalent Fourier sign conventions; the native matrix comparison uses the same convention. This identity is the key computational advance: it can evaluate larger spatial volumes **without a large global Wilson Hessian**.

## First genuine spatial-volume test (no parameters changed)
Original anti-periodic NT=6 time; all 11 Wilson directions, fermion hopping, Q106 moving spectrum and Q96 charge weight unchanged; only NS enlarged. Evaluate original A=0 4D transverse gauge Hessian at k=0 and first spatial nonzero mode k_s=2π/NS:

| NS | k_s | Negative first-spatial-k physical modes | Minimum inherited matter/shift gap |
| --- | --- | --- | --- |
| 2 | π | 4 | 0.0090333917 |
| 3 | 2π/3 | 6 | 0.0020583615 |
| 4 | π/2 | 4 | 0.0041492865 |
| 5 | 2π/5 | 4 | 0.0000881132 |
| 6 | π/3 | 1 | 0.0020583615 |

All five k=0 blocks remain positive in these finite original homogeneous-background probes. A specific spatial instability survives toward longer wavelengths than the original π Nyquist mode, BUT the negative-mode count varies with NS and the inherited shifted-fermion gap becomes extremely small and nonmonotonic. **A stable broken-flux vacuum at NS=3..6 was not found or proved.** Neither observed α nor a continuum photon emerges from merely changing NS.

## Exact zero-gap theorem for the original conditional Gaussian action

The native singlet adjacency possesses **mu=−2 with multiplicity 10**. For each continuous spatial momentum on the diagonal `p=(pi/6,s,s,s)` (temporal pi/6 is allowed by ORIGINAL NT=6 antiperiodicity), the original Hermitian Wilson-Dirac block has eigenvalues ±E(s) (each doubly degenerate). Using **the unchanged native rational Wilson constants**, exactly:

```
E(0)^2=(1−M−sqrt(3)/2)^2 + 1/4 ≈ 0.6816043197577927 < 4.

E(pi/2)^2=[3r+1−M+(sqrt(3)/2−1/2)/4]^2
          +3+[(sqrt(3)/2+1/2)/4]^2
          ≈ 4.985561282920486 > 4.
```

The differences `4−E(0)^2` and `E(pi/2)^2−4` are **positive algebraic elements of Q(sqrt3)**, certified symbolically with SymPy and source-exact rational r,M. By continuity **there exists s* in (0,pi/2) with E(s*)=2**. Therefore `h(p*)+mu I4` at mu=−2 is singular in the spatial continuous-momentum limit. Because spatial lattice momenta become dense, **there is no uniformly positive lower bound on the shifted-fermion inverse gap across NS→infinity** for the same unregularized original Gaussian action. This does not prove that every finite-volume determinant is singular or rule out another coherent UV completion, but it forbids treating the original finite-volume inverse/resolvent as uniformly nonsingular during a naive continuum limit.

The inherited v61 r,M and relative kinetic action are conditional/original model choices, NOT primitive derived zero-parameter laws. The correct next physical step is to derive a positive, time-normalized transfer/fermion measure from the full 190/H64/24 Cathedral (or a mathematically justified controlled regularization), **then** recompute an induced transverse photon pole on increasing physical volumes. One should not add an arbitrary regulator or tune a Wilson mass to recover a desired α.

## Provenance and validation
Native Q106/v61 original code is imported unmodified. Q159 exact SymPy inequalities, all 48 original Q157b 11×11 matrix comparisons, and all enlarged NS 2..6 polarized responses are registered for GitHub original-source CI. Independently developed local first calculation of all these results passed before commit; native CI status pending until read.

## Q159b original-native numerical check correction

The FIRST original GitHub compute job `q159-native-original-wilson-continuum-polarization` exited with an **assertion failure** (GitHub Actions' wrapper workflow reported success at the outer level despite the inner compute job failing). It correctly reproduced ALL 48 original Q157b 11×11 Fourier matrices to max relative 2.4409966e−13 and passed the exact Q(√3) gap-crossing proof, and completed NS2–4. It stopped at NS5 because its Hessian Hermiticity check incorrectly required the **absolute** antisymmetric norm to be below 1e−6. As the inherited shifted-fermion gap drops to 8.8113e−5, the Hessian norm grows to O(10^5), and the absolute roundoff scales with that norm. Independent local NS5 evaluation gave antisymmetry ≈2.81e−8 absolute and **2.9863e−13 relative**. The original unbounded absolute threshold was a numerical test design bug, not physical non-Hermiticity. The source now asserts `||Π−Π†||_F / max(1,||Π||_F) < 1e−8`. Matrix is explicitly symmetrized only *after* passing this Hermiticity check; it cannot hide a material defect. A genuine independent rerun `q159b-native-continuum-relative-hermiticity` is registered, with full NS2..6 output persistence; **do not claim the first job passed**. This fix changes no microscopic operator, inherited constant, source or physical action.

## Q159b original native source result — VERIFIED

Q159b native GitHub Actions [run 43725777424](https://github.com/con123-gif/URT-Enhanced-v2.0/actions/runs/43725777424) **inner compute PASS**, returned code 0 and persisted `cathedral-research-state/compute/q159b-native-continuum-relative-hermiticity/outputs/Q159_RESULT.json`. The full unchanged original Q106/v61 source now verifies every claim here: original 48 Fourier 11×11 response comparison max relative2.440996565317777e−13, full symbolic Q(sqrt3) zero-gap crossing, and spatial NS2..6 source calculations (first-nonzero spatial momentum negative mode counts 4,6,4,4,1). The first Q159 job's absolute Hermiticity assertion failed and was **not counted as pass**; the only change was relative floating-point acceptance. No fitted experimental constant or new microscopic term was introduced. This closes Q159 as a conditional finite/multi-volume mathematical and numerical result; the full Nature/Maxwell gate remains open.
