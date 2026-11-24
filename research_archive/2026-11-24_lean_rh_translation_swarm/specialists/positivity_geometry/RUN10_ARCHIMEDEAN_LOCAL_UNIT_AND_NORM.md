# Geometry RUN10 — local unit / holomorphic descent and archimedean generic norm
2026-11-24. SOURCE-MATCHED / local mathematical reconstruction, exact finite regression executed. Project OPEN.

## Continuity and provenance
Read AGENTS, RESEARCH_STATE and RESEARCH_LOG heads, RESEARCH_PROTOCOL and CONTINUITY_PROTOCOL, CI summary checkpoint 381, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN5 and RUN9, located RESUME notes for dependencies, integration, math, structure, audit (tied-window quantifier), character boxes, Galois, kernel, Landau, literature, acceleration, prime-window, editor, theta. No overlap found with the selected local norm chain. Blueprint not reopened; source primary. No physics changes. Source repo leanprover-community/riemann-hypothesis, pin 40e56bab026552e089d7afcfeff08d2defb9c005. Observed upstream head 1da818b50f1e18808db2792b9dc735bda8cb84d8 (15:42:48 UTC). The old LocalUnitMapSurjective and NormGenValLe paths now 404; the head WeilHeightArchimedeanContribution blob 7b15e39bef8c28ed9c6461f269032fcfbd5e622e explicitly lists them and VuOntoA/B/C in its clump header. This locates migration, not proof-body equivalence. Continue pin until checked. Source anchor ledger below records GitHub-returned blob IDs, not independently recomputed raw-byte hashes.

