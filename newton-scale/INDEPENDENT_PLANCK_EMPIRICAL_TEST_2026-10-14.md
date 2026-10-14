# Independent Newton–Platonic empirical test — Planck PR3 complete (2026-10-14)

## Provenance
Performed in GitHub-hosted compute by an independent runnable analysis, **not just copied from Grok Bot**. Public Planck 2018 PR3 613 binned TT/TE/EE data, covariance and bestfit D_ell were downloaded; SHA-256:
- Plik Lite v22 covariance: ad90378c50bd67841764179c90ae6711fa4317c649966ab2b0712143b31e0a32 (official-identical hash supplied by Grok)
- Planck bestfit theory: 50eecd4422e22026070bdacf9fa8a7e7ef3badf4fa50fffea040df669715cf51
- Code: newton-scale/planck_pr3_joint_fullcov.py, newton-scale/planck_primordial_camb_fit.py
- JSON: newton-scale/PLANCK_JOINT_EMPIRICAL_RESULTS.json and newton-scale/PLANCK_PRIMORDIAL_CAMB_RESULTS.json
- Full pipeline completed successfully in GitHub Actions, including cross validation.

All four frequency candidates are preselected **eigenlength** values, not eigenvalue ratios:
cube omega=11.43840346952; octahedron 30.99248335570; dodecahedron 6.52850260527; icosahedron 13.05700521055.

## A. Exploratory fit to sinusoid in ln(ell)
With fixed official Planck baseline, full Plik Lite 613x613 covariance and a **shared two-parameter fractional modulation** delta C_ell/C_ell = a sin(omega ln ell) + b cos(omega ln ell), the full-covariance joint improvement is:

| Geometry | delta chi2 | nominal fixed-frequency p |
|---|---:|---:|
| Cube | 1.46579 | 0.4805 |
| Octahedron | **12.04948** | 0.00242 |
| Dodecahedron | 0.91417 | 0.6331 |
| Icosahedron | 0.14456 | 0.9303 |

Four-frequency correlated Gaussian null simulations (N=30,000): familywise p=0.00877 **conditional on this chosen template**. Adding the fixed Newton memory envelope gives for octa delta chi2=10.546, four-frequency p=0.01973. A shared additive C_ell sinusoid gives octa delta chi2=2.130, four-frequency p=0.7748.

Six template families x four candidate frequencies (24 total tests), corrected *conditional* global minimum-p = **0.03443** under 30,000 joint Gaussian null simulations. No cosmology or nuisance refit.

Octa fractional ln ell held-out:
- TT->TE+EE conditional delta chi2=+2.10, matched-filter z=1.71.
- TE+EE->TT delta chi2=-12.42 (polarization-trained amplitude does not transfer).
- low-TT->high-TT delta chi2=+7.21; high-TT->low-TT +1.73.
This is not an independent physical detection.

## B. Physically propagated primordial P_R(k) features (CAMB 2.0.5)
A stronger physically interpretable template is
  P_R(k)=As (k/0.05)^(ns-1) [1+a sin(omega ln(k/0.05))+b cos(omega ln(k/0.05))].
The Boltzmann transfer into lensed TT/TE/EE was calculated using CAMB (AccuracyBoost=lSampleBoost=lAccuracyBoost=1.3, 2508 multipoles). Finite response derivatives were constructed with epsilon=0.02 primordial perturbation. Only two common physically transmitted coefficients (a,b) are fitted per candidate.

Reference flat LCDM background was held fixed at H0=67.36, omega_b=0.02237, omega_c=0.12, tau=0.0544, As=2.100549e-9, ns=0.9649, neutrino total mass=0.06 eV. Baseline for chi2 was the official Planck PR3 minimum-theory spectrum (not reoptimized); baseline full chi2=585.474565887. The independent CAMB baseline differs from the official spectrum by RMS fractional 0.00848 on 613 binned values.

| Geometry | delta chi2 physically propagated | fixed-frequency nominal p (2df) | fitted primordial modulation A |
|---|---:|---:|---:|
| Cube | 2.46950 | 0.29091 | 0.00566 |
| Octahedron | **6.83075** | 0.03286 | 0.01573 |
| Dodecahedron | 1.30522 | 0.52069 | 0.00322 |
| Icosahedron | 0.37930 | 0.82725 | 0.00228 |

Four-frequency corrected probability from **50,000 correlated Gaussian simulations**: **p=0.11476**. Thus NO convincing detection of a physical primordial Newton–Platonic feature.

Robustness:
- Using CAMB's independently computed baseline instead of the official minimum theory: octa delta chi2=6.0240, fitted A=0.01477.
- Training octa phase/amplitude on Planck temperature only and predicting held-out TE+EE with exact conditional covariance: held-out delta chi2 **-4.9683**, matched filter z=+0.198 (no validation).
- Training TE+EE and predicting temperature: delta chi2=+2.1054, z=1.459 (weak).
- Train lower-temperature multipoles ell<900 (103 bins), test ell>=900 (112 bins): delta chi2=+6.5294, z=2.627 (exploratory within-spectrum support).
- Train high TT and test low TT: delta chi2=+1.5602, z=1.479.

## Meaning and limitations
1. This is an **actual independent analysis of observed Planck data**. It faithfully reconstructs the source covariance and computes physical CAMB response for all four Platonic eigenlength frequencies, including nonlinear lensing response in the finite-perturbation CAMB spectra.
2. The simplified ln ell feature fit was more suggestive but is **not** evidence for a primordial feature: CMB transfer projection matters.
3. The physically propagated octahedral candidate is neither significant globally (p≈0.115) nor validated by independent polarization.
4. These are fixed-parameter Plik Lite exploratory probabilities, NOT a full cosmological likelihood: foreground/calibration and six baseline cosmological parameters were not marginalized; source lensing transfer and primordial oscillations were approximated at epsilon=0.02 and no oscillation-dependent nonlinear fit was performed. The global p treats four frequencies, not years of community-wide feature searches and literature.
5. A primordial oscillation is only one *phenomenological hypothesis*. The independent Platonic Markov memory law gives discrete scalar attenuation (3/4) at a fixed Newton ratio, not a mandatory nonzero primordial oscillation amplitude. Null oscillation evidence therefore does not by itself falsify the mathematical law.
6. BOSS DR12, ACT DR6, SPT-3G and independent material correlation data remain in the supplied inventory but were **not** independently analysed in this completed Planck test. Do not assert that they confirmed or falsified the model.

**Evidence verdict:** No confirmed Newton Scale cosmological signal from this Planck dataset. The octahedral feature is a weak exploratory temperature-only lead, not a statistically verified law. Both negative results and the usable code/data hashes have been preserved.

## Reproduce
Run the two scripts on a machine with internet access:
  python -m pip install numpy scipy camb
  python newton-scale/planck_pr3_joint_fullcov.py
  python newton-scale/planck_primordial_camb_fit.py
The scripts download the published Planck data, verify hashes and write complete JSON result tables. The repository's workflow files independently execute them on GitHub-hosted compute.
