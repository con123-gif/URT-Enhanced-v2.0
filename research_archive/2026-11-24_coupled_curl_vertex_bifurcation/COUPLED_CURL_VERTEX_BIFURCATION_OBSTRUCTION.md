# Fixed-charge coexact-curl bifurcation obstruction

## Question

Does the lowest native coexact curl develop a mixed nonzero-vertex-density
branch that activates circulation, hidden H64 stress and entropy transfer?

The test uses the unchanged 190/H64/24 projective-Hopf/circulation action. It
does not add a portal, tune a coefficient or identify a scalar with a metric.

## Constrained stationary operator

The pure icosahedral curl has spatial eigenvalue
`lambda_curl=3-sqrt(5)` and charge multiplier

`mu=lambda_curl+r^2 ell_1(m=9)=0.7664904288754895`.

A continuous mixed branch can bifurcate only if the fixed-charge transverse
vertex Hessian develops a zero mode. For each of the 30 native oriented-edge
seeds in the three-dimensional lowest-curl eigenspace, the certificate forms

`K_constrained = K_vertex + K_circulation(curl) - lambda_curl I`.

All of these operators are strictly positive. Thus the pure curl is locally
stable against the only vertex perturbations that can activate its circulation
feedback.

## Finite-amplitude check

For each edge seed, the least-stiff constrained vertex eigenvector defines a
deterministic path from pure curl to pure vertex. The certificate evaluates 65
amplitudes on every path. At each point it:

1. exactly relaxes the original H64 field;
2. rescales the state to total native charge
   `Q=||z||^2+2||y||^2=1`;
3. evaluates the complete reduced, Hopf and circulation energy.

Every one of the 30 paths has its minimum at zero vertex amplitude. This is a
finite-amplitude check of the local result, not a claim that every possible
disconnected nonlinear branch has been excluded.

## Full-space saddle versus coupled stability

The pure curl is not the global fixed-charge ground state. The constant-face
harmonic and the lowest H64 carrier both have negative constrained curvature
relative to the curl. This is consistent with their much lower energy per
charge.

However, those lower sectors are exactly decoupled from the zero-density curl
at linear order. The existing circulation term requires both vertex density
and edge curl; the hidden source requires vertices. Consequently the lower
face/history carriers do not cause spontaneous vortex-to-stress conversion.

## Physical conclusion

The current action contains a genuine vortex-induced stiffness and Hopf
orientation splitting, but no continuous self-starting fluid/stress branch.
The curl is a strict constrained minimum in its physically coupled
vertex-edge sector and a saddle only toward decoupled carriers. This blocks a
weak-gravity or entropy interpretation of the pure curl without ruling out a
disconnected finite-amplitude mixed solution.

## Next test

Run deterministic constrained continuation over the full complex
three-curl-plus-twelve-vertex icosahedral subspace, starting from finite vertex
amplitudes rather than the pure-curl boundary. The target is a disconnected
stationary branch; if none exists below the pure-vertex energy, the present
positive circulation feedback cannot self-create a stress-bearing fluid state.
