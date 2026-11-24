# Run 9 — ChCoef: semilinear coefficient transport on rank-one Weil–Deligne parameters

2026-11-24. RESULT: SOURCE-MATCHED reconstruction, including the native quotient universal property, the twist existence mechanism, and the consumer df_coef. Executed finite algebra regression below. Not independent Lean replay, not full RH closure, not a URT benchmark.

## Preflight
Read SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, AGENTS, research state and continuity excerpts, research-log and protocol excerpts, Run 8, and recent specialist RESUME notes (theta Run 9 IwaQ; kernel Run 9 fresh/cached export; character boxes Run 8 lattice; literature Run 8 LieDual; editor 1456 local zero-order; geometry Run 8 integral frame; prime and Landau Run 9; dependency, integration, structure and acceleration notes). No duplicate of their tasks. Latest Cathedral summary observed PASS at 15:28:23Z, run 45420945162, not an RH certificate. Blueprint and full source/kernel DAG not read in this run; source claims below are from the original Lean declarations, not the blueprint. Canonical pin 40e56bab026552e089d7afcfeff08d2defb9c005; upstream head observed 59f8db6dd40aa9aa4fb10cfd86e1c7bbc48d8780. No physics queue changes.

## 1. Exact target and quantifiers
In EmbOrbit.lean, WDis(P,iota,h,B,hj,kappa,xi) means (a) IsPstAt P B (rk1 kappa), and (b) existence of a smoothness witness hs such that wdAt P iota B h hj (rk1 kappa) equals WD.lpOfChar h (iota_* xi) hs. Here F is a number field, Omega its algebraic closure, l a prime, A a valuation subring, w a finite place, h the place-over witness, B a LocBridge on the decomposition group with coefficient ring O a topological Z_l algebra, hj : Induces B, iota : Qbar_l ≃+* C. Kappa is a unit-valued monoid hom on the decomposition group, xi on Weil(h). ChCoef universally quantifies over all of these data, s in GQ(l)=Gal(Qbar_l/Q_l), and assumes Continuous kappa and WDis for P=Loc.PP l. It asserts WDis for s_* kappa and s_* xi, with the same iota, h, B, hj and P. No assertion that arbitrary complex conjugation preserves p-adic continuity. The source intro discards the continuity hypothesis in this particular proof; retain it in the statement and in consumers.

## 2. Universal property of Letter: the two scalar relations
For fields L,U,F, L-algebra F, L-module D, m:U→End_L(D) a ring hom, tau:U→F, F-module M, let g:D→M be additive. Assume for ALL a∈L,c∈U,x∈D,
 g(ax)=i_L(a)g(x),    g(m(c)x)=tau(c)g(x).
Letter(m,F,tau) is (F⊗_L D)/sum_c im(m(c)_F - tau(c)I).
The first condition makes g L-linear after restricting M's F-action. Base change gives gtilde(b⊗x)=b g(x), F-linear. For the second relation:
 gtilde((m(c)_F-tau(c)I)(b⊗x))
 = b g(m(c)x)-tau(c)b g(x)=0.
Pure tensors span the tensor product, so every relation image, and then their sum, is in the kernel. The quotient lift Φ is F-linear and Φ([1⊗x])=g(x). This is letter_lift; the proof actually checks zero, pure tensor and addition by tensor induction. Neither dimension nor a field embedding bijection is needed for this universal property. Uniqueness follows from spanning classes, though the native conclusion is existence only.

## 3. Potential semistability under a coefficient-semilinear equivalence
Let k=Q_l, U=MaximalUnramifiedExtension l, L1,L2 finite subextensions of Qbar_l/k, V_i L_i-modules with compatible k-module structures, rho_i representations of the SAME local group GK(K). Suppose f:V1≃_k V2 intertwines every group action. The map Q=dQ(P,hf) on D_i=Dpst(P,rho_i) is induced by f⊗id on V_i⊗_k Bst(P). Fixed-space witnesses carry over by intertwining; the inverse of f also intertwines. dQ_inv proves the two compositions equal identity by tensor induction, and dQ_bij uses these inverses. Q commutes with multiplication by U (dQ_mulD), so it is U-linear on DpstUr, and the U-rank agrees. Since the k-rank of V also agrees, IsPst for rho1 implies IsPst for rho2 (isPst_equiv). This does not require that f be L1-linear into V2.
If additionally f(av)=s_L(a)f(v) for s_L:L1→L2 induced by s on Qbar_l, then Q(ax)=s_L(a)Q(x) by tensQ_smul. Q commutes with actD and phiD, hence with integer powers of the invertible phiU (including negative exponents), and with weilD for each σ (dQ_weilD). Q by itself is U-linear, not generally U-semilinear for s.

