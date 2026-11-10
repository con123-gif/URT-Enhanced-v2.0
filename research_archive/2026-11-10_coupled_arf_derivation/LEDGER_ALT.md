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

## Frontier update (alt_cycles 21–24)

Date: 10 November 2026 (Europe/London). Repo still read-only at `d71974d5ce01ad2f8f7992adf64af65810dd5436`. No commits or pushes.

V_hist is positive definite on 4_3 ⊕ 4_5 with unique minimum at the origin (stabiliser A5). No nonzero hidden vector has stabiliser C5 or D5, and V∘F vanishes for every t at f = 0, so there is no derived five-fold axis and no three distinct charged masses from this vacuum. On the icosahedron, Cbridge can be gauged by incidence Wilson lines without new continuous couplings and Ward is restored, but every off-edge pair has multiple shortest paths and two canonical recipes give currents that differ by relative 0.85; the full five-solid Cbridge has 836 cross-solid nonzero entries with no incidence path. The three named internal IR cutoffs (and two predeclared clock product-sums) all make R_EM finite, but none lies within relative 10^{-4} of R_α (closest is η, at 90% relative error). The V_hist vacuum sets both hidden vevs to zero and does not fix y_even : y_odd.

## alt_cycle21 — vacuum alignment of V_hist
Directory: `/workspace/arf_research/alt_cycle21_vacuum_alignment/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: V_hist = c3 ||h3||² + Δ² c5 ||h5||² is positive definite (Hessian 0.444476 ×4 and 2.711×10^{-6} ×4). Unique minimum at the origin, stabiliser A5. C5/D5 cannot fix a nonzero vector in 4_3 ⊕ 4_5 (the 4 is the deleted permutation representation). V∘F vanishes on the plane f = 0 for every t, so no axis in the 3 is selected. Three distinct charged masses do not arise.
Predeclaration sha256: `52f544dc54dd85235a4c15b2f618b28c010a4edeaa98700c0eec95f675b4c702`.

## alt_cycle22 — gauge the bridge
Directory: `/workspace/arf_research/alt_cycle22_gauge_bridge/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: Both shortest-path-average and lex-first-path Wilson recipes restore exact gauge invariance of Hodge + icosahedral Cbridge (residuals 2.8×10^{-14} and 0) with no new continuous couplings. All 36 off-edge pairs have 2–10 shortest paths; the two currents differ by relative 0.855. 2I does not pick a path. 836 of 920 cross-solid vertex pairs have nonzero Cbridge and no incidence path.
Predeclaration sha256: `3a71adae486aa709859679531a01b3fbcd3a40c4fe650c52a98bbc3a2c46acac`.

## alt_cycle23 — IR regulators from inside the system
Directory: `/workspace/arf_research/alt_cycle23_ir_cutoff/`
Classification: H1 PROVED; H2 CONDITIONAL; H3 PROVED. Advances ARF? No.
Result: R_EM(η) = 0.003337, R_EM(λ_min L2) = 28.312, R_EM(2 Δ² c5) = 80475, R_EM(Σ Π(λ_k)) = 39.509, R_EM(Σ Π(r² λ_k)) = 29.261. Relative errors to R_α ≈ 0.033805 are 0.901, 836, 2.38×10^6, 1168, 865; none within 10^{-4}. Using η or the hidden Hessian as a spatial mass is an extra identification; the product sums assume clocked fermions. T1/G_strict look-elsewhere: R_α still has rival 1/(51 φ²)+5/190 at 1.09×10^{-6}; no R_EM matches R_α.
Predeclaration sha256: `2d37695519814751a5b5fabf81b06e21eb871ebf9c5b72199deaae55b0078b1a`.

