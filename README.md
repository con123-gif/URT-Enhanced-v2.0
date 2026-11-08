# Newton’s Cathedral

**A mathematical oddity — working towards a theory of nature.**

![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB)
![License](https://img.shields.io/badge/License-MIT-green)
![Workspace](https://img.shields.io/badge/workspace-GitHub%20first-181717)
![Status](https://img.shields.io/badge/status-active%20research-orange)

This repository is the **single primary workspace for Newton’s Cathedral**. Newton’s Cathedral is an evolving mathematical-physics construction: a mathematical oddity being developed towards a theory of nature. It is not presented here as a completed theory of nature.

**Universal Recursive Tuning (URT)** is the selection/dynamical principle inside Newton’s Cathedral, not the name of the overall project. The repository contains the current finite core, full audit trail, historical code, recovered conversation provenance, vortex/Navier–Stokes work, and engineering experiments.

> **Canonical rule:** current claims are governed by the canonical state and closure ledgers, not by older filenames, historical scripts, or attractive numerical matches.

## Start here

| Purpose | File |
|---|---|
| **Latest research-state handoff (7 November)** | [docs/LATEST_RESEARCH_STATE_2026-11-07.md](docs/LATEST_RESEARCH_STATE_2026-11-07.md) — entire late research frontier, source paths and dependencies |
| **Saved ChatGPT Library sources** | [docs/SAVED_SOURCES_INDEX_2026-11-07.md](docs/SAVED_SOURCES_INDEX_2026-11-07.md) — 617 archived research files outside GitHub |
| **Complete tracked-file index** | [FILE_INDEX.md](FILE_INDEX.md) — every file, run status and parameter status |
| **Dated research field notebook** | [FIELD_NOTEBOOK.md](FIELD_NOTEBOOK.md) — findings, dead ends, and open questions |
| Earlier canonical state (2 October) | [docs/LIVE_STATE_2026-10-02.md](docs/LIVE_STATE_2026-10-02.md) — read with the 7 November update |
| Canonical Sept. 30 reference | [docs/CANONICAL_STATE_PLAIN_2026-09-30.md](docs/CANONICAL_STATE_PLAIN_2026-09-30.md) |
| Closure status | [docs/CLOSURE_LEDGER.md](docs/CLOSURE_LEDGER.md) |
| Claim status | [docs/CLAIM_LEDGER.md](docs/CLAIM_LEDGER.md) |
| Continuity / workflow | [docs/CONTINUITY_PROTOCOL.md](docs/CONTINUITY_PROTOCOL.md) |
| Repository map | [docs/PROJECT_MAP.md](docs/PROJECT_MAP.md) |
| Recovered chat chronology | [conversation_archive/README.md](conversation_archive/README.md) |
| Research archive | [research_archive/](research_archive/) |
| Engineering work | [engineering/](engineering/) |

## The Newton’s Cathedral programme

The working goal is to determine whether one parameter-free mathematical structure can connect history selection, information geometry, matter, gauge interactions, gravity and cosmology strongly enough to constitute a genuine theory of nature.

The current causal spine is:

## Canonical spine

```text
raw possibility / chaos
    ↓
URT selection
    ↓
bounded history-dependent response
    ↓
symmetry + Hodge reduction
    ↓
5 → 4 → 3 → 12 → 13
    ↓
finite A4/A5 / 13-site structure
    ↓
dual rails + master state ρ*
    ↓
Kubo–Mori / BKM information geometry
    ↓
geometry + gauge + matter response
    ↓
gravity / spacetime / cosmology
```

URT and entropy have different roles:

- **URT** selects admissible histories.
- **Entropy / information geometry** structures the selected state.
- The positive transfer machine `T = B†B` and the KM/BKM Hessian are the dynamical and response branches of one finite construction.

## Core finite objects

```text
φ = (1 + √5)/2
D = 3
N = 13
γ = 1/81

d*  = 80π / (1053φ)
dcl = 3/20
Δ   = dcl - d*

ρ* = (I4 ⊕ Δ² I4) / [4(1 + Δ²)]

16 = 4_g ⊕ 1_Y ⊕ 3_W ⊕ (3' ⊕ 5)_C

H64 = H13 ⊕ H51
```

The canonical 13-site spectrum is

```text
{0^(1), (6-√5)^(3), 7^(5), (6+√5)^(3), 13^(1)}.
```

## Repository layout

```text
cathedral_core/          compact current finite core
newtons_cathedral/       historical public Python package
tests/                   canonical + legacy verification
docs/                    canonical state, ledgers, maps, workflow
research_archive/        full research/audit corpus
conversation_archive/    recovered cross-chat technical chronology
engineering/             applied URT experiments and validation
archive/                 superseded repository snapshots / provenance
```

### Canonical vs historical code

`cathedral_core/` is intentionally small and conservative. It contains the currently retained finite constants, URT primitives, master entropy state and BKM response functions.

`newtons_cathedral/` is the earlier public package. It is preserved for provenance and executable historical audits, but individual modules are **not automatically canonical**.

## Quick verification

```bash
python -m pip install -e ".[dev]"
python -m pytest tests/test_canonical_core.py
```

To run the full historical suite:

```bash
python -m pytest
```

## Status discipline

Every serious result should be classified as one of:

- **CLOSED / FROZEN** — established for the defined mathematical construction.
- **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING** — finite mathematics closed; physical normalization/continuum interpretation remains separate.
- **REOPENED** — an explicit later contradiction, failed audit or new premise reopened the result.
- **RETIRED / SUPERSEDED** — preserved for provenance; not live evidence.
- **OPEN** — genuinely unfinished and never previously closed.

A no-go is local to the assumptions it tested unless the current ledger explicitly promotes it to a global obstruction.

## Latest verified finite-cell work (15 October 2026)

The [full 13-cell / 64-state / 125-simplex DEC audit](research_archive/2026-10-15_icosahedral_125_DEC_H64/README.md) includes three executable NumPy programs, the hidden-face 4+4 lift to the tetrahedral ball, exact phi^-2/phi^-4/phi^-6 incidence ratios, the 64→24→12 determinant, a vertex-to-face return-loop construction, actual circumcentric metric calculations and electroweak one-loop arithmetic.

**Status:** these are verified finite operator identities and explicit local tests. The circumcentric audit does not establish a unique gravitational area normalization, and the finite return-loop spectra do not yet determine physical CKM/PMNS or mass hierarchies. The physical RG interval and all-coupling threshold matching remain open. Superseded scalar claims are retained in the audit for provenance rather than silently discarded.


### Entropy, selection and force-response update (15 October)

[Verified finite entropy/force construction](research_archive/2026-10-15_icosahedral_125_DEC_H64/ENTROPY_GRAVITY_FORCE_BRIDGE.md): the positive-transfer vertex quadrupole contracts in amplitude by 1/2; vertex–face fiveplets have a canonical incidence isometry; the BKM relative-entropy Hessian has exact stiffness chi35. These establish finite geometric/information dynamics, **not** a measured four-dimensional gravitational entropy, Newton constant, or unified physical force law.

### Kissing geometry and entropy production (15 October)

The [exact contact-versus-interaction audit](research_archive/2026-10-15_icosahedral_125_DEC_H64/KISSING_FRICTION_ENTROPY.md) separates the 12 physical central contacts from 30 non-contact icosahedral neighbour couplings. Symmetric diffusion on the latter has provably nonnegative entropy production, and the vertex/face fiveplets form an exact reversible 10D complex structure with conditional dissipative damping. The physical friction rate, gravity/gauge dynamics and cosmological initial entropy are still open.

### New exact geometric-to-BKM fiveplet map (15 October)

[Signed-face chirality theorem and executable SymPy proof](research_archive/2026-10-15_icosahedral_125_DEC_H64/ENTANGLEMENT_SPIN2_CHIRAL_BRIDGE.md): the orientation-signed 20-face matrix supplies the antipodal-odd map missing from the direct quadrupole coupling. Its normalized fiveplet-to-Hom(4,4) embedding is an exact Hilbert–Schmidt isometry, so the Cathedral's BKM Hessian pulls back to the geometric fiveplet without a fitted coefficient. The finite result does not imply an Einstein equation or physical Newton constant.

### Complex 5+5 BKM and Onsager response (15 October)

The [complex tidal-carrier exact audit](research_archive/2026-10-15_icosahedral_125_DEC_H64/COMPLEX_5PLUS5_ONSAGER_CLOSURE.md) embeds the two real fiveplets as one complex fiveplet in the Hermitian 8x8 BKM tangent, derives the full relative-entropy singular-value formula, and proves exact reversible phase invariance. The 6/2 diffusive dynamics mix the complex field with its conjugate. Gamma=mu0 kBT chi35 remains conditional on an externally specified mobility; the physical Weyl/Einstein identification remains open.

### Solar-system entanglement hypothesis (15 October)

The [Sun–Earth–Moon numerical baseline and research ledger](research_archive/2026-10-15_icosahedral_125_DEC_H64/SOLAR_THREE_BODY_ENTANGLEMENT_MODEL.md) separate classical three-body orbital evolution from hypothetical coherent quantum gravitational tidal entanglement. This tests a possible application without treating classical gravitational correlations as proof that planets are entangled.

### Cathedral × URT integrated finite run (15 October)

[Integrated source, proof boundary and numerical results](research_archive/2026-10-15_icosahedral_125_DEC_H64/INTEGRATED_URT_CATHEDRAL_RUN_2026-10-15.md): the original URT spiral, normalized icosahedral quadrupolar transfer, exact signed-face quantum BKM embedding, and a selected 8×8 CPTP phase/reset channel were run together. For the chosen explicit composition, selected deviations contract by pi/(2e) while the original raw spiral expands by pi/e; quantum relative entropy decreases and entropy increases. The composition is a *tested model hypothesis*, not yet a derivation from the full canonical microscopic T_star. The micro-selector derivative contraction bound is valid in a forward-invariant central interval, not across the discontinuous sign-switch points.



## URTF analytical solver — original algorithm and Cathedral extension

The [URTF–Cathedral Symmetry Compiler](engineering/urtf_symmetry_compiler/README.md) is now reproducible directly from the repository. **URT's O(N) analytical cascade is foundational, not a newly discovered consequence of the compiler.** The October 15 extension uses the Cathedral's proper-A5 multiplicities for five cubic Cayley–Hamilton inverses, low-rank 12×12 species corrections and stage-local direct recurrences (up to 32,000 unknowns tested). The finite reductions are exact for the stated symmetry/locality assumptions; physical action and arbitrary nonlinear universality are not established.

## URT mathematics and cross-domain structure engine (15 October)

The [URT Mathematics Direct Solver](engineering/urt_math_direct_solver/README.md) extends the original URT O(N) recursive algorithm with a reusable mathematical problem dispatcher, certified low-rank harmonic inverses, local block recurrences, a **combined local physics plus global URT resonance solver** and a special nonlinear scalar reduction. The new coupled test solved 4,096 variables through a 6×6 correction with relative residual ~1×10⁻¹⁶. Other checks cover a 32,768-variable harmonic interaction and a 24,000-variable discrete diffusion equation. These are exact reductions for specified structured models, not an unrestricted O(N) solution for all mathematics, physics, or computation.

### Multi-cell gravity/DEC audit — 16 October 2026

The [complete three-theorem and same-day DEC/FDT archive](research_archive/2026-10-16_multicell_gravity/README.md) contains executable tests of the proposed graviton-polarization split, long-range BKM lattice force and four-sector icosahedral transfer, plus the preceding four-link and five-stage tidal reports. The **exact** corrected transfer ratios are retained; dipole and quadrupole edge-gradient sectors are orthogonal, and the supplied positive on-site BKM lattice action gives a screened response. A symmetry-protected massless field, physical energy-to-tensor coupling, spacetime dynamics and G_N normalization remain open research targets, not global impossibilities.

## Recovered conversation frontier (16 October 2026)

[Conversation-first recovery of the v115 mass-response outputs, v125/v129 CKM/PMNS, cosmological ratios and later corrections](research_archive/2026-10-16_conversation_first_recovery/RECOVERED_PREVIOUS_FRONTIER_2026-10-16.md). **Earlier responses were substantially more developed than later compact code snapshots implied.** The historical numerical outputs are preserved even where their target-free physical derivation requires reconciliation. Do not replace these results with the flat spectra of a different geometric H64 candidate. The still-unlocated Rule D, right-handed Gate-2 and Koide source derivations are explicitly tracked rather than presumed nonexistent.


## Conversation-first recovery (16 October)

[Recovered prior-conversation mathematical frontier and provenance](conversation_archive/CHAT_FIRST_RECOVERY_STATUS_2026-10-16.md) now supplements the dated research archive. This includes previously omitted v27/v115/v129 and later entropy, H64 and continuum status corrections. **This is not a claim that the last 100 raw ChatGPT transcripts have been exported**; it preserves available past work without fabricating originals.

### Physical derivative-order and coefficient provenance gate (16 October)

[Executable physical scalar/spin-2 operator test and anti-fitting source audit](research_archive/2026-10-16_physics_gates/PHYSICS_AND_PROVENANCE_GATES.md): the fiveplet/BKM scalar traceless-Hessian map yields a fourth-order Fourier k^4 operator, not the Newtonian k² Poisson constraint. A physical source/coframe constraint is still required; no measured Newton G was inserted. The historical alpha scalar polynomial is now explicitly labeled internal until a target-free photon-current correlation derivation is established. The October theorem regression uses a temporary output path rather than modifying its tracked JSON fixture.

### Hidden quartets to visible probabilities (16 October)

[Exact 12-outcome vertex POVM and 11-channel BKM susceptibility](research_archive/2026-10-16_hidden_visible_povm/README.md). The two hidden face quartets induce positive quantum measurement effects on the 12 vertices with p_i(rho*)=1/12. The actual unsigned inter-quartet incidence transfer has rank 6 with golden singular-value ratio phi³; adding parity-even intra-quartet response generates the 5D quadrupole, giving a fixed 11-mode BKM response with triplet ratio phi⁶. This preserves the distinct signed chirality fiveplet map. A 4/16 representation fraction is **not** a prediction of 25% dark-matter abundance or gravitational coupling.

### Center-4 and augmented 64-state gauge geometry — 16 October

[Integrated mathematical theorems, exact Dirac spectral polynomial and tested solenoidal/Wilson link identities](research_archive/2026-10-15_icosahedral_125_DEC_H64/UNIFIED_CATHEDRAL_ADVANCED_SYNTHESIS.md), with [reproducible center-4 proof script](research_archive/2026-10-16_center4_synthesis/README.md). The 64×64 integer polynomial and exact 30-edge Hodge decomposition were verified; the proposed damping window remains a conditional oscillator model and the U(8) vacuum stabilizer is not automatically a massless Yang–Mills gauge theory. All earlier H64 history, hidden-POVM, entropy and URT branches remain intact.

### Koide charged-lepton phase and actual H64 holonomy gate — 16 October

[Exact mass-ratio/phase and rank-one charge-plane audit](research_archive/2026-10-16_koide_phase/README.md), plus a new cubic determinant invariant for the three-return positive mass-spectrum operator. Assuming exact Q=2/3, measured mu/e implies delta=0.222222047073088; setting delta=2/9 simultaneously misses CODATA by 442 sigma. A Q shift −1.42146×10⁻⁷ can reconcile the isolated rational phase but is not derived. The historical h=g+iω charge-plane is rank one, so every triangle phase is exactly zero. Only a genuinely new typed-H64 return holonomy can establish a target-free phase. This is an additive recovery, not a restart or replacement of v115 mass or v125/v129 CKM/PMNS work.

## Active research fronts

The finite machine is substantially constructed. Current work is concentrated on the interfaces that turn the finite model into a complete physical theory:

1. entropy-to-continuum gravitational normalization;
2. absolute gauge/current normalization without a free scale;
3. target-free flavour poles and mixing from the typed `H64` history operator;
4. continuum cosmological dynamics;
5. the exact unforced Navier–Stokes relay/shadowing theorem;
6. blind external validation of engineering branches.

## Engineering

Applied work is kept separate from fundamental-physics claims. The consolidated engineering area includes bounded-chaos control, plasma/turbulence experiments, EEG/seizure prediction, sensing, materials/fusion, vortex-flow control and constrained optimization.

See [engineering/README.md](engineering/README.md).

## Provenance and consolidation

This repository now consolidates the material previously split across the URT/Cathedral repositories. Older snapshots are retained under `archive/repository_snapshots/`; unique chaos-lab code and notebooks live under `engineering/chaos_lab/`.

The durable workflow is:

```text
work in chat → verify / derive → commit to GitHub → continue from GitHub
```

Important project state should never exist only in a conversation.

## License

MIT. See [LICENSE](LICENSE).


## 17 October 2026 — executable H64/URT source restoration

The October 17 source recovery is now committed, not just linked from chat attachments. Start with the [recovery instructions](research_archive/2026-10-17_recovery_assets/README_RECOVERY.md), [55-file original-byte manifest](research_archive/2026-10-17_recovery_assets/RECOVERY_MANIFEST.json), [offline matrix reconstruction](research_archive/2026-10-17_recovery_assets/restore_matrices.py), and [automated integrity regression](tests/test_oct17_recovery.py).

For a fresh checkout, reconstruct the **two 4.6 MB signed-history operator arrays** from the six Git-tracked, SHA-256-verifiable binary chunks before executing dependent scripts:

```bash
python research_archive/2026-10-17_recovery_assets/restore_matrices.py
python -m pip install numpy scipy sympy networkx pytest
python -m pytest -q tests/test_oct17_recovery.py
```

The original source-first H64 decoder is in [source-first regression](research_archive/2026-10-17_source_first_recovery/source_order_regression.py), and the native [14-to-4](research_archive/2026-10-17_exact_14D_H64_reduction/native_h64_exact_14_to4.py) and [64-to-3](research_archive/2026-10-17_exact_14D_H64_reduction/execute_exact_full64_to3.py) derivations are executable from the same restored matrix inputs. The [original v61 physics compendium](research_archive/2026-10-17_original_oct08_source/canonical_sources/Cathedral/Newton_Cathedral_Full_v61.py), gauge/Yukawa material, bulk geometry and photon scripts are preserved in their recovered locations. [GitHub Actions](.github/workflows/cathedral-oct17-recovery.yml) defines the source-integrity job.

**Scope:** these are exact restorations and conditional finite-model calculations, **not** a first-principles prediction of the measured charged-lepton mass spectrum. The original `kl_urt_koide_action.py` and a uniquely determined photon-current / H64 charged-pole action were not recovered. The complete raw historical conversations were not restored. Do not equate the distinct coarse cellular 64 and signed-history H64 representations or label a conditional Koide fit as physical closure.

## 8 November 2026 — original research source preservation

The independently developed [five-Platonic curvature and 24-track response research](research_archive/2026-11-08_curvature_response/README.md) contains two LaTeX papers, the dated response note, three tested verification scripts, and full attribution to **James Montgomery Lockwood**, **Deep Bhattacharjee**, **Ushashi Bhattacharya**, and **Tristan Romanov** as motivating external researchers. Their original code or manuscripts are **not** part of the Cathedral repository.

The [whole-Cathedral spinning and chiral computation archive](research_archive/2026-11-07_spinning_whole_machine/README.md) retains nine distinct runnable original scripts generated in recent conversations, rather than collapsing them into a new surrogate. The scripts were executed with exit status 0 on 8 November 2026. All finite/model qualifications remain stated in their READMEs.

Compiled PDF copies are separately saved in the ChatGPT Library; the complete LaTeX manuscript sources are in GitHub and can rebuild those PDFs. See [FILE_INDEX.md](FILE_INDEX.md) and [FIELD_NOTEBOOK.md](FIELD_NOTEBOOK.md) for provenance and navigation.

## 8 November — modular source-transfer theorem on the original full system

[Original all-five/64-history/24-clock interacting source and executable November 8 proof](research_archive/2026-11-07_joint_interacting_native/README.md) now preserve the complete November 7 native joint model, results, randomized regressions and a new theorem showing that the positive square root of the hidden Gibbs transfer uniquely gives the original `P3+ΔP5` amplitude **once positive modular source transport is required**. A5 character theory also proves four independent equivariant quadratic source maps remain possible on the selected 3⊕5 portal. The full physical source-selection/SM/GR claim remains open; see the exact proof and two-model counterexample.

## 8 November 2026 — source selection and four-dimensional refinement

The [conditional source-selection and classical 4D continuum theorem](research_archive/2026-11-07_joint_interacting_native/CATHEDRAL_SELECTION_AND_4D_REFINEMENT_THEOREMS_2026-11-08.md) derives the unique least-Dirichlet-energy eight-mode harmonic space, minimum-norm 50→8→12 portal, face-local bilinear source and positive-Gibbs-amplitude rule, **under explicitly stated conditions**. It also gives a no-extra-winding continuum refinement of the *original* 24 golden-angle clock, its native 64-history Schur response and a smooth-field classical 4D Euclidean action using the archived spatial nearest-neighbour coupling. Two new scripts and the original November randomized test passed. **The primitive URT selection of these axioms and interacting physical 3+1D quantum continuum remain unproved**. The golden fixed-angle axis averaging alone does not select the required eight harmonics.

## 8 November 2026 — native history generates spatial diffusion

The [original-H64 Green–Kubo theorem and regression](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_NATIVE_H64_GREEN_KUBO_SPATIAL_EMERGENCE_2026-11-08.md) derive the **3-vector relaxation rate 10**, **5-quadrupole rate 16**, a separate **radial scalar at 16**, and the **exact three-dimensional diffusive scaling coefficient `D=(pi/e)^2/5`** from the full 64 signed histories on each parity class. The source observable is the genuine six-axis icosahedral vector already present in the history framework; no target data were fitted. The code imports the original 190-geometry/64-history/24-clock implementation, verifies both hidden rank-four source channels, and includes the SHA256 execution log. This is a proved history-observable continuum scaling, not an independently assumed spatial heat operator.

The [source-preserving 4D classical refinement](research_archive/2026-11-07_joint_interacting_native/CATHEDRAL_SELECTION_AND_4D_REFINEMENT_THEOREMS_2026-11-08.md) remains separate from a nonperturbatively constructed quantum gravitational theory. The stochastic spatial readout identified here is a concrete candidate for deriving its previously prescribed spatial transport coefficient.

## 8 November 2026 — local source derivation and free quantum spacetime

The [native face-transfer second-response and Gaussian OS theorem](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_NATIVE_SOURCE_RESPONSE_AND_4D_GAUSSIAN_2026-11-08.md) derives the original `P3[(Cx)^2],P5[(Cx)^2]` source as the small-time second derivative of a positive, linearly source-loaded **original dual-face** semigroup. The same proof keeps the full 64-history Gibbs amplitude, 190-cochain geometry and 24-clock source provenance. The independent verifier checks a genuine A5 rotation, 60x60 Frechet derivative and original source injection. It also constructs a free **3+1D Osterwalder–Schrader-reflection-positive Gaussian history sector** with exact dimensionless dispersion `omega_lambda(k)^2=lambda/(pi/e)^2+|k|²/5` and native masses `lambda=10,16,18`. This quantum free sector is distinct from the interacting continuum and physical gravity questions. [Execution log](research_archive/2026-11-08_native_h64_diffusion/cathedral_source_semigroup_and_4d_gaussian_2026_11_08.verify.log).

## 8 November 2026 — hidden source auto-centring and exact quantum-response coefficients

[Exact native incidence/Wick proof](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_HIDDEN_INCIDENCE_WICK_AND_DUAL_RESPONSE_2026-11-08.md): the **original** icosahedral face intersections yield `(CCᵀ)⊙(CCᵀ)=CCᵀ+6I+2Adual`, hence on the hidden 4+4 carrier `Ph[(CCᵀ)⊙(CCᵀ)]Ph=6P3+2P5`. For any A5-invariant Gaussian reference, the hidden projection removes the common quadratic source mean exactly. For white vertex covariance of variance `sigma²`, the exact hidden-source covariance is `12sigma⁴ P3+4sigma⁴ P5`, and Gibbs-weighted energy–dual susceptibility is `(16+16Delta²/5)sigma⁴`. The accompanying [original-model Python regression](research_archive/2026-11-08_native_h64_diffusion/cathedral_hidden_wick_exact_2026_11_08.py) and [execution hash log](research_archive/2026-11-08_native_h64_diffusion/cathedral_hidden_wick_exact_2026_11_08.verify.log) verify the identities, plus 120,000 Gaussian samples. This cancels the first-moment source offset but does not silently claim cancellation of every 4D ultraviolet divergence.

## 8 November 2026 — exact hidden quartic renormalisation and finite-cutoff stability

[Original-geometry Wick counterterm theorem](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_4D_WICK_STABILITY_COUNTERTERM_2026-11-08.md): exact 12-vertex counterterm spectra `spec(M3)={0(1), (2−4√5/5)(3), (2+4√5/5)(3), (12/5)(5)}` and `spec(M5)={0(1), (2/3)(6), (4/5)(5)}`. It identifies a precise failure of naive Wick-ordering without mass renormalisation (instability when `sigma²>0.4103377795515` along a physical zero-source triplet). The **smallest scalar counterterm sufficient to preserve the original quadratic coercivity** is computed from the top eigenvalue: `m_ct²=8sigma²[(2/9)(2+4√5/5)+(7/48)Delta²]`. A matched free 4D source bubble has a nonzero logarithmic ultraviolet divergence, so mean cancellation alone is not the continuum limit. [Executable symbolic proof check](research_archive/2026-11-08_native_h64_diffusion/cathedral_4d_wick_stability_counterterm_2026_11_08.py) and [execution/SHA256 record](research_archive/2026-11-08_native_h64_diffusion/cathedral_4d_wick_stability_counterterm_2026_11_08.verify.log).

## 8 November 2026 — a cutoff-independent native hidden two-point response

[Analytic finite 4D momentum-response theorem](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_4D_FINITE_SUBTRACTED_HIDDEN_RESPONSE_2026-11-08.md): with matched Gaussian vertex propagator, native H64 spatial diffusion `D=(pi/e)^2/5`, original clock coefficient `r²` and original hidden incidence, the zero-momentum-subtracted one-loop bubble has the exact regulator-independent value `B_R(P²)=-(16π² r D^(3/2))^−1 ∫_0^1 ln(1+x(1−x)P²/m²)dx`. The full rank-four channel response difference is `(12P3+4Delta²P5)B_R`; equal-reference-mass per-quartet ratio `3/Delta²` follows from incidence and Gibbs weighting. [Independent 4D hard-cutoff verifier](research_archive/2026-11-08_native_h64_diffusion/cathedral_hidden_4d_subtracted_response_2026_11_08.py) and [SHA256/convergence log](research_archive/2026-11-08_native_h64_diffusion/cathedral_hidden_4d_subtracted_response_2026_11_08.verify.log) reproduce the finite result. This is an exact Gaussian connected response difference, not a claimed all-loop interacting continuum.

## 8 November — corrected full-source gauge-covariant Wick and stability theorem

The [full 50→8→12 source calculation](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_FULL50_COMPLEX_WICK_AND_24CLOCK_STABILITY_2026-11-08.md) corrects the earlier **12-white-vertex restricted reference** to the actual full-five portal. Exact complex-Wick matrices: `spec(M3)={0(42),(2+4sqrt5/5)(3),(6/5+12sqrt5/25)(5)}`; `spec(M5)={0(45),(4/5)(5)}`. The corrected 50-source weighted susceptibility is `[8+16sqrt5/5+(8/5)Delta²]sigma⁴`; the prior 12D coefficient applies only to the old reference. A source-free triplet in the **actual 190×64×24** action becomes Wick-unstable at `sigma²>0.367222281181353` if its quadratic counterterm is omitted. The full-complex local `U(1)`-invariant tensor counterterm restores its original static quartic exactly. [Original-source verifier](research_archive/2026-11-08_native_h64_diffusion/cathedral_full50_complex_wick_2026_11_08.py) and [SHA256/PASS log](research_archive/2026-11-08_native_h64_diffusion/cathedral_full50_complex_wick_2026_11_08.verify.log). The older [restricted twelve-field note](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_4D_WICK_STABILITY_COUNTERTERM_2026-11-08.md) and [4D subtracted bubble](research_archive/2026-11-08_native_h64_diffusion/CATHEDRAL_4D_FINITE_SUBTRACTED_HIDDEN_RESPONSE_2026-11-08.md) remain archived with their stated different covariance assumptions.
