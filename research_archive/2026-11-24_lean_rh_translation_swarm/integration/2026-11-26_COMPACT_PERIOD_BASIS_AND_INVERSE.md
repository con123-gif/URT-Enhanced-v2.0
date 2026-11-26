# Integral period basis and the inverse at the crystalline caller

26 November 2026. SOURCE-MATCHED HUMAN DERIVATION, independent audit pending.
This supplies the contraction, basis divisibility and inverse retained by
`2026-11-26_COMPACT_PERIOD_FRAME_DESCENT.lean` (ce3f88d1). It does not certify
the complete period-ring theory or the human RH reconstruction. Credit for
the compact argument: Levent Alpöge, Luke Sernau, Anthropic collaborators
and Claude.

Continuity: while this derivation was in progress, peer 5974a9fe supplied
the SAME inverse in the mission handoff. Section 5 is an independent
AGREE review/integration of that overlap, not a new discovery. Sections
1–4 and 6 address its explicitly retained basis and coefficient suppliers.
The latest completion-first instruction was read before publishing;
standard Ax theory is cited with its actual hypothesis bridge.

Source: `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/`; Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

## Exact setting and retained ring inputs

Write A0=A_inf, A=A_max, B=B_max^+, S=c.S, and S_B=c.bicommutant.
All are the actual rings of the source chart, not arbitrary rings with
the same names. Write i:A0→B for the injective structure map. We suppress
i only in equations taking place in B. The period matrix U of size d and
height h has the four fields of `IsPeriodMatrix`:

1. UW=(Eτ)^h I for some W over B;
2. φU=vUF with v∈A0^×, F over S_B, and F invertible over B;
3. for every g fixing Λ and θ(z), there is ρ over A0 with ρ(gU)=U;
4. for every S-linear f:A0→A0 and every y∈B^d, if Uy=E^h x
   for some x∈B^d, then U f̂(y)=E^h w for some w∈B^d.

Correction from independent audit eec17037: field 4 is quantified over
ALL B-valued x and y. The basis proof below only uses its restriction
to integral x∈A0^d, but that restriction is not the full definition.
The initial-period construction must, and now does, supply the stronger
field via its Hodge linear-form tests.

Here f̂ is the actual extension to B. It preserves A and commutes with
S_B multiplication. Retain those extension properties, including their
compatibility with Frobenius. They are essential, rather than a claim
about arbitrary extensions of linear maps. S_B contains p^(-1) and
(φE)^(-1). U is injective: its displayed inverse makes det U nonzero.

The following precise ring facts are used below:

- ξ=εE with ε∈A0^×, μ=ξτ, φτ=μ, and τ divides ξ−p;
- A is p-adically complete and separated, A0 is (p,ξ)-adically complete,
  and A0∩p^m A=(p,ξ)^m A0;
- if ξ^h divides an A0 element in B, its quotient belongs to A0
  (iterate the θ-kernel criterion); similarly φ(τ)^h|φ(b) in B
  implies τ^h|b in B;
- if e|μ and e^h w∈A, then p^(2h)w∈A;
- if ξ∈(p,ν)A0, then for a∈A and n≥0,
  p^n a=a0+ν^n b for a0∈A0 and b∈A;
- for y∈B and k,n≥0 there are m,a,w with a∈A0, w∈A and
  p^m y=a+p^(m+k)μ^n w;
- the actual chart has S complete at (p,z), A0 separated for this ideal,
  p∤z, a topological S-basis (b_i) of A0 with coordinates λ_i, and
  y−Σ_(i∈J)b_i λ̂_i(y)∈p^m A for all sufficiently large finite J,
  for each fixed y∈B and m≥0; every λ̂_i(y) belongs to S_B;
- the prime-to-p approximation criterion: if δ∈A0, p∤δ, and for every
  m there is a_m∈A0 with a−δa_m∈(p,ξ)^m, then δ|a in A0.

These statements, with their full rings, are proved in AmaxStructure,
BdRPlus, ThetaKernel and ChartScalars. They remain named foundational
inputs; this note proves the basis/frame implications from them, rather
than silently treating a reference to the period rings as all their proofs.

