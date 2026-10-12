# Newton’s Cathedral: canonical time, sources and diagnostic equivalence

9 October 2026. This continues the conversation-first reconstruction from the
canonical positive machine. Its operator time and source positivity are
derived directly from \(T_\star=B_\star^\dagger B_\star\), preserving
the selected state, Gauss constraint and source adjoint. The earlier
geometric inverses are compared with this machine through explicit admission
conditions. A negative diagnostic form does not reopen a closed positive
transfer without such an identification.

## 1. Positive operator time with the odd period retained

For any nonzero finite \(T\ge0\), \(Z_N=\operatorname{Tr}T^N>0\).
Given source operators \(A_i\) at times \(0\le t_i\le N/2\), define

\[
X_i=T^{t_i}A_iT^{N/2-t_i}.
\]

The source/reflection form is exactly

\[
G_{ij}=\frac{\operatorname{Tr}
[T^{N-t_i-t_j}A_i^\dagger T^{t_i+t_j}A_j]}{Z_N}
=\frac{\operatorname{Tr}X_i^\dagger X_j}{Z_N}\ge0
\quad\text{as a matrix in all source and time indices}.
\]

The last inequality means \(c^\dagger Gc\ge0\) for every complex
coefficient vector. It is a Hilbert–Schmidt Gram identity, including
noncommuting and non-Hermitian sources. No inverse transfer is used.
Ordered polynomial source words obey the same identity, with reflection
reversing order and taking the actual operator adjoints.
CAR words use the ordinary Fock adjoint, including their operator order and
signs. This does not identify an unverified Grassmann, Pin or normal-Dirac
reflection dictionary with that physical adjoint.

At \(N=13\) and integer times 0 through 6, all trace powers are integers
and nonnegative, with \(13-t_i-t_j\ge1\). The original odd period is
retained; no even cover is needed for this transfer theorem. A thirteen-step
thermal circle is a stated time boundary condition, not an identification of
the internal thirteen-state fibre with inverse temperature.

On \(P_T=\mathbf1_{(0,\infty)}(T)\), functional calculus gives
\(H_T=-a^{-1}\log(T/\|T\|)\), a positive heat semigroup and a unitary
real-time group. The norm convention sets the base vacuum energy; the raw
transfer and its source contacts remain fixed. Null directions have no
finite logarithmic energy and remain outside this finite-log support.
The exact kernel of the injective-heat factorization is
\(\ker T=\ker(\sqrt W P_G)\). Without commutation, its support is not
obtained by multiplying two support projectors.

Each ground-state transfer-channel residue

\[
R_{ab}(z)=\operatorname{Tr}(\rho_0 A_a^\dagger P_z A_b)
\]

is positive semidefinite. Transfer gaps \(-a^{-1}\log(z/\|T\|)\)
are defined on positive support. Their interpretation as physical particle
masses requires the specified physical source and spatial/continuum map.
Equal-time excursions into the null sector remain contacts; a source
projection that deletes them changes the observable.

The actual hidden eight-state transfer supplies all sixteen retained off-diagonal
source channels. With \(r=\Delta^2\), its odd-period kernel is

\[
G_{(a,t),(b,s)}
=\delta_{ab}\frac{r^{t+s}+r^{13-t-s}}{8(1+r^{13})}.
\]

The two terms have positive coefficients. This retains its two-level hidden
scope and does not introduce a generation filter. On this hidden carrier,
the primitive \(\rho_\star=T_{\rm hid}/\operatorname{Tr}T_{\rm hid}\)
and its circle state
\(\rho_{13}=T_{\rm hid}^{13}/\operatorname{Tr}T_{\rm hid}^{13}\)
are kept distinct. The primitive hidden state is not assigned to an arbitrary
full physical transfer merely by normalizing that transfer once.
The [positive thermal reflection proof](physical_time_work/transfer/positive_thermal_reflection_report.md)
supplies the exact operator construction and executed arrays.

## 2. Integer time words retain the full source derivatives

For admitted source families \(T(s)\) and \(A_i(s)\), the thermal
numerator is an integer-power matrix word. Its first derivative replaces
each factor once by its first derivative. Its mixed second derivative
includes each factor's second contact and both orders of every pair of
distinct first replacements. This rule includes source endpoints, moving
frames, selector and Gauss factors when they depend on the admitted source.

Write the unnormalized numerator as W, the partition function as Z, and
\(C=W/Z\). Then

\[
C_a=\frac{W_a-CZ_a}{Z},\qquad
C_{ab}=\frac{W_{ab}-C_aZ_b-C_bZ_a-CZ_{ab}}{Z}.
\]

For \(T=B^\dagger B\), the diagonal second contact is

\[
T''=B''^\dagger B+2B'^\dagger B'+B^\dagger B''.
\]

Static Gram positivity does not equate a sourced partition Hessian with a
positive covariance. The former also contains these second contacts and
partition derivatives. In particular, a smooth rank-gain eigenvalue
\(s^2\) has a nondifferentiable square root \(|s|\); the integer word
remains smooth. Differentiating the static fractional-power factorization
across such a gain would be an invalid shortcut.
These integer source derivatives hold insertion labels fixed. Sources held
at fixed proper times also require the admitted placement and clock contacts.

