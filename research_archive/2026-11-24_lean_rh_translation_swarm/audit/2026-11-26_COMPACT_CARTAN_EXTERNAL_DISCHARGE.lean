import New.Selmer.TiltingLemma
import New.Selmer.RowBalanced

/-!
# Formal audit — standard Cartan theorem discharges the affine-hyperplane detour
26 Nov 2026. HUMAN source-matched alternative; prepared Lean probes, not compiled.
Source compact lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Alpöge, Sernau, Anthropic collaborators and Claude.
Mission 9f4a2272265e847b3a46422b02d4b37e976bee10, manuscript
9870fca9396c2306122e15b676aeef4b71233d74, AGENTS 8db0201d,
protocol 4b77b161, queue bbc46df7. Prior audit 7229fc7.
Peer RUN53 2bfff7c308435654e2f7a8aa4f64e0324c38a3af, independent
kernel RUN30 e2fd016daf162eb61682b316dc02fba0a9568415, RUN59 balanced
row 5ab68a24c790cc9f8ff56923fe20742c7382ba4f. These proofs are not
repeated wholesale. Latest mission explicitly permits precise external
standard theorems. This is a replacement at the actual C supplier,
not a new sufficient criterion for RH.

## 1. Source and precise external theorem

Native Lib/ClassField/GreenbergWiles/GreenbergWilesBound.lean
ddd24b83ab5ad751a37cf473fec89994838c2746, lines 39–71, calls
exists_permModule_isHigmanProjective and
IsMultiplicative.eq_one_of_isHigmanProjective from
Lib/Adelic/Cartan/ProjectiveModules.lean
284b9007cf1c69d6bfd81a4896aa55ca42684ea6, lines 84–108, 133–167.
That file labels its result as the Cartan map finite-cokernel theorem.
The exact standard theorem needed is Peter Webb, A Course in Finite
Group Representation Theory, Corollary 10.2.4, printed p. 178,
https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf#page=185 .
Text AND rendered page inspected this run. For a finite group Q and a
splitting field k of characteristic l, the integer Cartan matrix of kQ
is nonsingular over Q (the rational numbers). Equivalently the map from
the projective Grothendieck group to the composition-factor group has
finite cokernel. Only rational nonsingularity is used. Do NOT interpret
the displayed proof's sentence calling the integral map an isomorphism
literally: for the group C_l the Cartan matrix is [l], not unimodular.
This correction matters for justifying a positive power, not an
integral virtual projective identity without a multiplier.

## 2. Central admissibility is an exact direct summand

Fix the actual finite quotient Q=G/U, l prime, z central in Q.
All coefficient modules in this paragraph are finite and killed by l.
We may forget the extra coefficient-ring action and regard them as
F_l[Q]-modules: the defining equations and cardinality of T(V), the
native trivialised cocycle pairs, involve only the additive group and
G action (DiscreteUnits.lean 8f36777d8514e71b861507c96eee9d56f6d8fa61).
Continuity is unchanged, as the modules remain finite discrete and
U open. Thus the native arithmetic proof works for EVERY such
F_l-module, not only modules carrying the original O action.

Write ord(z)=l^j m, gcd(m,l)=1, S=<z^(l^j)>, e=m^(-1) sum_{s in S}s.
This is a central idempotent in F_l[Q]; eV=V^S. In characteristic l,
(z-1)^(l^j)=z^(l^j)-1. Consequently z-1 is invertible exactly when
eV=0: the RHS kernel is V^S, and a power of a finite endomorphism
is injective iff that endomorphism is injective.
The admissible category therefore is precisely the module category of
the direct factor (1-e)F_l[Q]. All subquotients stay in that category;
there is no assertion that all modules over Q are admissible.

## 3. Normalizer equality without special permutation modules

