# Variable-cost Ribet descent: targeted row, common cutoff, aggregate determinant
26 November 2026. Follow-up to the user request for serious progress and weighted determinant 77bbebba394477ed242e2052b6277f2bcc9f6e62. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207. This is a source-matched human generalization of the local Ribet caller from its retained native lower-level theorems; not a new kernel-checked proof, not closure of RH or of the primitive Selmer descent. Keep the unmodified proof as a fallback.

## 1. Identify the exact use of SelmerLengthLe

In AptTupleDefs.SelmerLengthLe, for each row R_alpha, fixed twist psi and cutoff M, the eventual coefficient-ring witness consists of a lattice, the same character psi, a scalar inertia element gamma_alpha with scalar y_alpha (y_alpha-1 a unit), cyclotomic character 1 there, and a nonnegative normalized length bound on the crystalline cocycles zero at gamma_alpha. Its native length bound is
 S0=(10 f r+1) cr_p, cr_p=ord_p(chosenGroupOrder)+2^(-p),
where r is the Galois row rank (NOT the dimension D of the good-lift space). Define SelmerLengthAtMost(S_alpha) by changing ONLY this last bound to S_alpha>=0. All other conditions and quantifiers are identical.

In the actual ribet_columns (RibetElement.lean, lines 122–223), the simultaneous choice of coefficient ring O' at lines 143–147 uses the eventual lattice/structural witnesses for ALL rows. The bound hS obtained there is the only quantity that needs a change. At lines 171–191 the invocation of ribet_first_order uses its strict hypothesis b0<addVal_O'(p0), with p0=p^M, C=p^(h2 h) and the normalizer parameter p0*C. The main row cocycle module is that at the TARGET pi, and the bound b0 is on that module only. Its inclusion into the crystalline-condition Selmer module at pi and the relative-length defect are precisely the lines 186–191 argument. At lines 211–223 hS appears in the final valuation estimate; it is used for this same target. The other rows are needed for the trace/block identities and the scalar-unit construction in ribet_first_order, not for bounds on their individual lengths. The code after 147 uses hR', hl, hpsi', e0, hy, c0 structurally; do not drop them.

## 2. Extract the variable-cost coefficient inequality

Use normalized valuations v_p(p)=1; O'.normLength converts DVR lengths and addVal consistently. Fix the native finite catalogue of all labelled columns and all lifted rows in the set X, a single auxiliary twist psi, a single cutoff M and a target pi. Let L_p be the native loss D p (crystalline loss), t0=V.rankDiff (number of cyclotomic characters), and Xodd the native uniform odd-Sha integer. Write u=ord_p(chosenGroupOrder), H2=D.h2. The following estimates are the ACTUAL lower-level supplier interfaces:
 - sum_blockLoss_le bounds the sum of crystalline relative lengths of the large row block and ALL t0 cyclotomic blocks by 4 r f L_p;
 - hasTriangleCost_tateTwist bounds b_e by the corresponding crystalline relative length plus length(shaOdd_e);
 - exists_length_shaOdd_le supplies normalized length(shaOdd_e)<=v_p(Xodd) for each e in the permitted range;
 - IsPrimeTriangle.detect bounds (|J|+|s_detect|) H2 h <= H2^22 h, with h<=u; IsPrimeTriangle.prod_dvd allows C=p^(H2 h). This is independent of the cutoff M and auxiliary level nu, although the primes and detecting set can depend on nu.

Let S_pi be the bound of the variable Selmer predicate at the target. Define b0 to be the ACTUAL length of the main row module before imposing the crystalline relations. The relative-length decomposition used at lines 186–191 gives
 normLength(b0)<=S_pi+defect_pi.
In particular normLength(b0)<=S_pi+4 r f L_p. Therefore the strict first-order guard follows as soon as
 M>S_pi+4 r f L_p.                                  (T)
No other packet length appears in this guard. Note that the true cutoff is p^M, while the argument of ribetNormaliser is p^(M+H2 h), exactly as in the native statement. Do not interchange them.

The first-order lemma is ALREADY parameterized by arbitrary b0 and b_e. Its conclusion (RibetFirstOrder.lean, lines 94–105) gives a coefficient d with
 addVal(d)<=b0+sum_e b_e
              + t0*(sum_v addVal(o_v(1))+2 |s| addVal C)
              + (|J|+1)addVal C.
Here s=s_detect union image(withConjInv tau) univ, so |s|<=|s_detect|+2|J|. At the auxiliary Q inertia o_v(1)=psi'(tau_v)-1; include both conjugate copies, hence the sum of their normalized valuations is <=2 cr_p by IsAuxTwist. At the chosen g inertia o_v(1)=chosenGroupOrder, so their contribution is bounded by the number of chosen-g places and their conjugate copies times u, exactly as in native RibetElement lines 192–204. These latter places lie over two fixed rational primes in a degree-2f field, so a coarse independent upper bound is 8 f u. Thus sum_v v_p(o_v(1))<=2 cr_p+8 f u. (The native last scalar line uses a sufficient 10f allowance.) Also
 2|s| H2 h <=4 H2^22 h,
 (|J|+1)H2 h <=(H2^22+H2)h.
