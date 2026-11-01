# Knot preservation under positive Cathedral transfer

**Date:** 2026-11-01  
**Status:** CLOSED / EXACT for the stated finite-dimensional linear construction; **physical identification OPEN**.  
**Scope:** This is an algebraic/topological result about a particular real three-dimensional realization of the Cathedral common/relative transfer. It is not a proof that the full Cathedral dynamics generates Lorenz knots, that periodic physical trajectories are preserved, or that a theory of nature is complete.

## Motivation: chaos can have topological order

Periodic orbits of a smooth three-dimensional flow may define knots, and distinct disjoint periodic orbits may have integer linking numbers. Template theory for Lorenz-type dynamics (Birman–Williams) is motivation for seeking topology among selected histories. It does **not** directly yield a Lorenz template from the Cathedral finite operator.

A knot type is preserved under an *ambient isotopy*: a continuous family of homeomorphisms of the ambient three-dimensional space starting at the identity. In a changing dynamical system, periodic orbits can be born or lost at bifurcations; one must not infer permanent existence of an individual orbit from topological invariance alone.

## Frozen rail and transfer

Let

```text
phi   = (1 + sqrt(5))/2
dstar = 80*pi/(1053*phi)
dcl   = 3/20
Delta = dcl - dstar = 0.0024891898404204...  (strictly between 0 and 1)
```

On a *real* Euclidean vector space with mutually orthogonal projectors
(P_c,P_r) satisfying

[
P_c^2=P_c,qquad P_r^2=P_r,qquad P_cP_r=P_rP_c=0,qquad P_c+P_r=I,
]

define the amplitude transfer

[
B=P_c+Delta P_r.
]

It is self-adjoint and positive definite when both projectors are orthogonal. Its positive-transfer square is

[
T=B^dagger B=P_c+Delta^2P_r.
]

For any positive integer (n), idempotence and orthogonality give

[
oxed{B^n=P_c+Delta^n P_r},qquad
oxed{T^n=P_c+Delta^{2n}P_r}.
]

**Proof that (0<Delta<1).** Clearly (d_star>0), hence (Delta<3/20<1). Also (phi>8/5) and (pi<22/7) imply
(d_star<80(22/7)/(1053(8/5))=8800/58968<3/20), hence (Delta>0).

## Theorem: ambient-isotopy preservation of knots

**Hypotheses.** Work in (mathbb R^3). Let (P_c) be an *orthogonal rank-one* projector, (P_r=I_3-P_c) have rank two, and (0<Delta<1). Let (K:S^1hookrightarrowmathbb R^3) be any smooth embedded closed curve.

**Claim.** For every finite positive integer (n), (B^n(K)) has the same knot type as (K). If (K_1,K_2) are two disjoint oriented closed curves, their mutual integer linking number is unchanged under simultaneous application of (B^n).

**Proof.** Consider

[
F_s=P_c+igl((1-s)+sDelta^nigr)P_r,qquad 0le sle1.
]

For each (s), write (a_s=(1-s)+sDelta^n>0). In an orthonormal common/relative basis, (F_s=operatorname{diag}(1,a_s,a_s)), so

[
det F_s=a_s^2>0.
]

Every (F_s) is an orientation-preserving linear diffeomorphism of the entire ambient space, (F_0=I_3), and (F_1=B^n). Thus ((F_s)) is an ambient isotopy taking (K) to (B^n(K)), proving knot-type invariance. It simultaneously takes a disjoint two-component link to another disjoint link and preserves orientations, hence preserves its integer linking number. QED.

The argument generalizes to finite-dimensional Euclidean spaces with positive relative eigenvalues, but classical *three-dimensional* knot classification and linking-number conclusions are asserted here only for the explicitly stated (mathbb R^3) realization.

## The conditional 24-composition result

Assuming **24 successive applications of the same amplitude map** (B) to the same ambient three-dimensional embedding,

[
B^{24}=P_c+Delta^{24}P_r,qquad
det(B^{24})=Delta^{48}>0.
]

Numerically, using the frozen rail,

```text
Delta^24 = 3.20178727342021e-63
Delta^48 = 1.02514417442356e-125
```

The first number is the relative *amplitude* factor. The second is both its square (relative weight for this rank-one/rank-two model) and the determinant of (B^{24}). These meanings must not be confused in a different-rank model. The determinant is tiny but strictly nonzero: **there is no exact annihilation at any finite n.**

A 24-track *ordering* (mathbb Z/24mathbb Z) does not itself prove 24 iterations of an identical map. That physical/model identification is a separate open gate. Also, (B) does not by itself send a periodic orbit of a specified dynamical vector field to a periodic orbit of *that same* vector field; this theorem concerns the geometric image of embedded curves.

## Connections, not proven consequences

The full Cathedral includes five Platonic Hodge complexes (190 dimensions), the (H_{13}oplus H_{51}) history carrier (64 dimensions), 24-fold ordering, (D_6	o H_3), hidden sectors, and higher-dimensional hexagonal/hypercube and Golay/Leech structures. None of these structures is being collapsed into the single three-dimensional transfer specialization used in this theorem.

The next **open** mathematical gate is to construct from the full bounded-chaos history dynamics (not from arbitrarily chosen diagrams) explicit embedded periodic trajectories and a topological template/braid map, then calculate knot/link invariants and check compatibility with the actual transfer and symmetry action. Failure to find such a map would limit or refute this proposed connection, without invalidating the linear isotopy theorem above.

## Reproduction

Run:

```bash
python -m pytest tests/test_cathedral_knot_transfer_2026_11_01.py
```

The executable tests check the frozen gap, exact projector-power identity in the diagonal realization, positivity along the displayed isotopy, and the 24-composition numerical invariants. Topological invariance itself follows from the rigorous invertible ambient-isotopy proof, not from floating-point testing.

**Provenance:** Research discussion of Lorenz knots and bounded chaos, 2026-11-01. The theorem here is a direct specialization of standard ambient-isotopy principles, not claimed to be novel general knot theory.
