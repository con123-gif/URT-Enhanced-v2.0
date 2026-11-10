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
