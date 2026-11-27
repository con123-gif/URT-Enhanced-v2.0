# The common theta pairing fixes the doubling and graph scalar

27 November 2026. Human derivation under explicit native model laws;
independent audit and replay pending. Credit Alpöge, Sernau,
Anthropic collaborators and Claude. Compact source
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/`.

This continues the actual Rallis caller after the stable-range
supplier and clean graph proof. It derives the product/graph
normalization from the SAME normalized global theta pairing.
All external spaces, input data, theta functionals, automorphic
functions and row witnesses are unchanged. The auxiliary doubled
datum in the proof has a single unit scalar fixed once for S,T.

## 1. Exact background and notation

Let W=Hom(S,T), Wminus=Hom(Sminus,T), and Wdouble their orthogonal
sum, with their actual rational lattices. Native box product is
bounded bilinear, takes the two vacuum vectors to the doubled
vacuum, and intertwines the Heisenberg actions. The rational
lattice and probability additive quotient of Wdouble are the
product of those of W and Wminus. These statements follow from
the block Gram and block frame, the product vacuum and Fubini;
no separately normalized quotient volume is inserted.

Use the already derived normalized theta functional on each space:

    mean_(W/Gamma) theta(rho(y)f) conjugate(theta(rho(y)g))
       = <g,f>.                                             (D1)

The global-functional note proves (D1), bounded rational-invariant
functional uniqueness and reproduction. Coefficients c_f in that
reproduction are the underlying Model functions; native Space
point evaluation is instead theta(rho(y)f). Keep these distinct.

Let u be the source finite integral unit of norm -1, and let
c=(1,u) be normNegOneIdele (its real part is 1). Then
Sminus.J=-S.J and Sminus.x=c S.x. The native negation map N
on data is conjugate-linear and transports coefficient functions
by Y->c^(-1)Y. It preserves the vacuum and Hilbert norm and
intertwines rho(y) with rho_minus(cy).

Its rational-lattice compatibility is exact. The native standard
coordinates of a rational map Z on Wminus are

    T.x^(-1) Z Sminus.x = c T.x^(-1) Z S.x.

Multiplication by c^(-1) takes them to those of the SAME rational
Z on W. The norm-negative-one relation conjugates the Heisenberg
bicharacter; its integral-unit condition preserves finite support.
This is the concrete content of negSource and its Std transport,
not a claim that the finite adele u itself is rational.

## 2. Determine both unit scalars, once

For fixed g on Wminus, f->theta_double(box(f,g)) is a bounded
rational-invariant functional on W. Uniqueness makes it a scalar
multiple of theta_W. The scalar is a bounded functional of g;
invariance in its rational lattice makes it a multiple of
theta_minus. Therefore there is one constant a with

    theta_double(box(f,g))=a theta_W(f) theta_minus(g).        (D2)

It is nonzero: if a=0, theta_double vanishes on all box products.
Those are total, since every Heisenberg translate of the doubled
vacuum is a box product, and reproduction makes their span dense.
This would contradict theta_double!=0.

In fact |a|=1. Apply the normalization (D1) to the doubled vacuum.
Its translates split as boxes. Substituting (D2) into the mean on
the product additive quotient and applying (D1) separately in
each factor gives 1=|a|^2. This does not require theta(vac)!=0.

Likewise conjugate(theta_minus(Nf)) is a bounded linear rational-
invariant functional on W. The exact lattice transport above,
the normalized pairing and the Hilbert isometry of N show that
it is normalized. Uniqueness therefore supplies one b, |b|=1,
such that

    theta_minus(Nf)=b conjugate(theta_W(f)).                  (D3)

Define the auxiliary bilinear doubling map by

    D(f',f)=(ab)^(-1) box(f,Nf').                             (D4)

It is conjugate-linear in f', linear in f, bounded, with the same
norm as raw box composition. Equations (D2)–(D3) now give EXACTLY

    theta_double(D(f',f))=theta_W(f) conjugate(theta_W(f')).   (D5)

The unit ab is fixed by the three pre-existing theta functionals.
It never depends on f,f', a group element, a graph or a local
prime. In the native canonical product convention a=1, as proved
there using the chosen line-theta normalization. The final Rallis
statement does not mention D, so its human proof can use (D4)
and avoid making that additional canonical phase lemma a premise.
Equivalently D=a^(-1) times the native doubleDatum. Clean-support
vanishing and all norm bounds are preserved. This changes no
theta lift or determinant row at an external caller.

## 3. Diagonal graph is the normalized theta pairing

The graph Gamma_1 has rational frame k=(I;-I), with companion
l=(I;I)(1/2)J_S^(-1). The induced Hom first isotropic frame,
in rational matrix coordinates, sends its parameter Z to the
S-and-Sminus map with BOTH blocks

    Y=J_T^(-1) Z J_S.                                      (D6)

Indeed k*J_double=[J_S,J_S], and the induced frame is
J_T^(-1) tensor (k*J_double)^transpose. The map Z->Y is an
invertible RATIONAL linear map. It induces an automorphism of
the additive adelic/rational quotient, preserving its probability
Haar measure. No local determinant/covolume factor survives.

In native standard coordinates the second block is c times the
first, exactly as required by N rho(y)=rho_minus(cy) N. By (D5),
Heisenberg covariance and the actual zeroTerm_apply definition,

    E_Gamma_1 D(f',f)
       = mean_y theta_W(rho(y)f) conjugate(theta_W(rho(y)f'))
       = <f',f>.                                           (D7)

The last equality is precisely (D1). It fixes the graph scalar
and the conjugation order at the SAME time as the product scalar.
Every integrand is continuous on the compact additive quotient.

For an isometry delta in U(S)(F), use k=(delta;-I).
The two blocks of the induced Hom map are now

    (Y delta^(-1),Y),

because delta*J_S=J_S delta^(-1). Rational theta invariance and
Weil–Heisenberg covariance give

    theta_W(rho(Y delta^(-1))f)
       =theta_W(rho(Y) Omega(delta^(-1),1)f).

Apply (D1) again. Thus

    E_Gamma_delta D(f',f)=<f',Omega(delta^(-1),1)f>.           (D8)

The source automorphic determinant characters are trivial on
rational delta, so (D8) is the source weilMatrixCoeff with the
correct delta^(-1), for every b. The factors 1/2 in the companion
frame and the inverse in the graph label have not been dropped.

## 4. The graph trace fixes the ENTIRE target action phase

The previously retained sign-change/block Weil covariance can
also be avoided at this consumer. The argument uses the same
graph zero term just normalized, with no all-adelic multiplier
comparison. Here are all functional-analytic details.

The Hilbert inner product of box products is the product inner
product, by Fubini on the coefficient model. N is antiunitary
and ab is a unit. Therefore (D4) extends to a UNITARY map
from H_W tensor conjugate(H_W) onto H_double, where H denotes
the Hilbert completion of dataInner. Surjectivity follows from
the dense Heisenberg orbit of the doubled vacuum and its box
factorization. No equivalence of Banach tensor norms is needed.

Fix h in U(T)(A), and let U_h=pairWeil(S,T,a0,b0,(1,h)) on W,
with the original arbitrary automorphic characters. It is
unitary. Define C_h on H_double through this tensor unitary by

    C_h D(f',f)=D(U_h f',U_h f).

This is a well-defined Hilbert unitary. It implements the same
Heisenberg automorphism as native splitWeil_double(1,h): on
both Hom blocks the parameter is left multiplied by h. For
the second factor use only N rho(y)=rho_minus(cy) N and the
fact that scalar c commutes with h; no formula for N U_h is
assumed. Thus the two target operators differ by one scalar:

    splitWeil_double(1,h)=lambda(h) C_h,  |lambda(h)|=1.

The scalar conclusion follows from Heisenberg irreducibility.
One need not assume C_h preserves the full native Banach space:
the bounded Hilbert form <v,Rw> for their ratio R is bounded
on native data and Heisenberg-invariant, so the prior invariant-
form lemma makes R scalar on its dense Hilbert domain. On the
finite box tensors used below both images are native data.

Now the ACTUAL `mixedValue_splitWeil` at X=0 gives

    E_Gamma_1 splitWeil_double(1,h)=E_Gamma_1.

It is a mixed-model zero-term covariance from PairSplitting,
available before Siegel–Weil or Rallis; it does not use either
formula or pairWeil_negSource. Apply it and the scalar relation
to D(e,e). By (D7) and unitarity,

    1 = E_Gamma_1 D(e,e)
      = lambda(h) E_Gamma_1 D(U_h e,U_h e)
      = lambda(h) <U_h e,U_h e> = lambda(h).

Consequently, for EVERY h and EVERY f,f',

    splitWeil_double(1,h) D(f',f)=D(U_h f',U_h f).             (D9)

The identity first holds in the Hilbert completion; both vectors
are native data, and its inner product is nondegenerate there,
so it is equality in the actual native datum space. The same
nonzero graph trace fixes every target phase, without assuming
it trivial merely because it is trivial on rational elements.

### 4.1 Independent audit: a direct native proof, now preferred

Audit commit 75a3faea1193da9661ccabbf6cb98aa1aa4eeaa9,
`audit/2026-11-27_GRAPH_ZERO_TERM_SEPARATION.lean`, was read
in full. It agrees on D6–D8 and independently proves D9 by
the following simpler argument on the ACTUAL datum space.
Use this proof for D9; the Hilbert argument above is an
alternative and its tensor construction is no longer a premise.

The family of functionals E_Gamma_1 rho_double(t), for ALL
adelic Heisenberg parameters t, separates native data. To see
this let every such value on w be zero. For arbitrary z,
Heisenberg multiplication makes all these values on rho(z)w
zero too. Each mixed term in the exact rational expansion
hasSum_theta_sourceTerm is one of these functionals, so
theta_double(rho(z)w)=0 for all z. The normalized theta
pairing then gives <w,w>=0; positive definiteness gives w=0.
No injectivity of the SINGLE evaluation E_Gamma_1 is asserted.

Let A_h=splitWeil_double(1,h), v=D(f',f), and
v_h=D(U_h f',U_h f). For arbitrary t=(y,z) let t0=h^(-1)t
be the inverse target action on each Hom block. Exact native
covariance and E_Gamma_1 A_h=E_Gamma_1 give

    E_Gamma_1 rho(t) A_h v = E_Gamma_1 rho(t0) v.

Box/negation Heisenberg covariance, (D7), commutation of scalar
c with h and unitarity of U_h give the same equality for v_h:

    E_Gamma_1 rho(t) v_h
      = <rho(c^(-1)z)U_h f', rho(y)U_h f>
      = <rho(c^(-1)z0)f', rho(y0)f>
      = E_Gamma_1 rho(t0) v.

Consequently

    E_Gamma_1 rho(t) [A_h D(f',f)-D(U_h f',U_h f)] = 0
                                            for EVERY t.   (D10)

The separating-family result proves D9 directly. This removes
the Hilbert tensor realization, commutant scalar and scalar
phase comparison from the preferred proof. Its remaining
inputs are exactly the normalized theta pairing, exact mixed
sum, graph pairing, Heisenberg covariance and zero-term target
law already used here. The independent audit is conditional
on these same native model laws; its generic Lean bridge is
prepared, not compiled. It is not an independent audit of
the common convergence estimates or the complete RH proof.

## 5. Exact Rallis substitution and remaining background

Use D from (D4) for the SAME height-reduced data d(x,x') in the
already proved absolute unfolding. Its scalar has modulus one,
so all two-majorant estimates are unchanged, and the clean graph
proof applies to it. Equation (D5) gives the doubled theta
product; (D8) gives the graph coefficient. Consequently the
single V-normalized Rallis identity has exactly the original
f,f',y,y',T and theta lifts, with no unknown graph/product phase.
For the doubled theta product under h use (D9) followed by
(D5). Original source and target actions commute, so U_h passes
through each height-reduced source action; rational eta is
removed by the original rational theta invariance. For the
graph integral use (D8) and the original pair unitarity. Thus
no doubled block Weil or sign-change Weil formula is needed
in this replacement proof.

For comparison the original source proves the stronger explicit
sign-change Weil law

    N Omega_(a0,b0)(g,h)
      =Omega_(a0^(-1)upsilon^n,b0^(-1)upsilon^M)(g.neg,h) N.

Here n=rank(S), M=rank(T), and upsilon is the native unitary
determinant character. The source names it pairWeil_negSource.
We have not independently proved this stronger formula for N.
The final Rallis consumer instead uses the now-proved (D9).
Its scalar is fixed by graph trace INVARIANCE, in addition to
Heisenberg covariance, so no possible adelic character is
silently dropped. Other consumers of pairWeil_negSource retain
their original supplier and audit; no native graph is deleted.

Thus the common normalized theta functional proves the required
product, graph and full target scalar compatibility at this
caller. The retained representation input is the original
Weil–Heisenberg covariance and unitarity, and the exact
mixed-model target zero-term law, all already used by the
common stable-range bridge. The
sharp finite cutoff remains the explicit datum construction,
with its finMultiplier and conductor check; it is not replaced
by multiplying an arbitrary matrix coefficient by an indicator.

## Provenance and status

Source bodies inspected at the pin:
`Lib/Weil/Construction/PairDefs.lean` (Model versus Space point
evaluation, normalized theta, dataInner);
`Lib/Adelic/Witt/SpaceOperations.lean` (normNegOneIdele, neg, sum);
`Lib/Weil/MixedModel/NameWeilAction.lean` (Std.map and rho);
`Lib/Weil/DualPair/PairSumNegation.lean` (theta product,
exists_theta_negSource, pairWeil_negSource);
`Lib/Weil/MixedModel/ZeroTerm.lean` (zeroTerm_apply);
`Lib/SiegelWeil/RallisInner/SharpData.lean` (doubleDatum,
graphSplitting, graph evaluation and actual Rallis caller).
The exact definition of the auxiliary D is an allowed proof
choice for the identical final Rallis theorem, not a new
normalization of an original row or lift. Native source unchanged.
No Lean execution or independent full audit claimed.

RESUME HERE: audit (D6)–(D9) together with the common supplier,
then finish the exact finite dual-datum supplier audit.
No new sign-change/block Weil audit is required at THIS Rallis
consumer after (D9); other consumers keep their dependencies.
Noncoherent pair estimates
and A/C primitive obligations remain separate.
