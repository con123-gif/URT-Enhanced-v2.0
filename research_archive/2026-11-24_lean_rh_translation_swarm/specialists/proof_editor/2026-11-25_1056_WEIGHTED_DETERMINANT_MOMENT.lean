import Formalism.SizeWindowBrackets.ChainSlopeWindows.LevelOfCongruence
import Development.AutomorphicArithmetic.DedekindLFunctions.LandauTheorems.ChTop

/-!
# Lane 15 — weighted determinant moment, 2026-11-25 10:56 UTC
Status: source-matched human conditional reduction; Lean certificate PREPARED,
NOT RUN. No new RH proof, no independent proof of the native moment.

Source pin leanprover-community/riemann-hypothesis
40e56bab026552e089d7afcfeff08d2defb9c005. Latest upstream observed
251c7b05dd869ceba1aa42c6001c00b4010f23f9, not incorporated.
Mission blob b4bc100c4ea7aa9cdf98a2509b7d9a4c5959bddc.
Prior editor joint signed budget 823d1b3d; geometry RUN27 02f1f880,
RUN28 4d395181, RUN29 0e9468bc; integration d4c1ff4b3; audit 604f95bc.
RUN27 gives eventual sign, RUN28 coarse reference and RUN29 determinant
anchor transport. New result: joint weighted arithmetic determinant moment.

