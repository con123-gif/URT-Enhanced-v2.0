# Newton's Cathedral / URT — exact A5 dark-orbit coupling in the native 64-history source

**10 November 2026. New, independently executed source-level theorem; no physical ARF derived.**

## Scope and inputs

Use the *unchanged* original all-five-Platonic 190-cochain source pullback and its exact icosahedral 20-face incidence, rank-four hidden projectors \(P_3,P_5\), six signed antipodal axes and 64 histories. The native source is charge \(+2\) under the existing 24-clock diagonal \(U(1)\). Its **neutral** squared norms are
\[
n_3(h)=2\,O(h)^T P_3O(h),\qquad
n_5(h)=E(h)^T P_5E(h),
\]
with \(E,O\) and all normalizations defined and independently certified in the existing \`URT_A5_NEUTRAL_SOURCE_EXACT_CUMULANTS_2026_11_10.py\`. The original primitive chronology, not its A5 Reynolds average, is
\[
Q_{h,\,2h\bmod64}=Q_{h,\,(2h+1)\bmod64}=\tfrac12,\quad Q^6=J_{64}/64.
\]
The geometric-history identification remains a **model hypothesis**. The full five-solid action, 24-clock Wilson/Schur contacts, charged \(H_{13}\oplus H_{51}\) matter action, and prior exact A5-symmetric third-cumulant theorem/code are **not modified**. No historical ARF coefficients or measured data enter this calculation.

## Theorem 1 — the native neutral source has three joint values on four A5 orbits

Construct the proper icosahedral rotation group directly as the 60 orientation-preserving automorphisms of the 12-vertex/20-face incidence, and let it act on the six signed antipodal axes. Its action on 64 histories has exactly four orbits of sizes
\[
\boxed{12,\quad12,\quad20,\quad20.}
\]
The two hidden source norms are constant on each orbit. Their **joint** distribution, in the original uniform 64-history measure, is exactly

| multiplicity | \(n_5\) | \(n_3\) |
|---:|---|---|
| 24 (two 12-orbits) | \(0\) | \(0\) |
| 20 | \((56-24\sqrt5)/5\) | \(288/25\) |
| 20 | \((56+24\sqrt5)/5\) | \((2592+1152\sqrt5)/25\) |

Consequently, for **each** of the 64 histories, the pointwise identity
\[
\boxed{n_3=(5+2\sqrt5)\left(\frac{66}{25}n_5-\frac3{40}n_5^2\right)}
\]
holds exactly. This is an algebraic relation between *source norms*, not a mass or coupling law. It is nonlinear, so it does **not** imply rank-one linear covariance.

## Theorem 2 — a unique hidden-norm-invisible A5-invariant history contrast

The A5-invariant real functions on the 64-history set have dimension four, one per orbit. Define \(d(h)=+1\) on the first 12-orbit (the orbit containing history index 1), \(d(h)=-1\) on the second 12-orbit (containing index 12), and \(d(h)=0\) on both 20-orbits. Exchanging the two 12-orbits reverses the sign of \(d\), with no change to the claims.

Let \(g_a=n_a-\mathbb E[n_a]\), \(a=3,5\). The four functions
\[
\boxed{1,\quad g_3,\quad g_5,\quad d}
\]
form a basis of all A5-invariant history functions. The dark contrast is instantaneously orthogonal to both neutral source norms:
\[
\mathbb E[d]=0,\quad\mathbb E[d\,g_3]=\mathbb E[d\,g_5]=0.
\]
Indeed **every** function of the two neutral norms is constant on both 12-orbits and cannot distinguish them. Thus two source norms alone cannot resolve the full invariant history quotient.

## Theorem 3 — primitive URT chronology dynamically couples the dark contrast

Despite the equal-time orthogonality, the original unaveraged \(Q\) creates nonzero lagged correlations. Define
\[
C_{ab}(k)=\frac1{64}\sum_{h=0}^{63}a(h)(Q^k b)(h),\qquad
K_{ab}=C_{ab}(0)+\sum_{k=1}^{5}\big(C_{ab}(k)+C_{ba}(k)\big).
\]
All terms at \(k\ge6\) vanish exactly for centered observables because \(Q^6=J/64\).

For \(k=0,\ldots,5\), the two lag sequences \(C_{d,g_a}(k)=C_{g_a,d}(k)\) are
\[
C_{d,g_3}=\left(0,-\frac{36+18\sqrt5}{25},0,\frac{18+9\sqrt5}{25},-\frac{18+9\sqrt5}{25},0\right),
\]
\[
C_{d,g_5}=\left(0,-\frac{3\sqrt5}{20},0,\frac{3\sqrt5}{40},-\frac{3\sqrt5}{40},0\right).
\]
The dark autocorrelation is
\[
C_{dd}=(3/8,-1/32,0,1/64,-1/64,0).
\]
Therefore
\[
K_{dd}=\frac5{16},\quad
K_{d3}=-\frac{72+36\sqrt5}{25},\quad
K_{d5}=-\frac{3\sqrt5}{10}.
\]

Combining with the **previously proved** neutral source block gives the complete three-channel Green–Kubo matrix in the order \((d,g_3,g_5)\):
\[
\boxed{
K=\begin{pmatrix}
5/16&-(72+36\sqrt5)/25&-3\sqrt5/10\\
-(72+36\sqrt5)/25&(2554416+1135296\sqrt5)/625&(57780+23112\sqrt5)/125\\
-3\sqrt5/10&(57780+23112\sqrt5)/125&471/5
\end{pmatrix}.
}
\]
Its determinant is the exact strictly positive algebraic number
\[
\boxed{\det K=\frac{384912+171072\sqrt5}{3125}\approx245.5809987349901>0.}
\]
All leading principal minors are positive, so the three stationary integrated responses are linearly independent. This does **not** make \(d\) a new physical particle or an additional hidden quartet; it is a history-space observable.

## Independent execution and limitations

The new executable \`URT_A5_DARK_ORBIT_COUPLING_2026_11_10.py\` reads the original exact \(Q(\sqrt5)\) source code; reconstructs all 60 proper icosahedral rotations from face incidence; checks four orbit sizes, all 64 pointwise polynomial identities, the four-dimensional invariant basis, exact lag matrices, positivity and the determinant. It then independently enumerates all ordered time pairs for horizons \(T=12\) and \(T=24\). Since the finite-horizon covariance is \(K_T=K-C/T\) for \(T\ge6\), the identity \(2K_{24}-K_{12}=K\) is checked **entrywise in exact arithmetic**. All tests passed. Requires \`numpy scipy sympy networkx\`; run in \`new_gate/\` with \`OPENBLAS_NUM_THREADS=1 python URT_A5_DARK_ORBIT_COUPLING_2026_11_10.py\`.

**Proved:** four A5 history orbits; three exact joint hidden-norm levels; exact polynomial relation; unique (up to sign/scale) source-norm-invisible A5-invariant history contrast; nonzero native temporal cross-coupling; positive-definite three-channel Green–Kubo response.

**Not proved:** that the dark history contrast has a gauge-covariant local source vertex in the full 190-cochain action; that the 24-clock dynamically selects this contrast; a unique charge assignment or physical pole map on \(H_{13}\oplus H_{51}\); any of the four historical physical ARFs. The prior A5-symmetric *charged* third cumulant is still not an undressed gauge-invariant local observable.

**Precise next theorem:** determine whether the original \(190\)-cochain/64-history/24-clock action induces a **canonical A5-equivariant, Ward-complete source-to-charged-matter vertex** that either couples to, or provably annihilates, the \(d\) history channel. Only then compute gauge-invariant charged-fermion and transverse-gauge pole positions and residues. Do not identify source cumulants or invariant-history counts with the four physical ARFs without that intertwiner.