Retain native Sylow P/U, B=N_G(P), [G:B] and [B:P] prime to l.
The lifted family uses the SAME auxiliary primes indexed by iota x G/B,
identity coset representative 1, and the root-detection and cyclotomic
guards audited in RUN30. Do not replace them with arbitrary primes.
The P-fixed-factor induction and projective count bound every admissible
module over B/U by |V|^(d_B+1), d_B=d[G:B].
At the normalizer use the central idempotent for Q_B=B/U as above.
Every admissible V embeds in a projective admissible W:
let F=Map(Q_B,V) with diagonal action, (g f)(x)=g f(g^-1 x).
The constant functions embed V equivariantly. The isomorphism
f(x) -> x^-1 f(x) identifies F with the permutation regular module
tensored with the underlying vector space of V on which Q_B acts
trivially. Hence F is free over F_l[Q_B]. Put W=(1-e)F. It is a
projective direct summand and contains the constant image of V,
since e acts as zero on that image. Quotient W/V is admissible.
For a finite free module the coordinate projection onto the
identity basis coefficient has conjugate sum identity. Restrict
such a trace-one operator to a projective summand by composing with
the equivariant inclusion and projection; it still has trace one.
Thus W meets the EXACT native Higman hypothesis, not Maschke's
theorem (which could fail when l divides |Q_B|).
ProjectiveCount.lean 3e305e3ad3797609b9c4b4783ce7901ce828c3e9,
15–21, gives equality for W since K^B is totally complex and z acts
as 1 on mu_l, with the transferred root guard. Apply the native
short-exact count (DiscreteUnits lines 210–219) to V,W,W/V.
Both end groups have the bound, so middle equality forces equality
for each and surjectivity. This proves the B-bound is equality for
every admissible V without the special choice of Z and permutation
module in GreenbergWilesBound lines 39–41, 57–61.

## 4. Global multiplicative ratio and Cartan replacement

The B-to-G lifting and corestriction in RUN30 is retained:
for target (f,c), with native rho(g)f(x)=f(gx)+c(g), the
corestricted restriction has f_cor=[G:B]f+sum_d c(d).
Lift that constant, subtract its trivialisation and coboundary,
then multiply by the inverse of [G:B] modulo l. Since X is nonempty,
f determines c. Thus T is exact on the admissible F_l-category.
No quantitative loss of [G:B] is introduced in the final exponent.
Consequently R(V)=|T_G(V)|/|V|^(d+1) is a positive rational
multiplicative on short exact sequences. It equals 1 for every
admissible Higman-projective module by the exact projective count,
including the equality guards. All T groups finite by the same
native finiteness argument; do not use Nat.card=0 as a positive value.

Choose a FINITE splitting field k/F_l for Q; such a field exists
because the finite group algebra over the algebraic closure has
finitely many simple modules, each given by finitely many matrices
with algebraic entries. A common finite extension containing these
entries is a splitting field. Define R_k(M)=R(Res M), restriction
of scalars, on the admissible (1-e)kQ-modules. It is multiplicative.
Projective modules over this direct factor are projective over kQ
and hence projective over F_l Q on restriction: kQ is finite free
as F_l Q-module. Their underlying modules are admissible, so R_k=1
on projectives by the trace-one argument.

The decomposition kQ=e kQ x (1-e)kQ splits the Cartan matrix into
two diagonal blocks: simple and projective modules from one factor
have no composition factors in the other. By the cited nonsingularity
theorem the admissible block is nonsingular too. For any class [M]
in its composition-factor group, there is an integer h>0 with
h[M] an integer linear combination of admissible projective classes.
By Jordan–Holder and multiplicativity R_k defines a homomorphism
to positive rationals under multiplication. It kills that combination.
Therefore

    R_k(M)^h=1  ==>  R_k(M)=1.

For the original V, k tensor V lies in the admissible category and
its restriction is the direct sum of [k:F_l] copies of V, with the
same Q-action. Hence R(V)^[k:F_l]=1, so R(V)=1.
This replaces the actual affine hyperplanes, common affine extension,
translation-fixed filtration and orbit-stabilizer induction at
ProjectiveModules lines 133–167 by one standard theorem plus the
explicit central-factor and finite-field descent bridges. It is not
an assumption of Cartan invertibility for arbitrary finite-dimensional
algebras, nor a new assertion that the ratio is multiplicative without
the B-to-G argument.