## alt_cycle24 — y_even : y_odd from the vacuum of route 21
Directory: `/workspace/arf_research/alt_cycle24_yeven_yodd/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Both hidden vevs vanish, so neither inversion parity is killed. The residual pairing-current ratio remains free (dimension 2). The stiffness ratio c3/(Δ² c5) ≈ 163951 is an extra matching recipe already considered in coupled cycle 12, not a consequence of the vacuum location.
Predeclaration sha256: `ecef47269f8f29bf2f68391ca7d6cd27b01f06504b63920762cecbf5abf68d8f`.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 25–27)

Date: 10 November 2026 (Europe/London). Repo read-only at `6bad7b3` (“Add exact nilpotent-excited-Walsh chronology regression”). No commits or pushes.

The hidden 4_5 stiffness 2.711×10^{-6} does produce dynamical pairing condensation: at the KMS temperature η the even-channel critical Yukawa is y_c = 0.00594, so any O(1) even Yukawa condenses and the vacuum is not the origin. The odd channel has y_c = 2.38 and stays at the origin for y_odd = 1. The condensate direction is selected by the nuclear norm of the pairing matrix and has stabiliser A4. The predeclared T=0 linear infrared singularity does not occur (the residual frames annihilate the constant mode). The ratio y_even : y_odd remains free. The A4 vacuum induces a rigid pairing spectrum 0 ⊕ 3 ⊕ 6 ⊕ 2 with large-vev mass ratios 0 : 2 : √5 : 3, not three nondegenerate charged singlets, and none of the recorded ratios matches |C_mass|, |R_mass| or |C/R| at 10^{-4}. The predeclared D6→H3 nearest-length rule yields 12 links and does not restore five-solid Ward; keeping all three observed root-parallel lengths does restore Ward but makes the path ambiguity worse, not unique.

## alt_cycle25 — dynamical condensation from the soft 4_5
Directory: `/workspace/arf_research/alt_cycle25_dynamical_condensation/`
Classification: PROVED (main claims); H1 linear T=0 singularity FALSIFIED. Advances ARF? No.
Result: y_c(even, T=η) = 0.005940, y_c(odd, T=η) = 2.380. Any O(1) even Yukawa condenses (||h5||_* ≈ 8.613×10^5 at y_even = 1); the odd channel does not condense at y_odd = 1. The nuclear-norm maximiser has stabiliser A4 (order 12). χ is isotropic; direction selection is large-vev. The residual frames annihilate the constant mode, so Ω_f is quadratic at T=0 and y_c(T=0) is finite (0.003845 even, 1.408 odd). The reduced Dirac-like curvature at the origin is positive. y_even : y_odd is not fixed and is qualitatively irrelevant except near the pure-odd axis.
Predeclaration sha256: `af7c008ce85973517f5ae1c65699a5863c82c2a46e56d5cf6651f4c3eea4b8a2`.

## alt_cycle26 — charged-fermion masses from the broken vacuum
Directory: `/workspace/arf_research/alt_cycle26_condensate_masses/`
Classification: PROVED. Advances ARF? No.
Result: Unique A5-orbit (stab A4). Finite-r BdG spectrum: 0 (×1), 3.144879×10^5 (×3), 3.516060×10^5 (×3), 3.516104×10^5 (×3), 4.717319×10^5 (×2). The two nearby triplets are a Laplacian split (relative 1.27×10^{-5}) of one pairing level. Large-vev singular values give 0 ⊕ 3 ⊕ 6 ⊕ 2 with ratios 0 : 2 : √5 : 3, i.e. r times {0, √(2/15), √(1/6), √(3/10)}. Three distinct positive levels without new parameters, but not three singlets, and a charged massless mode survives. Recorded ratios were written before comparison; none matches |C_mass|, |R_mass| or |C/R| within 10^{-4} (closest μ4/μ1 vs |C/R|, relative error 0.180). T1/G_strict writes 3/2 and √5/2 as two-atom sums, which is the algebraic identity, not an ARF match.
Predeclaration sha256: `df96bd9d6faea2f9ccd331ced90e04dc77d6822b9140c30dd6b014fd411a11c0`.

## alt_cycle27 — inter-solid links from the D6 → H3 projection
Directory: `/workspace/arf_research/alt_cycle27_d6_intersolid_links/`
Classification: PROVED. Advances ARF? No.
Result: 108 root-parallel inter-solid pairs, in three lengths φ^{-2} (12), φ (24) and 2 (72), with ratios φ³ and 2φ². Predeclared C4 keeps only the 12 shortest links (φ³ is not in {φ, φ^{-1}, φ², 2}); those join only dodecahedron to icosahedron (four components). 596 of 1063 nonzero Cbridge pairs stay disconnected, so full five-solid Ward is not restored and the 0.855 icosahedral ambiguity is unchanged (off-edge paths still 2–10). Diagnostic: keeping all three observed lengths (108 links) connects every Cbridge pair and restores exact Ward (residuals 1.1×10^{-13}), but 547 pairs have multiple shortest paths (ico off-edge 2–12) and the two currents differ by relative 0.589. The links do not make the gauged current unique.
Predeclaration sha256: `e2bbdd4c35e5debc07e721124f4f1c3b7dc9da25043063b3ccdd9584a40d693b`.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 28–30)

Date: 10 November 2026 (Europe/London). Repo read-only at `6bad7b3`. No commits or pushes.

The 4_5 pairing condensate of alt_cycle25 is robust: the vev stays finite at T = η and T = 0 once V∘F and the second parity are included, V∘F adds no hidden quartic, and the number 8.61×10^5 is the tree/pairing balance in cycle-03 hidden-frame units, not a unit error. Cycle 13’s π_o, π_e stiffen the Dirac measure (origin stable); the pairing χ softens with the opposite sign and similar magnitude (~10^{-2}) and must not be added. The stabiliser remains A4; the induced h3 is 10^{-11} of ||h5||. The condensate is charge 2 and breaks geometric U(1) to ℤ2, but the BdG zero mode is an unpaired constant fermion rather than the Goldstone, and the fermion-induced London kernel is not a positive Meissner mass (no archived |DΔ|²), so the photon is not shown to be Higgsed and the IR problem of R_EM remains. No derived subleading effect (odd response, V∘F portal, ρ*, Hodge/Cbridge kinetics, or a labelling-independent clock phase) breaks A4 or splits the triplets into 1 ⊕ 1' ⊕ 1''. C_mass and R_mass were not compared.

## alt_cycle28 — robustness of the 4_5 pairing condensate
Directory: `/workspace/arf_research/alt_cycle28_condensation_robustness/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: r_* = 8.61261×10^5 at T = η and T = 0, for (y_e, y_o) = (1, 0) and (1, 1), matching (nuclear norm)/(4 c_even) to 0.6%. V∘F realises the A4 direction on the rank-1 cone (||α|| ≈ 1.516 for the unit hat, ≈ 1890 for the large vev) but supplies no extra hidden quartic. Cycle-13 π_e/2 = 0.013167 stiffens the Dirac combination ½(H5+π_e) = +0.013168; pairing χ_even = 0.038416 gives c_even − χ = −0.038414. They are alternative measures, not two terms; a counterfactual sum would shrink r_* to 88.1. Induced ||h3||/||h5|| ≈ 7.8×10^{-12}; stabiliser A4 is robust.
Predeclaration sha256: `4a6b86143276595bc0ce26e85fcb2d2f31facf0d88a6f52f45a5dbdf30baa01e`.

