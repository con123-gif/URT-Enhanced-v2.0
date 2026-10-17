# Koide standalone verification and phase-selection stress test — 17 October 2026

**Result:** The user's self-contained NumPy script passes all assertions. The geometric identities, circulant algebra and stated mass-ratio arithmetic are reproduced. The physical phase-selection theorem does **not** follow from the displayed action: its stationary phase is undetermined.

## Reproduced numerical output
- Projector bridge / Gauss–Codazzi residual: 4.80e-16.
- Hidden squared off-block Berry strength S_mixed=4/5.
- Odd/even hidden quartet parity checks pass; odd visible-to-hidden off-block contraction = 0.264885.
- Same-shell U3^T c U0 squared spectral ratio phi^-6=0.055728090001.
- Constructed Hermitian circulant Q=2/3 (machine precision).
- Chosen screening rule delta=(2/9)[1-(2/(5pi))P5] returns delta=0.222222046910501 rad, mu/e=206.7682808, -0.41 sigma vs supplied CODATA ratio.

## Phase is inserted, not dynamically selected
The script **defines** Phi_triangle=(2/3)*(1-(S_mixed/(2pi))*P5), then constructs s=(v/sqrt2) exp(i Phi_triangle/3), then re-extracts the known phase by trace identities. These operations verify internal consistency but do not compute an oriented holonomy or its stationary point.

The tree action Gamma=(kappa/2)Tr(M^2)-ln v-ln|s| has Tr(M^2)=3v^2+6|s|^2 independent of the phase. With kappa=pi/e its stationary amplitude is v=0.5370462361945711, |s|=0.3797490354238935 (unlike the script's chosen v=1). The true stationary action equals 2.589915764797483 for **every** phase. Test positive spectra at delta=0.10, 0.17, 0.2222220469, 0.25: they all satisfy Q=2/3, while mu/e changes from 5.779957 through 28.325045, 206.768281 to 2710.211249. Phase stationarity alone cannot choose the masses.

## Orientation reversal test
Reverse each oriented triangular face (i,j,k)->(i,k,j); d2 changes sign, d2^T d2 and unsigned incidence do not. The squared-norm curvature S_mixed remains 0.7999999999999975, and chosen delta remains 0.2222220469105011. Thus the screening scalar as implemented is orientation-even, not a signed loop holonomy.

## Scope
The code neither defines the 125-simplex full_hidden_lift nor performs an actual multi-shell recursive step, photon self-energy, or species-loaded H64 mass-pole calculation. This is a limitation of this **specific claim**, not a general no-go for the multi-Platonic URT/Cathedral theory.

Reproducible conversation artifacts: cathedral_koide_standalone_verify.py; cathedral_koide_selection_stress_test.py; CATHEDRAL_KOIDE_STANDALONE_INDEPENDENT_AUDIT.md; cathedral_koide_standalone_independent_audit.zip.