The [integer thermal source proof](physical_time_work/thermal_sources/integer_thermal_source_jets_report.md)
derives and executes the complete word and endpoint rules on the existing
selected-transfer probe. That probe remains an identity witness rather than
the recovered full nonlinear species action.

## 3. Kernel and moving-support contacts are forced by positivity

Let \(P=\operatorname{supp}T(0)\), \(Q=I-P\), and let \(T^+\)
be the inverse on that support, zero on the kernel. Every twice differentiable
two-sided positive source family satisfies

\[
QT_iQ=0,\qquad
QT_{ii}Q-2QT_iP\,T^+\,PT_iQ\ge0.
\]

For constant rank the mixed relation is exact:

\[
QT_{ij}Q=QT_iP\,T^+\,PT_jQ
+QT_jP\,T^+\,PT_iQ.
\]

It follows from the positive Schur complement of the support block. Dropping
the second contact while retaining a cross-support first derivative makes
the affine truncated family indefinite. It is a failure of that truncation.
For rank gain, only the real directional Schur excess is constrained
nonnegative; the constant-rank equality is not asserted.

Along one smooth constant-rank source path, the Kato connection
\(\Omega=[P',P]\) fixes the support frame. The transformed derivatives
are

\[
\widetilde T'=T'+[T,\Omega],
\]

\[
\widetilde T''=T''+2[T',\Omega]+[[T,\Omega],\Omega]
+[T,\Omega'],\qquad\Omega'=[P'',P].
\]

The connection derivative is retained. Multi-source frame transport requires
its own mixed connection contacts. The actual rank-eight-in-twenty hidden
coframe factor verifies all thirty-six mixed kernel identities and all six
diagonal transported paths. Its five moving shear directions become
indefinite when the quadratic contact is omitted; its fixed-support breathing
direction is distinct.
The [kernel source proof](physical_time_work/source/kernel_source_contacts_report.md)
contains the derivation, exact archived matrices and rank-gain witness.

## 4. The complete Euclidean Wilson diagnostic and its limited scope

The preceding root-normal Wilson inverse used all ten A4 roots, a fixed
normal Dirac adjoint, and an isotropic Wilson coefficient. Its r=1 negative
source theorem concerns that specified action. The new general-coefficient
classification retains both temporal cosets and every spin/source branch.
For every \(m_0>0\) and \(r\ge0\), it proves that some
even-height minus-spin normal-reflected correlator is negative.
The proof includes real, complex, purely imaginary and repeated pole cases.
It closes the proposal to repair this diagnostic by changing one uniform
Wilson coefficient; it does not select a new coefficient or alter the action.

The recovered archived wall action has a different time stencil, Clifford
placement and source endpoint. Its domain-wall additive \(m_0=-M_{\rm arch}<0\)
also lies outside the positive-additive-mass domain of the new theorem.
The latest October rule also inserts species
before common vacuum selection and hidden elimination. Therefore neither the
archived wall completion nor the isotropic Euclidean diagnostic is substituted
for the corrected full selected source action. The exact classification and
its executable cases are supplied by the
[general Wilson coefficient proof](physical_time_work/fermion/general_root_wilson_report.md).

## 5. Admission to the same canonical action and the closure ledger

An asserted geometric representation must preserve the physical source
adjoint, state, time boundary, coframe/clock conversion and all admitted
source derivatives of the canonical transfer. It must intertwine their
correlators, rather than match only a bare dispersion or local lattice name.
Every genuine admitted marginal of a positive source Gram is positive.
Consequently a negative diagnostic form cannot be such a marginal with the
stated same adjoint and state.

The earlier odd13 Euclidean scalar covariance fails its specified site
reflection. The canonical odd13 operator thermal Gram proved above is
positive. This closes their inequivalence under that proposed identification;
it does not require repairing the canonical transfer or changing its period.
The fermion diagnostic requires the same source/state/time admission before
its negative reflected forms could constrain the full machine.

The [canonical applicability ledger](physical_time_work/recovery/canonical_time_applicability_report.md)
pins the actual archived coefficients and hopping operators, the recovered
conversation corrections, and the complete intertwining conditions. Sources
enter before vacuum and hidden elimination; hidden determinants, endpoint
contacts and memory remain required after reduction.

Closed here are canonical positive operator time on its support, odd-period
thermal source reflection, positive source-channel spectral residues, and the
contact-complete integer and support derivative laws. Closed prior results
remain frozen. Diagnostic no-go statements retain their specified action and
adjoint scopes. The geometric embedding of this clock in the conserved
physical leaf, selected nonlinear species/source law and interacting
continuum observables require their own same-action derivations.

These five components extend the continued work as sections81–85. The package
preserves the exact version-eight input and supplies all executable proofs.

```sh
python3 run_canonical_time.py
```