## alt_cycle29 — charge-2 pairing, geometric U(1), and the photon
Directory: `/workspace/arf_research/alt_cycle29_charge2_higgs/`
Classification: H1–H2 PROVED; H3 FALSIFIED; H4 PROVED. Advances ARF? No.
Result: Pairing is charge 2 and breaks geometric U(1) to ℤ2. The BdG zero mode has K v0 = 0 and ||Δ v0|| ≈ 1.0×10^{-10} (unpaired constant fermion), not the Goldstone; a global phase of Δ leaves the spectrum invariant (max difference 4.7×10^{-10}). The fermion-induced London kernel on the 19-dimensional cycle space is not positive definite (at r = 20: T = η eigenvalues in [−0.00155, +0.00665]; T = 0 all negative, in [−0.0953, −0.0708]). Finite-A scans at the physical vev lower Ω. There is no archived |DΔ|², so the photon is not shown to acquire a Meissner mass. R_α was not compared.
Predeclaration sha256: `6179cdd27ac0b876eb13df54c70028463828f9385207d49effe44501f789fca7`.

## alt_cycle30 — residual A4 and three singlet masses
Directory: `/workspace/arf_research/alt_cycle30_A4_splitting/`
Classification: PROVED (H1–H4). Advances ARF? No.
Result: Induced h3, the V∘F portal and ρ* all preserve A4 (||h3||/||h5|| ~ 10^{-11}). The 3 of A4 is irreducible, so A4-invariant operators cannot split it into 1 ⊕ 1' ⊕ 1''. There is no labelling-independent insertion of θ = 2π/φ² on the icosahedral 2-complex. Hodge Λ and K+C_ico lift the unpaired mode to 1 and 4 respectively but leave a pairing doublet; no spectrum consists of three nondegenerate singlets. C_mass and R_mass were not compared.
Predeclaration sha256: `2bc28647cfcfa8e26cf9aacc74d7625d3db91f9feef6b202832c49b188fff9c5`.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 31–33)