## 4. Why a second map T is needed, and why it exists
The crucial bridge is BridgeParam.IsTwist. For a representation rho over coefficient field LL with compatible k action, T is a UNIT of End_LL(Dpst P rho); it must satisfy
 T m(c)=m(s(c)) T for all c∈U (the target c' in U is justified by BridgeInd.mem_Kur_iff);
 T actD(h)=actD(h) T for every h∈GK(K);
 T phiD=phiD T;
 T monD=a monD T for some a∈LL with a≠0.
Note the monodromy factor is not required to equal 1. In the rank-one eigenvalue argument only the first three laws are used, but the native twist theorem has all four and must not be weakened in the evidence store.

The theorem exists_isTwist assumes DpstUr finite-dimensional over U. It constructs the subgroup S of s admitting T. Identity uses T=I; multiplication uses T T' and monodromy factor aa'; inverse uses T^{-1} and a^{-1}. The source proves S open: choose finite K' by exists_actD_eq_one (the actual finite-action lemma is a remaining leaf), and N the finite normal closure of the compositum of K,K'. For s fixing N use T=actD(s|GK(K)). It acts on U as s, commutes with phiD and monD, and commutes with each actD(h) because the commutator s^{-1}h^{-1}s h lies in the fixing subgroup of N and acts trivially on U. The latter follows from comm_on_Kur: all automorphisms commute on prime-to-l roots of unity, where their actions are power maps, then kur_algHom_ext extends this equality to U. The finite-action lemma kills that commutator on Dpst. Thus the fixing subgroup of N lies in S and S is open, hence closed.
For s fixing U use T=I. For s acting on U as frobUr use T=phiU, with nonzero monodromy factor l^{-1} (monD_phiD). Finally eq_top_of_isOpen: if x is fixed by S, x is fixed by Gal(Qbar_l/U) and therefore lies in U by infinite Galois correspondence; it is then fixed by frobUr (an extension exists by FrobLaws.exists_ext), so lies in k by MemLoc.frob_laws. Since S is closed and its fixed field equals k, S is all GQ(l). This is the native existence proof; the finite-action producer, MemLoc.frob_laws, and actual LocPrime realization are distinct obligations, not consequences of the finite model below.

## 5. Semilinear descent to the complex quotient
Set S=T∘Q, with T on D2. Then S is additive, S(ax)=s_L(a)S(x), S(m1(c)x)=m2(s(c))S(x), and S weilD1(σ)=weilD2(σ)S. The two scalar conditions have different origins: Q transports L, T transports U.
Put θ=iota∘s∘iota^{-1}:C→C. This is a field automorphism, not assumed continuous or the usual complex conjugation. In exists_semi, take g(x)=[Sx]_2 and give the target WDSpace the twisted scalar action b⋆y=θ(b)y. Apply letter_lift: the two laws above, together with wdMk_smul and wdMk_mul, are exactly its hypotheses in the twisted module. The resulting map is θ-semilinear in the ordinary target action:
 Φ(iota(z)y)=iota(s(z))Φ(y),   Φ([x]_1)=[Sx]_2.
The proof constructs it rather than assuming it descends. A naive ordinary C-linear map would not satisfy the required scalar transport. The actual exists_semi statement returns a function with these laws; additivity comes from its constructed linear lift.

## 6. Eigenvalues and monodromy: why rank one matters
Under the two rank-one hypotheses dim_Li Vi=1 and IsPst for rho1, Run 8's LetterDim gives dim_C W_i=1; section 3 supplies IsPst for rho2. Suppose iota(z) belongs to eig of wdPst1 at σ. DpstMap.charPol_wdPst identifies its characteristic polynomial with that of wdRho1. A linear operator on a one-dimensional space with root λ of its characteristic polynomial equals λI (line_smul). Apply Φ to wdRho1(σ)[x]_1=iota(z)[x]_1. The intertwining of Q with weilD and T with actD and all powers of phiU shows
 wdRho2(σ)[Sx]_2=iota(s(z))[Sx]_2.
To produce a NONZERO eigenvector, choose y∈D2 with [y]_2≠0 (otherwise the spanning classes would force W2=0, contradicting dimension one). T and Q are surjective, so y=Sx for some x. Thus iota(s(z)) is a root of the target characteristic polynomial, exactly eig_conj. No assertion that every input x has nonzero quotient class.
The source recovers the complete WD class via ParamAboveModel.eq_lpOfChar: for rank one, all Weil operators are specified by these roots, and nilpotent monodromy must be zero (a scalar c with c^n=0 over a field has c=0). This explains why ignoring monodromy is legitimate here, not at higher rank. The theorem requires smoothness of the candidate character. It is not a generic reconstruction of a higher-rank WD representation from eigenvalues.

## 7. From the finite model back to wdAt and to correction characters
ChCoef starts from the finite coefficient model (L,r) extracted from IsPstAt for rk1 kappa. Set L2=mapExt(s,L), t:L≃_k L2 induced by s, f=t coordinatewise on Fin 1→L, and r2=mapRep(t,r). Matrix-vector multiplication respects t, so f intertwines the same local group representations and is t-semilinear. The single matrix entry gives mapRep(inclusion,r2)=rk1(s_*kappa). wdAt_eq_of does NOT assume L2 contains the bridge coefficient field B.LL: enlarge to supExt(L2,B.LL), establish IsPst by PstExt.isPst_enlarge, and compare the chosen wdAt witness with the supplied model in a common finite compositum using equal entrywise images and BridgeParam.wdPst_enlarge. Thus the target is genuinely wdAt for s_*kappa. The original smoothness witness for iota_*xi gives smoothness for iota_*s_*xi by inclusion of the old kernel into the new one (in fact equality since s and iota injective). For every σ, eig_conj sends the old eigenvalue iota(xi(σ)) to iota(s(xi(σ))). Apply eq_lpOfChar with the native rank-one lpDim_wdAt theorem. This supplies ChCoef, not any claim that the coefficient automorphism acts on the underlying global field or on the Weil-group argument σ.

Consumer ContinuousRankOneRep.df_coef:
 let δ_τ denote the correction at weight e_τ=Pi.single τ 1. For embeddings τ,τ' of the local completion related by τ'=s∘τ and Df(e_τ,d), Df(e_τ',d'), choose a continuous locally algebraic ν of weight e_τ (exw). The conjugated ν'=s_*ν is continuous by cont_gq (spectral norm invariance), and locally algebraic with weight e_τ' by the original sign -1 in the inertia formula. The old open-kernel witness transports by s. The two candidate WDis characters for ν' are s_*(ν|Weil · τ(a) · d) via ChCoef, and ν'|Weil · τ'(a) · d' by Df(e_τ',d'). ChBasic uniqueness makes them equal; cancel the common nonzero unit ν'(σ) τ'(a(σ)), obtaining d'(σ)=s(d(σ)). This is the actual native lemma name df_coef, not an assumed df_gal. Additivity of corrections is constructed separately in df_ex; hom_sum expands δ(wt) as the product of the single-weight corrections to their integer weights. df_unit invokes EmbOrbit on df_coef, then df_res, df_one and LocWD as in Runs 4–7. LocWD feeds Crys.alg/CoreAll and Row0b (Runs 1–3), then recParameter/window nonvanishing; the full kernel reachability and downstream obligations remain open.

## 8. Pinned source inventory and head comparison
Paths below relative to src/Development/. Blob hashes are connector-returned Git blob IDs, not locally rehashed.
- AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/ChCoef.lean, 7db4f32626a0c604ace1a4909a1312601693849a: letter_lift 11–29; line_smul 31; dQ_inv 45; dQ_bij 58; isPst_equiv 67; exists_semi 87; eig_conj 115; wdAt_eq_of 162; chCoef 181. Migrated into ContinuousRankOneRep.lean at observed head fb0bdf5416986c8a291ace6ba2fadc618722623a, starts 353,373,387,400,409,429,459,506,525 respectively. Literal declaration slices through first blank line: line_smul,dQ_bij,isPst_equiv,eig_conj,wdAt_eq_of unchanged. letter_lift makes map_add argument explicit; exists_semi makes module scalar action explicit. chCoef has same inspected body plus clump endings. dQ_inv text differs; not asserting semantic equivalence.
- AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/EmbOrbit.lean, f7b21c5d5a970b595c05d7b2226e9c2854b6622b → ab7211e5b4527fe7478c7134ce2c524359988de9. ChCoef 52→93 unchanged. WDis 21→61, line break and wdAt qualification changed.
- AutomorphicArithmetic/ThetaCorrespondence/AlgebraicCharacters/ContinuousRankOneRep.lean, 028d93377a68710f3e21da03eff798ff7fd103af → fb0bdf5416986c8a291ace6ba2fadc618722623a. df_ex 147→1095 unchanged; hom_sum 166→1114 changed text; df_coef 172→1121 changed text; df_unit 219→1168 unchanged. Pinned proof translated above; no blanket upstream semantic-equivalence claim.
- AbelianVarietyTheory/Proofs/SatakeParameters/WeilDeligneParamAboveLIndependentLocalEmbedding.lean, ffdce791714cb11064760245f465f9ba78449bbc → 6e6f30ca2a8b1428043c1212f4c75896a3c5d747. eq_top_of_isOpen 20, comm_on_Kur 39, IsTwist 79→123, twistGroup 84, isOpen_twistGroup 107→151, exists_isTwist 132→176. Last three compared declarations IsTwist,isOpen_twistGroup,exists_isTwist identical.
- AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/ConclusionFinite.lean, 149eac42d2d0f593e5736a50b7d7aadd8dba9df0 → 0b68268987669ffc126f293c08e5b08cbdf937f2. eq_lpOfChar 27→72 identical.
- AbelianVarietyTheory/Proofs/SatakeParameters/CharpolyWeilDelignePotSemistableEnlargeCoefficie.lean, 11da869cd4f69f2465a3589e62e3e97e9c211b84: dQ 98, dQ_mulD 112, dQ_weilD 157, tensQ_smul 238, anchored only in pinned source.
- AbelianVarietyTheory/Proofs/SatakeParameters/CommuteIsNilpotentOfUnipotent.lean, c1da854fc3cfdf3869f24fa1462d226991a776c0: charPol_wdPst 226, anchored only.
- AbelianVarietyTheory/Proofs/SatakeParameters/IsPotentiallySemistableCoefficientFieldEnlarge.lean, b1b70f827f4f946cfdc2faf70666cbc338c86900: native isPst_enlarge proof inspected, uses coordinate splitting and rank equality. Not head-compared.

## 9. Executed exact finite regression (not p-adic Hodge verification)
Model F4=F2[t]/(t²+t+1), s(x)=x². D=F4², L=U=F4. L action A(a)=diag(a,s(a)), U action scalar c. Base-changed coordinates B(x)=(x0,s(x1)); quotient by U-relations is first coordinate. Q swaps the two coordinates (L-semilinear, U-linear); T swaps and squares (L-linear, U-semilinear). S=TQ squares both coordinates. Weil operators are W1=diag(z,s(z)), W2=diag(s(z),z); Q intertwines, T commutes with W2. This explicitly demonstrates the two distinct scalar requirements and rank-one descended eigenvalue; not a substitute for the actual period ring or proof of twist existence. Negative controls omit T or demand ordinary rather than twisted linearity. Counters count loop instances, not independent theorems. OmitTwist counts repeated scalar-loop instances (12 distinct vectors fail; 48 iterations). All code executed in JS, exact integers; reproducible with Node.
Output: {"tensor":64,"relations":64,"scalar":64,"intertwine":48,"eigen":36,"additivity":256,"omitTwist":48,"ordinaryLinear":24,"monodromy":16,"weight":297}.

~~~js
function regression(){
 const ok=(p,m)=>{if(!p)throw Error(m)};
 const mul=(a,b)=>{let z=0;while(b){if(b&1)z^=a;b>>=1;a<<=1;if(a&4)a^=7}return z};
 const sq=a=>mul(a,a), all=[0,1,2,3], nz=[1,2,3], vs=all.flatMap(a=>all.map(b=>[a,b]));
 const eq=(x,y)=>x.every((a,i)=>a===y[i]), add=(x,y)=>x.map((a,i)=>a^y[i]), diag=(a,b,x)=>[mul(a,x[0]),mul(b,x[1])];
 const A=(a,x)=>diag(a,sq(a),x), U=(c,x)=>diag(c,c,x), B=x=>[x[0],sq(x[1])], pi=x=>x[0];
 const Q=x=>[x[1],x[0]], T=x=>[sq(x[1]),sq(x[0])], S=x=>T(Q(x)), W1=(z,x)=>diag(z,sq(z),x),W2=(z,x)=>diag(sq(z),z,x);
 let tensor=0,relations=0,scalar=0,intertwine=0,eigen=0,additivity=0,omitTwist=0,ordinaryLinear=0,monodromy=0,weight=0;
 const rel=new Set();
 for(const x of vs){
  for(const c of all){
   ok(eq(B(A(c,x)),diag(c,c,B(x))),"base change");tensor++;
   const r=add(B(U(c,x)),diag(c,c,B(x)));ok(r[0]===0,"relation");rel.add(r[1]);relations++;
   ok(eq(Q(A(c,x)),A(sq(c),Q(x)))&&eq(Q(U(c,x)),U(c,Q(x))),"dQ");
   ok(eq(T(A(c,x)),A(c,T(x)))&&eq(T(U(c,x)),U(sq(c),T(x))),"twist");
   ok(eq(S(A(c,x)),A(sq(c),S(x)))&&eq(S(U(c,x)),U(sq(c),S(x))),"two scalar laws");scalar++;
   ok(pi(S(x))===sq(pi(x)),"factorization");
   if(pi(Q(x))!==sq(pi(x)))omitTwist++;
   if(sq(mul(c,pi(x)))!==mul(c,sq(pi(x))))ordinaryLinear++;
  }
  for(const y of vs){ok(eq(S(add(x,y)),add(S(x),S(y))),"additive");additivity++}
  ok(eq(Q(Q(x)),x)&&eq(T(T(x)),x),"invertibility");
  for(const z of nz){
   ok(eq(Q(W1(z,x)),W2(z,Q(x)))&&eq(T(W2(z,x)),W2(z,T(x)))&&eq(S(W1(z,x)),W2(z,S(x))),"commuting");intertwine++;
   if(pi(x)){ok(pi(W2(z,S(x)))===mul(sq(z),pi(S(x)))&&pi(S(x))!==0,"conjugate eigenvalue");eigen++}
  }
 }
 ok(rel.size===4,"full relation line");ok(omitTwist>0&&ordinaryLinear>0,"negative controls");
 for(const a of all){let b=a;for(let i=1;i<=4;i++){ok((b===0)===(a===0),"nilpotent rank one");monodromy++;b=mul(b,a)}}
 const pow=(a,n)=>{let z=1;for(let i=0;i<((n%3)+3)%3;i++)z=mul(z,a);return z};
 for(const k of nz)for(const a of nz)for(const d of nz)for(let n=-5;n<=5;n++){const xi=mul(mul(k,pow(a,n)),d);ok(sq(xi)===mul(mul(sq(k),pow(sq(a),n)),sq(d)),"coefficient transport");weight++}
 return {tensor,relations,scalar,intertwine,eigen,additivity,omitTwist,ordinaryLinear,monodromy,weight};
}
console.log(regression());
~~~

RESUME HERE: locate the exact pinned producer of exists_actD_eq_one from the BridgeParam imports, reconstruct its finite-basis/fixing-field argument and quantify the role of finite U-dimension. Then trace MemLoc.frob_laws and EmbOrbit's actual native producer EmbOrbitAlt. Keep LocPrime realization and the later parameter transfer independent. No duplicate of Runs 1–9, no physics changes. HANDOFF TO integration, editor, formal audit, theta, kernel and galois_rows. Project OPEN.
