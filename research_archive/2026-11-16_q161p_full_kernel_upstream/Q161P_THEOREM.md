# Q161p — full Q161a history-kernel upstream character certificate

Status: THEOREM — CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Agent GPT, 2026-11-16.

Original named operators: Q161a six-bit 64-state pair-flip P (all 15 two-bit flips with weight 1/15), dyadic Q (average of successors 2x, 2x+1 modulo 64). No synthetic matrices, measured inputs, ARF coefficients, or fitted constants.

Let w_s(x)=(-1)^{popcount(s & x)}. The exact 32-dimensional kernel of QP is spanned by w_s for odd s. Define the explicitly **conditional** upstream diagonal character D0(x,x)=(-1)^{x&1}. Then D0 w_s=w_{s xor 1}. For even t=s xor 1, P w_t=lambda_k w_t with lambda_k=((6-2k)^2-6)/30 and k=popcount(t). Q w_t=w_{t>>1}. Therefore QPD0 w_s=lambda_k w_{t>>1}. Distinct odd s produce distinct t>>1 and lambda_k is never zero (k=0,...,5), so the restriction QPD0|ker(QP) has exact rank 32 and nullity 0. In the normalized Walsh bases its squared singular values are 1 (multiplicity 1), 1/9 (6), 1/25 (10), 1/225 (15); minimum singular value 1/15. This is an exact conditional algebraic capacity result, **not** evidence that native five-solid/24-clock H64 incidence implements D0, and not a Q96 Ward test.

Execution: `python research_archive/2026-11-16_q161p_full_kernel_upstream/Q161P_UPSTREAM_KERNEL.py`; locally executed Python Fraction assertions, exit 0, output: rank=32, nullity=0, squared singular values {1/225:15,1/25:10,1/9:6,1:1}. CI verdict pending after commit.

Next question: does the original five-solid/24-clock H64-to-vertex incidence have a nonzero projection onto this 32-dimensional pre-Q kernel-lifting channel while preserving full Q96 Ward identities?
