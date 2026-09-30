# Newton's Cathedral / URT v123 — Mathematical Endpoint: Scale-Orbit and Residual-Moduli Theorem
Date: 2026-09-12

## Result

The v122 problem was to derive the remaining finite-Dirac invariant
\[
x=\frac{c_M}{\Lambda^2}
\]
from the four-sheet, Hopf, KO-6 and URT structures.

The answer is now exact:

\[
\boxed{\text{the present axioms cannot select }x.}
\]

This is not a failure to search for another identity.  There is a continuous
positive rescaling symmetry of every currently retained microscopic condition.

## 1. Four-sheet scale orbit

The unique four-sheet operator is unique only up to scale:
\[
\boxed{
D_\square(\lambda)=\lambda(J_4-I_4),\qquad \lambda>0.
}
\]

Its spectrum is
\[
\lambda(3,-1,-1,-1).
\]

Changing \(\lambda\) preserves:

* \(D_4\) triality;
* \(A_4\) covariance;
* the \(4+12\) zero-form/one-form calculus;
* the first-order left-right condition;
* every \(A_5\) representation multiplicity;
* the \(1+9+6\) trace/quadrupole/rotation split.

Thus the finite differential geometry fixes shape, not absolute internal
Dirac scale.

## 2. Exact internal metric and why it still does not select the scale

For the four-point spectral geometry,
\[
D_\square=\lambda(J_4-I_4),
\]
the Connes distance between any two distinct sheet states is

\[
\boxed{
d_\square(i,j)=\frac{1}{\sqrt2\,|\lambda|}.
}
\]

Proof: fix \(a_i-a_j=1\).  By convexity of the commutator norm and the
stabilizer symmetry of the two remaining sheets, an optimizer may be taken as
\[
a=(1/2,-1/2,0,0)
\]
up to permutation and addition of a constant.  Then
\([J_4-I_4,a]\) has nonzero singular values \(\sqrt2,\sqrt2\).  Restoring
\(\lambda\) gives the displayed distance.

So \(\lambda\) has a precise geometric meaning: it is the inverse internal
sheet-distance scale.  But no current axiom specifies that distance in units
of the continuum cutoff \(1/\Lambda\).

## 3. Hopf and KO-6 cannot break the orbit

The Hopf data fix normalized phase and topology:
\[
c_1=\pm1,\qquad
\oint\alpha_H,\qquad
Q_H\in\mathbb Z.
\]
They do not fix an operator norm.

Likewise the retained KO-6 completion satisfies its self-adjointness, grading
and real-structure signs for an arbitrary complex finite block \(M\).
Therefore
\[
M\mapsto sM,\qquad s>0
\]
does not violate KO-6 kinematics.

Topology fixes orientation classes; it does not fix a positive mass scale.

## 4. KMS entropy cannot break the orbit

The exact entropy action obeys
\[
\boxed{
S_{\beta/s}(sD)=S_\beta(D)
}
\]
for every \(s>0\).

For fixed \(\beta\), the exact KMS entropy is strictly decreasing under a
positive overall Dirac rescaling and has no nonzero finite stationary scale.

Therefore entropy fixes the cutoff function and its moment ratios, but cannot
separately determine the inverse KMS scale and the Dirac normalization.

## 5. URT cannot break the orbit in its proved selector form

The proved target-blind URT selector acts through spectral ratios/condition
numbers.  Those quantities obey
\[
\kappa(sD)=\kappa(D).
\]

Hence the exact scale-free contraction rule can select *shape parameters*
inside a normalized operator family, but cannot distinguish
\[
D\quad\text{from}\quad sD.
\]

So four-sheet symmetry, Hopf topology, KO-6, KMS entropy and the proved URT
selector all leave the same positive scale orbit.

## 6. Consequence for the one-action gravity/gauge ratio

For a nonnegative rank-one finite-Dirac invariant \(x\), v122 gave
\[
\boxed{
R(x):=
\frac{G\Lambda^2}{g_U^2}
=
\frac{f_0}
{\pi(32f_2-f_0x/3)}
}
\]
with
\[
f_0=\ln2,\qquad f_2=\frac94\zeta(3).
\]

Positivity of the Einstein coefficient requires
\[
\boxed{
0\le x<x_{\rm crit}
=
\frac{96f_2}{f_0}
=
374.587531139813.
}
\]

Moreover
\[
\boxed{
R'(x)=
\frac{f_0^2}
{3\pi(32f_2-f_0x/3)^2}>0.
}
\]

