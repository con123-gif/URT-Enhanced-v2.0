import Lib.DiscreteSeries.FlenstedJensen.FlenstedJensenInvariance
import Lib.DiscreteSeries.Rigidity.KernelFixes
import Mathlib.Tactic

/-!
# RUN73 — accretive splitting invariance and exact signed Casimir budget
27 November 2026. SOURCE-MATCHED HUMAN DERIVATION; native checks prepared,
not compiled; RH remains OPEN. Credit Alpöge, Sernau, Anthropic collaborators
and Claude. Compact pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Original pin 40e56bab026552e089d7afcfeff08d2defb9c005 retained separately.
Read mission c960cfc62fc12f5c44f9327d0cd5507ab386c7ea, AGENTS, swarm,
handoff, continuity, current manuscript d3d4b13233d81e40b5aad8ed8df79be69f367181,
RUN72 47dd3858b7c39ec433e07b74a179d6949713ffc2 and lead 998ff3413178a072d61e40f3b8f5bb8bac555819.
Continue local theta C branch; do not duplicate lead Rallis/identity-only SW
comparison or restart prior peer suppliers.

## 1. Accretive splitting: one exact divergence identity

Actual FlenstedJensen/FlenstedJensenInvariance.lean blob
46f4a4931a139742e73fc43f519da651ed680233:
flenstedJensen_eq_of_accretive and dsCoeff_eq_flenstedJensen.
RepresentationDefs.lean 94fea15fbc65ed74c2a44e83dda2cd423d39fbea;
MinorEquivariance.lean 062b3ebed0519f48edeb7853533ed8ccdda4370a.
Set rc_i=twoRho(l,same signs)_i, mu=paramAddRho(l), Lambda=mu-rc.
Keep native HasGap, distinct l, the resulting dominant weights Lambda and mu
for order -l, and the native minor equivariance and analytic-family facts.

Fix g admitting the two block diagonal splittings. All matrices a and g
are invertible (accretive a^-1 g is invertible, hence both factors are).
Use the source inversion identity weightMinors_neg to write the unnormalised
integrand at a as
   Phi(a,k)= m_Lambda(a k) m_Lambda(k^-1) / m_mu(k^-1 g^-1 a k).
The domain D={a block diagonal : g^-1 a accretive} is convex over R,
open in the block diagonal subspace, and exactly the admissible set by
inversion of accretive matrices. Accretivity implies all principal minors
nonzero, including those in the denominator. On compact K, all relevant
denominators stay nonzero locally uniformly in a, so holomorphic
differentiation under Haar is legitimate via IsAnalyticFamily.
Do not divide by the numerator (it may vanish).

For any block diagonal increment X define
    Y=(a k)^-1 X k,  c_k(E)=a k E k^-1.
Let dPhi denote the derivative in a. If i,j have the same sign and
l_j<=l_i, the right Borel equivariance applied to I+t E_ij gives
    dPhi[c_k(E_ij)] = delta_ij (Lambda_i-mu_i) Phi.
Thus the diagonal contributes -sum_i rc_i Y_ii Phi; the strictly
opposite triangular part of this Borel contributes zero.
The other entries, S={(i,j): same sign, l_i<l_j}, remain.

For each (i,j) in S define P_ij(k)=Phi(a,k) Y_ij(k).
Right-translate k by b(t)=I+t E_ij in a complex neighbourhood of K.
This is allowed as a holomorphic extension, not as a unitary translation.
E_ij^2=0 and b(t)^-1=I-t E_ij. The left opposite-Borel factors
b(t)^-1 in m_Lambda((kb)^-1) and m_mu((kb)^-1 g^-1 a kb) have
diagonal character 1. Their removal gives EXACTLY
    Phi(a,k b(t))=Phi(a k b(t) k^-1,k).
The transformed Y becomes b(t)^-1 Y b(t), with (i,j) entry
    Y_ij+t(Y_ii-Y_jj)-t^2 Y_ji.
Hence
    d_R P_ij(k)[E_ij]
      = Y_ij dPhi[c_k(E_ij)] + (Y_ii-Y_jj) Phi.
Now sum BEFORE taking any norm:
    sum_(i,j in S) (Y_ii-Y_jj) = -sum_i rc_i Y_ii.
Therefore the full derivative satisfies the exact divergence identity
    dPhi(a,k)[X] = sum_(i,j in S) d_R P_ij(k)[E_ij].        (H)
This matches the actual d X = sum D p (single p.1 p.2 1) step.
No estimate or limiting approximation of the diagonal term.

