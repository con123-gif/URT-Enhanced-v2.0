# Q161 / Part 21: independent grading and native-v61 topology audit

Date: 2026-11-17. Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** for the finite statements; **OPEN** for graded 4D determinant, Ward completion and physical photon.

## Original provenance and reproducibility
- `research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py` actual `DIRECTIONS` at lines 1914–1918.
- `research_archive/2026-11-15_q149_physical_curvature/Q149_ORIGINAL_528_CURVATURE_CERTIFICATE.py` independently proves curvature rank 477 by GF(2).
- `research_archive/2026-11-15_q159_native_continuum_photon/Q159_NATIVE_SCALING_AND_GAP_THEOREM.md` reports native original ungraded multi-volume failure and negative first spatial momentum modes.
- Native original Q101 projector P3v+P5v, Q125a f=(C P_linear s)^2 and W from integer dual orientation.
- Executed locally with `OPENBLAS_NUM_THREADS=1 python Q161_PART21_GRADED_PHYSICS_AUDIT_2026_11_17.py` using transcribed v61 offsets cross-checked via GitHub; GitHub execution pending.

## Passes: original finite identities
1. True dodecahedral `L_D=3I-A_D`; exact integer incidence `CC^T=(L_D-3I)(L_D-5I)`. Integer skew W satisfies W C=0, W²=-15(P3+P5), L_D W + W L_D =8W, and Tr(L_D^+)=137/15. The two hidden projectors are P3=(L_D-5I)W²/30 and P5=-(L_D-3I)W²/30.
2. Original 444 states have 960 outer single-flip links and 72 centre flips; original Q125a current vanishes on centre flips, so `{Gamma_s,H_ch}=0` for Gamma_s=(-1)^(n_-) on the native 444 x Q96 carrier. This claim does **not** apply to modified centre-odd Jg, whose 60 central currents are nonzero.
3. The raw face identity `(Cs)^2=1+8u_s` is exact and explains the combinatorial factor eight, but **raw source != physical Q101/Q125a source**. The complete original projected current differs from the raw current on 720 of the outer links; one independently computed link had raw J=0, projected J=-9.3665631459995. Do not infer original link amplitudes from raw monochromatic incidence alone.
4. The native Q125a scalar chiral block `iJ` on 444 states has rank 332, **nullity 112**. Zero modes cannot be ignored in any assertion of strict positivity from the chiral mass alone.
5. Original v61 11 offsets are 3 spatial and 8 temporal `[(1,*bits) for bits in (0,-1)^3]`, temporal binomial sector counts 1 pure, 3 one-axis, 3 two-axis, 1 three-axis. Not six `+-e_i` temporal diagonals plus one multi-axis diagonal. The 2640 commuting squares and 576 independent simplexes yield exact GF(2) rank 477; 47 independent vertex gradients and four independent winding cochains prove real rank 477, hence physical link modes 481=477+4. This independently agrees with original native Q149.

## Critical graded-physics correction
Let `K(A)=h_v61(A) Gamma_s + k H_ch(A)` (suppress tensor placement). Since `{Gamma_s,H_ch}=0`, one gets

`K(A)^2 = h_v61(A)^2 + k^2 H_ch(A)^2 - k [h_v61(A),H_ch(A)] Gamma_s`

where h commutes with Gamma_s. **The cross term cancels only after verifying `[h_v61(A),H_ch(A)]=0` on the actual charge-space blocks.** Anticommutation of the spin grading alone does not suffice. The certificate constructs a 4x4 exact Pauli counterexample to the logical implication: `{Gamma,H_ch}=0` but `||{h Gamma,H_ch}||_F=4`.

At A=0, if native Q96 coupling is charge-diagonal and chiral current tensorizes as iJ x I96, this commutation is automatic, giving a plausible finite free graded construction. This cannot be asserted at general A or with non-Abelian/charge-changing transport until direct native matrices are tested. The ungraded Q159b Bloch-current and seagull formula uses `(h+mu)^-1`; it **cannot be reused unchanged** for the graded determinant and must be recomputed including the A-derivatives of `H_ch(A)` and their Ward identity.

A separate exact **free v61** zero-set argument *does* give strict `E(p)>0` on the compact 4D Brillouin zone for native `r>0` and `0<M<1`: any zero requires every spatial `sin p_i=0`. If any `p_i=pi`, C=0 and S=1-M+2rn>0. If all are zero, `sin theta=0` forces S=-M or S=2-M, neither zero. Hence free h_v61 has a compact positive spectral gap. This **does not imply positivity of the charged gauge Hessian, photon pole, reflection positivity, or continuum scaling**. Q159b's ungraded `h+mu=-2` crossing remains true for that separate old operator.

The earlier local transcribed 60-mode graded Bloch audit `cathedral_graded_kinetic_audit_2026_11_17.py` reports negative finite 528-link Hessian sectors (3 at k=0, 2 at spatial-pi). It is **not** the full Q125a 444xQ96 graded determinant and must not be promoted as proof that the proposed full 444-state grade fails or succeeds.

## Strict physical status
- `15 Tr(L_D^+)=137` is **a dual-Hodge scalar identity**, not a measured or derived renormalized 1/alpha.
- `Tr96(T3L²)=12`, `Tr96(Qem²)=32`, `Tr96(Y²)=20` are **representation trace identities** once Q96 charge assignments are provided. `sin²theta_W=3/8` requires a **specific relative gauge kinetic normalization**; the trace ratio alone is not a physical weak-angle derivation.
- Assigning standard anomaly-free Q96 multiplets is not derivation of their multiplet content from full five-solid URT.
- `eta_B` products, `M_Pl/M_EW=Delta^(-13/2)`, the subleading alpha polynomial and the advertised `Z_s/Z_t` remain **conditional** until their original 4D observables, action, renormalization and Ward measures are derived.

## RESUME HERE — single next executable calculation
On the original v61+Q96+Q125a **actual charge-connected** operator, evaluate commutator `[h_v61(A),H_ch(A)]` for all 528 gauge directions at A=0 and first order in A. If zero, differentiate the **new graded** determinant (not Q159b's additive ungraded one) and test its full 528x528 Ward/gauge Hessian and temporal/spatial residues. Record native projection, H64/24 provenance and CI run. No fitted input and no gate closure by numerical fit.
