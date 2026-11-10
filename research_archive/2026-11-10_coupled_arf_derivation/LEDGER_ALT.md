# Alternative-route Cathedral / URT ARF ledger

Date: 10 November 2026 (Europe/London).
Executor working directory: `/workspace/arf_research/alt_cycleNN_*/`
Repository used read-only: `/workspace/arf_research/repo` at `d71974d5ce01ad2f8f7992adf64af65810dd5436` (`newtons-cathedral`; `git pull --ff-only` reported already up to date).
No commits, pushes, PRs, workflow triggers, or edits to repository files.
These cycles run in parallel with the main coupled line in `/workspace/arf_research/coupled_cycleNN_*` and do not overwrite it.
Frozen constants used only as named inputs, never as fit targets:
γ = 1/81, δ* = 80π/(1053 φ), Δ = 3/20 − δ*.
ARF targets used only for end-of-cycle comparison, never inserted into a model.

Environment: `OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 nice -n 10 /workspace/venv_nx/bin/python`.

## Plain summary

None of the eight alternative routes derives any of the four historical ARFs. Several of them do close, or sharpen, a previously open obstruction:

1. A 2I spinorial lift cannot be placed on H13, H51 or H64, and the natural lifts H13⊗2 enlarge the kinetic cone (7 → 17) and the Yukawa space (to 42 or 80), rather than fixing a ray.
2. Pure Hodge kinetic on the geometric centre-plus-icosahedron graph does cut the 7-dimensional A5 kinetic cone down to a single ray (scale still free). The archived G13 graph is not A5-equivariant and cannot be that kinetic. Five-solid coupling is not A5-forced.
3. KMS / OS positivity does not select hidden-sector polarity. A bonus finding: the archived constant gold-angle clock Laplacian has no kernel (nontrivial charge-2 holonomy), so λ_min(A3) and λ_min(A5) sit strictly above 18 and 16, with difference exactly 2. Naive OS fails equally in both sectors for that holonomy and holds equally in the unphased control.
4. One-loop fermion self-energies have forced degeneracies (1,1,3,3,5) and massless singlets. Two inversion-allowed Yukawa rays already give incompatible zero/nonzero patterns, so no parameter-independent mass ratio exists.
5. Inversion (inside H3) is a real cut, 8 → 4 Weyl Yukawas, still not a ray. The six diameters are 1⊕5 and do not constrain the hidden 4. Optional H4/Galois identification of 3 with 3' would reach 3, still not a ray.
6. The primitive URT spiral has no finite attractor (π/e > 1). Predeclared extra normalisations miss δ* by 8.65% and 240%. δ* remains an input.
7. U(1) anomaly cancellation on the four history orbits forces the opposite-charge family (q,−q,r,−r). Inside |q_i|≤3 that family comprises every anomaly-free assignment (49 of them), and the pairing count m is never 1; the minimum positive value is m=4, hence 8 real Yukawas for two hidden quartets.
8. Those two inversion-allowed rays are explicit counterexamples to uniqueness. Hessian eigenvalue ratios of the reported two-amplitude shape V=a t²f² + b f⁴ depend on direction. Look-elsewhere: without admitting 79 by hand, R_α already has a Cathedral-looking rival 1/(51 φ²)+5/190 to relative 1.09×10⁻⁶; once π and φ are freely combined, C_mass and R_mass have hundreds of 10⁻⁴-rivals.

The four ARFs therefore still do not follow from the original URT dynamics plus the symmetries and positivity principles tested here.

## alt_cycle01 — 2I spinorial lift
Directory: `/workspace/arf_research/alt_cycle01_2I_spinor/`
Classification: PROVED (H1–H5). Advances ARF? No.
Result: no compatible spinorial structure on H13, H51 or H64; no odd-dimensional spinorial 2I-module. H13⊗2 ≅ 3·2 ⊕ 2·4' ⊕ 2·6, kinetic End-dimension 17, Sym² Yukawa to two hidden 4s of dimension 42, Dirac/End Yukawa of dimension 80. Hidden vectorial 4 ≅ 2⊗2'.
Predeclaration sha256: `450ba95f1e3a01ad1dabd35877e5141ff83e28b0c66aaca9d2b7e71f410e2a30`.

