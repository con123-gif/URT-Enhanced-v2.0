# Knot preservation under positive Cathedral transfer

**Date:** 2026-11-01  
**Status:** CLOSED / EXACT for the specified finite-dimensional linear construction; **physical identification OPEN**.  
**Scope:** This is an algebraic/topological result about a real three-dimensional realization of the Cathedral common/relative transfer. It is not a proof that the full Cathedral dynamics generates Lorenz knots, that physical periodic trajectories are preserved, or that a theory of nature is complete.

## Motivation: chaos can have a topological skeleton

Periodic orbits of a smooth three-dimensional flow may define knots; distinct, disjoint periodic orbits may have integer linking numbers. Lorenz-type template theory (Birman–Williams) motivates seeking topology among selected histories. It does **not** directly yield a Lorenz template from the Cathedral finite operator.

A knot type is preserved under an *ambient isotopy*: a continuous family of homeomorphisms of the three-dimensional ambient space starting at the identity. In a parameter-dependent dynamical system, periodic orbits may be created or destroyed at bifurcations. Invariance of knot type does not imply permanent existence of an orbit.

## Frozen rail and positive transfer

Take the finite Cathedral quantities

$$
\phi=\frac{1+\sqrt5}{2},\quad
d_\star=\frac{80\pi}{1053\phi},\quad
d_{\mathrm{cl}}=\frac3{20},\quad
\Delta=d_{\mathrm{cl}}-d_\star
=0.0024891898404204\ldots .
$$

Let $P_c,P_r$ be **orthogonal projectors** on a real Euclidean vector space, with

$$
P_c^2=P_c,\quad P_r^2=P_r,\quad
P_cP_r=P_rP_c=0,\quad P_c+P_r=I.
$$

Define the amplitude map and its positive-transfer square:

$$
B=P_c+\Delta P_r,\qquad
T=B^\dagger B=P_c+\Delta^2P_r.
$$

Idempotence and orthogonality give, for every integer $n\geq1$,

$$
\boxed{B^n=P_c+\Delta^nP_r},
\qquad
\boxed{T^n=P_c+\Delta^{2n}P_r}.
$$

**Strict positive gap:** Since $d_\star>0$, we have $\Delta<3/20<1$. For the lower bound, $\phi>8/5$ and $\pi<22/7$ give

$$
d_\star<
\frac{80(22/7)}{1053(8/5)}
=\frac{8800}{58968}<\frac3{20},
$$

so **$0<\Delta<1$**. In particular, $B$ is invertible.

## Theorem — knot preservation by Cathedral transfer

**Hypotheses.** Work in $\mathbb R^3$ with $P_c$ an orthogonal rank-one projector and $P_r=I_3-P_c$ the rank-two orthogonal complement. Let $K:S^1\hookrightarrow\mathbb R^3$ be a smooth embedded closed curve and let $n\geq1$ be finite.

**Claim.** The image $B^n(K)$ has the same knot type as $K$. If $K_1,K_2$ are disjoint oriented embedded closed curves, their integer linking number is unchanged under simultaneous application of $B^n$.

**Proof.** For $s\in[0,1]$ define

$$
F_s=P_c+a_sP_r,\qquad
a_s=(1-s)+s\Delta^n>0.
$$

In an orthonormal common/relative basis,

$$
F_s=\operatorname{diag}(1,a_s,a_s),\qquad
\det(F_s)=a_s^2>0.
$$

Thus every $F_s$ is an orientation-preserving linear diffeomorphism of the whole ambient space. Because $F_0=I_3$ and $F_1=B^n$, the family $(F_s)_{0\leq s\leq1}$ is an ambient isotopy. It takes $K$ continuously to $B^n(K)$ without singularities or self-intersections. The same ambient isotopy preserves disjointness and oriented linking number for a two-component link. QED.

The argument extends as an invertible linear isotopy to higher-dimensional Euclidean spaces, but the classical **three-dimensional** knot-type/linking statements here are explicitly restricted to the above $\mathbb R^3$ specialization.

## Conditional 24-step statement

**Only if** 24 successive applications of the *same* $B$ are prescribed in this same three-dimensional ambient realization,

$$
B^{24}=P_c+\Delta^{24}P_r,\qquad
\det(B^{24})=\Delta^{48}>0.
$$

With the frozen rail:

    Delta^24 = 3.20178727342021e-63  (relative amplitude)
    Delta^48 = 1.02514417442356e-125 (amplitude squared; also determinant for ranks 1+2)

These are strong suppressions, **not exact annihilation at finite transfer depth**. The determinant formula is specific to the rank-two relative subspace: more generally $\det(B^n)=\Delta^{n\,\operatorname{rank}(P_r)}$.

The cyclic track structure $\mathbb Z/24\mathbb Z$ does **not** on its own imply 24 iterations of the same map. That identification must be separately derived. Nor does $B$ automatically map a periodic orbit of a given vector field to another orbit of the **same** vector field; the theorem is about embedded geometric curves under a linear ambient diffeomorphism.

## Where this sits in the *whole* Cathedral

The full construction also contains all five Platonic Hodge complexes (190-dimensional total), the $H_{13}\oplus H_{51}$ 64-history carrier, 24-fold ordering, $D_6\rightarrow H_3$, hidden sectors, and higher-dimensional hexagonal/hypercube and Golay/Leech structures. **They are not reduced to the three-dimensional model used in the theorem.** No coupling to these additional structures has been inferred from the knot-preservation proof.

**Open gate:** derive from the full bounded-chaos history process an actual flow, return map, or embedded periodic-trajectory family with a braid/template description. Then compute knot and linking invariants and check compatibility with the actual operator and symmetries. This is a falsifiable programme, not a completed inference.

## Executable regression check

Run from repository root:

    python -m pytest tests/test_cathedral_knot_transfer_2026_11_01.py

The accompanying tests check frozen constants, projector identities, matrix powers, positivity of the displayed isotopy, and the 24-step numerical factors. Topological invariance itself is the theorem proved above, **not** a conclusion from floating-point test output.

**Provenance:** Newton's Cathedral bounded-chaos / Lorenz-knot discussion, 2026-11-01. The result is a specialization of standard ambient-isotopy theory; it is **not claimed** as a novel theorem of knot theory or experimental evidence of physical unification.
