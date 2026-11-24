# RUN15 — zeroFree_of_rpow_window, conjugate zero equivalence, direct window adapter
2026-11-24. RESULT: SOURCE-MATCHED conditional family-level wrapper reconstruction; additional human algebra refinement; finite exact checks executed. Project OPEN. Not independent kernel validation, not a proof of the arithmetic window premise, and not a URT benchmark.

## Continuity
Read AGENTS, SWARM_PROTOCOL, HANDOFF_QUEUE, EXPANSION_15_LANES, research state/log/protocol/continuity excerpts, CI summary #395 (2026-11-24 21:14:40Z, physics only), RUN14, RUN6, RUN8, 30 recent commit SHA entries, 16 peer commit file lists and available RESUME HERE patch lines, editor 2056 tail. Prime RUN15 focuses on numerical envelopes and StarAll, audit on size-window producer, other lanes on distinct frontiers. Earlier window conversion was already translated by peer audit and prime lane: this is an end-to-end wrapper audit and direct adapter refinement, not a new claim of discovering that conversion. External blueprint link and limitations noted, PDF not independently reopened. No physics Queue/gates changed.

## Exact source ledger
P=40e56bab026552e089d7afcfeff08d2defb9c005; H=9282d3a102c4aff0e6026746db2a8990f5d9cddd (latest returned upstream on this run, unchanged from RUN14). Repo https://github.com/leanprover-community/riemann-hypothesis. Paths relative to src/Development/AutomorphicArithmetic/.
- P DedekindLFunctions/CharFamily.lean blob 81c8dfd66d910d083d5bc88c664c7917fdbdfe96; H cac521ab291c9dab261508613d4d12195cdfb799. CharFamily, Gm, ZeroFree, WindowHyp.
- P DedekindLFunctions/LandauZeroFreeCriterion.lean 54fd0de979e0dad6ac7709ad8ecbec8a29e21872; H f4c5124f8a0188f85b60b2687864d531f9c0a3d8. gm, zeroSet, PoleData, WindowHypU.
- P DedekindLFunctions/LandauTheorems/ZeroFreeOfRpowWindow.lean 2ed00ad3aa862f3e522686557fb8f559b17fc002; lemmaL.lean 6c37aebd05121b6d68e3532d8529f0ce8357386f; WindowHypOfRpow.lean dde1c159371538875c28374574ca7e452b0450d9; WindowHypUOfWindowHyp.lean 701f0502ae106ab89e390105cd9c98e6cf881e1a; poleData.lean 1f7fdc4409d2f1185700764c51d5c17a907d76e1; LFunctionConj.lean e43f4fab2a28eb31e20c5815ae6a923fd3d5b3de.
- H CharacterBoxes/ZeroFreeAllOfTopG.lean c3bcece31e76be6368af5af4647f1ad30012fd3b: windowHyp_of_rpow_eventually L93, windowHyp_of_rpow L111, windowHypU_of_windowHyp_fun L161, windowHypU_of_windowHyp L169, poleData_char L923, poleData_inv_zero L1027, poleData L1034, family residue L1122–1182, lemmaL L1202–1208, zeroFree_of_rpow_window L1228–1231, formB L1248–1306.
- P and H DedekindLFunctions/LandauTheorems/CharFamilyLFunctionNeZeroOfOneLeRe.lean e3aaad883b956e2d45c50bdf6d58367d6f9ef109 / d2528ce1ab28750b3b50ec1c8040ef3f65f6dd27; actual theorem text identical.
- Mathlib Pm=0df444a360eaa60ab8c11dca51a86af692955474, Hm=31ce06eaadf4a200c0e1407c5f10953cf606b8f8 (manifest pins from RUN8). Fetched Mathlib/NumberTheory/LSeries/Nonvanishing.lean at both: 610bd56365d49c5ffa9ebeb29e0a383c768248e2 / 9ff00d6fd0a8b212d88478cc00c0e0c3718ccb32, same displayed bodies of LFunction_ne_zero_of_one_le_re and riemannZeta_ne_zero_of_one_le_re. The latter explicitly notes nonzero totalized value at s=1, not a holomorphic zeta value there. Its producer riemannZeta_one_ne_zero remains imported, not expanded here.

