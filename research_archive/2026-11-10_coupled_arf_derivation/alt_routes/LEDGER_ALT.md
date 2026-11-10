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
