# Native coexact curl: no spontaneous transfer, positive vortex stiffness

## Question

Does the lowest nontrivial coexact edge curl provide the missing native
background that transfers fixed-charge energy into vertex stress, H64 history,
entropy or weak-gravity response?

This calculation uses the unchanged icosahedral block inside the complete
five-Platonic 190/H64/24 Hopf/circulation dynamics. No coupling, fit, random
direction, metric identification or replacement matrix is introduced.

## Exact native carrier

The lowest positive eigenvalue of the native icosahedral coexact edge operator
`b2 b2^T` is

`lambda_curl = 3 - sqrt(5) = 0.763932022500...`,

with multiplicity three. Its normalized curl obeys
`||edge_mode b2||^2 = lambda_curl`. Combining it with the charge-one golden
clock mode `m=9` gives relative-equilibrium multiplier

`mu = lambda_curl + 0.0025584063752810988`

and unit-charge energy `E=mu/2 = 0.3832452144377447`.

Every one of the 30 oriented native edge seeds, projected into this eigenspace,
passes the same full nonlinear stationary test.

## Obstruction: curl alone does not create fluid stress

The circulation energy is

`E_circ = (1/2) sum vertex_density * |edge_curl|^2`.

The pure coexact carrier has nonzero curl but exactly zero vertex density.
Consequently its circulation energy and full circulation gradient vanish. It
also has zero Hopf gradient, hidden `f/P3/P5` source and H64 forcing. The full
canonical gradient is only `mu z`, so the state is an exact relative phase
orbit rather than a source of stress or entropy production.

Fixed charge does not select this carrier as the ground state: its energy
`0.3832452144` is about 299.6 times the constant-face harmonic energy
`0.00127920319` found previously.

## Positive result: vortex-induced stiffness

Although the curl supplies no linear vertex force at zero density, the second
variation with respect to vertex amplitude is positive:

`K_circ = diag((|curl|^2 W^T)/24) >= 0`.

Across all 30 native edge seeds its trace is `0.03183050094` and operator norm
is `0.004041430634`. On the unfrustrated geometric icosahedral vertex block,
the lowest eigenvalue rises orientation-independently from `4.0` to
`4.00265197895`.

With the existing projective Hopf magnetic operator included, the vertex
minimum rises from `0.951963459967` into the range
`[0.954491244258, 0.954756219048]`. The width
`0.000264974790369` is a native orientation splitting: the circulation
stiffness is geometrically degenerate, while Hopf frustration resolves the
edge-seeded directions.

This is a measurable native fluid/frustration effect. It is positive stiffness,
not an instability, redshift, massless spin-2 response or horizon law.

## Next test

Search the fixed-charge constrained stationary equations in the coupled
icosahedral vertex-plus-coexact-edge subspace. The decisive target is a mixed
branch with nonzero vertex density and curl. If none bifurcates below the pure
curl energy, the present positive circulation term cannot spontaneously create
the required stress-bearing fluid background.
