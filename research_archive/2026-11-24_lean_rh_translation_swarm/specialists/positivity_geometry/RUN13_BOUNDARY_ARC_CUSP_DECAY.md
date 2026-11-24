# Geometry RUN13 — boundary arc, component separation and cusp decay
2026-11-24. DONE for bounded source-level argument, SOURCE-MATCHED; finite algebra regression executed. Imported analytic/geometric suppliers OPEN. Full RH project OPEN.

## Continuity and provenance
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, state/log/protocol/continuity excerpts, own RUN12, recent 40 peer commit titles and 14 peer file lists and available RESUME notes. Some peer scripts had no RESUME lines in returned diffs. No competing boundary-arc task located. General CI checkpoint 390, 19:40 UTC, run 45468931672 PASS (not independent RH validation). External blueprint referenced but not reopened. No physics work or changes to baseline queue.
P = 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head H = 9282d3a102c4aff0e6026746db2a8990f5d9cddd (merge #1313 2026-11-24 18:24:32 UTC, unchanged since RUN12). GitHub-returned blob identifiers, not independently recomputed raw hashes:
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoB.lean — 0c0ad5b8910bc85997bb107de3caab75c487ed0c; tendsto_arc_readsZ L22–128.
- src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoA.lean — 73af5a84e8e43d8a3d0e4b4066937e39941a83fe.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/EigenframeSpecializationUniformBoundStatement.lean — ac4042c7c70d159a0c86868cedd5958fa7869045.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/EigenframeSpecializationUniformBound.lean — 16845337c7602c2d065c0ec0d0f7d766035134bf.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/NormFactorInvLePowHolomorphicOrbitPeriodBoundStatement.lean — 287a529034fcffb7b38626c36ea5efc788f87769.
- src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/NormFactorInvLePowHolomorphicOrbitPeriodBound.lean — d727daeb769c962a6b21d0feb577c7c753428c41, nfac_bound2 L112–139, nfac_inv_le_pow_of_isOrbit_of_perBound L146–end.

At H old VuOntoB path returns 404; theorem now at src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean L1201–1307, blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e. Both theorem blocks have 106 trimmed nonblank lines, differing at eight supplier calls; same displayed arguments and rest of body. P wrapper GlobalTheory.T names and H direct calls:
exists_holomorphicFrameOrbit_lift_of_arc → GlobalTheory.ShFam.ArcLift.exists_orbit_lift;
exists_holomorphicFrameOrbit_unipotent_order_two → GlobalTheory.ShFam.OrbitUnip.exists_isOrbit_unipotent;
trivial_monodromy_orbit_converges_symmetric_domain → GlobalTheory.ShFam.OrbitLimit.orbit_limit;
boundary_arc_lift_not_converges_symmetric_domain → GlobalTheory.ShFam.BdArc.Leave.lift_not_converges;
holomorphicFrameOrbit_isotropic_vector_short → GlobalTheory.orbit_unipotent_short;
exists_arcLift_periods_tendsto_span → GlobalTheory.ShFam.PerLim.exists_periods_tendsto_span;
eigenframe_specialization_uniform_bound → GlobalTheory.ShFam.PerPoly.periods_le_pow;
normFactor_inv_le_pow_holomorphicOrbit_periodBound → GlobalTheory.nfac_inv_le_pow_of_isOrbit_of_perBound.
The last two P wrapper bodies directly delegate to these H names (first/exact/apply). No claim of elaborated equivalence for all eight.

## 1. Quantified conclusion
PositivityTheory.UnitarySelfGeneration.VuOnto.tendsto_arc_readsZ:
Fix E a Field, NumberField and IsCMField; H:Host E, D:Datum H, l:Level H, Xo:Moduli D l, c:Coeff l, r:natural, σ:c.F→+*C. Given V:Unf Xo c σ r, GoodEmb c σ, IsUnf V, T:TorFlag Xo c, ee:Ix D→Z with ee none=0, k:V.Comp, weight la:Wt (V.X k).Ψ r, P:Frame (V.X k).Ψ r→C with P∈(V.X k).SS la; chart-indexed h with Reads V T ee k P h and OffZero V T k h; i:T.X.F.J; affine open W of T.X.YY with domain Γ(T.X.YY,W) and W≤T.X.F.U i; arc s:C→CxPts(flagStr T.X,σ), radius ρ>0, assume
(a) s(u) lies in ptsIn W for every |u|<ρ;
(b) for EVERY f∈Γ(T.X.YY,W), u↦ev(W,f,s(u)) is complex differentiable on ball(0,ρ);
(c) s(0) is outside flagOpen;
(d) all u in ball with u≠0 lie in flagOpen.
Then h(i,s(u))→0 along the punctured-neighborhood filter at 0. No claim on arbitrary curves lacking (b) or (d), or on ordinary convergence without identifying the value at 0. No smoothness assumption in this theorem (needed by subsequent holoOn_bdZ). No nonnegative weight restriction or good-level assumption added.

## 2. Construct the actual algebraic boundary arc
A=Γ(W); q:Spec A→T.X.YY is the affine chart map tau hW; φ:c.F→A is induced by q followed by flagStr. hφ identifies q≫flagStr=Spec φ. The inclusion W≤U_i gives hz. The base compatibility hxc identifies (q≫T.X.π)≫T.Y.s with Spec φ≫Spec id; the generic-fiber pullback yields x:Spec A→gen T.Y with q≫T.X.π=x≫genι and x≫genStr=Spec φ. Apply exists_eigFrame_tau to obtain fr with hfr. ψ(u):A→C is evaluation at s(u) on the ball, and at s(0) outside (total extension; no differentiability outside used). On ball, Spec ψ(u)≫q=s(u), and ψ(u)∘φ=σ, via Spec.map_injective.
The key pointwise equivalence, for every p∈Spec C and u in the ball:
s(u)(p)∈flagOpen iff (Spec ψ(u)≫x)(p)∉genBd T.Y.
It follows from the two factorization identities, the range description of genBd and injectivity of the open embedding genι. Hypotheses (a,b) give IsArc, (c) gives the boundary at zero using subsingleton Spec C, and (d) gives the punctured interior. Thus hb:IsBdArc. For each punctured u obtain a matching frame by exists_matches. To choose a total family y(u), first exhibit a frame at the explicit nonzero point ρ/2 (positive radius). Then choice gives hm for all punctured u. This is not a claim of a canonical global frame.

## 3. Lift and two branches
Use the orbit-lift supplier to obtain component k', threshold T₀, positive-period orbit data M₀,γ₀, frame function xx(w), hT, hO₀, hL. Write u=eTwoPi(w)=exp(2π i w), nonzero. For Im(w)>T₀, hT guarantees u in the ball, hL and matching imply xx(w) lies in dom(k'), and exists_frBor_of_matches supplies chart frame Q and units t with ChartFr, FrBor(t,Q,V.un k' xx(w)) and t(some a)=1 for every a. The same chart exists by W≤U_i. All these conditions hold eventually in imTop, the pullback of atTop along Im.
The source applies tendsto_punctured to reduce to convergence along eTwoPi. The elementary filter reason is |exp(2πiw)|=exp(-2π Im w); conversely each nonzero u has a logarithmic lift w with Im w=-(log|u|)/(2π). Hence all sufficiently small nonzero u have preimages at arbitrarily prescribed large imaginary threshold. A limit on just a fixed ray or a single sequence would NOT suffice.

Branch k'≠k: if some x'∈dom(k) represented s(u), then the incidence equality and hQ.exists_frBor produce t' comparing Q to V.un k x'. Combine t,t' using Borel groupoid composition/inversion g1,g2. IsUnf applied to the two frames gives an equality of sigma pairs; their first coordinates force k'=k (contradiction). By OffZero h(i,s(u))=0 eventually. Thus limit zero with no cusp estimate in this branch.

Branch k'=k: substitute k'. Use unipotent-orbit supplier to replace M₀,γ₀ by M,γ retaining IsOrbit hO and unipotency hγ. If γ=1, trivial-monodromy orbit convergence supplies x₀,hx₀,x',a1,a2; boundary_arc_lift_not_converges_symmetric_domain contradicts these using hb (full boundary data), hm and hL. So γ≠1. Nontrivial unipotency plus hO supplies ξ,c',hξ,hc',ht by holomorphicFrameOrbit_isotropic_vector_short. The exact formulas inside these premises and the proof of the monodromy assertions are imported; no claim that unipotency alone is sufficient or that every nontrivial matrix has the required vector.
Next obtain m,v,Lp,Lm with hlim (componentwise period limits spanning both positive and negative blocks), then hper (uniform polynomial bounds on each strip), then C',B,hn (positive norm factor with inverse at most C' Im(w)^B eventually on ALL imTop). tendsto_cusp uses P∈SS, the orbit domain clause hO.2.2.2.1, hξ,hc',ht,hn to give P(xx(w))→0. This is an application, not a proof of the imported cusp theorem.
Finally Reads gives P(xx(w))=chr(ee,t) h(i,s(eTwoPi(w))). The source rewrites chr_of_some ht1, hee, zpow_zero, one_mul: all some-coordinates of t are units equal to one, and the remaining none-coordinate exponent is zero. Thus the factor is exactly 1, regardless of t(none). Both hypotheses are essential to this cancellation. Equality eventually transfers the cusp limit to h and tendsto_punctured finishes. There is no inequality cancellation with an unproved bounded character.