Date: 10 November 2026 (Europe/London). Repo read-only at `6bad7b3`. No commits or pushes.

The negative London kernel of alt_cycle29 is a genuine instability of the condensed A4 phase. At κ = 0 (the fermion-only action) the joint minimum over the 30 icosahedral edge phases is the all-π connection: every face holonomy is −1, the unpaired mode is lifted to energy 10, and the fermion gain is −5.000 at T = 0 and −1.880 at T = η. The pattern is A5-invariant, so the combined (Δ, A) stabiliser remains A4; time reversal is not broken and no handedness is picked. The minimum is finite because the domain (ℝ/2πℤ)^{30} is compact, with no new parameters. The condensate scale r_* does not shift. The Hodge Maxwell coefficient κ is not uniquely derived: at the unit identification κ = 1 the order-π magnetic cost (40 compact, or 10π² noncompact) overwhelms the O(1) fermion gain, while gradient deformations A = dλ cost no Maxwell and lift the unpaired mode at zero flux, so A = 0 is not in general restored. In the κ = 0 vacuum the pairing multiplets remain 3 ⊕ 6 ⊕ 2 (ratios 2 : √5 : 3) under a lifted singlet of energy 10; the unique |Φ| is π, which matches the predeclared U(1) quantum π as an identity and does not match 2π/φ², γ or δ*. There are no three nondegenerate charged singlets, so C_mass and R_mass were not compared. The 2I spinor lift (vertex12 ⊗ 2, no singlet) gaps the kinetic operator (λ_min = 0.746746); pairing Δ ⊗ ε does not by itself lift the kernel of K ⊗ I_2. The even channel still condenses (y_c = 0.004203, r_* ≈ 1.735×10^6). The unpaired zero disappears, but the spectrum becomes 2 ⊕ 6 ⊕ 12 ⊕ 4, not three distinct levels.

## alt_cycle31 — spontaneous gauge flux in the condensed A4 phase
Directory: `/workspace/arf_research/alt_cycle31_spontaneous_flux/`
Classification: PROVED (H1–H3); unique pattern CONDITIONAL on κ. Advances ARF? No.
Result: Primary A is the 30 icosahedral edges (the other 60 five-solid edges have no derived hopping). κ is free (κ = 0 is the alt29 action; κ = 1 is the Hodge unit identification). At κ = 0 the minimiser is A_e ≡ π at T = η and T = 0, with every face holonomy −1, combined stabiliser A4, no T-breaking and no handedness, fermion gain −5.000 (T = 0) and −1.880 (T = η). The minimum is finite without new parameters. Absolute Ω = c_even r² + F(r, A) keeps r_* = 8.61261×10^5 (relative shift 0). At κ = 1 the all-π Maxwell cost (40 or ≈ 98.7) exceeds the fermion gain; gradient probes and the T = η noncompact run show a zero-flux phase-winding instability that Maxwell does not penalise.
Predeclaration sha256: `ca3dc438de76083657f7edd0b4e7b22362122047aa4182a27d69647b444d6eb3`.

