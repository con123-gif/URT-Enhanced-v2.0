# Newton's Cathedral — research state

**Living document.** Every agent session (Claude, GPT, Grok) reads it right after `AGENTS.md` and
corrects it when a result changes the state. Consolidated 2026-11-10 by Claude from `docs/`, the
claim and closure ledgers, every dated `research_archive/` folder from 2026-10-13 to 2026-11-10, and
CI execution of the whole archive.

**Precedence.** Rules and status classes come from `docs/CONTINUITY_PROTOCOL.md`: later explicit
corrections win, and a no-go holds only for the routes it was proved for. The older state documents
(§9) are dated records, not entry points. Where they disagree with this file, this file and any later
explicit correction win. Every statement below holds **for the stated operators only**.

---

## 1. Executed on CI right now

`.github/workflows/cathedral-orchestrator.yml` runs every check in
`research_archive/cathedral_arf_runner/registry.toml` hourly and on every research push. The latest
verdict is in `summary.md` on branch `cathedral-research-state`.

| Area | What is executed | Check |
|---|---|---|
| Integrity | H64 snapshot sha256; 2026-11-10 manifest; 29 handover numbers recomputed independently (one erratum, p₅) | `integrity.*` |
| Tests | full `tests/` suite (188 tests) | `tests.suite` |
| Geometry | all-Platonic hidden algebra; hidden isometry U_h; 24-clock resolvent; Q⁶ = J/64 | `geometry.*` |
| History | A4/A5 cumulants, chronology gap, Schur–Ward contacts, 24-clock Fourier, native K₄ (`--native`) | `history.*` |
| Native matter | archived v61 Wilson / Q96 source, executed unmodified via a shim, plus its output gate | `native.*` |
| Conditional | source-moment recurrence; observable non-uniqueness; 2×2 and 13+51 Ward algebra (synthetic) | `conditional.*` |
| Sweep | every `research_archive/**/*.py`, resumable | `sweep.md` |

## 2. Established finite mathematics (exact for the defined operators)

- **Frozen inputs** (CLOSED/FROZEN in the current finite model, `docs/CLAIM_LEDGER.md`):
  - φ = (1+√5)/2, δ⋆ = 80π/(1053φ), δ_cl = 3/20, Δ = δ_cl − δ⋆ = 0.002489189840420393…, η_Δ = −ln Δ.
  - ρ⋆ = (I₄ ⊕ Δ²I₄)/(4(1+Δ²)), with p₅ = Δ²/(1+Δ²) = 6.196027670655×10⁻⁶.
  - χ₃₅ = 8η_Δ(1+Δ²)/(1−Δ²) = 47.96697830338. It is also the BKM metric coefficient of a unit visible↔hidden probe (`handover_claims.py`).
- **Five-solid complex.**
  - (V,E,F) = (50,90,50); Hodge dimension 190; Tr D² = 720; Tr D⁴ = 3456; dim ker D = 10.
  - Icosahedral Laplacian 0(1), (5−√5)(3), 6(5), (5+√5)(3). Centred 13-cell 0(1), (6−√5)(3), 7(5), (6+√5)(3), 13(1).
  - The 20×12 face–vertex incidence has rank 12. Hidden kernel 8 = 4₃⊕4₅, with face-Laplacian eigenvalues 3 and 5.
  - Sources: `docs/CATHEDRAL_LITERATURE_INTEGRATION_2026-10-27.md`, `handover_claims.py`.
