# Standard edge: explicit saturated embedding io in native RestCloudMaps
26 Nov 2026. SOURCE-MATCHED HUMAN DERIVATION conditional on the earlier TiePsi integral identification; native replay outstanding; RH OPEN. Follows cbc42080244cbd1ccfd06e6d3780d1ce74cbdfa9 and 87c9b4ddbd2c9580ba13c03bcc94610be6917f17. Mission 3c16485083ac46320b2510ec5152b33ef87ea6a9. No new independent RH criterion.

## Result and fixed native packet

Fix the actual RestCloudMaps parameters p,n',R,mm,TT,a,ccl,aw,bw,lam0,A,B and all retained guards. Put m=mm+1>=2, k=m+1>=3, c=ccl, N=|TT|, O=R.O inside K=R.Kf, and omega=algebraMap O K R.w (uniformizer, p=omega^2). Write H=flatW m A B, H+=flatW m (A+2c) (B+2c). Work on the canonical edge e0 with src=W^k and tgt=diag(p^-1,1,...,1)W^k, W=R.W. This is the edge convention of lc_main and lb_D. The previous conjugation note reduces arbitrary e to e0; do not change weights, cutoff, or ring.

For each s in TT let d_s,e_s be the degrees A_s,B_s for even s and B_s,A_s for odd s (native lamAt). Both degrees increase by 2c in H+. Outside TT the weights are zero. Use the earlier TiePsi proof at each site: the representation Vsp of that site's flat weight is the bidegree (d_s,e_s) in
  K[x_{s,0},...,x_{s,m},y_{s,0},...,y_{s,m}]/(h_s),  h_s=sum_i x_{s,i} y_{s,i}.
The map is beta=deltaB o PsiXY from the previous note. Its image over O is exactly the standard dualWeyl integral lattice, and for a column basis g the normalized row transport is the native glAct g, with determinant twist already included. All of these are human-proved in the earlier note using the actual semistandard_basis and integral coefficient argument, pending Lean replay. Form the tensor product over all sites, equivalently the polynomial quotient with disjoint sets of variables and relations h_s, in the specified multibidegree. The equivalence with native Vsp and Hten follows from their tensorLat definition: renamed products in disjoint polynomial variables represent the tensor product, and tensors of field bases are independent (each factor is a subspace of its polynomial ring); over O the integral standard modules are the spans of those products. The zero-weight outside-TT spaces are constants, so omitted factors are harmless. Thus all subsequent calculations concern the actual representation spaces, not unrelated model lattices.

Define the candidate io: Vsp(H)->Vsp(H+) as multiplication in this model by
  q = product_{s in TT} (x_{s,0} y_{s,1})^(2c).
It is K-linear and has the required multibidegree. q=1 if TT empty or c=0. It is one choice before t,c2.

## Exact primitive multiplication (no valuation loss on the standard edge)

Choose a monomial order in which x_{s,m}y_{s,m} is the leading term of h_s for each site. For example lexicographic order placing all x_{s,m} before other x variables has this property (each h_s only uses its own variables). These leading terms are monic and mutually coprime between sites. The h_s form a Groebner basis, or equivalently replace x_{s,m}y_{s,m} by -sum_{i<m}x_{s,i}y_{s,i}; the replacements strictly reduce the offending exponent pair at a site, commute across sites and give unique normal forms. This is valid over O as well as K, because the relations are monic. The standard monomials (no factor x_{s,m}y_{s,m}) are a basis, separately in each finite multibidegree. Since m>=2, q uses neither of those forbidden variables. Multiplication by q sends distinct standard monomials to distinct standard monomials with exactly the same coefficients. In particular for ANY F in the field quotient of the relevant degrees,
  qF lies in the integral quotient iff F does.
It even gives an explicit integral retraction at the standard basis by dividing basis monomials divisible by q and sending the other monomials to zero. This establishes the saturation property without assuming the residue quotient is a field or using a determinant approximation.

For a midpoint of e0, edgeLat_RS identifies LeAt at every site with column basis D=diag(omega^-1,1,...,1). Let C_g denote normalized row transport expressed in the quotient as glAct g at each site. It acts x->gx, y->g^-T y. In the native Re definition, membership at this edge is equivalent to
  omega^Ar(H) C_D(F) integral,
since Re=omega^(-Ar(H)) HLe. Here C_D denotes the tensor of the same D on all sites. For H+ the corresponding exponent increases by exactly d=2c*N: Ar 1 sums the first entry of lamAt at each site; outside TT it is zero and even/odd both increase by 2c. Exact computation gives C_D(q)=omega^(-d)q. Therefore
  omega^Ar(H+) C_D(q F) = q [omega^Ar(H) C_D(F)].
By primitive multiplication above this proves the full required iff:
  io F in Re(H+,e0) iff F in Re(H,e0).
In particular io is injective and its image in the Re lattice is saturated; no loss in the edge valuation is incurred. The retraction in standard monomial coordinates can be transported by this normalization if needed, though the native CloudCount already uses LatRetract to construct it.

