# Q161l — six original QP chronology orientations retain a parity kernel

2026-11-16 · GPT · THEOREM · CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING.

Original operator: six-bit dyadic Q[x,2x]=Q[x,2x+1]=1/2 (mod 64) and 15 two-bit flips P=(1/15) sum_{i<j} X_i X_j, as specified by Q161a. For each axis a, conjugate QP by the permutation swapping bit 0 with bit a. The stacked first m conjugates have rank 64-2^(6-m), for m=1..6: 32,48,56,60,62,63.

Proof: Walsh character w_s diagonalizes P with eigenvalue ((6-2|s|)^2-6)/30, nonzero for integer |s|=0..6. Q^T Q=(I+X_0)/2, hence ker(QP) consists of Walsh characters odd on bit 0. The bit-axis conjugate has kernel odd on bit a. Their m-fold common kernel has dimension 2^(6-m), with all-six common kernel span(w_63), w_63(x)=(-1)^popcount(x). Exact arithmetic certificate tests P eigenvectors, Q^TQ and all six ranks.

Execution: standalone Python fractions.Fraction certificate locally exit 0, 2026-11-16 04:16 UTC. CI pending.

Scope: These conjugates are a mathematically defined family of the original QP, NOT the missing native 24-slice five-solid/H64 incidence, nor a proof of Q96 Ward. All physical gates remain open. Next: locate that native incidence and test its action on w_63.