- **13-cell from F₅.** The SL₂(F₅) determinant-square graph is the icosahedron, and L₁₃ has exactly the frozen spectrum (`research_archive/2026-10-24_alpha_physical_gate/F5_BINARY_ICOSAHEDRAL_EXACT_13CELL_AND_ALPHA_CANDIDATE.md`).
- **Five-cube bridge** (existence identity). With F = P₃ + ΔP₅, F ρ_geo F† / Tr(F ρ_geo F†) = ρ⋆ exactly (`docs/LIVE_WORKING_FRONTIER.md`, 2026-10-25).
- **Histories.**
  - spec(H_bits) = 0(2), 10(12), 16(30), 18(20); Q⁶ = J/64. U_h is isometric, with H_bits U_h P₃ = 18 U_h P₃ and H_bits U_h P₅ = 16 U_h P₅.
  - H_bits and K64 are **not** unitarily equivalent (Tr 960 vs 304); only a rank-8 partial intertwiner joins them (`docs/LATEST_RESEARCH_STATE_2026-11-07.md` §6).
  - The exact Volterra memory M(t) = C e^{−tD} Cᵀ (`docs/CATHEDRAL_H64_EXACT_NONMARKOV_MEMORY_2026-10-31.md`).
- **Interacting transfer.** The 197-coordinate quotient splits 19 + 178. The fixed-volume time-cutoff limit is a Schrödinger operator with a positive gap (`docs/CATHEDRAL_INTERACTING_TIME_CUTOFF_PROOF_2026-10-31.md`). A volume-uniform gap is open.
- **Native H64 → 3D diffusion.** D = r²/5 with r = π/e, with a functional CLT. An OS-positive *free* Gaussian 3+1 sector (`research_archive/2026-11-08_native_h64_diffusion/`).
- **Modular source.** B_hid = P₃ + ΔP₅ is the unique positive square root of T_hid = P₃ + Δ²P₅. It is forced *if* sources propagate by the positive Gibbs amplitude (`research_archive/2026-11-07_joint_interacting_native/CATHEDRAL_MODULAR_SOURCE_INTERFACE_THEOREM_2026-11-08.md`).
- **Native charged source** (CI-executed).
  - 192×192 Hermitian v61 Wilson operator, 96/96 sea, 528 links, 48 sites.
  - The link Hessian has rank 481 with gauge nullity 47. Local Ward norm ~5×10⁻¹⁵; Tr Q² = 32.
  - Source: `research_archive/2026-10-17_original_oct08_source/common_action_work/matter/microscopic_source_currents.py`.
- **Coulomb / charge indices.**
  - On the dual dodecahedron, 15·Tr L⁺ = 137.
  - −Tr(W²L⁺) = 32 = 12 + 20, equal to the lepton + quark Q² traces of the charged registry.
  - Exact arithmetic; the physical identification is open (`research_archive/2026-10-24_alpha_physical_gate/`).
- **Cumulants.**
  - On centred vectors (I−Q)⁻¹ = I + Q + … + Q⁵, which gives an all-order recursion.
  - Native K₂ rates: {67/48, 33/16, 25/24, 33/16, 5/6}.
  - The A5 mean of the native K₄ rates is 845671/57600 + (4271/800)√5 (**CI-verified 2026-11-10**).
  - Source: `.../2026-11-10_urt_arf_forward/new_gate/URT_Q6_CUMULANTS_AND_A5_MIXING_THEOREMS_2026_11_10.md`.