## Human proof
At the selected translation use normalized positive word weights, t_i=log T_i,
A=sumA, R=Lam5, beta=cSl1*nT*m*(a/k+b'), lambda=4 log(1+x^cHH)/(1-delBar),
V=cCount log k. Keep EComp5, HComp and other native geometry hypotheses.
For Z_i=Ee_i+h_i, subtract at a minimizing word and average:
mean Z-min Z <= 2 Ebudget+Hbudget+A(max t-mean t).
Indeed Z_i=Ee_i+(h_i+A*t_i)-A*t_i; apply the retained two comparison bounds.
In the prior signed joint budget the count-dependent term is therefore bounded by
J=-A(mean t-R)+(1+lambda)*beta*mean t+lambda*A*(max t-mean t).
RUN27's actual IdentU/SizesA/RestSize context gives A>=nT*a/3,
beta<=2K*nT*a/x, lambda=O(log x), uniformly eventually
h=A-(1+lambda)*beta>=0. Put nu=lambda*A>=0.

Native determinant identity (LogWeightMinusLogBBound, lines 327-335,
part_five_lower_at_scale) and JointsL count_at_of give
F=f*k>0, P_i=product_rho vand(uColR)>0, common C including Gamma,
t_i=C-log(P_i)/F+r_i, 0<=r_i<=delta=log(1+1/F).
Set Q_i=P_i exp(-F*r_i), Qbar=weighted arithmetic mean Q_i,
Qmin=min Q_i, Lbar=weighted mean log Q_i. Exact cancellation:
J=A*R-h*C+((h+nu)*Lbar-nu*log Qmin)/F.
Jensen Lbar<=log Qbar now gives the single sufficient moment:
 Qbar^h*(Qbar/Qmin)^nu <= exp(F*(h*(C-R)+nu*V)).
It implies J<=(1+lambda)*beta*R+nu*V.
The original lower count and spread imply Q_i<=exp(F*(C-R)) and
Q_i/Qmin<=exp(F*V), so imply the moment. Converse fails, abstract
scalar control: F=1,C=R=0,h=nu=2,Q=(2,1/4), weights (1,8)/9,
V=log 2. Qbar=4/9 and Qbar/Qmin=16/9; moment holds, but
t_1=-log 2<R and spread log 8>V. This is NOT actual host geometry.

Unrounded P version adds at most nu*delta <= lambda*A/(f*k) <= ErrText
eventually, using A<=2*nT*a, ErrText>=nT*a, f,m>=1, k>=x*m.
If R<=U original budget follows; otherwise RUN28 coarse
R<=5*x^(eps/100)*m*L yields (1+lambda)*beta*R<=ErrText eventually
eps<1/52. Corrected moment costs at most +ErrText and unrounded
+2 ErrText. Existing conditional 400 M^3 x^(2eps) ErrText bound
absorbs these with 402 (M>=1,x>=1). The native [E] window conclusion
is preserved conditionally. No global Count5 deletion: retain
pointwise upper count for muTu_of_countF, sizeTu_of_countF, tuSize_of,
SlopesMF and all other consumers.

## Graph overlay
Original Main -> ... -> core_gm -> ch_top -> each_unit_bound_statement
-> s_lower5,Vvar_bound5,weighted_mean_lower_bound_le,Ga_bound5.
Replacement candidate: native determinant+rounding+word weights ->
moment -> J bound -> same retained joint geometry -> ErrX5at or explicit
extra ErrText -> same window transfer. Preserve all original graph,
typed dependencies, axioms and unresolved premises. Context key:
pin,host,D,scale,tables,translation,word weights,determinant,rounding,
constants. Backtrack to original route if moment or native replay fails.

## Source blobs (at pin)
LevelOfCongruence.lean e08edc360cdf8d5d95d82ef1b805a8ea1a6151ef
QuotientSlopeBoundsWith.lean f9f34a9147750e215a6b2f206eb6f9889aa726b6
MeanBoundSecondForm.lean e4332fd8680d2b2f82e0a1e44a276453e03e2109
LogWeightMinusLogBBound.lean 8d9b1ee9cc0e41975f2b5339b1ec183dd35bb626
JointsL.lean 057913eaf7d7d88fda208e16cd84e910ebdd4227
ErrorFormsWeakWindowsFalse.lean 1d1d179d111b5aa668893327264648558f30fdb6
SChain.lean a4bc8cecac40a1f5fd307661e151639aaf6a6efa
CoreAtH.lean 0ba3621036f19146e7e67fa9c0e8a1c38661a097
CoreGm.lean 3ba7a590e84c5993882ea6c5dcf9fdbed5f07d4d
ChTop.lean ce06a34a9e0b1b332e10d3b7efb04a06e9ab77f5
ChCore.lean 878f5077bc382426c7da988e5a375b85deeaa7de

## Execution
Exact BigInt regression actually executed, reproducible JS:
let oldCases=0,checks=0,strict=0;
const ck=v=>{if(!v)throw Error("determinant moment regression");checks++};
for(const h of [0n,1n,2n,5n])for(const n of [0n,1n,3n,6n])
for(const p1 of [1n,2n,4n,8n])for(const p2 of [1n,3n,5n,9n])
for(const w of [1n,2n,8n])for(const B of [2n,5n,9n])
for(const H of [1n,2n,5n,9n]){
 const den=w+1n,S=w*p1+p2,lo=p1<p2?p1:p2,hi=p1>p2?p1:p2;
 const lhs=S**(h+n),rhs=den**(h+n)*B**h*(H*lo)**n;
 if(hi<=B&&hi<=H*lo){ck(lhs<=rhs);oldCases++}
 if(lhs<=rhs&&(hi>B||hi>H*lo))strict++;
}
const S=16n,lo=1n;
ck(S**4n <= 9n**4n*4n**2n*(2n*lo)**2n);ck(8n>4n);ck(8n>2n*lo);
console.log({oldCases,checks,strict,negativeOrStrictControls:3});
Actual output: oldCases 3312, checks 3315, strict 3268, controls 3.
These are finite scalar controls, not actual geometry or proof of moment.

lean/lake unavailable here. Prior CI status independently fetched:
45577239749 strip root status b1c96f589ab16e7a0fda26e0e78c8797cf2be1cc
PASS return 0 98.87s; 45576756833 native prune status
7da354941e402b6f8b364ed03d8c5c82d27b7717 PASS 77.94s.
Neither checks the new certificate. Native rh_scan/prune/reduce/auto/frontier
not executed locally. No new kernel or axiom result. No URT speed claim.

RESUME HERE: inspect actual determinant weight definition and mass/volume
suppliers for a sum identity or direct quantitative log-moment estimate;
prove it on the same selected translation without independent witnesses.
Replay the actual native consumer bridge with rh_scan, rh_prune,
rh_reduce, rh_auto, rh_auto_frontier; audit its dependencies and axioms.
Integration: insert this conditional compression in the live shared
human proof, not another manuscript. RH and ten-page reconstruction open.
-/

namespace RHDeterminantMoment
noncomputable section
theorem count_moment_bridge
    (F A beta lam R C tbar tmax Lbar logMean logMin V : ℝ)
    (hF : 0 < F) (hA : 0 ≤ A) (hlam : 0 ≤ lam)
    (hsign : 0 ≤ A-(1+lam)*beta)
    (ht : F*(C-tbar) = Lbar)
    (hm : F*(C-tmax) = logMin)
    (hj : Lbar ≤ logMean)
    (hM : (A-(1+lam)*beta+lam*A)*logMean-lam*A*logMin ≤
      F*((A-(1+lam)*beta)*(C-R)+lam*A*V)) :
    -A*(tbar-R)+(1+lam)*beta*tbar+lam*A*(tmax-tbar)
      ≤ (1+lam)*beta*R+lam*A*V := by
  have hh : 0 ≤ A-(1+lam)*beta+lam*A := add_nonneg hsign (mul_nonneg hlam hA)
  have hj' := mul_le_mul_of_nonneg_left hj hh
  have hbound : (A-(1+lam)*beta+lam*A)*Lbar-lam*A*logMin ≤
      F*((A-(1+lam)*beta)*(C-R)+lam*A*V) := by linarith
  have hid : F*(-A*(tbar-R)+(1+lam)*beta*tbar+lam*A*(tmax-tbar)) =
        F*(A*R-(A-(1+lam)*beta)*C)+(A-(1+lam)*beta+lam*A)*Lbar-lam*A*logMin := by
    rw [← ht, ← hm]
    ring
  have hout : F*(-A*(tbar-R)+(1+lam)*beta*tbar+lam*A*(tmax-tbar)) ≤
      F*((1+lam)*beta*R+lam*A*V) := by
    rw [hid]
    calc _ ≤ F*(A*R-(A-(1+lam)*beta)*C)+F*((A-(1+lam)*beta)*(C-R)+lam*A*V) := by linarith
      _ = _ := by ring
  exact (mul_le_mul_left hF).mp hout

theorem old_count_implies_moment (F h n C R V L M : ℝ)
    (hh : 0 ≤ h) (hn : 0 ≤ n)
    (hL : L ≤ F*(C-R)) (hV : L-M ≤ F*V) :
    (h+n)*L-n*M ≤ F*(h*(C-R)+n*V) := by
  have h1 := mul_le_mul_of_nonneg_left hL hh
  have h2 := mul_le_mul_of_nonneg_left hV hn
  calc (h+n)*L-n*M = h*L+n*(L-M) := by ring
    _ ≤ h*(F*(C-R))+n*(F*V) := add_le_add h1 h2
    _ = _ := by ring
#print axioms count_moment_bridge
#print axioms old_count_implies_moment
end
end RHDeterminantMoment