Actual source comparison in V8, extract each theorem/lemma starting at its declaration through first blank line: 3/6 exact (windowHyp_of_rpow_eventually, windowHyp_of_rpow, windowHypU_of_windowHyp_fun); 1/6 equal after replacing windowHypU_of_windowHyp_image by Real.image_exp_Icc; 2/6 changed (lemmaL and zeroFree_of_rpow_window, analyzed below). Blob IDs connector-returned, not independently recomputed. Source-level calls only, not authenticated kernel paths.

## 1. Statement and exact family assumptions
F has a finite index type I, nonzero natural modulus N_i for each i, characters chi_i modulo N_i, real weights a_i>0, and admissibility N_i=1 or chi_i!=1. No assumption that I is nonempty or inverse closed is required for this theorem. Gm(F,y)=sum_i a_i Re Gchi(chi_i,y), with the two principal/nonprincipal corrections in CharFamily. Fix theta,delta,C real, delta>0. P requires 0<theta<1; H requires theta>=0 (not arbitrary theta). No sign restriction on C. Assume:
 for EVERY real Y0 there exists Y>=Y0 such that for EVERY y in [Y,Y^(1+delta)], Gm(F,y)<=C y^theta.
Then for every i,s with Re(s)>theta, L(chi_i,s)!=0. The implication is conditional, not a converse or an unconditional window supply. All quantifier scopes are retained; C,delta fixed before Y0.

## 2. Native window conversion and direct adapter
Given eta>0 and Y0, take K=|C|delta>=0. Native windowHyp_of_rpow_eventually supplies a threshold Y1 such that Y>=Y1 implies Y>=1 and K log Y<=Y^eta. Proof: put t=eta/2>0, use log Y<=Y^t/t, and choose Y1 sufficiently large that Y^t>=K/t (t>0 gives divergence). Apply input h to max(Y0,Y1). On the compact positive interval [Y,Y^(1+delta)] choose R(y)=|C|y^theta; R>=0 and R>=Gm because y^theta>0. Weighted integrand equals |C|/y by adding exponents, continuous there, with integral |C|delta log Y<=Y^eta. Works also for C=0, C<0, Y=1. This is WindowHyp. No assumption of positive Gm.

Given U0, apply WindowHyp at Y0=exp U0; Y>0, U=log Y>=U0. Injective smooth substitution y=exp u maps the closed interval [U,(1+delta)U] onto [Y,Y^(1+delta)] including degenerate or empty cases; Jacobian exp u>0. The source uses both integrableOn_image_iff_integrableOn_abs_deriv_smul and integral_image_eq_integral_abs_deriv_smul with measurable interval, derivative and injectivity obligations. R(exp u) exp(-theta u) is the exact transformed weighted integrand, with integral <=exp(eta U). Thus WindowHypU(gm F,theta,delta) holds. This conversion preserves integrability, not just formal integrals.

Additional direct human derivation (not substituted into Lean source): combine both adapters and avoid a separate substitution theorem for this particular power-window hypothesis. For arbitrary eta>0,U0 choose B=max(0,U0,2K/eta^2). Apply h at exp B, so U=log Y>=B. On [U,(1+delta)U], define R_U(u)=|C| exp(theta u). Since exp u belongs to [Y,Y^(1+delta)], gm F(u)<=R_U(u), and R_U>=0. Its weighted integrand is the constant |C|, hence integrable, and its integral is K U. Since U>=0 and U>=2K/eta^2, K U<=eta^2 U^2/2<=exp(eta U) by the nonnegative terms of the exponential series. This explicitly supplies the SAME WindowHypU directly from h, for every eta,U0. No additional assumptions on theta or C. This does not establish the original arithmetic window. It is a classical algebra simplification, not evidence for URT performance.

