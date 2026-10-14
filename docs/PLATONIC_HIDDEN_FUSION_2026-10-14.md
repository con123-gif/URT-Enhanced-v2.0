# Platonic hidden-sector fusion (2026-10-14)

Numerically verified finite-geometry continuation of Newton's Cathedral, preserving prior URT, 13-site and dodecahedral results. This document is a mathematical audit, not evidence of a new force or particle.

## Incidence kernels

For face-vertex incidence B, the dimensions (ker B, ker B^T) are tetrahedron (0,0), cube (4,2), octahedron (2,4), icosahedron (0,8), dodecahedron (8,0). The cube and octahedron are dual views, as are the icosahedron and dodecahedron; do not add their kernel counts as physically independent degrees of freedom. Pentagonal-bipyramid decahedron (not Platonic) has (1,4).

## New nested-solid calculation

The 20 vertices of a regular dodecahedron contain exactly five inscribed cubes. Each cube has an 8-vertex, 4-dimensional vertex-incidence kernel; all five kernels embedded in R^20 collectively span dimension 13, decomposing into dodecahedral adjacency eigenspaces 4_3 + 4_5 + 5. This is distinct as an A5 representation from the original centred 13-site carrier (2*1 + 3 + 3' + 5).

Let P_3 and P_5 denote the two rank-four dodecahedral Laplacian eigenspace projectors, and P_(5band) the rank-five eigenspace projector. For the five embedded cube-kernel orthogonal projectors Q_c, the exactly verified relation is:

(1/5) sum_c Q_c = (1/4) P_3 + (1/4) P_5 + (2/5) P_(5band).

Thus the collective spectrum is 0 (multiplicity 7), 1/4 (multiplicity 8), 2/5 (multiplicity 5). Each dodecahedral vertex belongs to two cubes and distinct cubes intersect in two antipodal vertices. Each cube contains complementary four-vertex tetrahedra; their alternating signed pattern is cube-incidence-hidden. The five alternating patterns span precisely 4_3, and their average rank-one projector equals P_3/4.

The cube-average alone does not split 4_3 from 4_5: both have eigenvalue 1/4. The dodecahedral adjacency/Laplacian and parity resolve the spectral split. Therefore the cube nesting does not derive Delta or a physical interaction by itself.

## URT compatibility, not replacement

Freeze the original q_URT = (pi/e) exp(i*2*pi/phi^2) and keep the spiral's symplectic transport separate from the positive transfer and the BKM entropy Hessian. On the hidden 4+4 sector, retain L_hid = 3 P_3 + 5 P_5 and Delta = 3/20 - 80*pi/(1053*phi). This gives rho_* = (I4 + Delta^2 I4)/(4(1+Delta^2)). The five-cube averaging is a new positive, A5-equivariant candidate coarse-graining operator, not a proof of the URT selector or the continuum forces.

The 13-dimensional nested sector and canonical centred 13-site sector share only the five-dimensional A5 irrep. They are not automatically isomorphic; an A5-equivariant map between them has rank at most five. A physical coupling identifying the other sectors needs a distinct derivation.

## Reproducibility and status

The incidence ranks, five cubes, fusion projector identity, tetrahedral parity, canonical rho trace and URT symplectic condition were checked computationally with NumPy; mathematical claims here are finite exact identities up to machine error. **Status: mathematically verified / physical identification pending.** Do not infer a new independent 13-state fibre or new physical degrees of freedom from the rank coincidence.
