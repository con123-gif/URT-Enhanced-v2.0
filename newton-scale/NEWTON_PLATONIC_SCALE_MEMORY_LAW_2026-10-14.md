# Newton–Platonic Scale-Memory Law — exact finite dynamics and phase

**14 October 2026 | Independent of URT, the Cathedral and observational constants.**

## Axioms and exact result

Let `H4 = {x in R5 : sum_i x_i = 0}` with orthogonal projector `P=I5-J5/5`. Its five unit simplex vectors are `v_i=sqrt(5/4) P e_i`, satisfying `v_i·v_j=1` (same label) and `-1/4` (different). Put `Q_i=v_i v_i^T`. These are rank-one projectors with `sum_i Q_i = (5/4) I_H4`. Hence `E_i=(4/5)Q_i` is a normalized five-outcome POVM, determined by geometry alone.

**Explicit dynamical selection axiom (not hidden):** Each history step is an efficient, single-Kraus, pure-output measurement of this POVM. Among such allowed updates, choose the one maximizing the probability that the same outcome repeats on the immediate next step. This operational *maximum-repeatability* rule is a separate principle, not a theorem forced solely by the projectors.

Every single-Kraus operation satisfying `K_i†K_i=E_i` has the form

`K_i = sqrt(4/5) |w_i><v_i|` with `||w_i||=1`.

The conditional same-label repeatability is `(4/5)|<v_i,w_i>|²≤4/5`, with equality **if and only if** `w_i=e^{iθ_i}v_i`. Thus the axiom uniquely fixes the update up to irrelevant phases:

`M_i = sqrt(4/5) Q_i`.

After any observed outcome `i`, the state is `Q_i` and the next outcome transition is

`T_ji = Tr(M_j Q_i M_j†) = 4/5` if j=i; `1/20` otherwise.

Exactly,

`T = (3/4)I5 +(1/20)J5`,

`T^n = J5/5 +(3/4)^n(I5-J5/5)`.

The unique stationary label distribution is uniform, and the contrast of any initial label decays by **3/4 per hidden event**. This is a completely explicit parameter-free conditional *dynamics*, not merely a static spectral ratio. A contrast observable's normalized correlation is `C(n)/C(0)=(3/4)^n` for a stationary chain.

## Connection to the separately derived Newton factor

The dodecahedral conjugate eigenpair `3±sqrt(5)` defines the exact spectral ratio `s=phi^-2=(3-sqrt(5))/2`. If — and **only if** — a physical or geometric refinement event corresponds to one hidden update, with `ell_n=ell0 s^n`, the scale-memory relation becomes

`C(ell_n)/C(ell0) = (ell_n/ell0)^beta`,

`beta = log(4/3)/(2 log(phi)) = 0.29891417611791676...`.

Hence a *definite observable ratio* for such a physical realization is `C(s ell)/C(ell)=3/4`, with no fit. This is not an assertion that ordinary physical distances exist below Planck or that the one-event-per-refinement correspondence has been derived from quantum gravity.

## An exact hidden loop phase

For any three distinct simplex labels `i,j,k`, the gauge-invariant cyclic product is

`Tr(Q_i Q_j Q_k) = (v_i·v_j)(v_j·v_k)(v_k·v_i) = (-1/4)^3 = -1/64`.

Its complex Hilbert-space Bargmann/Pancharatnam phase is **π**. This negative triangle amplitude survives independent sign/phase choices of the vectors, so all ten distinct 3-label triangles carry the same nontrivial `Z2` projective holonomy. It demonstrates phase/frustration in hidden ordered histories. It does not itself supply a thermodynamic arrow of time or prove spacetime curvature.

## Selection is necessary: exact alternative dynamics

The **same geometry and POVM** also admit a valid S5-symmetric measure-and-prepare instrument that outputs the normalized orthogonal complement `(I_H4-Q_i)/3` after outcome i. Its observed transition matrix is

`T_alt=(J5-I5)/4`, spectrum `{1, (-1/4)x4}`.

It has **different dynamics** despite identical event probabilities for an arbitrary input state. Thus geometry and POVM alone do not uniquely fix a history law: the maximum-repeatability principle is the *precisely identified extra dynamical axiom*. A future physical application must test it instead of silently imposing it.

## Physical claim / falsification

This is a mathematically proved law of a specified Platonic history process. A physical Newton Scale law follows only if (i) actual underlying histories realize this POVM, (ii) maximum repeatability selects their dynamics, (iii) one event corresponds to one golden spectral refinement, and (iv) correlation observables can be operationally extracted. A direct discriminant is the parameter-free factor **3/4 per Newton scale**, with exponent `beta`; an alternative symmetric instrument predicts a signed contrast factor **-1/4** instead. Neither physical realization has been experimentally established.

## Reproduce

Run `python newton-scale/scale_memory_dynamical_law_exact.py` (SymPy). The same script is saved as a conversation artifact. It uses neither the Cathedral repository nor fitted physics inputs.

## Exact continuous log-scale flow (not a separately fitted differential equation)
Let the dimensionless refinement depth be \(u=\ln(\ell_0/\ell)\). On the discrete Newton levels \(u_n=2n\ln\varphi\). The unique \(S_5\)-equivariant continuous-time Markov semigroup with \(e^{(2\ln\varphi)\mathscr G}=T\) is
\[
\mathscr G=\beta(J_5/5-I_5),\qquad
\beta=\frac{\ln(4/3)}{2\ln\varphi}.
\]
Therefore the exact Newton–Platonic log-scale memory equation is
\[
\boxed{\frac{dp_j}{du}=\beta\left(\frac15-p_j\right)},\qquad
p_j(u)=\frac15+e^{-\beta u}\left(p_j(0)-\frac15\right).
\]
This follows uniquely because the 5D permutation representation is the direct sum of a trivial line and an irreducible real four-space, so an \(S_5\)-equivariant real Markov generator must be a scalar on the four-space; its scalar rate is fixed by the already derived \(3/4\) discrete eigenvalue. It is an honest, fully solvable **law of the specified history model**. The operational identification of \(u\) with physical log-distance remains a separate empirical condition.
