import New.Selmer.OnePlaceDefect

/-!
# Compact RH audit: tame cokernel descent and exact local caller

26 Nov 2026. Status: SOURCE-MATCHED human derivation / PREPARED native
probe, NOT compiled. No claimed RH proof, no new kernel closure.
Attribution: Levent Alpöge, Luke Sernau, Anthropic collaborators, Claude.
Source pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src, Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Latest mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript
499c62386aed401e362cff682bccd142d5b2c5ba; prior audit 6880d1d1;
integration unramified note d043ac34631e5aac489c94cda523a138b09e38f0.
Mission and protocol inspected; no edits outside audit.

## Source anchors / original retained dependency edges

New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395:
43--61 exists_z_smul_eq_sum_tameGen; 67--76
aeval_linearFrob_extLattice_eq_zero; 81--116 killsCokernel_of_isKilledBy.
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487:
mem_liftIdeal_iff, exists_lift_of_mem_liftIdeal, liftIdeal_le_of_p_pow_mem,
mem_liftIdeal_zero_of_mem_one, exists_z_pow_mem_liftIdeal.
New/Lift/ExponentTheorems.lean 00f2467f84012fb67b4788ace502a70c5d4eedfc:
107--139 tame_types_exponent, called at
New/Selmer/OnePlaceDefect.lean 709e688740863f10dbbb284446ca20c0ba2a280a,
38--46 block_defect_le_at_place (tame case), thence previous audited
Ribet block budget. The separate crystalline branches use
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79.
No kernel graph available here; original graph edges above are SOURCE
edges only. No theorem dependencies deleted. Reduced human exposition
replaces the arithmetic descent and polynomial cancellation below;
retains native frame, tame form duality, letter projection, Frobenius,
Galois-depth derivative, cut pairing and chart-existence suppliers.
No URT: ordinary audit lane.

## 1. Extension polynomial, not merely the kernel polynomial

Fix the tame chart d, tame generator s, ramification index e, coefficient
root zeta_E of exact residue order e, letter i, and actual PairingSide S.
The extension has kernel Y and trivial quotient C. Over Bcris the
linearFrob A of the extension is compatible with both maps of the
exact sequence. Assume q is monic over Z_p, q(A_Y)=0, and put
Q(X)=q(X)(X-1). For every v, (A-1)v lies in the kernel (quotient action
is identity); applying q(A) kills it by intertwining with A_Y.
Thus Q(A)=0. This is exact, not a semisimplicity claim. In particular
Q(1)=0, which is needed again in the error correction in step 3.
Do NOT replace Q by q on the extension.

## 2. Set the correct common descent invariant

Write I_i = liftIdeal (p^(kappa+1)) 0 i, with actual approximate-lift
interpretation and a common correction t for all constants. Assume
jumps <= n, e <= p^m, n+kappa+2 < p, m(deg q+1)<=kappa.
The common minimal power lemma supplies nu with z^nu in I_i for ALL
letters, (p-1)nu <= e(n+kappa+1). Since n+kappa+1<p-1,
nu<e. The case e=1 gives nu=0 directly; m=0 also forces e=1.
The residue polynomial bar Q is nonzero because Q is monic.
Distinct elements bar zeta_E^j, 1<=j<e, are pairwise different.
Define R(t)=#{j: t<j<e, bar Q(bar zeta_E^j)=0}.
Maintain p^(m R(t)) z^t in I_i as t decreases from nu to 0.
Initially multiply the known z^nu by the indicated power of p.
No multiplication by a nonunit is inverted.

## 3. Two descent cases, with exact cancellation before the valuation

For t>0 let c=m R(t). If bar Q(bar zeta_E^t)=0 then
R(t-1)=R(t)+1. Frobenius sends the inductive multiplier to
p^c z^(pt) in the level-one ideal at sigma i, preserving the modulus.
The exact factorial descent of CokernelKillers gives the next
multiplier because

  v_p((pt)!)-v_p((p(t-1))!) = 1+v_p(t) <= m

