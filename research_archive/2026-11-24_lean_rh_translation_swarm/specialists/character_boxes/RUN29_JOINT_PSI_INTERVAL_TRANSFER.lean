import Development.AutomorphicArithmetic.MeanSquareBounds.twistK
import RHProofTermPrune
import RHRecursiveReductionFixed
import RHRecursiveReductionAutoV3

/-!
# RUN29 — one interval transfer supplies the signed twist and candidate count
25 Nov 2026. Lane 6. SOURCE-MATCHED human replacement; scalar Lean replay
PREPARED, not executed. RH OPEN.

Preflight: latest ONE_EQUATION_MISSION b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc
(including unified engine and native ten-page pyramid); AGENTS, SWARM,
HANDOFF, EXPANSION, continuity, state, protocol/log and CI summary;
live manuscript 4f571d3bfce24fbaef352cd403666872a8981175; peer handoffs
including audit RUN29 caaaca4e9e7b05fe32a32f0a99d48039008b7004,
prime RUN29 353366eb82b4a17d6ea22b005bbd88b14f186f47 and all changed
lane handoffs since 7232e7b5 (15 files). Audit RUN29 retains PNTAPRelW;
this step instead bypasses the cumulative prime-count wrapper in both
local consumers. No independent RH detour or physical changes.

## Compact proof block
Use the native PsiRel (not PNTAPRelW), i.e. the aggregate character
Chebyshev remainder at t, bounded by A*t*eta(M)*E(t), with
E(t)=exp(-c log(t)/log(M))+exp(-c sqrt(log(t))).
Native PNTFinal first produces exactly this by glue_ranges and only
then calls prime_count_of_psi. Retain its exact shared eOf(M) and
eta=min(1,(1-beta)log M) for an exceptional pair, eta=1 otherwise.
Retain etaOf_lower(1): eta>=c1/M with c1>0. No new Siegel estimate.

Fix eps,Ahost,B>0 before the uniform threshold Y0. For positive
U, put V=sqrt(U), u=log U, L=log Y, M=m0*s, Z=m0*Y^Ahost.
For the original twist s>1 odd squarefree, coprime to m0 and <=Y^Ahost.
For the candidate-count branch use s=1, no signed test.
By admitted, uniformly log M<=log Z<=8u/L², u>=Y^(eps/6),
log u<=(eps/5+2)L. As in RUN28 the PsiRel range holds throughout
[V,U], V>Y^Ahost, and log V>=log M for large Y. The native
nonpositive U branches are not changed; retain their original proof.

C=clsB(m0,s,a0), a nonempty coset of units; h=|C|/phi(M)=1/phi(m0)
>=1/M by CRT (s=1 means a single unit class mod m0).
Weights w=1 or J(b)=(b/s) on C, zero elsewhere.
Define F_w(t)=sum_{n<=t} Lambda(n) w(n mod M).
By character orthogonality (native abs_psiAP_sub_le before norm),
 F_w(t)=h*(j_w*t-k_w*t^beta/beta)+R_w(t),
where j_w is average of w on C, k_w average of w*chi_exc on C;
if no exception k_w=0 and beta can be set to 1. For the unsigned
weight j=1, |k|<=1. Signed j=0 exactly, k=0 unless the native
alignment holds, then k=+/-1 and the unsigned k is zero.
The projection coefficient of each character has modulus <=h.
Thus for BOTH weights on the SAME interval
 |R_w(t)|<=h*eta*t*d,
 d=|A|[exp(-c*L²/16)+exp(-c*sqrt(u/2))]=o(Y^-B).
No factor counting all characters is added: PsiRel already sums them.

Apply partial summation directly on (V,U], not to [2,U] and [2,V]
independently. With H_w(t)=h*(j_w*t-k_w*t^beta/beta), define
 I_w=integral_V^U H'_w(t)/log(t) dt
     =h*[j_w*(li(U)-li(V))-k_w*(li(U^beta)-li(V^beta))].
Then the exact identity is
 sum_{V<n<=U} Lambda(n)w(n)/log(n) - I_w
 = R_w(U)/u - R_w(V)/log V + integral_V^U R_w(t)/(t log²t) dt.
