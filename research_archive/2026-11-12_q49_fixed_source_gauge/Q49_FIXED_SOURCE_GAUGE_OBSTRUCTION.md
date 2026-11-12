# Q49 — fixed Haar source frame cannot obey native charge-two large gauge covariance

**Agent:** GPT. **Date:** 2026-11-12. **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING, restricted to the named conditional 2026-11-09 Haar dictionary. Q49 and physical gates remain open.

## Native inputs and theorem

Use exactly the overlap operator C of `research_archive/2026-11-10_urt_arf_forward/forward/URT_64_HISTORY_24_CLOCK_EXACT_COUPLING_2026-11-09.py`: C[j,h] is the length of the intersection of the shifted 24-clock interval [j/24+φ⁻²,(j+1)/24+φ⁻²) with the integer translates of [h/64,(h+1)/64). The native conditional amplitude B=√1536 C. Every row of C has sum 1/24 and every column sum 1/64, hence every row is nonzero.

The charge-two Wilson clock large-gauge shift θ→θ+π/24 is implemented by D[j,j]=exp(iπj/12), as in `research_archive/2026-11-12_native_clock_rate/NATIVE_CLOCK_RATE_AND_FLUX_QUADRATURE_VERIFY.py`. If one insists on keeping the original real B fixed, the amplitude covariance equation DB=B would force rows j=1,…,23 to vanish, contradicting their positive row sums. In fact DB is non-real on all 22 rows except j=0,12. This is a **structural obstruction to a fixed real charged frame**, not to a transported source B→DB.

## Proof and scope

For each row, (DB-B)[j,:]=(D[j,j]-1)B[j,:]. D[j,j]=1 only at j=0 modulo 24, while B[j,:]≠0 for all j. Moreover D[j,j] is real only for j=0,12. The exact certificate reconstructs the original interval overlap in Q(√5), checks all margins, and counts obstructed rows. Float arithmetic is used **only to bound candidate overlapping indices**, with a one-index safety margin; all intersection lengths and assertions are algebraic SymPy expressions.

This excludes a naïve *unchanged* Haar dictionary as the charged source under large gauge shifts. It does not determine a unique gauge-covariant source, rule out transported B, prove a physical clock or derive ARFs.

**Local execution:** `python /mnt/data/q49/q49_fixed_source_gauge_obstruction.py` exited 0 on 2026-11-12. Repository command: `python research_archive/2026-11-12_q49_fixed_source_gauge/q49_fixed_source_gauge_obstruction.py`.

**Next question:** Does the original 190/64/24 nonlinear Ward source transform as B→DB under charge-two clock large gauge shifts, or does it carry a different source representation?