## 4. Actual period and norm bounds feeding the cusp estimate
The P statement eigenframe_specialization_uniform_bound has arbitrary CM field E, Xo,c, coefficient ring O with CommRing, β:O→c.F, model Z, σ, N, U:Unf, A CommRing, φ:c.F→A, x:Spec A→gen Z, eigframe fr, ψ:C→(A→+*C), radius r, y:C→FrPt, k, threshold T, M:natural, γ:GL(Fin N,E), xx frame function. Under GoodEmb, IsUnf, IsArc, matching on punctured ball, IsOrbit, IsLift, for EVERY vector v∈E^N and EVERY real strip radius R there EXIST real C and natural B such that eventually in imTop:
  |Re w|≤R ⇒ ∀ embedding τ:E→C, ∀ i∈N, |perFr(U.X k,xx(w),v,τ,i)|≤C (Im w)^B.
PerPoly.periods_le_pow first clears denominators with n>0 so n v∈Λ; perFr(nv)=n perFr(v), divides by n using positivity. The lattice-vector supplier gives C₁,B for supported period coordinates; definite p0=0 invokes a separate outside-CM-type bound C₃ (otherwise the implication is vacuous). Eventually Im w≥1. Use C=max(C₁/n,0)+max(C₃,0). In the CM type, index i<N-p0 uses the lattice bound and other indices give zero by definition. Outside it, if conjugate embedding is in CM type and p0=0 use C₃; if p0>0 use i<p0 or replace i≥p0 by p0-1 using the actual saturating index arithmetic. If neither embedding in the type, period is zero. No omitted out-of-range branch. Lattice existence and the two imported analytic period suppliers still require translation.

