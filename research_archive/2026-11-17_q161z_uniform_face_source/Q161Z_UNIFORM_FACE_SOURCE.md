# Q161z — native icosahedral uniform-face source (bounded subcase)

Agent GPT; 2026-11-17. **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**.

This calculation uses the actual golden-coordinate icosahedron, its 20 native triangular faces, and the six antipodal vertex axes. It does **not** construct the requested full five-solid/190-cochain/H64/24-clock physical source. There are no fitted inputs, measured data, or historical ARF coefficients.

Let \(M_{xf}\) indicate whether face \(f\) lies in the six vertex representatives selected by history \(x\in\{0,1\}^6\). Set \(u=M\mathbf1_{20}\), \(w_x=(-1)^{|x|}u_x\), \(P=\frac1{15}\sum_{i<j}F_iF_j\), and \(Q_i=(I+F_i)/2\), where \(F_i\) flips history bit \(i\).

**Exact result:** \(u\) has histogram \(\{0:12,1:20,4:20,5:12\}\), \(\sum_xu_x=160\). \(Pw\) has histogram \(\{12/5:20,-13/5:20,-7/3:12,8/3:12\}\). Each \(Q_iPw\) has histogram \(\{1/30:40,-1/10:20,1/6:4\}\), sum zero and squared norm \(16/45\). The six readouts have joint column rank **6**.

The deterministic fail-on-error certificate constructs all native faces by exact squared edge distance 4 in \(\mathbb Q(\sqrt5)\), and checks all histograms, norms and rank. It establishes a nonzero conditional parity readout for an invariant face-uniform source, **not** a preferred physical axis, original H64 coupling, or Q96 Ward preservation. All physical gates stay open.

**Next executable question:** extract the native 190-cochain/H64/24-clock amplitude, compute its A5-invariant projection onto the face sector, and test the Q96 Ward generators without imposing face-uniform weights.
