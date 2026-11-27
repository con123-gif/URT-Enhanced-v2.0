# One flag-Gram normal form: character agreement, rank, and discriminant

27 November 2026. Source-matched mathematical derivation conditional on the preceding flag-shift proof, with an exact Hermitian block decomposition. Completes the human algebraic argument for the remaining guards in CrudeEnergy.CharsAgree.exists_hasLevel under its retained premises; not a native replay or a verified replacement. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.

## Inputs and continuity

Reuse integration/2026-11-27_INTERACTIVE_FLAG_SHIFT_AND_RANK.md (3fe5ad1a, blob 394f3ea7d012725f7458998cb122ba66f6cb741d). For agreeing characters the shared flag is a terminal interval beginning at j in [0,r], where r=rho+1. Its common vectors w_a=F p_a=G q_a for a=j,...,r-1 have p_a,q_a supported through a with leading entries c,1 and c*star(c)=1; no nonzero common vector has a coefficient vector supported below j on either side. Thus dim(im F intersect im G)=r-j, and minimal IsNormalForm is j. This is conditional on the exact character and Eichler suppliers in that note, not a new assumption that arbitrary flags align.

Native Setup.lean (622e7ebe5c04b7ae87652e460762da7fb2e40727, lines 65–107) specifies r=rho+1 columns f=(e_0,...,e_(rho-1),z), r-1 hyperbolic pairs, positive definite middle X0 with Gram I and h(z,z)=-N (N>0). Work over the actual CM field E, with its conjugation and a complex embedding when using positivity. G=gamma F, gamma is an isometry. Let U=span(e_i), J=ratGram, Z=F* J G (star transpose), D_l=det of first l rows/columns of Z, D_0=1. These are the native frameProducts, leadingMinor and frameDisc. In particular F*JF=G*JG=diag(0_(r-1),-N). The last direction is negative, not positive. Denote projection onto the actual positive middle X0 by pi_+. In the decomposition U + X0 + Ez + Udual, any v perpendicular to U lies in U + X0 + Ez and has norm h(v,v)=||pi_+v||²-N|v_z|².

## 1. The unified normal form

For j<r choose P,Q with first j columns standard coordinate vectors and remaining columns p_a,q_a from the shared flag. They are upper triangular and invertible; diagonal of P is (1,...,1,c,...,c), diagonal of Q is all 1. Thus their leading-block determinants have norm one. The actual adapted frames are

    F P = [F_<j | W],     G Q = [G_<j | W].

For a<j the column f_a is isotropic and perpendicular to every column in F; g_a similarly for G. Hence the two mixed blocks against W are zero, and W*JW=diag(0_(r-j-1),-N) because its G-coordinates have top coefficient 1 and earlier columns have zero top coefficient. Consequently, exactly over E,

    P* Z Q = Z_j direct_sum 0_(r-j-1) direct_sum (-N),    (U1)

where Z_j is the actual leading j-by-j block. This is the cross Gram normal form; P,Q are changes of basis for the two DIFFERENT frames, not one similarity transform. If j=r use P=Q=I and just Z_r=Z, with no shared negative line.

## 2. One positivity argument proves invertibility of the remaining block

For j<r suppose Z_j y=0, extend y by zero to length r, set v=Gy. In the adapted basis (U1), v is perpendicular to all F; thus v is perpendicular to U and z. Also y_last=0, so h(v,v)=0. Since v lies in U+X0, positivity gives pi_+v=0, i.e. v lies in U, a subspace of im F. But v is a common vector with G-coefficients supported below j, which the minimal common flag index forbids unless v=0. Injectivity of G gives y=0. Therefore D_j != 0. This includes j=0 via the empty determinant convention.

For j=r, suppose Zy=0. Again v=Gy is perpendicular to U and z, so its norm is nonnegative, whereas h(v,v)=-N|y_last|²<=0. Equality forces pi_+v=0 and y_last=0. Hence v lies in U and is a common vector. Since j=r means no intersection, v=0 and y=0. Thus D_r != 0.

This treats every possible j, using one positive middle form and one shared-flag premise. It replaces the separate paddedLeading kernel elimination in the human argument.

