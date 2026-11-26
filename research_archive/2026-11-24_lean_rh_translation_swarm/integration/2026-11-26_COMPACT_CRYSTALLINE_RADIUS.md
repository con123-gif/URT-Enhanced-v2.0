# The quantitative crystalline radius at the long-gap caller

26 November 2026. SOURCE-MATCHED HUMAN DERIVATION / independent audit
pending. This supplies the previously retained quantitative part of
FrameTheorem, not a new RH endgame. Source and credit: Levent Alpöge,
Luke Sernau, Anthropic collaborators and Claude; compact
`lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`, Lean 4.35.0,
Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.

Prior suppliers: period-basis construction and exact Ax bridge in
`2026-11-26_COMPACT_PERIOD_BASIS_AND_INVERSE.md` (34b26ecb), determinant
descent in ce3f88d1, integral span/retraction in literature RUN58, and
the independently audited coefficient correction in 1b2053e9. The
radius argument itself was still explicitly retained in all these.

## 1. Statement with the actual data

Keep A0=A_inf, A=A_max, B=B_max^+, S=c.S and S_B=c.bicommutant.
Let the chart have ramification e, coefficient ring Λ=W(F_(p^f)),
z=[varpi^flat] and E=p+z r_E, r_E∈S. Its defining identity also makes
z^e a multiple of p in A. Assume:

- t∈G_Qp fixes Λ and θ(z), and t(z)=[ε]z;
- Z has entries in S_B, Z'Z=E^h I, and tZ=ZG with G integral over A0;
- l≥0 satisfies 3e≤p^l.

For each integer b≥0 there are V∈GL_d(A) and a matrix C over the
unramified coefficient field Λ[1/p], fixed by every g fixing Λ, such that

    φ^l Z=(φ^l E)^b C V.                               (R1)

If eA≤p^l δ, then for every x∈S^d,

    p^(4δ)x ∈ span_S { y∈S^d : Vy≡r_y mod E^A B^d
                                  for some r_y∈N^d }.  (R2)

The natural integer residues, the same V, and both guards are part of
the statement. In particular (R2) is not an assertion that all columns
of V are invariant or that its inverse is integral over A0.

We use the actual chart/ring facts recorded in the period-basis appendix:
S-linear extended coordinates preserving A; the distinguished coordinate
λ̂_0 fixing S_B; coefficient reduction of an S_B element modulo z to
Λ[1/p]; z-adic separation of B; divisibility reflection; the θ-kernel
and cyclotomic identities. The cyclotomic lifting-the-exponent identity
needed here is, for every n≥1 with v=v_p(n),

    τ E(p^v+βz)=α([ε]^n−1),  α,β∈A0.                 (R3)

This is the exact `exists_tau_mul_E_eq_mul_epsTilt_pow_sub` of
PeriodMatrixBasis. Its integral quotient-ring proof is now supplied in
[the cyclotomic quotient appendix](2026-11-26_COMPACT_CYCLOTOMIC_QUOTIENT_LTE.md):
apply binomial expansion in A0/(zμ), where μ² is divisible by pμτ,
then lift the resulting equality. No division by [ε]^n−1 in A0 occurs.
The construction of the chart and other foundational ring facts remain
their own source dependencies.

## 2. Normalize once at z=0 and control the Galois difference