Finite step-function summation by parts gives this including a possible
jump at V (excluded) and at U (included). For u>=4 its absolute value
is at most 4*h*eta*d*U/u, since log V=u/2 and
1+2V/U+4/u<=4. Thus no small-t PNT and no separate initial-range term.

For prime powers n=p^k with k>=2 the coefficient Lambda(n)/log n=1/k.
The total absolute contribution K is <=sqrt(U)*u/log 2 by counting
at most sqrt(U) bases for each of at most u/log 2 exponents. This is
one joint bound on the full coset, not multiplied by |C|. With s<V
every prime counted in PPset is a unit mod M. Write P=card PPset,
T=sum_PPset J, and I=I_unsigned, D=I_signed.
Since 0<=eta<=1 and (1-beta)log t>=eta, the inequality
1-exp(-eta)>=eta/2 (native exp_neg_le_one_sub_half) gives
 I>=h*eta*(U-V)/(2u)>=h*eta*U/(4u).
This also holds without exception and for an unsuppressed coset.
Consequently both |P-I| and |T-D| are <=kappa*I where
 kappa=16*d+4*u²*M²/(c1*log(2)*sqrt(U)).
The second term is o(Y^-B) uniformly: log M<=8u/L², so for large L
M²/sqrt U<=exp(-3u/8), while u>=Y^(eps/6) and log u=O(L).
In particular I>=c1*U/(4u*M²) and I/2>=U^(9/10) for large Y,
uniformly (16/L² -> 0 and log u/u -> 0).
This supplies the original positive candidate count, even in the
suppressed coset. It does NOT remove etaOf_lower from the shared graph.

For the twist retain page_across and jacobi_separate: at most one
bad s across all M<=Z; every other aligned exception has
1-beta>=c0/log Z. For a nonaligned exception D=0 exactly; no unsigned
main-term replacement in this case. In the aligned case I is unbiased,
and the integrand ratio t^(beta-1)<=exp(-c0*u/(2 log Z))=:r
throughout the interval. Hence |D|<=r I in all permitted cases,
r<=exp(-c0 L²/16)=o(Y^-B).
Now one division-free scalar result supplies both original outputs:
    (1-kappa)*|T| <= (r+kappa)*P,     P >= (1-kappa)*I.
Choose uniformly kappa<=Y^-B/4, r<=Y^-B/4, Y^-B<=1. It follows
|T|<=Y^-B P and P>=I/2>=U^(9/10). For s=1 only the second
conclusion is used (no Page requirement). This is a joint replacement
of the positive-U local count_a and twistK route, not a new RH criterion.
The original same-host selection and exceptional s quantifiers survive.

## Dependency and audit ledger
Source pin 40e56bab026552e089d7afcfeff08d2defb9c005.
M=src/Development/AutomorphicArithmetic/MeanSquareBounds/:
twistK.lean 07e569eaf54b3b91fedad4117991838a23b93603;
PrimeSetTwoBounds.lean 45616f33334b6ef360b18a8e64c0eb325f9463b8.
J=src/Formalism/GL3MeanSquares/GenusMeanAsymptotics/JacobiCharacterSums/:
DeuringHeilbronnM.lean c88517739b211c9cb0da65b0f6bc59611f809901
(PsiRel, eOf, etaOf, mainPsi);
PNTFinal.lean 616aec99297d346eb1570dc53468c5e9bf79886c;
PNTRangeA.lean 91acb9e608ae0b94882fe181ddb0917d86335d99;
PNTBAsm.lean 4ff480d42f552af6a4839a0cdfa65a4b388d2d8b;
PNTGlue.lean 6e6f6f96c860d401ccd24925673095ad549357e3;
PNTEOf.lean 69fb97f9bd646a9fb357b6ba1739cf82a173e9ed
(etaOf_lower, eOf_exc, eOf_char_sq);
PrimeCountOfPsi.lean b9de07b020e092a99735799208f2762dabf0551c;
PNTPiA.lean d3e687208d938c05f6374a308ea2c6e308278eb1
(abs_psiAP_sub_le, mainPsi_sum_none/some);
PNTPiC.lean 3ddbaa0ff2ded4ac263218a357635abb952b0a0f;
MSqCount.lean 6883d25c4f9fcd1dbe49b19e4dea23bfe8c87935;
MSqTwistB.lean b59dc9c511610ee5d4cc877702b18ef933e3a3c4.
PPset source SecondEstimateOfIntervalHypothesis.lean
bdea967f4db26bfc2b040f01beeebbed0ff8909c.
Latest upstream head retrieved 251c7b05dd869ceba1aa42c6001c00b4010f23f9,
same as RUN28; all derivation reads pinned. No version mixing.

