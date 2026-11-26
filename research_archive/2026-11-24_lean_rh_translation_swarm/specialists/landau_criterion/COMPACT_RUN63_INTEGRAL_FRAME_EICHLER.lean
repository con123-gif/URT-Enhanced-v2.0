import New.Filling.StandardLevel
import Mathlib.Tactic

/-!
# RUN63 — integral hyperbolic frame, native Eichler lift and floor mass
26 November 2026. Human source-matched derivations; independent audit
requested; scalar certificates and native probes prepared, not compiled.
Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Credit Levent Alpöge, Luke Sernau, Anthropic collaborators and Claude.
Mission blob 9f4a2272265e847b3a46422b02d4b37e976bee10; read AGENTS,
SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, current manuscript
d6bcd68693074c5d4220541d68c61a222287cb42 and peer RUN65 integration
059f9ed689e4e62a89a26a31a299966227968c25, geometry RUN63
fcb667eaa02d6661703a5cebf9905633e83e8a47 (peak/cut, not this task),
dependency RUN63 8f02772b07ec68de2e9cf7bce464abb258d0981c (C).
Predecessor dec19e20cc253208d9d209bf035a723ae5ce8c6f.

## 1. Actual integral basis (StandardLevel.exists_isLatticeLevel)
Let A be the native finite semilocal place, R its integer ring, with
star preserving R, tau in R of trace one, c in R with c* c=-1
(the norm-minus-one supplier from IsAdelic is retained).
N in R self-adjoint. In the marked middle basis v,z and the
remaining k-1 orthonormal vectors, h(v,v)=0, h(v,z)=-1,
h(z,z)=-N. The inverse of the marked Gram block
[[0,-1],[-1,-N]] is [[N,-1],[-1,0]]; thus unimodular over R.
The actual first two columns of E are
    x=-v, y=z-N tau v.
Then h(x,y)=1, h(x,x)=0,
    h(y,y)=-N+N(tau+tau*)=0.
The determinant of this change is -1.

Split the remaining k-1=card(iota)+2m vectors into an untouched
orthonormal part and m pairs (a_j,b_j), in the native permutation
f. On each pair the actual columns of E are
    p=a_j+c b_j, q=tau a_j-tau* c b_j.
Their squared norms are zero, and h(p,q)=tau+tau*=1.
Their coordinate determinant is -c(tau+tau*)=-c, a unit of R
since c inverse = -c*. Cross-pair and untouched cross terms vanish.
Thus E* J E is the direct sum of the required hyperbolic planes
and identity, with E,E^-1 integral. Permuting the columns into
the native SplitIndex order does not change these facts.
The lattice volume is preserved: det E is an integral unit
(alternatively take the determinant of the Gram identity and
use star invariance of md). No division by 2, including dyadic
places. This supplies the F witness, hE and Gram equality in
StandardLevel:95-107 and the x witness: h(x,w)=w_z, x_z=0.

## 2. Exact native top-floor Eichler transformation
FinitePlaceDensity.IntegralPlace.exists_eichler_orbitPoint_eq:
write z for the marked vector, e for the actual chart output,
t=e_z=h(x,e), v0=e-z, Delta=h(e,e)-h(z,z), and
s=h(v0,e)-tau Delta. Then
    s+s*=h(v0,v0), h(x,v0)=t-1, h(x,x)=0.
For a unit t the actual native matrix G acts by
    G w=w+x h(v0,w)-t^-1(v0+s x) h(x,w).
To check preservation before any bounds, set a=h(x,w)/t,
b=h(v0,w)-s a and likewise a',b' for w'. Then Gw=w+b x-a v0.
The difference h(Gw,Gw')-h(w,w') expands into just three
coefficients after substitution:
    a* b' [t* - 1 - (t*-1)]
  + b* a' [t  - 1 - (t -1)]
  + a* a' [h(v0,v0)-s-s*] = 0.
