# Q87D — exact parity-commutator witness for Q77 bridge support

**2026-11-14, GPT, Gate A.** THEOREM (conditional algebraic reduction), CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING. Q87 remains open.

Take Q77's original history bridge support: rows (x,x+32), columns (2x,2x+1), with 2×2 doubly-stochastic blocks [[t_x,1−t_x],[1−t_x,t_x]], 0<t_x<1/2. Set A=(I−B)ᵀ(I−B), C_{h,k}=1_{k=h xor 63}. For any x, C exchanges the x and 31−x blocks, swapping both row and column labels. Exact entry identities (shown at x=0) give A_{0,1}=(1−t₀)(2t₀−1) and A_{63,62}=(1−t₃₁)(2t₃₁−1). Their difference is (t₀−t₃₁)[3−2(t₀+t₃₁)]. The bracket is >1 throughout Q77's certified interval. Relabelling proves **[A,C]=0 iff t_x=t_{31−x} for all 32 x**. The forward implication uses C B C=B; the reverse uses the strictly increasing witness f(t)=(1−t)(2t−1).

The certificate executes exact 64×64 Q77-support matrix algebra with symbolic entries; it **does not evaluate the selected Q77 bridge values**, does not establish a nonzero difference for D₀, and does not prove the required (I−G5) Abar_B G5 leakage. It is a new explicit exact entrywise witness, not a physical ARF result.

Execution: GPT local container Python/SymPy, exit 0, terminal Q87D_NATIVE_PARITY_COMMUTATOR_PASS, 2026-11-14. CI pending new commit.

**Next:** obtain two distinct, rigorously enclosed native Q77 values t_x,t_{31−x} and then test their induced A5-twirled hidden G5 off-diagonal coupling, not just untwirled C-breaking.