For each P_ij, F(b)=integral_K P_ij(k b) dk is holomorphic near I
(the analytic-family theorem and compact uniform nonvanishing).
F is constant for b in K by right Haar invariance. Its derivative
at I is zero on the block skew-Hermitian Lie algebra. The complex
span is the full block matrix algebra: for i!=j,
    E_ij=[(E_ij-E_ji)-i*i(E_ij+E_ji)]/2;
both parenthesised skew generators are in the compact Lie algebra.
By complex linearity F'(I)[E_ij]=0. This is precisely the source
fderiv_eq_on_blockDiagAlg guard; no complex group Haar invariance assumed.
Integrate (H) to get d/da integral Phi=0 on all block directions.
Convexity of D lets us join the two actual a,b by the real segment;
derivative zero implies identical integrals. Restore the same fixed
normalising kTypeNormSq. This proves the source splitting-invariance
argument with its original premises and no auxiliary coefficient bound.
The normalization is nonzero by m_Lambda(1)=1 and full support Haar.
The exact analytic-family and minor equivariance suppliers are retained.

Actual consumers: KTypeProjection.lean f6c936f970a93a7318e5ea3ebe61f8c7dae77d2a
uses dsCoeff_eq_flenstedJensen at b near identity with splitting 1
and at x k b with splitting blockDiagPart(x) k. RUN72 section 5
already proves the circle projection after this supplier; insert
(H) there, not a second circle-mean derivation. PsiBasic.lean
d888fafb9db9b1a5e78aa2551a1480f0cf057d20 dsCoeff_polar invokes the
same theorem with splitting p q^-1; its inverse/conjugate formula
and compact normalization are therefore connected to the same proof.

## 2. Exact Casimir completion of squares, retaining the sign

Actual Rigidity/CasimirBound.lean f47bbb602c8e77086cbc4506f6580739716dd2b7,
HCParam.IsKHighest.casimir_bound, inner_casimir,
GlModule.casimir_eq_diag_add_twoRho_add, casimirK_eq_smul.
Let rn_i=twoRho(l,unequal signs)_i, r_i=rc_i+rn_i,
d_i=rn_i-rc_i, w_i=Lambda_i+nu_i=(l_i+d_i)/2+nu_i.
For a nonzero K-highest vector v of weight w, the compact Casimir
expectation is sum w_i(w_i+rc_i)||v||². Expand the noncompact
Casimir with the reversed order -l as in the source. Every
noncompact quadratic term is a negative squared norm by the
sign adjoint, so the full Casimir expectation is at most
    sum_i (w_i²-d_i*w_i)||v||².
IsUnitaryCasimirGe supplies the lower bound
    sum_i (l_i²-r_i²)/4 * ||v||².
Divide only by ||v||²>0 and subtract exactly:
    w_i²-d_i*w_i-(l_i²-r_i²)/4
      = nu_i(nu_i+l_i)+rc_i*rn_i.
Thus the actual highest-weight consumer has the stronger inequality
    0 <= sum_i nu_i(nu_i+l_i) + sum_i rc_i*rn_i.          (C)
This retains the full sign and eliminates the loose separate squares
before comparison. No use of irreducibility or a claimed RH theorem.

There is an elementary exact combinatorial interpretation. Sort the
distinct l increasingly and let the sign string have p plus and q minus.
Then sum rc_i rn_i = sum_(i<j, same sign)(rn_j-rn_i), since rc_i
is lower same-sign count minus higher same-sign count. Each intervening
opposite-sign index k increases rn_j-rn_i by 2; no index outside the
open interval contributes. Consequently
    sum_i rc_i rn_i = 2 #{i<k<j : eps_i=eps_j != eps_k}
       <= 2[C(p,2)q+C(q,2)p] = pq(n-2) <= n³ (n>=2).
For n=0,1 it vanishes. In particular the native bound
0<=sum_i(n²+nu_i(nu_i+l_i)) follows immediately.
RUN72's actual first-step consumer nu=e_a-e_b, opposite signs,
now has 0<=2+l_a-l_b+sum rc_i rn_i, which implies exactly its
required 0<=n³+2+l_a-l_b. Thus all previous gap guards unchanged.
Do not optimize gapThreshold globally without consumer audit.

## 3. Executed exact integer regression and negative control