The norm supplier assumes E CM, N, X:Data E N, T,M,γ, x:C→Frame, la:Wt, n, v_j∈E^N, Lp_jτ∈C^(N-p0), Lm_jτ∈C^p0. Assume IsOrbit, limits of perFr for every j,τ and index in each block to Lp,Lm, both spans equal top for each τ, and the preceding period bound for every u∈E^N and R∈R. It concludes ∃ C real, B natural, eventually on imTop:
  0<nfac(la,x(w)) and nfac(la,x(w))^(-1)≤ C (Im w)^B.
In the actual proof choose Kpτ,Kmτ nonnegative by span_bound; majorant constants Dτj,D'τd nonnegative by maj_strip, where d runs over coordinate vectors. Let C=Στ(Kpτ+Kmτ)Σj Dτj; Bp=Σd Bq_d, Cp=Σd max(Cq_d,0), DQ=Στd D'τd, K=Στdc |τ((X.Gm)^(-1)_dc)|, S=Στi |laτi|. Set A=C+N² K Cp DQ. Work eventually with y=Im w≥max(R_threshold,T+1,1), |Re w|≤M. The source obtains b=bOf(X,x(w)) in Bor, with orthogonal rmul(x,b); diag_bounds, quot_bound, fil_bound give both d_{τi}=|bτii|>0 and
  d_{τi} ≤ A y^(Bp+2), 1/d_{τi} ≤ A y^(Bp+2).
For i≥p0, quot_bound controls the inverse and diag_bounds the direct term; for i<p0, the roles reverse using fil_bound. Constants cover the two bounds since y≥1, y²≤y^(Bp+2), C and N² K Cp DQ nonnegative. The actual nfac_bound2 lemma (orthogonal frame and right-Borel norm-factor law) says nfac=|bchar(la,b)|=∏τi d_{τi}^{laτi}. For any common bound R on both d and inverse, each inverse factor is ≤ R^|laτi|: la≥0 uses inverse bound, la<0 uses direct bound. Multiply nonnegative factors, nfac>0 and inverse≤R^S. Hence on strip inverse≤(A y^(Bp+2))^S. This holds also for S=0; do not divide by A or assume it strictly positive in the empty-index case.
To globalize, M>0 follows from IsOrbit. Translate w by integer multiple -floor(Re w/M) M. Imaginary part unchanged; reduced real part in [0,M), so strip bound applies. nfac_shift identifies original and translated norm factors. Thus the exact witnesses used by the source are C_out=A^S, B_out=(Bp+2)S. A strip-only estimate is not a global imTop estimate without the shift identity.
The source imports the proofs of span_bound, maj_strip, diag_bounds, quot_bound, fil_bound, nfac_shift, right-Borel law and nfac_ortho; only the scalar aggregation and signed exponent argument are expanded here. This is the native polynomial inequality supporting the boundary decay, not an arithmetic intersection bound in isolation.