(the interval contains exactly one multiple of p, namely pt, and
0<t<e<=p^m). This is an inequality with the necessary +1. The claim
v_p(t) alone pays for this step is false, even t=1.

If bar Q(bar zeta_E^t) != 0 then R(t-1)=R(t). Use the source's
exists_lift_of_mem_liftIdeal and chart scalar decomposition to write
the COMMON correction u=w+zv, w a Witt coefficient fixed by tame s.
For each constant C_i the lifted projection is
(p^c z^t - p^(kappa+1)(w+zv)) C_i. The source lemma
exists_z_smul_eq_sum_tameGen applied to Q(A)=0 says the operator
sum_j Q_j s^j sends this Kisin point to z times a point in the
integral Ainf frame. Project to the letter i (s fixes its coefficient
projector) and use s^j z=zeta_E^j z. After canceling the common z in
the localized Witt module, its projection is EXACTLY

 [p^c z^(t-1) Q(zeta_E^t)
  - p^(kappa+1) sum_j Q_j zeta_E^j s^j(v)] C_i.

The w term is zero because Q(1)=0, BEFORE division by z. The new
correction is independent of C_i; this is the native forall-c
condition, not a separate choice of correction per constant.
The source letterProj_mem_withExponents transports the integral frame
point to the standard exponent module. Q(zeta_E^t) is a unit because
its residue is nonzero. Multiplying by its inverse preserves the
ideal and gives p^c z^(t-1) in I_i. No extra p-cost.

The critical integral assertion used here is precisely source lines
43--61: in the Kisin frame the operator sum_j Q_j s^j vanishes modulo
z when Q(linearFrob)=0. It uses the retained frame theorem and
conjugate-form transport; the formal polynomial identity by itself
does NOT give this integral divisibility. Those hypotheses are not
removed by this note.

## 4. Finish the actual annihilator

At t=0, p^(m R(0)) lies in I_i. Root counting for nonzero bar Q gives
R(0)<=deg Q=deg q+1 (native sufficient estimate; no need to optimize).
Consequently m R(0)<=kappa. Multiply to p^kappa in I_i. Since
I_i=J_i+(p^(kappa+1)), p^kappa=b+p^(kappa+1)u for b in J_i.
The unit 1-pu is invertible in the p-adically complete ring; hence
p^kappa lies in J_i. This is KillsCokernel i kappa 0 at the SAME
letter and actual extension. It is the original native bound.
The approximate lift alone, without this final step, is insufficient.

## 5. Exact caller and remaining obligations

ExponentTheorems.tame_types_exponent uses the same tame chart for
both sides and the Tate-dual tensor side. Set kappa=r^2(N+1)^2.
The chart degree bound e<=p^(r^2) follows from the lcm of p^j-1
for 1<=j<=r; use m=r^2. The two sides have monic annihilators
degree <=N. The retained tensor polynomial supplier bounds degree
by the product of the two degrees (<=N^2), hence
r^2(deg q_tensor+1)<=r^2(N+1)^2. The native upper jump bounds and
b+6(W+eta)+kappa+2<p give n+kappa+2<p for each invocation.
The same three cokernel multipliers feed
scaledCupBounds_of_killsCokernel with final exponent
3*kappa+150*(eta+W+1). Do not replace this last exponent by kappa:
the actual cup comparison and third-side shifts remain necessary.
The OnePlaceDefect caller is the tame alternative, not a proof
of the small-prime sparse-thick or unramified two-size alternatives.

Independent check of integration's unramified K4--K8:
(p-1)a <= (p-2)q+1 implies a+v_p(a!)<=q by Legendre and integer
rounding, including a=0 and q=0. K7 uses A=max(a,m), not just a.
The same Nakayama argument applies. AGREE with this scalar argument
and common modulus discipline; coordinate and depth-step supplier
proofs are not independently replayed.

## 6. Actual executable regression, JS (run in tool isolate)

Copy the following block into Node or a JS runtime (replace final
text(...) with console.log(...)). This tests exact scalar arithmetic
and root counts in small prime fields; it is not a Kisin simulation or
native verification, and the field tests are not a proof for all
finite extensions. Counts from actual execution:

bounds 370486; factorial steps 122400; missing +1 detected 433
(count of steps exceeding m-1); polynomial cases 20230; root
evaluations 145813; q(1) nonzero cases 18520.
The last count exhibits cases in which using q instead of Q does not
supply the required correction cancellation. No physical model.

const primes=[2,3,5,7,11,13,17,19,23,29,31];
function vp(n,p){let v=0;while(n>0&&n%p===0){n/=p;v++}return v}
function vf(n,p){let v=0;while(n){n=Math.floor(n/p);v+=n}return v}
let bounds=0,steps=0,missingOne=0,rootCases=0,rootChecks=0,nonUnit=0;
for(const p of primes)for(let q=0;q<=300;q++)if(p>=5)
 for(let a=0;(p-1)*a<=(p-2)*q+1;a++){
  if(a+vf(a,p)>q)throw Error("unramified");bounds++}
for(const p of primes)for(let m=1;m<=4;m++)
 for(let n=1;n<Math.min(p**m,10000);n++){
  const diff=vf(p*n,p)-vf(p*(n-1),p);
  if(diff!==1+vp(n,p)||diff>m)throw Error("cost");
  steps++;if(diff>m-1)missingOne++}
function pow(a,n,p){let r=1;while(n--){r=r*a%p}return r}
for(const p of primes.slice(2))for(let e=1;e<p;e++)if((p-1)%e===0){
 let z=1;for(;z<p;z++)if(pow(z,e,p)===1&&
  Array.from({length:e-1},(_,k)=>k+1).every(k=>pow(z,k,p)!==1))break;
 for(let a=0;a<p;a++)for(let b=0;b<p;b++){
  let Q=x=>((x-a)*(x-b)*(x-1)%p+p)%p;let roots=0;
  for(let n=1;n<e;n++){let v=Q(pow(z,n,p));if(v===0)roots++;rootChecks++;}
  if(roots>3||Q(1)!==0)throw Error("root");
  rootCases++;if((1-a)*(1-b)%p!==0)nonUnit++}}
console.log({bounds,steps,missingOne,rootCases,rootChecks,nonUnit})

## 7. Verification boundary

Native lean/lake absent in sandbox. Compact original/reduced kernel
graphs remain unchanged; no pruning of opaque theorem references.
Prepared below: independent scalar bridge plus actual declaration
axiom probes. Run only on compact pin, not original 4.33.1 engines.
Existing state-branch targeted_results.json (blob
23de197bd48f404ca2074c69676de289c4f7934e) retrieved: earlier named
checks do not include this new certificate. Workflow 45803534769
wrapper conclusion success is not whole primitive batch success
(manuscript records JetExponentBound timeout); direct guessed status
path returned 404, no new CI PASS claimed. No protected workflow edits.

RESUME HERE: derive the actual sparse-thick cut walk in
scaledCupBounds_sparse_thick and the sign-dependent two-size cut
conditions, then independently verify the four safe-pair inequalities
in scaledCupBounds_of_cut_windows. Keep tame frame/cup inputs explicit.
HANDOFF TO: integration, mathematics, Galois, kernel extractor.
Verdict AGREE / PARTIAL: actual tame descent expanded; no complete C.
-/

namespace CompactAuditTameCokernel

theorem cost_budget (m roots degQ kappa : ℕ)
    (hroots : roots ≤ degQ) (hκ : m * degQ ≤ kappa) :
    m * roots ≤ kappa :=
  (Nat.mul_le_mul_left m hroots).trans hκ

theorem root_step_budget (m c d : ℕ) (hd : d ≤ m) :
    c + d ≤ c + m := by omega

#print axioms CompactAuditTameCokernel.cost_budget
#print axioms CompactAuditTameCokernel.root_step_budget
#check Lift.TameChart.aeval_linearFrob_extLattice_eq_zero
#print axioms Lift.TameChart.killsCokernel_of_isKilledBy
#print axioms Lift.tame_types_exponent
#print axioms block_defect_le_at_place

end CompactAuditTameCokernel
