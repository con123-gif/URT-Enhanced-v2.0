# RUN21 — arbitrary-K Archimedean admission and sharp residual count

2026-11-25. RESULT: SOURCE-MATCHED independent human derivation, finite exact regression executed. This extends RUN19–20 from the native family field GK to the independently quantified K of AdmF/FamilyClosedForm. It neither constructs FamP nor proves unconditional admission or root reachability. No Lean replay or URT acceleration claimed.

P = 40e56bab026552e089d7afcfeff08d2defb9c005. H = fcb6eac7534875d32d68030967e2deae6d686151, newly observed upstream head (RUN20 head c40250a50104b7e02e7d74f658d00fa7b1f4827c; distance not computed).
Preflight: read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, RUN17–20, research state/log/protocol/continuity excerpts and CI summary #414 (45536634994, physics only). Read 35 recent commit subjects and seven peer commit diffs/handoff excerpts including dependency, kernel, acceleration, integration, editor, audit, geometry. No duplicate identified in those records; not exhaustive; linked blueprint PDF and remaining full peer notes not reopened. Native GitHub code search DFamP/FamP/adm3/AdmFam returned zero results, not an absence proof. No authenticated constructor found. Proceed with a precise missing general-K bound identified explicitly in RUN19 §4; no physics or other lane edits.

## 1. Source anchors
All paths below relative to src/Formalism/ at P.
- SharpRestriction/GrowthBounds/SmallOrderPrimes.lean blob a35ad58d20f072b48cbb03f619f1bf0f1501e66f L107–119 ArchimedeanSignatureMatching, adm5; L232–244 TypePrimeSizeConds, AConsts, admitted; L256–277 AdmF, ConclusionOnFamily, KudlaFamilyStatement, FamilyClosedForm.
- SharpRestriction/GrowthBounds/IsResidueClassZero.lean blob 9fbb7879d0519f9a136e190551422881ef5d2f0b L14–33 Consts.Nonneg; L37–45 hG, KG, rG, N1, Gp; L56–66 Nstar, La, rho, rhoB, CbLarge; L79–85 InBand0, InBand.
- SharpRestriction/ElevenLe.lean blob 75f2ab1404c69a5d1330671d96d8f6cd35e74e52 L11 szTh, L24–25 SizeN, L31–33 SizeK, L134–138 SizesAt.
- LocalRingCardinality/DataParams₂.lean blob 50914500995df91e2646d91a6c5c99a7e603a51b L27–45 L,b,a,X',b',w'',X'',A,p0,delta1.
- SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean blob c36e22ceab2885a6ab812f6187bfd1a86472a6ec L239–248 orbit numerical definitions.
- SharpRestriction/ParConsts.lean blob c3a5cddc3af0b027ad62b50a79cdb008712613a6 L31–55 FamP, sizes and GK_nonneg; L79 rho_le only for GK, L99 DFamP.
- SharpRestriction/FamCore.lean blob 44cd54c38881086724fdf7f10f32b7d8e80e35b3 L74–85 L_x,L_eps, nonvacuity; L138–142 exists_pt.
- RUN17 single tolerance, RUN18 type size, RUN19 prime-power band estimate and RUN20 exact N1 slope are independent human proofs reused, not kernel-checked theorem invocations.

## 2. Uniform upper bound for rhoB for every fixed nonnegative K
Fix 0<e<1/52, Fm:FamP e, arbitrary K:G.Consts with K.Nonneg, fixed before x and i. For x>Fm.x1, write s=(Fm.L x i).sc and k=(Fm.D x i).R.k, n=(Fm.D x i).R.n. L_x and L_eps identify s.x=x, s.eps=e. Let q=e/100>0. Native SizeN and SizeK imply
  n <= x^(2+8e+q), k >= x^(9/2+10e-q)>0.
Since Nstar=2 n x^(-e/8), it is nonnegative. All factors of La and the two radii are nonnegative.

RUN20 gives N1/log x -> C(e) with N1 independent of fibre. In particular choose a fixed D=C(e)+1 and T_N so that 1<=N1<=D log x for x>=T_N. For the native a=x exp(x^e), log a=log x+x^e<=2x^e eventually. For any h>0 and x>=1,
  log x=integral_1^x dt/t <= integral_1^x t^(h-1) dt=(x^h-1)/h <= x^h/h.
Choose h=e/2 to obtain log x<=x^e once x^(e/2)>=2/e. Choose h=q/4 to obtain
  La=K.La N1^2 log a <= 2 K.La D^2 (4/q)^2 x^(e+q/2).
