import New.Selmer.CrystallineBound

/-!
# RUN57 — exact ramified and unramified lift-ideal recursion at C
26 Nov 2026. HUMAN SOURCE-MATCHED, conditional on explicitly retained
native integral suppliers; prepared Lean probes, not a new native PASS.
Attribution: Alpöge, Sernau, Anthropic collaborators and Claude.
Pin lsernau/grh-lean@72fead102f663d5c7a407964a13dc0cf9d977207,
grh-compact/src; Lean 4.35.0, Mathlib 56a005855ea17e0b0958f73ec801ae140b0a1679.
Mission blob 3ea3bdf5c928af39e24a6837eafa3dee9bd409bb; manuscript read
d185408f9b17703c84b1584444bfde1f65d57e74. Protocol, handoff, expansion,
AGENTS and continuity preflight read. Latest peer audit 90fa02c03b25495ccd8af6c2a1f63e251aaf4d83
and editor e7cdaea4a22ece6369e5370bf448d5b5d0c19dea already prove/integrate
the point-profile inequalities; integration cd6be32e28fdd8dddbe0fc66c77a0015cdba55c0
handles Ribet valuation. Do not duplicate them. Address the expressly
remaining ramified recursion from editor RUN57 and literature RUN56.

Sources (relative to compact src):
New/Lift/CokernelKillers.lean ba8a479cecd29393b86e3f320991c20baf108487,
62–203, actual bodies of all seven lift-ideal suppliers;
New/Lift/SparseThickLetters.lean c7ac57b4aca6855d8ed64542e0b247b221325395,
164–198 killsCokernel_at_cut and 199–252 its same-side consumer;
New/Lift/LongGap.lean a94786663aac435dfc1ec846046c87f00ddad141,
pointsOver_nonempty_of_killsCokernel, HasDeepPoint and long-gap consumers;
New/Selmer/CrystallineBound.lean 7b7ba1c2ac12f09651b5c1285109ff0435258e79,
crystalline_defect_le first two branches.

## 1. Integral lift ideals and exact divided derivative

Write I_l(i;r)=liftIdeal r l i, F=letterFrob, e0=chart ramification,
d=chart differentExp, and z=chart variable. Membership means ONE t
(independent of c) and, for every c, a standard-exponent level-l
lift of (f-r*t)constantAt_i(c). Do not use merely rational spanning.
The level-one transition is z^a p^c in I_0(i;r) iff
z^(pa) p^c in I_1(Fi;r). Multiplication by E^n takes I_0 to I_1
when all jumps on that letter are <=n. These are the exact native
phi_pow_mem_liftIdeal_iff and mul_E_pow_mem_liftIdeal_one; retain
their integral Frobenius and filtration proofs.

