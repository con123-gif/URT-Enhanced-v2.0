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

## 4. Exact Rallis substitution and retained covariance

Use D from (D4) for the SAME height-reduced data d(x,x') in the
already proved absolute unfolding. Its scalar has modulus one,
so all two-majorant estimates are unchanged, and the clean graph
proof applies to it. Equation (D5) gives the doubled theta
product; (D8) gives the graph coefficient. Consequently the
single V-normalized Rallis identity has exactly the original
f,f',y,y',T and theta lifts, with no unknown graph/product phase.

The action covariance needed before applying (D5) is the exact
native sign-change Weil law

    N Omega_(a0,b0)(g,h)
      =Omega_(a0^(-1)upsilon^n,b0^(-1)upsilon^M)(g.neg,h) N.

Here n=rank(S), M=rank(T), and upsilon is the native unitary
determinant character. The actual source names this
pairWeil_negSource. Together with the orthogonal block Weil law,
it is the retained representation-construction input. Rescaling
D by (ab)^(-1) preserves this law exactly. In particular product
and graph normalization above do not assert this sign-change
Weil law solely from Heisenberg covariance, which would leave
a possible adelic character. Its finite multiplier and real
complementary-minor identity retain their separate supplier audit.

Thus the common normalized theta functional proves the required
product/graph scalar compatibility, while the remaining exact
Weil covariance is stated at the strength actually used. The
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

RESUME HERE: audit (D6)–(D8) together with the common supplier,
then finish the retained sign-change Weil multiplier and exact
finite dual-datum supplier audits. Noncoherent pair estimates
and A/C primitive obligations remain separate.
