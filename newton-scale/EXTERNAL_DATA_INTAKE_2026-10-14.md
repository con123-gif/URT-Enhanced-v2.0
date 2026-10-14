# Newton Scale: first external multi-survey intake (14 October 2026)

**Provenance:** User pasted Grok Bot's compiled-data inventory and numerical summaries, compiled 2026-10-14 UTC. The files under `/workspace/newton_scale` are in Grok's environment, **not mounted in this session**; results below are an arithmetic and primary-literature consistency analysis, **not an independent rerun of those raw datasets**. Do not promote fit summaries to discovered measurements without raw data and hashes.

## Mathematical frequencies and their selection

Use one fixed spectral convention: eigenlength contraction `s = sqrt(lambda_low/lambda_high)` from the positive extremal graph eigenvalues, and `omega = 2*pi/ln(1/s)`.

| Solid | length s | omega |
|---|---|---|
| Tetrahedron | 1, no nontrivial pair | not applicable |
| Cube | 1/sqrt(3) | 11.4384034695 |
| Octahedron | sqrt(2/3) | 30.9924833557 |
| Dodecahedron | phi^-2 | 6.52850260527 |
| Icosahedron | phi^-1 | 13.0570052105 |

Direct eigenVALUE ratios use a different frequency: e.g. octahedron (4/6) gives 15.4962, while its eigenLENGTH ratio gives 30.9925. Do not mix these definitions or interpret a near-15 cosmological feature as an independent match to the length-ratio 30.9925 without a forward physical model. Many non-extremal spectral ratios exist; include their effective search trials if selected after data inspection.

## Planck PR3 plik_lite v22 summary from Grok (not independently rerun)

| Solid | TT delta chi² | TE | EE | TT nominal p, 2 additional coefficients |
|---|---:|---:|---:|---:|
| Cube | 0.339 | 3.116 | 2.045 | 0.8441 |
| Octahedron | 5.602 | 1.233 | 1.410 | 0.06075 |
| Dodecahedron | 0.406 | 2.763 | 0.836 | 0.8163 |
| Icosahedron | 0.242 | 2.997 | 1.051 | 0.8860 |

The octahedral TT improvement has nominal chi²(df=2) p≈0.06075 at **one preselected fixed frequency**; four *independent* fixed tests would give nominal family-wise p≈0.222, though the actual templates are correlated and the full science-wide look-elsewhere problem is larger. A simple two-parameter BIC comparison on 215 TT bins gives delta BIC≈+5.14, favouring no extra oscillation (approximation only). The reported earlier simplified TT 9.20 falls to 5.602 using fuller covariance. The independently fitted TT/TE/EE improvements must **not** simply be added as a cosmological joint likelihood; the Planck joint covariance is 613×613 and the transfer functions couple spectra.

## Crucial physical distinction

The standalone five-cube Markov rule gives `C_n/C_0=(3/4)^n`. With `k_n/k_0=phi^(2n)` its direct implication is
  C(k_n)=C_0 (k_n/k_0)^[-ln(4/3)/(2 ln phi)],
with exponent ~0.2989141761. It is a *power law on a discrete lattice of scales*, not by itself a nonzero sinusoidal modulation at omega_N=6.5285. A log-periodic component is **permitted** by discrete-scale invariance, but its existence, amplitude and phase must be derived from a specified physical observable map.

Consequently an absence of cosmological log oscillations does not falsify the mathematical Markov process, and a single sinusoidal match is not confirmation.

## Particle-mass null from Grok

20,100 pairs: observed 961 within 1% of tested targets; smoothed null baseline 1032±31. Difference = -71, or -2.29 simulation s.d. under that baseline; no positive enrichment. Correlated pair ratios, heterogeneous mass precision and many candidate targets require robust null design. Random 100 pairs: 4 hits vs mean ~1.5 (simple Poisson tail ~0.066) is not a reliable discovery result. Do not count cherry-picked named-particle near-matches as independent evidence.

## Literature verification

- Planck 2018 inflation/features paper reports no compelling evidence for parameterized features: https://arxiv.org/abs/1807.06211
- Official Planck likelihood documentation confirms 613 high-ell bandpowers (215 TT + 199 EE + 199 TE): https://www.aanda.org/articles/aa/full_html/2020/09/aa36386-19/aa36386-19.html
- Peng & Piao (2025), Planck+ACT DR6+SPT-3G, reports log/linear amplitudes ≲0.029 (95% CL), no hint: https://arxiv.org/abs/2507.17276
- Chen et al. (submitted 7 Oct 2026), DESI DR1, A_log<0.035 marginalized; feature near omega~15 present only when fixing Planck background and attributed to distance tension: https://arxiv.org/abs/2610.10530

These published findings do **not** establish Newton Scale. The DESI near-15 feature is not an independent detection of the octahedral **length** frequency 30.9925.

## Next executable empirical discriminant

1. Obtain Grok's actual data bundle and source scripts with SHA256 manifest; verify third-party Plik-lite covariance against official Planck likelihood.
2. Use a **single physical primordial template** `delta P_R(k)=A cos(omega ln(k/k*)+phase)`, propagate through CLASS/CAMB into TT,TE,EE and galaxy P(k), fit one consistent amplitude/phase or justify a specific transfer-derived relation. Compare to flat LambdaCDM with proper 613-bin covariance and nuisance cosmology marginalization. Search all four predeclared frequencies, and correct trials.
3. Blind held-out tests: BOSS DR12 P0/P2/P4 and ACT/SPT where release/hashes permit. WMAP9 is a useful independent cross-check but no full covariance is in Grok bundle yet.
4. If no physical source maps hidden Markov C to primordial perturbations, report only a null **phenomenological template** test, not a falsification of the fundamental theory.
5. Exclude BAO-only DESI compressed points from direct primordial high-frequency sine testing; use DESI galaxy power spectrum with its EFT model and covariance when possible.
6. Treat GWOSC 54,593 bins with published line masks and noise covariance; NANOGrav 30 free-spectrum bins need inter-bin covariances and timing-systematics modelling. Do not do a generic uncalibrated log-periodic template scan.

**Current verdict:** high-quality broad search and informative negative controls, with no reproduced evidence for a Newton–Platonic universal physical law yet. Best quantitative lead is weak/oct-temperature-only and becomes less persuasive under covariance; strongest next leverage is rigorous, held-out Planck/BOSS/ACT joint testing with a physically justified coupling.