Original local edges: twistK -> {PNTAPRelW, count_a, ExcBound,
ZFRDirichlet, page_across, jacobi_separate, twist_one, final_ineqK};
count_a -> {PNTAPRelW, ExcBound, count_pos}; PNTAPRelW producer ->
{PsiRel producer, prime_count_of_psi}; PsiRel producer ->
{glue_ranges, near_range, far_range, ExplicitS, SharpenS, ZeroSum}.
Proposed local positive-U overlay: {twistK, count_a} -> {same
PsiRel producer, etaOf_lower(1), joint interval transfer NEW};
twistK additionally -> {ZFRDirichlet, page_across, jacobi_separate}.
Keep all original edges/axioms, type/constructor dependencies, and
nonpositive branches pending caller replay; PNTAPRelW remains for
other uses. No claim of removing the deep analytic suppliers or
reducing global reachable axiom count. Source-matched branch under
RUN27/28 and audit RUN29, not new authenticated kernel root edges.
Context cache key=(pin,eps,Ahost,B,Y,U,m0,a0,s,eOf(M),eta(M),V,U,w).
Backtrack to original PNT conversion if caller replay fails.
Prior engine CI status retrieved: 45577239749 pass 98.87s, blob
b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc; 45576756833 pass 77.94s,
blob 7da354941e402b6f8b364ed03d8c5c82d27b7717. They validate only
earlier tools/conditional root, not this replacement. No Lean/lake
on PATH; no new native CI or axiom evidence, no URT advantage.

Executed JS regression (real primes, floating-point partial summation
identity; exact integer sieve and signs, no PNT claim):
{"primes":5133,"primePowers":5217,"cases":380,"checks":1140,"negative":2,"maxError":2.2737367544323206e-12}
Reproduce in Node (strip this comment):
function regression(){
 const N=50000, is=new Uint8Array(N+1).fill(1); is[0]=is[1]=0;
 for(let p=2;p*p<=N;p++)if(is[p])for(let n=p*p;n<=N;n+=p)is[n]=0;
 const primes=[];const powers=[];for(let p=2;p<=N;p++)if(is[p]){primes.push(p);for(let n=p,k=1;n<=N;n*=p,k++)powers.push([n,p,k]);}
 powers.sort((a,b)=>a[0]-b[0]);const gcd=(a,b)=>b?gcd(b,a%b):a;
 const leg=(a,p)=>{a%=p;if(a===0)return 0;for(let i=1;i<p;i++)if(i*i%p===a)return 1;return -1};
 let cases=0,checks=0,negative=0,maxError=0;
 for(const U of [10000,12345,40000,50000])for(const m of [8,16,24,40])for(const a of [1,3,7])if(gcd(a,m)===1)for(const s of [1,3,5,7,15,35])if(gcd(s,m)===1){
  const V=Math.sqrt(U),M=m*s, factors=[3,5,7].filter(p=>s%p===0);
  for(const signed of [false,true]){
   if(signed&&s===1)continue;
   const w=n=>n%m===a%m&&gcd(n,M)===1?(signed?factors.reduce((z,p)=>z*leg(n,p),1):1):0;
   let F=0,G=0,I=0,last=V,P=0,R=0,Fu=0;
   for(const [n,p,k] of powers){if(n>U)break;const q=w(n);if(n<=V){F+=q*Math.log(p);continue;}
    I+=F*(1/Math.log(last)-1/Math.log(n));last=n;F+=q*Math.log(p);
    G+=q/k;if(k===1)P+=q;else R+=q/k;
   }
   I+=F*(1/Math.log(last)-1/Math.log(U));Fu=F;
   let Fv=0;for(const [n,p] of powers){if(n>V)break;Fv+=w(n)*Math.log(p)}
   const err=Math.abs(Fu/Math.log(U)-Fv/Math.log(V)+I-G);
   maxError=Math.max(maxError,err);
   if(err>1e-7||Math.abs(G-P-R)>1e-8||Math.abs(R)>Math.sqrt(U)*Math.log(U)/Math.log(2))throw Error("interval check");
   checks+=3;cases++;
  }
 }
 // A suppressed unsigned coset cannot be replaced by its unbiased main term.
 const u=20,b=1-2**-40;
 if(!(1-Math.exp((b-1)*u)<1e-8))throw Error("suppression control");
 negative++;
 // Exact half-open endpoint: 101^2 may not be counted at the lower endpoint.
 if(!powers.some(([n,p,k])=>n===101*101&&p===101&&k===2))throw Error("power control");
 negative++;
 return {primes:primes.length,primePowers:powers.length,cases,checks,negative,maxError};
}
console.log(regression());