If K.La=0 this is identically zero. Otherwise choose x^(q/2)>=2 K.La D^2(4/q)^2. In either case 0<=La<=x^(e+q) uniformly, with the threshold depending on fixed e,K only (and family threshold), not i, primes or places. This argument does not use ParametersFill or the GK-specific rho_le field.

Put R=K.rho K.CN>=0. The two terms of rhoB satisfy, using log x<=x for x>=1,
  4 Nstar x^e La/k
     <= 8 x^(2+8e+q-e/8+e+e+q-9/2-10e+q)
      = 8 x^(-5/2-19e/200) <= 8 x^(-5/2),
  R log x La/k
     <= R x^(1+e+q-9/2-10e+q)
      = R x^(-7/2-449e/50) <= R x^(-7/2).
Hence
  0<=rhoB<= x^(-2) [8/sqrt(x)+R/x^(3/2)] <= x^(-2)
when x>=max(256,(2R)^(2/3),1), in addition to the earlier uniform thresholds. Both terms are then at most half of x^(-2). The exponent margins are strict; the argument requires no choice of K after seeing x. It does not assert the bound at every small x.

## 3. Full arbitrary-K eventual equivalence
Define Ev(Q) := exists T>1, forall x>=T, forall i:Fm.Ix x, Q at that instance. As in RUN19, for x>=400 the band-sum estimate for 0<=r<=x^(-2) is <=20 x^(-2+2e/3)<=x^(-1). The exact difference of radii is
  rhoB-rho = (K.rho La/k)(K.CN log x-N1).
Since log a>0 and N1>=1, La vanishes iff K.La=0. Consequently under K.Nonneg, at large x the full ArchimedeanSignatureMatching is equivalent to
  K.rho=0 OR K.La=0 OR N1<=K.CN log x.
Necessity follows from the ordering conjunct; sufficiency follows from the newly proved rhoB bound, ordering and the two original band bounds. All original strict and inclusive prime/power cutoffs preserved.

Apply RUN20's strict N1/log x>C(e) and limit C(e), where
  h=2+8e, r=ceil(8(h+2)/e)+1, B=6r+1,
  C(e)=6 exp(1) B (h+3) 10^B.
For the fixed K, split its zero factors before choosing thresholds. If K.rho>0 and K.La>0, Ev of the ordering holds iff K.CN>C(e). Sufficiency follows from convergence and positive margin. Necessity uses FamCore.exists_pt above any proposed T (not nonempty every fibre). Thus
  Ev(ArchimedeanSignatureMatching)
    iff K.rho=0 OR K.La=0 OR K.CN>C(e).
The general-K claim is strictly wider in scope than RUN20, which used GK-specific rho_le. K.CN=C(e) is insufficient if both multiplying factors are positive.

## 4. Admission reduction with exact pinned residuals
Fix X,Y and C31,Ce,Cm as in RUN17–18; for AdmF keep exists C31>0, Ce>=0, Cm>=0 outside the eventual threshold. Let R9 be the conjunction of the nine pinned residual predicates
  adm1(C31), adm2, adm3, adm6, adm7, adm8(Cm), adm9(Ce), unitBoundAtTwistedPlaces, admG1.
Combining RUN18 (Ev TypePrimeSizeConds iff K.La>0 and adm5 supplied at all positive tolerances), and §3:
  (forall delta>0, Ev(admitted with A.delta=delta))
     iff K.La>0 AND (K.rho=0 OR K.CN>C(e)) AND Ev(R9).
Forward: specialize delta=1, project R9, TypePrimeSizeConds and ArchimedeanSignatureMatching, then apply their necessary conditions. Reverse: for each positive delta choose the maximum of the R9 threshold, the uniform adm5(delta), TypePrimeSizeConds and ArchimedeanSignatureMatching thresholds and Fm.x1+1; reinsert all 12 pinned conjuncts. Thus no premise disappears without derivation. The threshold is chosen after delta but before every x,i,p. When K=GK, RUN20 derives GK.La>0 from Fm.fills and SizeLa; for independent K it is not automatic. No inference of GK.CN>C(e) from the mere fact of FamP existence.

The H version already noted in RUN17/19 removes adm2 and adm3 from admitted, and removes three conclusions from Conclusion₂. Its corresponding residual conjunction has seven rather than nine predicates if the same human derivations are applied. This is a source-signature comparison, not a proof of whole-version equivalence; keep R9 for P and do not silently repin. The nine unresolved predicates are not claimed independent in a logical sense or root-reachable.