Therefore the exact one-action family obeys the lower bound
\[
\boxed{
\frac{G\Lambda^2}{g_U^2}
\ge
\frac{\ln2}{72\pi\zeta(3)}
=
0.00254928308917722.
}
\]

Equivalently
\[
\boxed{
\frac{G\Lambda^2}{\alpha_U}
\ge
\frac{\ln2}{18\zeta(3)}
=
0.0320352360995194.
}
\]

The ratio diverges as \(x\to x_{\rm crit}^{-}\).

So even though \(x\) is not selected, the one-action hypothesis plus a
nonnegative rank-one finite invariant gives an exact monotonic family and an
exact lower bound.

## 7. The bare vacuum ratio does not secretly select x

For the rank-one family \(d_M=x^2\), the bare spectral vacuum-to-Einstein ratio is
\[
L(x)=
12\,
\frac{48f_4-f_2x+(f_0/4)x^2}
{96f_2-f_0x}.
\]

Its stationary points are
\[
x_\pm=
\frac{
96f_2\pm8\sqrt{3f_0f_4+138f_2^2}
}{f_0}.
\]

Numerically,
\[
x_-=\boxed{-2.967189279754}<0,
\qquad
x_+=\boxed{752.142251559381}>x_{\rm crit}.
\]

Hence there is no stationary point in the physically allowed interval
\[
0\le x<x_{\rm crit}.
\]

The bare ratio is strictly increasing there.  It therefore cannot provide a
hidden positive-scale selector.

In any case the independent volume-counterterm theorem already prevents this
bare vacuum coefficient from being a physical cosmological-constant
prediction.

## 8. Several equally natural normalizations give different answers

Even if one additionally identified a rank-one Majorana scale with the
four-sheet hopping \(\lambda\), there is still no canonical identification of
the cutoff \(\Lambda\).

For example:

\[
\Lambda=\lambda
\quad\Rightarrow\quad
\lambda^2/\Lambda^2=1,
\]

\[
\Lambda=d_\square^{-1}=\sqrt2\lambda
\quad\Rightarrow\quad
\lambda^2/\Lambda^2=\frac12,
\]

\[
\Lambda=\sqrt{\operatorname{Tr}D_\square^2/4}
=\sqrt3\lambda
\quad\Rightarrow\quad
\lambda^2/\Lambda^2=\frac13,
\]

\[
\Lambda=\|D_\square\|=3\lambda
\quad\Rightarrow\quad
\lambda^2/\Lambda^2=\frac19.
\]

All four conventions respect the same symmetry and finite calculus.  Choosing
one is a normalization axiom, not a consequence of v120-v122.

## 9. A second independent residual datum: the chiral measure

The even spectral action is orientation blind.  The vectorlike KO-6
completion contains conjugate blocks and its full determinant removes the
orientation phase.

The determinant-line/Pfaffian analyses likewise prove that topology fixes the
zero divisor/winding but does not select the local chiral-measure
trivialization coefficient.

So a physical chiral fermion measure still requires a derived microscopic
regulator/trivialization or an additional datum.  It is logically separate
from the positive scale orbit above.

## 10. Mathematical endpoint

The exact finite structure has now been pushed until the deduction stops.

The current axioms determine:

\[
\boxed{
D_6\supset D_4,\quad
D_4^\*/D_4\rtimes C_3=A_4\subset A_5,
}
\]

\[
\boxed{
\Omega^0=4,\qquad
\Omega^1=12,
}
\]

\[
\boxed{
16=4_{\rm geometry}+12_{\rm gauge}
=1_{\rm scalar}+9_{\rm quadrupole}+6_{\rm rotation},
}
\]

\[
\boxed{
4_g+1_Y+3_W+(3'+5)_C,
}
\]

the Hopf/Hodge orientation structure, the KMS cutoff moment ratios, and the
one-trace gravity/gauge relation.

But the exact solution space still carries a positive normalization orbit.
No theorem made solely from the presently retained axioms can select a point
on that orbit.

Therefore:

\[
\boxed{
\textbf{the end of the current mathematics is a one-parameter scale orbit,
not a unique numerical }x.
}
\]

Breaking that orbit requires genuinely new information: a microscopic
length-normalization axiom, an exact new scale-generating dynamics, or one
dimensionful empirical calibration.

Assigning a numerical \(x\) without one of those would not be finishing the
mathematics; it would be adding an unstated premise.