## 3. One adjugate identity gives the discriminant

For ANY native gamma, without character agreement, let a=adj(Z)e_last, v=G a. Then Za=D_r e_last and a_last=D_(r-1) by the cofactor identity (also for r=1). Thus v is perpendicular to U and h(z,v)=D_r, so v_z=-D_r/N. Comparing h(v,v)=-N|a_last|² with the orthogonal decomposition above gives the exact algebraic equality

    termDisc(gamma) = D_r*star(D_r)-N² D_(r-1)*star(D_(r-1))
                    = N sum_i (pi_+ v)_i * star((pi_+ v)_i).    (U2)

In particular it is nonnegative at every complex embedding. No inversion of Z was used. When Z is singular the adjugate can vanish, so (U2) alone does NOT identify rank or intersection.

For agreeing characters, (U1) and D_j != 0 finish the classification:
- j<=r-2: the zero block has positive dimension, so D_r=D_(r-1)=0. Leading minors have been preserved up to norm-one factors by the upper triangular basis changes.
- j=r-1: |D_r|²=N²|D_(r-1)|², so termDisc=0, even though Z is invertible. It is incorrect to equate vanishing discriminant with singular Z.
- j=r: D_r != 0, hence a != 0. If termDisc=0, (U2) gives pi_+v=0, so v lies in U+Ez=im F. Since v=Ga is nonzero, this contradicts the trivial intersection. Thus termDisc>0 at every embedding.

In particular, for every agreeing gamma,

    D_j != 0;  termDisc=0 iff j<r;
    rank Z = min(r,j+1);
    dim(im F intersect im G)=r-j;
    dim ker Z = max(dim(im F intersect im G)-1,0).          (U3)

The native HasLevel definition in CrudeBoundDefs.lean (0ba0d2532b14c414b9032466b79e10d4d60c3d18) is IsNormalForm j AND D_j!=0 AND (rho<j iff termDisc!=0). Here rho=r-1, and all three now follow from the shared flag, (U1) and (U2), including the exact actual source case termDisc=0 in CrudeEnergy.lean 67–82. This is a complete algebraic human derivation of that interface conditional on the flag-shift/character result. It does not establish HasLevel for arbitrary nonagreeing gamma.

## 4. Use, limits and evidence

Actual native definitions read: Setup.lean above; New/Filling/EichlerFlag.lean (3da2606a049a092719b779802cb8ead3af7141ce, frameDisc and link definitions); CrudeBoundDefs.lean above (HasCommonFlagVector, IsNormalForm, HasLevel, CharsAgree); New/Filling/CrudeEnergy.lean (da67bf862a4c5e72ab6a81a7dfb462545cd8833f, 46–82 and energy caller); LinkPairing.lean (a802533ca5a385d6f44c3254f1a4d600b28fc416, 174–179, cofactor/positive-middle usage). The new argument is direct exact mathematics using the specified form, not a synthetic matrix regression. No native Lean or CI verification performed. The prior shared-flag derivation and exact character normalization still require independent audit. Prior manuscript searched for frameProducts rank, flag block diagonal, termDisc intersection, adjugate discriminant and leading minor nonvanishing; no matching unified derivation found there. Other worker notes and literature not exhaustively searched; no external novelty claim.

This supplies a local unification in B: characters -> shared flag -> one cross Gram normal form -> rank, discriminant and level. It does not replace quantitative weighted pair-count, local energy, or arithmetic determinant estimates in A/C. It is not a global RH proof or a root dependency retirement.

RESUME HERE: audit the leading-column changes and sign in (U1)/(U2), together with the earlier shift/Eichler normalization. At energy_le_of_level_lt use j from the same gamma and preserve link and congruence guards. Next investigate whether the existing LinkPairing exists_lifts_linkDiscSq_le integral-lattice bounds can use the same adapted P,Q with integral denominators controlled by the actual saturationIndex; do NOT treat P,Q as integral or unitary merely because their determinants have norm one. All original graphs, source pin, shared manuscript, schedules and protected files unchanged.