- **Native K3 signed dictionary collision (Q14, 2026-11-10).** The Q12 non-parity K2 collision pair D0=(0,2,4,6,8,10) and D1=(0,2,5,6,9,11) is separated at order 3: the unique K2=25/24 vacuum has scale/sign-invariant K3²/r2³ = 4823127/1024000 ∓ (41811/256000)√5. Local exact certificate executed; GitHub CI pending. This does not settle the 768-orbit classification or select a physical ARF (`research_archive/2026-11-10_signed_dictionary_k3/`).
- **Native K2–K3 signed dictionary audit (Q15, 2026-11-11).** Exact joint five-vacuum (K2/r2,K3²/r2³) signatures of the native hidden-5 source and fixed Q6 yield 96 distinct signatures among 768 proper-A5 signed dictionary classes, each of multiplicity 8. After global inversion 384 classes remain in 96 groups of four (576 non-parity collision pairs); witness D=(0,2,4,6,8,10), E=(0,2,8,10,7,4). Local exact Q15 rerun and nested-namespace regression executed by GPT 2026-11-11 (exit 0); earlier CI run 42933514639 failed on a Q11/K namespace lookup subsequently repaired by Claude commit bd731d3e; next CI verdict pending. Gate A dictionary not selected (`research_archive/2026-11-11_signed_dictionary_k23/`).
- **Native fourth-cumulant residual collision (Q20, 2026-11-11).** For the Q15 non-parity witness D=(0,2,4,6,8,10), E=(0,2,8,10,7,4), the complete five-vacuum joint multisets (K2/r2,K3²/r2³,K4/r2²) are exactly equal with fixed native Q6. The K4 values matched to (K2,I3) are 7547/900+(447/200)√5, 280439/28800+(1503/800)√5, 19163/57600+(103/50)√5, 552571/19200+(15201/1600)√5, 502531/19200+(17631/1600)√5. GPT local exact certificate executed exit 0 with ten finite-time checks; registered CI pending. This leaves a source-level dictionary ambiguity through order four, not a general no-go (`research_archive/2026-11-11_native_k4_collision/`).

- **24-clock holonomy.** For the 291,840-mode conditional operator, Tr K(θ)ⁿ is θ-independent for n < 24, and cos 24θ first appears at n = 24. This does **not** select the golden phase.

## 3. Proven obstructions and falsified routes — do not retry these

Each holds for its stated operators and hypotheses only.

- **Normalisation of the photon.**
  - The Maxwell family S_λ keeps the projector, Ward structure, spectra and charge generator, but the coupling enters as 1/λ and is unfixed.
  - The normalised master ρ cannot fix absolute field stiffness.
  - Isospectral BKM distinguishability is not a photon stiffness (`2026-10-24_alpha_physical_gate/`).
  - Literal Berry/Maxwell matching does not reproduce the historical α scalar. The naive Hilbert–Schmidt match of the native Peierls Hessian leaves a 42.9% residual (`2026-10-26_137_360_dual_spectral_bridge.md`).
- **Signed dictionaries (Q12, 2026-11-10).** For the native hidden-5 source and fixed de Bruijn Q, the 46,080 signed six-axis dictionaries form 768 free proper-A5 orbits and 384 orbits after central inversion. Joint source/vacuum covariance makes the five-vacuum K₂ multiset an A5 orbit invariant, although the active signed rotation does not commute with Q. Exactly 56 distinct spectra occur (16 of multiplicity 8 and 40 of multiplicity 16 among the 768 classes); non-parity collisions remain. This is a source-level obstruction to uniqueness, not a physical ARF result (`research_archive/2026-11-10_signed_dictionary_classes/`).
- **Signed A5 axis covariance (Q11, 2026-11-10).** The exact native hidden-5 icosahedral face source and five A4 singlets have 60/60 joint signed-axis/vacuum covariance: 76,800 face equalities and 300 exact K₂ invariances. This is passive transport, not active A5 symmetry of fixed Q: only the identity proper rotation commutes with Q. The signed dictionary and physical chronology remain unselected (`research_archive/2026-11-10_signed_a5_covariance/`).
- **The native URT cannot produce R_α** (2026-11-11, `research_archive/2026-11-11_hidden_parity/`).
  - Under central inversion the hidden 4₃ is odd and 4₅ even; 15 Tr L⁺ = 99/2 (even) + 175/2 (odd). In each A4 vacuum the 4₃ singlet is the tetrahedral parity vector and the 4₅ singlet the cube contrast.
  - The native photon (edge cochains) is free, and the 7 November action obeys S(z, y; Δ) = S(z, Ry; −Δ) with R = I − 2U_hP₅U_hᵀ. Every geometric or photon observable is even in Δ, so 15 Tr M⁺ = 137 is uncorrected and the Δ polynomial's linear term has no native source.