This is valid over the native commutative star ring. G is
invertible: taking determinants in G*JG=J and using det J a
unit gives det G a unit, or use the adjugate. For nonunit t,
the native ring inverse t^(-1r) is zero and the actual
unexpanded expression G=I+t^(-1r)(...) is I. Do not use the
expanded formula on nonunits. If e lies in the middle space,
both x,v0 lie there; G fixes all earlier hyperbolic pairs and
is in GT rho. If Delta=0 and t is a unit, direct substitution
gives Ge=e+x h(v0,e)-v0-s x=z. Thus orbitPoint top G=e.
If additionally e is integral and t is an integral unit,
all entries of G are integral. G^-1=J^-1 G* J is integral
as well by the unimodularity proved above. This establishes
the native lift, not an alternative section with different
pushforward measure. On the nonunit set use the native
measurability of the total inverse; no continuity assertion
there is required for the measure pushforward.

## 3. Native top-floor chart lower mass
Place.flatChart in the actual E coordinates has output
    e= [ (t*)^-1 tau(-N-h(w,w))+t a ] x + t y + w,
where a is skew, w is the remaining-coordinate vector, and
y_z=1, x_z=0, w_z=0. For t a unit, the form value is
    h(e,e)=tau(-N-h(w,w))+tau*(-N-h(w,w))
            +t*t(a+a*)+h(w,w)=-N.
For t in R^x, w integral, a integral skew, E and the expression
are integral. Section 2 therefore maps this entire product
set into K(1). Haar on R^d gives mass one, and skew Haar on
integral skew elements gives mass one (RUN62 trace-one chart).
Since theta in the StandardLevel constructor is the pushforward
of this very product measure along the displayed native G,
    theta(K(1)) >= volume(R^x)*1*1.
This is the actual box_eq lower bound, with the same level F
and theta. The a.e. orbit equality uses ae_isUnit of the
native Place, not an assertion of equality at all t. Preserve
the distinct middle Haar normalization from RUN62.

## 4. Mixed-floor congruence preimage (StandardLevel:200-217)
Fix a<rho, W=V_{a+1}, e_a,f_a the hyperbolic pair at floor a,
and p=(v,beta) in W x skew(A). BigCell.heisenbergElem gives
    Y f_a=f_a+v+(beta-tau h(v,v))e_a,
    Y w=w-h(v,w)e_a (w in W), Y e_a=e_a.
It fixes earlier floor pairs. Write W_a=Re_a+W+Rf_a over A
(in this sentence R denotes scalar coordinates only when
intersected with the integer lattice; W_a itself is over A).
For u in S <= unipotentBelow a, the full W_a by W_a block of
u is identity: all these indices have equal compressed level
rho in FloorGroups.mem_unipotentBelow. Since Y sends W_a into
W_a, the W_a by W_a block of uY equals that of Y, exactly.
If uY belongs to K(g), its f_a column therefore gives
    v in g R^d, beta-tau h(v,v) in g R,
where d=k+1+2(rho-a-1). Since J integral and g=g* in R,
h(v,v) in g^2 R subset g R. Hence beta in g R.
Conversely those conditions imply Y-I has entries in g R:
all linear terms have a factor g, and the quadratic term
has a factor g^2. Y^-1=J^-1 Y* J is integral, so Y in K(g)
and take u=1 in S. This proves the actual preimage equality,
independent of the earlier-floor u, without using the stronger
content-index gauge at this consumer. No global deletion of
gauge hypotheses elsewhere is justified.
The skew condition says beta lies in g times the integral
skew subgroup since g is self-conjugate and a unit of A.
The preimage product mass is
    md(g)^d * sqrt(md(g)) = md(g)^(d+1/2)
by the RUN62 skew Haar chart. This is F.floorModulus.
For rho=0 no floor is asserted; the product is empty.
At each convolution step apply the native
ascConv_mconv_unfolding with precisely this S. Its retained
measure and support assumptions give the product floor masses
by induction, and hence the scalar v*U=1 from RUN62 at the
FiniteSystem packet coefficient. The mixed-floor premise of
that calculation is now supplied at the human level.

