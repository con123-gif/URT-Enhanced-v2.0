# Q161bw — exact native Q104 history permutation spectrum (2026-11-18)
**Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING (finite history/clock operator only).
Native operator: `cathedral_engine/histories.py` `sigma_lift(SIGMA1_BETA)` as independently reconstructed in Q161bv; 64 states. The cycle decomposition is five 12-cycles and one 4-cycle. Thus
`chi_sigma(x)=(x^12-1)^5(x^4-1)` and `mu_sigma(x)=x^12-1`.
Exact fixed-point traces at k=1,2,3,4,6,12 are 0,0,0,4,0,64. The sum of traces over k=0..11 equals 72, so the invariant subspace has dimension 6 (Burnside projection).
For the **declared conditional** tensor product with native 24-clock shift, all 1536 states split into 64 orbits of length 24, hence `chi_joint(x)=(x^24-1)^64`, `mu_joint=x^24-1`.
This is not a source-defined 190/H64-to-24 transport, not a Q96 charged Ward identity, and not a physical law. No measured inputs or fitted ARFs.
**Evidence:** `python -u research_archive/2026-11-18_q161bw_native_sigma_spectrum/Q161BW_CERT.py` exit 0 locally.
**Next question:** Can the original five-solid/H64 source supply an explicit non-product J from 190 cochains to 24-clock with a calculable Q96 Ward residual?