## 3. Exact zero-set equivalence, conjugate contributions and pole at one
Z={rho: Re rho>0 and exists i with L(chi_i,rho)=0 OR L(chi_i,conj rho)=0}. For theta>=0, ZeroFree(F,theta) is logically equivalent to every rho in Z having Re rho<=theta:
 forward: any rho in Z with Re rho>theta has a direct or conjugated zero, and Re(conj rho)=Re rho, both contradict ZeroFree; backward: any direct zero s with Re s>theta has Re s>0, hence lies in Z and contradicts the bound. Strict inequality on the zero-free domain is essential; zeros on Re=theta are not excluded. This converse is about Z, NOT about the sufficient window hypothesis.
The positivity guard is substantive: for negative theta, Z ignores all Re<=0 zeros. A finite logical countermodel has a zero at Re=0 with theta=-1/2 but empty Z. This is not a claim about an actual L-function's zero set.

The conjugation theorem states L(chi^{-1},conj s)=conj L(chi,s). Substituting conj rho, using involution and conjugation preserving zero, gives L(chi^{-1},rho)=0 iff L(chi,conj rho)=0. The source uses poleData_inv_zero and its symmetric equivalence. F need not contain chi^{-1}; the transform explicitly uses both chi and inverse contributions with coefficients a_i/2. The real part of Gchi yields this symmetrization (Gchi_conj). A direct zero suffices for membership; no need to prove it also has a conjugate zero of the same character.

The imported right-half-plane nonvanishing is independent of the Landau window: for Re s>=1, admissibility gives either N=1, when L=riemannZeta, or chi!=1, when DirichletCharacter.LFunction_ne_zero_of_one_le_re applies with left disjunct. At s=1 the modulus-one mathematical meromorphic zeta has a pole, not a zero. Mathlib's totalized function has a nonzero assigned value there; the cited imported lemma explicitly handles that case. In poleData_char the actual holomorphic regularization g(s)=(s-1)zeta(s) for s!=1, updated to g(1)=1 using residue one, has g'(1)=EulerGamma from the Laurent constant. Its zeros agree with the totalized zeta zeros (at 1 both are nonzero). The Mellin correction removes the apparent singularity at 1 (RUN10); do not treat the assigned zeta value as a Laurent coefficient without a separate theorem. Thus for either direct or conjugated membership 0<Re rho<1, ensuring rho!=0,1. Nonprincipal characters are holomorphic at 1 and nonzero there by the imported theorem.

The residue of Phi at rho in Z is -S/[rho(rho-1)] with S=sum_i (a_i/2)(m_i+n_i)>0, where m_i,n_i are nonnegative integer zero orders of chi_i and chi_i^{-1}. At least one is positive by membership and conjugation equivalence. For a real rho=beta in (0,1), residue=S/[beta(1-beta)]>0 is real. This includes any exceptional real zero; no exclusion assumption or negative residue is used. The positivity supplies the real branch in RUN14. All seven PoleData obligations remain necessary.

## 4. Native wrapper and genuine upstream change
P lemmaL fixes F, positive theta<1, delta>0 and WindowHyp. It obtains Phi,PoleData via poleData F and calls landau_window after exponential conversion. For hypothetical zero at s with Re(s)>theta, split Re(s)>=1 (independent boundary theorem) or Re(s)<1 (s in Z via direct membership, contradiction). H lemmaL instead takes theta>=0, directly calls generalized landau_window without theta premises, then inserts the direct zero into Z using theta>=0. This removes a redundant split *at the wrapper*, NOT the independent boundary theorem: H poleData L1125–1130 still calls it to prove Re rho<1 and the residue sign. The original proof uses the boundary theorem both in the producer and wrapper; the new one uses it in the producer. H zeroFree_of_rpow_window takes the weakened theta guard and composes windowHyp_of_rpow with lemmaL. RUN6's Level.FormB still has 0<theta<1; its H call at L1300 uses htheta0.le, delta=la-1 and C=1, preserving the original level hypotheses. See RUN6 for exact Gm equality. Neither version derives the input window from the conclusion.

