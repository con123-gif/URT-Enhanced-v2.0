# URT–ZPE: a covariant carrier-refinement action and exact creation-pressure compensation

**Date:** 21 November 2026. **Track:** standalone prime-flux URT → three-dimensional magnetic Gaussian vacuum, **not** Riemann hypothesis or Cathedral ARFs. **Status:** THEOREM for the specified auxiliary-field continuum action; **physical embedding conditional**. Builds on the *unchanged* three-dimensional golden-angle Hamiltonian from commit `9e3fc93` and the native three-layer refinement/energy ledger in commit `489d3d7`.

## Result at the current frontier

The earlier work derived from one native graph Hamiltonian the three-dimensional bulk energy law

\[
E(V,M)=K M^{4/3}V^{-1/3},\qquad \rho(n)=K n^{4/3},\qquad
K=\hbar c\,u_3(F)>0,\quad n=M/V,
\]

with the positive, exactly defined infinite-volume local spectral trace \(u_3(F)=\langle\delta_0,\sqrt{L_\infty(F)}\,\delta_0\rangle\). At fixed carrier number \(M\), the **mechanical** pressure is \(+\rho/3\). The immediately preceding three-layer theorem gives a gapped finite process to increase \(M\) by adding real magnetic sheets, not fictitious sites. It did **not** supply the physical source or a covariant effective stress tensor.

Here we show an explicit diffeomorphism-invariant, **auxiliary-field** completion. Instead of assigning negative pressure by hand, its metric variation gives the precise decomposition

\[
\boxed{T_{\rm lattice}^{\mu\nu}=(\rho+p)u^\mu u^\nu+p g^{\mu\nu},\quad p=\rho/3,}
\]
\[
\boxed{T_{\rm constraint}^{\mu\nu}=-\frac{4\rho}{3}(u^\mu u^\nu+g^{\mu\nu}),\qquad
T_{\rm total}^{\mu\nu}=-\rho\,g^{\mu\nu}.}
\]

In the co-moving frame the constraint sector has **zero energy density** and pressure \(-4\rho/3\). It performs exactly the work needed to create carriers at the rate required by a constant physical density. The total stress is automatically covariantly conserved after the auxiliary equations are imposed. The price is explicit: the constant physical gap threshold (and hence the density constraint) is still a **new dynamical postulate**, not a consequence of primitive URT. The auxiliary action is an effective encoding of that postulate, not a microscopic reservoir or proof of quantum particle creation.

## 1. The physical gap condition, isolated rather than disguised

For the native 3D cyclic magnetic flux \(F=|\operatorname{Arg}(\epsilon e^{-2\pi i/\phi^2})|\), \(\epsilon=\pm1\), the previous spectral result is

\[
L_{3D}\succeq g_3(F)I,\qquad
g_3(F)=\frac32\left[1-\cos(F/4)\right]>0.
\]

At physical carrier spacing \(\ell=n^{-1/3}\), the guaranteed frequency floor is \(\omega_{\rm floor}(n)=c\sqrt{g_3(F)}\,n^{1/3}\). **Additional physical premise C:** a positive *proper* frequency reference \(\Omega\) exists, with \(\omega_{\rm floor}\ge\Omega\), and the state chooses the least-energy allowed carrier density. Equivalently,

\[
 n\ge n_\star=\left(\frac{\Omega}{c\sqrt{g_3(F)}}\right)^3.
\]

Since \(\rho(n)\) strictly increases with \(n\), its minimum over the admissible densities occurs at \(n=n_\star\). This derives saturation **within premise C**, not premise C itself. No dimensionful value of \(\Omega\) is provided by the primitive \((\pi/e,\ 2\pi/\phi^2)\) recurrence, and the choice of \(\epsilon\) remains conditional.

## 2. A covariant auxiliary action and its field equations

Use metric signature \((-+++ )\) and write the formulas for the stress tensor in \(c=1\) units. Let \(J^\mu\) be a timelike **contravariant vector density of weight +1**, not a conserved current by assumption. Define its physical number density and four-velocity by

\[
 n=\frac{\sqrt{-g_{\mu\nu}J^\mu J^\nu}}{\sqrt{-g}},\qquad
 J^\mu=\sqrt{-g}\,n u^\mu,\qquad u_\mu u^\mu=-1.
\]

Let \(\lambda(x)\) be a scalar auxiliary Lagrange multiplier. The covariant effective action is

\[
\boxed{S_{\rm carrier}[g,J,\lambda]=\int d^4x\,\sqrt{-g}
\left[-K n^{4/3}+\lambda(n-n_\star)\right].}
\]

It uses the **same** bulk energy coefficient \(K=\hbar c u_3(F)\); there is no adjustable creation-pressure coefficient. Stationary variation of \(\lambda\) gives \(n=n_\star\). Stationary variation of a nonzero timelike \(J^\mu\) gives \(\lambda=d\rho/dn=\frac43 K n^{1/3}>0\). Thus the auxiliary fields eliminate algebraically to

\[
\boxed{S_{\rm carrier}^{\rm on-shell}=-\int d^4x\sqrt{-g}\,\rho_\star,\qquad
\rho_\star=K n_\star^{4/3}=\frac{\hbar u_3(F)\Omega^4}{c^3g_3(F)^2}.}
\]

The eliminated action is mathematically the cosmological-constant action. It is **not independent evidence** that URT generates the observed cosmological constant: a fixed physical frequency/density was imposed to obtain it.

