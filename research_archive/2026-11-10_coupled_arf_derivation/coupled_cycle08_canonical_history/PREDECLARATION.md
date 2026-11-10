# Coupled cycle 08 predeclaration — distinguished history states

Portal-Hessian eigenvalue ratios depend on the signed-history background
(cycle 04). Test whether any physically distinguished state on the 64
labels produces a canonical ratio tuple, and whether that value is forced.

Distinguished states, fixed now:

1. Counting-measure average over all 64 signed histories:
   H_unif = (1/64) Σ_s H(α_s), and separately the Hessian at the mean
   configuration H(mean α). Averaging Hessians, averaging ratio tuples,
   and evaluating at the mean α are three different operations and will
   be reported as such.
2. KMS / Perron ground space of the history Hamiltonian Hbits (equivalently
   the leading eigenspace of T_hist = exp(−η Hbits)). If this space is not
   one-dimensional, the ground KMS state is not a unique ray; the extreme
   states and the uniform mixture will all be reported.
3. A5-invariant averages. A5 acts on the six icosahedral diameters and
   therefore on the 64 = (Z2)^6 labels. Orbit counts will be computed from
   the 60 rotations. If there is more than one orbit, orbit-wise averages
   give a family of dimension n_orbits − 1 (plus the uniform average).
4. ρ★ weighting of hidden channels,
   ρ★ = (I4 ⊕ Δ² I4) / [4(1+Δ²)],
   giving H_ρ(α) = w3 H^{(3)}(α) + w5 H^{(5)}(α) with
   (w3, w5) = (1, Δ²) / [4(1+Δ²)],
   contrasted with the golden-mode (c3, Δ² c5) used in cycle 04.

A response is “forced” only if every distinguished construction above
that is uniquely defined yields the same ratio tuple to 1e-10. Otherwise
the classification is FALSIFIED (explicit disagreeing distinguished
states) or CONDITIONAL (a unique convention exists but is a choice).
No ARF target is used.