## alt_cycle02 — Hodge / incidence kinetic
Directory: `/workspace/arf_research/alt_cycle02_hodge_kinetic/`
Classification: PROVED (H1–H5). Advances ARF? No.
Result: five solids rebuild as 50 vertices and 90 edges. Icosahedral Δ has distinct eigenvalues 0, 5−√5, 6, 5+√5, so polynomials in Δ span End_A5(ℂ¹²), while S=||dφ||² selects a unique ray. Geometric H13 Hodge selects a unique ray in the 7-cone (singlet eigenvalues 0 and 13; others 6±√5 and 7); scale free. A mass term restores a 2-parameter family. No A5-forced five-solid coupling. Dodecahedral Δ splits the two 4s (eigenvalues 3 and 5). Archived G13 is not A5-equivariant.
Predeclaration sha256: `e9d69e34e5e6ffa00e40b5aa0860e3ef30c37b904b1c8861fb3d84f6e35b52da`.

## alt_cycle03 — KMS / RP / OS polarity
Directory: `/workspace/arf_research/alt_cycle03_kms_os_polarity/`
Classification: H1 FALSIFIED in part; H2 PROVED with a qualification; H3 PROVED; H4 CONDITIONAL; H5 PROVED. Advances ARF? No.
Result: archived constant gold-angle L2 ≽ 0 but has no kernel (λ_min ≈ 0.007658); λ_min(A3) and λ_min(A5) lie strictly above 18 and 16, difference exactly 2. Schur Hessian positive for both w=Δ² and w=1/Δ². Naive OS fails equally in both sectors for the gold-angle holonomy (min ≈ −2.04×10⁻⁴) and holds for the unphased control. Positive-T KMS reading of 16<18 prefers the reversed polarity, but the exact value 1/Δ² needs extra identifications. Clock gaps do not involve Δ.
Predeclaration sha256: `d0b9f7bfe0a9abe4feb6977e63180d66f0987c9dc77641b5c7d65e9f9be65c03`.

## alt_cycle04 — one-loop fermion self-energy
Directory: `/workspace/arf_research/alt_cycle04_oneloop_selfenergy/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: Σ is A5-block-diagonal with degeneracies (1,1,3,3,5); singlets stay massless. Four CG channels have distinct isotype supports. The inversion-allowed rays 3⊗5→4₃ and 3'⊗5→4₃ give incompatible zero/nonzero patterns. No parameter-independent mass ratio; C_mass and R_mass not obtained.
Predeclaration sha256: `01c55af3d3123f655ccdaf1d701ab0e08219324c6c53b9cf12d29f30a864cc3a`.

## alt_cycle05 — D6→H3, inversion, optional E8/600-cell
Directory: `/workspace/arf_research/alt_cycle05_d6h3_e8/`
Classification: H1–H3, H5 PROVED; H4 CONDITIONAL. Advances ARF? No.
Result: inversion cuts the H13 Weyl Yukawa space from 8 to 4 (4₃ ↔ {3⊗5, 3'⊗5}, 4₅ ↔ {3⊗3', Sym²5}). Still not a ray. Six diameters = 1⊕5, no constraint on the hidden 4. H3 does not swap 3 with 3'; optional Galois/H4 identification would reduce 4 to 3.
Predeclaration sha256: `fc3c7b4bb6068f42bc7d937258f3c49d1f5483713ef574779d286a57b3f63982`.

## alt_cycle06 — RG fixed points and δ*
Directory: `/workspace/arf_research/alt_cycle06_rg_attractor/`
Classification: PROVED (H1–H5). Advances ARF? No.
Result: primitive spiral has only the repelling fixed point 0 (π/e≈1.1557>1). Circle rotation number 1/φ²=(3−√5)/2 is irrational. Extra projective normalisation fixes 1−e/π≈0.134744, 8.65% away from δ*≈0.147511; spherical normalisation fixes ≈0.501330. The relaxation formula is a description, not a derivation of δ*.
Predeclaration sha256: `d628455df96978f0f5f61007d9752aa7a2d1fbd9d0d8cbcc423d8657bbfd23d2`.

## alt_cycle07 — anomaly cancellation
Directory: `/workspace/arf_research/alt_cycle07_anomaly_charges/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: opposite-charge family (q,−q,r,−r) always cancels Tr(Q) and Tr(Q³). In the window |q_i|≤3 every one of the 49 anomaly-free assignments is of that form (no others). Pairing counts m ∈ {0,4,15,20,31,32,35}; m=1 never occurs; minimum positive m=4, hence two-hidden dimension 8.
Predeclaration sha256: `3b9bae41a09c87c673915c1d0fa910042da19e9698f2e7bcf4fb430d236ef158`.

