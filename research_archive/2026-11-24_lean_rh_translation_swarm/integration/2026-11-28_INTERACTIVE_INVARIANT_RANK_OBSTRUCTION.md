# Invariant rank obstruction: remove the spectral magnitudes entirely
28 November 2026. Human finite-dimensional theorem and conditional RH endgame reduction; no compact Lean replay or new proof of the native arithmetic inequality. Credit Alpöge, Sernau, Anthropic collaborators and Claude for original proof; Adriazola for related probability/precision work. Builds on fcdc42affc33a64cb5d63eb21985eac4b284848f and 1ec21b6755789a928ef60aef445eeb8bf3e2b6. No claim of novelty for general submodular maximization.

## 1. Exact rank theorem (no energy, singular values, or operator norms)
Let G act linearly on a finite-dimensional complex vector space W, d=dim W, let T:X→W be linear, v=dim X, and V_s=ρ(s)range(T). For a subspace F⊂W define
    g(F)=E_s [dim(F+V_s)−dim F]
        =dim V_1−E_s dim(F∩V_s).
For a real α≥0 define the deficit
    D(F)=α(d−dim F)−g(F).
Then
    max_{F⊂W} D(F) = max_{F G-invariant} D(F).
Proof: for every fixed V,
    dim(F∩V)+dim(F'∩V) ≤ dim((F+F')∩V)+dim((F∩F')∩V).
Indeed (F∩V)+(F'∩V)⊂(F+F')∩V, and the intersection of the two summands is (F∩F')∩V. The dimension identity for F+F' and F∩F' makes the term −α dim F modular. Hence D is supermodular:
    D(F)+D(F')≤D(F+F')+D(F∩F').
D is G-invariant, since translating F permutes the finite family V_s. The possible values of D are finite (all involved ranks are integers bounded by d and the group finite), so it attains a maximum. Choose a maximizer F_* of greatest dimension. Every translate ρ(s)F_* is a maximizer. Supermodularity forces their sum and intersection to be maximizers as well, since neither can exceed the maximum. Greatest dimension forces F_*+ρ(s)F_*=F_*, hence F_* invariant. This also proves that the maximal-dimensional maximizer is unique. No inner product, analytic estimate, or averaging independence is required.

For invariant F, g(F)=rank(X→W/F induced by T). Therefore the inequality
    rank(T mod F)≥α(d−dim F)−ε   for every invariant F
is EXACTLY sufficient and necessary for the averaged rank inequality g(F)≥α(d−dim F)−ε for EVERY subspace F. For arbitrary F some translate gains at least this mean. This removes the need to certify average projection spectra or leverage magnitudes. It is not an equivalence with the weaker existence-of-a-translate formulation in the native theorem.

## 2. Equivalent source-subspace criterion
For U⊂X let W_U=span_{s∈G} ρ(s)T(U), an invariant subspace. Since rank(T mod F)=v−dim T^{-1}F, the invariant rank condition is equivalent to
    dim U−α dim W_U ≤ v−αd+ε   for every U⊂X.
Forward: apply the invariant condition to W_U and use U⊂T^{-1}W_U. Reverse: for invariant F use U=T^{-1}F, so W_U⊂F. This is a pure dimension-expansion problem. If T has the native Bessel intertwiner T r(h)=ρ(h)T for H=reducedImage(besselS), only H-invariant U need be tested for the reverse implication, because T^{-1}F is H-invariant for G-invariant F. The forward implication still gives the bound for every U. For the full unramified map this is the symmetry identified in the earlier tree grh/src/New/Spanning/Unfolding/Moments.lean lines 151–366; transport to compact requires the same amplitude and coordinate conventions. No assumption that H acts irreducibly.

## 3. Exact conditional interface for the RH endgame
Take the actual native good-projected FULL Poincare map (before ramification), v>0 and separately prove d>0. Centrality gives V_s=ρ(s)V_1 as in compact FillingTheorem.lean and ShortAndEnough.lean. Let σ=b^(-3/2), α=v/(4d), ε=α σ d/4. The single sufficient arithmetic condition becomes
    dim U−(v/(4d))dim span_G T(U) ≤ 3v/4+σ v/16
for every H-invariant source subspace U (assuming full compact Bessel covariance), or every G-invariant F in the equivalent quotient formulation. This implies every current span of codimension r has a translate with rank gain ≥α(r−σd/4). If 0<α<1, iterate while r>σd/2:
    r_next−σd/4≤(1−α)(r−σd/4).
At most j=ceil[(4d/v)log(4/σ)] steps suffice; strict gain prevents repeats. Cost jv≤4d log(4/σ)+v≤5d log(1+b²) for b≥1000 (v<4d; compare 6log b+4log4+4 with 10log b). If α≥1, one translate suffices since the initial residual after gain is ≤σd/4; the F=0 inequality forces v≤4d/(1−σ/4)≤5d, so cost also fits. No independent v≤4d guard needed.
The native ramified subspace has codimension ≤b^-8 v (ChainValuation.lean, card_piPlaces, N−1≥b^9). For this SAME selected set of translates, restricting from full columns loses at most j b^-8 v≤5d b^-8 log(1+b²)≤σd/4. Thus the final deficit is ≤σd, with the original translate budget. Extract original independent integral short rows via A; no rescaling/whitening of the arithmetic vectors. The unrounded compact completion and eventual scale argument in 1879ed19189a3cdd78762e13f46a079f9d91a2d6 then conditionally gives the governing star inequality. This uses the relaxed rank, not the original stronger 4/b² deficit.

## 4. What the pattern means
All earlier moment/conditioning/spectral/leverage estimates were ways of excluding a dimension-deficient invariant quotient. This theorem proves that for mean rank expansion, an obstruction can always be chosen invariant, even if initially found in an arbitrary subspace. It reduces the geometric target to the actual module generated by each source submodule; it does not automatically prove the expansion bound. A map entirely supported in one target irreducible copy gives a counterexample to any assertion that finite label probability or covariance alone guarantees it. Even checking each irreducible sector separately may miss rank overlaps between sectors and multiplicity subspaces. Need prove the bound for the actual module map, perhaps via a quantitative dimension inequality for induced representations, not by assuming generic position.

Handoff: derive the dimension-expansion inequality using the native Bessel-period source, its module decomposition and arithmetic multiplicity data. Audit the exact compact source covariance and row positivity independently. Do not treat source Schur irreducibility, generic position or finite label weights as proof of expansion. No Lean replay, no removed arithmetic suppliers, no independent RH proof.