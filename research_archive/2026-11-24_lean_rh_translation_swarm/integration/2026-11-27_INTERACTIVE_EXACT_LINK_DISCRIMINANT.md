# Exact integral link discriminant: one saturated quotient, one determinant

27 November 2026. **DERIVED at the human algebraic caller, independent audit and native replay pending.** Credit Alpöge, Sernau, Anthropic collaborators and Claude. Compact source lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207, grh-compact/src. This supplies the missing LinkPairing.exists_lifts_linkDiscSq_le argument via a direct complement-basis determinant, and proposes an equality for the canonical full lift lattice, stronger than the required inequality. No root retirement, new Lean PASS or complete RH proof.

## 1. Actual input, no synthetic data

Use native termsOver and HasLevel j on the same c,c',gamma,k=termPosition(c,c',gamma). Reuse [single lattice index](2026-11-27_INTERACTIVE_SINGLE_LATTICE_INDEX.md), c9e286fb, for exact source definitions and the bordered Gram computation. n=rho, t=min(j,n), h=n-t, m=ambient dimension, L=integral lattice in the actual finite adelic chart, J its unimodular Hermitian Gram. Work over the product of local fields, with involution pairing conjugate places. Choose all bases adelically integral outside a finite set. The rational chart and finite chart are related by the exact classCoord c isometry; it fixes the hyperbolic coordinates (BoxPartition.classCoord_eq_fromBlocks), and transports both frames, including their isotropic subframes. Do not treat it as an integral rational basis change.

Write U,V for the two isotropic spans, A=L intersect U, B=L intersect V, A0,B0 for their first t columns over O-hat, I=U intersect V, C_I=L intersect I. Native HasLevel and D_j!=0 give U=U0 direct_sum I, V=V0 direct_sum I for j<=n, I dimension h, and zero intersection for j=r=n+1 (all n isotropic columns selected). For j<=n this follows from the triangular shared flag vectors and the leading j-block nondegeneracy. For j=r use invertibility of the full cross Gram and the fact that any common isotropic vector is perpendicular to the entire opposite frame. The native chosen independent isotropic matrix F consists of all first-frame isotropic columns and the first t opposite-frame isotropic columns. Thus its column lattice F O-hat=A+B0 and its span is U+V. Let F_sat=L intersect (U+V). From the previously derived exact quotients,

    w2=[F_sat:A+B0]=saturationIndex(k)*xRowsIndex(j,k^-1).
    w1=[A:A0+C_I]=xRowsIndex(j,k).
    w1*w2=[M_sat:M_red].

Both are finite positive integers, by local rank and finite bad places. No integral denominators of a rational normal form are assumed away.

## 2. Use the full perpendicular lattice, not an arbitrary lift

In the rational chart let W=(U+gamma U)^perp, lambda=linkMatrix gamma restricted to W. Its kernel is exactly I: if both middle projections vanish, perpendicularity to both isotropic frames first eliminates the dual-isotropic coordinates, so the vector lies in U and gamma U. Conversely a vector in I has both middle projections zero. The image is exactly the native link by definition. Over the finite adeles transport W by classCoord c; keep lambda as the rational link projection transported back to that chart.

Let s be the matrix of the actual e*_a for t<=a<n, and p the two actual last frame columns z,gamma z. On I the map s* J is an isomorphism onto the h tail coordinates. This follows from U=U0 direct_sum I and the standard hyperbolic dual pairing. Hence
    W -> E^h direct_sum link,   x -> (s*J x, lambda x)
is a rational linear isomorphism: kernel zero by the preceding kernel characterization, and every lift can be corrected uniquely by I to have any prescribed tail coordinates. Here J,s are read in the rational chart for this rational statement; transport them as above. Choose rational columns u0 lifting (standard basis,0), u1 lifting (0,v) for the given rational basis v of link. These exist by this isomorphism; no integrality assumption on u0,u1.

In the finite chart put W_L=L intersect (F span)^perp. Locally it is a saturated submodule of a free lattice over a DVR, hence free and primitive. Its exact sequence
    0 -> C_I -> W_L -> lambda(W_L) -> 0
has free image (finitely generated torsion-free over the local DVR), hence splits locally. Choose a basis of C_I, then lifts of a basis of lambda(W_L). Relative to (u0,u1) its columns C have coordinates
    [[a,z0],[0,e]]
with a,e invertible locally. This is the native primitive block completion but now chosen from the full saturated lattice. Assemble over finite places into adelic invertible a,e and z0: rational matrices and inverse minors are integral/unit outside finitely many places, the class chart is restricted adelic, and at good places the coordinate basis and projected sequence are integral and saturated. Thus e is in GL over A_f, and the columns v e are exactly the full integral link lattice. They satisfy HasIntegralLifts using the rational u0,u1 and the finite coefficients z0,e; C is integral and lies in W_L. This also handles h=0 by empty blocks.

The map s*J identifies a O-hat with tail coordinates of C_I. Since A is the standard coordinate lattice in U, its projection onto tails is onto O-hat^h with kernel A0. Therefore
    genIndex(det a)=[O-hat^h : a O-hat^h]=[A:A0+C_I]=w1.
This replaces the source's one-directional divisibility argument by an equality for this chosen saturated basis. Do not use it for arbitrary smaller lift lattices.

## 3. One complement determinant supplies the whole comparison