## 1. Uniform denominator bounds

For a fixed matrix M over B choose a with p^a M over A. If My=e^h w,
y∈A^d and e|μ, then e^h p^a w∈A^d, hence

    p^(a+2h) w∈A^d.                                      (1)

In particular choose n for M=W,e=τ and k for M=U,e=E, once for the
whole matrix. They do not depend on x,y,f, a coordinate, or an
approximation depth. UW=(Eτ)^h I also gives WU=(Eτ)^h I, by det U≠0.
Thus Uy=E^h x with x∈A0^d implies W x=τ^h y, which gives
p^n y∈A^d by (1).
Consequently p^n f̂(y)∈A^d and U f̂(y)=E^h w gives

    p^(k+n) w∈A^d.                                      (2)

The same n,k work for every S-linear f. No division by p inside A0
has been used.

## 2. The contraction lemma, with its limit justified

Let V⊂A and u∈A0. Suppose every a∈V has a'∈V satisfying

    ξ^h a=u φ(a').

Then p^(h+1)a belongs to A0 for every a∈V. For each j≥0 construct

    a_j=p^(h+1)a−τ^(h+1)p^j z_j,  a_j∈A0, z_j∈A.       (3)

At j=0 use the fifth ring fact with ν=τ. For the induction choose
b_j=p^(h+1)a'−τ^(h+1)p^j t_j∈A0 for a'. Frobenius and the displayed
contraction equation give

    u φ(b_j)=ξ^h [p^(h+1)a−u ξ τ^(h+1)p^j φ(t_j)].

Reflect ξ^h-divisibility back to A0. The quotient is a_(j+1), since
ξ=pX in A, and its error is
τ^(h+1)p^(j+1)uXφ(t_j). This proves (3) for j+1.

For l≥j, a_l−a_j∈A0∩p^j A=(p,ξ)^j A0. Completeness therefore gives
a limit a_∞∈A0. Its image in A satisfies a_∞−a_j∈p^j A. Equation (3)
and p-adic separatedness of A now give a_∞=p^(h+1)a. Thus the argument
does not assume that A0 is p-adically dense in A, nor interchange an
uncontrolled limit with division by ξ. This is the full contraction
argument in BdR.exists_Ainf_eq_of_contraction.

## 3. Frobenius supplies the contraction for all coordinate tests

Fix Uy=E^h x, x∈A0^d, and U f̂(y)=E^h w. Put
x_−=φ^(-1)(v E^h x)∈A0^d and b=W x_−. Then

    Ub=(Eτ)^h x_−,
    F φ(b)=φ(Eτ)^h y.

The second equality follows by applying φ to the first, using φU=vUF,
and cancelling the injective U and the unit v. Since F is invertible,
μ^h divides φ(b). The τ-divisibility reflection in the setting therefore
gives b=τ^h y_− with y_−∈B^d. Cancel τ^h, then μ^h, to obtain

    U y_−=E^h x_−,        F φ(y_−)=φ(E)^h y.             (4)

The conjugate f_−=φ^(-1)fφ on A0 is S-linear, since φ(S)⊂S.
Its extension satisfies φ f̂_−=f̂ φ: both sides preserve A and agree
on A0, so the source's extension uniqueness lemma applies. The fourth
period-matrix field gives U f̂_−(y_−)=E^h w_−. Apply φ and use (4):

    φ(E)^h φ(w_−)
       =v U F f̂(φ(y_−))
       =v U f̂(F φ(y_−))
       =v φ(E)^h U f̂(y)
       =v φ(E)^h E^h w.

All commuting factors here belong to S_B, specifically F and φ(E),
not arbitrary A0 coefficients. Cancel the unit φ(E)^h to get

    ξ^h w=ε^h v^(-1) φ(w_−).                            (5)

Let V consist of all coordinates p^(k+n)w obtained from every such
x,y,f. By (2), V⊂A; equation (5) keeps its preimage in the SAME V.
Section 2, with u=ε^h v^(-1), gives a single integer

    N=h+1+k+n,   p^N w∈A0^d                            (6)

for every test. This is the uniform exponent used in exists_basis.

## 4. Finite free lattice and exact prime-to-p division

Define the S-module

    P={x∈A0^d : Uy=E^h x for some y∈S_B^d}.

It is (p,z)-adically separated and p-torsion-free as a submodule of A0^d.
If zx=pw in P, p∤z implies x=p x0 with x0∈A0^d. The witness y/p is
in S_B^d, so x0∈P. Thus z is injective on P/pP.

Its S-rank is at most d. Indeed, for an S-independent finite family
x_j∈P let y_j be its unique witnesses. A relation Σ a_j x_j=0 over
A0 is equivalent to Σ a_j y_j=0, by injectivity of U. Apply λ̂_i to
the latter relation: its S_B-linearity gives Σ λ_i(a_j)y_j=0.
Apply U and cancel E^h. S-independence gives λ_i(a_j)=0 for every
i,j; separation by the coordinates gives a_j=0. Hence the x_j are
A0-independent in A0^d and their number is ≤d.

The exact complete-local algebra lemma free_finite_of_rank_le applies.
Independent audit eec17037 supplies a direct proof for this actual
nonzero-p chart, which we integrate here. Put I=(p,z). If p x∈I^n P,
n≥1, write p x=p u+z^n w with u∈I^(n−1)P. Modulo p, regularity of
z forces w=p w'; cancel p to get x∈I^(n−1)P. Thus
(I^nP:p)=I^(n−1)P. This proves that the homogeneous map
(P/IP)^(n+1)→I^nP/I^(n+1)P, (v_i)↦Σ p^i z^(n−i)v_i, is an
isomorphism: surjectivity is immediate; for injectivity reduce modulo
p to put v_0 in IP, subtract its term and divide by p using the
colon identity, then induct on n.

Lift a residue-field basis of P/IP arbitrarily into P. Every finite
family of these lifts is S-independent: a nonzero relation has a
least I-order among its coefficients, since S is separated; its
nonzero initial forms would give a relation among the residue basis
in the homogeneous isomorphism just proved (and the corresponding
one for S), a contradiction. Rank P≤d therefore makes the residue
basis finite. For x∈P approximate successively modulo I^nP by this
finite family, correcting coefficients in I^n S at step n. The
coefficients converge in complete S. The resulting finite combination
equals x because P is separated. This proves finite freeness without
assuming completeness of P or using Nakayama before finite generation.
It suffices for the actual chart; no p=0 branch is claimed here.

Choose ≤d generators x_j forming that basis, with witnesses y_j, and
pad by zeros to obtain d columns Q,Z. Then UZ=E^h Q and Q generates P.
We next prove the stronger, exact divisibility statement:

    Uy=E^h x, x∈A0^d, δ∈A0, p∤δ, lQ=δg
        imply δ | l·x in A0.                            (7)

Here y need not belong to S_B^d. For each coordinate test λ_i, (6)
gives x_i∈A0^d with U(p^N λ̂_i(y))=E^h x_i. Since λ̂_i(y)∈S_B^d,
x_i∈P, so x_i=Qs_i and δ|l·x_i. For any m choose one finite J with

    y−Σ_(i∈J)b_i λ̂_i(y)∈p^(m+k) A^d.

Then r=p^N x−Σ_(i∈J)b_i x_i belongs to A0^d. Apply (1) for U to
p^N p^(−m−k)(y−Σ b_i λ̂_i(y)): it gives p^(−m)r∈A^d. Thus
r∈(p,ξ)^m A0^d. We have approximated p^N l·x by a multiple of δ to
every ideal power. The prime-to-p approximation criterion gives
δ|p^N l·x. Since p is prime and p∤δ, repeated cancellation gives (7).
All finite J are selected after m; no infinite series in P is assumed.

If det Q=0, a nonzero integral row l satisfies lQ=0. Apply (7) with
δ=z^a, g=0, x=τ^h e_i and y=W e_i, for every a,i. The chart's
z-adic separation forces τ^h l_i=0, hence l=0, a contradiction.
Therefore det Q≠0, and the chosen basis has exactly d elements.
This proves both quantified conclusions of exists_basis, with the SAME
Q,Z as their actual frame consumer.

## 5. The last inverse, without division in A_inf

The determinant descent in ce3f88d1 establishes p∤det Q from the
actual coefficient approximation and Frobenius recurrence. Combine
this with (7), using rows of adj(Q), to obtain the native implication

    UY=E^h X, X integral  ⇒  QH=X for an integral H.     (8)

In particular choose X=τ^h I,Y=W. This gives integral L with QL=τ^h I.
It remains to obtain the inverse Z' required by the frame theorem;
mere rational spanning does not give it.

Apply the exact B approximation in the setting to EACH entry of U
with k=0,n=h. Since there are finitely many entries, choose one
a≥0 and integral matrix A_U such that

    A_U=p^a U−p^a μ^h V_U,   V_U over A.                (9)

Choose t∈A0 with tEτ=μ. Then (9) is

    A_U=U[p^a(I−t^h W V_U)].

Apply (8) with X=A_U and Y=E^h p^a(I−t^h W V_U); multiplication
of the preceding equality by E^h gives exactly UY=E^h X.
Obtain H_U integral with QH_U=A_U. Define, in B,

    Z'=p^(−a)H_U+(tE)^h L V_U.

Then QZ'=p^(−a)A_U+μ^h V_U=U. Multiplication by Z now gives
Q(Z'Z−E^h I)=0, so det Q≠0 and injectivity of A0→B imply

    Z'Z=E^h I.                                        (10)

Only p is inverted in this formula, inside B. In particular (10) has
not been inferred by dividing by det Q in A0. The same (8) applied to
the actual Galois transform supplies gZ=ZG with G integral, exactly
as in ce3f88d1. This completes the missing inverse block there.

## 6. The coefficient approximation from an applicable classical theorem

Here is a derivation of the chart approximation retained in ce3f88d1.
Put θ_n=θφ^(−n), R_n=θ_n(S)⊂O_C, and K_n=R_n[1/p].
The actual chart's Weierstrass division gives, for every s∈S,

    s≡Σ_(0≤j<ep^n) a_j z^j mod E_n,   a_j∈Λ.

Since ker θ_n on S is (E_n), R_n is finite as a Z_p-module.
It is a domain, so K_n is a finite extension field of Q_p. Moreover
θ_n(s)=θ_(n+1)(φs) and φ(S)⊂S; hence the K_n are increasing.
Let K=∪K_n and H={g∈G_Qp : g fixes S pointwise}. Then H=G_K.
The forward inclusion follows from θ_n-equivariance. Conversely, if
g fixes all R_n, then θ_n(gs−s)=0 for every n. Reduction modulo p
identifies these values with all tilt coordinates, so p|gs−s.
Divide by p, repeat the same argument, and use p-adic separatedness
to get gs=s. Equivalently, ∩_(n≥0)ker θ_n=0 on A0.

Use the classical theorem of Ax: for a henselian nontrivially valued
field k of characteristic zero, the fixed field of G_k in its completed
algebraic closure is the completion of k. The present K is an algebraic
extension of Q_p with its unique extended valuation, hence henselian;
its algebraic closure is Q_p-bar and the completed closure is C_p.
Thus C_p^H=closure(K). No finite-degree assumption on K is needed.
Primary source: J. Ax, *Zeros of polynomials over local fields—The
Galois action*, J. Algebra 15 (1970), 417–428, main theorem p.417,
proof §3 pp.425–426,
[original paper](https://math.bu.edu/people/jsweinst/AWS/Files/AxZerosOfPolynomialsOverLocalFields.pdf).
The primary paper was opened and its theorem/proof text inspected in
this session; no claim to a fresh proof of Ax's theorem is made.

Let y∈O_C^flat be fixed by H, and fix N. The element θ_N([y])∈O_C
is fixed by H. Choose x∈K with |x−θ_N([y])|<|p|. Then x∈O_C and
belongs to K_n for every sufficiently large n. Write x=θ_n(s)/p^a,
s∈S. Surjectivity of θ_n:A0→O_C provides b with θ_n(b)=x, so
s−p^a b is divisible by E_n. Apply the S-linear coordinate λ_0,
which fixes S: E_n divides s−p^a λ_0(b). Thus q=λ_0(b)∈S satisfies
θ_n(q)=x. Reducing the strict norm approximation modulo p gives

    coeff_n(q mod p)=coeff_N(y)

for every sufficiently large n. This proves exactly
eventually_exists_coeff_eq_of_fixed, with its FOR ALL N, EVENTUALLY n
quantifiers. For finitely many coordinates choose a common lower bound
on n; then choose n≥M as required in ce3f88d1. It is not a density
assertion allowing one unrelated chart or approximation for each
Frobenius iterate. It discharges the fixed-coefficient premise of that
determinant contraction using an established theorem with all hypotheses
checked. It still uses the chart's stated Weierstrass and coordinate
properties.

## 7. Exact division from approximation (the actual retained criterion)

The prime-to-p approximation criterion in the setting has the following
short proof for A0=W(O_C^flat); it is now derived here. Let a,c be
nonunits, p∤δ, and suppose that for every m there is x_m with

    y−δx_m∈(a,c)^m.

First, multiplication by δ is injective modulo p^n for every n.
At n=1, reduce to the domain O_C^flat, where δ mod p is nonzero.
For the induction, p|δb implies p|b; divide b by p and use
p-torsion-freeness to reduce the exponent. Consequently δb∈p^n A0
implies b∈p^n A0, with no assertion that δ is a unit.

It follows that δA0 is p-adically closed. Indeed, if y=δb_n mod p^n,
then b_n−b_m∈p^m A0 for n≥m by the preceding injectivity. The
b_n converge in p-complete A0 to b, and p-adic separation gives
y=δb. This justifies the closure rather than assuming that every
principal ideal of a non-Noetherian period ring is closed.

For each fixed n, both a and c belong to the radical of (p^n,δ).
If δ is a unit there is nothing to prove. Otherwise reduce modulo p:
O_C^flat is a rank-one valuation domain, δ mod p is nonzero, and
the reductions of a,c are nonunits. A sufficiently large power of
each is divisible by δ mod p (zero reductions are immediate).
Hence a^u,c^v∈(p,δ) for some positive u,v; raising to the n-th power
puts a^(un),c^(vn) in (p^n,δ). Every monomial of degree un+vn−1
in a,c contains one of these powers. Thus

    (a,c)^(un+vn−1) ⊂ (p^n,δ).

The assumed approximation at that finite depth gives y∈(p^n,δ).
As n was arbitrary, p-adic closedness of δA0 now gives δ|y.
This proves ThetaKernel.dvd_of_approx with EXACTLY its hypotheses,
including zero-divisors in the auxiliary quotient; no Noetherianity
or comparison between unproved topologies is used. For section 4 take
a=p,c=ξ and the SAME δ from lQ=δg.

## 8. The ideal comparison used by the contraction limit

Here is also the needed proof of A0∩p^n A=(p,ξ)^n A0, given the
actual presentation A=A_max and its computed residue ring

    A/pA=(A0/(p,ξ))[X],        pX=ξ in A.

The residue presentation is AmaxStructure.exists_reduction_mod_p;
p is a non-zero-divisor in A. Multiplication by the polynomial X
is injective on (A0/(p,ξ))[X] over ANY coefficient ring. Induction
using p-torsion-freeness shows that Xb∈p^n A implies b∈p^n A.
This is the source's monic-polynomial regularity argument, and does
not require the coefficient ring A0/(p,ξ) to be reduced or a field.

Suppose a∈A0 maps into p^(n+1) A. Apply θ_A:A→O_C: θ(a) is
divisible by p^(n+1). Surjectivity of θ:A0→O_C gives c∈A0 with
θ(a)=p^(n+1)θ(c); its kernel criterion gives

    a=p^(n+1)c+ξb,       b∈A0.

In A, ξb=pXb lies in p^(n+1) A. Cancel the non-zero-divisor p;
regularity of X modulo p^n gives b∈p^n A. Induction yields
b∈(p,ξ)^n A0, and hence a∈(p,ξ)^(n+1) A0. The reverse inclusion
holds because both p and ξ=pX lie in pA. This proves the claimed
equality at every n, including n=0, so section 2's Cauchy and limit
arguments use an established comparison rather than an implicit
change of completion.

## Caller, provenance and remaining boundary

Combining sections 1–5 with ce3f88d1, the determinant selection and
minimal-support arguments in editor RUN59, and section 6's chart coefficient
approximation supplies all fields of IsPeriodMatrix.exists_frame.
Use these SAME Q,L,Z,Z',B in FrameTheorem, then literature RUN58's
integral span and coordinate retraction, then the LongGap/CupProductBound
proofs already audited in 57db85ec. At that actual consumer, distinguish
period height H=2a from jump bound a: QL=τ^(2a)I and Z'Z=E^(2a)I,
while τ^a n_j=s(Qe_j). The coordinate test extracts E_m^(2a), and
the radius normalization parameter is a. Audit eec17037 corrects the
earlier mixed notation; it does not change this appendix's generic
height h. This proves the displayed supplier
implications. It does not prove the retained initial existence of U,
Ax's established theorem itself, the BdR radius estimates or every
Fontaine ring lemma listed in the setting. These are distinct nodes,
not consequences of determinant algebra. In particular the radius term
p^(4δ) used by the long-gap coefficient is still a separate supplier.

Source ledger (paths relative to compact src; authenticated locally):

| Path | Blob | Actual role |
|---|---|---|
| Lib/PadicHodge/WachKisin/PeriodMatrixBasis.lean | cd91a46eb5624b88af20a96d0450bdf059994b93 | exists_basis, both bounds, all tests and divisibility |
| Lib/PadicHodge/WachKisin/PeriodMatrixFrame.lean | 348d083320f3e9f59100db1a2f96f5a3f8e92923 | actual inverse block, lines 112–128 |
| Lib/PadicHodge/PeriodRings/BdR.lean | 326d41233ac7638a50194f3ade22350c9b038ad5 | exists_Ainf_eq_of_contraction |
| Lib/PadicHodge/PeriodRings/BdRPlus.lean | f828ee87f4914572d457b364b38c6c6b0fbc8372 | denominator and A0 approximation statements |
| Lib/PadicHodge/PeriodRings/AmaxStructure.lean | 1be9736d2c48bece6dd038c72d14b6f807cff9df | finite freeness; A structure and ideal comparison |
| Lib/PadicHodge/PeriodRings/ThetaKernel.lean | ab5766dd9ea95412ad15247cef74b9b701250797 | prime-to-p approximation criterion |
| Lib/PadicHodge/WachKisin/ChartScalars.lean | 8dc59315a323816ecb0eedf46b5aae0a8c714fc5 | extended coordinates and coefficient approximation |
| Lib/PadicHodge/WachKisin/HodgeFrame.lean | 158f4df424f222f593b6f2baee57a294ab221f03 | actual chart and Weierstrass properties |

Executed locally: exact ordered symbolic algebra checked QZ'=U from
QH_U=A_U, QL=τ^h I and μ=tEτ, retaining the order L V_U; exact
scalar algebra checked the extra p in the contraction induction via
ξ=pX. Both residuals were zero. These checks concern those identities
only, not the analytic limit or p-adic theorem. No Lean executable was
available for this derivation. Scalar algebra and
source correspondence are not a native replay or an independent audit
of this human proof. RUN29's six native probes and timeout retain their
earlier scope; no new verification result is claimed here.

RESUME HERE: audit the use of (8) in section 5, the Frobenius
conjugation in (4)–(5), section 6's Ax application, and sections 7–8's exact ideal arguments.
The quantitative radius is now derived in the companion radius appendix;
continue the initial crystalline period/coordinate construction.
Do not redo the finite cup algebra or global analytic endgame.
