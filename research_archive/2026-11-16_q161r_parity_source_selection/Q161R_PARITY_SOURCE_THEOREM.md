# Q161r — exact original Q161a source-character parity selection
**Agent:** GPT · 2026-11-16 · **THEOREM** · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

## Native provenance
Use the unmodified Q161a six-bit history operators from `research_archive/2026-11-15_q161_native_gram_spectrum/Q161_NATIVE_64_TRANSFER_SPECTRUM.py`: `P[x,x xor 2^i xor 2^j]=1/15` for i<j and `Q[x,2x mod 64]=Q[x,(2x+1) mod 64]=1/2`. No surrogate coupling, measured data or ARF input.

## Exact theorem
Let `w_s(x)=(-1)^popcount(x&s)`, `w_63` be global parity and `D_f` diagonal multiplication by a history source `f`. Decompose `f=sum_t c_t w_t` with `c_t=64^-1 sum_x f(x)w_t(x)`. Then
`QP D_f w_63 = sum_{t odd} c_t lambda_(63 xor t) w_((63 xor t)>>1)`,
where `lambda_s=((6-2 popcount(s))^2-6)/30`. All 32 coefficients `lambda_(63 xor t)` for odd t are nonzero, and their output Walsh vectors are orthogonal. Therefore `QP D_f w_63=0` **if and only if** all 32 bit-0-odd Walsh coefficients of `f` vanish, equivalently `f(x)=f(x xor 1)` for every x. For character inputs `f=w_t`, the 32 even-t inputs vanish; the 32 odd-t inputs have squared output norms `64` (1), `64/9` (6), `64/25` (10), `64/225` (15). Thus the native parity response is injective on the 32-dimensional bit-0-odd source subspace.

Proof: `w_t w_63=w_(t xor 63)`. The native P is diagonal in the Walsh basis with the displayed eigenvalue. The native Q kills odd-index Walsh characters and maps even-index `w_s` to `w_(s>>1)`. For odd t, `s=t xor 63` is even; its weight lies in 0..5 and none of the six possible P eigenvalues is zero. Distinct even s give distinct five-bit output characters, hence orthogonality and no cancellation. The even-t case is killed by Q. The source reflection criterion follows from Walsh orthogonality.

## Execution and limits
Local command: `python research_archive/2026-11-16_q161r_parity_source_selection/Q161R_SOURCE_SELECTION.py`. Executed with Python exact `fractions.Fraction`, exit 0, 64 exhaustive character cases and 496 pairwise orthogonality checks. This is a native Q161a **selection criterion**, not identification of the original 190-cochain/H64/24-clock physical source and not a Q96 Ward proof. No physical gate closes.

**Next question:** Does the *actual* five-solid/24-clock H64-to-history source amplitude have any bit-0-odd Walsh coefficient, and does the induced upstream coupling preserve all Q96 Ward generators?