## alt_cycle32 — spectrum and fluxes of the spontaneous-A vacuum
Directory: `/workspace/arf_research/alt_cycle32_flux_spectrum/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: In the κ = 0 vacuum the unpaired mode is lifted to E = 10 and the pairing spectrum remains 3 ⊕ 6 ⊕ 2 (large-r ratios 2 : √5 : 3, with the known 1.27×10^{-5} split of the 6). Not three nondegenerate charged singlets. The per-face flux is π, matching the predeclared quantum π at relative error 0 (identity) and not matching 2π/φ² (rel 0.309), γ (rel 253) or δ* (rel 20.3). The κ = 1 seed minimum is A = 0, so the two discrete κ choices disagree. No unique three-singlet spectrum; C_mass, R_mass and T1/G_strict were not compared.
Predeclaration sha256: `5a953fcfa10fe4b61f5697125390893847acb3e4c788241fac6393d8df6b98fc`.

## alt_cycle33 — pairing on the 2I spinor lift
Directory: `/workspace/arf_research/alt_cycle33_spinor_lift/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: K_spin has gap 0.746746 and no zero mode; face holonomy traces equal 2 cos(π/10), the spherical spin holonomy of an icosahedral face (Ω = π/5). K ⊗ I_2 keeps a 2-dimensional kernel which Δ ⊗ ε does not lift. Even pairing still condenses at T = η, y = 1: χ = 0.076728, y_c = 0.004203, r_* = 1.73493×10^6 (nuclear norm twice the spatial value). The unpaired zero is absent (E_min equals the K_spin gap). The condensed spectrum is 2 ⊕ 6 ⊕ 12 ⊕ 4 — the spatial 0 ⊕ 3 ⊕ 6 ⊕ 2 tensored with the spin 2 — not three distinct levels. The extra H13 singlet ⊗ 2 is a decoupled spectator.
Predeclaration sha256: `5a4062431318f8721cea277d629ddc867876297230efa45d05e6e7843913a11a`.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 34–36)

Date: 10 November 2026 (Europe/London). Repo read-only at `6bad7b3`. No commits or pushes.

Integrating out the charged matter actually coupled to the 30 icosahedral edges does not produce a unique positive Maxwell coefficient. In the primary condensed sector (12-component H13, graph kinetic, even pairing) the T = 0 transverse Hessian is −I/12, an identity-like wrong-sign mass from the unpaired mode, not a multiple of Δ1_T. Generalised eigenvalues κ_i = (−1/12)/λ_i(Δ1_T) lie in [−0.109, −0.016] with spread 2.33; κ_iso = −1/48. Hodge Λ = K+I and the 13-site geometric Hodge give the same T = 0 Hessian; the spinor lift gives another negative multiple of I (−0.141771 I) and a still larger preference for π-flux (ΔΩ = −8.506). Other solids and the history/clock sector have no derived coupling to this A and were not added. With no external Maxwell term the derived vacuum is the all-π flux phase. Its spectrum is 10 ⊕ 3 ⊕ 6 ⊕ 2, not three singlets, so C_mass and R_mass were not compared. Because induced κ is negative and not Maxwell-like, 1/κ was not compared to R_α. The eight commits from d71974d to 6bad7b3 add only an H64 chronology / conditional charge-two pair-count certificate (verification rerun: PASS). They derive no Maxwell coefficient, no new spatial current, and no historical ARF.