These follow directly from the detect cardinality bound, without dividing by h (so h=0 is covered). Normalized lengths add under relative-length decomposition. When b0 and all b_e are added, their crystalline losses occur ONCE in the sum_blockLoss_le bound, not once per character and once again per row. Therefore the normalized valuation of the coefficient multiplied by chosenGroupOrder^3 is bounded by
  S_pi+4rf L_p+t0 v_p(Xodd)
       + t0*(2 cr_p+8f u+4 H2^22 h)
       +(H2^22+H2)h+3u.                              (V)
This is a raw variable-cost bound; no assumption that S_pi<=S0 in deriving it. All other terms are independent of S_pi and M. They can be uniformly bounded by the native scalar allowance
 K_p=4rf L_p + t0 v_p(Xodd)
    + [t0(2+10f+6H2^22)+H2^22+H2+3] cr_p,
by h<=u<=cr_p, enlarging as necessary. The native final arithmetic at 211–223 proves the corresponding original total is <=r rowBudget p. More explicitly the preceding raw bound (V) is bounded by the original source's final sufficient expression when S_pi<=S0; to retain a tight signed budget in a new caller, use K_p+S0 and independently check its scalar comparison, not merely assume all extra costs fit. With the native exact non-Selmer contribution bounded by K'_p and the original scalar inequality K'_p+S0<=r rowBudget p, the variable result is
 v_p(chosenGroupOrder^3 d)<=K'_p+S_pi.
For the new sufficient K_p above one can verify the comparison directly from the native magnitude hierarchy: rowBudget=H2^27(cr_p+v_p(Xodd))+4f L_p, t0<=D.t, H2=Data.r^8 and f bounded relative to H2 in the actual final scalar guard (the precise HasLogBound inequalities used by the source must be checked at the caller; we retain that guard). A conservative bound with an explicit K_p suffices for the conditional aggregate contract below, even before this optional comparison. No new numerical claim of savings.

The actual proof of ribet_first_order is unchanged, because b0 and b_e are free parameters. The native Cramer, prefix-product cancellation and trace/block identities are unchanged. At the caller in DenominatorBound, replace floor(D.r*rowBudget)+1 by a single M satisfying (T) for every target; the generic normalizer and prime triangle are selected AFTER this fixed M, exactly as before. Choose nu to dominate the normalizer polynomial's finite coefficient valuation (the existing generic-normalizer argument); the triangle bounds remain uniform in nu. Do not use a different M at different targets within a single selected row catalogue unless the corresponding normalizer is rebuilt; a common M is sufficient.

## 3. No circular cutoff: choose M before selecting the twist

The weighted common-root lemma from 77bbebba controls sums of nonnegative normalized Selmer lengths, but it needs a pre-existing finite cutoff M for the polynomial construction. To avoid choosing M after the twist, assume fixed finite packet multiplicities d_(j,alpha)>=1 and predetermined total length allowance S_total(p) for the full good-lift catalogue across all m powers. Assume also predetermined individual rank-one allowances S_rank1(p) (these have separate consumers and cannot be averaged away). Let r_max=Data.r and choose before constructing the twist
 M=1+floor(max(S_total(p),S_rank1(p))+4 r_max f L_p),
or any larger integer. For the eventual rings, if the weighted sum of normalized lengths <=S_total, each individual target length is <=S_total because its multiplicity is a positive integer. Hence (T) follows for every full good-lift target; rank-one targets obey their independent allowance. The same argument applies if S_total is per j by taking the maximum or their sum. No dependence of M on unknown actual lengths after selection. Because the native Fitting and pencil constructions work for any preassigned M (not only the original rowBudget cutoff), this is the correct quantifier order. It is not a claim that a cheaper pencil with aggregate control has already been constructed.

After the common-root selection, take packet bounds S_alpha equal to the selected polynomial valuations (finite because their weighted product is nonzero and finite). The Fitting base-change inequality yields normalized length<=S_alpha in every sufficiently large coefficient ring, with the same psi and unchanged local scalar/unit conditions. A finite intersection of eventual ring conditions supplies a common ring whenever the native argument needs it. One must retain the scalar inertia witnesses produced by the actual TwistForRows conversion; root selection alone does not construct those witnesses.

## 4. Transfer to the actual determinant caller

