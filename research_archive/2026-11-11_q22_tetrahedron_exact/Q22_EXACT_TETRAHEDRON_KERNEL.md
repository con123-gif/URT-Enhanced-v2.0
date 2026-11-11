# Q22 — exact native tetrahedral Hodge–Dirac sea-energy Hessian

**Result:** THEOREM — **CLOSED INTERNALLY / PHYSICAL IDENTIFICATION PENDING**. This establishes the exact tetrahedral instance of the archived five-solid numerical spectrum, not a physical photon coupling or a theorem for the other four solids.

**Original operator:** The tetrahedral vertex–edge–face cochain from `research_archive/2026-11-11_icosahedral_induced_photon/HODGE_DIRAC_FLUX_VACUUM_2026_11_11.py`, with the same incidence biadjacency and sea-energy functional as `HODGE_DIRAC_PHOTON_KERNEL_2026_11_11.py`. The original source used a finite-difference Hessian; this certificate constructs its exact analytic Hessian from integer incidences. No fitted values or historical ARFs enter.

Let the tetrahedron have vertices 0,1,2,3, oriented edges `(i,j)` for `i<j`, and oriented faces `(1,2,3),(0,3,2),(0,1,3),(0,2,1)` (boundary of the positively oriented 3-simplex). Set `B=[d0,d1^T]` (6×8), where `d1 d0=0`. The certificate checks exactly that `B B^T=4I_6`, that there are 24 nonzero incidence links, and that the bipartite incidence graph is connected.

Put an independent phase `theta_(e,c)` on every nonzero entry of `B` and define
`F(theta)=-Tr sqrt(B(theta) B(theta)^*)`.
At the signed cochain point, `X=B B^*=4I_6` and `Tr X(theta)=24` for every phase assignment. Thus the first-variation contribution to the Hessian from `Tr X` vanishes identically. For a link `a=(e,c)`, let `X_a=i M_a` with
`M_a[i,j]=B[e,c](delta_(i,e) B[j,c]-B[i,c] delta_(j,e))`.
The scalar-matrix Taylor expansion
`-Tr sqrt(4I+Y)=-12-(1/4)Tr Y+(1/64)Tr Y^2+O(Y^3)`
then gives the **exact analytic phase Hessian**
`H_ab=(1/32)Tr(X_a X_b)=(1/16)(W^T W)_ab`,
where the integer matrix `W` has rows indexed by `0<=i<j<6` and columns by the 24 links, with `W[(i,j),a]=M_a[i,j]`.

Set `A=W W^T` (15×15). Exact integer multiplication in the executable certificate establishes
`A(A-2I)(A-4I)(A-6I)=0`,
`Tr A=48`, `Tr A^2=240`, `Tr A^3=1296`.
Because `A` is real symmetric, its eigenvalues belong to `{0,2,4,6}`. The three trace equations force multiplicities `2(3),4(3),6(5)`, leaving `0(4)`. Nonzero eigenvalues of `W^T W` coincide with those of `W W^T`; hence

**`spec(H)=0(13), (1/8)(3), (1/4)(3), (3/8)(5)`.**

The certificate independently constructs the 24×14 node-phase gauge-incidence matrix `G`, checks `WG=0`, and checks connectivity, so `rank G=13`. All 13 Hessian zero modes are therefore gauge directions, and the physical quotient has dimension 11. Its exact traces are
`Tr H_phys=3` and `Tr(H_phys^-1)=3·8+3·4+5·(8/3)=148/3`.

**Execution:** GPT local container, Python 3.11 / standard library only, `python research_archive/2026-11-11_q22_tetrahedron_exact/q22_exact_tetrahedron_kernel.py`, exit 0, elapsed 1.39 s. SHA256 of the executed source: `c7549845507bcc989b6f0edf92b744115f61ef833ab9f216004281a2ab72e0cc`. Independent non-certifying numerical directional second derivative also agreed with the exact quadratic form; the theorem relies only on integer identities.

**Scope:** This proves the tetrahedral kernel for the native Hodge–Dirac sea-energy operator at the signed cochain point. It does not prove global flux-vacuum selection, photon normalization, the other four Platonic kernels, or any physical ARF.

**Next executable question:** Q24 — does the native Q6 fifth cumulant `K5^2/r2^5` distinguish the Q20 non-parity dictionary collision?
