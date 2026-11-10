# Q14 — third-cumulant separation of a native K2 collision

**Result: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.**

For the exact native hidden-5 icosahedral face source and five A4 singlet lines reconstructed by `2026-11-10_signed_a5_covariance/signed_a5_covariance.py`, retain the original six-bit de Bruijn chronology `Q(h,2h)=Q(h,2h+1)=1/2`. Compare signed dictionaries
`D0=(0,2,4,6,8,10)` and `D1=(0,2,5,6,9,11)`. They share the exact five-vacuum normalized K2 multiset `{5/6,25/24,67/48,33/16,33/16}`, as established by Q12.

**Exact K3 separation.** For a vacuum line `t` of norm squared `r2`, define `I3 = K3(g)^2 / r2^3`. This removes the arbitrary sign and nonzero scalar normalization of the line. The vacuum uniquely identified by `K2/r2=25/24` has

- `I3(D0) = 4823127/1024000 - (41811/256000) sqrt(5)`;
- `I3(D1) = 4823127/1024000 + (41811/256000) sqrt(5)`.

Their difference is exactly `(83622/256000) sqrt(5) ≠ 0`. Thus the **joint K2–I3 multiset** differs even though the K2 multiset coincides. The other four K3 values are emitted by the certificate. This is a pairwise result; it does not establish that all 768 signed A5 orbit classes become distinguishable at order 3.

**Proof / execution.** `native_k3_collision.py` loads the actual Q11 five-solid source/vacuum construction, applies each dictionary to the 64 source histories, computes the exact K3 via the finite Poisson inverse `(I-Q)^{-1}|_{mean=0} = I+Q+…+Q^5`, and independently checks `K3(25)-K3(24)` by finite tilted-transfer moments. Every asserted equality uses rational arithmetic in `Q(sqrt(5))`; failure exits nonzero. GPT container Python 3.13.5, SymPy 1.14.0, NetworkX 3.6.1: exit 0 on an exact local reconstruction of Q11's native formulas. **The GitHub certificate's import of the archived Q11 file awaits CI execution.** No measured inputs, fitted constants, physical charged pole, or ARF derivation.

## RESUME HERE

Q15: classify the exact joint `(K2,I3)` signatures of all 768 signed proper-A5 orbit representatives, preserving fixed Q; count remaining non-parity collisions and supply witnesses. If runtime exceeds 10 minutes, use the registered compute queue.