## alt_cycle08 — adversarial counterexamples and look-elsewhere
Directory: `/workspace/arf_research/alt_cycle08_adversarial/`
Classification: PROVED (H1–H5). Advances ARF? No.
Result: the two inversion-allowed Yukawa rays of alt_cycle04 are explicit counterexamples to uniqueness. Hessian ratios of V=a t²f²+b f⁴ depend on t:f (sample ratios 5.09×10⁻⁶, 0, −0.333, −0.262). Look-elsewhere, T1 strict (550725 pairs, no 79): R_α nearest rival 1/(51 φ²)+5/190 at relative 1.09×10⁻⁶; Δ_δ has no 10⁻³ hit. T1 wide finds the defining R_α writing once and a rival at 8.88×10⁻⁷. T2 (free π and φ) produces hundreds of 10⁻⁴ near-hits to C_mass and R_mass (260 and 299 in the strict grammar). Numerical coincidence is not a derivation.
Predeclaration sha256: `59900ec6f80052ae56ede2f80f48c25eee47345ad2bab88c1d10f2adc4d63dcf`.

## Overall frontier after the alternative routes

What is now proved, beyond the main coupled line:

- The kinetic cone on geometric H13 can be cut to a ray by lowest-order Hodge, but only if higher-derivative and mass terms are disallowed, and only up to scale.
- Inversion is a genuine additional cut on Yukawas (8 → 4). Anomaly cancellation is a genuine cut on charges (down to a 2-parameter opposite-charge lattice) but the minimal positive Yukawa dimension on that lattice is still 8.
- Uniqueness of the charged one-loop response is falsified by explicit counterexamples inside the declared premises.
- Hidden-sector polarity is not fixed by RP/OS. The archived gold-angle clock is a positive-definite (not semidefinite) operator.
- δ* is not an attractor of the primitive recursion.
- The four ARF writings are not isolated in a fair Cathedral grammar.

What would still be needed to derive an ARF: a principle that selects one ray in the remaining 4-dimensional inversion-allowed Yukawa space (or in the 8-dimensional anomaly-free pairing space) and one polarity, then transports that geometric response into charged H13⊕H51 matter while preserving the Ward identities. None of the eight alternative routes provides that principle.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 09–15)

Date: 10 November 2026 (Europe/London). Repo still read-only at `d71974d5ce01ad2f8f7992adf64af65810dd5436`. No commits or pushes.

