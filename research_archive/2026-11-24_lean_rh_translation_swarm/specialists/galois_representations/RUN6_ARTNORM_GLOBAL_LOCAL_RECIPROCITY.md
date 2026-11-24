# Run 6 — ArtNorm: global-to-local reciprocity and residue-degree norm compatibility

2026-11-24. RESULT: SOURCE-MATCHED human reconstruction of the ArtNorm producer, global norm equality, finite-place density argument, and local Artin injectivity. Conditional on the original class-field-theory and other named arithmetic inputs; no Lean kernel run, full RH completion or URT advantage.

## Preflight and provenance

Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity and recent specialist/integration/editor handoffs. Cathedral orchestrator checkpoint #368 (45391033412) PASS at 12:32:10Z, unrelated to RH kernel validation. No physical queue changes. Run 5 left ArtNorm open; Grok galois_rows Run 4 already examines ChevalleyUnits, so its deep producer is not duplicated. External blueprint not used as proof evidence.

Source: leanprover-community/riemann-hypothesis, original pin 40e56bab026552e089d7afcfeff08d2defb9c005. Current head checked d4b2c1cc39c05a8b49a4adbda9908898a71f12c6, timestamp 2026-11-24T12:31:21Z. ArtNorm is inlined into ThetaCorrespondence/AlgebraicCharacters/ContinuousRankOneRep.lean at head, blob fb0bdf5416986c8a291ace6ba2fadc618722623a, lines 117–248 approximately: val_of_norm 117, norm_loc 136, art_diag 148, glob_norm 155, emb_norm 202, artNorm 229. 118/120 nonblank trimmed lines of the pinned file excluding imports/open occur in head clump; the two changed lines in val_of_norm expand absNorm via Ideal.absNorm_apply, Submodule.cardQuot_apply, normV and add WithZero.toAdd_unzero_eq_log in the exponent conversion. This is textual migration only; helper modules also changed and require separate kernel/revision audit.

## 1. Exact statement

Let F ⊂ F' be number fields in a common algebraic closure Ω, with compatible algebra structures (scalar tower), A a valuation subring of Ω over both finite places w,w', and ℓ a prime with ℓ in w. Denote completions K=F_w,L=F'_w'. ArtNorm asserts existence of a restriction map res:Emb_ℓ(L)→Emb_ℓ(K) (continuous embeddings into Qbar_ℓ) and a group hom N:L^×→K^× satisfying ALL of:
(i) res agrees on F with restriction of the embedding of F';
(ii) for every τ:Emb_ℓ(K) and y∈L^×, τ(N y)=∏_{τ':res τ'=τ}τ'(y);
(iii) for EVERY pair of local Artin homomorphisms a,a' satisfying IsLocalArtin, and every pair of Weil elements σ,σ' acting identically on Ω, a(σ)=N(a'(σ')). There is no assumption of a Galois field extension F'/F. ℓ above w is part of the native quantified interface, even though its proof introduces the premise anonymously.

The native producer takes GlobalArtinReciprocity. It identifies w=below F w' by contraction of ideals from the common A; chooses the actual local field norm N and continuous restriction along the completion map. The norm-product formula is the finite separable field norm over K via embeddings into an algebraically closed coefficient field. Finite dimensionality and characteristic zero are essential. Continuity of the embeddings over K follows from finite-dimensional linear-map continuity. The embedding fibre is explicitly bijective to the K-algebra embeddings L→Qbar_ℓ (with K-algebra structure induced by τ). This is emb_norm, not a new assumption about weights.

## 2. Norm and Frobenius use the residue degree f, not ramification e

For a place v of a number field E, use additive integer order ord_v and multiplicative formal valuation V_v=exp(-ord_v); the normalized real absolute value is |x|_v=q_v^(-ord_v x). For w above v, q_w=q_v^f, f=inertiaDeg, and the idele norm of the idele supported at w is supported at v with component y=N_{L_w/K_v}(x). The module identity gives |y|_v=|x|_w, hence q_v^(-ord_v y)=q_v^(-f ord_w x). Since q_v>1, ord_v y=f ord_w x. Equivalently V_v(y)=V_w(x)^f. This is val_of_norm and norm_loc. In particular the norm of a uniformizer upstairs has order f downstairs, NOT e or ef. The identity covers negative orders as well as positive.

