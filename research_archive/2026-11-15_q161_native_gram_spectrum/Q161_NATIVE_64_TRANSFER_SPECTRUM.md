# Q161a — native 64-history Gram transfer spectrum

**Result type:** THEOREM. **Status:** CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

**Original source:** `research_archive/2026-11-10_urt_arf_forward/new_gate/URT_KMS_POSITIVE_TRANSFER_CLOCK_GATE_2026_11_10.py`. Use its six-bit chronological Q, 15-pair-flip P, and T=(QP)^T(QP), not a synthetic replacement.

**Exact result:** det(xI-T)=x^32(x-1)(x-1/9)^6(x-1/25)^10(x-1/225)^15; rank 32, nullity 32, trace 32/15.

**Proof:** The original Q satisfies Q^T Q=(I+F_0)/2, where F_0 flips bit 0. The native P is a sum of 15 two-bit flips and commutes with F_0. Walsh characters w_s(a)=(-1)^popcount(a&s) diagonalize P with p_k=((6-2k)^2-6)/30, k=popcount(s). Thus T=P (I+F_0)/2 P has eigenvalue p_k^2 on bit-0-even Walsh characters and zero on bit-0-odd ones. Multiplicities of surviving weights k=0,...,5 are C(5,k), giving the polynomial. The certificate explicitly builds original Q/P as exact 64×64 rational matrices and checks all 64 Walsh eigen-equations.

**Scope:** This existing conditional H64 candidate is singular, so a finite full-space -log(T) is undefined; a support restriction or a *derived* source lift is required. It does not establish the unique five-solid 190/H64/24 physical transfer, relative v61 kinetic normalization, or a Q159 gap repair. No physical gate closes.

**Local evidence:** `python research_archive/2026-11-15_q161_native_gram_spectrum/Q161_NATIVE_64_TRANSFER_SPECTRUM.py` exit 0 using exact Fraction arithmetic.

**Next question:** Does the original five-solid/24-clock source-to-H64 map lift the 32-dimensional nullspace while retaining the native charged Ward operator, without fitted parameters?
