# Native hidden-source to 13-cell stress interface obstruction

## Scope

This certificate tests one narrow interface in the unchanged Newton's
Cathedral construction: whether the original five-Platonic, 190-cochain,
H64-history, 24-clock hidden source has a **direct canonical** readout into the
existing 13-cell scalar/vector/STF stress decomposition.

It does **not** identify a scalar with a metric, introduce a Lorentzian metric,
fit a coupling, choose a background to obtain a desired result, or claim that
the 13-cell representation is already gravity.  The calculation uses the
repository-native integer icosahedral incidence, face Laplacian, hidden
projectors, all-five vertex map, and the existing value of `Delta`.

## Exact certificate

Let `C` be the native 20-face by 12-vertex incidence and `L` the native
icosahedral face Laplacian.  The original hidden projector and its two
four-dimensional irreducible sectors are

\[
P_h=I-C(C^TC)^{-1}C^T,\qquad
P_3=P_h(5I-L)/2,\qquad
P_5=P_h(L-3I)/2.
\]

Reconstruction with exact rational arithmetic gives

\[
\operatorname{rank}P_h=8,\quad
\operatorname{rank}P_3=\operatorname{rank}P_5=4,
\]

and, exactly,

\[
C^T P_3=0,\qquad C^T P_5=0.
\]

The exact projectors match the repository arrays to below `1e-10` operator
norm.  This is a structural kernel statement, not a small-number inference.

## Original all-five source is nonzero

The actual source path used by `NativeURTEngine` is

\[
v\in\mathbb C^{50}\longmapsto f=CQv\in\mathbb C^{20},\qquad
h_3=P_3(f\odot f),\quad h_5=P_5(f\odot f).
\]

Expanding all 1,275 symmetric vertex monomials gives rank 4 in the `P3`
image, rank 4 in the `P5` image, and rank 8 jointly.  Therefore the
obstruction is not that the nonlinear hidden source is empty.

## Direct stress readout vanishes

For the direct native adjoint readout

\[
s=C^T(h_3+\Delta h_5),
\]

the full 12 by 1,275 response has rank zero and operator norm below `1e-10`.
Resolving those 12 vertex cells into the original icosahedral shells gives
zero rank separately in scalar 1, coordinate-vector 3, STF 5, and residual 3.
Adding the clock scalar to call this a 13-cell bookkeeping sector does not
create a missing spatial stress source.

The result is independent of the numerical value of `Delta`, because each
hidden irrep is separately annihilated by `C^T`.

## Energy and weak-gravity consequence

The face field `f` is linear in the native cochain vertex amplitudes, whereas
`h3` and `h5` are quadratic.  The positive source occupation

\[
\frac14\left(\|h_3\|^2+\Delta^2\|h_5\|^2\right)
\]

therefore begins at fourth order.  The executable certificate verifies exact
`t^4` scaling along a deterministic nonzero native vertex direction.  The
source/history/KMS sector consequently contributes no quadratic Hessian and
no linear weak-field stress response at the symmetric vacuum `z=0`.

This sharpens, rather than replaces, the preceding K4 result: the current K4
sector has no massless mode and no spatial principal symbol, and the original
hidden source cannot repair that obstruction at linear order around `z=0`.

## Honest boundary

This is **not** a global no-go theorem for nonlinear or strong-field gravity.
At a nonzero native background, the derivative of the quadratic hidden source
need not vanish.  However, the repository currently supplies neither a
dynamically selected gravitational background nor a canonical hidden-to-STF
portal.  Elementwise products or arbitrary intertwiners could make a nonzero
map, but selecting one for the desired gravitational answer would be an
invented coupling.

No redshift, Lorentzian causal cone, two-polarization spin-2 propagator,
horizon, surface gravity, Hawking temperature, Bekenstein entropy, or first
law follows from this calculation.

## Next discriminating test

Select a nonzero background only by an existing native dynamical rule—for
example a documented stationary/minimizing state or an actual circulation/Hopf
evolution, with no gravity-targeted parameter choice.  At that frozen state:

1. differentiate the full 190/H64/24 reduced energy exactly or by verified
   automatic differentiation;
2. project its response into the existing 13-cell STF sector;
3. test for a Ward nullspace, exactly two transverse-traceless massless modes,
   positive kinetic energy, and a nonzero hyperbolic spatial principal symbol;
4. attempt redshift or horizon thermodynamics only if all four tests pass.

If no native rule selects such a state, the specific obstruction is missing
background selection and missing canonical portal—not failed numerics.

## Reproduction

Run:

```bash
python NATIVE_HIDDEN_STRESS_INTERFACE_CERT.py
```

The script exits nonzero if any exact identity, rank, tolerance, shell
decomposition, or quartic-scaling check fails.
