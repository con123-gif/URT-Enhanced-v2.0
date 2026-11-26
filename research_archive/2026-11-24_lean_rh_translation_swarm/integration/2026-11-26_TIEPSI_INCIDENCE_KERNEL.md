# TiePsi: explicit generic sections prove injectivity and the entire incidence kernel
26 November 2026. HUMAN PROOF / SOURCE MATCHED; native Lean replay outstanding. RH OPEN. Continues 84b090cae7ec1e0b1c7d6233300729e4a28685f5. At keyIneq_of the native caller still uses D1=D0+4*N*u0c, so the previous 2u improvement alone does not discharge its rank bound. Move upstream to the actual TiePsi supplier.

## Two of the five TiePsi components

Use precisely DeltaPsiH.lean: PsiXY sends x_i to the first column of the independent true matrix, and y_i to (-1)^i times the determinant after deleting row i from the first m columns of the independent false matrix. deltaB identifies the two matrices. Put n=m+1, m>=2, and h=sum_{i=0}^m x_i*y_i. Work over ANY field K. All specializations below are into rational function fields, so no assumption about infinitely many K-points or characteristic is needed. Use zero-based indices.

Lemma: for any (m+1) by m matrix C of column rank m over a field, the signed maximal-minor column y(C) is nonzero and spans the kernel of C^T. Orthogonality is Laplace expansion of a determinant with a repeated column; rank m gives nullity one. If the top m by m minor is d, the last signed cofactor is (-1)^m d. These are elementary determinant identities.

### 1. Injectivity of PsiXY before identification

Let F=K(x_0,...,x_m,y_0,...,y_m) with all variables independent. In the true matrix choose first column x (other entries may be zero). In the false matrix choose its first m columns, initially indexed i=0,...,m-1, to be e_i-(y_i/y_m)e_m. Their top block is the identity and each is annihilated by y^T. Multiply column 0 by (-1)^m y_m. Last column of the false matrix may be zero; the native covY only uses its first m columns. The resulting first m columns have top determinant (-1)^m y_m. Hence the signed cofactor vector is exactly y, by the lemma (last coordinate y_m and same kernel). Evaluating the target polynomial ring at these matrices gives an algebra hom to F whose composition with PsiXY sends every x_i,y_i to its corresponding independent variable. The canonical polynomial-to-fraction-field embedding is injective, hence PsiXY is injective. This is an explicit left inverse into a field, not a claim of a polynomial inverse.

### 2. Kernel after identification

Let A=K[x_0,...,x_m,y_0,...,y_m]. Let H=A/(h). The polynomial h is irreducible: view it as linear in y_0 over the UFD K[x_0,...,x_m,y_1,...,y_m]. Its coefficients x_0 and sum_{i=1}^m x_i*y_i have gcd one, so it is primitive and irreducible by Gauss' lemma. Thus H is a domain, and the classes of x_0 and y_m are nonzero (neither variable lies in (h)). In Frac(H), write the classes with the same letters. They satisfy y^T x=0.

Construct a single matrix whose first column is x, whose columns i=1,...,m-1 are e_i-(y_i/y_m)e_m, and whose last column may be zero. The determinant of the top m by m block of the first m columns is x_0. Because m>=2 there is a column other than x to rescale: multiply column 1 by (-1)^m*y_m/x_0. Then the top determinant becomes (-1)^m y_m, the signed cofactor vector has last coordinate y_m, and every column of the first m columns is annihilated by y^T. The signed cofactor vector is therefore exactly y. Evaluation at this matrix gives a K-algebra hom from the identified native target polynomial ring to Frac(H). Composed with deltaB o PsiXY it is the canonical map A -> H -> Frac(H), whose kernel is (h). Conversely delta_Psi_h already proves h maps to zero. We have proved EXACTLY
    ker(deltaB o PsiXY) = (hXY).
For f in native PolAB(a,b) killed by deltaB o PsiXY, write f=h*g. Because h has bidegree (1,1), decompose g into its finitely many bihomogeneous components. Multiplication by h shifts distinct bidegrees by the same (1,1); since A is a domain all components except (a-1,b-1) must vanish. If a=0 or b=0, f=0 and choose g=0 in the truncated native degrees. This proves the FOURTH component of TiePsi with its exact quotient bidegree and zero-degree guards. Together with injectivity, two components are supplied by elementary algebra, independently of any lattice normalization.

## What remains and what does not follow

The other three components of TiePsi are still retained: the exact twoSp image, the dualWeyl image of the identified map, and simultaneous integral lattice transport for both images using the same g' for all degrees. Kernel equality alone does not prove those image/lattice equalities; in particular the rational specialization uses denominators x_0,y_m and is NOT an integral lattice comparison. RestCloudMaps is separately retained. The argument can help the image proofs by giving an exact quotient dimension, but one must still identify the correct native representation and show inclusion/surjectivity. No statement that TiePsi as a whole or the high-prime estimate is now proved. No unconditional RH root closure.

## Sources and handoff

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005; retrieved exact files:
- GrowthBounds/ColumnSpanDensity/DeltaPsiH.lean c7cd969e6b9992f47c2a29e738c1cb5a12a6b809: covY, PsiXY, deltaB, delta_Psi_h.
- GrowthBounds/ColumnSpanDensity/ModelIdentificationOfExplicitMap.lean ed2073b58fbe5194fdcf9088488902bd6fc6558c: exact five TiePsi components and their consumer.
- GrowthBounds/ColumnSpanDensity/SingleWeightLatticeComparison.lean 82a10287c49d7ab9e270d063f828200c796a517b: twoSp.
- GrowthBounds/ColumnSpanDensity/HarProjEqZeroIff.lean 6d00c38dae18f0bd1f2920df5749227dfd474670: PolAB support bidegrees, hXY degree.
- GrowthBounds/ColumnSpanDensity/FactorizationBoundMonoLattices.lean dde56090153aec85dae30f9fd3113133db1e5850: actual keyIneq_of uses X.D1.
- GrowthBounds/ColumnSpanDensity/RhoLowerBoundLargeConductor.lean 3efd1244957f82fdd38dafb567441cf4af74745d: D1 definition.
Search of Cathedral commit titles TiePsi/cofactor/minor map/two-letter returned no matching prior result; not a full novelty search. Source proof and exact algebra above, no Lean replay or numerical test. Do not claim measured speedup.

RESUME HERE: formalize generic rational evaluation and kernel equality for PsiXY/deltaB in pinned Lean; prove other TiePsi image clauses by matching native highest weights and exact quotient dimension, then handle integral transport separately (avoid denominators in the lattice argument). Trace actual already existing TiePsi producer if available before duplicating its proof. Retain RestCloudMaps and all original family guards. HANDOFF TO kernel, geometry, Landau, integration, audit. RH OPEN.