The source mem_liftIdeal_of_derivation uses the relation
tau*E*(s+beta*f)=alpha*(g f-f) (tau is the chart's zTau).
For an integral level-one lift x of (f-r*t)c_i, let
v=(g t-t)/(tau*E). The source's integral retraction and Hodge
division prove the divided difference has the requisite level-one
standard profile. Then the projection of
  alpha*(g x-x)/(tau*E)-beta*x
is exactly (s-r*(alpha*v-beta*t))*c_i, since g fixes c_i and r.
This is an equality after multiplying by the native normalized
units and cancelling; no assumption that tau*E is a unit.
The common new correction is alpha*v-beta*t, independent of c.
Thus the exact membership in I_1(i;r) follows. Retain the native
exists_lift_of_mem_liftIdeal, coordinate retract, Hodge filtration
and integral divided-difference suppliers, not a new axiom.

For z-power descent the native chart difference identity for
z^j pays v_p(j) per derivative (the j=0 case is not differentiated).
Iterate from j=n down to pa. The sum is
v_p(n!)-v_p((pa)!), so p^c z^n in I_1(Fi;r) implies p^k z^a
in I_0(i;r) if pa<=n and c+v_p(n!)<=k+v_p((pa)!).
This is mem_liftIdeal_zero_of_mem_one, including the final
Frobenius transport and any extra multiplication by p.
For E-power descent, exists_depth_step and the same divided
derivative turn p^c z^a E^j into p^(c+d+v_p(j)) z^(a+1) E^(j-1).
Sum before bounding: total cost d*n+v_p(n!), z increment n.
Extra powers of p and z are allowed by ideal membership. This is
mem_liftIdeal_of_mul_E_pow. The chart identities and integral
division are retained, rather than replaced by scalar congruences.

## 2. Minimal common z-power, including ramification

For a common jump upper bound n and modulus r=p^k, the source
frame/radical argument gives some z-power in every I_0(i;r).
Use the native radical membership of z from the ideal (p,tau)
and the frame lift of tau*c_i; p^k is in all the ideals.
Let a be the least such exponent, common across all letters.
At every letter F i the previous multiplication step gives
z^a E^n in I_1(Fi;r). In the chart E=z^e0*unit+p, expansion
of (E-p)^(n+k) puts z^(e0(n+k)) in (E^n,p^k): in each term
either the E exponent is >=n or the p exponent is >=k.
Hence z^(a+e0(n+k)) in I_1(Fi;r), since p^k is already there.
Set N=a+e0(n+k), q=floor(N/p). No multiple of p occurs in
(pq,N], so v_p(N!)=v_p((pq)!). The descent in section 1 with
zero additional p-cost gives z^q in I_0(i;r) for every i.
Minimality yields a<=q and therefore
  (p-1)*a <= e0*(n+k).
This reconstructs exists_z_pow_mem_liftIdeal with a common a,
rather than separately choosing incompatible exponents.
Retain the integral frame/radical and chart-unit premises.

## 3. Actual ramified cut caller and terminal budget

In SparseThickLetters.killsCokernel_at_cut keep all source guards:
p prime, hX:(J+1+d+log_p(2b))*n+d*G<=X,
hκ:12(J+1)X<κ, hδ:e0*2b<=p^(J+1)X,
h8:8e0<=p^(J+1), hy:G<=(p-1)n, hs:β+s+W<=2b
and the jump upper-bound callback w. At a cut in the first hK
branch s_i=0 and the next J forward letters have jumps <=G.
Use I_l at the FIXED modulus r=p^(κ+1) throughout.
The common seed from section 2 for bound 2b satisfies
(p-1)a<=e0(2b+κ+1) and z^a in I_0 at all letters.

For any x with a<=p^J*x, prove by induction the exact invariant
  p^(J X) z^(x+n) in I_0(i;r).
Base J=0: x>=a, use ideal multiplication. Step J>0:
apply induction at F i with J-1 and argument p*x; the next
J-1 forward bounds are inherited, and a<=p^(J-1)*p*x.
This yields p^((J-1)X) z^(p*x+n) in I_0(Fi;r).
At Fi all jumps <=G, so multiply by E^G and pass to I_1(Fi;r).
The E-descent costs dG+v_p(G!) <= dG+n <= X:
Legendre gives v_p(G!)<=G/(p-1)<=n. The resulting z exponent
p*x+n+G<=p*(x+n). Increase both exponents if necessary, then
Frobenius pullback produces the invariant. No factor for the
number of letters, no rank dependence, and no change of modulus.

Choose x=2X+floor(κ/4)+1. From hδ,h8 and p/(p-1)<=2,
  a <= p^J*(2X+(κ+1)/4) <= p^J*x.
The second inequality uses the exact floor, κ>=0.
Let m=x+n>0. Push the invariant to I_1(Fi;r), giving
p^(JX) z^(pm). The descent of section 1 with target a=0
gives p^κ in I_0(i;r) because
  JX+v_p((pm)!) <= JX+2m-1
    <= (J+6)X+2floor(κ/4)+1 <= κ.
Here v_p((pm)!)=m+v_p(m!), v_p(m!)<=m-1 for m>0,
n<=X, and κ>=12(J+1)X+1 imply
κ-2floor(κ/4)>=ceil(κ/2)>=6(J+1)X+1 >= (J+6)X+1.
This holds also J=0 and X=0, not just asymptotically.
The native Nakayama step removes the auxiliary modulus:
p^κ in I_0(i;p^(κ+1)) means p^κ(1-p*t) in I_0(i;0)
for some t. Since p lies in the Jacobson radical, 1-p*t
is a unit. Thus p^κ lies in I_0(i;0), and more generally
I_0(i;p^(κ+1))=I_0(i;0). As s_i=0 this is exactly
KillsCokernel i κ s_i, not merely a modulo-p statement.

## 4. Unramified second branch with exact binomial payment

For the native killsCokernel_of_isUnramified(s,t), let A=s+t.
Keep e0=1, p>=5 and all jumps <=(p-3)A, plus the actual
unramified E=z+p identity. The seed at modulus p^(A+1)
has exponent B with (p-1)B <= (p-2)A+1.
If B>0, Legendre gives (p-1)v_p(B!)<=B-1; consequently
  (p-2)(B+v_p(B!)) <= (p-1)B-1 <= (p-2)A.
The same bound B+v_p(B!)<=A is trivial for B=0.
For every 0<=m<=A, multiply z^B by enough z to reach
z^max(B,m), push Frobenius, and descend to z^m. The exact
factorial cost is zero if m>=B; otherwise it is
 B+v_p(B!)-m-v_p(m!) <= A-m.
Thus p^(A-m)z^m belongs to I_0(i;p^(A+1)) for EVERY m in the
binomial expansion of p^s(z+p)^t (m<=t<=A). Coefficients
binomial(t,m) are integral; the ideal absorbs them. The m=0
case supplies the Nakayama step at A, so the entire expansion
belongs to I_0(i;0). This is exactly KillsCokernel i s t.
In the second cut branch apply it with s=κ,t=s_i:
the retained hK gives unramified p>=5 and s0<=κ+s_i,
hz gives β+W<=(p-3)s0, and w supplies the bound on all jumps.
No independent per-binomial-term lattice choice in the result.

## 5. Actual consumer / remaining primitive ledger
Both hK branches now have the full human arithmetic recursion
of killsCokernel_at_cut. Their exact output p^κ E^(s_i) in
I_0(i;0) goes into pointsOver_nonempty_of_killsCokernel on
the SAME sides and cuts chosen in scaledCupBounds_of_cut_windows.
That supplies the initial point and depth (not the final safety
profile). Use peer 90fa02c0 for the HasDeepPoint comparisons
and RUN56 for long-gap coefficient extraction, with its retained
integral frame inputs. The third-side application uses its own
native jump-bound callback and the same cut guard. Do not infer
a new global row bound or whole C from this local chain.
Original graph: crystalline_defect_le -> sparse/two_sizes ->
cut_windows -> killsCokernel_at_cut -> seed, two descents,
Frobenius transport, ideal multiplication, Nakayama.
Reduced human graph: common seed minimum + explicit induction
and binomial sum -> same caller; retained integral frame,
coordinate retraction, chart identities, Hodge divided difference
and filtration/Frobenius lemmas. No native nodes retired;
other primitive row, reciprocity and defect obligations unchanged.
Cache context: S, chart, p,e0,d,i,side,r,J,actual forward jump
bounds,n,G,X,κ; never reuse across coefficient rings or moduli.
Standard mathematical inputs are Legendre's factorial formula
(proved by counting multiples of p^j) and elementary ideal
arithmetic/Jacobson unit criterion. The integral frame and
derivation are actual native theorem bodies, not literature
axioms or automatically supplied by the small-weight BK results
audited in RUN56. No new external hypothesis or claimed RH import.

## 6. Reproducible arithmetic diagnostics (executed JS)
function vpFact(p,n){let v=0;while(n){n=Math.floor(n/p);v+=n;}return v}
let ramp=0,rec=0,unram=0,minim=0;
for(let p of [2,3,5,7,11,17])for(let J=0;J<=4;J++)
for(let X=0;X<=24;X++)for(let n=0;n<=X;n++)
for(let k of [12*(J+1)*X+1,12*(J+1)*X+2,12*(J+1)*X+13,24*(J+1)*X+7]){
let x=2*X+Math.floor(k/4)+1,m=x+n;
if(J*X+vpFact(p,p*m)>k)throw Error("terminal");ramp++;}
for(let p of [2,3,5,7,11,17])for(let n=0;n<=30;n++)
for(let G=0;G<=(p-1)*n;G++)for(let d=0;d<=4;d++){
let X=n+d*G;if(d*G+vpFact(p,G)>X||n+G>p*n)throw Error("step");rec++}
for(let p of [5,7,11,17,23])for(let A=0;A<=150;A++){
let B=Math.floor(((p-2)*A+1)/(p-1));
if(B+vpFact(p,B)>A)throw Error("cap");
for(let m=0;m<=A;m++){
if(vpFact(p,p*Math.max(B,m))-vpFact(p,p*m)>A-m)throw Error("unram");
unram++}}
for(let p of [2,3,5,7,11,17])for(let N=0;N<=10000;N++){
if(vpFact(p,N)!==vpFact(p,p*Math.floor(N/p)))throw Error("minimal");minim++}
Actual exact safe-integer counts: ramp=39000, rec=91605,
unram=57380, minim=60006, total=247991, zero failures.
These check scalar payments only, not integral module claims.

Actual state-branch CI retrieved again: run 45803534769,
compute/rh-compact-primitives-replay-20261126/status.json
a56e2d3afb99ed8275e81fd63c8494306e57c43f and
outputs/targeted_results.json 088cd2ec0e935ee1a282f10096949bcf671cc804.
Six earlier B/C named probes report standard axioms; module_1
timed out (124, 2700.11s), all_requested_checks_ok=false.
No current local lean/lake on PATH; no native replay of this
file. No use of old-pin engines on compact source, no competing
runner, no protected workflow change. Prepared scalar certificate
and actual theorem probes below; independent audit pending.

RESUME HERE: integrate sections 1–4 at the existing C cut
caller, then audit the native integral primitive
exists_lift_of_mem_liftIdeal / mem_liftIdeal_of_derivation,
especially the common correction and normalized-unit division.
Expand the exact frame and Hodge filtration suppliers, not
the already sufficient scalar bound. Use shared compact
runner to check these named bodies and scalar certificate.
HANDOFF TO integration/editor, C mathematics, audit, kernel.
-/

namespace LiteratureLiftIdealRun57

theorem terminal_payment (J X n k q m v : ℕ)
    (hn : n ≤ X) (hk : 12*(J+1)*X < k)
    (hq : 4*q ≤ k) (hm : m = 2*X+q+1+n)
    (hv : v < 2*m) : J*X+v ≤ k := by
  nlinarith [Nat.zero_le (J*X)]

theorem descent_payment (d G n X v : ℕ)
    (h : n+d*G ≤ X) (hv : v ≤ n) : d*G+v ≤ X := by
  omega

end LiteratureLiftIdealRun57

#check Lift.KummerChart.PairingSide.mem_liftIdeal_of_derivation
#check Lift.KummerChart.PairingSide.mem_liftIdeal_zero_of_mem_one
#check Lift.KummerChart.PairingSide.mem_liftIdeal_of_mul_E_pow
#check Lift.KummerChart.PairingSide.exists_z_pow_mem_liftIdeal
#check Lift.KummerChart.PairingSide.killsCokernel_of_isUnramified
#check Lift.KummerChart.PairingSide.killsCokernel_at_cut
#print axioms Lift.KummerChart.PairingSide.mem_liftIdeal_of_derivation
#print axioms Lift.KummerChart.PairingSide.exists_z_pow_mem_liftIdeal
#print axioms Lift.KummerChart.PairingSide.killsCokernel_at_cut
#print axioms LiteratureLiftIdealRun57.terminal_payment
#print axioms LiteratureLiftIdealRun57.descent_payment