- **The archived electric charge breaks A5** (Q23, 2026-11-11, `research_archive/2026-11-11_q23_photon_gauge_typing/`). The registry types Y as 1, SU(2) as the geometric vector 3, gluons as 3′ + 5, which is exactly the visible face space of the icosahedron (137 = 105 gauge-typed + 32 geometry-typed). Y has no A5-equivariant photon channel; SU(2) maps uniquely onto the softest Maxwell triplet; the archived T₃ axis has trivial stabilizer, so Q96 = Y + T₃ is not A5-natural. By the same typing the bare 137 = 58.906 (W-typed) + 46.094 (gluon-typed) + 32 (geometry-typed) is not an electromagnetic trace; one T₃ component carries 15/(3−√5) = 19.635.
- **No matter map, and no A5 on the v61 lattice** (Q4, 2026-11-11, `research_archive/2026-11-11_q4_native_matter_map/`). The 48 sites are six cube slices in a 6-cycle with complete joins; the site graph has no automorphism of order 5, so no A5-equivariant site or link map exists. Of 136 archived arrays, none couples the Wilson lattice to geometry or histories; the only Wilson–registry join is a conditional Kronecker-sum table.
- **Flat links are not a vacuum** (2026-11-11). For the archived v61 operator, θ = 0 is a saddle of the scale-free induced action −log|det H| and of the archive's sea energy: 72 negative, 409 positive physical modes. A stable flux vacuum θ* lies 99.10 lower. Archived native photon kernels at θ = 0 are not vacuum responses (`research_archive/2026-11-10_induced_photon/`).
- **Chronology.**
  - A5 covariance plus the primitive shift does **not** select an axis-order-independent response: second moments 31440, 42480, 27120.
  - A5 averaging destroys Q's six-step Haar property.
  - The native 24-clock (eigenvalue multiplicity ≤ 2) carries no nontrivial A5 action commuting with its Wilson kinetic term, under a factorised action.
  - The A5 vacuum mixture is non-ergodic: κ₄ ≈ (1493/1920)n².
  - The source-free Gaussian clock determinant does not select the golden phase.
  - The source-loaded 24-clock has nonzero derivative at golden compensation: a failed exact-locking route.
- **Matter.**
  - The tested physical Yukawa dictionary on the original H64 quark sources **fails**: second and third generations come out nearly degenerate, with wrong mixing (`2026-10-18_joint_quark_vacuum/`).
  - Exact Koide δ = 2/9 together with exact Q = 2/3 is rejected at 442σ.
  - The ARF mass coefficients are **not** the vacuum quadratic masses of the November scalar construction.
- **Couplings.**
  - Symmetry, chronology and energy restrictions leave two source-sector intertwiners.
  - The dark local vertex is a no-go.
  - The dark residual is not a fourth ARF, particle or hidden quartet.
  - The original 7 November action contains **no vertex-to-spatial-edge charged coupling**.
- **Gravity** (2026-10-16).
  - The dipole-gradient two-graviton claim is rejected as stated.
  - Positive on-site BKM gives Yukawa screening, not 1/r².
  - The tested scalar Hessian → Poisson map is biharmonic.
- **Thermal states.** A single global Gibbs state on 190×64×24 modes contradicts the eight-state master odds: p_(5|+) ≈ 0.4515 vs 6.196×10⁻⁶.

## 4. Conditional constructions: explicit choices, not derived

- **Chronology choices.** The A5 chronology Dirichlet penalty and its coefficient 1. R(Q) = M/120, the Frobenius-nearest A5-equivariant chronology. The 60-frame A5 lift. The six-axis ordering of the history bits.
- **Coupling choices.** The 50→8→12 portal and its response composition (7 Nov). The extra charge-two edge-pair insertion. The positive-amplitude transport rule that selects Δ. One canonical choice among the four independent A5-equivariant quadratic sources.
- **Reference states.** The global Gibbs state; the free-Fock A4 Wilson photon; Gaussian references for the Wick analyses; the Q-coupling strength λ.