Work in the finite chart (star means conjugate transpose, at paired places it uses the conjugate place). Let R_b=[s,p], with s,p transported by classCoord c, b0=h+2, N the native level prime. Let the actual corrected bordered Gram matrix be
    H_b = [[F*JF,F*JR_b],[R_b*JF,R_b*JR_b+N I_b0]].
Let J'=J+N^-1 J R_b R_b* J. For a basis F0 of F_sat write F=F0 T; genIndex(det T)=w2. F0 is primitive. Unimodularity of J makes F0*J:L -> O-hat^dim(Fspan) surjective, including at conjugate split places since the conjugate primitive basis also extends. Choose integral columns E0 right inverse to that map. The basis C of W_L from section 2 is its kernel basis; [E0,C] is integral invertible. In that basis F*J [E0,C]=[T*,0]. No invertibility of F*JF or J' is needed.

Take the determinant of the single enlarged block matrix
    K = [[J,JF,JR_b],[F*J,0,0],[R_b*J,0,-N I_b0]].
Eliminating the invertible J yields
    det K=(-1)^(d+b0) det J det H_b,
where d=dim(Fspan). Eliminating -N I_b0 first instead gives (-N)^b0 times the determinant of [[J',JF],[F*J,0]]. Congruence by diag([E0,C],I_d) makes the latter a bordered matrix whose offdiagonal pairings are [T*,0] and [T;0]. Expanding the d border rows and columns gives (-1)^d det(T*T) det(C*J'C), irrespective of the other blocks. The integral basis change contributes a unit determinant and its conjugate; J also has unit determinant. Taking the actual adelic multiplicative index, invariant under star globally, proves
    genIndex(det H_b) = genIndex(N)^b0 * w2^2 * genIndex(det(C*J'C)).
This is the precise complementary determinant relation needed by the native caller, without an unexplained Jacobi inequality or any assumption that J' is nonsingular.

## 4. Identify the corrected metric and cancel the level factors

For x,y in W, h_J(x,y) equals their middle pairing in either frame because both dual-isotropic coordinates vanish. It is therefore the half-sum of the two middle pairings. Also p*J x=zFormPair*lambda x by the native framePair_last_eq_zFormPair_mul identity (here the star in text denotes matrix multiplication, not an adjoint on zFormPair). Hence the corrected form on W is exactly
    x*J'y = N^-1 (s*Jx)* (s*Jy) + (lambda x)* linkMetric (lambda y).
This is the actual native metric, not a positive definite substitute for the original ambient indefinite form. In the rational basis u0,u1 of section 2 it has diagonal blocks N^-1 I_h and v*linkMetric v; the latter is nondegenerate by native linkMetric_posDef. Congruence by [[a,z0],[0,e]] gives
    genIndex(det(C*J'C)) = genIndex(N)^(-h) w1^2 linkDiscSq(v,e).
The native definition of linkDiscSq is |Norm det(v*linkMetric v)| genIndex(det e)^2. The offdiagonal z0 cancels at determinant level even though it need not be integral in the rational coordinates.

Substitute into the single enlarged determinant relation. Since b0-h=2,
    genIndex(det H_b) = genIndex(N)^2 (w1*w2)^2 linkDiscSq(v,e).
The exact native bordered determinant (previous note, or HasLevel.abs_norm_bordered_det) is
    genIndex(det H_b) = (N^(2f) minorNorm(j,gamma))^2,
where f=numInfPlaces E and genIndex(N)=N^(2f). Cancel the positive common factor N^(4f). This yields

    linkDiscSq(v,e) * [M_sat:M_red]^2 = minorNorm(j,gamma)^2.

In particular the original required existential <= comparison holds with the same v and the constructed integral lifts, w=w1*w2 nonzero. The equality is for the canonical full lift lattice; a smaller arbitrary image lattice can have larger discriminant. Do not claim equality for every e satisfying HasIntegralLifts. The equality is a proposed exact strengthening, with independent verification pending; the required inequality follows from the displayed derivation under the same stated lattice hypotheses.

## 5. Evidence / next task

Source anchors read in this and previous turn: New/Filling/LinkPairing.lean a802533ca5a385d6f44c3254f1a4d600b28fc416 (15–125, native F,s,p,M, primitive construction and jacobi_perp_discriminant caller); New/Filling/BoxPartition.lean 53f11966247a892d94cf688e8b366e887a92f641 (59–145 and 335–368, link metric, lift definition, chart and index definitions); New/Filling/CrudeBoundDefs.lean 0ba0d2532b14c414b9032466b79e10d4d60c3d18; New/Filling/Setup.lean 622e7ebe5c04b7ae87652e460762da7fb2e40727. Reuse native adelic index/product formula conventions, finite local freeness and unimodular pairing. No code or Lean execution; this is direct proof algebra. Existing manuscript and latest reports of editor, URT, positivity, Landau and integration were checked for overlap: none of the inspected reports contained this exact saturated-lift determinant derivation. Other historical specialist files not exhaustively searched; no external novelty claim. No protected files, schedules, source pin or global dependency graph changed.

RESUME HERE: independently audit this exact equality at the actual caller, especially the restricted-product assembly, conjugate-place unimodularity, native genIndex conventions and the full-lift choice. Then consume the original <= consequence at exists_link_split_le_classGauge and pairInvariant_mul_le. The remaining B2 tasks are the minorNorm/link complement lower bound, common-link integrality, pointwise pair and weighted packing. Do not reopen the bordered determinant or redo the three-index upper bound without a specific discrepancy. Global B and RH remain OPEN.