Combining every previously proved cut still leaves 4 real Yukawa parameters plus one kinetic scale. Neither history signature, clock orientation, Ward/seagull/Jacobi/stability, the five-solid bridge, the dodecahedral/Hbits identification, nor maximum entropy / KMS forces a unique ray from the declared premises. Two refinements are new: Hamming parity canonically labels the four history orbits (but not 3 vs 3'); clock reversal equals the Galois dual of 2π/φ²; Cbridge splits the kinetic eigenvalues of 3 and 3'; and the dodecahedral Laplacian eigenvalues 3 and 5 are exactly 4_3 and 4_5 via the history embedding (Hbits 18 and 16). An extra, not-derived, log-det maximisation on the Yukawa sphere would pick the pure 3⊗5 → 4_3 ray because the spatial 3 is kinetically lighter. No ARF comparison was performed.

## alt_cycle09 — combined cuts
Directory: `/workspace/arf_research/alt_cycle09_combined_cuts/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: residual Yukawa dimension 4 after inversion + anomaly-free minimal charges (m = 4, not 2m) + Ward + positivity; Hodge leaves one kinetic scale. H13 alone with q_vertex = 1 is not anomaly-free (q_c = −12 gives Tr Q³ = −1716). Assignment (1, −1, 1, −1) has m = 35.
Predeclaration sha256: `55998793b16af7fdf0ae60d8d745a3ce30feb873bb5afe89ce7d1b50ba9bf9b6`.

## alt_cycle10 — chirality / handedness
Directory: `/workspace/arf_research/alt_cycle10_chirality_handedness/`
Classification: H1–H3 PROVED (H1, H2 refined); H4 CONDITIONAL. Advances ARF? No.
Result: history all-flip preserves each orbit rather than swapping pairs. Hamming parity is constant on orbits and distinguishes the two 12-orbits (odd vs even weight) and the two 20-orbits; it does not pick 3 vs 3'. Clock reversal θ → −θ equals 2π/φ̄² mod 2π, so the archived +2π/φ² is the spatial-3 orientation; L2 spectra of ±θ coincide and do not pick a Yukawa. Round 102’s swap is the S5 outer automorphism, not realised by these native operations.
Predeclaration sha256: `91292d13eb6d9856c7eef5ee8be063dee124835c2cc115b455ab543a81ac6a28`.

## alt_cycle11 — nonlinear consistency
Directory: `/workspace/arf_research/alt_cycle11_nonlinear_consistency/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: F is the unique inversion-allowed quadratic 3⊕5 → 4_3⊕4_5 up to two source scales. Ward/seagull, Jacobi-type closure and stability of V_hist ∘ F do not cut (α, β, γ, δ).
Predeclaration sha256: `a3e16b38910bf80a537cf5c7dd21225ff215e7a64302e474aefa64acf29eae63`.

## alt_cycle12 — joint Hodge + Cbridge
Directory: `/workspace/arf_research/alt_cycle12_joint_hodge_bridge/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: Tr Cbridge = 160 and Tr(Cbridge²) = 800 reproduced. Icosahedral vertex block is exactly 4 P_1 + 4 P_3. Spatial 3 is the 5−√5 Laplacian eigenspace. Joint spectrum of Δ + Cbridge: 4 (1), 9−√5 (3), 6 (5), 5+√5 (3'). Overall scale and Yukawa ratios remain free.
Predeclaration sha256: `bd3e8ebd2bd8797420c35ab6d4a1068802b38efd91ee51090302df1c233d5c5c`.

## alt_cycle13 — dodecahedral split via Hbits
Directory: `/workspace/arf_research/alt_cycle13_dodeca_hbits/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: im P3 (resp. P5) is exactly the Lface-eigenspace of eigenvalue 3 (resp. 5). History embedding gives Hbits = 18 and 16, and 21 − Hbits recovers 3 and 5 (intertwiner error 3.6×10⁻¹⁴). Hidden quartets are labelled; fermion 3 vs 3' is not.
Predeclaration sha256: `4090a6b6cf77e3a11693e59b4dc2f7afd170a96a4c44425c2e0a766aa2292921`.

## alt_cycle14 — maxent / KMS
Directory: `/workspace/arf_research/alt_cycle14_maxent_kms/`
Classification: H1, H2, H4 PROVED; H3 CONDITIONAL. Advances ARF? No.
Result: Haar measure on S³ (or on the Galois-even S²) is not a point. KMS does not apply to Yukawa parameters. An extra log-det maximisation on the sphere, using the Hodge kinetic, has a unique maximiser up to signs: the pure 3⊗5 → 4_3 ray (value 19.7528 versus 19.0792 for the 3' ray), because λ3 = 5−√5 is lighter. That principle is not derived.
Predeclaration sha256: `f2d365b994810aa88af5b630eceb64f50048590f14bcd1ee60a1d075674f0f82`.

## alt_cycle15 — observables if a unique ray emerged
Directory: `/workspace/arf_research/alt_cycle15_unique_ray_observables/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: no unique ray was derived from the declared premises, so no ARF comparison was performed. Independently, the A5 mass pattern (1,1,3,3,5) with massless singlets cannot give three distinct lepton masses, and no vertex-to-edge charged current is available for an electromagnetic response.
Predeclaration sha256: `f8c668ae3eb6c4846790aff4cd0ca721ffaecd8b8ed242ac25393fcac7e71c1a`.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 16–20)

Date: 10 November 2026 (Europe/London). Repo still read-only at `d71974d5ce01ad2f8f7992adf64af65810dd5436`. No commits or pushes.

The log-det maximiser of alt_cycle14 is not the one-loop effective action of the coupled path integral: integrating fermions first gives −Tr log(K+Yh) as a functional of the hidden field, integrating the Gaussian hidden sector first gives a four-fermion theory, and the two quadratic expansions of ⟨log det(K+M)⟩ and log det(K+Σ) have opposite leading Yukawa dependence. Yukawas are not integration variables. The pure 3⊗5 → 4_3 ray therefore remains CONDITIONAL and is not promoted to PROVED. Hamming-parity orbit labels do not imply source-matching. None of the 24-clock, ρ*, the 2I lift, or the five-solid bridge breaks A5 to three nondegenerate charged masses. A unique Hodge Noether current on the 90 spatial edges exists and satisfies Ward, but Cbridge is non-local (36 off-edge pairs on the icosahedron) and the one-loop EM response is infrared-singular. No ARF comparison was performed.

## alt_cycle16 — path-integral status of log det(K+Σ)
Directory: `/workspace/arf_research/alt_cycle16_path_integral_logdet/`
Classification: PROVED (H1–H6). The pure 3⊗5 → 4_3 ray remains CONDITIONAL, not promoted to PROVED. Advances ARF? No.
Result: Euclidean Z_ψ[h] = det(K+Yh), so S_eff[h] contains −Tr log(K+Yh). The exact hidden Gaussian integral is a four-fermion theory, not det(K+Σ). On a two-channel Hodge analog, ⟨det(K+M)⟩ and det(K+Σ) differ by 26–45%. The quadratic shifts have opposite sign: the cycle-14 proxy prefers pure α, while ⟨log det(K+M)⟩ prefers pure β. Π/α² ≈ 0.482 > Π/β² ≈ 0.184 > 0; the hidden Hessian correction stiffens every inversion-allowed channel and does not pick a ray. Yukawas are parameters, not integration variables.
Predeclaration sha256: `28f9483b82bd7faa8d873539939e8203a7c8e28365842d321392c73f6a5b7ac3`.

## alt_cycle17 — source-matching from Hamming-parity orbit labels
Directory: `/workspace/arf_research/alt_cycle17_source_matching/`
Classification: H1 PROVED; H2 FALSIFIED; H3 PROVED. Advances ARF? No.
Result: Hamming parity is constant on the four orbits and each 12-orbit decomposes as 1⊕3⊕3'⊕5 (permutation character (12, 0, 0, 2, 2)). Orbit projectors are scalars on each orbit and cannot kill 3'⊗5 → 4_3 while keeping 3⊗5 → 4_3. The invariant part of Hamming weight is the constant 3. Source-matching remains an extra assumption.
Predeclaration sha256: `1026ea2729128baab1c05562df8c3f3ab4e73edd8fda413b013e1c4a7062f1ec`.

## alt_cycle18 — minimal A5 breaking for three distinct charged masses
Directory: `/workspace/arf_research/alt_cycle18_a5_breaking/`
Classification: PROVED (H1–H4); overall FALSIFIED that any of the four structures works. Advances ARF? No.
Result: Hodge, Hodge+Cbridge, the product with the 24-clock, and ρ* all preserve spatial degeneracies (1, 3, 3, 5). ρ* can separate the three numbers m3, m3', m5 but not their multiplicities, and the singlets stay massless. H13⊗2 ≅ 3·2 ⊕ 2·4' ⊕ 2·6 has no singlet. Selecting one of the six C5 vertex axes would split 3 → 1⊕2, but that choice is not supplied by these structures.
Predeclaration sha256: `51c5d6e3b70f732fe9d8f3ed320df578a2443f623f99358cb78d545e0942a6d8`.

## alt_cycle19 — vertex-to-spatial-edge charged current
Directory: `/workspace/arf_research/alt_cycle19_spatial_current/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Unique Hodge Noether current j_e = −2q Im(ψ_i* ψ_j) on the 90 spatial edges (q = 1) matches ∂S/∂A_e and satisfies the first Ward identity on every solid. Cbridge is nonzero on all 36 off-edge icosahedral pairs; the Hodge current fails Ward for Hodge+ungauged Cbridge (residual ≈ 26.6). One-loop Π_T on the 19-dimensional transverse edge space is infrared-singular: λ_min(Π_T) ∼ 2/(ε n) with n = 12, so the predeclared ratio R_EM depends on the regulator (values 2.01, 21.64, 217.99, 2181.52 at ε = 10^{-1}…10^{-4}). No comparison with R_α was performed.
Predeclaration sha256: `45c12b5daa735c331d270d90497acab6387c48b8220112bded4373b1afdc8800`.

## alt_cycle20 — observable pipeline only if cycle 16 derived a ray
Directory: `/workspace/arf_research/alt_cycle20_pipeline_if_ray/`
Classification: PROVED (H1–H2). Advances ARF? No.
Result: Cycle 16 did not set `pure_alpha_ray_derived` to true, so the one-loop observable pipeline was not run and no ARF comparison was performed. Independently, the A5 pattern (1, 1, 3, 3, 5) still cannot give three distinct lepton masses, and cycle 19 found no finite parameter-free EM response.
Predeclaration sha256: `abac6aa80ac4311a830a59aa9ddfd1bb03972aeed5a9d6d39dc76622506c9b8c`.

No repository files were modified, committed, or pushed.