## 3. Exact metric variation: where the negative pressure comes from

When varying the inverse metric at fixed \(J^\mu\),

\[
\delta n=\frac n2(g_{\mu\nu}+u_\mu u_\nu)\,\delta g^{\mu\nu}.
\]

Define \(p=n\rho'(n)-\rho\). The bare graph-energy term contributes the standard perfect-fluid form

\[
 T^{\rm lattice}_{\mu\nu}=n\rho'(n)u_\mu u_\nu+p\,g_{\mu\nu},
 \quad p=\rho/3.
\]

The multiplier term contributes

\[
 T^{\rm constraint}_{\mu\nu}=\lambda(n-n_\star)g_{\mu\nu}
 -\lambda n(g_{\mu\nu}+u_\mu u_\nu).
\]

At \(n=n_\star\) and \(\lambda=\rho'(n_\star)\), the temporal parts cancel, leaving exactly

\[
\boxed{T^{\rm constraint}_{\mu\nu}=-\frac43\rho_\star(g_{\mu\nu}+u_\mu u_\nu),\qquad
T^{\rm total}_{\mu\nu}=-\rho_\star g_{\mu\nu}.}
\]

Because \(\rho_\star\) is constant, \(\nabla_\mu T_{\rm total}^{\mu\nu}=0\) exactly: this is the desired action-level Ward identity, *for the declared auxiliary theory*. The constraint sector is not an independently derived propagating field, and the on-shell cancellation must not be described as an observed energy reservoir.

## 4. Exact FRW creation law and work exchange

On spatially flat FRW with \(ds^2=-dt^2+a(t)^2d\mathbf x^2\), let \(u^\mu=(1,0,0,0)\) and \(H=\dot a/a\). Since \(n=n_\star\), the number flux is \(j^\mu=n_\star u^\mu\), hence

\[
\nabla_\mu j^\mu=3Hn_\star,\qquad \boxed{\Gamma=3H}.
\]

This is **derived from the constraint field equation**, not added as a second independent source law. It remains conditional on the underlying constant-gap premise. The component stress tensors exchange the exact comoving energy rate

\[
\boxed{Q=\mu n_\star\Gamma=\frac43\rho_\star(3H)=4H\rho_\star.}
\]

The lattice component satisfies \(\dot\rho+3H(\rho+\rho/3)=+Q\); the zero-density multiplier component satisfies \(\dot\rho_{\rm constraint}+3H(\rho_{\rm constraint}-4\rho/3)=-Q\), and their sum is source-free. **No energy is created from the conservation equation.** It is transferred by the constraint stress that enforces the fixed density; no separately specified reservoir field is derived.

The same result is visible in the original exact first law:

\[
 dE=-\frac\rho3dV+\mu\,dM,\qquad \mu=\frac{4E}{3M}.
\]

At fixed \(M=n_\star V\), \(dM=n_\star dV\), therefore

\[
\boxed{\frac{dE}{dV}\bigg|_{\rm constraint}=-\frac\rho3+\frac{4\rho}3=\rho,
\qquad P_{\rm constrained}=-\rho.}
\]

An auxiliary negative-pressure contribution \(-4\rho/3\) is thus *both* the metric-variation result and the work needed to supply the additional carriers. The independently constructed native three-layer joining work of commit `489d3d7` is a finite microscopic cost; the present continuum calculation does not establish an actual physical mechanism that pays it.

## 5. Conditional coupling to gravity, with its remaining inputs visible

If the standard Einstein–Hilbert term is **separately assumed** and coupled to this action, then at homogeneity \(T_{\mu\nu}=-\rho_\star g_{\mu\nu}\) yields the usual de Sitter equation in an otherwise empty, spatially flat universe,

\[
 H^2=\frac{8\pi G\rho_\star}{3c^2}
 =\frac{8\pi G\hbar u_3(F)\Omega^4}{3c^5g_3(F)^2}.
\]

This covariant closure introduces no arbitrary fitted *pressure*; however the **proper frequency threshold \(\Omega\), Newton coupling \(G\), and physical flux-sector selection are not derived from primitive URT**. Adding an auxiliary multiplier that algebraically becomes a cosmological constant is not a completed zero-parameter prediction, a novel derivation of Einstein gravity, or a model of vacuum production in an expanding universe from a microscopic unitary quantum process.

## 6. Executable regression and the next constructive derivation

`URT_ZPE_COVARIANT_CONSTRAINT_CERT.py` independently uses exact symbolic differentiation to verify the field-equation multipliers, metric-stress decomposition, lapse and scale-factor variations at fixed densitized current, fixed-density first-law work, the \(Q=4H\rho\) exchange, and both original golden-angle gap sectors. It has no cosmological measurement inputs. Executed locally in the working container with exit 0, 2026-11-21. GitHub CI will execute after registration.

**RESUME HERE (not a stopping point):** Replace premise C with a genuine microscopic URT dynamical selection of the proper frequency floor (or a different native gap-preserving principle), then give the multiplier/energy source an explicit Hamiltonian sector whose quantum evolution pays the native three-layer sheet-and-joining costs. The proper scale and general-relativistic coupling must be selected from dynamical inputs before making an absolute dark-energy prediction. Keep the already verified 3D graph and carrier ledger unmodified. Do not advertise this conditional action as a final physical theory.
