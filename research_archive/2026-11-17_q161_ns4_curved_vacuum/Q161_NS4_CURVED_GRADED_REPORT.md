# Q161: 384-site curved graded vacuum continuation — 17 November 2026

STATUS: CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING for the conditional finite original operator. Continuum photon, non-Abelian gauge dynamics, gravity and physical ARFs remain OPEN.

The original Q101 five-solid 190-cochain and 50-to-8-to-12 source, Q124/125 444-state chiral current and Q96 charge transport, and unchanged 11 native v61 Wilson links feed the same graded determinant as the prior 48-site calculation. No fitted physical inputs or synthetic Hessian eigenvalue signs.

The original stationary nonzero-triangle-flux Astar remains stationary at NS4 and NS6 by the exact even-volume theorem, but its homogeneous Hessian has negative eigenvalue -10940.0807023 at NS4 and -179.4511700 at NS6. Descending the computed negative mode of the original action at NS4 in both signs, minimizing this SAME action, and refining by the actual uniform Hessian produces two distinct stationary candidates.

Independent local calculation (original formulae reconstructed, with native 48-site baseline checked) yields:

| Quantity | Curved branch | Nearly flat branch |
| --- | ---: | ---: |
| Action / 384 sites | -85794.23302010586 | -87505.43346119690 |
| Normalized gradient norm | 2.002e-9 | 3.942e-10 |
| Lowest physical Hessian eigenvalue | 0.133513805 | 0.004906921 |
| Positive physical eigenvalues, all 384 momentum blocks | 3841 | 3841 |
| Negative | 0 | 0 |
| Gauge zeros | 383 | 383 |
| Max relative Ward residual | 2.66e-16 | 2.66e-16 |

The curved branch has nonzero triangular Wilson distance for minimal charge 1/3 (minimum >1.86); the second is nearly flat. The curved branch has higher action; these local stationary extrema do not establish a unique/global physical vacuum.

Independent original-formula 16x16 Bloch-orbit NONLINEAR determinant finite differences under cos(pi x /2), compared with analytic first-spatial-momentum Hessian on the curved branch: relative error 3.4639e-7. The analytic uniform Hessian agrees with direct gradients at NS4 to ~1.07e-7 relative. Both tests were executed locally, as were all 768 momentum blocks across the two stationary solutions.

The accompanying source-native program imports the UNMODIFIED GitHub Q125 and v61, derives stationary branches from negative-mode descent, and evaluates the full curved 384-block Hessian. Its GitHub CI must run before counting a SOURCE-NATIVE CI PASS. Source-native and independently reconstructed results are not conflated.

NEXT: Compute full 1296-sector NS6 optimized curved branch and actual long-wavelength photon Z_t,Z_s as volume and temporal size increase, keeping Q96 Ward identities. Recover primitive 190/H64/24 time normalization. Do not infer continuum Lorentz invariance or observed fine structure from finite positive Hessian.
