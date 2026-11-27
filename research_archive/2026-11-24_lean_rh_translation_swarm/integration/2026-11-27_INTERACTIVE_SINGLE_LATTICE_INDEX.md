# One lattice index behind the three arithmetic penalties

27 November 2026. Source-matched exact lattice identity and a short bordered-Gram determinant proof. Mathematical derivation, not native Lean replay, CI result or complete RH proof. Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207.

## Inputs and continuity

Continue integration/2026-11-27_INTERACTIVE_FLAG_GRAM_UNIFICATION.md (e9d6914f, blob 27e91534ce826d2d84b3fa7cd842b2474c9294eb). Its shared-flag proof yields an exact cross Gram normal form and the HasLevel interface under the character-agreement premises. Here we start from the actual native HasLevel j hypothesis, not arbitrary agreeing characters or an unverified URT axiom. Source: New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641 (classCoord transport 135–145, frameValueIndex/xRowsIndex/saturationIndex/pairInvariant/minorNorm/classGauge 335–368); New/Filling/LinkPairing.lean a802533ca5a385d6f44c3254f1a4d600b28fc416 (bordered determinant 15–49 and integral lifts 50–125); Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727; CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18. All symbols below use that source's frame.

## 1. Exact one-index identity (arithmetic unification)

Let n=rho, r=n+1, t=min(j,n). In the native integral adelic chart set R=O-hat, K=A_f(E), L=R^(dim V), k=termPosition(c,c',gamma). The termsOver hypothesis makes k and its inverse integral. Write U=span_K(e_0,...,e_(n-1)), V=kU, and U_0,V_0 for the first t columns of the respective frames. Use letters A=L intersect U and B=L intersect V for their integral coordinate lattices; A_0,B_0 are their first-t column spans over R. These are primitive in L because the e_i are part of the coordinate basis and k is integral invertible. In particular A and B are exactly the native column lattices, not just finite-index sublattices.

Let I=U intersect V and C_I=L intersect I. It is simultaneously A intersect B. Put M=A+B, M_sat=L intersect (U+V), and define the reduced integral lattice

    M_red = C_I + A_0 + B_0.

All these are actual integral submodules. Do not obtain M_red by declaring a rational triangular change of basis integral. At each finite place work over the local field and its valuation ring; use restricted products only after proving the local identities. The classCoord_mul_framePair and classCoord_mul_isotropicFramePair source identities transport the rational flag equations to these coordinates; the Gram pairing uses latMiddle.splitGram.

For j<r, the normal-form shared vectors at indices j,...,n-1 give n-j independent elements in I. The invertible native leading block Z_j excludes any intersection of either first-j isotropic prefix with the opposite full isotropic space: pairing with the opposite prefix gives Z_j or its adjoint times the coordinates, hence zero coordinates. Thus U=U_0 direct_sum I and V=V_0 direct_sum I over each local field. For j=r, all n columns are selected, and I=0 since Z_r invertible and a common isotropic vector is orthogonal to the full opposite frame. This also treats j=n, j=0 and n=0. The required leading blocks remain invertible after the native classCoord transport, which preserves the full frame Gram matrix.

Let F and G=kF be the full r-column frames including z. Their pairing maps on U+V are

    p(x)=G* J x,        q(x)=F* J x,

with J=latMiddle.splitGram, star transpose *. For j<r, ker(p|U)=I and ker(q|V)=I: I pairs to zero, and the first-j prefixes inject by D_j!=0. The same assertion for j=r follows from invertibility of the full Z. The maps therefore identify the finite quotients

    A/(A_0+C_I)  ~=  p(A)/p(A_0),
    B/(B_0+C_I)  ~=  q(B)/q(B_0).                         (1)

Their cardinalities are EXACTLY xRowsIndex j k and xRowsIndex j k^(-1), respectively. Indeed p(e_i) is the conjugate transpose of the i-th row of Z(k)=F*JG, and q(k e_i) is the i-th column of Z(k), equivalently the conjugate transpose of row i of Z(k^(-1)) since Z(k^(-1))=Z(k)*. Both maps use all r rows in the codomain, not only n. For t=n the quotients are trivial regardless.

The sum map A direct_sum B -> M has kernel {(c,-c):c in C_I}. Modulo C_I it yields an isomorphism

    M/M_red ~= A/(A_0+C_I) direct_sum B/(B_0+C_I).        (2)

Proof: given a+b in M_red, subtract its A_0 and B_0 components and a C_I component; the residual is an element of A intersect B=C_I, so both quotient classes are zero. Surjectivity is immediate. This proof works over R itself; the local field calculation above ensures each index is finite. Since the actual rational frame has full local rank on its span, only finitely many places have nonunit lattice-index factors (outside finitely many places denominators and one nonzero rank minor are units, including the integral chart's exceptional places). Equivalently use the native finite-index/nonzero conclusions for the named indices, with multiplicativity for nested submodules. In particular no count of an infinite quotient is treated as a positive integer.

Now multiply indices along M_red subset M subset M_sat. The exact identity is

    [M_sat : M_red] =
      saturationIndex(k) * xRowsIndex(j,k) * xRowsIndex(j,k^(-1)).
                                                               (3)

This is precisely w in exists_lifts_linkDiscSq_le. It packages the two row indices and saturation defect as one canonical arithmetic index, not an inequality between independent fitted factors. Also [M:A+B_0]=xRowsIndex(j,k^(-1)) and [M:A_0+B]=xRowsIndex(j,k), by the same quotient argument. This sharpens the interpretation of the native divisibility argument for the selected independent isotropic frame lattice. It does not claim a new numerical bound on w.

## 2. Same flag gives an elementary bordered determinant

This separate exact scalar calculation uses the rational chart, NOT a claim that adapted bases are integral. Let Z=F* J G in the rational chart, D_j=det Z_j. Let n=rho, and form the same P_b as HasLevel.abs_norm_bordered_det: all n isotropic f_i, first t isotropic g_i, e*_a for t<=a<n, z, gamma z. Let H_b=P_b* J P_b + N diag(0 on the isotropic columns; 1 on the e* and two z columns). Reorder these columns if needed; simultaneous row/column permutation preserves determinant.

If j<=n, the shared last flag vector has representation with leading coefficients c,1, |c|²=1. Therefore gamma z=c z plus a vector in U+V. Moreover U+V is spanned by all f_i and first j g_i, because the shared isotropic tail gives the exact dimension and span decomposition. Subtract that combination of unpenalized columns from gamma z. This is a determinant-one congruence that preserves the added diagonal correction (columns used have zero penalty). The last two columns are now z,c z. The first n columns pair to zero with each other and with these last two. Their pairing matrix with the next n columns (g_i for i<j, e*_a for a>=j) is C=[[Z_j,0],[*,I_(n-j)]]. Its determinant is D_j. The corrected last-two Gram block is [[0,-Nc],[-N star(c),0]], of determinant -N². Thus the full matrix has form

    H_b' = [[0,C,0],[C*,D,B],[0,B*,W]],
    det H_b'=(-1)^n det(C*C) det(W)
             =(-1)^(n+1) N² D_j star(D_j).                 (4)

The block formula follows by swapping the first two block rows then taking a block triangular determinant, or by expanding the first n rows. D and B need no estimates. For j=r there are no e*_a columns; reorder into the two full frames. The diagonal correction exactly cancels their self-Gram blocks, leaving [[0,Z],[Z*,0]], of determinant (-1)^r D_r star(D_r). These agree with the source's absolute norm (N^(2f) minorNorm(j,gamma))², with f=number of infinite places, Norm(N)=N^(2f), and minorNorm=|Norm D_j|/N^(2(j-n)_+ f). The argument eliminates the auxiliary Cramer computation for this human determinant identity; it preserves the exact source diagonal correction.

## 3. Actual implication and limits

In LinkPairing.exists_lifts_linkDiscSq_le, the native conclusion is that some integral lift basis has

    linkDiscSq(v,e) * [M_sat:M_red]^2 <= minorNorm(j,gamma)^2.

This reformulation follows by substituting (3) into the native conclusion. We have NOT independently reconstructed its remaining Jacobi-perpendicular-discriminant, primitive completion and lift-integrality proof. The original proof's selected frame lattice A+B_0 is NOT M_red; (3) must not be used to replace its columns without tracking the extra quotient xRowsIndex(j,k). Likewise the bordered Gram basis change in (4) is rational and cannot silently be used as an integral basis transformation.

The unification is geometric and arithmetic: the shared flag and its leading nonzero Gram block determine the reduced lattice and hence all three arithmetic penalties; the same shared last vector reduces the bordered determinant. The remaining Jacobi comparison may now be formulated on M_red and its saturation, if the lift and metric factors can be proved to descend to that quotient without loss. No original graph edit, no schedules or shared manuscript changed. No native replay or CI PASS. The exact source bodies listed above were read; independent audit and full cross-worker novelty search remain pending.

RESUME HERE: audit (1)–(3) against native submoduleIndex conventions and the adelic classCoord transport; audit determinant correction (4). Then reconstruct the jacobi_perp_discriminant caller using the exact index decomposition: [M_sat:A+B_0]=sat*xRowsIndex(j,k^-1), [A+B_0:M_red]=xRowsIndex(j,k). Track the native correction-lift quotient in that second factor, rather than assume it integral or repeat a Cramer expansion. No global RH closure claimed.
