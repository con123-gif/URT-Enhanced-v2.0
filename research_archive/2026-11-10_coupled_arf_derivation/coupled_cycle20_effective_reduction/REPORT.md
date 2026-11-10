# Coupled cycle 20 — effective reduction of the condensed phase

Classification: **PROVED** for the pairing-dominated ratio list.
The global claim that *every* observable ratio is independent of the
residual 2-plane is **FALSIFIED**. Advances a physical ARF? No.

## What depends on y_odd

yo appears in the action only as the coefficient of h3 in Δ. On the
cycle-19 vacuum h3 = 0, every functional of (K, Δ, h5) is therefore
independent of yo. Confirmed on the grid
y_e ∈ {0.1, 1.0, 2.0} × y_o ∈ {0.0, 1.0, 2.0} (all inside
y_e > y_c,even ≈ 0.006011, y_o < y_c,odd ≈ 2.405), primary H13, T = η:

- Ω_* spread across yo at fixed ye is exactly 0.
- BdG spectrum difference versus yo = 0 is exactly 0.
- ||grad_{h3} Ω|| ≤ 2.9×10^{-7} (inversion tadpole remains zero).
- Mixed Hessian ||∂²Ω/∂h3 ∂h5|| is 0 at yo = 0 and 5.0×10^{-11} at yo = 1.

The only yo-dependent observables are those that displace h3:

- Odd hidden mass² = 2 c_odd + y_o² κ_vac, with
  κ_vac = ∂²Ω_f/∂s² = −9.014×10^{-7}
  (stable between finite-difference steps 10 and 30).
- At the origin the same curvature is κ_origin = −2 χ_odd = −0.076866;
  the even condensate suppresses the odd pairing response by a factor
  ~8.5×10^4 (one power of the pairing gap).
- Consequently m_odd²(yo=0) = 0.444476 and m_odd²(yo=2) = 0.444472,
  a relative shift of 8×10^{-6}. The dependence is parametrically
  present and numerically negligible for all yo < y_c,odd.
- Distance to odd criticality, y_c,odd − yo, still depends on yo
  by definition.

## What depends on the overall y_even scale

r_* = y_e N / (4 c_even) on the nose (relative error ≤ 1.4×10^{-16}),
with N = 4.640379972803843, so the pairing gap g = y_e r_* scales as
y_e². Ratios that mix this scale with a ye-independent energy therefore
depend on ye:

- m_odd / E_pair ~ O(1) / y_e².
- On H13 there is an extra unpaired mode at E = 13 exactly
  (the Hodge eigenvalue 13: K v = 13 v and Δ v = 0, the centre/spoke
  mode). It does not scale with g. The ico Laplacian has no analogue.
  The ratio 13 / E_pair depends on ye.
- Relative Laplacian corrections to pairing ratios are O(1/g) = O(1/y_e²)
  and vanish as ye increases.

## Parameter-free pairing-dominated ratios (PROVED)

These are independent of yo (exactly, on shell) and of the overall ye
scale in the large-vev limit, with the Laplacian corrections stated
below.

1. Singular values of the unit even pairing matrix M(ĥ), multiplicities
   1, 3, 6, 2:
       0 : √(2/15) : √(1/6) : √(3/10) = 0 : 2 : √5 : 3.
   Measured max relative error 3.5×10^{-8}; algebraic ratio error 0.

2. r_* / y_e = N / (4 c_even) = 8.558345504799715×10^5.

3. Ω_* / r_*^2 → −c_even = −1.3555131567782033×10^{-6}.
   At ye = 1: −1.35543755×10^{-6} (relative 5.6×10^{-5});
   at ye = 2: −1.35549426×10^{-6}; at ye = 0.1 the ½Σ|ξ| remainder
   is still visible (relative 0.56% to −c_even) and falls as 1/y_e².

4. Ω_* / y_e² → −N² / (16 c_even) = −9.928493770202099×10^5.

5. Even radial curvature ∂²Ω/∂r² = 2 c_even
   (measured 2.71102631255×10^{-6} versus 2.71102631356×10^{-6}).

T = 0 at (ye, yo) = (1, 0) reproduces the same r_* and the same
Ω_*/r_*^2 to relative 2×10^{-5}.

## Leading Laplacian corrections

For the unit even pairing at scale g, the positive BdG levels of both
H13 and the ico Laplacian obey, for g ≥ 10³:

    E_3(g)     = g √(2/15) + β_3 / g + …          (multiplicity 3)
    E_{6,±}(g) = g √(1/6)  ± √5 + β_6 / g + …     (two triplets)
    E_2(g)     = g √(3/10) + β_2 / g + …          (multiplicity 2)

The 3 ⊕ 3 split of the would-be 6 is exactly 2√5
(relative error ≤ 3×10^{-12} on H13 and ≤ 3×10^{-11} on the ico
Laplacian, including at the physical g_* = 8.5583455×10^5).
Centroid constant terms α are consistent with 0 (≲ 10^{-7}).
H13 coefficients: β_3 ≈ 67.09, β_6 ≈ 44.09, β_2 ≈ 44.73
(ico: 49.29, 30.62, 32.86). Fit residuals relative ≲ 10^{-10}.

At the physical H13 vacuum (ye = 1) the grouped positive BdG energies
are therefore

    0 (×1),  13 (×1),
    3.12506593×10^5 (×3),
    3.49390756×10^5 (×3),  3.49395228×10^5 (×3),
    4.68759889×10^5 (×2),

i.e. the pairing pattern 0 ⊕ 3 ⊕ (3⊕3) ⊕ 2 plus the non-scaling
Hodge mode 13. The ico Laplacian is the same without the 13.

## Integrity
Predeclaration sha256:
`d87859f48fb81dc4190f2ffbe6691f2c32dcc586839507b4176516a97e5b47d6`.
Test-script hashes (original and analysis patch of the singular-value
matcher / unpaired-mode cut) are in HASHES.txt. No ARF target was used.