For a continuous quotient χ of Gab(E,Ω) killing Artin images of all units at v, chi_artin_transport proves that χ composed with ρ and the upper Artin map kills units at w, and sends EVERY upstairs uniformizer to the f-th power of the image of ANY downstairs uniformizer. Proof: local inertia is identified with the images of units; the common closure identification (or compatible closure ring isomorphism in the general theorem) transports inertia. Frobenius at w acts on residue by q_w=q_v^f, so its transported action differs from downstairs Frobenius^f by an inertia element. This is killed by χ. Both Artin maps use inverse Frobenius conventions (ha.frob), so taking inverses gives the same f-th power relation, not its inverse. In the pinned source hI, hF, hm and inv_inj realize this argument.

## 3. Global norm equality (glob_norm)

Let K⊂L be number fields sharing closure Ω. For global Artin homomorphisms A_K,A_L satisfying IsGlobalArtin, construct the continuous map ρ:Gab(L,Ω)→Gab(K,Ω) from Galois action inclusion and abelianization (exists_abHom_of_ringEquiv with identity of Ω); for matching actions τ,σ, ρ([τ])=[σ]. It suffices to prove A_K(Nm x)=ρ(A_L(x)) for every idele x of L.

Take ANY open subgroup U of Gab(K,Ω); quotient is discrete and abelian (and finite by compactness of the profinite group, although the proof only uses discreteness). Let χ be quotient projection and ψ(x)=χ(ρ(A_L(x))) χ(A_K(Nm x))^{-1}. Both factors continuous, so ψ is a continuous homomorphism. Show ψ=1 as follows.

- Diagonal: Artin kills K^× and L^× embedded diagonally, because their ranges lie in the specified closed kernel. Idele norm sends a diagonal k to diagonal N(k). Thus ψ=1 there.
- The kernel of χ A_K is open since target is discrete. open_subgroup_contains_congr yields finite S of downstairs places such that all units at v∉S have their supported ideles in this kernel. Its stronger statement also permits a prescribed finite S0⊆S and gives deep congruence units at v∈S; only the outside-S clause is used. The finite set T of upstairs places above S exists by tendsto_below (finite fibres).
- At w∉T write v=below K w. For ANY uniformizer y at w, transport (section 2) identifies the first factor χρA_L(local_w y) with χ A_K(local_v π)^f for a fixed uniformizer π of K_v. By norm_loc, Nm(local_w y)=local_v z with ord_v z=f. Consequently zπ^{-f} is a unit, killed by χ A_K. Thus the second factor equals the same f-th power. Their ratio is one.
- eq_one_of_unif upgrades all uniformizers to all of L_w^×: if ord_w x=n, choose fixed π_w and observe x π_w^(1-n) has order one. Both this element and π_w map to one, hence so does x. Killing just one uniformizer does NOT kill the unit character; the quantifier is indispensable.
- Now apply eq_one_of_away (proof in section 4) to ψ using its diagonal triviality and all local components outside T. Thus ψ(x)=1. Therefore the original discrepancy belongs to EVERY open subgroup U.

GabSep.eq_one_of_forall_isOpen_subgroup: if g≠1 in the Hausdorff quotient by closed commutator, its singleton complement pulls back to a neighborhood of 1 in G_K; choose a finite-extension fixing subgroup contained in that neighborhood using Krull topology. Its image in Gab is open (quotient is open) and cannot contain g. Contradiction. This proves the global norm equality. In the pinned theorem the quantification is over matching σ,τ and x with A_L(x)=[τ]; the above equality supplies exactly that conclusion.

## 4. Why away-from-finite-set local equality suffices

Native FrobDense.eq_one_of_away takes a continuous hom ψ from ideles into a Hausdorff commutative topological target (the actual theorem requires CommGroup, TopologicalSpace, T2Space, not an IsTopologicalGroup instance for B); ψ trivial on diagonal E^× and ALL supported local ideles at places outside finite S. Define P to retain all archimedean coordinates and finite coordinates in S, and j to extend these by 1 elsewhere. Both induced maps on units are available, j continuous and Pj=id.

