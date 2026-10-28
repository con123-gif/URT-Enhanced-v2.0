# Newton's Cathedral × Bhattacharjee–Bhattacharya–Lockwood: constructive SU(2) entropy action and averaged-cube theorem

**Date:** 28 October 2026  
**Status:** Exact *conditional construction* of non-Abelian Wilson SU(2) plaquette action from Cathedral's retained 4+4 state, plus an independent *complete uniform averaged-cube proof for a massive Gaussian reference model*. **Neither statement proves the continuum SU(2) Yang–Mills mass gap.** No frozen Cathedral quantity is modified and no experimental values enter.

## Source and retained inputs

- User-supplied 37-page *Mass Gap of Four-Dimensional Lattice Yang–Mills Theory for Every Compact Simple Gauge Group* (Bhattacharjee, Bhattacharya and James Montgomery Lockwood, 27 Oct 2026), especially Definition 42 and Theorem 45 (page 20), Theorem 51 and Corollary 52 (pages 23–24), and the explicit SU(2) strong-coupling ranges (pages 1–4).
- Cathedral canonical repository `con123-gif/URT-Enhanced-v2.0`, branch `newtons-cathedral`, `docs/CLOSURE_LEDGER.md`, v121 four-sheet differential calculus, `docs/CATHEDRAL_MULTIPLATONIC_INTERACTING_FIELD_ACTION_2026-10-28.md` and `docs/CATHEDRAL_CONSTRUCTIVE_TRANSFER_THEOREM_2026-10-28.md`.
- The **whole Cathedral** includes all five Platonic structures, 50+90+50 cochains, the four-sheet differential calculus, 64-history carrier, 4+4 hidden sectors, D6/H3 and further geometry. The construction below is an SU(2) *interface* to it, not a reduction of the entire theory to one icosahedron.

Frozen exact values:

\[
\varphi=(1+\sqrt5)/2,\quad
\Delta=\frac3{20}-\frac{80\pi}{1053\varphi}>0,\quad
\eta_\Delta=-\log\Delta,
\]

\[
\rho_\star=\operatorname{diag}(pI_4,rI_4),\quad
p=\frac1{4(1+\Delta^2)},\quad r=\frac{\Delta^2}{4(1+\Delta^2)}.
\]

## Theorem A — an exact Wilson SU(2) action from Cathedral relative entropy, *after a balanced-bridge premise*

**New, explicit premise (not a theorem of the original URT dynamics):** Identify the two hidden real 4-dimensional carriers as quaternionic copies and use an exchange-symmetric balanced 4+4 bridge to represent unit-quaternion holonomy. This is compatible with the quaternion/binary-icosahedral Cathedral branch; it is **not uniquely forced** by the existing source-loaded \(T_\star\). Use one dimensionless relative-entropy cost per elementary plaquette to define a lattice Gibbs action; this weighting is another dynamical premise.

For \(q\in SU(2)=\{q\in\mathbb H:|q|=1\}\), let \(L(q)\in SO(4)\) denote left quaternion multiplication. In the two hidden quartets, set

\[
S=\frac1{\sqrt2}\begin{pmatrix}I_4&I_4\\-I_4&I_4\end{pmatrix},\quad
R(q)=S\begin{pmatrix}L(q)&0\\0&I_4\end{pmatrix}S^T\in SO(8).
\]

This is a genuine **group representation**: \(R(q_1q_2)=R(q_1)R(q_2)\). The mixed block is

\[
R_{35}(q)=\tfrac12(I_4-L(q)),\qquad
\operatorname{tr}[R_{35}R_{35}^T]=2(1-\operatorname{Re}q).
\]

Define the plaquette cost using the standard quantum relative entropy:

\[
\mathscr D(q)=D(\rho_\star\Vert R(q)\rho_\star R(q)^T)
=\operatorname{tr}\!\left[\rho_\star(\log\rho_\star-R(q)(\log\rho_\star)R(q)^T)\right].
\]

**Exact identity:**

\[
\begin{aligned}
\mathscr D(q)&=(p-r)\log(p/r)\operatorname{tr}[R_{35}R_{35}^T]\\
&=\boxed{\beta_{\rm ent}(1-\operatorname{Re}q)},\\
\beta_{\rm ent}&=\boxed{\eta_\Delta\frac{1-\Delta^2}{1+\Delta^2}}
=5.995723686480836\ldots
\end{aligned}
\]

