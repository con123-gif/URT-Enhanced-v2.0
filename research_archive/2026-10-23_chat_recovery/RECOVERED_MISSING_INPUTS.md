# Recovered missing-input inventory — Newton's Cathedral / URT
**Date:** 2026-10-23. **Purpose:** Preserve recovered earlier work and distinguish available equations from missing physical selection laws. No fit, no new physics premise.

## Important correction: kl_urt_koide_action.py EXISTS
- Recovered an executable 70-line file from the ChatGPT Cathedral file library, SHA256 `0f8a996d7fe097772053760b667bb9c844d5c61c452999b79c0b70694ed0b502`.
- Archived unchanged at `research_archive/2026-10-23_chat_recovery/kl_urt_koide_action.py`.
- Successfully executed on 2026-10-23 using installed NumPy and SciPy. For kappa=(0.1,1,47.966978303,1000), all give `|s|/v=1/sqrt(2)`, `Q=2/3`, from the *declared effective* action:
  `M=vI+sC+conj(s)C²`, `Gamma=(kappa/2)Tr(M²)-ln(v)-ln|s|`.
- This action is **phase-flat**. It does not derive Koide delta, source-level photon/H64 mass poles, or the unchosen Gaussian/log normalization from microscopic dynamics. Its measured mass inputs are explicitly comparison data, not blind predictions.

## run_joint_vacuum.py
- The exact named original file has not been recovered here. Do **not** claim it was.
- There is an actual archived and runnable implementation of the four-species common-vacuum variational calculation: `research_archive/2026-10-17_original_oct08_source/joint_vacuum_work/species/shared_species_vacuum.py`.
- Required original data: `research_archive/2026-10-17_original_oct08_source/derive_three_work/species/golden_species_operators.npz`.
- The code explicitly labels its action **conditional**: V_probe(P)=phi^-2||P||²/2, source-dependent logdet Q_f; it is *not* the canonical full V_URT. It writes `shared_species_vacuum_checks.json` and `shared_species_vacuum_operators.npz` alongside the script.
- Run from a checkout with NumPy/SciPy using `python research_archive/2026-10-17_original_oct08_source/joint_vacuum_work/species/shared_species_vacuum.py`.

## V_URT
- The repository has `newtons_cathedral/vacuum.py`, defining the two rails `delta_star=(80/81)pi/(13phi)`, `delta_cl=3/20`, the gap `Delta`, and the scalar *rail value* `V(delta_cl)=Delta²(1+delta_cl²)/2`. This is not an unambiguous functional V_URT on the full chronological history/operator state space.
- A microscopic functional that uniquely selects cross-dimensional coupling g and the A5→C3 generation phase remains unverified.

## M_U
- In the October 17 frontier census, M_U is the **unification scale**, not a mass matrix: `ln(M_U/M_Z)` remains a missing top-down physical anchor. The record lists conditional example values ~10^18 GeV depending on running assumptions; these are not an independently derived M_U.
- Do not insert an experimental unification scale as an unfitted Cathedral output.

## Spin-2 link
- Exact finite **geometric** spin-2 / information-metric bridge is already implemented:
  `research_archive/2026-10-15_icosahedral_125_DEC_H64/cathedral_entanglement_spin2_exact.py`,
  `ENTANGLEMENT_SPIN2_CHIRAL_BRIDGE.md`.
- Defines oriented face chirality W, W²=-15(P_odd+P_even), and a fiveplet to hidden Hom(4_odd,4_even) isometry with relative-entropy Hessian. Does *not* derive a 4D diffeomorphism-redundant coframe link, Einstein equations, physical G or fixed gauge normalization.

## rho_star
- The finite normalized master density **is explicitly known**:
  `Delta=3/20-80pi/(1053phi)`, `eta=-ln(Delta)`, `L_hid=3P_3+5P_5`,
  `rho_star=e^(-eta L_hid)/Tr e^(-eta L_hid)=(I4 ⊕ Delta² I4)/[4(1+Delta²)]`,
  `p5=Delta²/(1+Delta²)`.
- The *physical* rule identifying a spacetime state or coframe variation with this finite matrix remains unresolved. Do not call the density-matrix formula itself missing.

## Provenance and hierarchy
- Prior comprehensive handoffs `GROK_START_HERE.md` and `FULL_TECHNICAL_HANDOFF.md` should be corrected only as to the existence of the now-recovered KL file, not promoted to physical closure.
- Historical v35 L=13 wall / Y24 / D48 current residues remain a stronger defined response model than simplified October 18 common-vacuum surrogates; matching a frozen response matrix is not, by itself, a source-first physical prediction.
- The October 23 five-orientation five-step result remains exact internal geometry (phi³ phase hierarchy and sqrt2 triplet response), with unfixed g and physical mass-vertex identification.
- **No secrets:** ngrok tokens are deployment credentials, not scientific input. Never commit them to public GitHub.

**Physical frontier:** derive the unique selected-history action and its stationary/effective-field equations, select g and A5→C3 source holonomy, derive a gauge-covariant charged-lepton inverse propagator and physical pole/current normalization, then compare with masses only after freezing the prediction. The recovered KL file closes only its declared variational amplitude identity.