RESUME HERE: native formalize the half-open interval partial-summation
identity using PNTPiA.cAP/sum_cAP and PNTPiB; replay both actual
positive-U callers and audit all surviving dependency roles. Then
reconstruct the shared PsiRel zero-sum producer, not the redundant
prime-count wrapper. HANDOFF TO audit, kernel, integration/editor.
-/

namespace RHJointInterval29
theorem joint_transfer (I P T D k r : ℝ)
    (hk : 0 ≤ k) (hk1 : k ≤ 1) (hr : 0 ≤ r)
    (hP : |P-I| ≤ k*I) (hT : |T-D| ≤ k*I)
    (hD : |D| ≤ r*I) :
    (1-k)*|T| ≤ (r+k)*P ∧ (1-k)*I ≤ P := by
  have h1 : (1-k)*I ≤ P := by linarith [(abs_le.mp hP).1]
  have htri : |T| ≤ |T-D|+|D| := by
    have h := abs_add_le (T-D) D
    rwa [sub_add_cancel] at h
  have h2 : |T| ≤ (r+k)*I := by nlinarith
  refine ⟨?_, h1⟩
  calc
    (1-k)*|T| ≤ (1-k)*((r+k)*I) :=
      mul_le_mul_of_nonneg_left h2 (by linarith)
    _ = (r+k)*((1-k)*I) := by ring
    _ ≤ (r+k)*P := mul_le_mul_of_nonneg_left h1 (by linarith)

theorem joint_auto (I P T D k r : ℝ)
    (hk : 0 ≤ k) (hk1 : k ≤ 1) (hr : 0 ≤ r)
    (hP : |P-I| ≤ k*I) (hT : |T-D| ≤ k*I)
    (hD : |D| ≤ r*I) :
    (1-k)*|T| ≤ (r+k)*P ∧ (1-k)*I ≤ P := by
  first | (rh_reduce 3 using [joint_transfer]; done)
        | (rh_auto_frontier 2; done)
        | (rh_auto 3; done)
        | exact joint_transfer I P T D k r hk hk1 hr hP hT hD

end RHJointInterval29

rh_scan QH.twistK limit 2000
rh_scan Formalism.HermitianLattices.Ext.LogarithmicIntegralBounds.count_a limit 2000
rh_scan Formalism.HermitianLattices.Ext.PrimesInProgressions.prime_count_of_psi limit 2000
rh_prune QH.twistK as RHJointInterval29OriginalTwistPruned
rh_prune RHJointInterval29.joint_transfer as RHJointInterval29Pruned
#print axioms QH.twistK
#print axioms Formalism.HermitianLattices.Ext.LogarithmicIntegralBounds.count_a
#print axioms RHJointInterval29.joint_transfer
