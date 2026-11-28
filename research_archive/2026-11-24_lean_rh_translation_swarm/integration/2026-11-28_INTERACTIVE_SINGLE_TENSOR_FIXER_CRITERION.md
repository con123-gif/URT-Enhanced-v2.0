# 28 November — one tensor Fourier criterion replacing the intermediate fixing-energy induction
Status: conditional mathematical derivation, exact finite-field regression checks executed, not native Lean compiled. Original compact proof credit Alpöge, Sernau, Anthropic collaborators and Claude. Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679. Follow the live mission/ledger and retain prior routes. Extends 1a08fa08; not another greedy constant optimization.

Read actual New/Filling/Moments.lean (energy_fixingSet_le, sum_le_of_positive_type, Fits.exists_translate_finrank_comap_le), New/Filling/CrudeBoundDefs.lean (fixingSet, FixesNormAtLeast), New/Heights/OneDeterminant.lean (card_mul_sum_det_le), New/Filling/CrudeEnergy.lean (energy_le_of_linkEnergy_le), Setup.lean, FixedLines.lean, FiniteSystem.lean, and ExtendColumns.lean (Shape.BesselIndex, n, leadingMinor). Search for simultaneous tensor fixer Fourier returned no matching archived result; not an exhaustive novelty claim.

## 1. One weighted good-cell supplier
Let W be the full set of chosen places above q0, f=|W|>0, q=q0, b>=1000, n=rho+1, r=k+2rho+1. Write E=mainEnergy and E_s=energy(amplitudeSum univ){s}, with the native normalization. At each w and order l=1,...,n, let B_{wl}(s)=A'_{wl}^T pi_w(s) A_{wl}, the actual leading-minor block used in the native card_mul_sum_det_le application, with A,A' injective (frame and Gram-transformed frame). The zero-order minor is 1. All local fields have cardinality q. Set
  a_w(s)=sum_{l=1}^n (#ker B_{wl}(s)-1)/(q-1),
  c=sum_{l=1}^n (1-q^(-l))/(q-1),
  P(s)=prod_w [(a_w(s)-c)/(1-c)].
Here 0<c<=n/(q-1)<=2 b^-9<1. Let G_good=fixingSet(empty): at least one place has all its leading minors nonzero. Because f>0, on its complement every a_w>=1, so P>=1. On G_good a_w=0 at each good place. Define
  W_good(s)=1_Ggood(s) [1+max(0,-P(s))].
The following ONE weighted energy bound suffices at the B3 root:
  sum_s W_good(s) E_s <= (1+8 b^-4) E.                 (ONE)
This is an alternative, not a claim that ONE is already proved or uniformly weaker than the old family of bounds. The weight can exceed one dramatically on some good cells. The native unweighted empty-mask estimate does not establish ONE. A direct weighted sieve or a stronger argument controlling the negative product is necessary.

## 2. All places in a single Fourier expansion
For any nontrivial additive character psi_w at place w, orthogonality gives, with K_l=#ker B_l-1,
  q^(-l) sum_{v,y in F_q^l, v!=0,y!=0} psi_w(y^T B_l v)
      = K_l - (1-q^(-l)).
Indeed the sum over y!=0 is q^l-1 when B_l v=0 and -1 otherwise. Hence each factor a_w-c has only the displayed terms, with BOTH vectors nonzero at EVERY place. No zero vector or intermediate mask survives the product expansion.

Let Theta>=0 be the actual positive-type weight with Gram vectors u_a and the native domination over all subsets (hB). For each selected tuple of l,v,y across all w, repeat the two-basis proof of card_mul_sum_det_le on the direct product of ambient vector spaces of dimension rf: use standard coordinate basis e_x and normalized Fourier basis f_z with pairing q^(-rf/2) prod_w psi_w(z_w^T x_w), with sign chosen to match the original native phase. The permutation actions are pi_w on one vector and inverse transpose on the other. Form the two sums over the SAME global group indexed by a with u_a as in the original proof. Their squared norms are |G| times the respective simultaneous vector-fixer mass, because equality of orbit tuples is precisely simultaneous fixation at all places. If Y is the maximum of these full-mask masses, Cauchy-Schwarz and grouping by a^-1 b give
  |sum_s Theta(s) prod_w psi_w(y_w^T B_{wl_w}(s) v_w)| <= q^(rf/2) Y.
No independence between group components assumed. Each of the full masks has exactly the native allowed vector directions at every place. The sum of absolute expansion coefficients per place for a_w-c is
  sum_l q^(-l)(q^l-1)^2/(q-1) <= n q^n/(q-1).
Consequently
  |sum_s Theta(s) P(s)| <= [ n q^(n+r/2)/((q-1)(1-c)) ]^f Y.     (TENSOR)

## 3. Terminal full-mask bound without any finite sieve
For full mask A=W, fixingSet is just simultaneous fixation, with no good-place condition. In the actual energy_fixingSet_le source the retained link set is {Lambda | A != univ}; for the terminal mask it is empty. Instead of invoking the main-term estimate, use energy_le_of_linkEnergy_le directly with R=empty, w=0, T=univ, X=q^f, C=b^(-6kf) E. The zero link-energy premise is immediate from R=empty. Native besselEnergy<=tailScale^(-44)E and tailScale=b^(kf/4) give tailScale^20 besselEnergy<=C and besselEnergy<=C; also tailScale^12 E/X^k<=b^(-7kf)E<=C. All s in the terminal mask satisfy FixesNormAtLeast s X by the same injective image of A into place/direction labels as the native proof. Preserve the admissibility, stability, positivity and size hypotheses of CrudeEnergy.
Therefore each actual terminal energy and hence Y is at most b^(-12) b^(-6kf) E. This is a source-matched human derivation using the existing full crude-energy theorem, not a new estimate for off-diagonal pairs or a new native replay.

By native q in [b^10,b^11] and k>=1000(2rho+2),
  n+r/2=k/2+2rho+3/2 <= (501/1000)k,
  q^(n+r/2) b^(-6k) <= b^(-489k/1000)<=1.
Also n<=b, (1-c)^(-1)<=2 and n/(q-1)<=2b^-9. Hence the bracket of TENSOR multiplied by b^(-6k) is <=4b^-9<1. Thus |sum Theta P|<=b^-12 E.

## 4. Single root conclusion
Pointwise 1<=W_good+P: on bad cells P>=1; on good cells use max(0,-P). Multiply by Theta and sum. Nonnegative W_good and native singleton domination imply
  sum_s Theta(s) <= sum_s W_good(s) E_s + sum_s Theta(s) P(s)
                   <= (1+8 b^-4 + b^-12) E <= (1+9 b^-4) E,
provided ONE holds. This is the exact original empty-mask global moment used in Fits.exists_translate_finrank_comap_le. The recursive intermediate local fixing-energy estimates are not used on this alternative logical path. Terminal is supplied by the already-required crude-energy theorem. Only ONE remains as the new energy supplier for this B3 endpoint; other upstream A/B/C and first-moment requirements survive.

## 5. Executed regression and limits
Local CPython Fraction exact tests: all 81 2x2 matrices over F_3, both leading block sizes, 162 exact Fourier identities (reduce 1+z+z^2=0); 4 distinct local (a,good) types (0,true),(1,false),(2,false),(5,false), c=7/9. Exhaustively combine those types at f=1,2,3,4: 340 exact pointwise inequality checks. These are abstract algebra regression controls, NOT actual native arithmetic Data. No native Lean compilation, no kernel dependency graph and no proof of ONE. The finite tests are not the proof; the tensor/Cauchy derivation above is. The weight obstruction is real: one good place and a highly singular block at another can give negative P of large magnitude. Do not infer ONE from unweighted energy.

RESUME HERE: audit the tensor Fourier coefficient proof and terminal CrudeEnergy caller, then attack ONE at the actual finite-system/global-sieve consumer. In particular explore a direct bound on the weighted negative-product part on good cells using their existing packet decomposition and fixed-cell arithmetic. If this is harder than the prior depth-discounted route, keep it as a conditional alternative rather than replacing the preferred live spine. No worker schedules or protected files changed. Full human RH proof remains open.
