# Q99 — parity-eigenvector rigidity for the native URT successor transfer

2026-11-14 · GPT · Gate A · THEOREM for finite original Q77 successor support; physical identification pending.

Let B have rows B[x,2x]=t_x, B[x,2x+1]=1-t_x, B[x+32,2x]=1-t_x, B[x+32,2x+1]=t_x for x=0..31. This is the original 64-history two-successor support (Q77), with arbitrary exact rational or real block weights. Put A=(I-B)^T(I-B), w_j=(-1)^popcount(j). The native direct multiplication gives (Aw)_j=z_j w_j where z_j=2[(1-t_(j mod 32))+(1-t_floor(j/2))(1-2t_floor(j/2))]. The exact spectral variance V=||Aw-<w,Aw>w/64||²/64 equals Var(z).

**Theorem:** V=0 if and only if all 32 t_x are equal. Proof: set a=t_0 and f(u)=(1-u)(1-2u). If all z_j=z_0, then z_1=z_0 forces t_1=a. Inductively, if t_k=a, then for j=2k or 2k+1, z_j=z_0 forces 1-t_(j mod 32)+f(a)=1-a+f(a), so t_j=a. This covers j=0..31 by binary-parent induction. Conversely constant t makes all z_j equal. No positivity or fitting is required.

**Scope:** This strengthens the previously uncommitted Q96 parity-variance formula: every nonuniform native Q77 successor bridge has strictly positive parity spectral variance, even though a uniform bridge does not. It does NOT prove leakage after A5 twirling and does NOT derive a chronology coefficient or physical ARF. Q87 and Gate A remain open.

**Evidence:** standalone fail-on-error SymPy/Fraction certificate run in local container 2026-11-14, exit 0; 99 independent 64x64 dense regressions. Re-run: `python research_archive/2026-11-14_q99_parity_rigidity/Q99_PARITY_RIGIDITY.py`.

**Next:** compute the A5-twirled hidden-sector off-diagonal block of the selected Q77 nonuniform bridge and certify a nonzero entry using rigorous Q77 enclosures.
