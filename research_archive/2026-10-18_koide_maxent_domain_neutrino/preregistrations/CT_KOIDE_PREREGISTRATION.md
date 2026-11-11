# Pre-registration: Cathedral Transform as the Koide phase source (18 Oct 2026)

Written before any of the tests below were run. No parameter is free; nothing is tuned after running.

## Operator
Cathedral Transform exactly as built on 5 Apr 2026:
delta_star = (80/81) pi / (13 phi), N = 13,
raw[k,n] = exp(2 pi i delta_star k n / 13) * phi_k,
phi_k = exp(i pi k / 2) for k = 0..3, exp(2 pi i ((k-4) mod 5) / 5) for k = 4..12,
U = (Q from scipy.linalg.qr(raw.T)).T.
Identity check: eigenphases must match the archived list (-2.854 ... +2.716) up to overall sign.

## Targets (data, comparison only)
CODATA 2022 m_e, m_mu/m_e; PDG 2026 m_tau. Measured Q and measured Lode phase delta, each with its m_tau error.

## Tests (sqrt-masses = eigenvalues of the stated 3x3 Hermitian matrix)
- T1  three-return Gram of the centre node e_0 under U: G_jk = <U^j e_0 | U^k e_0>, j,k = 0..2.
- T2  three-return Gram of the canonical delta signal (delta_star at n=0, delta_cl - i(delta_cl-delta_star)/12 for n=1..12), normalised.
- T3  three-return Gram of the K4-trivial mode function x = U^dagger e_0.
- T4  generator compression: H = -i log U (principal branch), 3x3 block on the K4-nontrivial modes k = 1,2,3.
- T5  spinor-cube (x) transform: generation states |n_k> (x) r_k, n_k the inscribed-cube triad spinors of the previous attempt, r_k the normalised raw rows k = 1,2,3; G = Hadamard product of the two Grams.

## Pass criterion (each test)
All three eigenvalues > 0, |Q - Q_meas| < 3 sigma_Q and |delta - delta_meas| < 3 sigma_delta. Anything else is FAIL.

## Look-elsewhere control (reported, not a pass route)
Same constructions over all 13 site and 13 mode basis states (three-return) and all 286 mode triplets (compression).
Best joint distance in sigma, compared with 2000 Haar-random 13x13 unitaries put through the identical constructions.