For higher l^r torsion with U acting trivially, use the shorter
canonical filtration V >= lV >= ... >= l^r V=0, whose quotients
are killed by l, with the same U and z-1 invertible. The latter
follows because z-1 is an automorphism of the finite module and
commutes with l, hence preserves each l^iV bijectively. Each quotient
has the exact bound above; the original short-exact upper bound
yields |T_G(V)| <= product_i |l^iV/l^(i+1)V|^(d+1)
= |V|^(d+1). Do not claim equality at higher torsion.
This last filtration replaces general devissage only at the final
U-fixed prime-power caller, not at the P-fixed normalizer argument.

## 5. Actual C consumer and audit findings

New/Selmer/TiltingLemma.lean 62784266136a2936dd6f8d662b79fa051d28c470
lines 94–99, 133–147 calls hasFewCocycles_of_central for V=(O/a)^n,
with the SAME U, chosen split family, scalar and root guards. Therefore
the above supplies the identical exponent d+1; all local length,
mirror isotropy, crystalline and row conditions remain intact.
RowBalanced.lean ab1371acacfb1c5f262146456a380a9111ce6444 lines 124–175
and Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c
227–238 checked against peer RUN59. The trace scalar transport is
correct: for h=conjGal(j), trace(u(h)u(conjGal(g)^-1)) =
chi(j g^-1)^(-k) trace(u(g j^-1)) = chi(g)^k alpha trace(u(h)).
The matrix-span equality gives trace pairing with every matrix unit.
The k=Nat(t-1) convention yields the discrepancy
alpha(1-chi(g)^(k+1)), NOT alpha(1-chi(g)^t) at t=0.
Residue order comes from the distinct inertial scalar y with
j=1,...,4n+2 and exponent a=0 in AptTupleDefs lines 57–59.
The normalizer and mirror steps use different scalar witnesses as
native; no new weakening of the full span field of IsBalanced.

Failed/unsafe routes: direct restriction to B loses index in exponent;
ordinary Maschke averaging cannot divide by |Q|; integral Cartan
surjectivity is false (C_l example); using algebraic closure directly
makes finite-cardinality ratio undefined, hence finite splitting field
and restriction necessary. None of these shortcuts used.

Original graph unchanged. Proposed HUMAN replacement graph:
hasFewCocycles_of_central -> projective count + root transfer +
normalizer upper bound + central idempotent/projective embedding +
corestriction exactness + Webb Cor 10.2.4 + prime-power filtration.
Original/reduced machine graphs and prior axiom evidence retained,
no global edge deletion asserted. New external named theorem is
mathematical, not a new Lean axiom. Native verification remains separate.
Local command -v lean/lake/elan produced no paths. Actual CI state
rh-compact-primitives-replay-20261126/status.json a56e2d3a and
outputs/targeted_results.json 088cd2ec reread: run 45803534769,
six named probes in TiltingLemma and Filling.Moments have only
propext, Classical.choice, Quot.sound; JetExponentBound build timed
out 124; all_requested_checks_ok=false, full_RH_replay=false.
This does NOT compile this alternative. No native engine run on compact
pin, no imported RH root, no fabricated PASS. Prepared probe commands
below, not a formalization of Webb. Independent human audit requested.
No synthetic finite diagnostics: mathematical argument is universal.
Verdict AGREE with native C count; PARTIAL for whole reconstruction.

RESUME HERE: editor/literature adopt the precisely cited Cartan
finite-cokernel bridge in place of the affine-hyperplane proof if
desired, retain native proof as provenance. Audit IsRow.inClass_of_isLatticeIn
lines 43–66, specifically simultaneous polynomial root transfer through
commuting semilinear Frobenius and actual column-to-lattice witnesses.
This is a separate prerequisite for the local crystalline bounds.
HANDOFF TO integration, human editor, Galois, literature, kernel.
-/

#print axioms SplitPlaces.card_trivialised_of_isHigmanProjective
#print axioms DiscreteModule.IsMultiplicative.eq_one_of_isHigmanProjective
#print axioms SplitPlaces.hasFewCocycles_of_central
#print axioms IsPencil.length_le_of_unseen_class
#check IsRow.inClass_of_isLatticeIn
#check IsRow.eventually_isBalanced