## 5. Executed regression
Executed below in V8, exact rational BigInt and integer arithmetic: {"character":405,"nfac":42875,"strip":28020,"exponent":1260,"negative":6}. Counts are synthetic regression of character cancellation, signed product inequality, real strip reduction and exponent rearrangement; not native frame data, no proof of geometric existence, no kernel validation, no acceleration metric. Negative controls: drop ee none=0, drop t(some)=1, drop one of the two diagonal bounds (two controls), replace abs exponent by signed exponent, and falsely globalize a strip estimate. No additional hypotheses introduced in the translated theorem.
Reproduce by copying fenced JS into run13.mjs and running node run13.mjs:
~~~js
function certificate(){
 const ck=(x,m)=>{if(!x)throw Error(m)};
 const q=(a,b=1)=>[BigInt(a),BigInt(b)];
 const mul=([a,b],[c,d])=>[a*c,b*d],inv=([a,b])=>{if(!a)throw Error("zero");return a<0n?[-b,-a]:[b,a]};
 const eq=([a,b],[c,d])=>a*d===b*c,le=([a,b],[c,d])=>a*d<=b*c;
 const pow=(x,n)=>{if(n<0){x=inv(x);n=-n}let z=q(1);while(n--)z=mul(z,x);return z};
 const vals=[q(1,3),q(1,2),q(1),q(2),q(3)],counts={character:0,nfac:0,strip:0,exponent:0,negative:0};
 for(const t of vals)for(let a=-4;a<=4;a++)for(let b=-4;b<=4;b++){
  ck(eq(mul(pow(t,0),mul(pow(q(1),a),pow(q(1),b))),q(1)),"character");counts.character++;
 }
 for(const x of vals)for(const y of vals)for(const z of vals)for(let a=-3;a<=3;a++)for(let b=-3;b<=3;b++)for(let c=-3;c<=3;c++){
  const S=Math.abs(a)+Math.abs(b)+Math.abs(c),p=mul(mul(pow(x,a),pow(y,b)),pow(z,c));
  ck(p[0]>0n&&le(inv(p),pow(q(3),S)),"nfac signed product");counts.nfac++;
 }
 // Rational real coordinate j/7 and integral period M, including negative j.
 for(let M=1;M<=20;M++)for(let j=-700;j<=700;j++){
  const n=BigInt(j),d=BigInt(7*M),k=n>=0n?n/d:-((-n+d-1n)/d);
  const reduced=n-k*d;
  ck(reduced>=0n&&reduced<d,"strip");counts.strip++;
 }
 for(let A=0;A<=5;A++)for(let y=1;y<=5;y++)for(let B=0;B<=5;B++)for(let S=0;S<=6;S++){
  ck(eq(pow(mul(q(A),pow(q(y),B+2)),S),mul(pow(q(A),S),pow(q(y),(B+2)*S))),"exponent");counts.exponent++;
 }
 ck(!eq(pow(q(2),1),q(1)),"none exponent needed");counts.negative++;
 ck(!eq(pow(q(2),-1),q(1)),"some unit needed");counts.negative++;
 ck(!le(inv(pow(q(1,3),2)),pow(q(1),2)),"upper-only norm insufficient");counts.negative++;
 ck(!le(inv(pow(q(3),-2)),pow(q(1),2)),"inverse-only norm insufficient");counts.negative++;
 ck(!le(inv(pow(q(1,3),2)),pow(q(3),-2)),"signed exponent not natAbs");counts.negative++;
 ck(!le(q(100),q(1)),"bounded real strip estimate cannot be global without invariance: f(w)=|Re w|, R=1");counts.negative++;
 return counts;
}
console.log(JSON.stringify(certificate()));
~~~
For each original blob compare git rev-parse P:<path> using the full P above. Source links use https://github.com/leanprover-community/riemann-hypothesis/blob/40e56bab026552e089d7afcfeff08d2defb9c005/<path>. No authenticated root reachability established in this run.

RESUME HERE: reconstruct holoOn_bdZ (P VuOntoB immediately after tendsto_arc_readsZ) and its differentiableAt_of_lines, frequently_ne_zero suppliers, with the actual affine domain, dense flagOpen, nonzero basic-open function and line-test hypotheses. Keep analytic lift, unipotency, period-limit and tendsto_cusp bodies as explicit independent obligations; then GAGA. Request role-labelled root evidence for tendsto_arc_readsZ, holoOn_bdZ, PerPoly.periods_le_pow, OrbitNfacTwo.nfac_bound2, nfac_inv_le_pow_of_isOrbit_of_perBound and the eight H direct calls. HANDOFF TO geometry, integration, editor, audit, dependency, kernel, literature and theta. Project OPEN.