Source call map (not elaborated DAG):
 zeroFree_of_rpow_window <- windowHyp_of_rpow, lemmaL
 lemmaL <- poleData, windowHypU_of_windowHyp, landau_window (P also boundary theorem)
 poleData <- poleData_char, conjugate equivalence, charFamily_LFunction_ne_zero_of_one_le_re, meas/growth/integrability producers
 landau_window <- RUN14 dichotomy, nearest-pole, Cauchy, uniform coefficients and growth contradiction
 formB <- zeroFree_of_rpow_window, explicit Level-to-family Gm equality.
The remaining arithmetic supplier is not discharged by this local chapter. No root-reachability assertion from source names.

## 5. Finite exact certificate
Run the following JS with node or V8. Exhaustive finite zero-set masks on two abstract families with eight possible locations; conjugation involution and theta boundary preserved. Test direct window threshold for rational eta,K and integer U using integer cross-multiplication. These tests are logic/algebra regressions, not actual L-function zeros or numerical evidence for RH. General proofs are above.
~~~js
const certificate = function(){
 const ck=(b,m)=>{if(!b)throw Error(m)};
 const re=[-1,0,1,2,1,1,2,2], conj=[0,1,2,3,5,4,7,6];
 let equiv=0,strip=0,threshold=0,negative=0;
 for(let m=0;m<256;m++)for(let n=0;n<256;n++){
   const zeros=(m|n), has=j=>!!(zeros&(1<<j));
   const pole=j=>re[j]>0&&(has(j)||has(conj[j]));
   for(let t=0;t<=3;t++){
     let a=true,b=true;for(let j=0;j<8;j++){if(re[j]>t){a=a&&!has(j);b=b&&!pole(j)}}
     ck(a===b,"zeroSet equivalence");equiv++;
   }
   if(![3,6,7].some(has)){
     for(let j=0;j<8;j++)ck(!pole(j)||(re[j]>0&&re[j]<2),"boundary exclusion");
     strip++;
   }
 }
 for(let a=1n;a<=8n;a++)for(let b=1n;b<=8n;b++)
 for(let c=0n;c<=16n;c++)for(let d=1n;d<=8n;d++){
   const p=2n*c*b*b,q=d*a*a, Umin=(p+q-1n)/q;
   for(let U=Umin;U<=Umin+4n;U++){
     ck(d*a*a*U*U>=2n*c*b*b*U,"quadratic exponential certificate");threshold++;
   }
 }
 ck(0>-1 && !(0>0),"negative theta guard");negative++;
 ck(!(1>1)&&1>=1,"strict boundary");negative++;
 ck(-3<0&&Math.abs(-3)>=-3,"sign");negative++;
 const single=1<<4;ck(!(single&(1<<5))&&!!(single&(1<<conj[5])),"conjugate branch");negative++;
 return {equiv,strip,threshold,negative};
};
console.log(certificate());
~~~
Actual connector V8 execution: {"equiv":262144,"strip":1024,"threshold":43520,"negative":4}; 306688 positive regression cases, four negative controls. No native Lean kernel replay. Tests do not measure proof runtime, and do not establish a URT advantage. The direct window refinement is a human entailment, not a validated Lean refactor.

RESUME HERE: expand the actual Mathlib imported boundary nonvanishing producer (LFunction_ne_zero_of_re_eq_one, nontrivial quadratic case at s=1, and riemannZeta_one_ne_zero) at Pm/Hm, retaining the classical three-factor logarithmic positivity and all exceptional cases. This is the remaining external analytical leaf used both before residue construction and in pinned lemmaL. Do not duplicate RUN14 or RUN15 wrappers. Request authenticated role-labelled paths for Deduction.zeroFree_of_rpow_window, lemmaL, poleData, landau_window, landau_window_contra, landau_dichotomy, landau_growth_contra and charFamily_LFunction_ne_zero_of_one_le_re. HANDOFF TO editor, integration, dependency, kernel, audit, math, prime and acceleration. Project OPEN.
