# The final Ribet coefficient at the arithmetic denominator caller

26 November 2026. SOURCE-MATCHED HUMAN DERIVATION, independent audit
pending. Completes the retained collection in `ribet_columns` from the
actual local, Selmer, odd-Sha and first-order inputs. This is an
implication with the explicit inputs below, not a new proof of those
inputs or of RH. No aggregate Selmer alternative is used.

Source `lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207`,
`grh-compact/src/`; Lean 4.35.0, Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`. Credit Alpöge, Sernau,
Anthropic collaborators and Claude.

## 1. Prior results and the exact target

Reuse, rather than rederive:

- mathematics `2026-11-26_COMPACT_RIBET_FIRST_ORDER_COEFFICIENT.md`:
  the actual first-order coefficient and its complete valuation cost;
- Galois RUN51, integration's tame caller and crystalline three-branch
  derivations: sum_blockLoss_le, for every choice of block moduli;
- balanced-row audit d064b084 and the common twist construction:
  the SAME row lattice and SelmerLengthLe with bound (10fr+1)c;
- the odd-Sha uniform X, including the e=0 class-number case;
- the existing trace-ideal conjugate-inverse transport and triangle
  suppliers, not a new independently selected triangle for each block.

Put r=rank of the row, t=V.rankDiff, T=D.t, f=D.f, H=D.h₂,
M=D.chosenGroupOrder, and, at the fixed prime ℓ,

    c=crudeUnit_ℓ=v_ℓ(M)+2^(−ℓ),  a=v_ℓ(X),
    B=H^27(c+a)+4f loss_ℓ.                              (1)

The data give r≥1, t≤T, H≥2, f≤H and T≤H. Keep all hypotheses of
ribet_columns: one apt label, IsAuxTwist of cost c, the common labelled
columns and their quadratic inertia law, a fixed selected lift π,
IsPrimeTriangle at multiplier ℓ^(Hh) and cost H^22 h with h≤v_ℓ(M),
the trace ideal and e_j(1)=1, and the row trace decompositions and
SelmerLengthLe at m0>floor(D.r B). The conclusion is the actual
IsRibetElement for the determinant defined by ribetNormaliser, with
surviving coefficient d satisfying

    v_ℓ(M^3 d)≤rB.                                     (2)

It is essential that π have a pointwise Selmer bound. Averaging it
over the lift family would not establish the first-order hypothesis.

## 2. Use one eventual coefficient ring and the actual blocks

Take the intersection of the finitely many eventual conditions on O:
the row and all column lattices, all polynomial coefficients, the
uniform sum_blockLoss_le, the SAME SelmerLengthLe witnesses, and
enough roots of unity for the odd-Sha bound. A finite intersection
is eventual. Choose O once afterwards.

For each lift in the finite distinguished set, trace nondegeneracy
and the actual trace identity identify its representation over Qℓ-bar
with ψR plus the string 1,cycInv,...,cycInv^(t−1). Choose the direct
sum of the integral lattices in these blocks as its O-lattice; transport
to the original representation by that isomorphism. On the other
columns use the given integral lattices. No assertion that the
conjugating isomorphism is integral is needed. The resulting u'_x are
integral and their characteristic polynomials, traces and trace ideal
are the original ones. The row's full integral matrix span is preserved
by its unit-valued twist ψ.

The auxiliary character is trivial on the decomposition groups above
ℓ by IsFromU1. Hence the row block restricted above ℓ is the SAME
local lattice to which sum_blockLoss_le applies. For the row block
take modulus ℓ^m0, and for every string block modulus ℓ^ν. Define
L_0,L_e as their normalized blockLoss values. Uniformity in all moduli
gives, on these actual lattices,

    L_0+Σ_(0≤e<t)L_e≤4rf loss_ℓ.                       (3)

The scalar γ, its value y, and the normalizer are the ones in the
chosen π's SelmerLengthLe. In particular cyc(γ)=1, the row is scalar
at γ, and y−1 is a unit. Do not substitute the other scalar inertia
used to construct IsBalanced or a separate scalar at a g-prime.

## 3. The row cost and the string costs

Let Z0 be the first-order row module: obeyingCocycles modulo ℓ^m0,
zero on the tied tame elements and at γ. Intersect with obeying crysRels.
The length of the quotient by that intersection is ≤L_0 after
normalization, by the definition of blockLoss. Actual graph-subrepresentation
continuity makes these functions continuous cocycles. Their common
unramified conditions and vanishing at the tied tame elements remove
the tied primes. The remaining intersection embeds in the Selmer
module with support ℓ, g, Q and Q-bar, vanishing at γ. Thus

    b_0≤(10fr+1)c+L_0.                                 (4)

This is an estimate of Z¹ functions, not H¹. It retains the local-unit
and unramified hypotheses that justify tame removal.

For the e-th string block, the actual first-order forms lie in the
unramified-off-ℓ-and-ties Tate cocycle module. Vanishing at the extra
tame generators removes Q and the g-places, and tied tame vanishing removes the ties when
the triangle step requires it. The Tate triangle argument then gives

    b_e≤L_e+a,          0≤e<t.                         (5)

Here the uniform odd-Sha theorem applies since e<t≤T and O has its
specified roots of unity; it includes e=0. This is precisely
hasTriangleCost_tateTwist, with crystalline loss L_e, the original
triangle and its coboundary guard. It does not charge the even classes.
Those are eliminated by the triangle's ordered detection, already a
retained input. In particular (5) does not assert that the even classes
are small.

## 4. The annihilating-polynomial and selector costs

The extra inertia set has two conjugate-inverse copies of each
auxiliary Q-place and each g-place not above ℓ. At Q use

    o_v(X)=ψ(σ_v)−X;

the assumed quadratic relation is o_v(u(σ_v))(u(σ_v)−1)=0.
Since ψ is anticyclotomic, its two conjugate-inverse values are
equal. IsAuxTwist therefore bounds their total v_ℓ(o_v(1)) by 2c.

At a g-place use o_v(X)=Σ_(0≤j<M)X^j. The inertia roots have orders
dividing M by the actual apt-label/eigenvalue bound, so
o_v(u)(u−1)=u^M−1=0. This includes congruent/nonsemisimple blocks
by the native polynomial-killing theorem, rather than just testing
eigenvalues of an arbitrary matrix. Its value at 1 is M. With
|P_g|≤4f, the two copies cost ≤8f v_ℓ(M). Altogether

    Σ_v v_ℓ(o_v(1))≤(2+8f)c.                           (6)

The common Lagrange denominator is C=ℓ^(Hh), so put s_C=v_ℓ(C)=Hh.
Let J index the original tie variables and s0 the finite detector set
of IsPrimeTriangle. Its cost says

    (|J|+|s0|)s_C≤H^22 h.

The actual first-order detector set is
s=s0∪image(withConjInv τ); hence |s|≤|s0|+2|J|. Consequently

    (|J|+1+2t|s|)s_C
       ≤(1+4t)H^22 h+Hh
       ≤[(1+4t)H^22+H]c.                              (7)

No division by h is made. In particular the case h=0 remains valid
without bounding |J| or |s0| separately. Conjugate inverse transport
uses the SAME tie variable, so |J| is not replaced by 2|J| in the
first term. Both |s| costs from first-order Ribet are kept.

## 5. Strictness before applying first-order Ribet

The first-order theorem requires b_0<v_O(ℓ^m0), in unnormalized
lengths. This cannot be obtained by assuming that its conclusion
already holds. Instead (4) and (3), independently available, give

    b_0≤(10fr+1)c+4rf loss_ℓ≤rB                        (8)

in normalized units: H≥2, f≤H and 10f+1≤H^27 suffice.
Since r≤D.r and m0>floor(D.r B), we have rB<m0.
Multiplication by length_O(O/ℓ) gives exactly the required strict
unnormalized inequality. The source's normLength comparison has this
same orientation. No new choice of m0 or γ is made.

All actual hypotheses of first-order Ribet are now available: row span,
scalar normalizer, strict row bound, the existing trace ideal and its
conjugate-inverse copy, Lagrange divisibilities, polynomial annihilators,
and the characterwise triangle costs. Apply that theorem on the
common O and transport its coefficient into Qℓ-bar. Its lower-monomial
vanishing and IsRibetElement witness are unchanged.

## 6. Final collection, using the original sufficient H^27

The first-order coefficient formula gives, in normalized units,

    v_ℓ(d)≤b_0+Σ_e b_e
          +tΣ_v v_ℓ(o_v(1))+(|J|+1+2t|s|)s_C.

Add the exact cost 3v_ℓ(M) of M^3. Equations (3)–(7) give

    v_ℓ(M^3d)
      ≤[10fr+4+t(2+8f)+(1+4t)H^22+H]c
          +t a+4rf loss_ℓ.                            (9)

The bound in (9) is an upper envelope; no equality with the source's
intermediate collection is claimed. It is enough for its ORIGINAL
budget. Since r≥1 and t≤T,

    10fr+4+t(2+8f)+(1+4t)H^22+H
      ≤r[4+10f+T(2+8f)+(1+4T)H^22+H]
      ≤r[4+13H+8H²+(1+4H)H^22]
      ≤6rH^23≤rH^27.                                 (10)

For the penultimate step, 4+13H+8H²≤16H²≤H^6≤H^23 and
1+4H≤5H for H≥2. The last step uses H^4≥16≥6.
Also t a≤rH^27 a. Substitution into (9) proves (2), with the
native rowBudget (1), no change to the original permitted loss.
The finite right side also proves that d≠0.

The same M^3 is the multiplier used by denominatorLe_rowBudget's
operator argument. Its chosen normalizer is
ribetNormaliser(γ_π,a,y_π,ℓ^(m0+Hh),θ), with the same π, row,
triangle and polynomial trace relations. The diagonal-Hecke transport
therefore receives the nonzero coefficient (2) at its actual caller;
no independently averaged determinant or new fit twist has been inserted.

## Source ledger and remaining dependencies

| Source relative to compact src | Blob | Role |
|---|---|---|
| New/Selmer/RibetElement.lean | 188eeb68d437bfa58bcc30042d4eee66c2111e18 | sum_blockLoss_le and ribet_columns |
| New/Selmer/RibetFirstOrder.lean | a05cb18d1ee62520f104d41361099db4b23cbe1f | precise coefficient valuation |
| New/Selmer/Corepresentable.lean | 3e401695d96b8ea826d60dadf0174d366f85d37c | triangle, twist and detector guards |
| New/Selmer/TateTwistSteps.lean | 941e383bd401d51e8a8c2d856320ef61c7fa17e7 | actual character triangle cost |
| New/Selmer/AptTupleDefs.lean | ba41ff0e729d5182ac236911898dfd0865165f8c | SelmerLengthLe and distinct scalar witnesses |
| New/Selmer/DeterminantBound.lean | 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df | actual blockLoss relation |
| New/Data/Magnitudes.lean | 306fe7e22378322422d11b1f8415fcdac75ffd6e | H≥2, f≤H, T≤H and data guards |

All source bodies were inspected. This closes the final collection
from the stated inputs, not their independent audit. The primitive
odd-Sha, row construction, local period and duality, trace-ideal/base-level,
triangle-existence and comparison-period proofs retain their separate
provenance. The normalized RowBalanced derivation already exists in
audit d064b084; it is not still an unattempted calculation, although
its own crystalline/duality inputs still require full audit.

No new Lean test, finite simulation, global proof or axiom claim.
Source-matched human mathematics and a successful native theorem probe
are different verification categories.

RESUME HERE: independently audit (4)–(9) with the actual block moduli,
then check the full same-witness chain denominatorLe_rowBudget →
FitTwistsExist → comparison determinants against the remaining primitive
suppliers. Do not repeat first-order coefficient Cramer or the analytic
endgame. Keep the native pointwise path as the sufficient route.