## Primal CCL inclusions, including ALL competing edges

At src(e0)=W^k, extO of the source is O^k, so the native H_L lattice is the standard integral model. Multiplication by integral q preserves it, hence preserves the source lattice scaled by any omega^(-t). This is the first CCL conjunct.

Every actual competing edge e' with src(e')=src(e0) has basis u in GL_k(W) by lc_main: its source columns span W^k, so u and its inverse have integral entries. Its tgt has basis u diag(p^-1,1,...,1). The Frobenius-twisted matrices u_s in K and their inverses are integral by the native sigma/ι/j assumptions (HidaSetting.frob and ι_comp, iterate s); edgeLat_RS identifies midpoint basis g_s=u_s D. Use the same q fixed at e0, NOT a separate q chosen at each competitor. For each site:
  C_{u_s D}(q_s) = C_D(C_{u_s}(q_s)).
C_{u_s}(q_s) is integral and has x-degree 2c and y-degree 2c. Under D, x_0 scales by omega^-1, y_0 by omega, and all other variables are unchanged. Each monomial can acquire negative valuation at most 2c from the x variables. Hence
  omega^(2c) C_{u_s D}(q_s) is integral
in the actual incidence quotient. Multiplying over TT shows omega^d C_g(q) integral. The same calculation with the Re normalization proves
  F in Re(H,e') => qF in Re(H+,e')
for EVERY competitor, with no change of edge-dependent parameters. It also works for e0, where the stronger iff was established above. Since io commutes with scalar multiplication, the inclusion is valid after multiplying the competitor lattices by any omega^c2. Taking the literal intersection in CCL gives for every t,c2 (even without needing the native c2 guard):
  io(CCL(H,t,c2,e0)) subset CCL(H+,t,c2,e0).
This proves exactly the io membership parts of RestCloudMaps on e0 under the prior integral model. The previous standard-edge conjugation lifts these parts to arbitrary e. No competitor is dropped and no new loss factor is introduced.

## Remaining exact tasks

Still need nb=dimCl and the U_b,L_a with L_a U_b=delta_ab p^ka_b io, ka_b within native depth cap, plus U_b and normalized dual L_a inclusion over all competing edges. This proof of io does NOT assume or establish those. Cloud multiplicity (middle-weight representation) is the next construction, not another outer RH criterion. Boundary case c=0 is fully explicit: base-weight guards force lam0=H=H+ (zero middle, zero outside TT), dimCl=1 by the Weyl product at zero weight, nb=1, io=U_0=L_0=identity, ka_0=0. All native inclusions and scaled dual conditions then become reflexive (Ar difference and conductor decrement vanish). This covers c=0 only; actual proof usually needs positive c. Do not claim that c may be set to zero for the full native family.

## Sources and status

Pinned upstream 40e56bab026552e089d7afcfeff08d2defb9c005. Retrieved:
- GrowthBounds/ColumnSpanDensity/CloudPropOfMapsRetractionBasis.lean 2210fae5f478cb7abb7e8d3a1c458173c4d8d85e: actual map existence, io iff and primal CCL clauses.
- GrowthBounds/ColumnSpanDensity/EdgeLatRS.lean 108c07e1f61ad045499eb2b3306210019a020236: midpoint/target column basis.
- GrowthBounds/ColumnSpanDensity/CloudCount.lean 42a708381aeef988c23942c8164a7796dccffcb3: native LatRetract consumer.
- GrowthBounds/ColumnSpanDensity/CloudBoundOfPropAndWeylDimension.lean d3d8346c39c11ed4ef30a40ddf25f79548b49661: dimCl and cloudAt.
- GrowthBounds/UnramifiedQuadraticSetting.lean c36e22ceab2885a6ab812f6187bfd1a86472a6ec: lamAt, Ar, Re, LeAt, Hten/Vsp and HidaSetting.
- GrowthBounds/LatticeSystems.lean f50decb576d61a3fee369d873ec573789f4ea64b: lb_D and lc_main.
- GrowthBounds/ColumnSpanDensity/InvariantSectionsTransportGL.lean 949bec1ce36a0068d2e5423c1323da023c5c66dd: transport for nonstandard edge.
- Previous integral TiePsi derivation 1b0fecbaeab764f7ca136b932a20f5f53139d540 read; exact source definitions supporting it retained there. Prior full-route note 42a5a4175bb8a47d1d7125eb13d92a988e57f5c0.
No native Lean replay or numerical simulation this run. Human model tensor identification and primitive monomial basis must be formalized along with TiePsi before counting the io clause as closed. No root-reachable unconditional closure, no measured speedup, no uniform high-prime estimate. 

RESUME HERE: use this fixed explicit q at the standard edge and construct U,L from the actual middle-weight semistandard basis, seeking exact products/retractions compatible with all competitors. Verify if native existing construction can supply the maps and depth cap; do not assume arbitrary orthogonal projections preserve integral lattices. Kernel/geometry/Landau replay previous TiePsi plus this exact io and c=0 case, preserve original fallback. HANDOFF TO integration and audit. RH OPEN.