## 5. Where every line stops: the missing object

About forty status files from 9–10 November end at the same missing object.

**A source-preserving, U(1)- and A5-equivariant map from the 64-history source (H64 = H₁₃⊕H₅₁; hidden 4₃⊕4₅ via U_h) to the charged matter of the archived v61 Wilson operator (192 states, Q96 registry, 48 sites, 528 links), with fixed normalisation, keeping both Ward orders (seagulls, source rotation, Schur relaxation), and producing a gauge-invariant pole with a residue.**

Known constraints on it:
- The Wilson-sea Ward identities hold.
- Tr Q² = 32, and the site Schur kernel is 4×4.
- The 7 November action has no vertex-to-edge charged coupling.
- Symmetry alone leaves at least two intertwiners.
- The 24-clock cannot carry the A5 repair by itself.
- The v61 site graph has no automorphism of order 5 (Q4): the map must act on internal (spinor or registry) indices, never by identifying lattice sites or links with Platonic cells.
- To feed a Δ-linear α correction it must reach the photon and be odd under R = I − 2U_hP₅U_hᵀ (hidden parity, 2026-11-11).

Nothing in the archive selects this map. Gates B → C → D are this object; gates E and F follow from it.

## 6. Recorded framework outputs: not derivations

- **α⁻¹(0) = 137 + (17572/1215)Δ − (9/65)Δ² = 137.035999178195** (value of the polynomial). The ledger calls it an exact internal invariant. 17572/1215 is **not** derived, and the decompositions 137 = N² − E − (D−1) and 17572/1215 = N + 9/5 − 82/243 are arithmetic only.
- **The handover's table** (sin²θ_W, mass ratios, CKM, PMNS): recorded outputs whose derivation paths and inputs are unaudited.
- **The ~40 legacy "confirmed" labels:** historical comparisons only.

- **Three α assemblies coexist:** 137.0360100481 (`newtons_cathedral/arf.py`), 137.035999312 (v8 with δ_eff), 137.035999178 (Δ polynomial); 518σ, 6.4σ and 0.06σ from CODATA 2022. Successive versions add terms and approach the measured value.
- **Precision scope for any first-principles α.** α(0) is the end of the running and contains the hadronic vacuum polarisation, Δα_had⁽⁵⁾(M_Z²) = 0.027813(48) (lattice, arXiv:2511.01623; data-driven about twice as uncertain). Through α⁻¹(0) = α⁻¹(M_Z)/(1 − Δα), even an exact high-scale prediction fixes α⁻¹(0) only to ±0.007–0.015, against R_α ≈ 0.034. An eight-digit match of R_α is therefore the signature of a fit, not a derivation target; a geometric theory must state the scale its α applies at.
- **The 2025 chaos survey is not evidence for δ★** (2026-11-11, executed). The "universal chaos invariant" δ_chaos = 0.1523 ± 0.0005 of the Nov 2025 paper comes from a refinement step that relaxes every estimate to a hard-coded 0.15: every raw value in [0.01, 1] lands in [0.14905, 0.15245], white noise gives 0.1513, and moving the setpoint moves the "invariant". The original ARFs were fitted values rounded to 2π, 3π², π²φ, 4 (1.9 % mean error). δ⋆ and δ_cl remain frozen definitions (`research_archive/2026-11-11_arf_origin/`).

## 7. Archive health (sweep, 2026-11-10)