## Evidence, remaining graph and verification
Source bodies inspected (compact pin above):
New/Filling/StandardLevel.lean ec149f4a38c54931f75c7e106ce94d1d6e65c5a4
New/Filling/EichlerFlag.lean 3da2606a049a092719b779802cb8ead3af7141ce
Lib/Adelic/Adeles/FinitePlaceDensity.lean d53185b90cb994c0af5ed56e7cf23aba91230271
Lib/General/Measure/Place.lean 300ee7d1e3e3d7b1d2ec8538b7f6feb365c70975
Lib/DiscreteSeries/Bruhat/BigCell.lean da06dcfda1a1401b8ad51f94649da9b760907a87
Lib/DiscreteSeries/Bruhat/FloorGroups.lean ec03810781f335ba1c19f6b818b015f6d4014bac
Lib/DiscreteSeries/Bruhat/EichlerMaps.lean c1d16d7a700fa344bce743a2ead6ecee7ab0fa8a
New/Filling/GlobalToLocal.lean 6b717f446ef9a78dc4ae91400a2394bba8d91610
New/Filling/FiniteSystem.lean 1c169e04852f767f1d1a0140448d902c16dd04e7.
Original source graph: exists_norm_neg_one, IsUnimodular,
exists_eichler_orbitPoint_eq, chart disintegration and subgroup
measure -> exists_isLatticeLevel -> exists_isFillingLevel;
gauge, heisenberg congruence -> floorModulus -> ascConv ->
unfold_besselU -> FiniteSystem/Moments -> enough_forms -> star.
Reduced local human edges: explicit Gram blocks -> unimodular
basis; rank-two cancellation -> actual Eichler lift -> lower
box mass; compressed-level identity block -> congruence
preimage -> product mass. Keep original graph and all other
consumers; no claim of global gauge pruning. Context key:
compact pin, A,R,T,N,tau,c, same F,g,S,a, same theta.
Still retain norm-minus-one existence, exact quadric
disintegration, measurability and Haar convolution supplier,
remaining gauge content-index and zeta estimates and
groupMeasure_boxSet_le, plus Rallis test-space hypotheses.
These are not a claim that all IsLatticeLevel or IsStdLevel
fields have been independently reconstructed.

Local command -v lean/lake/elan returned no paths. No old-pin
native reducer applied to compact source. Reread actual historical
state receipts for strip root (blob b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc)
and prune native (7da354941e402b6f8b364ed03d8c5c82d27b7717):
status pass, returncode 0, old pin only; not this certificate.
No new Lean run or numerical experiment. Scalar certificates
below are not full formalization of the human derivation.
Independent audit requested; native obligations remain visible.

RESUME HERE: integrate Sections 1-4 with RUN62 and geometry's
packet coefficient. Next inspect actual gauge content-index
construction StandardLevel:153-197 and groupMeasure_boxSet_le
at 234-241; prove the native dimension surplus and content
moment at its exact caller. Retain quadric disintegration and
Rallis normalization separately. No further analytic endgame
reformulations. HANDOFF TO integration/editor, positivity
geometry, literature, audit and compact verification.
-/

namespace CompactRun63

theorem first_plane_norm {R : Type*} [CommRing R]
    (N t tc : R) (h : t + tc = 1) :
    -N + N*t + N*tc = 0 := by
  calc
    _ = N * (t + tc - 1) := by ring
    _ = 0 := by rw [h]; ring

theorem pair_det {R : Type*} [CommRing R]
    (c t tc : R) (h : t + tc = 1) :
    -(tc*c) - t*c = -c := by
  calc
    _ = -(t + tc)*c := by ring
    _ = -c := by rw [h]; ring

theorem eichler_cancel {R : Type*} [CommRing R]
    (t tc s sc q ac bc ap bp : R) (h : s + sc = q) :
    tc*ac*bp - (bc+sc*ac)*ap + bc*t*ap
      - ac*(bp+s*ap) - bc*ap*(t-1)
      - ac*bp*(tc-1) + ac*ap*q = 0 := by
  rw [← h]
  ring

#print axioms first_plane_norm
#print axioms pair_det
#print axioms eichler_cancel
#check IntegralPlace.exists_eichler_orbitPoint_eq
#check IntegralPlace.exists_isLatticeLevel
#check IntegralPlace.IsStdLevel.heisenbergMeasure_eq_floorModulus
#check IntegralPlace.IsStdLevel.ascConv_unitaryLevel
#check IntegralPlace.IsStdLevel.unfold_besselU
#print axioms IntegralPlace.exists_isLatticeLevel
#print axioms IntegralPlace.IsStdLevel.heisenbergMeasure_eq_floorModulus
end CompactRun63