For a Wilson lattice gauge configuration \(U_e\in SU(2)\) and plaquette holonomy \(Q_p=\prod_{e\in\partial p} U_e^{\pm1}\), define

\[
S_{\rm ent}[U]=\sum_p\mathscr D(Q_p)
=\beta_{\rm ent}\sum_p\left[1-\tfrac12\operatorname{ReTr} Q_p\right].
\]

This is **exactly the standard gauge-invariant Wilson SU(2) plaquette action** with conventional inverse coupling \(\beta_W=\beta_{\rm ent}\) (constant additive term irrelevant). For any site gauge transformation, \(Q_p\mapsto g_xQ_pg_x^{-1}\), and quaternion scalar part is unchanged. This supplies a mathematically concrete *non-Abelian, history-state-dependent* gauge-interface candidate without choosing a measured coupling. It does not dynamically couple the old scalar history field \(y\) to the \(a\)-sector of the separate 2026-10-28 action; it defines a **new** compact-link action whose coefficient depends on the frozen master state.

**Why the continuum does not follow:** James's verified fixed-spacing SU(2) theorem runs through \(\beta_W\le 0.345\), while \(\beta_{\rm ent}\approx5.9957\); it is outside that interval. Moreover the bare coefficient stays finite because the frozen \(\Delta\) stays fixed, whereas the standard asymptotically free continuum tuning for Wilson SU(2) requires \(\beta_W(a)\to\infty\). No Cathedral derivation of such a scale dependence is yet available. One must not quietly insert a depth-dependent multiplicative factor or claim \(\Delta^2\) is James's contraction coefficient.

**Important separation:** This is not the physical gauge symmetry derived uniquely from four-sheet/KO-6 dynamics; the choice of balanced mixed representation and relative-entropy Gibbs weighting still require derivation from canonical source-loaded URT if claimed fundamental.

## Theorem B — a genuine all-scales averaged-cube bound for the *distinct massive Gaussian cochain reference model*

This theorem directly resolves the *mathematical scale problem for the Gaussian baseline*, not for Wilson Yang–Mills. It demonstrates that a weak one-site contraction tending to 1 need not prevent a uniform physical-size cube contraction. It uses exactly the geometric lower eigenvalue already present in the Cathedral archive,

\[
\lambda=3-\sqrt5>0,\qquad \mu=\sqrt\lambda=0.8740320488976421\ldots
\]

**Model.** On \(\mathbb Z^4\) let scalar \(z_x\in\mathbb R\) have finite-volume Gaussian specification from

\[
S_h(z)=\tfrac12\sum_{\langle x,y\rangle}(z_x-z_y)^2
+\tfrac{(\mu h)^2}{2}\sum_x z_x^2.
\]

The coefficient \(\mu\) is drawn from the existing Cathedral finite cochain spectrum but inserting it as the physical scalar mass in this reference action is a **model choice**. This Gaussian model is not the actual compact SU(2) Wilson theory, and the paper's forest-gauge *links* are replaced here by Gaussian *sites*.

Take even \(n=2m\), \(V=[0,n)^4\), the \(16\) parity classes \(c\in (\mathbb Z/2)^4\), and set