First prove eq_one_of_local: if an idele a has archimedean coordinates 1 and every individual local component maps to 1, remove its finite set of nonunit components by multiplying by their inverses. Result b has all components units and archimedean part 1. Finite-coordinate truncations of b converge to b in restricted-product unit topology. Every truncation maps to 1 (finite products), hence ψ(b)=1 by continuity and Hausdorff uniqueness of limits; reinserting finitely many components proves ψ(a)=1. It is not legitimate to treat an arbitrary infinite idele as a finite product.

Apply this to a/(jPa): it lies in ker P, so coordinates at S and infinity are 1, and all others are killed. Hence ψ(a)=ψ(jPa). The projected diagonal E^× is dense in the finite product of local multiplicative groups: native denseRange_proj uses density of E in each completion and weak approximation for the finite family of pairwise inequivalent nontrivial absolute values (choose targets within ε/2 and approximate all simultaneously within ε/2). All archimedean places are included; finite and infinite absolute values are inequivalent by their values on 2. denseRange_units uses the open embedding of units into this finite product of fields; the approximating diagonal is nonzero because its image is a unit. ψj is continuous and its locus equal to 1 closed, so its equality on the dense projected diagonal extends to the entire product. This proves ψ=1. Weak approximation and convergence of unit truncations remain actual named dependencies, not consequences of finite tests.

## 5. Recover equality of local Artin values, not merely their global images

