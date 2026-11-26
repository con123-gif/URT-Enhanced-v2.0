# Finite Weil composition: the quotient, phase and four-orbit sign

26 November 2026. Human derivation from the pinned source; independent
mathematical audit and native replay pending. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Source
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/Lib/Weil/Construction/ThetaFunctional.lean`, blob
`b21b5f01564922bbd2ed309ef614111698b2384a`, through `finAction`.
Also `GaussSumSign.lean`, blob
`566ee1f28f107f6ad7374661ffbdadcae36abafc`, and the source files
`FiniteHeisenberg`, `FiniteVacuum`, `FiniteMultiplier`,
`WeilOperators`, `Lib/General/Algebra/InertResidue`,
`Lib/Adelic/Adeles/{CoprimeValuation,LocalComponents}` and
`Lib/General/NumberTheory/UpsilonValues`.

Prior work: structure RUN61 / 825590bb supplies the exact finite
vacuum coefficient and retains this composition law. The semilinear
comparison at 2ce507a2 uses the normalized action. We prove the law
from the actual WeilData conditions, not from a coefficient's norm.
We do not prove existence of all the global WeilData in this note.

## 1. Data and the projective operators before the conclusion

Let E be the actual CM field, A its finite adeles, O its integral
adeles, and Lambda=O^n with Haar mass one. Write h(x,y)=bar(x)^T y.
The source character psi=psi0 has

\[
 \psi(\bar z)=\psi(-z)=\overline{\psi(z)},\quad
 \{z:\psi(zO)=1\}=O.                                         \tag{1}
\]

The second equality is the exact different-ideal normalization in
WeilData, not a choice of an unnormalized character. Let c0 be its
integral trace-one element, c0+bar(c0)=1, and put

\[
 \beta(x,y)=\psi(\tfrac12 h(y,x)),\quad
 s(x)=\psi(\tfrac12c_0h(x,x)),\quad
 e(x)={\bf1}_\Lambda(x)s(x).
\]

Here 1/2 is an element of A; we do not assert it integral at 2.
Direct expansion, (1) and integrality of c0 give

\[
 s(x)s(y)\beta(x,y)=\psi(\bar c_0h(y,x))s(x+y),\qquad
 s(z)^2=1\quad(z\in\Lambda).                                \tag{2}
\]

Self-duality (1), coordinate by coordinate, says Lambda is its own
annihilator for h and psi. Integrating a character on Lambda thus
gives its indicator. Applied to (2), this is the reproducing-vacuum
convolution identity used to define the source model and the
projective operators T_g. It also gives e(0)=1, so the model is
nonzero. These assertions involve the Heisenberg representation,
not the as-yet-unproved multiplicativity of T_g.

Let Delta(g) be the SAME finite multiplier defined by a saturating
matrix u with uLambda=Lambda intersect g^{-1}Lambda. The already
derived Sat identities give

\[
 |\Delta(g)|^2=[\Lambda:\Lambda\cap g^{-1}\Lambda],\quad
 \Delta(g^{-1})=\overline{\Delta(g)},\quad \Delta(g)\ne0.       \tag{3}
\]

They also give bi-invariance under the integral unitary group K,
and multiplication on factors with disjoint conjugation-stable
supports. Define the scalar c(g,s), before claiming it is one, by
the vacuum double integral

\[
 c(g,s)=\Delta(g)\Delta(s)\overline{\Delta(gs)}
   \iint e(sx)e(gsy)\beta(x,y)e(x+y)\,dy\,dx.                 \tag{4}
\]

The reproducing identity and change of variables give the source
triple-operator identity. When c(g,1)=1 it gives
T_g T_s=c(g,s)T_(gs) and preservation of the model inner product
by T_g. We establish c(g,1)=1 below before using either conclusion.

## 2. The exact finite quotient and phase

Set

\[
 M=\{(x,y):x+y\in\Lambda,\ sx\in\Lambda,\ gsy\in\Lambda\},
 \quad M_0=M\cap(\Lambda\times\Lambda),\quad Q=M/M_0.
\]

These are O-modules. M is a compact open additive subgroup: it is
a closed subgroup of the compact open lattice
s^{-1}Lambda times (gs)^{-1}Lambda, and all three conditions are
open. M0 is open in M, so Q is finite. Since x,y in Lambda already
imply x+y in Lambda,

\[
 M_0=(\Lambda\cap s^{-1}\Lambda)
          \times(\Lambda\cap(gs)^{-1}\Lambda).
\]

Unitary matrices preserve h, hence s(sx)=s(x) and s(gsy)=s(y).
By (2), the integrand in (4) is exactly

\[
 {\bf1}_M(x,y)\psi(\gamma(x,y)),\qquad
 \gamma(x,y)=\bar c_0h(y,x).                                 \tag{5}
\]

The phase F=psi gamma descends to Q. Indeed for (a,b) in M0 its
change is bar(c0)[h(b,x)+h(y,a)+h(b,a)]. Here
h(b,x)=h(b,x+y)-h(gsb,gsy) and
h(y,a)=h(x+y,a)-h(sx,sa), so every term is integral. Equation (1)
therefore kills the change. Representatives can be chosen arbitrarily
when writing gamma(q); the phase, rather than gamma itself, is
well-defined. We have F(0)=1, and for all t in O,

\[
 F(tq)=\psi(\bar t t\gamma(q)).                              \tag{6}
\]

Furthermore

\[
 ts^{-1}\text{ integral}\quad\Longrightarrow\quad tQ=0.       \tag{7}
\]

For tx=(ts^{-1})(sx) is integral, and
ty=t(x+y)-tx is integral; thus t(x,y) belongs to M0.

The compact support in (5) justifies the double integral absolutely.
Each M0-coset has mass |Delta(s)|^{-2}|Delta(gs)|^{-2}, by (3).
Substitution in (4) gives the EXACT equation

\[
 c(g,s)\overline{\Delta(s)}\Delta(gs)
       =\Delta(g)\sum_{q\in Q}F(q).                         \tag{8}
\]

In particular no square root, lattice index or conjugate has been
discarded. Each F(q) is a root of unity: some positive integer
clears the finite-adelic denominator of gamma(q) into O, and (1)
then makes that power of psi gamma equal one.

## 3. Normalize at K, then obtain the radical subgroup

If s is integral unitary, s^{-1} is integral too. Take t=1 in
(7): Q=0, and sum F=1. Bi-invariance of Delta gives
Delta(s)=1 and Delta(gs)=Delta(g), so (8) gives c(g,s)=1.
This includes s=1, establishing the normalization required above.

The triple-operator calculation therefore now gives the projective
composition law and unitarity. Applying it to a nonzero vacuum
shows |c(g,s)|=1 for all g,s. Associativity of T gives the usual
cocycle identity. Consequently

\[
 R=\{s:c(g,s)=1\text{ for all }g\}
\]

is a subgroup: in the cocycle identity, s,t in R imply st in R;
putting t=s^{-1} and using the identities with second argument s
gives the inverse condition. We have proved K<=R. No conclusion
about a general s has yet been used in proving unitarity or this
subgroup statement.

It suffices to put every element supported on {w,bar w} in R.
Every finite adelic unitary matrix is integral outside a finite set;
cutting off one whole conjugate orbit at a time writes it as a
finite product of these elements and a member of K. The matrix cut
preserves unitarity because its support idempotent is self-adjoint.

For each local calculation below, g may be replaced in the multiplier
ratio in (8) by its component g0 on {w,bar w}. Indeed write g=g0 b
with b trivial there; b commutes with s, and disjoint-support
multiplicativity cancels Delta(b) from Delta(g)/Delta(gs).

## 4. Split place: force the entire sum positive

Suppose w!=bar w and s is supported on this pair. First assume
(s^{-1})_w is integral. Let t be the integral idempotent equal to
zero at bar w and one elsewhere. Then ts^{-1} is integral, so
tQ=0 by (7), and q=(1-t)q. But bar(1-t)(1-t)=0. Equations (6)
and F(0)=1 give F(q)=1 for EVERY q. Thus sum F=#Q>0.

For a pair-supported unitary h, let a_h be its GL matrix at w,
extended by one elsewhere. The exact Sat/star identity gives

\[
 \Delta(h)=P_h\overline{\chi(\det a_h)},\quad
 P_h=|\Delta_{GL}(a_h)|^2>0,
 \quad \chi=\upsilon|\cdot|^{-1/2}.
\]

Since chi is a character and a_(g0 s)=a_g0 a_s, its phases in (8)
cancel to give

\[
 \frac{\Delta(g_0)}{\overline{\Delta(s)}\Delta(g_0s)}
       =\frac{P_{g_0}}
         {P_sP_{g_0s}|\chi(\det a_s)|^2}>0.
\]

Therefore c(g,s)>0. With |c(g,s)|=1 this proves c(g,s)=1 for
every g, i.e. s belongs to R under the inverse-integrality condition.

Remove that condition without assuming s integral. Over the local
DVR take u=pi^a I with a sufficiently large integer, so both u and
(s^{-1})_w u are integral. Let k be the pair-supported unitary with k_w=u^{-1}.
Then (k^{-1})_w=u and ((ks)^{-1})_w=(s^{-1})_w u are integral.
The case just proved puts k and ks in R. Since R is a subgroup,
s=k^{-1}(ks) belongs to R. This includes all split places above 2.

## 5. Fixed place: check the finite-field and local-unit guards

Suppose w=bar w. The actual StablyUnram condition is the presence
of a primitive 5040-th root, NOT an unspecified unramifiedness
assertion. It gives a primitive 28-th root theta, and the integral
elements

\[
 i=\theta^7,\qquad \omega=\theta^2-\theta^4-\theta^8,
 \quad i^2=-1,\ \bar i=-i,\
 \omega+\bar\omega=1,\quad\omega\bar\omega=2.               \tag{9}
\]

For completeness, x=theta^2 has order 14 and
Phi_14(x)=x^6-x^5+x^4-x^3+x^2-x+1=0. Using x^7=-1, expansion
gives omega+bar omega=1 and
omega^2-omega+2=2Phi_14(x)=0, which proves (9).

A fixed place cannot have residue characteristic two: otherwise
omega bar omega=2 would put one factor in its maximal ideal, and
conjugation-invariance would put both there, contrary to their sum
one. Thus 2 is a unit. In its residue field k, i is not fixed by
conjugation. If k0 is the fixed field, then k=k0+i k0 by the two
explicit coordinates (z+bar z)/2 and (z-bar z)/(2i). Hence
#k=r^2 for r=#k0. The fixed field does not contain a square root
of -1 (its only possibilities in k would be +/-i). The cyclic
multiplicative group of the finite field therefore gives r=3 mod 4.

We also need a unit of local norm -1, to prove a real Gauss sum.
The involution acts nontrivially on the residue field, so the local
degree-two extension over its fixed field is unramified. The residue
norm k^*->k0^*, z->z^(r+1), is onto. Lift a preimage of -1 to a
unit a; then (-1)/Norm(a) belongs to 1+the maximal ideal in the
fixed field. Hensel's lemma at 1, with derivative 2 a unit, gives
a square root b of this ratio in that field. The unit eta=ab has
Norm(eta)=-1. This checks all hypotheses for that local norm use.

## 6. Four orbits force the sign +1

Now s is supported on the fixed place w. Equation (7), with the
idempotent of the complement of w, shows Q is supported at w.
Since 2 is invertible there, Q has no nonzero two-torsion.
Multiplication f(q)=iq satisfies f^2(q)=-q, and (6) with bar i i=1
gives F(f(q))=F(q). Every nonzero f-orbit has exactly FOUR elements.
Indeed a shorter orbit would force q=-q and hence q=0.

It follows that

\[
 S=\sum_qF(q)=1+4Z,
 \qquad Z\text{ an algebraic integer}.                       \tag{10}
\]

Here Z is a sum of roots of unity, one per nonzero orbit; division
by 4 is justified by the orbit partition, not by integrality of 1/4.
The unit eta from section 5 permutes Q and, by (6), carries F to
its complex conjugate. All phases off w are trivial because Q is
supported at w. Thus S is real.

The SAME source splitting character has upsilon(uniformizer_w)=-1
at a fixed place. By the local Sat formula and #k=r^2,
Delta(h)=(-r)^d_h with d_h>=0 for every h supported there.
After the disjoint-support cancellation for g, equation (8) is
therefore

\[
 c(g,s)\,R^a=S R^b,
 \quad R=-r\equiv1\pmod4,\quad a,b\ge0.                    \tag{11}
\]

Since S is real and |c|=1, c is +1 or -1. If c=-1, (10)–(11)
make

\[
 R^b Z=-(R^a+R^b)/4
\]

a rational algebraic integer, hence an ordinary integer. This is
impossible because R^a+R^b=2 mod 4. Thus c=1. We have put every
fixed-place-supported s in R, as required.

Together with sections 3–4 this proves c(g,s)=1 for all finite
adelic unitary g,s. The actual normalized finite Weil operators
therefore satisfy T_g T_s=T_(gs), with their original Delta and
their exact lattice Haar measure.

## 7. Actual callers and limits of this substitution

This is the missing composition law of `stdLattice.finProjAction`,
so it supplies `finAction` in ThetaFunctional and the finite part
of `adelicAction`. It also justifies use of the SAME normalized
omega in the finite-vacuum coefficient and semilinear comparison:
the coefficient 1/conj Delta and multiplier sigma(Delta)/Delta
are retained exactly. Nothing is inferred from unitarity alone.

The archimedean multiplier/action, global theta-functional existence
and Poisson summability, construction of the actual global WeilData
and splitting character, the CM theorem, and the theta-space and
local-jet suppliers retain their separate proofs and audits. This
note does not supply the Rallis or Selmer inputs and does not prove
the final RH statement. In particular StablyUnram, self-duality and
the inert sign of upsilon were used precisely, rather than dropped
as harmless background.

Validation: exact native source/definition reads, human quotient and
phase calculations, and `git diff --check`. No new Lean execution,
certificate success, transitive axiom audit or full reconstruction
verification is claimed.