\[
C_{V,j}=\sup_{z,z'\text{ differ only at }j}
\frac{W_1(\gamma_V(\cdot|z),\gamma_V(\cdot|z'))}{|z_j-z_j'|},\quad
K_c=\sum_{j\in c\setminus V}C_{V,j},\quad N_n=m^4.
\]

Use the \(\ell^1\) metric on the vector of interior Gaussian spins. These coefficients are exactly defined even though Gaussian spins have unbounded amplitude.

**Theorem:** With \(\kappa_h=2\operatorname{arsinh}(\mu h/2)\),

\[
\boxed{\frac{K_c}{N_n}\le\frac{8e^{-\kappa_h/2}}{\mu nh}\le\frac{8}{\mu nh}\quad\text{for every parity class }c.}
\]

In particular choosing **any** physical cube side \(nh=\ell\ge16/\mu\) produces

\[
\boxed{K_c\le\tfrac12 N_n\text{ for all }c,\text{ all even }n\ge2,\text{ and all }h=\ell/n.}
\]

Thus this reference system satisfies a Dobrushin–Shlosman-style averaged-cube condition uniformly as \(h\to0\), with non-fitted geometric mass \(\mu\). If one transports the abstract mechanism of James's Theorem 45 to this Gaussian specification, its lower physical-gap estimate is \(\log2/(2\ell)=\mu\log2/32\approx0.0189322766\) at \(\ell=16/\mu\) (not the sharp Gaussian gap).

**Proof.** The inside conditional Gaussian precision matrix is

\[
M_V=(8+\mu^2 h^2)I-A_V,
\]

where \(A_V\) is the nearest-neighbour adjacency matrix with zero Dirichlet boundary. Its inverse is entrywise nonnegative because it is the convergent geometric series

\[
M_V^{-1}=\frac1{8+\mu^2h^2}\sum_{k\ge0}\left(\frac{A_V}{8+\mu^2h^2}\right)^k.
\]

All boundary-conditioned Gaussians share the same covariance. Translation of their means attains their \(W_1\) distance for the \(\ell^1\) cost. For an exterior site \(j\) adjacent to exactly one site \(i(j)\in V\), the exact coefficient is

\[
C_{V,j}={\bf1}^T M_V^{-1}e_{i(j)}=u_{i(j)},\quad u=M_V^{-1}{\bf1}.
\]

There are no other contributing exterior sites. \(u\) is the unique nonnegative solution of \(M_Vu={\bf1}\). For any coordinate direction and either face of the cube, compare \(u\) by the positive inverse above with the infinite half-space solution of the one-dimensional difference equation

\[
(2+\mu^2h^2)f(t)-f(t-1)-f(t+1)=1,\quad f(-1)=0.
\]

A nonnegative supersolution is

\[
f(t)=\frac{1-e^{-\kappa_h(t+1)}}{\mu^2h^2},\quad
\cosh\kappa_h=1+\mu^2h^2/2.
\]

It remains a supersolution after restricting to the finite cube (the missing right-hand and transverse neighbours only increase \(M_V f\)). Therefore at **every cube face**

\[
u_i\le f(0)=\frac1{e^{\kappa_h}-1}
=\frac{e^{-\kappa_h/2}}{\mu h}.
\]

For each outside-site parity class \(c\) there are exactly \(4m^3\) boundary-crossing edges: along each of four axes only one of the two outward-facing hyperplanes has the required exterior parity, with \(m^3\) positions of the other three parities. Hence

\[
K_c\le4m^3f(0),\quad K_c/N_n\le4f(0)/m
=8e^{-\kappa_h/2}/(\mu nh),
\]

which proves the theorem. The limit \(h\to0\) is controlled by the *block size* \(nh\), not the vanishing one-site gap. QED.

## Executed independent numerical tests

`cathedral_yangmills_entropy_and_cube_2026_10_28.py` checks 250 random SU(2) holonomies and group products, 20 random conjugations, the exact relative-entropy identity, representation orthogonality, and seven independently solved four-dimensional Gaussian Dirichlet cubes. The complete machine-readable output is `cathedral_yangmills_entropy_and_cube_2026_10_28.json`.

- SU(2) homomorphism max Frobenius residual: `1.32e-15`.
- Entropy identity max absolute residual: `7.11e-15`.
- Fixed physical cube side \(\ell=16/\mu=18.3059648901659\), actual \(\max_cK_c/N_n\) for \(n=2,4,6,8,10,12,16\): `0.058824, 0.108627, 0.149020, 0.181286, 0.207077, 0.227875, 0.258891`; all below the analytic \(\alpha=1/2\) bound. The analytic proof holds for **all** even n, not just the tested examples.

## Exact remaining target, without relabelling the result as a Clay solution

- Replace the Gaussian site conditionals with the **actual Wilson SU(2)** forest-fixed compact link conditionals derived from Theorem A's entropy action. Prove \(D(n(a),\alpha)\) uniformly as \(\beta_W(a)\to\infty\); do not substitute the Gaussian K's. James's Theorem 51 and Proposition 53 impose substantial constraints here.
- Derive, rather than assume, a multi-scale \(\beta_W(a)\) running and the balanced bridge from the original full URT source-loaded \(T_\star\), 64 histories and the four-sheet/KO-6 differential calculus. A constant \(\beta_{\rm ent}\) does not provide a Yang–Mills continuum limit.
- Independently prove a nontrivial Osterwalder–Schrader continuum limit, with appropriate reflection and Euclidean invariance.

**Latest finding:** An exact, gauge-invariant SU(2) Wilson action can be generated by the retained Cathedral 4+4 entropy spectrum after an explicit balanced quaternionic coupling premise; and an exact physical-size cube contraction can be proved for the associated *Gaussian comparison problem*. Their intersection is a coherent research bridge, **not yet a theorem that Cathedral satisfies the non-Abelian continuum contraction**.