Fix local a,a' and matching σ,σ'. GlobalArtinReciprocity supplies A_F,A_F'. IsLocalArtin.glob identifies A_F(local_w aσ)=[σ], A_F'(local_w' a'σ')=[σ']. Section 3 yields A_F(Nm(local_w' a'σ'))=[σ]; norm of the supported idele is local_w N(a'σ'). Thus their images under A_F agree. The last step uses artin_localIdele_injective, not injectivity of the entire global Artin map (false, since diagonal elements belong to the kernel).

Native injectivity proof: suppose A_F(local_w x)=1. The closed kernel is closure of diagonal F^× times the archimedean connected subgroup. For EVERY positive integer a and nonzero t∈F_w, approximation by that subgroup yields k∈F^× with:
  V_v((k-1)/a)≤1 and V_v(k^{-1})≤1 for all v≠w; V_w(k-x)≤V_w(t).
This is ArtinApprox.exists_global_approx: take the open neighborhood imposing these conditions on the finite-adele component, its inverse, and w-evaluation; the archimedean subgroup does not affect any finite coordinate. Closure supplies a point, and its diagonal component is k. Both off-place constraints matter.

First show V_w(x)=1. If V_w(x)<1, take t=x². The approximation is strictly closer than V_w(x), so V_w(k)=V_w(x); off w, both k and its inverse integral, so all off-w orders vanish. Choose an initial k0 with a=1. Both k0 and all subsequent such k are algebraic integers, and k/k0 is a global unit because their orders at ALL finite places agree. Consequently the absolute integer norm of k is fixed R=|N(k0)|. Set q=|O_F/w| and a=q(R+1)+1, coprime to w. The next k is congruent to 1 modulo a also at w, hence globally. Multiplication matrix determinant then gives N(k)≡1 mod a. Since a≥R+2 and |N(k)|=R, N(k)=1. Thus k is a unit, contrary to V_w(k)<1. If V_w(x)>1, repeat on x^{-1} (its supported idele is also killed). Therefore V_w(x)=1.

Now use ChevalleyUnits (native producer chevalleyUnits', Grok run 4 treats the deep theorem). For each n≥0 take g=q^(n+1)∈O_F. The finite unit group of O_F/(g) has order m>0, so every global unit ε satisfies g|ε^m-1. ChevalleyUnits supplies a>0 coprime to q such that every global unit u≡1 mod a is an m-th power of a global unit. Choose t=g in the approximation. Since V_w(x)=1 and V_w(g)<1, k is a unit at w too, hence a global unit. As a is a unit at w, the congruence k≡1 mod a holds globally. Then k=ε^m and g|k-1, giving V_w(k-1)≤V_w(q)^(n+1). Combining with V_w(k-x) by ultrametric inequality gives V_w(x-1)≤V_w(q)^(n+1) for EVERY n. Since 0<V_w(q)<1 in discrete multiplicative valuation, x=1. Applying this trivial-kernel statement to x/y proves injectivity. This is a distinct use of ChevalleyUnits, not a reproof of its construction. The global Artin kernel, approximation topology, and Chevalley premise remain explicit.

Thus aσ=N(a'σ') follows. Together with restriction and embedding product this gives ArtNorm. In Run 4 df_res, this norm relation transports the algebraic embedding weights under extension, and Run 5 ExField then separates the correction character. Downstream LocWD→Crys.alg→rank-one inputs→CoreAll→Row0b→recParameter→character windows→nonvanishing remain conditional on their other independent inputs; ArtNorm alone does not establish RH.

## 6. Source inventory (connector-returned Git blob SHAs; not locally rehashed)

All original paths at pin above. A=src/Development/AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/; I=src/Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/; W=src/Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/.
- A/ArtNorm.lean 7b614e8699e85e572a7ca903b3f8fdc5020acbf7, full producer.
- A/EmbOrbit.lean f7b21c5d5a970b595c05d7b2226e9c2854b6622b, ArtNorm.
- W/DenseRangeUnits.lean d5f30dda2e6c2f808e50142098b2c14767ac0c2b, denseRange_proj 65, denseRange_units 91, proj_incl 130, eq_one_of_local 137, eq_one_of_away 173, eq_one_of_unif 194.
- W/AbsoluteGaloisAbelianizationEqOneOfMemOpenSubgro.lean b341bae94d86619c0d6da34434f5cc3cf33532ea, eq_one_of_forall_isOpen_subgroup 8.
- W/IsOpenIdeleSubgroupContainsCongruenceUnits.lean 36b0cba2772a4a849265a87169eb2bebeddfe70a, localIdele_mem_of_isOpen 109, open_subgroup_contains_congr 148.
- I/ExistsAbelianizedGaloisHomOfClosureIso.lean f21f201cb14ee4b3ef4595d115b18ca639e36b1b, exists_abHom_of_ringEquiv 31.
- I/ArtinTransportAlgClosureEquiv.lean 3d048f4ecc06799bdd2d55bd88a12725058253d8, normV_eq_pow 75, chi_artin_transport 86.
- I/GlobalArtinLocalIdeleInjective.lean 19a91ae8f1649cb34eec88010e6d73fdced6dc02, artin_localIdele_injective 23.
- I/ExistsGlobalApproxOfArtinTrivialStatement.lean bd074208198ccf5d883e337e7a191c7045fb4096 and I/ExistsGlobalApproxOfArtinTrivial.lean 0f0bcc3be49c8492429768aae070aefe7a768a6e, exists_global_approx.
- I/ValuationEqOneOfCongruentGlobalApproxStatement.lean cf053b9adafc665798d00a852fff67edcf091bec and I/ValuationEqOneOfCongruentGlobalApprox.lean 6b8ee58a4c6b499797825a049307c86bf7bddd70, valuation_eq_one_of_approx, norm_modEq_one.
- I/EqOneOfApproxByCongruentGlobalUnitsStatement.lean 621ff5c3f28cb3eb47e172615835e637fbaf6cfc and I/EqOneOfApproxByCongruentGlobalUnits.lean 18335bc526fcef6e26a335b28312f2b1e0057c90, eq_one_of_approx_by_congruent_units, unit_pow_dvd_sub_one_of_finite.
- I/ChevalleyUnits.lean a699116e3c0468a2fecb572914318947db7190e3, chevalleyUnits' 174 (refer to Grok run 4 for its proof).

## 7. Reproducible finite regression (executed in V8)

The two tests below yielded uniformizer=201, transport=192780, wrongRamification=143924, normGap=4848, detCong=69360, negative=4; unramified=26040, ramified=26040, wrongE=4344. Total positive arithmetic cases 319,269. transport is only a consistency identity in cyclic additive targets; not independent evidence for class field theory. The quadratic norm test uses actual quadratic field norm formulas and distinct local extension cases for odd primes, with non-square D (unramified) and D=p (ramified Eisenstein); integer inputs include zero components but not the zero element. wrongE counts nonzero-order inputs where replacing f by ramification e fails, not failures of source. No tests of full infinite topology or Lean proof. Run as JavaScript:
~~~js
function regression(){
 const assert=(x,m)=>{if(!x)throw Error(m)};
 const mod=(x,m)=>(x%m+m)%m;
 let uniformizer=0,transport=0,wrongRamification=0,normGap=0,detCong=0,negative=0;
 for(let n=-100;n<=100;n++){let j=1-n;assert(n+j===1,"uniformizer adjustment");uniformizer++}
 for(let m=2;m<=43;m++)for(let c=0;c<m;c++)for(let f=1;f<=12;f++)for(let n=-8;n<=8;n++){
  const lhs=mod(c*f*n,m),rhs=mod(c*(f*n),m);
  assert(lhs===rhs,"transport");transport++;
  if(f!==2&&lhs!==mod(c*2*n,m))wrongRamification++;
 }
 for(let q=2;q<=25;q++)for(let R=0;R<=100;R++)for(let sign of [-1,1]){
  let a=q*(R+1)+1,z=sign*R;
  assert(a>=R+2&&a%q===1,"norm gap");
  assert((mod(z-1,a)===0)===(z===1),"norm congruence forces +1");normGap++;
 }
 for(let a=2;a<=17;a++)for(let D=-7;D<=7;D++)for(let u=-8;u<=8;u++)for(let v=-8;v<=8;v++){
  let A=1+a*u,B=a*v,det=A*A-D*B*B;
  assert(mod(det,a)===1,"determinant norm congruence");detCong++;
 }
 const ch=(n,u)=>mod(u,2);
 assert(ch(1,0)===0&&ch(1,1)===1,"all uniformizers essential");negative++;
 assert(mod(1*1,5)!==mod(1*2,5),"ramification guard");negative++;
 assert(mod(-5-1,3)===0,"size guard");negative++;
 assert(mod(2,2)===0&&mod(2,3)!==0,"all quotients");negative++;
 return {uniformizer,transport,wrongRamification,normGap,detCong,negative};
}
function localNorm(){
 const assert=(x,m)=>{if(!x)throw Error(m)};
 const ord=(p,x)=>{if(x===0)return Infinity;let v=0;while(x%p===0){v++;x/=p}return v};
 let unramified=0,ramified=0,wrongE=0;
 for(const p of [3,5,7,11,13,17,19]){
  const sq=new Set(Array.from({length:p-1},(_,i)=>((i+1)**2)%p));let D=2;while(sq.has(D))D++;
  for(let a=-30;a<=30;a++)for(let b=-30;b<=30;b++){
   if(a===0&&b===0)continue;
   const N=a*a-D*b*b,v=Math.min(ord(p,a),ord(p,b));
   assert(ord(p,N)===2*v,"unramified quadratic norm");unramified++;
   if(v>0)wrongE++;
   const M=a*a-p*b*b,w=Math.min(2*ord(p,a),1+2*ord(p,b));
   assert(ord(p,M)===w,"ramified quadratic norm");ramified++;
   if(w>0)wrongE++;
  }
 }
 return {unramified,ramified,wrongE};
}
console.log(regression(),localNorm());
~~~

RESUME HERE: inspect the native source of ChRes (local rank-one Weil–Deligne restriction) at original pin, beginning with its actual producer and the potentially semistable base-change hypothesis in AlgebraicCharacters, and reconstruct the exact compatibility of WDis and induced local bridges used by df_res; coordinate with Grok galois_rows and integration to avoid repeating parameter-transfer or Chevalley work. ArtNorm source-matched; deep weak approximation, global Artin reciprocity producer and other rank-one premises retain independent provenance obligations. HANDOFF TO integration, proof editor, formal audit, theta, literature and Grok galois_rows. Project OPEN.