## 5. Upstream evidence
Exact string matches tested P -> H:
- ElevenLe H blob a4a8c76eb7c3cc38989a0afebe51075070941a63: L24–25 -> L28–29, L31–33 -> L35–37, L134–138 -> L138–142.
- IsResidueClassZero H blob 0622fc3b6d32afcdece44b5bac2496fd8ab099a6: L56–66 -> L94–104, L79–85 -> L117–123.
- SmallOrderPrimes H blob ad70c916f276a693ddd51cb9387c38ebaeb4ffb7: L107–119 -> L102–114, L256–260 -> L241–245; H admitted L233–236 and Conclusion₂ L238–239 differ from P.
- DataParams₂ H blob 3c27f632cf4de6f41fc4e4cf077510613afe8f9a: L27–45 -> L33–51.
- UnramifiedQuadraticSetting H blob 1c9ff6676bad3634a65d75f248b53bb82c03d1ee: L239–248 -> L247–256.
H ParConsts blob 9c325c376642368457542fa7a47cb8488b799b16 L43, L78 and FamCore blob 9b67d02e58d04ab1e14a73ed572b83e63cd49193 L59–60, L113–117 inspected; no full upstream dependency equivalence claim.

## 6. Executed regression (standalone Node/V8)
Use x=b^(200d), e=m/d, so all powers in the envelope have integer exponents in b. Test exact worst-case envelope arithmetic, normalized by x², plus the sign equivalence. log x is replaced by the upper bound x; La is replaced by its upper envelope; these are not evaluations of the native D7, nor tests of the actual asymptotic threshold or geometric predicates. The universal argument is §2–4, not the finite grid.
```js
const counts={exponents:0,first:0,second:0,radius:0,ordering:0,negative:0};
const ck=(v,k)=>{if(!v)throw Error(k);counts[k]++};
for(const d of [53n,60n,100n,200n])for(const m of [1n,2n,3n]){
 if(52n*m>=d)continue;
 const E=200n*d, nExp=400n*d+1602n*m, kExp=900n*d+1998n*m, delExp=25n*m, aExp=202n*m;
 const f=nExp-delExp+200n*m+aExp-kExp;
 const s=E+aExp-kExp;
 ck(f===-500n*d-19n*m,"exponents");
 ck(s===-700n*d-1796n*m,"exponents");
 for(const b of [2n,3n,5n]){
 const x=b**E, n=b**nExp, k=b**kExp, deltaDen=b**delExp, L=b**aExp;
 // Normalize by x^2, and take worst-case upper n, lower k, upper La.
 const fNum=8n*n*b**(200n*m)*L*x*x, fDen=deltaDen*k;
 ck(fNum*b**(100n*d)<=8n*fDen,"first");
 for(const r of [0n,1n,7n,100n])for(const c of [0n,1n,11n,1000n]){
 // log x is replaced by its upper envelope x; native data are not simulated.
 const sNum=r*c*x*L*x*x,sDen=k;
 ck(sNum*b**(300n*d)<=r*c*sDen,"second");
 if(x>=256n && 2n*r*c<=b**(300n*d)){
 ck(2n*fNum<=fDen && 2n*sNum<=sDen,"radius");
 ck(fNum*sDen+sNum*fDen<=fDen*sDen,"radius");
 }
 }
 }
}
for(let a=0n;a<=8n;a++)for(let r=0n;r<=8n;r++)for(let N=1n;N<=12n;N++)for(let B=0n;B<=15n;B++){
 const common=17n*a;
 ck((common+r*a*N<=common+r*a*B)===(a===0n||r===0n||N<=B),"ordering");
}
ck(17n+4n>17n,"negative"); // CN=0, positive factors: ordering fails
ck(17n<=17n,"negative"); // zero rho: ordering holds even if CN=0
ck(8n*2n>1n,"negative"); // at x=1 envelope need not force x^-2
console.log(JSON.stringify(counts));
```
Actual execution: {"exponents":12,"first":18,"second":288,"radius":576,"ordering":15552,"negative":3}. No Lean or CI replay of this artifact.

## RESUME HERE
Request independent audit of the arbitrary-K exponent margins, threshold and residual R9 equivalence (especially preserving K≠GK and original P admission). Native constructor search via the default-branch lexical index remains unproductive; next translate pinned adm2/BTT and adm3 as explicit weighted exceptional-prime inequalities, locating their actual consuming theorem and checking role-labelled root paths before spending time on unlinked geometry. Ask dependency/kernel lanes for authenticated incoming edges to Pf.AdmFam, AdmF and FamilyClosedForm, and editor/integration to retain the P/H difference and mark the general-K lemma conditional. HANDOFF TO audit, dependencies, kernel, integration, editor, prime_window. Project OPEN.
