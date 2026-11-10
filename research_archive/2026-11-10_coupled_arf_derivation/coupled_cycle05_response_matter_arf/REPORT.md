# Coupled cycle 05 — five-solid constraints, T0 response, Ward, H13 ⊕ H51, ARF comparison

Classification (by subquestion):
- five-solid operator identities: PROVED
- T0 poles and residues: PROVED
- 1/2/n-step transfers without a time-step identification: PROVED
- gauge / Ward contacts of the original action: PROVED
- charged-matter H13 ⊕ H51 fermion poles and EM responses: OPEN
- derivation of the four historical ARFs: OPEN

Advances an ARF? No.

## Five-solid constraints

From the unmodified 7 November operators:

- `(V, E, F) = (4+8+6+20+12, 6+12+12+30+30, 4+6+8+12+20) = (50, 90, 50)`
- `Tr D² = 720`, `Tr D⁴ = 3456`, `Tr Cbridge = 160`, `Tr Cbridge² = 800`
- `rank Plinear = 8`; every solid has a positive Frobenius norm in `Eglobal`

Constant (degree-0) unit indicators on each regular solid lie in `ker Plinear`
and produce mixed quartics at the `10^{-66}` numerical floor. Deterministic
dipole-0 indicators (column 0 of each solid's own `Pdip`) give a strictly
positive mixed Schur quartic for every one of the 10 solid pairs, e.g.
tetrahedron|dodecahedron `0.0554551311877576` and cube|octahedron
`0.0008796901200188952`. A fixed quadrupole column is not available on the
tetrahedron or the cube.

## Recursive response operator

The unique zero-background KMS semigroup is `T0 = exp(−η H0)` with
`H0 = (Hg ⊕ Hbits)` plus charge-1 / charge-2 clock Laplacians of coefficient
`r² = (π/e)²`, `Hg = D² + Cbridge`, `η = −ln Δ`.
`ker Hg = 2` and `ker Hbits = 2` (independently recomputed).

Lowest levels, independently recomputed (not copied):

- `E1 = 0.0025584063752757697`, multiplicity 2, origin = geometric kernel
  ⊗ charge-1 golden mode `m = 9`. `T0` eigenvalue `λ1 = 0.9847773659298271`.
  Resolvent pole `z1 = exp(η E1) = 1.015457944705908`.
  Scalar residue of `1/(1 − z λ1)` is `−1/λ1 = −1.015457944705908`.
  Residue operator: `−exp(η E1) P_1`.
- `E2 = 0.010228725137850734`, multiplicity 2, origin = history kernel
  ⊗ charge-2 golden mode `m = 18`. `λ2 = 0.9405134122394003`.
  Pole `z2 = 1.0632490584253973`, scalar residue `−1.0632490584253973`.
- Gap parameter `Γ = η(E2 − E1) = 0.04598968179431101`.
- Ratio `λ2/λ1 = 0.9550518165609617`.

## Transfers

- 1-step: eigenvalues `e^{−η E_k}`; `λ2/λ1 = 0.9550518165609617`;
  gap `λ1 − λ2 = 0.044263953690426794`.
- 2-step: `e^{−2 η E_k}`; ratio `(λ2/λ1)² = 0.9121239723163929`.
- n-step: `e^{−n η E_k}`.

The discrete index `n` is not identified with a physical time interval.

## Gauge covariance and Ward contacts

The two-dimensional kernel of `Hg` is spanned (to residual `1.3e-15`) by the
all-solid vertex-constant and the all-solid face-constant, i.e. the images
of the all-ones vector of `ℝ⁵` under `U0` and `U2`. The two-dimensional
kernel of `Hbits` is the original Gaussian quotient used by
`history_source_solve`. Clock Wilson charge is 1 on geometry and 2 on
history, matching the quadratic source. No new spatial current is introduced.

## Charged matter H13 ⊕ H51

Recomputed from the A5 character table (classes `1, (12), (3), (5), (5')`):

- `H13` character `(13, 1, 1, 3, 3) = 2·1 ⊕ 3 ⊕ 3' ⊕ 5`.
- `Hom_A5(4, H13) = 0`.
- `Sym²(H13)` contains exactly 4 copies of the irrep 4, hence two hidden
  quartets give an 8-real-dimensional Weyl pairing (vertex charge +1).
- Abstract complement `H51 = 2·1 ⊕ 3·3 ⊕ 3·3' ⊕ 4·4 ⊕ 3·5`.
- Uniform-charge count on `H13 ⊕ H51` for two hidden sources:
  `2 × (4 + 90 + 44) = 276`.

There is no unique charged vertex. Mean-field fermion poles vanish in any
centred hidden ensemble (restated from isolated cycle 07; no new fit).
No unique electromagnetic current on the 90 spatial edges is derived.
`H51` remains an abstract A5 complement, not a canonical subspace of the
64 signed histories. Classification: OPEN (precise obstruction, dimension 8
on H13 and 276 unrestricted).

## ARF comparison only (not a derivation)

Frozen-constant targets, evaluated independently:

- `Δδ = −δ★³/63 − γ/40 = -0.00035959042756760504`
- `Rα = 3/(64 φ) + 1/(79 φ²) = 0.03380535602328556`
- `C_mass = −(5/16) δ★³ + (7/8) π φ = 4.446800183122003`
- `R_mass = (3/35) δ★² − (4/51) π³ = -2.4299997428893794`

Nearby derived numbers, reported as distances, not identities:

- `3/20 − E1 = 0.14744159362472423` versus `δ★ = 0.1475108101595796`
  (relative difference `0.046923025356911607 %`).
- `E1` versus `Δ`: relative difference `2.7806852547524834 %`.
- None of `E1`, `E2`, `Γ`, `λ2/λ1`, or the cycle-02 `(a, b)` equals an ARF
  target at printed precision.

Look-elsewhere count: of the fixed 25-member Cathedral integer list
`{1,2,3,4,5,7,8,9,12,13,15,16,18,20,24,35,40,51,63,64,79,80,81,90,1053}`,
**16** distinct members appear in the four ARF writings (including the
`δ★ = 80π/(1053 φ)` and `γ = 1/81` prefacing). Previously recorded near-hits
(first-programme cycle 05): `Rα` has 8 rivals within `10^{-4}` inside its
template; the `5/16` of `C_mass` has a rival `4/13` at relative `3.5×10^{-6}`;
`1/40` has 34 Cathedral trace writings (first-programme cycle 04). Those
counts prevent reading a numerical near-hit as a derivation.

Verification: `test_response_matter.py`, `results.json`.
Predeclaration hash: `a2f9ab796e680b7161ac130869cace198470798f794085e8e91f5960bc65a383`