## alt_cycle34 — induced Maxwell coefficient from vacuum polarisation
Directory: `/workspace/arf_research/alt_cycle34_induced_kappa/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Primary T = 0 Π_T = −(1/12) I_19 (rel 5.8×10^{-5}), all 19 eigenvalues negative, Maxwell residual 0.459, κ_iso = −1/48, κ_REM = (−1/12)/(3−√5) ≈ −0.109, generalised κ in [−0.109, −0.016]. T = η: residual gapped Hessian O(10^{-6}) with mixed signs; unpaired mode drops out at quadratic order. Full Ω(π)−Ω(0) = −5.000 (T = 0) and −1.880 (T = η). Hodge Λ = K+I: same T = 0 Hessian, T = η Π_T = −[tanh(1/(2η))/12] I ≈ −0.006934 I. 13-site Hodge: same T = 0 Hessian, unpaired energy 8 at A = π. Spinor: Π_T = −0.141771 I at T = 0, ΔΩ(π) = −8.506. Every sector selects π-flux. No unique positive κ.
Predeclaration sha256: `fbbb0892457b055b3f5fa849d653507ee8f27091f3c371f189896d1bca606c11`.

## alt_cycle35 — spectrum and induced-α in the derived vacuum
Directory: `/workspace/arf_research/alt_cycle35_derived_vacuum/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Derived vacuum is all-π. Spectrum 10 ⊕ 3 ⊕ 6 ⊕ 2 (E_min = 10; pairing levels r_* times √(2/15), √(1/6), √(3/10), with the known 1.27×10^{-5} split of the 6). Not three nondegenerate charged singlets; C_mass and R_mass were not compared. Primary κ fails uniqueness, positivity and Maxwell-likeness, so 1/κ was not compared to R_α ≈ 0.033805. The spinor alternative also selects π-flux and, at A = 0, still has the 2 ⊕ 6 ⊕ 12 ⊕ 4 spectrum.
Predeclaration sha256: `f401434d06dfc47b28d32e572dff02a4abcc038a5fbd592ffee0aa25dab4ccc2`.