## 1. Statement and exact scope
The actual caller WeilHeightArchimedeanContribution declares NV, PublishedHodgeBundleTheorems, D:D7, T:Core D, j:nat, Y:Deep T j, e:nat, o:real, Y.Good e o, 2 < Module.finrank Q D.host.E / 2 (retain Lean's expression), Z:Comp Y.d.Xo₂ Y.d.c₂, u:AllWt.Weight(T.Q.Dw j), t:real, GoodOn with Y.U, xiR D, D.sp.W j, Y.dict, Z, G=wtOf ... u 0, BirOn same U,Z,G, NoBase same U,Z,G, 0<Y.dg u Z, N,m:nat, basis b of cuspOn Y.U Z G over c.F, generator matrix g of size N by m over c.F, A for every coefficient embedding (N by N complex), IsFrame of the stated normOn and latOn, sigma:c.F→C, rho:Om Z→C extending sigma (composition with algebraMap), tau:nat positive, and every f in smallL at G,tau,t. The result is
  |rho(genVal_Z f)| <= exp(tau*t) S^tau,
  S=archSize(A(sigma),(rho(genVal_Z b_i))_i).
The general norm_small_le below includes tau=0 and does not impose t>=0. GoodOn, NoBase, positive degree, field degree, and PublishedHodgeBundleTheorems are NOT deleted from the declared caller even if a specific local body ignores some. This is the bound used in RUN5 to construct small model sections.

## 2. What local_unit_map_surjective actually says
It is not a bare surjectivity theorem for a unit group. It asserts that for every good coefficient embedding sigma and P in the holomorphic submodule holSub of the unfolded charts with model weight G, there exist m:nat, complex a_i, rules f_i in extVanZ(TF.X, exOf ... u 0) such that for every w in framesOn(U sigma,Z), P(w)=sum_i a_i rdU(U sigma,f_i)(w). It takes NV, PublishedHodgeBundleTheorems, D,T,j,Y,e,o,hY, field-degree bound, Z, toroidal flag TF, u, GoodOn and BirOn as declared above. The source uses hY.unf sigma hSigma and keySec to get kappa. Rank p+q>=1 follows from hY.unf rank equality and D.R.two_le_m via definition Ranks.r. It obtains decreasing weight from BirOn: if adjacent indices m,m+1 within mult(embedding) violate G(m+1)<=G(m), NonDomVanish.eq_zero_of_lt forces every cusp form to zero; the linear map is zero by extensionality, contradicting hB.1. Induction on the index interval gives all inequalities G(j')<=G(i) for i<=j'<mult. The source does not assume all weights are natural or all components have positive multiplicity.

NV is a separate input: for every CM field, host, datum, level, moduli, coefficients and complex embedding, rank>=1, every natural weight a and integer parameter n:nat satisfying Dom a n, and every complex framed point y, there exist a',n' with Dom a' n', g in sec(a',n'), f in sec(a+a',n+n'), with both evaluations at y nonzero. Keep this precise quantifier and both nonzero evaluations; it is not automatic from the local algebra.

## 3. Twisting negative integer weights (VuOntoA.tw_of_dec)
For fixed y, set M=sum over embeddings and valid indices of |G_i|. Each -G_i<=M. The source obtains h of even positive weight n1=2(m+1) with h(y) !=0. The key section kappa.rho is a unit, so evaluation is nonzero by multiplicativity and preservation of 1 at tested complex frames. Set g=h^(M+1) kappa.rho^(M+1). Its natural weight is constant M+1 with second weight 2(M+1)m, and g(y) !=0. Define a_i=G_i+M+1 (converted exactly to Nat because positive) for valid indices and zero outside. Since G is decreasing inside each block, a is decreasing within the block, and the zero tail preserves dominance; second weight is even. Therefore Dom a (2(M+1)m). Use the original NV premise at that weight, and use the exact exZ equality and modelWt_add, with G.2=0 and the even second weight of the twist, to provide Tw V (exZ D G) k (modelWt V G k). The twisted natural exponent is not an additional free parameter; M is determined by G, m by the nonzero-section supplier. No division by a possibly vanishing value. The key-section existence and even-section existence remain explicit imported geometric inputs.

## 4. Global holomorphic-to-algebraic passage (VuOntoC.exists_comb)
With GoodEmb, IsUnf, TorFlag, exponent e:none-index=0, Tw on every chart, and P_k in SS(weight_k), obtain the finite chart type and Borel groupoid laws. Use toroidal_flag_smooth_projective to obtain smooth relative dimension d and projective flag scheme. For each chart k, open_secZ supplies a section h_k, reading identity and OffZero support. The imported holoOn_bdZ and open_holoZ show h_k belongs to R.holSec of the line bundle; sum h=sum_k h_k. It vanishes off flagOpen because each h_k vanishes there. To read h on chart k, all terms k'!=k vanish: a shared point would supply chart frames with a common Borel orbit, and IsUnf.2.2.2.1 forces the chart indices equal. Thus h reads P_k. Projectivity is used in AnRead.bijective_valC to turn h into complex algebraic section xC. Smoothness supplies local finite type. complex_section_finite_combination expresses xC as a finite complex combination of base algebraic sections s_i vanishing on the boundary; ruleTop and H0.ofSec identify the corresponding rules as members of extVanZ. holomorphic_extension_section_reading gives the chart equality. The wrapper local_unit_map_surjective restricts it to w in framesOn using the domain part hw.1 and CuspSecFin.mem_SS_of_mem_holSub. This reconstructs the assembly, not a proof of GAGA, the boundary-holomorphy arc estimates, or base-field descent independently. Those precise native suppliers are retained.

## 5. The cusp-form matching is uniform in the embedding
The statement and relay (ExtVanSectionHasCuspFormMatchStatement, blob c1245d83b62fbe32113faa33509ee3f0acab885a; ExtVanSectionHasCuspFormMatch, blob e94857f4888a24479faf513b39cf24a6c5fea045) reduce to ModelDimension.cusp_form_extension_vanishing. For any f in extVanZ, extVanZ_le_secZ gives section membership, exists_vanBd_of_mem_extVanZ gives s in boundary-vanishing space with matching component section, and vanBd_le_space supplies g in cuspOn with the same section. The source chooses g BEFORE the universal good embedding sigma and frames w. To turn equality sec₀_X,Z(f)=sec₀_X,Z(g) into equality at a point on Z, split on Tested y. Untested evaluations both use the same totalized zero branch. Tested evaluation of idem Z is 1 on Z; multiply f-g by idem Z, use sec₀_mul and linearity to get zero component section, then eq_zero_of_sec₀ and support to conclude idem Z*(f-g)=0. Evaluation gives f(y)=g(y); rdU definition on domain gives desired equality. This is not global equality of rules away from Z. In the caller choose g_i for the f_i from step 2, so Q=sum_i a_i rdU(g_i) belongs to the stated complex span and P=Q on framesOn. No new surjectivity or basis-size assumption.

## 6. The analytic norm inequality: one positive factor cancels
The general norm_small_le takes CM/host/datum/level/moduli/coeff/unfolding context, all good embeddings unfolded (hU), every dict sigma g in the appropriate unfolded domain (hd), Z,G with Even G.2, the pointwise span hypothesis from step 5, basis b/g/A and IsFrame, arbitrary sigma and rho extending it, tau:nat, t:real, f:cuspOn U Z (tau*G), hf in smallL. First norm_genVal_le: expand f=sum_j b.repr(f)_j b_j and evaluate using linearity and sigma=rho∘algebraMap. The scalar value is a complex bilinear pairing; norm_pairing_le with hF.herm and hF.norm gives
  |rho(genVal f)| <= petOn_sigma(f)*S.
This is not Euclidean Cauchy-Schwarz on arbitrary coordinates unless the frame metric is transported. hF is essential.

The source passes from sigma to goodOf c sigma only for chart evaluation. goodHom is rho when sigma is good, otherwise complex conjugation composed with rho; norm_goodHom preserves absolute value. Do not replace sigma in A(sigma) or petOn_sigma. GenFrEx and InfFr.nonempty produce a frame F from genFr and a Borel correction t^-1, preserving LiesOn Z. Its point belongs to framesOn(U(goodOf sigma),Z). For any section f' at exponent G', F.nrm_eq gives
  homN(G',f',F.pt) = F.fac(x,G') |rho(genVal f')|.
Here C=F.fac(x,G)>0 is the product of lieFacZ, positive chart nfac on the domain, and norm of a product of units. The source proves multiplicativity under even second weights; F.fac(x,0)=1 follows from C0>0 and C0=C0^2. By induction F.fac(x,tau G)=C^tau for every natural tau, including zero.

For every cusp f' at base weight, the pairing bound yields homN^2 <= (CS)^2 petOn_sigma(f')^2. bergCusp_le_iff then bounds the cusp Bergman quantity by ofReal((CS)^2) (extended nonnegative reals). bergCusp_eq_bergOn uses hd and the pointwise span hspan to pass to the full holomorphic Bergman quantity B at F.pt. SmallL's archimedean condition, specifically hf.2 at goodOf sigma, gives
  ofReal((C^tau |rho(genVal f)|)^2) <= ofReal(exp(2 tau t)) B^tau
  <= ofReal(exp(2 tau t)) ofReal((CS)^2)^tau.
All real quantities inside ofReal are nonnegative, and upper bound finite, so the stated ofReal multiplication/power and order lemmas reduce to ordinary real inequality. Since exp(2 tau t)=(exp(tau t))^2,
  (C^tau |rho(genVal f)|)^2 <= (C^tau exp(tau t) S^tau)^2.
Both sides before squaring nonnegative; taking nonnegative square roots and cancelling C^tau>0 proves the target. S=0 is allowed, no division by S; tau=0 uses power zero, including 0^0=1. No t>=0 needed. In the actual caller hY.dictU supplies hd, rank >=2 gives dimFlag>=1 and hP.p1 supplies toroidal flag, AllWt.even_wtOf supplies parity. Retain the caller's positivity and other assumptions. This is the exact bridge from analytic smallness to arithmetic small-section norm in RUN5.

## 7. Tests and limitations
Actual V8 BigInt run result {"twist":330,"nonDom":2471,"zeroTail":330,"negativeShift":260,"conjugation":25,"pairing":390625,"scaling":72900,"zeroS":18225,"zeroTau":14580,"negative":3}. Finite exact tests of signed weight twisting (single block, length 0–4, entries -3..3), Gaussian integer bilinear pairing in dimension two (ordinary identity metric, not arbitrary native IsFrame), conjugation, scalar cancellation for positive rational C and exp(t) and nonnegative rational S including S=0 and tau=0; three explicit negative controls. In the scalar test d cancels after denominator clearing, hence its loop does not represent independent mathematical cases. zeroTail/negativeShift, zeroS/zeroTau are subsets, not additional test counts. These are regression illustrations, not independent proofs of imported geometric or analytic results. No Lean kernel run or URT performance claim. No assumptions discarded. Source matches: 8 re-fetched blobs, 61 text anchors. The two relay blobs above were inspected earlier in this session, not counted in re-fetch ledger.

Save the following code to run10.mjs and run node run10.mjs:
~~~js
function regression(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 let twist=0,nonDom=0,zeroTail=0,negativeShift=0,conjugation=0,pairing=0,scaling=0,zeroS=0,zeroTau=0,negative=0;
 const weights=(n,a=[])=>n===0?[a]:Array.from({length:7},(_,i)=>weights(n-1,[...a,i-3])).flat();
 for(let n=0;n<=4;n++)for(const w of weights(n)){
  let decreasing=w.every((x,i)=>i===0||x<=w[i-1]);
  let M=w.reduce((s,x)=>s+Math.abs(x),0),a=w.map(x=>x+M+1).concat([0,0]);
  let dom=a.every((x,i)=>i===0||x<=a[i-1]);
  ck(dom===decreasing,"dominance equivalence");if(!decreasing){nonDom++;continue}
  ck(a.slice(0,n).every((x,i)=>x>=1&&x-(M+1)===w[i]),"exact twist");
  ck(a.slice(n).every(x=>x===0),"out-of-range zero");
  zeroTail++;twist++;
  if(w.some(x=>x<0))negativeShift++;
 }
 const sq=([a,b])=>a*a+b*b;
 const cm=([a,b],[c,d])=>[a*c-b*d,a*d+b*c];
 let ga=[];for(let a=-2;a<=2;a++)for(let b=-2;b<=2;b++)ga.push([BigInt(a),BigInt(b)]);
 for(const z of ga){ck(sq(z)===sq([z[0],-z[1]]),"conjugate");conjugation++}
 for(const a of ga)for(const b of ga)for(const c of ga)for(const d of ga){
  let x=cm(a,c),y=cm(b,d),lhs=sq([x[0]+y[0],x[1]+y[1]]),rhs=(sq(a)+sq(b))*(sq(c)+sq(d));
  ck(lhs<=rhs,"complex bilinear Cauchy Schwarz");pairing++;
 }
 // exp(t) represented by positive rational u/v, C = c/d, S = s/r, |rho f| = f/g.
 // Check the exact cross-multiplied squared premise iff the unsquared conclusion.
 for(let c=1n;c<=3n;c++)for(let d=1n;d<=3n;d++)for(let s=0n;s<=3n;s++)for(let r=1n;r<=3n;r++)
 for(let u=1n;u<=3n;u++)for(let v=1n;v<=3n;v++)for(let k=0n;k<=4n;k++)
 for(let f=0n;f<=4n;f++)for(let g=1n;g<=3n;g++){
  let L=f*(v*r)**k,R=g*(u*s)**k;
  let pl=(c**k*L)**2n,pr=(c**k*R)**2n; // d^k cancels identically after clearing denominators
  ck((pl<=pr)===(L<=R),"positive square and frame cancellation");scaling++;
  if(s===0n)zeroS++;if(k===0n)zeroTau++;
 }
 // Necessity of positive frame factor for cancellation when k>0.
 ck((0n*2n)**2n<=(0n*1n)**2n&&!(2n<=1n),"zero frame counterexample");negative++;
 // F(0)>0 + F(0)^2=F(0) forces F(0)=1; zero cannot substitute.
 ck(0n*0n===0n&&0n!==1n,"zero idempotent");negative++;
 // Nonnegative comparison required when taking square roots.
 ck((-2n)**2n<=(-3n)**2n&&!(-2n<=-3n),"negative square control");negative++;
 return {twist,nonDom,zeroTail,negativeShift,conjugation,pairing,scaling,zeroS,zeroTau,negative};
}
console.log(JSON.stringify(regression()));
~~~

Source ledger for reproduction on pinned checkout (git rev-parse PIN:path and line text):
~~~json
[
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/WeilHeightArchimedeanContribution.lean",
    "sha": "8594fde18897fec5e51d38efa44601913999814f",
    "anchors": [
      [
        29,
        "hY.dictU"
      ],
      [
        38,
        "Nat.choose_pos h3"
      ],
      [
        39,
        "nonempty_toroidal_flag_bundle"
      ],
      [
        43,
        "local_unit_map_surjective"
      ],
      [
        44,
        "extVan_section_has_cusp_form_match"
      ],
      [
        50,
        "exact norm_small_le"
      ]
    ]
  },
  {
    "path": "src/Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/LocalUnitMapSurjective.lean",
    "sha": "c44f6011501e9d2938f71d934d931cf9b6d66a06",
    "anchors": [
      [
        9,
        "intro hNV _"
      ],
      [
        11,
        "VanishingBound.keySec"
      ],
      [
        24,
        "hB.1 (LinearMap.ext"
      ],
      [
        26,
        "NonDomVanish.eq_zero_of_lt"
      ],
      [
        29,
        "Nat.le_induction"
      ],
      [
        32,
        "VuOnto.exists_comb"
      ],
      [
        33,
        "VuOnto.tw_of_dec"
      ],
      [
        34,
        "mem_SS_of_mem_holSub"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoA.lean",
    "sha": "73af5a84e8e43d8a3d0e4b4066937e39941a83fe",
    "anchors": [
      [
        178,
        "theorem tw_of_dec"
      ],
      [
        183,
        "set M : ℕ"
      ],
      [
        193,
        "exists_even_sec_evR_ne_zero"
      ],
      [
        195,
        "set g : Rul"
      ],
      [
        207,
        "set a :"
      ],
      [
        211,
        "have hDa : Dom"
      ],
      [
        227,
        "Units.mul_inv"
      ],
      [
        235,
        "modelWt_add"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/HomogeneousNonvanishing/VuOntoC.lean",
    "sha": "3f17ffb43cc81093e5e19b9d9148dfc6c4fca2bd",
    "anchors": [
      [
        20,
        "theorem exists_comb"
      ],
      [
        28,
        "toroidal_flag_smooth_projective"
      ],
      [
        30,
        "open_secZ"
      ],
      [
        32,
        "holoOn_bdZ"
      ],
      [
        41,
        "Finset.sum_eq_single"
      ],
      [
        51,
        "bijective_valC"
      ],
      [
        57,
        "complex_section_finite_combination"
      ],
      [
        60,
        "holomorphic_extension_section_reading"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/CommonZeroEvaluation/CuspFormExtensionVanishing.lean",
    "sha": "8746de51258f8859cff21efd3cde070a015d19f8",
    "anchors": [
      [
        16,
        "evR_eq_of_sec₀_eq"
      ],
      [
        21,
        "by_cases ht : Tested y"
      ],
      [
        29,
        "idem_mul_mem"
      ],
      [
        37,
        "theorem cusp_form_extension_vanishing"
      ],
      [
        40,
        "exists_vanBd_of_mem_extVanZ"
      ],
      [
        41,
        "vanBd_le_space"
      ],
      [
        45,
        "hsf.symm.trans hg.symm"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/NefModelVolumes/NormGenValLe.lean",
    "sha": "6cd851860053c9317dea330616a5794758b57dae",
    "anchors": [
      [
        27,
        "theorem fac_nsmul"
      ],
      [
        39,
        "mul_left_cancel₀ hp.ne'"
      ],
      [
        46,
        "theorem norm_genVal_le"
      ],
      [
        53,
        "b.sum_repr"
      ],
      [
        56,
        "norm_pairing_le"
      ],
      [
        69,
        "theorem norm_small_le"
      ],
      [
        86,
        "InfFr.nonempty"
      ],
      [
        103,
        "bergCusp_le_iff"
      ],
      [
        106,
        "bergCusp_eq_bergOn"
      ],
      [
        108,
        "hf.2 _ hgood"
      ],
      [
        117,
        "ENNReal.ofReal_le_ofReal_iff"
      ],
      [
        126,
        "pow_pos hc τ"
      ]
    ]
  },
  {
    "path": "src/Development/AbelianVarietyTheory/Definitions/Divisors/WedgeNrmLeOfWedgeNormLe.lean",
    "sha": "f63b71f9b43b5a411b3b82d27c8a15d8f0e91e7e",
    "anchors": [
      [
        398,
        "def goodHom"
      ],
      [
        401,
        "(starRingEnd ℂ).comp τ"
      ],
      [
        403,
        "theorem norm_goodHom"
      ],
      [
        421,
        "theorem InfFr.nonempty"
      ],
      [
        425,
        "t⁻¹"
      ],
      [
        433,
        "theorem mem_framesOn"
      ],
      [
        178,
        "theorem fac_pos"
      ],
      [
        180,
        "theorem fac_add"
      ],
      [
        185,
        "theorem nrm_eq"
      ]
    ]
  },
  {
    "path": "src/Development/WeilBound/CoreStatements/NefModelVolumes/NV.lean",
    "sha": "d8e8822ea9cdcaf4e35a936057bdef69a7a596a3",
    "anchors": [
      [
        8,
        "def NV : Prop"
      ],
      [
        8,
        "Dom a' n'"
      ],
      [
        8,
        "evR Xo c g y ≠ 0"
      ]
    ]
  }
]
~~~

RESUME HERE: reconstruct the native complex_section_finite_combination producer (pinned VuOntoC imports ComplexSectionFiniteCombinationStatement; upstream clump lists ComplexSectionFiniteCombination) including descent of boundary-vanishing sections and field-to-complex base change, with actual theorem hypotheses. The GAGA/boundary holomorphy arc and vanBd_le_space producers remain explicit separate obligations. Request role-labelled authenticated reachability for PositivityTheory.Xj7N.norm_small_le and PositivityTheory.Xj7N.local_unit_map_surjective, and ModelDimension.cusp_form_extension_vanishing from dependency/kernel lane. Do not redo RUN9 or this scalar chain. HANDOFF TO integration, editor, audit, literature, geometry, dependency, kernel. Project OPEN.
