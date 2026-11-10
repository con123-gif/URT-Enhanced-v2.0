# Coupled cycle 04 — invariance of eigenvalue ratios

Classification: FALSIFIED.
Advances an ARF? No.

The hidden Hessian of cycle 03 is independent of portal direction (its
spectrum is `2 c3` (×4) and `2 Δ² c5` (×4)). The question asked here is
whether the *invariant ratios of the portal Hessian* of
`V(α) = c3 ||q3(Iico α)||² + Δ² c5 ||q5(Iico α)||²`
are likewise independent of source direction, across all 64 history labels,
coherent superpositions, and clock modes.

They are not.

## Explicit counterexample (signed histories 0 and 1)

Each history `s ∈ {0,…,63}` chooses one vertex from each of the six
antipodal icosahedral pairs (the original six-bit dictionary). The signed
12-vector `σ_s` is `+1` on the chosen six vertices and `−1` on their
antipodes. Portal coordinates `α_s = Iicoᵀ σ_s`. The 8 × 8 Hessian of `V`
is evaluated at `α_s` by the exact polarisation formula of the predeclaration
(no finite difference), at the golden charge-2 mode.

Sorted eigenvalue *ratios* `λ_i / λ_max` (entries below `1e-14` are numerical zeros):

- History 0: `(0, 0, 0, 0, 0, 3/4, 3/4, 1)`
  raw eigenvalues ≈ `(0, 0, 0, 0, 0, 17.54774670306666, 17.54774670306669, 23.396995604088907)`
- History 1: `(0, 0, 0, 0, 1/4, 1/4, 1, 1)`
  raw eigenvalues ≈ `(0, 0, 0, 0, 7.054260444185454, 7.054260444185473, 28.21704177674182, 28.217041776741837)`

Maximum absolute difference of the ratio tuples: `0.4999999999999986`.
Tolerance for “invariant” was `1e-10`. This is a sharp, symmetry-looking
counterexample (the nonzero ratios are `1/4`, `3/4` and `1`), not a numerical
wobble.

The same non-invariance holds for:

- 0-1 occupancy histories (the chosen six vertices only);
- all 15 Iico axis-pair backgrounds `(e_{i3} + e_{3+i5})/√2` (max ratio
  difference `0.43723056109772884` between the first two pairs);
- the 96 undirected single-bit coherent superpositions `(σ_s + σ_{s⊕2^b})`.

## Families that *are* invariant

- The six weight-1 Fourier combinations `Σ_s (−1)^{⟨ω,s⟩} σ_s` on the 6-cube
  all give the same ratios `(0, 0, 0, 0, 1/4, 1/4, 1, 1)`, matching history 1.
  These six combinations are equivalent under the A5 action on the six diameters.
- Portal-Hessian ratios at the *fixed* background of history 0 are independent
  of the charge-2 clock mode `m = 0,…,23` to `1e-10`. Because `Δ² c5 / c3 ≈ 6×10^{-6}`,
  `H_port ≈ c3 H^{(3)}` and an overall `c3(m)` cancels in the ratios.

## Hidden ratio versus clock

`ρ_hid(m) = c3(m) / (Δ² c5(m))` is *not* clock-independent:
it ranges from `162823.8958437176` to `163951.19236992727`
(the golden-mode value). Relative variation about `0.69 %`.

## Conclusion

Invariant eigenvalue ratios of the portal Hessian are not independent of
source direction. Histories 0 and 1 are an explicit counterexample. The
only direction-independent spectrum in this problem is the hidden Hessian
of cycle 03 (and the eight positive eigenvalues of `K` on `Sym²`), whose
ratio still depends on the clock mode through `c3` and `c5`.

Verification: `test_ratio_invariance.py`, `results.json`.
Predeclaration hash: `f93d4ad85b4cda0971adbe75b1319445029d480b51c41be52a62bb218ad97c5a`

A name collision (`r` overwritten by a ratio vector) and a `numpy.bool_`
JSON dump were fixed before a successful run; both hashes of the test
script are recorded in `HASHES.txt`.