## alt_cycle36 — read-only diff of d71974d..6bad7b3
Directory: `/workspace/arf_research/alt_cycle36_repo_diff/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Eight commits (10 November 2026, 07:23:17–07:24:31 Europe/London) add three files (279 lines) and modify nothing prior: an exact H64 Walsh/Hbits A5 quartet certificate and two notes. Verification script rerun: exit 0, all assertions reproduced (276 → 8 → 4 → 2 conditional pair counts; [2Q, Hbits] = 0; (2Q)^6 = J_64; unique Q-stationary zero-energy line). No derived Maxwell coefficient, no new charged current onto the 30 icosahedral edges, no change to H13 kinetics, no ARF derivation (all four historical ARFs remain OPEN; an intermediate count of four is not an ARF identification). Does not change the hypotheses of routes 34–35.
Predeclaration sha256: `7443626033ad600a412600778aadd4626c56027e5e7fccbe69da91bb8fcf6610`.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 37–39)

Date: 10 November 2026 (Europe/London). Repo read-only at `6bad7b3`. No commits or pushes.

The matching nested counts 276 → 8 → 4 → 2 in the new H64 certificate and in our H13 pairing chain are a coincidence of counts, not the same subspaces: for every energy-respecting embedding of 3, 3', 5 into H64 the images are Hilbert–Schmidt orthogonal (all principal angles 90°, overlap ≤ 2.8×10^{-16}). The Clebsch–Gordan types differ (certificate 1⊗4 on H_0 ⊗ H_16/H_18 versus our 3⊗3', 3⊗5, 3'⊗5, Sym² 5 on pairs among H_10, H_16, H_18). Combining π-flux with the 2I spinor lift produces face holonomy traces −2 cos(π/10) and does not reduce the residual A4 (combined stabiliser still A4, traces real, no T-handedness). The fermion-only vacuum remains π-flux (ΔΩ = −8.506 at T = 0 and −3.240 at T = η) with spectrum 2 ⊕ 6 ⊕ 12 ⊕ 4 and the lowest 2 lifted from 0.747 to 9.253; not three singlets. Static Gaussian fluctuations of 4_3 ⊕ 4_5 about the A4 condensate have an A4-invariant, positive-definite Hessian (κ_rad = 2 c_even = 2.711024×10^{-6}, κ_ang = 1.626079×10^{-6}, κ_odd = 2 c_3 = 0.444475). The raw 8×8 finite-difference Hessian at step 0.02 had mixed-sign O(10^{-6}) even eigenvalues; those are cancellation noise, resolved by directional second derivatives that are stable across δh ∈ {50, 200, 1000, 3000}. The five A5-related A4 directions remain degenerate (no order by disorder). The one-loop fermion self-energy is a scalar on each multiplet (relative spreads ~ 10^{-14}) and does not produce three nondegenerate charged singlets, so C_mass and R_mass were not compared. No Higgs kinetic, Nambu–Gor'kov Ward EM response, or y_even history normalisation was introduced.

## alt_cycle37 — principal angles of the two 276 → 8 → 4 → 2 flags
Directory: `/workspace/arf_research/alt_cycle37_paircount_angles/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Eight energy-respecting embeddings (3, 3' independently into H_10 or H_18; 5 into H_16; two Walsh A5 realisations) all give V8 ⊥ C8 and V4 ⊥ C4_S, every principal angle 90°, max overlap singular value 2.83×10^{-16}. C8 image dimension 32 (CG type 1⊗4); V8 image dimension 16 (CG types 3⊗3', 3⊗5, 3'⊗5, Sym² 5). C4_B was not constructed (source isometry U_h not invented); orthogonality to all of C8 already implies orthogonality to C4_B and C2. The matching counts are a coincidence, not an identification of cuts.
Predeclaration sha256: `ec4c48302559e5abd3964812cee1af2dd846b16e2621ccdbcd372a645180a179`.

## alt_cycle38 — π-flux combined with the spinor lift
Directory: `/workspace/arf_research/alt_cycle38_piflux_spinor/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Combined face holonomy traces equal −2 cos(π/10) = −1.902113032590307 on all 20 faces (A = 0 traces equal +2 cos(π/10)). Holonomy stabiliser A5; Δ stabiliser A4; combined stabiliser A4 (order 12), not ℤ3 or ℤ2. Traces real; time reversal does not pick a handedness. Spectrum at the π-flux vacuum: 2 ⊕ 6 ⊕ 12 ⊕ 4 with E_min = 9.253254 (the A = 0 spinor gap 0.746746 lifted by π-flux); pairing levels unchanged at 633507.653 × 6, 708283.088 × 12, 950261.479 × 4. Not three nondegenerate charged singlets; C_mass and R_mass were not compared. Fermion-only vacuum is π-flux: ΔΩ = −8.506450 (T = 0) and −3.240247 (T = η), matching cycle 34’s spinor sector; random connections lie between A = 0 and A = π.
Predeclaration sha256: `41506a6dadd257d348b398a30a09aada123762e61d915c31ec2e8b2a8da743a8`.

## alt_cycle39 — Gaussian fluctuations of 4_5 and 4_3
Directory: `/workspace/arf_research/alt_cycle39_gaussian_fluctuations/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: A raw 8×8 finite-difference Hessian at step 0.02 mixes the O(10^{-6}) 4_5 block with cancellation noise (two apparent negative eigenvalues ~10^{-6}); it remains A4-invariant (commutator residual 9.0×10^{-6}). Directional second derivatives are stable and positive definite: κ_rad = 2.711024×10^{-6} = 2 c_even, κ_ang = 1.626079×10^{-6} (the 3 of A4), κ_odd = 0.444475 = 2 c_3. Relative fluctuation amplitude δh_rad / r_* ≈ 7.1×10^{-4}. The A5-orbit of ĥ has size 5 and equal Hessian patterns; fluctuations do not select a direction. The raw inverted Hessian produces a spurious O(1) split of every multiplet; the sanitized A4-invariant covariance gives a scalar W on each (relative spreads ~ 10^{-14}; shifts 0.261, 0.073, 0.073, 0.391 on the 3, 3, 3, 2). No three nondegenerate charged singlets; C_mass and R_mass were not compared. No Higgs kinetic was introduced.
Predeclaration sha256: `c64442acb624642fcd3ca34ef814be7659dd49f6a5fad10a7fe4b61c09ac3a5c`.

No repository files were modified, committed, or pushed.

## Frontier update (alt_cycles 40–42)

Date: 10 November 2026 (Europe/London). Repo read-only at `6bad7b3`. No commits or pushes.

The only derived pairing on the Cathedral’s other solids is the polar-duality lift of the residual even/odd frames from the 30 icosahedral edges to the 30 dodecahedral edges. Abstract H51 (2·1 ⊕ 3·3 ⊕ 3·3' ⊕ 4·4 ⊕ 3·5) has no canonical embedding and is not used as a BCS carrier; tetra/cube/octa have Hodge kinetics but no A5 and no derived pairing; Cbridge and F do not produce a charge-2 bilinear. On the dodecahedron the even / 4_5 channel condenses (y_c = 0.005791, r_* = 9.852×10^5) with stabiliser D3, not A4; the odd channel does not (y_c = 2.345). Both pairings couple to the same hidden 4_5, so there is a single h. The joint nuclear-norm sum is maximised on the H13 A4 ray (sum 9.739 versus 9.425 at the dodeca D3 ray: icosahedral variation 0.553 outweighs the dodecahedral preference 0.239). Overlap of the two preferred rays is √6/4 ≈ 0.612372. The true joint stabiliser is A4. The 32-site spectrum at that vacuum is a tower of A4 multiplets (plus an unpaired near-zero on K0, lifted by Cbridge), not three nondegenerate charged singlets, so C_mass and R_mass were not compared. No Higgs kinetic, Nambu–Gor'kov Ward EM response, or y_even history normalisation was introduced, and the coupled line’s π-flux GI response and SYNTHESIS.md were not duplicated.

## alt_cycle40 — derived pairing/condensation on H51
Directory: `/workspace/arf_research/alt_cycle40_h51_condensation/`
Classification: PROVED (H1–H3, with H3 reporting D3 rather than the expected A4). Advances ARF? No.
Result: Duality lift of the residual frames onto the dodecahedron is the complete adjacent pairing (edge modules isomorphic). Even / 4_5 condenses at T = η, y = 1: χ = 0.040417, y_c = 0.005791, r_* = 9.85212×10^5, nuclear-norm maximum 5.337632, stabiliser D3 (order 6). Odd / 4_3 has y_c = 2.345 and does not condense. Cbridge as a kinetic control and T = 0 leave the same D3 even vacuum. Abstract H51 is not a condensate carrier; tetra/cube/octa have no derived pairing.
Predeclaration sha256: `151029c0f4c22ffa3100a7138f7d6fd549816a2c32baf1d3363850dd453340c3`.

## alt_cycle41 — joint H13 + H51 vacuum
Directory: `/workspace/arf_research/alt_cycle41_joint_h13_h51/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: A single shared 4_5, no relative-orientation modulus. ĥ_ico has stab A4 and ĥ_d has stab D3; ĥ_joint coincides with ĥ_ico (overlap 1) and not with ĥ_d (overlap √6/4). Joint nuclear sums 9.739158 (A4) versus 9.424628 (D3). Combined stabiliser A4 on both pairing matrices. Even joint y_c = 0.004147, r_* = 1.797640×10^6 on K0 and on KC = K0 + Cbridge|_{32}; odd joint y_c = 1.670, no condensate. Cbridge does not change the ray or the stabiliser.
Predeclaration sha256: `b7af64ab104d209945ef9a94ea52254aaa7527bd4f631a64310b640dc0a6163f`.

## alt_cycle42 — joint spectrum and mass-ARF comparison
Directory: `/workspace/arf_research/alt_cycle42_joint_singlets/`
Classification: PROVED (H1–H3). Advances ARF? No.
Result: Joint stabiliser A4, so A4-triplets do not split and the comparison gate stays closed. K0 spectrum: unpaired ~0 × 1, then 3 × 4, 7.376×10^4 × 3, 1.907×10^5 × 1, 6.564×10^5 × 5, 7.302×10^5 × 3, 7.339×10^5 × 12, 8.471×10^5 × 1, 9.846×10^5 × 2. KC lifts the constant (lowest levels 3 × 1, 4 × 1, 5 × 3) and leaves the pairing tower unchanged; four numerical multiplicity-1 levels sit among leftover multiplets and are not a 1 ⊕ 1' ⊕ 1'' split. Not three nondegenerate charged singlets. C_mass and R_mass were not compared.
Predeclaration sha256: `8e569988e670badfa454e3e64e8d05a5e595715d5fcce478ecf2e8a2d692d228`.

No repository files were modified, committed, or pushed.
