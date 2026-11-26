# Fixed coefficients and filtered coordinate maps at the period-matrix caller

26 November 2026. SOURCE-MATCHED HUMAN DERIVATION, independent audit pending.
This supplies two exact chart lemmas used before PeriodMatrixBasis:
`IsChartOf.dvd_extendToBPlus` and `exists_witt_coeff_of_isChartOf`.
It uses an established theorem of Fontaine only after identifying the
period ring and checking its open-subgroup hypothesis. It does not
identify the source's B_max with the divided-power B_cris by notation.

Compact pin `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.

Continuity: literature peer 198752ed arrived while this note was being
written. Sections 2–3 and the period-matrix assembly overlap its RUN59
sections 1,3,4 and are recorded as AGREE independent reconstruction,
not a new discovery. Section 4 discharges its explicitly retained
fixed-fraction/Witt coefficient supplier. Section 6 below keeps the
S_B factors omitted from the peer's shorthand value-field expansion;
the actual source includes them.

## 1. Identify the exact external theorem's ring and subgroup

Put A0=A_inf, A=A_max, B+=B_max^+, B=B+[1/μ], S=c.S and
S_B=c.bicommutant. The source calls B `Bcris`; only its actual
localization description is used here. Its B_dR^+ is the ξ-adic
completion of B+, whereas Fontaine defines this completion starting
with A0[1/p]. These definitions agree:

    A0[1/p]/ξ^n ≅ B+/ξ^n       for every n≥1.            (1)

For surjectivity use the exact source approximation
p^m y=a+p^m μ^n w, so y≡p^(−m)a mod ξ^n. For injectivity, the
θ-kernel criterion reflects ξ-divisibility from B+ to A0, and
induction reflects each power; p is a unit after localization.
The resulting isomorphisms (1) preserve θ, transition maps, Galois
action and filtration. Their inverse limits identify the complete
discrete valuation rings and then their fraction fields. This
legitimizes applying Fontaine's theorem to THIS B_dR.

Let j:Γ→G_Qp have the native open image H, and let
K=Q_p-bar^H. The subgroup H is also closed and has finite index;
K is a finite extension of Q_p, complete and discretely valued,
of characteristic zero and with perfect residue field.

The precise external result used is

    (B_dR)^H=K.                                       (2)

Primary source: J.-M. Fontaine, *Le corps des périodes p-adiques*,
Astérisque 223 (1994), §1.5.7, printed p.74 (PDF p.16, zero based),
[original paper](https://www.numdam.org/item/AST_1994__223__59_0.pdf).
That section explicitly includes every OPEN subgroup H. The text and
its hypotheses were opened and inspected in this session. Formula (2)
does not require a representation of Γ to be continuous, because no
representation enters it. The chart `IsChartOf` condition adds that H
contains every g fixing Λ and θ(z).

## 2. Approximate each fixed-field coefficient inside S_B

Write θ_S for θ restricted to S. Its image R is finite over Λ by
the chart's Weierstrass division modulo E, and is a domain inside
O_C. Thus L=R[1/p] is a finite local field. The pointwise fixer of
Λ and θ(z) is G_L: the coefficients and the topologically convergent
power-series expression determine θ(S), and θ is injective on Λ.
The chart condition therefore gives G_L⊂H and K⊂L. Since S_B
contains S and p^(-1), θ(S_B) contains L, hence K.

Fix a∈K. Choose b0,g∈S_B with θ(b0)=a and
θ(g)=1/P'(a), where P∈Q_p[X] is the minimal polynomial of a.
It is separable. In B_dR^+ define

    F(X)=X−gP(X),       b_(n+1)=F(b_n).

Every b_n is still in S_B. We have F(a)=a and
F'(a)=1−gP'(a)∈Fil^1. Taylor expansion therefore shows

    b−a∈Fil^m, m≥1  ⇒  F(b)−a∈Fil^(m+1).

Starting with b0−a∈Fil^1, obtain for every m a coefficient
b_m∈S_B with b_m−a∈Fil^m. The construction inverts P'(a) only
in the finite field K before choosing its θ-lift. It never assumes
that P'(b0) has an inverse in B+ or S_B.

## 3. Every actual coordinate map preserves a fixed-field linear form's depth

Let f:A0→A0 be S-linear and f̂ its source extension to B+.
It commutes with S_B and multiplication by E∈S. For finitely many
a_i∈K and y_i∈B+, put Y=Σ a_i y_i. For every m≥0,

    Y∈Fil^m  ⇒  Σ a_i f̂(y_i)∈Fil^m.                  (3)

Choose b_i∈S_B with b_i−a_i∈Fil^m, using section 2.
Because y_i and f̂(y_i) lie in B+⊂B_dR^+, replacing the a_i by
b_i changes either sum by an element of Fil^m. Now Σ b_i y_i
is in B+ and Fil^m, so it is E^m times an element of B+ by
the actual ξ-power reflection theorem. Apply f̂ and commute the
b_i and E^m. The resulting sum stays in E^m B+ and hence Fil^m.
This proves (3). If Y=0, apply (3) for every m and use separation
of B_dR^+; its transformed sum is zero too. Since B_dR^+ is a DVR,
these statements are equivalent to

    Σ a_i y_i divides Σ a_i f̂(y_i) in B_dR^+.

This is precisely the native `dvd_extendToBPlus`, including its zero
case, arbitrary finite coefficient family and every S-linear map.
The proof uses one finite approximation for the chosen m; it does
not take a limit of the maps f̂.

## 4. A fixed fraction in the source B has unramified coefficients

Suppose b,b'∈B, b'≠0, and b'·j(g)b=j(g)b'·b for every g∈Γ.
By injection into B_dR, the ratio a=b/b' is fixed by H. Equation
(2) gives a∈K. Clear the two μ-denominators simultaneously to
write that ratio as B0/C0 with B0,C0∈B+, C0≠0.

Some extended coordinate λ̂_i(C0) is nonzero. Indeed, if all were
zero, the finite coordinate-approximation theorem would place C0
in p^n A for every n; the case n=0 and p-adic separation of A
would give C0=0. Apply (3) to the zero relation B0−aC0=0:

    u:=λ̂_i(B0)=a v,      v:=λ̂_i(C0)≠0,
    u,v∈S_B.                                          (4)

By z-adic separation there is a largest n for which BOTH u and v
are divisible by z^n in B+. Divide by that common power. The
quotients u0,v0 remain in S_B because the multiplier z is a nonzero
element of S_B and the actual bicommutant division lemma applies.
They still satisfy u0=a v0, and they are not both z-divisible.
The chart's constant-coefficient reduction gives

    u0=α+zu1,   v0=β+zv1,
    α,β∈Λ[1/p], u1,v1∈S_B.                            (5)

Thus d:=α−aβ=z(av1−u1). If d≠0, both a and d^(-1) are algebraic
over Q_p and hence integral over S_B, which contains Q_p. In the
integral closure of S_B inside B_dR, the displayed identity would
make z a unit. Integrality reflects units: the monic equation for
z^(-1), multiplied by the appropriate power of z, expresses z^(-1)
as an S_B-polynomial in z. Hence z would already be a unit in S_B,
contradicting z-adic separation in B+.

Therefore α=aβ. If β=0 then α=0 and (5) makes both u0,v0
z-divisible, a contradiction. Thus a=α/β∈Λ[1/p]. Clear its p
denominator in this finite unramified field to obtain

    p^m b=w b',       m≥0, w∈Λ.                       (6)

This proves the actual `exists_witt_coeff_of_isChartOf`, including
fractions of B and without replacing B by the usual divided-power
B_cris. In particular every Γ-fixed entry of B belongs to S_B.

## 5. Substitute at CrystallinePeriodMatrix

Crystallinity supplies an invertible period matrix M over the source
B, with ρ(g)j(g)M=M. For any other such matrix N, each entry of
M^(-1)N is Γ-fixed. Section 4 therefore makes it an element of
Λ[1/p]⊂S_B; this also applies to its inverse. In particular it
applies to N=φM, since φ commutes with Galois action and fixes the
Z_p matrix entries of ρ.

Retain the native Hodge-frame supplier at this generality. Its
frame at each φ^nM has exponents k_i equal to the source jumps and
−a≤k_i≤b. It bounds entries of φ^nM in Fil^(−a) and of their
inverses in Fil^(−b), for every n≥0. The source pole criterion
then gives

    U=(Eτ)^a M over B+,   W=(Eτ)^b M^(-1) over B+,
    UW=(Eτ)^(a+b)I.

For clarity, the pole criterion follows by removing one μ-denominator
at a time: if y=μ^(−a−N)c with N>0 and every φ^n y∈Fil^(−a),
then every φ^n c∈Fil^1. The simultaneous θ/Frobenius criterion
gives μ|c in B+, reducing N. Eτ is associated to μ, so the same
criterion applies to Eτ. No bounded-pole claim is inferred from
only n=0.

Put μ=vEτ, v∈A0^×, and C=M^(-1)φM. Since φτ=μ,

    φU=v^a U F,     F=(φE)^a C.

Section 4 and the existing unit (φE)^(-1)∈S_B give precisely the
S_B Frobenius matrix and its inverse. At a chart-fixing g, the
native association g(Eτ)=u_g Eτ and a lift of g to Γ give the
integral matrix u_g^(−a)ρ(g) with that matrix times gU equal to U.

Finally use a native Hodge frame M Y=P diag(t^k), where Y and its
inverse have coefficients in K and P∈GL_d(B_dR^+). The condition
Uy∈E^(a+b)B+^d is equivalent, after this factorization, to

    (Y^(-1)y)_i∈Fil^(b−k_i),   for every i.

Here each b−k_i≥0. Section 3 preserves all these finite linear-form
conditions under f̂. Reversing the factorization gives
U f̂(y)∈Fil^(a+b), hence U f̂(y)∈E^(a+b)B+^d. This establishes
the actual `hat_stable` field, not merely invariance of a rational
span. All four IsPeriodMatrix fields now follow from the native
Hodge frame, the initial crystalline basis, and the ring inputs above.

## 6. The exact value field and the relation/Hodge consumer

For the actual Kummer chart group Γ', write i_a=φ^(−a):A0→B_dR.
The source value field is generated over K'=localFieldOf(Γ') by
BOTH S_B and i_a(S). The S_B generators must not be omitted.
For finitely many v_j in that field, clear one common nonzero
denominator d in the generated subalgebra and expand

    d v_j=Σ_l α_jl b_jl i_a(s_jl),
    α_jl∈K', b_jl∈S_B, s_jl∈S.                       (7)

The expansion is closed under products because S_B and i_a(S) are
commutative subrings. Let f:A0→S be S-linear and put
f_a=φ^(−a) f φ^a, regarded as an A0-valued map. It is S-linear
because φ^a(S)⊂S. Apply section 3 to the coefficients α_jl,
the actual vectors b_jl i_a(s_jl r_j)∈B+, and the extension of
f_a. S_B-linearity and agreement on A0 make their transformed
vectors b_jl i_a(s_jl f(r_j)). Thus for one u∈B_dR^+,

    d Σ_j i_a(f(r_j))v_j=u d Σ_j i_a(r_j)v_j.

Cancel d in B_dR. This proves that every B_dR^+-submodule W
containing the old sum also contains the new sum, including W=0.
No assertion that d is a unit of B_dR^+ is used. This is the exact
sum_map_mem_of_valueField needed for the integral frame's zero
relations and its coordinate retraction, now from the supplied fixed
linear-form theorem. Formula (7) corrects the omitted S_B factors
in the shorter expansion of literature RUN59 §2; the conclusion
and native argument are otherwise compatible.

For the actual degree-one Hodge-difference consumer, let
x∈valueField(a)∩B_dR^+. The BdR approximation supplies
p^m x−r∈Fil^1 with r∈A0. Apply the relation transport just proved
with inputs 1,φ^a r, coefficients p^m x,−1 and f=coord_0.
It gives p^m x−i_a(coord_0(φ^a r))∈Fil^1. Apply each of the
specified Galois operators t_j and then g−1; Fil^1 is stable.
The hypothesis E_a|(g−1)Σ_j t_j s for every s∈S applies to
s=coord_0(φ^a r), so its i_a-image is in Fil^1. Subtract and
cancel p^m, which is a unit in B_dR^+. Consequently

    (g−1)Σ_j t_j x∈Fil^1.

This is smul_sub_mem_hodgeFil_of_valueField with the SAME finite
operators. It is not a claim about arbitrary Galois averaging or
an integral representative for every field element in S itself.

## Applicability boundary: the general Hodge frame is still explicit

For a CONTINUOUS representation of the local Galois group, a sufficient
standard Hodge-frame supplier is Fontaine, *Représentations p-adiques
semi-stables*, Astérisque 223 (1994), Theorem 3.8(i), printed p.142:
the de Rham comparison is strict and its associated graded is the
Hodge–Tate comparison. Choose a K-basis adapted to its filtration;
the graded isomorphism makes the normalized columns a B_dR^+-basis,
giving exactly the displayed Hodge frame. The theorem and strictness
statement were opened in the [primary paper](https://www.numdam.org/item/AST_1994__223__113_0.pdf).

Do NOT apply it to every abstract Γ-representation by silently assuming
continuity. The native period-matrix theorem is stated for an admissible
representation; some source proofs of automatic continuity themselves
use HodgeFrame. A replacement that invokes those proofs to justify
Theorem 3.8 and then uses Theorem 3.8 to justify HodgeFrame would be
circular. Accordingly this note discharges the fixed-coefficient and
coordinate-divisibility suppliers outright, and the remaining matrix
assembly conditional on its precisely stated Hodge-frame/basis inputs.
It does not mark the whole initial-period or crystalline chain closed.

Source ledger, paths relative to compact src:

- Lib/PadicHodge/WachKisin/KummerChart.lean,
  8c3d7ca027e653f9a125e0cec6fd477c5ce6f791, lines 26–86;
- Lib/PadicHodge/WachKisin/CrystallinePeriodMatrix.lean,
  cf83fda104fb44177d374d62f06b4d6e68e3db08, lines 26–87;
- Lib/PadicHodge/PeriodRings/FundamentalKernel.lean,
  7d78ffa669acc35996f315cfe18ac1dc43649fb9, pole criterion;
- Lib/PadicHodge/WachKisin/DeRhamValues.lean,
  046db09193b89610f16c21c10f28d8505c304711, exact value field and transport;
- HodgeFrame.lean and CocycleContinuity.lean at the same pin,
  for the stated remaining Hodge-frame/continuity dependency.

No new Lean replay, finite diagnostics or independent audit claimed.
RESUME HERE: check the exact native HodgeFrame via its stable-kernel
argument, or establish the actual caller's continuity independently
before using Fontaine 3.8. Do not re-open the coefficient approximation,
fixed-fraction, radius or final Ribet collections already derived.