The remainder of denominatorLe_rowBudget after ribet_columns uses the resulting IsRibetElement and scalar bound at the target to construct the diagonal Hecke operator E_s composed with the target's tuple projection, with the same pairing integrality implication on the ENTIRE spanning set. Replacing the final exponent card(r)*rowBudget by K_p+S_pi changes only the target lower-bound estimate for this operator. Its other scalars on other eigensystems need not be lower bounded. Apply the proved variable-cost norm_gram_det_le_of_operators from 77bbebba to a packet-adapted basis, selecting d_alpha vectors from each packet. Then at the p-adic embedding iota,
 log|iota(det pairing matrix)| <= log p [sum_alpha d_alpha K_(p,alpha) + sum_alpha d_alpha S_alpha].
For fixed j, the rank r and t0 of the auxiliary pair are fixed, so the above common K_p may be factored out as D K_p. If labels have varying parameters, use their actual multiplicities and upper bounds, not a fictitious independent packet dimension. This transfers directly to the actual compressed comparison determinant via LiftVolumeHeight.norm_det_compressedGramOp_padic_le, which invokes DenominatorLe on one square pairing matrix. Retain the integral test projections, Auerbach choice, and class-automorphism factors in the source.

The global unified witness (95a78062) now requires only a prime-indexed upper bound E(p), uniform over all embeddings above p, on
 log p [sum_(j,alpha) d_(j,alpha)(K_(p,j,alpha)+S_(p,j,alpha))].
If sum_{p in finite T} E(p)<=m D r B0, the original arithmetic component of the unified product formula is recovered without any pointwise uniform Selmer cost. Here B0=budget/(mk); if use rank-varying pairs, keep the actual corresponding aggregate baseline. Rank-one Hecke repayment and ramified values still require their original separate bounds. No illicit swapping of prime and embedding quantifiers. This is an explicit weaker sufficient interface for C under the original lower-level geometry and Galois lemmas.

## 5. What is genuinely achieved and remaining

The weighted determinant was previously an abstract observation; this batch traces its exact use through the real Ribet coefficient and denominator caller. The strict cutoff is resolved at the level of the human argument: a finite total allowance controls every individual length sufficiently to choose a COMMON cutoff before twist selection, and the coefficient costs depend additively on the actual target rather than the maximum. The first-order theorem does not require a new proof for variable b0. A source-matched Lean version of the two outer callers is not yet compiled; source-level changes have been described, not pushed to upstream Lean.

The hard outstanding question is whether the aggregate Selmer bound can be established from strictly weaker hypotheses than the native pointwise descent. The present weighted root lemma still requires polynomial Gauss-norm witnesses; the native pencil construction supplies those via balanced rows and tied-prime descent. It would be misleading to claim the full descent removed. In particular the existing proof of exists_isPencil maintains each lower-cutoff length <=beta_i; replacing that invariant by a single weighted sum is NOT justified. If the length vector at the lower cutoff is (10,0) and the pointwise targets (5,5), a weighted total of 10 does not give the native pointwise invariant. A target growing at the next cutoff may be below its own beta. Need a genuinely weighted version of the unseen-class criterion or a different aggregate estimate on the Fitting determinants. The current reduction does not establish such a theorem.

No native proof graph edge deleted, no runtime improvement measured, no whole proof completed. Preserve the original uniform route; focus mathematical work on actual unseen-class/pencil argument and local Bessel/Schur bounds, not further determinant restatements.

Source ledger: compact pin above. New/Selmer/AptTupleDefs.lean ba41ff0e729d5182ac236911898dfd0865165f8c (SelmerLengthLe, crudeUnit); RibetElement.lean 188eeb68d437bfa58bcc30042d4eee66c2111e18 lines 122–223; RibetFirstOrder.lean a05cb18d1ee62520f104d41361099db4b23cbe1f (arbitrary b0 and b_e, strict cutoff, coefficient valuation); Corepresentable.lean 3e401695d96b8ea826d60dadf0174d366f85d37c (triangle cardinality); TateTwistSteps.lean 941e383bd401d51e8a8c2d856320ef61c7fa17e7; DenominatorBound.lean 5889d96fe1a6ad7926e0df09a7d183232f91c534; DeterminantBound.lean 686d1d98ab6ce7bb70ff4f087d2a10cbae8b85df; TwistTheorem.lean bdf0bed65edefd067b584695b1fac0b6acbbd754; LinePointPowers.lean 654567bac00341a29102ee3b83266bda10ab22a9; FitTwistsExist.lean da769eba595af2f883eed9b82dbd322a521aea14; LiftVolumeHeight.lean 87938141d4103b485fd5a7125721798f65f973f1.

RESUME: independently audit variable-cost raw valuation and exact K_p comparison; then prove or reject a weighted unseen-class criterion at the actual native pencil caller. If no stronger aggregate descent is available, use native sufficient pointwise estimates and advance the remaining primitives instead of optimizing the final determinant. 