The following JS was actually executed in the tool isolate, not Lean:
```js
let count=0,max=0,negative=0;
for(let n=0;n<=12;n++)for(let mask=0;mask<(1<<n);mask++){
 let s=Array.from({length:n},(_,i)=>(mask>>i)&1);
 let rc=s.map((v,i)=>s.reduce((a,w,j)=>a+(v===w?Math.sign(i-j):0),0));
 let rn=s.map((v,i)=>s.reduce((a,w,j)=>a+(v!==w?Math.sign(i-j):0),0));
 let sum=rc.reduce((a,v,i)=>a+v*rn[i],0),t=0;
 for(let i=0;i<n;i++)for(let j=i+1;j<n;j++)for(let k=j+1;k<n;k++)
   if(s[i]===s[k]&&s[i]!==s[j])t++;
 let p=s.reduce((a,v)=>a+v,0),q=n-p;
 if(sum!==2*t||sum<0||sum>p*q*Math.max(0,n-2))throw Error("failure");
 for(let i=0;i<n;i++){
   let l=2*i+1-n,nu=i-3,d=rn[i]-rc[i],w2=l+d+2*nu;
   if(w2*w2-2*d*w2-(l*l-(rc[i]+rn[i])**2)!==4*(nu*(nu+l)+rc[i]*rn[i]))
     throw Error("square failure");
 }
 if(sum>0&&sum!==-2*t)negative++;
 max=Math.max(max,sum);count++;
}
```
Output: sign_strings=8191, negative_controls_detected=8034,
max_correction=140. The sign-reversed correction was detected in
every strictly positive case; zero cases are not distinguishing.
This is regression only; proof is sections 1–2.

## 4. Frontier, native state and caller handoff

Original source-visible edges retained:
star_inequality -> C integral_forms_long -> comparison/Hecke forms
-> MemberOrthogonality -> half-edge local theta generation
-> partner rigidity/off-cone projector -> compact spectral separation /
KTypeProjection -> casimir_bound / flenstedJensen_eq_of_accretive.
Reduced human route: (C) -> native highest-weight bound -> RUN72 word
energy; (H) -> splitting invariance -> RUN72 circle mean -> projector.
No global deletion or new kernel reachable counts. In particular
IsAnalyticFamily, exact minor equivariance, highest coefficient extension,
L2 realization and Schur normalization remain needed. KernelFixes.lean
b7c9218680d4848f11347c91dd6a952ee9b1a0ca directly uses RUN72's
mem_orthogonal_filtration_of_casimirK at s=0, the circle projector at
integratedRep_eq_zero_of_notMem_rootCone, and hg.toL2_spec.2 for the
coefficient rigidity. Its separate positivity argument uses dsCoeff_polar.
Thus both new suppliers now have actual downstream consumers.

Local command -v lean/lake/elan returned no paths. No native rh_scan,
rh_prune, rh_reduce, rh_auto or rh_auto_frontier run in this session.
Existing original-pin engine/axiom evidence unchanged. Actual state
compute/rh-compact-targeted-replay-20261126/outputs/targeted_results.json
blob 23de197bd48f404ca2074c69676de289c4f7934e read: all_requested_checks_ok
true, full_RH_replay false, 10 native + 4 scalar checks standard three axioms;
modules RootsOfUnityPoints, ModuleIndex, Heights, NOT this work.
Orchestrator summary a05c9c5fa19f276824b7bf52b87745ce698ed391
run 45953953705 unrelated baseline, not a certificate for RUN73.
Prepared probes/scalar certificates below; do not claim new PASS.

RESUME HERE: inspect actual Lib/DiscreteSeries/CuspKernel/SchurOrthogonality.lean,
specifically toL2_spec, and derive normalized L2 realization using the
already reconstructed circle and accretive splitting identities. Then
resolve isHolOfWeight_coeffMap at KernelFixes.integral_conj_weightMinors_smul.
Batch RUN69–73 scalar probes and source declarations into the existing
compact native queue when resources permit. Do not alter protected workflows.
HANDOFF TO integration/editor (attach H and C to RUN72), independent audit,
kernel runner. RH remains open, no completed human proof.
-/

namespace RHDependencyRun73
theorem square_cancel (l nu rc rn : ℝ) :
    let w := (l + rn - rc)/2 + nu
    w^2 - (rn-rc)*w - (l^2-(rc+rn)^2)/4 =
      nu*(nu+l)+rc*rn := by
  dsimp
  ring

theorem transfer_budget (u c b : ℝ) (h : 0 ≤ u+c) (hc : c ≤ b) :
    0 ≤ u+b := by linarith

theorem divergence_entry (yij yii yjj yji t : ℂ) :
    yij+t*yii-t*yjj-t*t*yji =
      yij+t*(yii-yjj)-t^2*yji := by ring
end RHDependencyRun73

#check @flenstedJensen_eq_of_accretive
#check @dsCoeff_eq_flenstedJensen
#check @HCParam.IsKHighest.casimir_bound
#check @integral_conj_weightMinors_mul_dsCoeff
#print axioms RHDependencyRun73.square_cancel
#print axioms RHDependencyRun73.transfer_budget
#print axioms RHDependencyRun73.divergence_entry
#print axioms flenstedJensen_eq_of_accretive
#print axioms HCParam.IsKHighest.casimir_bound