- 259 research scripts were executed (orchestrator run 42894969958): **235 pass**, **24 missing_file**, 0 assertion failures, 0 regressions.
- **14 are bound to `/mnt/data`** (Q5, classified 2026-11-10 by Grok): 3 write-only (`urt_platonic_u2_holonomy.py`, `cathedral_golay_leech_selection_audit.py`, `cathedral_native_spatial_vacuum_audit_2026-11-09.py`) and become runnable if `/mnt/data` exists and is writable; 11 read hardcoded ChatGPT-sandbox inputs, so creating the directory does not unblock them. Proposed sweep line `Path("/mnt/data").mkdir(parents=True, exist_ok=True)` in `orchestrator.py` `sweep()`, not inserted: on this environment `/mnt` is root-owned and that mkdir raises `PermissionError`. Details: `research_archive/2026-11-10_sandbox_bound_scripts/`.
- **10 scripts were unblocked on 2026-11-10** by byte-identical companion copies (`COMPANION_SOURCE_NOTE.md` in two folders), and all 10 now pass. The remaining 10 non-`/mnt/data` missing_file scripts (Q6, classified 2026-11-10 by Grok) have no archived producer that writes the sweep-reported file at the path the consumer opens, so no sweep reordering unblocks them. One script, `golden_species_derivation.py`, writes the basename `golden_species_operators.npz` next to itself (a committed copy already lives there) rather than into `2026-10-17_h64_quadratic_koide_phase/`. Three of the ten missing basenames (or a near-name) already exist elsewhere: `golden_species_operators.npz` (three byte-identical copies, sha256 `9bfd183c01b43e3a589917f334ec5758cefb912cf30f55147b58ccb496b0399b`), `run_endpoint_test.py` (at `research_archive/run_endpoint_test.py`; the rest of `full_library/` is also absent as a directory), and `joint_original_h64_species_link_source.npz` in the same folder as `original_h64_species_link_source.npz`. The other seven files have no producer and no committed copy. Details: `research_archive/2026-11-10_missing_intermediates/`.
- Live per-script status: `sweep.md` on `cathedral-research-state`.
- The raw `microscopic_source_currents.py` needs `common_action_work/recovery/theory_input_v5.md`, which is absent; CI runs it through `run_native_source.py`.

## 8. Gates (the research queue in `registry.toml`)

| Gate | | Frontier |
|---|---|---|
| A | Primitive selection | Derive the six-bit history dictionary (axis ordering and signs), the chronology coefficient and the source weights (4,2,2,0) from the URT recurrence |
| B | Charged operator | The §5 map, H64 ↔ v61 Wilson / Q96 |
| C | Gauge selection | Photon projector and normalisation from that map; currently `unselected` |
| D | Ward completion | Both Ward orders on the joined operator, not just on each side |
| E | Physical observables | Pole residues and couplings without fitted values; six admissible observables exist today |
| F | Four ARFs | From E, with uniqueness and falsification tests |

## 9. Documents and their status

- **Living:** `AGENTS.md`; this file; `research_archive/cathedral_arf_runner/{RESEARCH_LOG.md, RESEARCH_PROTOCOL.md, registry.toml}`; `docs/CONTINUITY_PROTOCOL.md` (rules).
- **Canonical status tables:** `docs/CLAIM_LEDGER.md` and `docs/CLOSURE_LEDGER.md`. Their entries after 2026-10-17 are pending (queue Q9).
- **Dated records** (use for provenance, not as entry points): `docs/START_HERE.md`, `docs/LIVE_STATE_2026-10-02.md`, `docs/CANONICAL_STATE_*`, `docs/CONTINUITY_SNAPSHOT_2026-10-12.md`, `docs/LATEST_RESEARCH_STATE_2026-11-07.md`, `docs/LIVE_WORKING_FRONTIER.md`, `FIELD_NOTEBOOK.md` (append-only), the `README.md` dated sections.
- **Outside GitHub:**
  - ChatGPT Library folders: 175, 442 and 103 files.
  - The 321 MB Drive `chat.html`, never read (`docs/LATEST_RESEARCH_STATE_2026-11-07.md` §1).
  - The 2026-11-10 handover; its numbers are checked by `handover_claims.py`.
