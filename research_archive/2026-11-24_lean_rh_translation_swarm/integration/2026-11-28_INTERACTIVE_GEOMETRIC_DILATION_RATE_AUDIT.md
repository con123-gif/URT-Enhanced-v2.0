# Geometric projection convergence audit — obstruction to exact dilation bootstrap

28 November 2026. Continuation of 9977ffc7a4fd3d11070b95c8737a23900b00d6f7 (retrieved exact source). Attempted to turn a finite improved witness into an all-scale contracting iteration. Two concrete restrictions are established: an elementary exact admissibility obstruction, and a quantitative convergence-rate restriction from the known Burnol theorem. No new vanishing bound or RH proof, no worker or schedule changes, no Lean execution. No new numerical optimization in this turn; the previous record's upper bounds are only rescaled.

## 1. Integer dilation is invariant on the linear subspace, not on the affine residual space

In t=1/x coordinates set b_n(t)={t/n}-{t}/n, chi(t)=1_{t>=1}, extended to all t>0 (b_n vanishes for t<1). Let V_fin be the finite linear span of b_n and define T_k f(t)=f(t/k) for positive integers k. The norm is integral_0^infty |f(t)|^2 dt/t^2, and ||T_k||=k^(-1/2) by change of variables. Direct fractional-part algebra gives
 T_k b_n=b_(kn)-b_k/n.
Hence V_fin is invariant, but the residual space is chi+V_fin, not V_fin.

Claim: for any finite T=sum_{k=1}^K a_k T_k, if T maps even one admissible residual r=chi+v to another admissible finite residual, then a_1=1 and a_k=0 for k>=2. Indeed T v belongs to V_fin, so T chi-chi must belong to V_fin. On t in [j,j+1), j>=1, each finite b_n is (j mod n)/n. Thus every v in V_fin is periodic in j and vanishes at every common multiple of the finite denominators. But T chi-chi on these cells is sum_{k<=j} a_k-1, which is eventually constant. An eventually constant periodic sequence must be constant everywhere, and the values at common multiples force this constant to be zero. Hence each cumulative sum equals 1 and the claimed coefficients follow. This argument works with complex coefficients as well.

This is an exact obstruction to a naive finite multiplicative dilation bootstrap of the residual: contractive norms of T_k do not give an admissible smaller residual. Dilation can act on the corrections v and may aid optimization, but preserving or restoring the affine target is essential. The claim does not rule out nonlinear updates, projections, an approximation in the closed span, or new arithmetic constructions. It also does not give a lower bound for the limiting residual on its own.

## 2. Known analytic lower bound sets the right convergence scale

For a finite witness r(x)=1+sum_{n<=N}c_n({1/(nx)}-{1/x}/n), its Mellin transform in 0<Re s<1 is (1-zeta(s)P(s))/s with P(s)=sum c_n(n^(-s)-1/n). By Mellin Plancherel, the full squared norm equals the Dirichlet-polynomial residual integral
 W(r)=(1/(2pi)) integral_R |1-zeta(1/2+it)P(1/2+it)|^2/(1/4+t^2) dt.
P has length at most N and P(1)=0. Thus W(r)>=d_N^2 for the unrestricted Dirichlet-polynomial infimum. Burnol's published lower bound is
 liminf_(N->infinity) (log N)d_N^2 >= sum_{Re rho=1/2} m(rho)^2/|rho|^2 >0.
The strictly positive contribution uses known critical-line zeros, independent of RH. Primary source Jean-Francois Burnol, Advances in Mathematics 170 (2002), 56–70, DOI 10.1006/aima.2001.2066, https://arxiv.org/abs/math/0103058 . Exact theorem stated also in Maier–Rassias, Canadian Mathematical Bulletin 61 (2018), 622–627, DOI 10.4153/CMB-2017-070-3, and Bettin–Conrey–Farmer, https://arxiv.org/abs/1211.5191 . The latter provides a matching asymptotic only under additional hypotheses; do not adopt its assumptions in an independent RH argument.

Consequently for some fixed c>0, all sufficiently large N and all admissible witnesses W(r)>=c/log N. If a proposed bootstrap has W(r_j)<=C theta^j for fixed 0<theta<1, then it must have log N_j>=(c/C) theta^(-j) eventually. In particular N_j=O(phi^j) or any fixed-factor support expansion cannot produce geometric residual convergence. A geometric improvement in j would require at least doubly exponential support growth in j. This is an unconditional restriction, even if RH is true. It excludes an overly ambitious contraction target but does not exclude slower convergence to zero.

## 3. Rescale the prior finite upper certificates

The previous note's reported rational upper bounds are not new executions in this turn. Multiplying their decimal reports by log N in JavaScript gives:
256, 0.008288231119005115, 0.04595971225574077
1024, 0.006644461033056947, 0.04605589431403844
2048, 0.006262066141450511, 0.04774586839468949
The conjectured unrestricted optimum constant under RH and simple zeros is 2+EulerGamma-log(4pi), about 0.0461914. The last normalized upper bound is near that number, but this is not a lower bound on the finite optimum, an asymptotic result, or evidence that RH is nearly proved. The constrained witnesses here are valid for the unrestricted infimum, but their infimum is not identified with it at each N. The previous finite certificate comparisons remain within their original scope.

## 4. Next decision

A defensible target is an independently proved upper bound tending to zero at a logarithmic or slower rate, not a fixed-factor contraction per fixed multiplicative support step. Neither invariant dilation nor finite residual descent has supplied that bound. No independent proof found in this turn. Avoid claiming a numerical speedup or a reformulation constitutes a closed RH obligation. The main compact reconstruction remains separate.