Apply λ̂_0 to p^(−h)Z'. Since λ̂_0 commutes with each entry of Z,

    λ̂_0(p^(−h)Z') Z = (E/p)^h I = I+zW0.

For every S_B entry a there is one a0∈Λ[1/p] with a−a0∈z S_B.
Choose these finitely many a0 together, obtaining a matrix B0 over
Λ[1/p] with

    Y:=B0 Z=I+zW,   W over S_B.                       (R4)

B0 is fixed by t and every fixer of Λ. This last property is why a
general S[1/p] approximation would not suffice. Therefore tY=YG.

For a∈S_B the native chart identities give

    τz | ta−a in B.                                   (R5)

For clarity, the z factor follows by reducing a modulo z to Λ[1/p].
After dividing by z, apply every θφ^j, j≥1: finite p-denominator
approximations and t fixing θ(z),Λ show the values are zero. The
τ-divisibility criterion then supplies the other factor. This is the
actual `tau_mul_z_dvd_smul_sub`, with t fixing θ(z) essential.

Multiply tZ−Z by Z'. Since Z'Z=E^h I,
E^h(G−I)=Z'(tZ−Z) is divisible by τz in B. The chart reflection lemma

    τz^n | E^h a in B, a∈A0  ⇒  τz^n | a in A0

therefore gives τz|(G−I)_ij in A0. Its proof first cancels E at all
positive Frobenius θ evaluations to obtain τ|a, then uses the chart's
z-divisibility reflection repeatedly. It uses θ(φ^j E)≠0 for j≥1,
not that E is a unit in A0.

## 3. Successive coefficients and the factorial denominator

Fix one row of Y. Suppose for n≥0 that

    A_n=q_n Y_row−z^(n+1)W_n,
    A_n∈S^d, q_n∈N, W_n∈S_B^d.                      (R6)

Initially A_0 is the corresponding identity row, q_0=1, W_0 the
corresponding row of W in (R4). Put r=n+1 and v=v_p(r). Applying t
to (R6), using tz=[ε]z, tY=YG and τz|(G−I), gives

    A_n G−tA_n
      =z^r[([ε]^r−1)W_n+τzD_n],    D_n∈B^d.          (R7)

Here D_n is formed from ([ε]^r(tW_n−W_n)−W_n(G−I))/(τz);
(R5) makes this legitimate. Multiply (R7) by α from (R3).
Using E=p+z r_E gives

    α(A_n G−tA_n)
       =τz^r[p^(v+1)W_n+z((p^v r_E+βE)W_n+αD_n)].     (R8)

The left side is integral over A0. The τz^r reflection just proved
makes the bracket integral over A0, despite D_n having been formed
in B. Apply λ̂_0. Its value on that integral vector lies in S, and
it fixes W_n and commutes with z. We obtain, with an appropriate sign
in the definition of W_(n+1),

    p^(1+v_p(n+1))W_n=s_n+zW_(n+1),
    s_n∈S^d, W_(n+1)∈S_B^d.                          (R9)

Thus (R6) continues with
q_(n+1)=p^(1+v_p(n+1))q_n and
A_(n+1)=p^(1+v_p(n+1))A_n+z^(n+1)s_n.
For every N≥1, substitution of these exact finite identities gives

    Y_row=e_row+
       Σ_(1≤j≤N) z^j s_(j−1)/p^(j+v_p(j!))
       +z^(N+1)W_N/p^(N+v_p(N!)).                    (R10)

No infinite sum has yet been taken in B. The only accumulating cost
is Σ_(1≤j≤N)(1+v_p(j))=N+v_p(N!), with no d or number-of-rows factor.

## 4. Evaluate a genuine integral power series after Frobenius

The chart equation implies z^e∈pA; therefore z^M∈p^a A whenever
ea≤M. In particular z^(p^l)=p^3 T for some T∈A. Put

    X_l=z^(p^l)/p^2=pT∈pA.

Evaluation at X_l defines S[[X]]→A, by p-adic completeness.
Applying φ^l to the coefficients in (R10) and writing
z^(jp^l)/p^(j+v_p(j!))=X_l^j p^(j−v_p(j!)) shows that

    φ^lY=ev(K(X)),
    K(X)=I+Σ_(j≥1)X^j p^(j−v_p(j!))φ_S^l(s_(j−1)).    (R11)

For every p≥2, v_p(j!)≤j−1. Hence all coefficients are integral
over S; K is a unit matrix over S[[X]], since K(0)=I.
The equality in (R11) is justified as follows: its two sides have
the same truncations modulo z^(Np^l) in B by (R10). The evaluated
series exists in A because X_l∈pA; its tail belongs to X_l^N A.
Their difference is therefore in z^(Np^l)B for every N and is zero
by z-adic separation. No bound on the separate remainders W_N is
needed, and none is assumed. An assertion of their p-adic decay would
be an invalid extra limiting step.

Since φ^lB0·φ^lZ=ev(K) is invertible, φ^lB0 is invertible over the
coefficient field Λ[1/p]: its determinant is nonzero and all entries
belong to that field. Also

    φ^lE=p(1+pX_l φ_S^l(r_E)).

Let D(X)=1+pX φ_S^l(r_E), a scalar power-series unit. For the chosen
b set

    V=ev(D^(−b)K),   C=p^(−b)(φ^lB0)^(−1).

Then V∈GL_d(A), C is fixed by every fixer of Λ, and direct
multiplication gives (R1), with exactly (φ^lE)^b. This is the
Dwork normalization used in the native radius lemma.

## 5. Two common clearings give exactly p^(4δ)

We first show that, for any F(X)∈S[[X]],

    p^(2δ)ev(F)≡s(F) mod E^A B,  s(F)∈S,             (R12)

under eA≤p^lδ. Finite truncation gives, for every D≥0,

    p^(2D)ev(F)=s_D+z^(p^l D)ev(F_D),   s_D∈S.       (R13)

This follows directly by splitting off the first D coefficients and
using p^2 X_l=z^(p^l); it remains true for D=0.
For D=δ, write z^(p^lδ)=p^A a with a∈A using the guard.
The exact chart-coordinate identity with ν=E says

    p^A λ̂_0(a ev(F_δ))=s'+E^A w',   s'∈S, w'∈S_B.

Evaluation lies in S_B. To check this, apply λ̂_0 to (R13): it fixes
s_D and commutes with z and p, so λ̂_0(ev F)−ev F is divisible by
z^(p^l D) for every D. Separation gives equality, and λ̂_0 always
takes values in S_B. Applying λ̂_0 to (R13) with D=δ now proves
(R12). Thus no closure of S_B under unproved infinite limits is assumed.

Apply (R12) entrywise to the SAME formal unit V(X)=D^(−b)K and its
formal inverse. Put q=p^(2δ). There are integral matrices N_+,N_−
over S with

    N_+≡qV,    N_−≡qV^(−1) mod E^A B.                (R14)

Consequently the columns of N_− satisfy V y≡q e_j, and the columns
of H=q^2 I−N_−N_+ satisfy V y≡0. Both are permitted generators
in (R2), with natural integer residue vector q e_j or 0. For every
x∈S^d the EXACT identity

    p^(4δ)x=H x+N_−(N_+x)                             (R15)

places it in their S-span. This proves (R2). The identity does not
require N_+ or N_− to be invertible over S, nor that p be a unit
there. The two clearings occur once each and are independent of rank.

## 6. Actual FrameTheorem and LongGap substitutions

Use the very same Z,Z' obtained from the period frame. In
FrameTheorem put b=h=jumpBound and use its common frame vectors
ν_l(y)=Σ y_j φ^l n_j. Its evaluation formula is

    E_l^h μ(ν_l(y))=a_μ φ^l Z·y,

where a_μ is the row of basis values times the same period matrix.
Equation (R1) cancels E_l^h exactly and gives

    μ(ν_l(y))=a_μ C V y.                              (R16)

For y in (R2), write Vy=r_y+E^A w. The row a_μ C is fixed by Γ'
and lies in filtration zero: the form equivariance fixes a_μ, Γ'
fixes Λ, and C is over Λ[1/p]. Thus the r_y term in (R16) is fixed;
the remaining term belongs to Fil^A. For each g∈Γ',

    g μ(ν_l(y))−μ(ν_l(y))∈Fil^A.

These vectors already belong to the SAME valueFieldPoints(φ^lM).
Linearity of ν_l and (R2) now prove the exact quantified conclusion
of frame_theorem:

    p^(4δ)x ∈ span_S{ y∈valueFieldPoints(φ^lM) :
        gμ(y)−μ(y)∈Fil^A for every form μ and every g∈Γ' }.

At LongGap the actual guards are l>0, 3e≤p^l and eA≤p^lδ; retain
all three. Apply this conclusion to f(E)y, with the monic f of
degree N=s+gΣ_(t<l)p^t<A. It supplies ONE finite coefficient list
for p^(4δ)f(E)y. Extract the same N-th coefficient both for the point
and for its projected error, as in audited 1b2053e9. Lift the E^A-divided
error at the earlier cut, multiply back and subtract. The final
projection is exactly p^(κ+4δ)c; point profile min(A,−u−N) and
Galois difference depth A at E are those of the native caller.
This now justifies the quantitative frame input retained in that
long-gap proof. It does not drop N<A or replace exact correction by
an approximate lift.

## Provenance, verification boundary and next dependency

Actual sources, relative to compact src:

- Lib/PadicHodge/Comparison/CrystallineLimit.lean,
  e3cf139874cd85a9e5642c277e8b51b9343add9a, radius_lemma:60–154;
- Lib/PadicHodge/WachKisin/FrameTheorem.lean,
  57d6daa6060f9f00eb27be6525460ba942a73f08, frame_theorem:53–161;
- Lib/PadicHodge/WachKisin/ChartScalars.lean, extended coordinates,
  reduction to Λ and z-divisibility;
- Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean,
  exists_tau_mul_E_eq_mul_epsTilt_pow_sub:39–47;
- New/Lift/LongGap.lean, a94786663aac435dfc1ec846046c87f00ddad141,
  pointsOver_nonempty_of_long_gap:462–496.

All source files were read locally at the fixed commit. No native Lean
replay, p-adic experiment or independent audit of this new human
replacement has occurred. Prior native receipts keep their precise
scope. No graph node or root axiom retired, no URT premise, no changes
to schedules or protected workflows. The initial period-matrix/coordinate
construction and foundational ring/reflection lemmas remain explicit
dependencies; the radius and long-gap implications above are derived
from them, not counted as a full proof of C.

RESUME HERE: independently check (R7)–(R11), the S_B evaluation argument,
and (R14)–(R16) at the actual chart and forms; then finish the
normalized RowBalanced length and Ribet block payment using these
exact local estimates. Do not repeat the cup expansion or endgame.
