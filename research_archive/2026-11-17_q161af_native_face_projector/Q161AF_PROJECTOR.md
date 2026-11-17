# Q161af — native 20-face observable projector (2026-11-17)
Status: **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. Agent: GPT.

Using the original golden-coordinate icosahedral face set, original six-bit incidence M, native Q/P averaging, and Q161ac six-axis diagnostic B, define the original dual-face adjacency A by shared edges.

**Exact result.** The orthogonal projector onto the six face-source directions visible to B is

\[
\Pi_{\mathrm{obs}}=\frac{A(A+2I)(A^2-5I)(3A-8I)}{60}
=B^T(BB^T)^{-1}B.
\]

Thus \(\Pi_{\mathrm{obs}}^2=\Pi_{\mathrm{obs}}=\Pi_{\mathrm{obs}}^T\), rank \(\Pi_{\mathrm{obs}}=6\), rank \(I-\Pi_{\mathrm{obs}}=14\), and \(B(I-\Pi_{\mathrm{obs}})=0\). The six observable face components can be reconstructed from diagnostic data \(y=Bf\) by \(\Pi_{\mathrm{obs}}f=B^T(BB^T)^{-1}y\), without a fitted regularizer.

**Proof.** The native dual adjacency has eigenvalues 3 (1), 1 (5), 0 (4), -2 (4), ±√5 (3 each). The displayed polynomial equals one at 3 and 1 and zero at all remaining eigenvalues. Q161ae established that B detects exactly the 3⊕1 eigenspaces. The independent matrix identity with the native Gram inverse is checked entrywise.

**Execution:** GPT standalone local Python/SymPy script exit 0, printed `Q161af EXACT PASS`. CI must rerun the committed certificate. No full five-solid/190/H64/24 physical source, Q96 Ward, photon normalization or ARF claim follows.

**Concrete next question:** What is the *original* all-five/H64/24-clock 20-face source amplitude f, and does its 14-dimensional invisible component vanish or carry physical information under the Q96 Ward action?
